
% MULTI NUMBERS

multiNumbersOn = \markup{ \hspace #0 } 

% TIES

tie-custom =
#(define-music-function
     (notes stretch offset voffset up)
     (ly:music? number? number? number? boolean?)

(define vs (+ 0.5 voffset))
(define vl (+ 1 voffset))

(if up 
	#{
		\override LaissezVibrerTie.direction = #1
		#notes
 		\shape #`(( ,offset . ,vs) 
				(,(+ offset (/ stretch 3)) . ,vl) 
				(,(+ offset (* 2 (/ stretch 3))) . ,vl) 
				(,(+ offset stretch) . ,vs)) 
		\laissezVibrer
	#}
	#{
		\override LaissezVibrerTie.direction = #-1
		#notes
 		\shape #`(( ,offset . ,(- 0 vs)) 
				(,(+ offset (/ stretch 3)) . ,(- 0 vl)) 
				(,(+ offset (* 2 (/ stretch 3))) . ,(- 0 vl)) 
				(,(+ offset stretch) . ,(- 0 vs))) 
		\laissezVibrer
	#}))

% CIRCLE NOTES

circle-note =
\once \override NoteHead.stencil = #(lambda (grob)
    (let* ((note (ly:note-head::print grob))
           (combo-stencil (ly:stencil-add
               note
               (circle-stencil note 0.3 2.0))))
          (ly:make-stencil (ly:stencil-expr combo-stencil)
            (ly:stencil-extent note X)
            (ly:stencil-extent note Y))))







 