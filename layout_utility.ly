
\include "notation_markup.ly"

% LAYOUT DEFITIONS

layoutSetup =
\layout
{
	indent = #26
	\context
	{
   		\Score
   		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/64)
		
		proportionalNotationDuration = #(ly:make-moment 1/4)
 		\override SpacingSpanner.uniform-stretching = ##t
 		
		\override BarLine.stencil = ##f
		\override BarNumber.stencil = ##f
	    \override Glissando.thickness = #3
  	}
	\context
	{
		\Staff
  		\remove "Time_signature_engraver"
   		\hide Stem
   	}
}

layoutNarrower =
\layout
{
	\layoutSetup
	\context
	{
   		\Score
		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/32)
	}
}

layoutNarrow =
\layout
{
	\layoutSetup
	\context
	{
   		\Score
		\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/16)
	}
}

layoutNoIndent =
\layout 
{
	\layoutSetup
 	indent = #0
}

layoutNarrowerNoIndent =
\layout 
{
	\layoutNarrower
 	indent = #0
}

layoutNarrowNoIndent =
\layout 
{
	\layoutNarrow
 	indent = #0
}

layoutEnd =
\layout
{
	\layoutNoIndent	
	\override Score.BarLine.stencil = #ly:bar-line::print
}

layoutDisplaceEnd =
\layout 
{
	\layoutNoIndent
	\context
	{
    	\Score
		proportionalNotationDuration = #(ly:make-moment 1/4)
 		\override SpacingSpanner.uniform-stretching = ##t
    }
	\context 
	{
		\Voice
		\consists "Duration_line_engraver"
		\override NoteHead.duration-log = 2
	}
}

layoutClusterOne =
\layout 
{
	\layoutNarrow 
	\context
	{
    	\Score
		\override SpacingSpanner.shortest-duration-space = 1.7 
	} 
} 


proportionalStrict =
\layout
{
	indent = #15
	#(layout-set-staff-size 14)
	\context
	{
    	\Score
		\override BarLine.stencil = ##f
		\override BarNumber.stencil = ##f
		\override Hairpin.height = #0.4
		\override Hairpin.bound-padding = #1.5

		proportionalNotationDuration = #(ly:make-moment 1/8)
		\override SpacingSpanner.shortest-duration-space = #1.4
 		\override SpacingSpanner.uniform-stretching = ##t
		\override SpacingSpanner.strict-note-spacing = ##t

	    \override Glissando.thickness = #1.5
    }
	\context
	{
		\Staff
	  	\remove "Time_signature_engraver"
	  	\remove "Staff_symbol_engraver"
	  	\remove "Clef_engraver"
		\override InstrumentName.self-alignment-X = 0.4
		\override InstrumentName.font-size = 1
    }
	\context
	{
		\Voice
	    \consists "Duration_line_engraver"
    	\omit Stem
	    \omit Flag
    	\omit Beam
    	\omit Dots
	    \override NoteHead.duration-log = 2
	}
}

proportionalStave =
\layout
{
	indent = #15
	#(layout-set-staff-size 13)
	\context
	{
    	\Score
		\override BarLine.stencil = ##f
		\override BarNumber.stencil = ##f
		\override Hairpin.height = #0.4
		\override Hairpin.bound-padding = #1.5

		proportionalNotationDuration = #(ly:make-moment 1/8)
		\override SpacingSpanner.shortest-duration-space = #2
 		\override SpacingSpanner.uniform-stretching = ##t
		\override SpacingSpanner.strict-note-spacing = ##t

	    \override Glissando.thickness = #1.5
    }
	\context
	{
		\Staff
	  	\remove "Time_signature_engraver"
		\override InstrumentName.self-alignment-X = 0.4
		\override InstrumentName.font-size = 1
    }
	\context
	{
		\Voice
	    \consists "Duration_line_engraver"
    	\omit Stem
	    \omit Flag
    	\omit Beam
    	\omit Dots
	    \override NoteHead.duration-log = 2
	}
}


