

% This file modified from various Lilypond files:
%
% display-woodwind-diagrams.scm (part of Lilypond)and 
% define-woodwind-diagrams.scm
% lily-library.scm
% bezier-tools.scm

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% bezier utilities

#(define (coord+ coord1 coord2)
  "Add @var{coord1} to @var{coord2}, returning a coordinate."
  (cons (+ (car coord1) (car coord2))
        (+ (cdr coord1) (cdr coord2))))

#(define (coord- coord1 coord2)
  "Subtract @var{coord2} from @var{coord1}."
  (cons (- (car coord1) (car coord2))
        (- (cdr coord1) (cdr coord2))))

#(define (coord* scalar coord)
  "Multiply each component of @var{coord} by @var{scalar}."
  (cons (* (car coord) scalar)
        (* (cdr coord) scalar)))

#(define (interpolated-control-points control-points split-value)
  "Interpolate @var{control-points} at @var{split-value}.  Return a
set of control points that is one degree less than @var{control-points}."
  (if (null? (cdr control-points))
      '()
      (let ((first (car control-points))
            (second (cadr control-points)))
        (cons* (coord+ first (coord* split-value (coord- second first)))
               (interpolated-control-points
                (cdr control-points)
                split-value)))))

#(define (split-bezier bezier split-value)
  "Split a cubic bezier defined by @var{bezier} at the value
@var{split-value}.  @var{bezier} is a list of pairs; each pair is
is the coordinates of a control point.  Returns a list of beziers.
The first element is the LHS spline; the second
element is the RHS spline."
  (let* ((quad-points (interpolated-control-points
                       bezier
                       split-value))
         (lin-points (interpolated-control-points
                      quad-points
                      split-value))
         (const-point (interpolated-control-points
                       lin-points
                       split-value))
         (left-side (list (car bezier)
                          (car quad-points)
                          (car lin-points)
                          (car const-point)))
         (right-side (list (car const-point)
                           (list-ref lin-points 1)
                           (list-ref quad-points 2)
                           (list-ref bezier 3))))
    (cons left-side right-side)))

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% definitions

#(define HOLE-FILL-LIST '((R . 3) (1q . 5) (1h . 7) (3q . 11) (F . 13)))

% Utility functions

#(define-public (symbol-concatenate . names)
  "Like @code{string-concatenate}, but for symbols."
  (string->symbol (string-concatenate (map symbol->string names))))

#(define-public (function-chain arg function-list)
  "Applies a list of functions in @var{function-list} to @var{arg}.
Each element of @var{function-list} is structured @code{(cons function
'(arg2 arg3 ...))}.  If function takes arguments besides @var{arg}, they
are provided in @var{function-list}.

Example: Executing @samp{(function-chain 1 `((,+ 1) (,- 2) (,+ 3) (,/)))}
returns @samp{1/3}."
  (fold
   (lambda (fun arg) (apply (car fun) arg (cdr fun)))
   arg
   function-list))

#(define (assoc-keys alist)
  "Gets the keys of an alist."
  (map car alist))

#(define (assoc-values alist)
  "Gets the values of an alist."
  (map cdr alist))

#(define (get-slope-offset p1 p2)
  "Gets the slope and offset for p1 and p2.
   For example:
   @code{(get-slope-offset '(1 . 2) '(3 . -5.1))}
   @code{(-3.55 . 5.55)}"
  (let*
      ((slope (/ (- (cdr p1) (cdr p2)) (- (car p1) (car p2))))
       (offset (- (cdr p1) (* slope (car p1)))))
    `(,slope . ,offset)))

#(define (is-square? x input-list)
  "Returns true if x is the square of a value in input-list."
  (pair? (memv (inexact->exact (sqrt x)) input-list)))

#(define (true-entry? input-list)
  "Is there a true entry in @code{input-list}?"
  (any identity input-list))

#(define (entry-greater-than-x? input-list x)
  "Is there an entry greater than @code{x} in @code{input-list}?"
  (member x input-list <))

#(define (n-true-entries input-list)
  "Returns number of true entries in @code{input-list}."
  (count identity input-list))

#(define (bezier-head-for-stencil bezier cut-point)
  "Prepares a split-bezier to be used in a connected path stencil."
  (list-tail (flatten-list (car (split-bezier bezier cut-point))) 2))

% Translators for keys

