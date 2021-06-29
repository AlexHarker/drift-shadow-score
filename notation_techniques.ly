
\include "notation_markup.ly"
\include "notation_fingerings.ly"
\include "layout_utility.ly"

% TODO - it would be nice if this were a layout property
% set the magnification for techniques

#(define magnify 1)

% draw a stong lip pressure diagram

#(define-markup-command (strong-lip-pressure layout props) ()
	  #:properties ((width 2.6) (height 1.4) (thick 0.2) (thicker 0.5) (xof 0.4))

	(define ya (* magnify (/ thicker 2)))	
    (define yb (* magnify (- height (/ thicker 2))))
	(define xa (* magnify (- xof (/ width 2))))
    (define xb (* magnify (+ xof (/ width 2))))	

    (interpret-markup layout props
	#{
		\markup 
		{
			\combine 
			\override #'(line-join-style . miter)
			\override #'(line-cap-style . butt)
			\override #'(filled . #f) \path #(* magnify thick)
			#`((moveto ,xa 0) 
			  (lineto ,xa ,(* magnify height))
   			  (moveto ,xb 0) 
			  (lineto ,xb ,(* magnify height)))

			\override #'(line-join-style . miter)
			\override #'(line-cap-style . butt)
			\override #'(filled . #f) \path #(* magnify thicker)
			#`((moveto ,xa ,ya) 
			  (lineto ,xb ,ya)
   			  (moveto ,xa ,yb) 
			  (lineto ,xb ,yb))
			}
	#}))


% draw a pressure diagram

#(define-markup-command (pressure-diagram layout props pressure) (number?)
	  #:properties ((hoffset -0.2) (voffset 4) (size 1.5))

	 (define xof 0)	
	 (define yof 0)
	 (define yex 0)	
     (define xex 0)
	 (define xflex 0)	

   	 (set! size (* magnify size))
   	 (set! xof (* magnify hoffset))
   	 (set! yof (* magnify voffset))
	 (set! xex (+ xof size))
   	 (set! yex (+ yof size))
   	 (set! xflex (+ xof (* size (/ pressure 4))))

    (interpret-markup layout props
	#{
		\markup 
		{
			\combine 
			\override #'(filled . #f) \path #0.1 
			#`((moveto ,xof ,yof) 
			  (lineto ,xof ,yex)
   			  (lineto ,xex ,yex)
			  (lineto ,xex ,yof)
    		  (closepath))

			 \override #'(filled . #t) \path #0.1
             #`((moveto ,xof ,yof) 
			   (lineto ,xof ,yex)
    		   (lineto ,xflex ,yex)
			   (lineto ,xflex ,yof)
    		   (closepath))
			}
	#}))

% draw a teeth indicator diagram

#(define-markup-command (teeth-indicator layout props) ()
	 #:properties ((hoffset 0) (voffset 8) (size 1.5))

	 (define xof 0)	
	 (define yof 0)
     (define xex 0)
	 (define yex 0)	

   	 (set! size (* magnify size))
   	 (set! xof (* magnify hoffset))
   	 (set! yof (* magnify voffset))
	 (set! xex (+ xof size))
   	 (set! yex (+ yof size))

    (interpret-markup layout props
	#{
		\markup 
		{
			\override #'(filled . #f) \path #0.15 			#`((moveto ,xof ,yex) 				     			  (lineto ,xex ,yex)
     	      (lineto ,xof ,yof)
		      (lineto ,xex ,yof))
		}
	#}))


% draw a reed diagram

#(define-markup-command (reed-diagram layout props reed) (number?)
	 #:properties ((hoffset 0) (voffset 8) (size 1.5) (small 0.4) (line-ratio 0.06))

	 (define yof (* magnify voffset))	
	 (define yex 0)	
     (define xsl (* magnify small))
     (define yht line-ratio)		
	 (define ytop 0)	
	 (define ybot 0)
	 (define xlt 0)
     (define xrt 0)
     (define xsp 0)

   	 (set! size (* magnify size))
   	 (set! xlt (* magnify hoffset))
	 (set! xrt (+ xlt size))
	 (set! yex (+ yof size))
	 (set! ytop (- yex (* (* size (- 1 yht)) reed)))
	 (set! ybot (- ytop (* size yht)))
	 (set! xsp (/ (- size xsl) 2))

(interpret-markup layout props
	#{
		\markup 
		{
  			\combine 
				\override #'(filled . #f) \path #0.1 
 				#`((moveto ,xlt , yex) 
				  (lineto ,xrt , yex)
     			  (lineto ,(- xrt xsp) ,yof)
				  (lineto ,(+ xlt xsp) ,yof)
    			  (closepath))

				\override #'(filled . #t) \path #0.1 
 				#`((moveto ,(+ xlt (* xsp (* (- 1 yht) reed))) ,ytop) 
				  (lineto ,(- xrt (* xsp (* (- 1 yht) reed))) ,ytop) 
     			  (lineto ,(- xrt (* xsp (+ yht (* (- 1 yht) reed)))) ,ybot)
				  (lineto ,(+ xlt (* xsp (+ yht (* (- 1 yht) reed)))) ,ybot)
    			  (closepath))

		}
	#}))