proportionalOptions =
\layout
{
	indent = #7
	#(layout-set-staff-size 14)
	\context
	{
    	\Score
		\override BarLine.stencil = ##f
		\override BarNumber.stencil = ##f
		\override Hairpin.height = #0.4
		\override Hairpin.bound-padding = #1.5

		proportionalNotationDuration = #(ly:make-moment 1/8)
		\override SpacingSpanner.shortest-duration-space = #1.4
 		\override SpacingSpanner.uniform-stretching = ##t
		\override SpacingSpanner.strict-note-spacing = ##t

	    \override Glissando.thickness = #1.5
		\override StaffSymbol.transparent = ##t
    }
	\context
	{
		\Staff
	  	\remove "Time_signature_engraver"
	  	\remove "Clef_engraver"
		\override InstrumentName.self-alignment-X = 0.4
		\override InstrumentName.font-size = 1
    }
	\context
	{
		\Voice
	    \consists "Duration_line_engraver"
    	\omit Stem
	    \omit Flag
    	\omit Beam
    	\omit Dots
	    \override NoteHead.duration-log = 2
	}
}

layoutArrivalNarrow =
\layout 
{
	\proportionalStrict 
	\context
	{
    	\Score
		\override SpacingSpanner.shortest-duration-space = 1.2 
	} 
} 

layoutExtendNarrow =
\layout 
{
	\proportionalStrict 
	\context
	{
    	\Score
		\override SpacingSpanner.shortest-duration-space = 1.1 
	} 
} 

layoutDivisionNarrow =
\layout 
{
	\proportionalStrict 
	\context
	{
    	\Score
		\override SpacingSpanner.shortest-duration-space = 1.2 
	} 
} 

% LAYOUT FUNCTIONS

% Utilities for overlaying multiple markups

#(define (combine-markups markups)

	(if (= (length markups) 1)
	#{ \markup #markups #}
	#{ \markup \combine #(car markups) #(combine-markups (list-tail markups 1)) #} )
)

#(define-markup-command (overlay layout props markups) (markup-list?)

    (interpret-markup layout props
	(markup (combine-markups markups))))


#(define-markup-command (score-text layout props score layoutTweak text inset) (ly:music? ly:output-def? markup? number?)

    (interpret-markup layout props
	#{
		\markup
		{
			\column
			{
				\score
				{
					#layoutTweak
					#score
				}
				\override #'(staff-padding . 10)
				\line { \hspace #inset #text }
			}
		}
	#}))

#(define-markup-command (score-component layout props score layoutTweak textA textB hSpaceA hSpaceB vSpaceB) (ly:music? ly:output-def? markup? markup? number? number? number?)

(define text-placed (if (not (eq? vSpaceB 0)) #{ \markup \raise #vSpaceB  #textB #} #{ \markup \vcenter #textB #}))

    (interpret-markup layout props
	#{
		\markup
		{
			\score-text #score #layoutTweak #textA #hSpaceA
		
			\hspace #hSpaceB
			#text-placed
		}
	#}))

#(define-markup-command (hspace-normal layout props) ()

    (interpret-markup layout props
	#{
		\markup { \hspace #4 }
	#}))

#(define-markup-command (hspace-tight layout props) ()

    (interpret-markup layout props
	#{
		\markup { \hspace #3 }
	#}))

#(define-markup-command (hspace-form-link layout props) ()

    (interpret-markup layout props
	#{
		\markup { \hspace #2 }
	#}))

hspace-optional = \markup \hspace #18.5

#(define-markup-command (score-component-normal layout props score layoutTweak textA textB hSpaceA vSpaceB) (ly:music? ly:output-def? markup? markup? number? number?)

    (interpret-markup layout props
	#{
		\markup \score-component #score #layoutTweak #textA #textB #hSpaceA #4 #vSpaceB
	#}))

#(define-markup-command (score-component-tight layout props score layoutTweak textA textB hSpaceA vSpaceB) (ly:music? ly:output-def? markup? markup? number? number?)

    (interpret-markup layout props
	#{
		\markup \score-component #score #layoutTweak #textA #textB #hSpaceA #3 #vSpaceB
	#}))

#(define-markup-command (form-component layout props markup) (markup?)

    (interpret-markup layout props
	#{
		\markup
		{
			\override \textCSize
			\override #'(baseline-skip . 3)
			\box \pad-markup #2 #markup
		}
	#}))

#(define-markup-command (divider layout props height) (number?)

    (interpret-markup layout props
	#{
		\markup
		{
			\fill-line 
			{
				\combine
				\vcenter \vspace #height
				\draw-dashed-line #'(240 . 0)
				%\vcenter \path #0.3
				%#`((moveto 0 0)
     			%   (lineto 80 0))
			}
		}
	#}))