
% useful macros

blankline = \markup { \vspace # 0.5 }
indent = \markup { \hspace #4 }
spacerRest = { \hide r128 }
smallNote = { \once \tiny }
trillSign = \markup { \musicglyph #"scripts.trill" }
timbral = \markup { \override #'(font-name . "Arial Bold") { T } }

textASize = #'(font-size . -1)
textBSize = #'(font-size . -1)
textCSize = #'(font-size . 0)
textDSize = #'(font-size . 2)


% number-font

#(define-markup-command (number-font layout props markup) (markup?)

    (interpret-markup layout props
	#{
		\markup
		{
			\override #'(font-encoding . fetaText) 
			\override #'(font-size . -3)		
			#markup
		}
	#}))

cOn = \markup { \circle { \number-font 1 }}
cTw = \markup { \circle { \number-font 2 }}
cTh = \markup { \circle { \number-font 3 }}
cFo = \markup { \circle { \number-font 4 }}
cFv = \markup { \circle { \number-font 5 }}
cSx = \markup { \circle { \number-font 6 }}
cSv = \markup { \circle { \number-font 7 }}

exampleHeading = \markup { \bold "e.g." }


% dynamic text markups

#(define-markup-command (dynamic-space layout props) ()

    (interpret-markup layout props
	#{
		\markup
		{
			\hspace #0.5		
		}
	#}))

#(define-markup-command (block-dynamics layout props markup) (markup?)

    (interpret-markup layout props
	#{
		\markup
		{
			#markup \dynamic-space		
		}
	#}))

#(define-markup-command (block-dynamic layout props dynamic) (markup?)

    (interpret-markup layout props
	#{
		\markup
		{
			\block-dynamics { \dynamic #dynamic }	
		}
	#}))

#(define-markup-command (dynamic-range layout props low high) (markup? markup?)

(interpret-markup layout props
	#{
		\markup
		{
			\block-dynamics { \concat { \dynamic #low \hspace #0.2 - \hspace #0.2 \dynamic #high } }
		}
	#}))


% parenthesis formatting

#(define-markup-command (parenthesis-markup layout props size right) (number? boolean?)

(interpret-markup layout props
	#{
		\markup
		{
			\override #`(font-size . ,size) 
			\override #'(font-name . "Source Sans Pro")
			#(if right #{ \markup ) #} #{ \markup ( #})
		}
	#}))


% optional add markup

optional-add = \markup { \override #'(font-size . 3) \vcenter { \override #'(font-name . "Source Sans Pro") \concat { ( \override #'(font-size . 4) \override #'(font-name . "Arial Bold") \lower #0.4 + ) } } }

optional-add-or = \markup { \override #'(font-size . 3) \vcenter { \override #'(font-name . "Source Sans Pro") \concat { ( \hspace #0.2 \override #'(font-size . 4) \override #'(font-name . "Arial Bold") \lower #0.4 { + } \hspace #0.2 / \hspace #0.4 ) } } }


% breath mark

breathMark = ^\markup 
{ 
	\concat 
	{ 
		\vcenter \parenthesis-markup #-1 ##f 
		\hspace #0.1
		\vcenter \musicglyph "scripts.rcomma" 
		\hspace #0.1
		\vcenter \parenthesis-markup #-1 ##t 
	} 
}

% selection range

#(define-markup-command (selection-range layout props min max) (markup? markup?)

(interpret-markup layout props
	#{
		\markup
		{
			\line { \override #'(font-name . "Arial Bold") { \concat { #min \hspace #0.15 - \hspace #0.3 #max } } }
		}
	#}))


% noise burst

noiseBurst =
\markup
{
	\override #'(filled . #f) \path #0.2
	#'((moveto 0.2 0)
	   (curveto -0.1 0.1 1.9 -0.3 1 -0.2)
	   (curveto 1.9 -0.1 -0.1 -0.5 0 -0.4)
	   (curveto -0.1 -0.3 1.9 -0.7 1.2 -0.6)
	   (curveto 1.9 -0.5 -0.1 -0.9 -0.2 -0.8)
	   (curveto -0.1 -0.7 1.9 -1.1 0.9 -1.0)
  	   (curveto 1.9 -0.9 -0.1 -1.3 0 -1.2)
	   (curveto -0.1 -1.1 1.9 -1.5 0.8 -1.4))
}


