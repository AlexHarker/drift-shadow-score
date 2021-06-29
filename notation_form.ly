
\include "notation_markup.ly"
\include "layout_utility.ly"

% hidden note with markup positioned on the stave

onStave =
#(define-music-function
    (item main above hof vof)
    (ly:music? markup? markup? number? number?)

	#{
		\override TextScript.extra-offset = #`(,hof . ,vof)
		\override TextScript.Y-extent = #'(-2.6 . 0.4)
		\textLengthOn
		\hideNotes #item -\markup \general-align #Y #UP #main ^\markup #above
		\unHideNotes
		\textLengthOff
		\revert TextScript.extra-offset
		\revert TextScript.Y-extent
	#})

% spacer that is equal to the onStave spacing for markup below the scaore

staveSpacer =
#(define-music-function ()()

	#{
		\override TextScript.Y-extent = #'(-2.6 . 0.4)
		\hideNotes r32 -\markup \general-align #Y #UP \null
		\unHideNotes
		\revert TextScript.extra-offset
		\revert TextScript.Y-extent
	#})

% draw a bracket

bracket =
#(define-music-function
    (right offset)
    (boolean? number?)

    (define rest #{ r4 #})
    (define height 6)
  	(define width 1)
  	(define thick 0.3)
  	(define rOffset 4)
  	(define xA 1)
  	(define xB 0)
    (define xC 0.3)

  	(set! xA (if right (- 0 rOffset) width))
    (set! xB (if right (- width rOffset) 0))
    (set! xC (if right (- width (+ thick rOffset)) thick))

	 (set! rest (if right #{ r16 #} #{ r8. #}))

	#{
		\onStave #rest
		\markup
		{
			\hcenter-in #width
			\override #'(filled . #t) \path #0.1
			#`((moveto ,xA 0)
			  (lineto ,xB 0)
			  (lineto ,xB ,(- 0 height))
			  (lineto ,xA ,(- 0 height))
			  (lineto ,xA ,(- thick height))
			  (lineto ,xC ,(- thick height))
			  (lineto ,xC ,(- 0 thick))
			  (lineto ,xA ,(- 0 thick))
    		  (closepath))
		}
		\markup {}
		#0 #offset
	#})

% parentheses

parenthesis =
#(define-music-function
    (right offset)
    (boolean? number?)

	#{
		\onStave { r8 }
		\markup
		{
			\center-align \parenthesis-markup #5 #right
		}
		\markup {}
		#offset #4.55
	#})

% option slash base

option-base =
#(define-music-function
	(main above offset)
	(markup? markup? number?)

	(define height 5.5)
	(define width 2)
	(define thick 0.3)

	#{
		\onStave { r4 }
		\markup
		{
			\overlay
			{
				\override #'(filled . #t) \path #0.1
					#`((moveto ,(- width thick) 0)
	  				  (lineto ,width ,0)
      				  (lineto ,thick ,(- 0 height))
	  				  (lineto 0 ,(- 0 height))
	  				  (closepath))
				#main
			}
		}
		#above
		#-0.7 #offset
	#})

% option slash plus markup above

option-markup =
#(define-music-function
	(markup)
	(markup?)

	#{
		\option-base \markup {} #markup #5.32
	#})


% option slash with arrow plus markup above

option-arrow-markup =
#(define-music-function
	(markup)
	(markup?)

	(define ahalfheight 0.6)
	(define ahalflength 1)
	(define width 2)
    (define height 5.5)

	#{
		\option-base
		\markup
		{
			\overlay
			{
				\override #'(line-cap-style . butt)
				\override #'(filled . #f) \path #0.4
					#`((moveto 0 ,(- 0 (/ height 2)))
	 			 	   (lineto ,width ,(- 0 (/ height 2))))
				\override #'(line-join-style . miter)
				\override #'(filled . #t) \path #0.1
					#`((moveto ,width ,(- ahalfheight (/ height 2)))
	 				   (lineto ,width ,(- (- 0 ahalfheight) (/ height 2)))
	 				   (lineto ,(+ width ahalflength) ,(- (/ height 2)))
             (closepath))
			}
		}
		#markup
		#5.32
	#})

% option slash with brackets plus markup above

option-brackets-markup =
#(define-music-function
	(markup)
	(markup?)

	#{
		\option-base
		\markup
		{
			\lower #3.7
			\center-align \line 
			{ 
				\hspace #2 
				\parenthesis-markup #4 ##f
				\hspace #1 
				\parenthesis-markup #4 ##t
			}
		}
		#markup
		#5.32
	#})

