
\include "notation.ly"
\include "layout_utility.ly"

% test

text-empty = 
\markup {}

text-brackets = 
\markup
{
	\column 
	{
		\line \italic { Square brackets indicate a set of ideas that an be ordered freely. }
		\line \italic { Slashes with arrows indicate when ideas should be introduced over time. }
		\line \italic { Otherwise sections may be started at any item. }
	}
}

text-or-alt = 
\markup
{
	\column 
	{
		\line \italic { OR and ALT symbols indicate similar sounding multiphonics. }
		\line \italic { This is to aid planning of order for contrast or similarity. }
	}
}

text-sections = 
\markup
{
	\column 
	{
		\line \italic { Section names are indicated within a box with repeat indications to indicate how many times that section is to be traversed in a performance. }
		\line \italic { Sections with the downwards arrow within two lines are 'insert sections' which can be used at any point within the part they belong to. }
		\line \italic { After finishing an insert section you should return to the section you came from, or the start of the part you are within. }
	}
}

text-plus = 
\markup
{
	\column 
	{
		\line \italic { These blocks are additional to the main block for the section }
		\line \italic { Those marked (+) must be optionally used alongside the preceding block. }
		\line \italic { Those marked (+/) may be used alongside or instead of the preceding block. }
		\line \italic { Blocks are generally separate temporal entities but there may be additional directions about how to use specific blocks. }
	}
}

text-techniques = 
\markup
{
	\column 
	{
		\line \italic { For multiphonics fingering, air pressure (or indication of a teeth tone) and reed position are all given. }
		\line \italic { Where specific single notes are also an option these are indicated (with a suitable air pressure alteration, or teeth tone indication). }
		\line \italic { Ties indicate that single notes may be used slurred to the multiphonic and you may use the multiphonics, single notes or combination ad lib. }
		\blankline
		\line \italic { The notation on right-hand side shows an option for colour trills on the single notes }
	}
}

text-selection-focus = 
\markup
{
	\column 
	{
		\line \italic { Throughout the piece two approaches to multiphonics are referred to: \bold selection and \bold focus. }
		\blankline
		\line \italic { The upper notation indicates \bold selection in which the aim is to isolate single pitches from a multiphonic as far as possible. }
		\line \italic { The lower notation indicates \bold focus in which the multiphonic should be maintained, but the balance of pitches adjusted. }
		\blankline
		\line \italic { Note that in the latter case it is desirable for dyads to result (if possible) but the notation indicates prominent single pitches for simplicity. }
		\line \italic { In both cases experimentation will be necessary to find the changes of embouchure and pressure that acheive best results. }
		\line \italic { According to the fingering some changes may create audible glisses or changes in tuning, which should be embraced. }

	}
}


% longer explanations

explain-form-a = \markup \justify { The piece is in four main \concat {\bold parts , } indicated in boxes at the top left of the relevant pages. Each part starts with the material immediately under the heading. After playing this \bold section you may navigate as you wish within each part, as long as you follow the indications and arrows. However, the four main parts must happen in order, and you may not return to earlier parts in the piece after progressing onwards. }

explain-form-b = \markup \justify { Each section or \bold block (staff within a section) has specific instructions to the right of the notiation which should be followed. In the case of sections containing multiple blocks, additional instructions about form/shaping are given as boxed text. With the exception of 'insert' sections (explained below) arrows are used to indicate which sections can follow one another. These are directional, so you may only travel in the direction(s) indicated by the arrowheads. Arrows may be between passages of musical notation directly, or to a boxed section name when the section that follows is on another page. }

explain-form-c = \markup \justify { It is important to note that examples (marked with boxed letters) are indicative of a playing style, and should not be reproduced as written each time, but used as a starting point for exploration. }

explain-techniques-a = \markup \justify { The piece is based primarily on multiphonics, which are notated in terms of fingering, air pressure and reed position. Additional experimentation may be needed to fine tune positions, embouchure etc. in order to cleanly play the multiphonics as written. Many of the techniques employed also require production that does not aim to create a static, blended chord, but create timbral variation upon a single fingering. }

explain-techniques-b = \markup \justify { Dynamics are often given as a range which can be explored freely. Not all fingerings in a given block may be equally flexible in terms of dynamic, and at times the dynamics marked will imply underblowing, creating an unstable result. The written directions should be used alongside experimentation to interpret the written dynamics. }

explain-techniques-c = \markup \justify { Possible trills/glisses between adjacent fingerings are indicated, but futher colour fingerings are requested at various points. These should not alter the fundamental pitch material too radically, but should inflect the multiphonic differently in terms of timbre or microtonal details. }

explain-techniques-d = \markup \justify { Whilst common notations are indicated here, further graphical notations are used in the score and explained in context. Graphical elements should be interpreted as indicative, rather than literal in terms of timing and gestural shaping. }


% scores