% Translates a "normal" key (open, closed, trill)
#(define (key-fill-translate fill)
  (cond
   ((= fill 1) #f)
   ((= fill 2) #f)
   ((= fill (expt (assoc-get 'F HOLE-FILL-LIST) 2)) 0.5)
   ((= fill (assoc-get 'F HOLE-FILL-LIST)) #t)))

% Similar to above, but trans vs opaque doesn't matter
#(define (text-fill-translate fill)
  (cond
   ((< fill 3) 1.0)
   ((= fill (expt (assoc-get 'F HOLE-FILL-LIST) 2)) 0.5)
   ((= fill (assoc-get 'F HOLE-FILL-LIST)) 0.0)))

% Emits a list for the central-column-hole maker
% (not-full?, 1-quarter-full?, 1-half-full?, 3-quarters-full?, full?)
% Multiple values, such as (#t #f #f #t #f), mean a trill between
% not-full and 3-quarters-full
#(define (process-fill-value fill)
  (let* ((avals (list-tail (assoc-values HOLE-FILL-LIST) 1)))
    (append `(,(or (< fill 3) (is-square? fill avals)))
            (map (lambda (x) (= 0 (remainder fill x))) avals))))

% Color a stencil gray
#(define (gray-colorize stencil)
  (apply ly:stencil-in-color stencil (x11-color 'grey)))

% A connected path stencil that is surrounded by proc
#(define (rich-path-stencil ls x-stretch y-stretch proc)
  (lambda (radius thick fill pressed layout props)
    (let*
        ((fill-translate (key-fill-translate fill))
         (gray? (eqv? fill-translate 0.5)))
      (ly:stencil-add
       ((if gray? gray-colorize identity)
        (proc
         (make-connected-path-stencil
          ls
          thick
          (* x-stretch radius)
          (* y-stretch radius)
          #f
          (if gray? #t fill-translate))))
       (if (not gray?)
           empty-stencil
           ((rich-path-stencil ls x-stretch y-stretch proc)
            radius
            thick
            1
            layout
            props))))))

% A connected path stencil without a surrounding proc
#(define (standard-path-stencil ls x-stretch y-stretch)
  (rich-path-stencil ls x-stretch y-stretch identity))

% An ellipse stencil that is surrounded by a proc
#(define (rich-pe-stencil x-stretch y-stretch start end proc)
  (lambda (radius thick fill layout props)
    (let*
        ((fill-translate (key-fill-translate fill))
         (gray? (eqv? fill-translate 0.5)))
      (ly:stencil-add
       ((if gray? gray-colorize identity)
        (proc
         (make-partial-ellipse-stencil
          (* x-stretch radius)
          (* y-stretch radius)
          start
          end
          thick
          #t
          (if gray? #t fill-translate))))
       (if (not gray?)
           empty-stencil
           ((rich-pe-stencil x-stretch y-stretch start end proc)
            radius
            thick
            1
            layout
            props))))))

#(define (rich-e-stencil x-stretch y-stretch proc)
  (lambda (radius thick fill layout props)
    (let*
        ((fill-translate (key-fill-translate fill))
         (gray? (eqv? fill-translate 0.5)))
      (ly:stencil-add
       ((if gray? gray-colorize identity)
        (proc
         (make-ellipse-stencil
          (* x-stretch radius)
          (* y-stretch radius)
          thick
          (if gray? #t fill-translate))))
       (if (not gray?)
           empty-stencil
           ((rich-e-stencil x-stretch y-stretch proc)
            radius
            thick
            1
            layout
            props))))))

% An ellipse stencil without a surrounding proc
#(define (standard-e-stencil x-stretch y-stretch)
  (rich-e-stencil x-stretch y-stretch identity))

% Translates all possible representations of symbol.
% If simple? then the only representations are open, closed, and trill.
% Otherwise, there can be various levels of "closure" on the holes
% ring? allows for a ring around the holes as well
#(define (make-symbol-alist symbol simple? ring?)
  (delete `(,(symbol-concatenate symbol 'T 'F) .
            ,(expt (assoc-get 'F HOLE-FILL-LIST) 2))
          `((,symbol . ,(assoc-get 'F HOLE-FILL-LIST))
            (,(symbol-concatenate symbol 'T) .
             ,(expt (assoc-get 'F HOLE-FILL-LIST) 2))
            ,@(if simple?
                  '()
                  (append-map
                   (lambda (x)
                     `((,(symbol-concatenate symbol (car x) 'T)
                        . ,(expt (cdr x) 2))
                       (,(symbol-concatenate symbol 'T (car x))
                        . ,(* (cdr x) (assoc-get 'F HOLE-FILL-LIST)))
                       (,(symbol-concatenate symbol (car x))
                        . ,(cdr x))
                       ,@(append-map
                          (lambda (y)
                            (map (lambda (a b)
                                   `(,(symbol-concatenate symbol
                                                          (car a)
                                                          'T
                                                          (car b))
                                     . ,(* (cdr a) (cdr b))))
                                 `(,x ,y) `(,y ,x)))
                          (cdr (member x HOLE-FILL-LIST)))))
                   (if ring? HOLE-FILL-LIST (cdr HOLE-FILL-LIST)))))))

% Commands for text layout

% Draws a circle around markup if (= trigger 0.5)
#(define-markup-command
  (conditional-circle-markup layout props trigger in-markup)
  (number? markup?)
  (interpret-markup layout props
                    (if (eqv? trigger 0.5)
                        (make-circle-markup in-markup)
                        in-markup)))

% Makes a list of named-keys
#(define (make-name-keylist input-list key-list font-size)
  (map (lambda (x y)
         (if (< x 1)
             (make-conditional-circle-markup-markup
              x
              (make-concat-markup
               (list
                (make-abs-fontsize-markup font-size (car y))
                (if (and (< x 1) (cdr y))
                    (make-abs-fontsize-markup
                     font-size
                     (make-raise-markup
                      1
                      (make-fontsize-markup
                       -2
                       (if (eqv? (cdr y) 1)
                           (make-sharp-markup)
                           (if (eqv? (cdr y) 2)
                               (make-natural-markup)
                               (make-flat-markup))))))
                    (make-null-markup)))))
             (make-null-markup)))
       input-list key-list))

% Makes a list of number-keys
#(define (make-number-keylist input-list key-list font-size)
  (map (lambda (x y)
         (if (< x 1)
             (make-conditional-circle-markup-markup
              x
              (make-abs-fontsize-markup font-size (make-number-markup y)))
             (make-null-markup)))
       input-list
       key-list))

% Creates a named-key list with a certain alignment
#(define (aligned-text-stencil-function dir hv)
  (lambda (key-name-list radius fill-list layout props)
    (interpret-markup
     layout
     props
     (make-general-align-markup
      X
      dir
      ((if hv make-concat-markup make-center-column-markup)
       (make-name-keylist
        (map text-fill-translate fill-list)
        key-name-list
        (* 12 radius)))))))

#(define number-column-stencil
  (lambda (key-name-list radius fill-list layout props)
    (interpret-markup
     layout
     props
     (make-general-align-markup
      Y
      CENTER
      (make-general-align-markup
       X
       RIGHT
       (make-override-markup
        '(baseline-skip . 0)
        (make-column-markup
         (make-number-keylist
          (map text-fill-translate fill-list)
          key-name-list
          (* radius 8)))))))))

% Utility function for the left-hand keys
#(define lh-woodwind-text-stencil
  (aligned-text-stencil-function LEFT #t))

% Utility function for the right-hand keys
#(define rh-woodwind-text-stencil
  (aligned-text-stencil-function RIGHT #t))

#(define octave-woodwind-text-stencil
  (aligned-text-stencil-function CENTER #f))

#(define octave-oboe-text-stencil
  (aligned-text-stencil-function CENTER #t))

% Draw rules

#(define (rich-group-draw-rule alist target-part change-part)
  (if
   (entry-greater-than-x?
    (map (lambda (key) (assoc-get key alist)) target-part) 3)
   (map-selected-alist-keys (lambda (x) (if (= x 0) 1 x)) change-part alist)
   alist))

#(define (group-draw-rule alist target-part)
  (rich-group-draw-rule alist target-part target-part))

#(define (group-automate-rule alist change-part)
  (map-selected-alist-keys (lambda (x) (if (= x 0) 1 x)) change-part alist))

#(define (apply-group-draw-rule-series alist target-part-list)
  (if (null? target-part-list)
      alist
      (apply-group-draw-rule-series
       (group-draw-rule alist (car target-part-list))
       (cdr target-part-list))))

% Extra-offset rules

#(define (rich-group-extra-offset-rule alist target-part change-part eos)
  (if
   (entry-greater-than-x?
    (map (lambda (key) (assoc-get key alist)) target-part) 0)
   (map-selected-alist-keys (lambda (x) eos) change-part alist)
   alist))

#(define (group-extra-offset-rule alist target-part eos)
  (rich-group-extra-offset-rule alist target-part target-part eos))

#(define (uniform-extra-offset-rule alist eos)
  (map-selected-alist-keys
   (lambda (x) (if (pair? x) x eos))
   (assoc-keys alist)
   alist))

% General drawing commands

% Used all the time for a dividing line
#(define (midline-stencil radius thick fill pressed layout props)
  (if pressed empty-stencil (make-line-stencil (* thick 2) (* -0.80 radius) 0 (* 0.80 radius) 0)))

#(define (long-midline-stencil radius thick fill pressed layout props)
  (if pressed empty-stencil (make-line-stencil (* thick 2) (* -5.75 radius) 0 (* 0.75 radius) 0)))

% Used all the time for a small, between-hole key
#(define little-elliptical-key-stencil (standard-e-stencil 0.75 0.2))

% Used for several upper keys in the clarinet and sax
#(define (upper-key-stencil tailw tailh bodyw bodyh)
  (let*
      ((xmove (lambda (x) (+ tailw (+ 0.2 (* bodyw (- x 0.2))))))
       (ymove (lambda (x) (+ (- tailh) (+ -0.05 (* bodyh (+ x 0.05)))))))
    (standard-path-stencil
     `((,(xmove 0.7)
        ,(ymove -0.2)
        ,(xmove 1.0)
        ,(ymove -1.0)
        ,(xmove 0.5)
        ,(ymove -1.0))
       (,(xmove 0.2)
        ,(ymove -1.0)
        ,(xmove 0.2)
        ,(ymove -0.2)
        ,(xmove 0.3)
        ,(ymove -0.1))
       (,(+ 0.2 tailw)
        ,(- -0.05 tailh)
        ,(+ 0.1 (/ tailw 2))
        ,(- -0.025 (/ tailh 2))
        0.0
        0.0))
     1.0
     1.0)))

% Utility function for the column-hole maker.
% Returns the left and right degrees for the drawing of a given
% fill level (1-quarter, 1-half, etc...)
#(define (degree-first-true fill-list left? reverse?)
  (define (dfl-crawler fill-list os-list left?)
    (if (car fill-list)
        ((if left? car cdr) (car os-list))
        (dfl-crawler (cdr fill-list) (cdr os-list) left?)))
  (dfl-crawler
   ((if reverse? reverse identity) fill-list)
   ((if reverse? reverse identity)
    '((0 . 0) (215 . 325) (180 . 0) (145 . 35) (90 . 90)))
   left?))

% Gets the position of the first (or last if reverse?) element of a list.
#(define (position-true-endpoint in-list reverse?)
  (define (pte-crawler in-list n)
    (if (car in-list)
        n
        (pte-crawler (cdr in-list) (+ n 1))))
  ((if reverse? - +)
   (if reverse? (length in-list) 0)
   (pte-crawler ((if reverse? reverse identity) in-list) 0)))

% Huge, kind-of-ugly maker of a circle in a column.
% I think this is the clearest way to write it, though...

#(define (column-circle-stencil radius thick fill pressed layout props)
  (let* ((fill-list (process-fill-value fill)))
    (cond
     ((and
       (list-ref fill-list 0)
       (not (true-entry? (list-tail fill-list 1)))) ; is it empty?
      (if pressed empty-stencil ((standard-e-stencil 1.0 1.0) radius thick fill layout props)))
     ((and
       (list-ref fill-list 4)
       (not (true-entry? (list-head fill-list 4)))) ; is it full?
      ((standard-e-stencil 1.0 1.0) radius thick fill layout props))
     ((and
       (list-ref fill-list 0)
       (list-ref fill-list 4)) ; is it a trill between empty and full?
      ((standard-e-stencil 1.0 1.0) radius thick fill layout props))
     (else  ;If none of these, it is partially full.
      (ly:stencil-add
       ((rich-pe-stencil 1.0 1.0 0 360 identity)
        radius
        thick
        (if (list-ref fill-list 4)
            (expt (assoc-get 'F HOLE-FILL-LIST) 2)
            1)
        layout
        props)
       ((rich-pe-stencil
         1.0
         1.0
         (+ (degree-first-true fill-list #t #t) 90)
         (+ (degree-first-true fill-list #f #t) 90)
         identity)
        radius
        thick
        (if
         (> (n-true-entries fill-list) 1) ; trill?
         (expt (assoc-get 'F HOLE-FILL-LIST) 2)
         (assoc-get 'F HOLE-FILL-LIST))
        layout
        props)
       (if
        (= 2 (n-true-entries (list-tail fill-list 1))) ; trill?
        ((rich-pe-stencil
          1.0
          1.0
          (+ (degree-first-true fill-list #t #f) 90)
          (+ (degree-first-true fill-list #f #f) 90)
          identity)
         radius
         thick
         (assoc-get 'F HOLE-FILL-LIST)
         layout
         props)
        empty-stencil))))))

#(define (variable-column-circle-stencil scaler)
  (lambda (radius thick fill pressed layout props)
    (column-circle-stencil (* radius scaler) thick fill pressed layout props)))

% A stencil for ring-column circles that combines two of the above
#(define (ring-column-circle-stencil radius thick fill pressed layout props)
  (if (= 0 (remainder fill (assoc-get 'R HOLE-FILL-LIST)))
      (ly:stencil-add
       ((if
         (= fill (expt (assoc-get 'R HOLE-FILL-LIST) 2))
         gray-colorize
         identity)
        ((standard-e-stencil
          (* (+ (- 1.0 (* 2 thick)) (/ thick 2)))
          (* (+ (- 1.0 (* 2 thick)) (/ thick 2))))
         radius
         (* (* 4 radius) thick)
         1
         layout
         props))
       ((standard-e-stencil 1.0 1.0) radius thick 1 layout props)
       (column-circle-stencil
        (+ (* (- 1.0 (* 4 thick)) radius) (/ thick 2))
        thick
        (if (= 0 (remainder fill (assoc-get 'F HOLE-FILL-LIST)))
            (expt (assoc-get 'F HOLE-FILL-LIST) 2)
            (if (= fill (expt (assoc-get 'R HOLE-FILL-LIST) 2))
             1
             (expt (/ fill (assoc-get 'R HOLE-FILL-LIST)) 2)))
		pressed
        layout
        props))
      (column-circle-stencil radius thick fill pressed layout props)))

% Shared oboe/clarinet stencils

#(define (oboe-lh-gis-lh-low-b-key-stencil gis?)
  (let*
      ((x 1.2)
       (y 0.4)
       (scaling-factor 1.7)
       (up-part
        (car
         (split-bezier
          `((0.0 . 0.0) (0.0 . ,y) (,x . ,y) (,x . 0.0))
          0.8)))
       (down-part
        (cdr
         (split-bezier
          `((,x . 0.0) (,x . ,(- y)) (0.0 . ,(- y)) (0.0 . 0.0))
          0.2))))
    (if gis?
        (standard-path-stencil
         (append
          (append
           `((0.25 ,(/ y -2) 0.75 ,(/ y -2) 1.0 0.0))
           (map (lambda (l)
                  (flatten-list
                   (map (lambda (x)
                          (coord-translate
                           (coord-rotated x (cons y (* 2 0.25)))
                           '(1.0 . 0)))
                        l)))
                `(((0 . ,y) (,x . ,y) (,x . 0))
                  ((,x . ,(- y)) (0 . ,(- y)) (0 . 0)))))
          `((0.75 ,(/ y -2) 0.25 ,(/ y -2) 0.0 0.0)))
         scaling-factor
         scaling-factor)
        (standard-path-stencil
         (map (lambda (l)
                (flatten-list
                 (map (lambda (x)
                        (coord-rotated x (cons y (* 2 0.25))))
                      l)))
              `(,(list-tail up-part 1)
                ,(list-head down-part 1)
                ,(list-tail down-part 1)))
         (- scaling-factor)
         (- scaling-factor)))))

#(define oboe-lh-gis-key-stencil (oboe-lh-gis-lh-low-b-key-stencil #t))

#(define oboe-lh-low-b-key-stencil (oboe-lh-gis-lh-low-b-key-stencil #f))

#(define (oboe-lh-ees-lh-bes-key-stencil ees?)
  (standard-path-stencil
   `((0 1.5)
     (0 1.625 -0.125 1.75 -0.25 1.75)
     (-0.5 1.75 -0.5 0.816 -0.25 0.5)
     (0 0.25 0 0.125 0 0)
     (0 ,(if ees? -0.6 -0.3)))
   (* (if ees? -1.0 1.0) -1.8)
   1.8))

#(define oboe-lh-ees-key-stencil (oboe-lh-ees-lh-bes-key-stencil #t))

#(define oboe-lh-bes-key-stencil (oboe-lh-ees-lh-bes-key-stencil #f))

% Oboe family stencils

#(define (oboe-lh-octave-key-stencil long?)
  (let* ((h (if long? 1.4 1.2)))
    (standard-path-stencil
     `((-0.4 0 -0.4 1.0 -0.1 1.0)
       (-0.1 ,h)
       (0.1 ,h)
       (0.1 1.0)
       (0.4 1.0 0.4 0 0 0))
     2.0
     2.0)))

#(define oboe-lh-II-key-textual-stencil
(standard-path-stencil
  `((0 -0.05)
    (0 0)
    (3.0 0)
    (3.0 -2.5)
    (2.9 -2.5)
    (2.9 -0.1)
    (0.0 -0.1)
    (0 -0.05))
 1.0
 1.0))

#(define oboe-lh-I-key-stencil (oboe-lh-octave-key-stencil #f))

#(define oboe-lh-II-key-stencil (oboe-lh-octave-key-stencil #f))

#(define oboe-lh-III-key-stencil (oboe-lh-octave-key-stencil #t))

#(define oboe-lh-b-key-stencil (standard-e-stencil 0.6 0.8))

#(define oboe-lh-d-key-stencil little-elliptical-key-stencil)

#(define oboe-lh-cis-key-stencil little-elliptical-key-stencil)

#(define oboe-lh-f-key-stencil (standard-e-stencil 0.5 1.0))

#(define oboe-rh-a-key-stencil (standard-e-stencil 1.0 0.45))

#(define oboe-rh-gis-key-stencil (standard-e-stencil 0.45 1.2))

#(define oboe-rh-d-key-stencil little-elliptical-key-stencil)

#(define oboe-rh-f-key-stencil little-elliptical-key-stencil)

#(define (oboe-rh-c-rh-ees-key-stencil c?)
  (rich-path-stencil
   '((1.0 0.0 1.0 0.70 1.5 0.70)
     (2.25 0.70 2.25 -0.4 1.5 -0.4)
     (1.0 -0.4 1.0 0 0 0)
     (-0.15 0))
   2.0
   1.4
   (lambda (stencil) (ly:stencil-rotate stencil (if c? 170 180) 0 0))))

#(define oboe-rh-banana-key-stencil oboe-rh-gis-key-stencil)

#(define oboe-rh-c-key-stencil (oboe-rh-c-rh-ees-key-stencil #t))

#(define oboe-rh-cis-key-stencil
  (rich-path-stencil
   '((0.6 0.0 0.6 0.50 1.25 0.50)
     (2.25 0.50 2.25 -0.4 1.25 -0.4)
     (0.6 -0.4 0.6 0 0 0))
   -0.9
   1.0
   (lambda (stencil) (ly:stencil-rotate stencil 0 0 0))))

#(define oboe-rh-ees-key-stencil (oboe-rh-c-rh-ees-key-stencil #f))

% coordinates

#(define coord-x car)
#(define coord-y cdr)

#(define (coord-operation operator operand coordinate)
  (if (pair? operand)
      (cons (operator (coord-x operand) (coord-x coordinate))
            (operator (coord-y operand) (coord-y coordinate)))
      (cons (operator operand (coord-x coordinate))
            (operator operand (coord-y coordinate)))))

#(define (coord-apply function coordinate)
  (if (pair? function)
      (cons
       ((coord-x function) (coord-x coordinate))
       ((coord-y function) (coord-y coordinate)))
      (cons
       (function (coord-x coordinate))
       (function (coord-y coordinate)))))

#(define-public (coord-translate coordinate amount)
  (coord-operation + amount coordinate))

#(define-public (coord-scale coordinate amount)
  (coord-operation * amount coordinate))

#(define-public (coord-rotate coordinate angle-in-radians)
  (coord-rotated coordinate (/ angle-in-radians PI-OVER-180)))

#(define-public (coord-rotated coordinate direction)
  ;; Same, in degrees or with a given direction
  (let ((dir (ly:directed direction)))
    (cons (- (* (car dir) (car coordinate))
             (* (cdr dir) (cdr coordinate)))
          (+ (* (car dir) (cdr coordinate))
             (* (cdr dir) (car coordinate))))))

% Constants

#(define CENTRAL-COLUMN-HOLE-PLACEMENTS '((one . (0.0 . 6.5))
                                         (two . (0.0 . 5.5))
                                         (three . (0.0 . 4.5))
                                         (four . (0.0 . 3.0))
                                         (five . (0.0 . 2.0))
                                         (six . (0.0 . 1.0))))

#(define CENTRAL-COLUMN-HOLE-LIST (map car CENTRAL-COLUMN-HOLE-PLACEMENTS))
#(define CENTRAL-COLUMN-HOLE-H-LIST (cons 'h CENTRAL-COLUMN-HOLE-LIST))

% Utility functions

%(use-modules (ice-9 optargs))

#(define (return-1 x) 1.0)

#(define (make-spreadsheet parameter-list)
  "Makes a spreadsheet function with columns of parameter-list.
   This function can then be filled with rows.
   For example:
   @code{guile> ((make-spreadsheet '(foo bar)) '((1 2) (3 4) (5 6)))}
   @code{(((foo . 1) (bar . 2)) ((foo . 3) (bar . 4)) ((foo . 5) (bar . 6)))}"
  (lambda (ls)
    (map (lambda (list-to-translate)
           (map (lambda (name element)
                  `(,name . ,element))
                parameter-list
                list-to-translate))
         ls)))

#(define (get-spreadsheet-column column spreadsheet)
  "Gets all the values in @code{column} form @code{spreadsheet}
   made by @{make-spreadsheet}.
   For example:
   @code{guile> (get-spreadsheet-column 'bar ((make-spreadsheet '(foo bar)) '((1 2) (3 4) (5 6))))}
   @code{(2 4 6)}"
  (map (lambda (row) (assoc-get column row)) spreadsheet))

#(define (make-named-spreadsheet parameter-list)
  "Makes a named spreadsheet function with columns of parameter-list.
   This function can then be filled with named rows
   For example:
   @code{guile> ((make-named-spreadsheet '(foo bar)) '((x . (1 2)) (y . (3 4)) (z . (5 6))))}
   @code{((x (foo . 1) (bar . 2)) (y (foo . 3) (bar . 4)) (z (foo . 5) (bar . 6)))}"
  (lambda (ls)
    (map (lambda (list-to-translate)
           `(,(list-ref list-to-translate 0)
             . ,(map (lambda (name element)
                       `(,name . ,element))
                     parameter-list
                     (list-tail list-to-translate 1))))
         ls)))

#(define (get-named-spreadsheet-column column spreadsheet)
  "Gets all the values in @code{column} form @code{spreadsheet}
   made by @{make-named-spreadsheet}.
   For example:
   @code{guile> (get-spreadsheet-column 'bar ((make-named-spreadsheet '(foo bar)) '((x . (1 2)) (y . (3 4)) (z . (5 6)))))}
   @code{((x . 2) (y . 4) (z . 6))}"
  (map
   (lambda (row) (cons (car row) (assoc-get column (cdr row))))
   spreadsheet))

#(define make-key-alist
  (make-named-spreadsheet '(name offset graphical textual)))

#(define (simple-stencil-alist stencil offset)
  "A stencil alist that contains one and only one stencil.
   Shorthand used repeatedly in various instruments."
  `((stencils . (,stencil))
    (offset . ,offset)
    (textual?  . #f)
    (xy-scale-function . (,return-1 . ,return-1))))

#(define (make-central-column-hole-addresses keys)
  "Takes @code{keys} and ascribes them to the central column."
  (map
   (lambda (key) `(central-column . ,key))
   keys))

#(define (make-key-symbols hand)
  "Takes @code{hand} and ascribes @code{key} to it."
  (lambda (keys)
    (map (lambda (key) `(,hand . ,key))
         keys)))

#(define make-left-hand-key-addresses (make-key-symbols 'left-hand))

#(define make-right-hand-key-addresses (make-key-symbols 'right-hand))

% Assembly functions

% Scans a bank for name.
% for example, '(left-hand . bes) will return bes in the left-hand
% of a given bank
#(define (get-key name bank)
  (assoc-get (cdr name) (assoc-get (car name) bank)))

#(define (translate-key-instruction key-instruction)
  (let*
      ((key-name (car key-instruction))
       (key-complexity (assoc-get 'complexity (cdr key-instruction))))
    (cond
     ((eqv? key-complexity 'basic)
      `((,key-name . ,(assoc-get 'F HOLE-FILL-LIST))))
     ((eqv? key-complexity 'trill)
      (make-symbol-alist key-name #t #f))
     ((eqv? key-complexity 'covered)
      (make-symbol-alist key-name #f #f))
     ((eqv? key-complexity 'ring)
      (make-symbol-alist key-name #f #t)))))

#(define (update-possb-list input-key possibility-list canonic-list)
  (if (null? possibility-list)
      (ly:error (_ "woodwind markup error - invalid key or hole requested"))
      (if
       (assoc-get input-key (cdar possibility-list))
       (append
        `(((,(caaar possibility-list) .
            ,(assoc-get input-key (cdar possibility-list))) .
            ,(assoc-get (caar possibility-list) canonic-list)))
        (alist-delete (caar possibility-list) canonic-list))
       (update-possb-list input-key (cdr possibility-list) canonic-list))))

#(define (key-crawler input-list possibility-list)
  (if (null? input-list)
      (map car possibility-list)
      (key-crawler
       (cdr input-list)
       (update-possb-list
        (car input-list)
        possibility-list
        possibility-list))))

#(define (translate-draw-instructions input-alist key-name-alist)
  (append-map (lambda (short long)
                (let*
                    ((key-instructions
                      (map (lambda (instr)
                             `(((,long . ,(car instr)) . 0)
                               . ,(translate-key-instruction instr)))
                           (assoc-get long key-name-alist))))
                  (key-crawler (assoc-get short input-alist) key-instructions)))
              '(hd cc lh rh)
              '(hidden central-column left-hand right-hand)))

#(define (uniform-draw-instructions key-name-alist)
  (append-map (lambda (long)
                (map (lambda (key-instructions)
                       `((,long . ,(car key-instructions)) . 1))
                     (assoc-get long key-name-alist)))
              '(hidden central-column left-hand right-hand)))

#(define (list-all-possible-keys key-name-alist)
  (map (lambda (short long)
         `(,short
           . ,(map (lambda (key-instructions)
                     (car key-instructions))
                   (assoc-get long key-name-alist))))
       '(cc lh rh)
       '(central-column left-hand right-hand)))

#(define (list-all-possible-keys-verbose key-name-alist)
  (map (lambda (short long)
         `(,short
           . ,(map (lambda (key-instructions)
                     `(,(car key-instructions)
                       . ,(map (lambda (x)
                                 (car x))
                               (translate-key-instruction key-instructions))))
                   (assoc-get long key-name-alist))))
       '(cc lh rh)
       '(central-column left-hand right-hand)))

% The brains of the markup function: takes drawing and offset information
% about a key region and calls the appropriate stencils to draw the region.

#(define
  (assemble-stencils
   stencil-alist
   key-bank
   draw-instructions
   extra-offset-instructions
   radius
   thick
   xy-stretch
   pressed
   layout
   props)
  (apply
   ly:stencil-add
   (map (lambda (node)
          (ly:stencil-translate
           (if (pair? (cdr node))
               (if (assoc-get 'textual? node)
                   ((assoc-get 'textual? node) (map (lambda (key)
                                                      (assoc-get 'text? key))
                                                    (map (lambda (instr)
                                                           (get-key
                                                            instr
                                                            key-bank))
                                                         (assoc-get 'stencils node)))
                    radius
                    (map (lambda (key)
                           (assoc-get
                            key
                            draw-instructions))
                         (assoc-get 'stencils
                                    node))
                    layout
                    props)
                   (assemble-stencils
                    node
                    key-bank
                    draw-instructions
                    extra-offset-instructions
                    radius
                    thick
                    (coord-apply (assoc-get 'xy-scale-function stencil-alist)
                                 xy-stretch)
					pressed
                    layout
                    props))
               (if (= 0 (assoc-get node draw-instructions))
                   empty-stencil
                   ((assoc-get 'stencil (get-key node key-bank))
                    radius
                    thick
                    (assoc-get node draw-instructions)
					pressed
                    layout
                    props)))
           (coord-scale
            (coord-translate
             (coord-scale
              (assoc-get
               'offset
               (if (pair? (cdr node))
                   node
                   (get-key node key-bank)))
              (coord-apply
               (assoc-get 'xy-scale-function stencil-alist)
               xy-stretch))
             (if
              (assoc-get node extra-offset-instructions)
              (assoc-get node extra-offset-instructions)
              '(0.0 . 0.0)))
            radius)))
        (assoc-get 'stencils stencil-alist))))

%{
#(define*-public (print-custom-keys instrument #:optional (port (current-output-port)))
  (format port "\nPrinting keys for: ~a\n" instrument)
  (let ((chosen-instrument (assoc-get instrument woodwind-data-alist)))
    (do ((key-list
          (list-all-possible-keys (assoc-get 'keys chosen-instrument))
          (cdr key-list)))
        ((null? key-list))
      (format port "~a\n   ~a\n" (caar key-list) (cdar key-list)))))

#(define-public (get-custom-key-list instrument)
  (list-all-possible-keys-verbose
   (assoc-get
    'keys
    (assoc-get instrument woodwind-data-alist))))

#(define*-public (print-custom-keys-verbose instrument
                                    #:optional (port (current-output-port)))
  (format port "\nPrinting keys in verbose mode for: ~a\n" instrument)
  (do ((key-list (get-woodwind-key-list instrument)
                 (cdr key-list)))
      ((null? key-list))
    (format port "~a\n" (caar key-list))
    (for-each
     (lambda (x)
       (format port "   possibilities for ~a:\n      ~a\n" (car x) (cdr x)))
     (cdar key-list))))

%}

#(define oboe-custom-change-points
  ((make-named-spreadsheet '(oboe)) '()))

#(define (generate-oboe-custom-family-entry oboe-name)
  (let*
      ((change-points
        (get-named-spreadsheet-column oboe-name oboe-custom-change-points)))
    `(,oboe-name
      . ((keys
          . ((hidden
              . ((midline
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,midline-stencil)
                     (text? . #f)
                     (complexity . basic)))))
             (central-column
              . ((one
                  . ((offset . ,(assoc-get 'one CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (two
                  . ((offset . ,(assoc-get 'two CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (three
                  . ((offset . ,(assoc-get 'three CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (four
                  . ((offset . ,(assoc-get 'four CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (five
                  . ((offset . ,(assoc-get 'five CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (six
                  . ((offset . ,(assoc-get 'six CENTRAL-COLUMN-HOLE-PLACEMENTS))
                     (stencil . ,ring-column-circle-stencil)
                     (text? . #f)
                     (complexity . ring)))
                 (h
                  . ((offset . (0.0 . 6.25))
                     (stencil . ,(variable-column-circle-stencil 0.4))
                     (text? . #f)
                     (complexity . trill)))))
             (left-hand
              . ((I
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-lh-I-key-stencil)
                     (text? . ("1" . #f))
                     (complexity . trill)))
                 (III
                  . ((offset . (0.0 . 2.6))
                     (stencil . ,oboe-lh-III-key-stencil)
                     (text? . ("3" . #f))
                     (complexity . trill)))
                (IandIII
                 . ((offset . (0.0 . 2.6))
                    (stencil . ,oboe-lh-III-key-stencil)
                    (text? . ("1 + 3" . #f))
                    (complexity . trill)))
                 (II
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-lh-II-key-textual-stencil)
                     (text? . ("2" . #f))
                     (complexity . trill)))
                 (b
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-lh-b-key-stencil)
                     (text? . ("B" . 2))
                     (complexity . trill)))
                 (d
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-lh-d-key-stencil)
                     (text? . ("D" . #f))
                     (complexity . trill)))
                 (cis
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-lh-cis-key-stencil)
                     (text? . ("C" . 1))
                     (complexity . trill)))
                 (gis
                  . ((offset . (-0.85 . 0.2))
                     (stencil . ,oboe-lh-gis-key-stencil)
                     (text? . ("A" . 0))
                     (complexity . trill)))
                 (ees
                  . ((offset . (2.05 . -3.65))
                     (stencil . ,oboe-lh-ees-key-stencil)
                     (text? . ("E" . 0))
                     (complexity . trill)))
                 (low-b
                  . ((offset . (3.6 . 0.5))
                     (stencil . ,oboe-lh-low-b-key-stencil)
                     (text? . ("b" . #f))
                     (complexity . trill)))
                 (bes
                  . ((offset . (2.25 . -4.15))
                     (stencil . ,oboe-lh-bes-key-stencil)
                     (text? . ("B" . 0))
                     (complexity . trill)))
                 (f
                  . ((offset . (2.15 . -3.85))
                     (stencil . ,oboe-lh-f-key-stencil)
                     (text? . ("F" . #f))
                     (complexity . trill)))
                 (fadd
                  . ((offset . (2.15 . -3.85))
                     (stencil . ,oboe-lh-f-key-stencil)
                     (text? . ("F" . #f))
                     (complexity . trill)))))
             (right-hand
              . ((a
                  . ((offset . (1.5 . 1.2))
                     (stencil . ,oboe-rh-a-key-stencil)
                     (text? . ("A" . #f))
                     (complexity . trill)))
                 (gis
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-rh-gis-key-stencil)
                     (text? . ("A" . 0))
                     (complexity . trill)))
                 (d
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-rh-d-key-stencil)
                     (text? . ("D" . #f))
                     (complexity . trill)))
                 (f
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-rh-f-key-stencil)
                     (text? . ("F" . #f))
                     (complexity . trill)))
                 (banana
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-rh-banana-key-stencil)
                     (text? . ("ban" . #f))
                     (complexity . trill)))
                 (c
                  . ((offset . (0.0 . 0.0))
                     (stencil . ,oboe-rh-c-key-stencil)
                     (text? . ("C" . #f))
                     (complexity . trill)))
                 (cis
                  . ((offset . (3.8 . -0.6))
                     (stencil . ,oboe-rh-cis-key-stencil)
                     (text? . ("C" . 1))
                     (complexity . trill)))
                 (ees
                  . ((offset . (0.0 . -1.8))
                     (stencil . ,oboe-rh-ees-key-stencil)
                     (text? . ("E" . 0))
                     (complexity . trill)))))))
         (graphical-commands
          . ((stencil-alist
              . ((stencils
                  . (,(simple-stencil-alist '(hidden . midline) '(0.0 . 3.75))
                     ((stencils
                       . ,(make-central-column-hole-addresses
                           CENTRAL-COLUMN-HOLE-H-LIST))
                      (xy-scale-function . (,identity . ,identity))
                      (textual? . #f)
                      (offset . (0.0 . 0.0)))
                     ((stencils . ((left-hand . I) (left-hand . III)))
                      (xy-scale-function . (,return-1 . ,return-1))
                      (textual? . #f)
                      (offset . (-2.5 . 6.5)))
                     ,(simple-stencil-alist '(left-hand . II) '(2.5 . 6.0))
                     ,(simple-stencil-alist '(left-hand . b) '(-1.35 . 6.0))
                     ,(simple-stencil-alist '(left-hand . d) '(1.0 . 6.0))
                     ,(simple-stencil-alist '(left-hand . cis) '(1.0 . 5.0))
                     ((stencils
                       . ,(make-left-hand-key-addresses '(gis bes low-b ees f)))
                      (xy-scale-function . (,return-1 . ,return-1))
                      (textual? . #f)
                      (offset . (0.0 . 3.9)))
                     ((stencils .
                                ,(make-right-hand-key-addresses '(a gis)))
                      (xy-scale-function . (,return-1 . ,return-1))
                      (textual? . #f)
                      (offset . (-3.5 . 3.5)))
                     ,(simple-stencil-alist '(right-hand . d) '(1.0 . 2.5))
                     ,(simple-stencil-alist '(right-hand . f)  '(-1.0 . 1.5))
                     ,(simple-stencil-alist '(right-hand . banana)  '(1.7 . 1.0))
                     ((stencils . ,(make-right-hand-key-addresses '(c cis ees)))
                      (xy-scale-function . (,return-1 . ,return-1))
                      (textual? . #f)
                      (offset . (-3.4 . 0.3)))))
                 (xy-scale-function . (,identity . ,identity))
                 (textual? . #f)
                 (offset . (0.0 . 0.0))))
             (draw-instructions
              . ((,apply-group-draw-rule-series
                  (((right-hand . a) (right-hand . gis))
                   ,(make-left-hand-key-addresses '(gis bes low-b ees))
                   ,(make-right-hand-key-addresses '(cis c ees))))
                 (,rich-group-draw-rule
                  ((left-hand . III))
                  ((left-hand . I)))
                 (,rich-group-draw-rule
                  ((left-hand . f))
                  ,(make-left-hand-key-addresses '(gis bes low-b ees)))
                 (,group-automate-rule
                  ,(make-central-column-hole-addresses CENTRAL-COLUMN-HOLE-LIST))
                 (,group-automate-rule ((hidden . midline)))))
             (extra-offset-instructions
              . ((,rich-group-extra-offset-rule
                  ((central-column . h)) ((central-column . one)) (0.0 . 0.8))
                 (,uniform-extra-offset-rule (0.0 . 0.0))))))
         (text-commands
          . ((stencil-alist
              . ((stencils .
                           (,(simple-stencil-alist '(hidden . midline) '(0.0 . 3.75))
                            ((stencils
                              . ,(make-central-column-hole-addresses
                                  CENTRAL-COLUMN-HOLE-H-LIST))
                             (xy-scale-function . (,identity . ,identity))
                             (textual? . #f)
                             (offset . (0.0 . 0.0)))
                            ((stencils . ,(make-left-hand-key-addresses '(I III)))
                             (textual? . ,octave-oboe-text-stencil)
                             (offset . (0.0 . 7.4)))
                            ((stencils . ,(make-left-hand-key-addresses '(IandIII)))
                             (textual? . ,octave-oboe-text-stencil)
                             (offset . (0.0 . 7.4)))
                            ,(simple-stencil-alist '(left-hand . II) '(-1.0 . 7.3))
                             ((stencils
                               .  ,(make-left-hand-key-addresses
                                    '(b gis ees low-b bes f)))
                              (textual? . ,lh-woodwind-text-stencil)
                              (offset . (1.9 . 3.75)))
                             ((stencils
                               .  ,(make-left-hand-key-addresses
                                    '(fadd)))
                              (textual? . ,lh-woodwind-text-stencil)
                              (offset . (1.9 . 2.75)))
                             ((stencils
                               .  ,(make-left-hand-key-addresses
                                    '(cis)))
                              (textual? . ,lh-woodwind-text-stencil)
                              (offset . (1.9 . 4.7)))
                            ((stencils
                              . ,(make-right-hand-key-addresses
                                  '(a banana c cis ees)))
                             (textual? . ,rh-woodwind-text-stencil)
                             (offset . (-1.65 . 0.0)))
                            ((stencils
                              . ,(make-right-hand-key-addresses
                                  '(d)))
                             (textual? . ,rh-woodwind-text-stencil)
                             (offset . (-1.65 . 2.2)))
                            ((stencils
                              . ,(make-right-hand-key-addresses
                                  '(f)))
                             (textual? . ,rh-woodwind-text-stencil)
                             (offset . (-1.65 . 1.1)))
                            ((stencils
                              . ,(make-right-hand-key-addresses
                                  '(gis)))
                              (textual? . ,rh-woodwind-text-stencil)
                              (offset . (-1.65 . 3.75)))))
                 (xy-scale-function . (,identity . ,identity))
                 (textual? . #f)
                 (offset . (0.0 . 0.0))))
             (draw-instructions
              . ((,apply-group-draw-rule-series
                  (,(make-left-hand-key-addresses '(b d cis gis ees low-b bes f))
                   ,(make-left-hand-key-addresses '(III I))
                   ,(make-right-hand-key-addresses '(a gis d f banana c cis ees))))
                 (,group-automate-rule
                  ,(make-central-column-hole-addresses CENTRAL-COLUMN-HOLE-LIST))
                 (,group-automate-rule ((hidden . midline)))))
             (extra-offset-instructions
              . ((,rich-group-extra-offset-rule
                  ((central-column . h))
                  ((central-column . one))
                  (0.0 . 0.8))
                 (,uniform-extra-offset-rule (0.0 . 0.0))))))))))

#(define oboe-data-assembly-instructions
`((,generate-oboe-custom-family-entry . oboe)))

#(define oboe-data-alist
  (map (lambda (instruction)
         ((car instruction) (cdr instruction)))
       oboe-data-assembly-instructions))

#(define-markup-command
  (oboe-custom-fingering-diagram layout props user-draw-commands)
  (list?)
  #:category instrument-specific-markup ; markup category
  #:properties ((size 1)
                (thickness 0.1)
                (graphical #t)
				(pressed #f))
  
  (let*  ((radius size)
          (thick (* size thickness))
          (display-graphic graphical)
          (xy-stretch `(1.0 . 2.5))
          (chosen-instrument (assoc-get 'oboe oboe-data-alist))
          (stencil-info
           (assoc-get
            (if display-graphic 'graphical-commands 'text-commands)
            chosen-instrument))
          (pressed-info
           (if (null? user-draw-commands)
               (uniform-draw-instructions (assoc-get 'keys chosen-instrument))
               (translate-draw-instructions
                (append '((hd . ())) user-draw-commands)
                (assoc-get 'keys chosen-instrument))))
          (draw-info
           (function-chain
            pressed-info
            (assoc-get 'draw-instructions stencil-info)))
          (extra-offset-info
           (function-chain
            pressed-info
            (assoc-get 'extra-offset-instructions stencil-info))))
    (assemble-stencils
     (assoc-get 'stencil-alist stencil-info)
     (assoc-get 'keys chosen-instrument)
     draw-info
     extra-offset-info
     radius
     thick
     xy-stretch
     pressed
     layout
     props)))