% an OR sign with markup above

or-sign-markup =
#(define-music-function
	(markup)
	(markup?)

	#{
		\once \override TextScript.self-alignment-X = #0
		\onStave { r4 }
		\markup \override #'(font-name . "Arial Bold")
		{ \whiteout \pad-markup #0.4 OR }
		#markup
		#0 #3.7
	#})


% an ALT sign with markup above

alt-sign-markup =
#(define-music-function
	(markup)
	(markup?)

	#{
		\once \override TextScript.self-alignment-X = #0
		\onStave { r4 }
		\markup \override #'(font-name . "Arial Bold")
		{ \whiteout \pad-markup #0.4 ALT }
		#markup
		#0 #3.7
	#})

% utility calls with no arguments

l-bracket = \bracket ##f #5.609
r-bracket = \bracket ##t #5.609
option = \option-markup \markup {}
option-arrow = \option-arrow-markup \markup {}
option-brackets = \option-brackets-markup \markup {}
or-sign = \or-sign-markup \markup {}
alt-sign = \alt-sign-markup \markup {}

% ADDITIONAL FORM ELEMENTS

% a trill or gliss markup

#(define-markup-command (trill-gliss layout props main details option) (markup? markup? boolean?)
	 #:properties ((width 6) (offset 0))
    (define ahwidth 0.5)
    (define awidth 1.2)
    (define aheight 0.7)
	(define thick 0.15)
	(define voffset (if option 5.8 7.5))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
				\translate #`(,(- offset (/ width 2)) . ,(+ voffset 2.5))
				\override #'(line-cap-style . butt)
				\override #'(line-join-style . miter)
				\override #'(filled . #f) \path #thick
				#`((moveto 0 0)
		  	   		(lineto ,awidth 0)
			   		(moveto ,width 0)
		   	   		(lineto ,(- width awidth) 0)
			   		(moveto ,ahwidth ,(/ aheight 2))
			   		(lineto 0 0)
			   		(lineto ,ahwidth ,(- 0 (/ aheight 2)))
			   		(moveto ,(- width ahwidth) ,(/ aheight 2))
			   		(lineto ,width 0)
			   		(lineto ,(- width ahwidth) ,(- 0 (/ aheight 2))))
				\translate #`(,offset . ,(+ voffset 2.1))
				\override #'(font-size . -2)
				\hcenter-in #width { #main }
				\translate #`(,offset . , voffset)
				\override #'(font-size . -2)
				\hcenter-in #width { #details }
			}
		}
	#}))

% a time bracket

#(define-markup-command (time-bracket layout props time width) (markup? number?)
    (define height 1.2)
	(define thick 0.1)

(interpret-markup layout props
	#{
		\markup
		{
			\combine
			\override #'(line-cap-style . butt)
			\override #'(line-join-style . miter)
			\override #'(filled . #f) \path #thick
			#`((moveto 0 ,height)
		  	   (lineto 0 0)
			   (moveto ,width ,height)
		   	   (lineto ,width 0)
			   (moveto 0 ,(/ height 2))
			   (lineto ,width ,(/ height 2)))
			\override #'(font-size . -1)
			\translate #`(,(/ width 2) . 0.3)
				\hcenter-in #width { \whiteout \pad-around #0.4 { #time } }
		}
	#}))

% a time bracket with a range

#(define-markup-command (time-bracket-range layout props min max width) (markup? markup? number?)