key-brackets = 
{
	\override TextScript.self-alignment-X = #0

	{
		\l-bracket
	
		s4
		s4
		s4
		\option-markup 
			\markup \italic 
			{  
				\center-column 
				{
					\line { indicates separate }
					\line { fingerings/ideas }
				}
			}
		s4
		s4
		s4
		s4
		\option-arrow-markup 
			\markup \italic 
			{  
				\center-column 
				{
					\line { indicates that fingerings/ideas to }
					\line { the right should be added over time }
				}
			}
		s4
		s4
		\r-bracket
	}
}

key-or-alt =
{
	\override TextScript.self-alignment-X = #0

	{
		\accidentalStyle dodecaphonic

		\l-bracket
	
		s4
		\MulFoEi
		s4
		s4
		\alt-sign-markup 
			\markup \italic 
			{  
				\center-column 
				{
					\line { indicates that two }
					\line { fingerings sound similar } 
				}
			}
		s4
		s4
		\MulFvThAlt
		s4
		\option
		s4
		\MulOnFoFv
		s4
		s4
		\or-sign-markup 
			\markup \italic 
			{  
				\center-column 
				{
					\line { indicates that two fingerings }
					\line { may be considered interchangeable }
				}
			}
		s4
		s4
		\MulOnFoSx
		s4
		\r-bracket
	}
}

layoutTechniques =
\layout
{ 
	\layoutSetup
	\context 
	{ 
		\Score 
		\override StaffSymbol.transparent = ##t 
		\override StaffSymbol.line-count = #1
		\override SpacingSpanner.strict-note-spacing = ##t
	} 
	\context { \Staff \remove "Clef_engraver" }
}

key-techniques-a = 
{
	\override TextScript.self-alignment-X = #0
	\override TextScript.extra-width = #'(+inf.0 . -inf.0)

	{
		s4. ^\markup \override #'(voffset . 2) \pressure-diagram #0
		s4. ^\markup \override #'(voffset . 2) \pressure-diagram #1
		s4. ^\markup \override #'(voffset . 2) \pressure-diagram #2
		   -\markup \italic { left to right - low to high air pressure }
		s4. ^\markup \override #'(voffset . 2) \pressure-diagram #3
		s4. ^\markup \override #'(voffset . 2) \pressure-diagram #4
	
		s2.

		s4 ^\markup \raise #2 \strong-lip-pressure
		   -\markup \italic { indicates strong lip pressure } 

		s1.

		s4 ^\markup \override #'(voffset . 2) \teeth-indicator
		    -\markup \italic { \center-column { \line { teeth tone } \line { produced by biting the reed } } }	}

		s1.

		s4 ^\markup \raise #3 \noiseBurst
		    -\markup \italic { \center-column { \line { noise burst } \line { produced using breath and/or tongue constriction } } }
}

key-techniques-b = 
{
	\override TextScript.self-alignment-X = #0
	\override TextScript.extra-width = #'(+inf.0 . -inf.0)

	{
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.25) \reed-diagram #0
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.25) \reed-diagram #0.25
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.25) \reed-diagram #0.5
		   -\markup \italic { \center-column { \line { left to right - reed position outwards to inwards } \line { (as indicated for normal reed contact) } } }
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.25) \reed-diagram #0.75
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.25) \reed-diagram #1

		s2

		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #0
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #0.2
		s8. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #0.4
		s8.
		   -\markup \italic { \center-column { \line { left to right - reed position outwards to inwards } \line { (as indicated for teeth tones) } } }
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #0.6
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #0.8
		s4. ^\markup \override #'(voffset . 2) \override #'(line-ratio . 0.06) \reed-diagram #1

		s1

		s4 ^\markup \raise #2 \timbral
		   -\markup \italic { \center-column { \line { timbral fingering } \line { (a significant deviation from normal tone production) } } }
	}
}

key-techniques-c =
{
	{
		\l-bracket
		\tie-custom { \smallNote ees'4 } #3.2 #0 #-0.3 ##f
			^\markup \pressure-diagram #2
		s8
		\MulOnThA
		\option
		\MulTwFoNn
		s16
		\tie-custom { \smallNote c''4 } #3.2 #-5.2 #0 ##f
			^\markup \pressure-diagram #0
			^\markup \translate #'(4 . 0) \oboe-trill-octave-fingering #3
		\tie-custom { \smallNote d'''4 } #3.2 #-5.2 #0 ##t
			^\markup \pressure-diagram #3
		\r-bracket
	}
}

key-insert =
{
	\insert-section "Example" \markup \repeat-range 1 3

	\l-bracket
}

key-plus =
{
	\optional-component

	\l-bracket
}

key-add-or =
{
	\add-or-component

	\l-bracket
}


% title-size 

#(define-markup-command (key-title layout props markup) (markup?)

	(interpret-markup layout props
	#{ 
		\markup 
		{
			\pad-markup #0.28
			\override #'(font-size . 4) 
			\bold #markup 
		} 
	#}
))