% draw a fingering

#(define-markup-command (oboe-fingering layout props fingering) (list?)
	 #:properties ((fsize 0.6) (voffset 8))

(interpret-markup layout props
	#{
		\markup 
		{
			\raise #voffset

  			\override #`(size . ,(* magnify fsize))
			\override #'(graphical . #f) 
			\override #'(font-name . "Arial Bold")
			\override #'(thickness . 0.2)	
		 	\oboe-custom-fingering-diagram #fingering
		}
	#}))

% draw a trill fingering (after a main fingering)

#(define-markup-command (oboe-trill-fingering layout props fingering aoffset) (list? number?)
	 #:properties ((fsize 0.6) (voffset 8))

(define xA (* magnify -3))
(define xB (* magnify -2))
(define xC (* magnify -1.25))
(define yA (* magnify 0.3))
(define yB (* magnify 0.6))

(interpret-markup layout props
	#{
		\markup 
		{
			\raise #voffset

			\overlay
			{
  				\override #`(size . ,(* magnify fsize))
				\override #'(graphical . #f) 
				\override #'(pressed . #t) 
				\override #'(font-name . "Arial Bold")
				\override #'(thickness . 0.2)	
			 	\oboe-custom-fingering-diagram #fingering

				\raise #(* magnify aoffset)
				\override #'(line-join-style . miter)
				\override #'(line-cap-style . butt)
				\override #'(filled . #t) \path #0.1
					#`((moveto ,xA ,yA) 
				   	  (lineto , xB ,yA)
   			  		  (lineto , xB , yB)
			          (lineto , xC , 0)
					  (lineto ,xB ,(- 0 yB))
					  (lineto ,xB ,(- 0 yA))
					  (lineto ,xA ,(- 0 yA))
					  (closepath))

	  			%\override #`(abs-font-size . ,(* magnify 1))
				\raise #(* magnify (+ aoffset 1.5))
				\hcenter-in #2 
				\line 
				{ 
					\concat 
					{ 
						\parenthesis-markup #0 ##f 
						\hspace #0.4
						\musicglyph #"scripts.trill" 
						\hspace #0.4
						\parenthesis-markup #0 ##t 
					} 
				}
			}
		}
	#}))

% draw a trill fingering on the central column

#(define-markup-command (oboe-trill-cc-fingering layout props hole) (number?)
	 #:properties ()

(define names '(one two three four five six one1h two1h three1h four1h five1h six1h))
(define voffsets '(9.75 8.25 6.75 4.5 3 1.5))

(interpret-markup layout props
#{
		\markup 
		{
			\oboe-trill-fingering 
			#`((cc . (,(list-ref names (- hole 1)))) (lh . ()) (rh . ())) 
			#(list-ref voffsets (modulo (- hole 1) 6))
		}
	#}))

% draw a trill fingering for an octve key

#(define-markup-command (oboe-trill-octave-fingering layout props octave) (number?)
	 #:properties ()

(define names '(I II III))
(define voffsets '(11.6 10.9 11.6))

(interpret-markup layout props
#{
		\markup 
		{
			\oboe-trill-fingering 
			#`((cc . ()) (lh . (,(list-ref names (- octave 1)))) (rh . ())) 
			#(list-ref voffsets (- octave 1))
		}
	#}))

% display a fingering plus reed and pressure information
	
#(define-markup-command (fingering-plus layout props fingering pressure reed) (list? number? number?)
	 #:properties ((voffset 8))

	(define xof -2.3)
	(define yof (+ 13 (/ voffset magnify)))
 	(define xad 3)
	(define air-diagram (if (= pressure 5) 
		#{ \markup \teeth-indicator #} #{ \markup \pressure-diagram #pressure #}))
	(define ratio (if (= pressure 5) 0.06 0.25))
	
	(set! reed (if (= pressure 5) (/ reed 5) (/ reed 4)))
	
(interpret-markup layout props
	#{
		\markup
		{
			\overlay
			{
				\override #`(voffset . ,voffset)
				\oboe-fingering #fingering
				\override #`(voffset . ,yof )
				\override #`(hoffset . ,xof )
				#air-diagram
				\override #`(voffset . ,yof )
				\override #`(hoffset . ,(+ xad xof))
				\override #`(line-ratio . ,ratio)
				\reed-diagram #reed				
			}
		}
	#}))