(interpret-markup layout props
	#{
		\markup
		{
			\time-bracket \line { c. \concat { #min \hspace #0.3 - \hspace #0.3 #max "\"" } } #width
		}
	#}))
	

% IDEA BOXES / REPRESENTATION / EXPLANATIONS

% indicate a part of the piece

#(define-markup-command (main-part layout props name) (markup?)

(interpret-markup layout props
	#{
		\markup
		{
			\override #'(font-size . 4)
			\box \pad-markup #0.8 \bold { #name }
		}

	#}))

% reference a part of the piece

#(define-markup-command (reference-part layout props name) (markup?)

(interpret-markup layout props
	#{
		\markup
		{
			\box \pad-markup #0.3 \normal-text \bold { #name }
		}

	#}))

% represent an idea

#(define-markup-command (section-idea layout props name) (markup?)
	 #:properties ((fsize 0.6))

(interpret-markup layout props
	#{
		\markup
		{
  			\box \pad-markup #0.5 \normal-text \bold { #name }
		}
	#}))

% represent an idea

#(define-markup-command (idea layout props name) (markup?)
	 #:properties ((fsize 0.6))

(interpret-markup layout props
	#{
		\markup
		{
  			\box \pad-markup #0.3 \normal-text \bold { #name }
		}
	#}))

% represent a variant

#(define-markup-command (variant layout props name) (markup?)
	 #:properties ((fsize 0.6))

(interpret-markup layout props
	#{
		\markup
		{
			\idea #name
  			%\override #'(circle-padding . 0.5) \circle \normal-text \bold { #name }
		}
	#}))

% explain a variant

#(define-markup-command (variant-explain layout props name) (markup?)
	 #:properties ((fsize 0.6))

(interpret-markup layout props
	#{
		\markup
		{
			\variant #name \hspace #1.5
		}
	#}))

% represent an idea from which you are arriving

#(define-markup-command (previous-idea layout props markup) (markup?)

(interpret-markup layout props
	#{
		\markup 
		{
			\line 			
			{ 
				\vcenter \parenthesis-markup #4 ##f 
		  		\vcenter \idea #markup
				\vcenter \parenthesis-markup #4 ##t 
			}
		}
	#}))

			

% ARROW LINKS

% rotate a point

#(define (rotate x y angle)
	(define cosA (cos (* (* 4 (atan 1.0)) (/ (- angle 180) 180))))
	(define sinA (sin (* (* 4 (atan 1.0)) (/ (- angle 180) 180))))

	(cons (- (* sinA y) (* cosA x)) (+ (* sinA x) (* cosA y)))
)

% find the angle of a line between two points

#(define (angle-points xa ya xb yb) (- 270 (* 180 (/ (atan (- yb ya) (- xb xa)) (* 4 (atan 1.0))))))

% draw an arrowhead

#(define-markup-command (form-arrowhead layout props tipX tipY angle) (number? number? number?)
	 #:properties ((width 1.6) (length 2.2))

(define xl 0)
(define yl 0)
(define xr 0)
(define yr 0)

(define rotA (rotate (/ width 2) length angle))
(define rotB (rotate (- 0 (/ width 2)) length angle))
(define rotC (rotate (/ width 2) 0 angle))
(define rotD (rotate (- 0 (/ width 2)) 0 angle))

(set! xl (+ tipX (car rotA)))
(set! xr (+ tipX (car rotB)))
(set! yl (+ tipY (cdr rotA)))
(set! yr (+ tipY (cdr rotB)))

(interpret-markup layout props
	#{
		\markup
		{
			\combine

			\line
			{
				\with-color #white
				\override #'(color . 'white)
				\override #'(filled . #t)
				\override #'(line-join-style . miter) \path #0.1
				#`((moveto ,xl ,yl)
			  	  (lineto ,xr ,yr)
			   	  (lineto ,(+ tipX (car rotD)) ,(+ tipY (cdr rotD)))
			   	  (lineto ,(+ tipX (car rotC)) ,(+ tipY (cdr rotC)))
   			   	  (closepath))
			}

			\override #'(filled . #t)
			\override #'(line-join-style . miter) \path #0.1
			#`((moveto ,tipX ,tipY)
			  (lineto ,xl ,yl)
			  (lineto ,xr ,yr)
			  (closepath))
		}
	#}))

% draw a direct link

#(define-markup-command (form-link layout props startX startY endX endY) (number? number? number? number?)
	 #:properties ((oneway #f))

(define midY (/ (+ startY endY) 2))
(define angle (angle-points startX startY endX endY))
(define startArrow #{ \markup{} #})

(if (not oneway) (set! startArrow
#{\markup \form-arrowhead #startX #startY #angle #}))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
	    		\override #'(filled . #f)
				\override #'(line-cap-style . butt) \path #0.2
				#`((moveto ,startX ,startY)
			  	  (lineto ,endX ,endY))

				#startArrow
				\form-arrowhead #endX #endY #(+ angle 180)
			}
		}
	#}))

% draw an S curve link

#(define-markup-command (form-s-curve layout props startX startY endX endY) (number? number? number? number?)
	 #:properties ((hinside 0.05) (vinside 0.15) (oneway #f) (anglea 0) (angleb 0))

(define hof (if (> startX endX) (- 0 (* hinside (- startX endX))) (* hinside (- endX startX))))
(define vof (if (> startY endY) (- 0 (* vinside (- startY endY))) (* vinside (- endY startY))))
(define angleA 0)
(define angleB 0)
(define startArrow #{ \markup{} #})

(set! angleA (+ anglea (angle-points startX startY (+ startX hof) (- endY vof))))
(set! angleB (+ angleb (angle-points endX endY (- endX hof) (+ startY vof))))

(if (not oneway) (set! startArrow
#{\markup \form-arrowhead #startX #startY #angleA #}))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
				\override #'(filled . #f)
				\override #'(line-cap-style . butt) \path #0.2
				#`((moveto ,startX ,startY)
			  	  (curveto ,(+ startX hof) ,(- endY vof) ,(- endX hof) ,(+ startY vof) ,endX ,endY))

				#startArrow
				\form-arrowhead #endX #endY #angleB
			}
		}
	#}))

% draw a rounded curve link

#(define-markup-command (form-rounded-curve layout props startX startY endX endY) (number? number? number? number?)
	 #:properties ((hround 9) (vround 9) (oneway #f))

(define midY (/ (+ startY endY) 2))
(define angle (if (> startY endY) 0 180))
(define hr (min hround (/ (abs (- endX startX)) 2)))

(define vr (min vround (/ (abs (- endY startY)) 2)))
(define hof 0)
(define vof 0)
(define startArrow #{ \markup{} #})

(if (not oneway) (set! startArrow
#{\markup \form-arrowhead #startX #startY #angle #}))

(set! hof (if (> startX endX) (- 0 hr) hr))
(set! vof (if (> startY endY) (- 0 vr) vr))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
      		{
        		\override #'(filled . #f)
			  	\override #'(line-cap-style . butt) \path #0.2
			  	#`((moveto ,startX ,startY)
			      (lineto ,startX ,(- midY vof))
			  	  (curveto ,startX ,midY ,startX ,midY ,(+ startX hof) ,midY)
			  	  (lineto ,(- endX hof) ,midY )
			      (curveto , endX ,midY , endX ,midY ,endX ,(+ midY vof))
			      (lineto ,endX ,endY))

				#startArrow
				\form-arrowhead #endX #endY #(+ angle 180)
			}
		}
	#}))

% draw an angled curve link

#(define-markup-command (form-angle-curve layout props startX startY endX endY) (number? number? number? number?)
	 #:properties ((oneway #f))

(define midY (/ (+ startY endY) 2))
(define angle (if (> startY endY) 0 180))
(define startArrow #{ \markup{} #})

(if (not oneway) (set! startArrow
#{\markup \form-arrowhead #startX #startY #angle #}))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
				\override #'(filled . #f)
				\override #'(line-cap-style . butt) \path #0.2
				#`((moveto ,startX ,startY)
				  (lineto ,startX ,midY)
				  (lineto ,endX ,midY)
			  	  (lineto ,endX ,endY))

				#startArrow
				\form-arrowhead #endX #endY #(+ angle 180)
			}
		}
	#}))

% draw a curved link between two points

#(define-markup-command (form-curve layout props startX startY endX endY) (number? number? number? number?)
	 #:properties ((pdist 15) (ldist 25) (oneway #f) (anglea 0) (angleb 0))

(define cax 0)
(define cay 0)
(define cbx 0)
(define cby 0)

(define angleA 0)
(define angleB 0)
(define angle (angle-points startX startY endX endY))
(define rotA (cons 0 0))
(define rotB (cons 0 0))
(define startArrow #{ \markup{} #})

(set! rotA (rotate (- 0 pdist) (- 0 ldist) angle))
(set! rotB (rotate pdist (- 0 ldist) angle))
(set! cax (+ (/ (+ startX endX) 2) (car rotA)))
(set! cay (+ (/ (+ startY endY) 2) (cdr rotA)))
(set! cbx (- (/ (+ startX endX) 2) (car rotB)))
(set! cby (- (/ (+ startY endY) 2) (cdr rotB)))

(set! angleA (+ (angle-points startX startY cax cay) anglea))
(set! angleB (+ (angle-points endX endY cbx cby) angleb))

(if (not oneway) (set! startArrow
#{\markup \form-arrowhead #startX #startY #angleA #}))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
				\override #'(filled . #f)
				\override #'(line-cap-style . butt) \path #0.2
				#`((moveto ,startX ,startY)
     			   (curveto ,cax ,cay ,cbx ,cby ,endX ,endY))

				#startArrow
				\form-arrowhead #endX #endY #angleB
			}
		}
	#}))

% draw an arrow for a previous idea

previous-arrow = \markup \override #'(oneway . #t) \form-link #0 #0 #0 #-5

% draw a markup for previous ideas

#(define-markup-command (arrive-from layout props markup) (markup-list?)
	 #:properties ((offset 12))

(interpret-markup layout props
	#{
		\markup
		\with-color #(x11-color 'grey70)
		\translate #'(9 . 0)
		\hcenter-in #13
		\lower #offset
		\center-column
		{
			#markup
			\previous-arrow
		}						

	#}))

			

% draw an insert marker

#(define-markup-command (insert-marker layout props) ()
	 #:properties ((width 10) (height 2) (aheight 3) (aoffset -1.5) (insert-width 4))

(define xA (/ (- width insert-width) 2))
(define xB 0)

(set! xB (- width xA))

(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
	    		\override #'(filled . #f)
				\override #'(line-cap-style . butt) \path #0.2
				#`((moveto 0 0)
			  	  (lineto ,xA 0)
				  (moveto ,xA ,(/ height 2))
			  	  (lineto ,xA ,(- 0 (/ height 2)))
				  (moveto ,xB ,(/ height 2))
			  	  (lineto ,xB ,(- 0 (/ height 2)))
				  (moveto ,xB 0)
			  	  (lineto ,width 0)
				  (moveto ,(/ width 2) ,aoffset)
			  	  (lineto ,(/ width 2) ,(+ aoffset aheight)))

				\override #'(width . 1.2)
				\override #'(length . 1.4)
				\form-arrowhead #(/ width 2) #aoffset #180
			}
		}
	#}))

% START SECTIONS / COMPONENTS

% repeat numbers

#(define-markup-command (repeat-min layout props min) (markup?)
	 #:properties ()

(interpret-markup layout props
	#{
		\markup
		{
			\concat { #min \hspace #0.1 \override #'(font-name . "Arial") {+} }
		}
	#}))

#(define-markup-command (repeat-range layout props min max) (markup? markup?)
	 #:properties ()

(interpret-markup layout props
	#{
		\markup
		{
			\concat { #min \hspace #0.05 \override #'(font-name . "Arial") {-} \hspace #0.2 #max }
		}
	#}))

% start a new section

section =
#(define-music-function
	(name repeats)
	(markup? markup?)

(define rep #{ \markup \override #'(font-name . "Arial Bold")
						\override #'(font-size . 1) \concat { x \hspace #0.9 #repeats } #}) 

	#{
		\new Staff \with 
		{ 
			instrumentName = \markup 
			{
				\column
				{
					\hcenter-in #13 \line 
					{
						\with-color #white
						\override #'(font-name . "Arial Bold")
						\override #'(font-size . 1) \concat { x \hspace #0.9 #repeats } 
					} 
					\hcenter-in #13 \column
					{
						\pad-around #1 \section-idea #name
					}
					\hcenter-in #13 \line 
					{
						\override #'(font-name . "Arial Bold")
						\override #'(font-size . 1) \concat { x \hspace #0.9 #repeats } 
					} 
				}
			}	
		}

		\accidentalStyle dodecaphonic
	#})

% start a new insert section

insert-section =
#(define-music-function
	(name repeats)
	(markup? markup?)

	#{
		\new Staff \with 
		{ 
			instrumentName = \markup 
			{
				\column
				{
					\hcenter-in #13 \line
					{
						\vcenter \insert-marker	
					}
					\hcenter-in #13 \column
					{
						\pad-around #1 \line { \box \pad-markup #0.5 \bold #name }
					}
					\combine
					\vspace #1
					\hcenter-in #13 \line 
					{
						\override #'(font-name . "Arial Bold")
						\override #'(font-size . 1) \raise #1.6 \concat { x \hspace #0.9 #repeats } 
					} 					
				}
			}	
		}

		\accidentalStyle dodecaphonic
	#})

% start a new component

component =
#(define-music-function
	(name)
	(markup?)

	#{
		\new Staff \with { instrumentName = \markup {
			\pad-around #1 \center-column {
			\line { \box \pad-markup #0.5 \bold #name }
		}}}

		\accidentalStyle dodecaphonic
	#})

% start a new optional component

optional-component =
#(define-music-function ()()

	#{
		\new Staff \with { instrumentName = \markup {
			\pad-around #1 \center-column {
			\line { \pad-markup #0.5 \bold \optional-add }
		}}}

		\accidentalStyle dodecaphonic
	#})

add-or-component =
#(define-music-function ()()

	#{
		\new Staff \with { instrumentName = \markup {
			\pad-around #1 \center-column {
			\line { \pad-markup #0.5 \bold \optional-add-or }
		}}}

		\accidentalStyle dodecaphonic
	#})

