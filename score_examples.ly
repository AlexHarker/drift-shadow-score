
\include "notation.ly"
\include "layout_utility.ly"

% ARCHETYPES

#(define gliss-thick 0.2)

exampleSlowMeandering =
{
	\new Staff
	{
		\l-bracket

		e'2 \glissando \hide c''8
		s8

		\option

		c''2 \glissando \hide f'4
		s16

		\option-arrow

		\override TextScript.extra-offset = #'(2 . -5)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		a'1
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(lineto 3 2)
					(lineto 7 -2)
					(lineto 10 1)
					(lineto 12 -1))
			}
		s4

		\option-arrow

		\override TextScript.extra-offset = #'(1.5 . -4.7)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		g'1
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 1.25 2 2.5 2 3.5 0)
					(curveto 4.75 -2 6 -2 7 0)
					(curveto 7.5 0.5 8 1.5 8.5 0)
					(curveto 10 0 10.5 4 12.5 -0.25))
			}
		s4

		\r-bracket
	}
}

exampleOscillations =
{
	\new Staff
	{
		\l-bracket

		\override TextScript.extra-offset = #'(1.9 . -3.9)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		a'1
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 1 1.5 2 1.5 3 0)
					(curveto 4 -1.5 5 -1.5 6 0)
					(curveto 7 1.5 8 1.5 9 0)
					(curveto 10 -1.5 11 -1.5 12 0))
			}
		s4

		\option-arrow

		\override TextScript.extra-offset = #'(1.7 . -4.7)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		g'1
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				#'((moveto 0 0)
					(curveto 2 0.5 3 1.5 4.5 0)
					(curveto 5 -1.5 5.5 -1.5 6 0)
					(curveto 8 0.5 9 2 10.5 0)
					(curveto 11 -1.5 11.5 -1.5 12 0))
			}
		s4

		\option-arrow

		\override TextScript.extra-offset = #'(1.7 . -6.8)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		f'1.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 2.6 -0.2 2.8 5 3 0)
					(curveto 4 -1.5 5 -1.5 6 0)
					(curveto 8.6 -0.2 8.8 5 9 0)
					(curveto 10 -1.5 11 -1.5 12 0)
					(curveto 14.6 0.2 14.8 -5 15 0)
					(curveto 16.2 4 16.3 -0.1 20 0))
			}
		s4

		\r-bracket
	}
}

exampleScoops =
{
	\new Staff
	{
		\l-bracket

		\override TextScript.extra-offset = #'(1.8 . -2.8)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		a'4
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 1 1 2 1 3 0))
			}
		s4

		\override TextScript.extra-offset = #'(1.8 . -4)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		b'4.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 1 -1 2 -1 4 0.5))
			}
		s4
		s16

		\option-arrow

		\override TextScript.extra-offset = #'(1.3 . -3)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		g'4.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				#'((moveto 0 0)
					(curveto 0.5 1 1.5 1.5 3 0.5)
					(curveto 4 2 5.5 2.5 6 1))
			}
		s4

		\override TextScript.extra-offset = #'(1 . -5.8)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		g'2
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				#'((moveto 0 0)
					(curveto 1.33 -4 2.66 4 4 0.5)
					(curveto 4.5 0 5 0 5.5 0))
			}
		s4

		\option-arrow

		\override TextScript.extra-offset = #'(1.7 . -8.8)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		f'2.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 0.5 -0.6 1 0.9 2 0)
					(curveto 2.5 -1.4 3 2.4 4 0)
					(curveto 4.5 -3 5.25 8 5.3 0)
					(curveto 5.75 -9.5 6 3.5 6.25 0)
					(curveto 6.75 -2.6 7.25 1.6 7.75 0)
					(curveto 8.75 -0.9 9.75 0.4 10.75 0))
			}
		s4

		\override TextScript.extra-offset = #'(1.7 . -3)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		b'2.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 2 1.5 4 1.5 5 0)
					(curveto 5.5 -2 6 2 6.5 0)
					(curveto 7 -1.6 8.5 2.4 9 0)
					(curveto 9.5 -1.5 10 1.6 10.5 0))
			}
		s4

		\r-bracket
	}
}

% UNFOLDING

exampleUnfoldingStatic =
\score
{
	\proportionalOptions

	\new Staff
	{
		\l-bracket

		g'1 \- s2
		\hide r4

		\option

		g'1\-
	    \teeny c''16
		g'2\- s8
		\teeny d'16
		g'2.\-
		\hide r4

		\option

		g'1\-
		\teeny c''16
		\teeny d'16
		g'2\- s8
		\teeny d'16
		\teeny c''16
		\teeny d'16
		g'2.\-
		\teeny c''16
		\teeny d'16

		\hide r4
		\r-bracket
	}
}

exampleUnfoldingUnderblow =
\score
{
	\layout
	{
		\proportionalOptions
		indent = #15
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		g'1\-
			^\markup \pressure-diagram #3
			^\markup
			{
				\override #'(filled . #f) \path #0.2				 #'((moveto 0 0)
					(lineto 10 0)
					(curveto 13 -1.5 15 -1.5 18 0)
					(lineto 22 0)
					(curveto 26 -2 29 -3 31 0)
					(lineto 32 0))
			}
		s1
			^\markup \pressure-diagram #2
		s2
			^\markup \pressure-diagram #1
		\hide r8 \breathMark \hide r32

		e'1.\-
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(lineto 8 0)
					(curveto 11 -1.5 13 -1.5 15 0)
					(lineto 17 0)
					(curveto 19 -2 22 -2 24 0)
					(lineto 32 0)
					(curveto 35 -4.5 37 -2.5 43 0)
					(lineto 47 0))
			}
			^\markup \raise #4 \italic sim.
		s1 s2 s1 \hide r8 \breathMark
	}
}

dashedDurationBreak =
{
	\once \override DurationLine.color = #(x11-color 'grey80)
	\once \hide NoteHead
}

dashedDurationArticulate =
{
	\dashedDurationBreak
    \once \override DurationLine.bound-details.left.padding = -0.6
}


dashedDurationStart =
{
	\dashedDurationBreak
	\once \override DurationLine.bound-details.right.padding = -1
}

dashedDuration =
{
	\dashedDurationBreak
    \once \override DurationLine.bound-details.left.padding = -1.6
	\once \override DurationLine.bound-details.right.padding = -1
}

extendDuration =
{
	\once \override DurationLine.bound-details.right.padding = -1
}

extendDurationMore =
{
	\once \override DurationLine.bound-details.right.padding = -3
}

exampleOriginFocusRearticulate =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				f'''2 \-

				f'''4. \- f'''4 \- f''' \- f''' \- f''' \- f'''4. \- s2
				\once \override DurationLine.bound-details.right.padding = 0.15
				f'''8. \-

				\hide r4.

				f'''2 \-
				\dashedDuration  f'''2 \-
				\once \hide NoteHead f'''2 \-
				f'''4 \- f'''4 \- 
				\once \override DurationLine.bound-details.right.padding = 0.9
				f'''4 \- s2
				\hide r4
			}
		}

		\new Voice
		{
			\voiceTwo
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\hide r2. \hide r1 \hide r1 \hide r8 \hide r4..

				c''2 \-
				c''4 \- c''4 \- s2
				\dashedDuration c''2. \-
				\once \override DurationLine.bound-details.right.padding = 0.9
				\once \hide NoteHead c''4 \- s4 \hide r4
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				%<c'' b'' c''' a'''>
				<c'' b'' a'''>2 \-
				\dashedDuration <c'' b'' a'''>8 \-
				\once \hide NoteHead <c'' b'' a'''>4 \-
				\dashedDuration <c'' b'' a'''>2 \- s2..
				\once \hide NoteHead <c''b'' a'''>2 \-
				\dashedDuration <c'' b'' a'''>8 \-

				\hide r4..

				%<g'' b'' c''' b'''>
				<g'' b'' b'''>2 \-
				\dashedDuration <g'' b'' b'''>2 \-				\once \hide NoteHead <g'' b'' b'''>2 \-
				\dashedDuration <g'' b'' b'''>2. \-				\once \hide NoteHead <g'' b'' b'''>2 \-
			}
		}
	>>
}

exampleGlissesSlow =
\score
{
	\proportionalOptions
	\exampleSlowMeandering
}

exampleGlissesOscillations =
\score
{
	\proportionalOptions
	\exampleOscillations
}

exampleGlissesScoops =
\score
{
	\proportionalOptions
	\exampleScoops
}

beamS =
{
    \set stemLeftBeamCount = #0
	\set stemRightBeamCount = #1
}

beam =
{
    \set stemLeftBeamCount = #1
	\set stemRightBeamCount = #1
}

beamE =
{
    \set stemLeftBeamCount = #1
	\set stemRightBeamCount = #0
}

exampleMicrotones =
\score
{
	\layout
	{
		\proportionalOptions
		\revert Voice.Stem.stencil
		\revert Voice.Beam.stencil
	}

	\new Staff
	{
		\l-bracket

		\stemUp

		\modalTranspose b g { c d e f g a b }
		{
			\relative
			{
				\normalsize b'1 \-
				\override Stem.transparent = ##f
				\teeny \beamS d16 [ \beam b \beam a \beam d \beam b \beam a \beamE b ]
				\once \hide Stem \normalsize c2. \-
				\teeny \beamS a16 [ \beam d \beam c \beam b \beamE a ]
				\once \hide Stem \normalsize d2 \-
				\teeny \beamS c16 [ \beam d \beam c \beam b \beam a \beam b \beamE d ]
			}

			s4

			\option

			\teeny \relative
			{
				\beamS b'16 [ \beam c \beam a b8 d
				d8.  b  a \beam d16 \beam a \beam b \beam c
				b8.  d  c8 s8 b8 a  \beam c16 \beamE d ]
			}

			s4

			\option

			\teeny \relative
			{
				\beamS a'32 [ \beam d \beam c \beam b16 \beam a
				\beam d16.\beam b \beam a \beam d32 \beam b \beam a \beam b
				\beam c16 \beam d \beam c8 \beam b16 \beam a \beam b \beamE d ]
			}

			s4
		}
		\r-bracket
	}
}

exampleUnfoldingFormA =
\score
{
	\layout
	{
		\proportionalOptions
		\override Score.BarLine.stencil = #ly:bar-line::print
		indent = #12
		#(layout-set-staff-size 15)
	}

	\new Staff \with { instrumentName =
		\markup
		\override #'(font-name . "Arial Bold")
		\override #'(font-size . 1)
		\concat
		{
			x \hspace #0.9 \repeat-range 8 16 }
		}
	<<

		\new Voice
		{
			s4

			\time 20/4

			\repeat volta 2
			{
				b'1.\-
					^\markup \italic {  stable/liminal }
					^\markup \italic {  \time-bracket-range 4 12 #56 }
				s2
				\hide r4
					^\markup \translate #'(3.2 . 0 ) \italic {  dissolve/unstable }
				\override TextScript.extra-offset = #'(0 . -5.6)
				\override TextScript.Y-extent = #'(-1 . -0.9)
				\hide r1.
					^\markup
					{
						\override #'(filled . #f) \path #0.4
						 #'((moveto 0 0)
							(curveto 1 0.5 2 0.5 3 0)
							(curveto 4 -0.5 5 -0.5 6 0)
							(curveto 7 0.5 8 0.5 9 0)
							(curveto 10 -0.5 11 -0.5 12 0)
							(curveto 13 -0.5 14 -0.5 15 0)
							(curveto 16 0.5 17 0.5 18 0)
							(curveto 19 -0.5 20 -0.5 21 0))
					}
				\revert TextScript.extra-offset
				\revert TextScript.Y-extent
				s4 s4 s4 \breathMark s4
			}
		}
		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			s4 { s16 s1 \< s16 \> s2. s8 \! s8 }
		}
	>>
}

exampleUnfoldingFormB =
\score
{
	\layout
	{
		\proportionalOptions
		indent = #12
		#(layout-set-staff-size 15)
	}

	\new Staff \with { instrumentName = \optional-add }
	{
		\parenthesis ##f #0

		s16 ^\markup \pad-markup #2 \italic "focused/obsessive episodes"

		\revert Voice.Stem.stencil
		\revert Voice.Beam.stencil
		\stemUp
		\teeny \relative
		{
			\beamS a'32 [ \beam d \beam c \beam b16 \beam a
			\beam d16.\beam b \beam a \beam d32 \beam b \beam a \beam b
			\beam c16 \beam d \beam c8 \beam b16 \beam a \beam b \beamE d ]
		}
		s4

		\override Voice.Stem.stencil = ##f
		\override Voice.Beam.stencil = ##f

		\option

		\override TextScript.extra-offset = #'(1.7 . -4.8)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		b'1.
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 2.6 -0.2 2.8 5 3 0)
					(curveto 4 -1.5 5 -1.5 6 0)
					(curveto 8.6 -0.2 8.8 5 9 0)
					(curveto 10 -1.5 11 -1.5 12 0)
					(curveto 14.6 0.2 14.8 -5 15 0)
					(curveto 16.2 4 16.3 -0.1 20 0))
			}
			\hide \glissando \hide f'4
		s4

		\revert TextScript.extra-offset
		\revert TextScript.Y-extent

		\option

		g'1\-
			^\markup \pressure-diagram #3
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(lineto 10 0)
					(curveto 13 -1.5 15 -1.5 18 0)
					(lineto 22 0)
					(curveto 26 -2 29 -3 31 0)
					(lineto 32 0))
			}
		s1
			^\markup \pressure-diagram #2
		s2
			^\markup \pressure-diagram #1
		\hide r8

		\parenthesis ##t #0
	}
}


% ORIGIN

exampleOriginSwells =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\override TextScript.Y-offset = #2
			b'1\-
				^\markup {  \time-bracket-range 1 6 #16 }
			s4 \hide r8
			b'1\- s4 \hide r8
			b'1\-
				^\markup \italic { vary speed over time ad lib. }
			s4 \hide r8
			b'1\- s2 \hide r8
			b'1\- s1 \hide r8

		}
		\new Voice
		{
			\offset Y-offset #-2 Hairpin

			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 s8 \> s8 s2 s16 \! s8 }
			{ s16 s2.\< s8 s8 \>  s2. s8 s16 \! s8 }
		}
	>>
}

exampleOriginSelection =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				f'''2 \-
				\hide r2
				\once \hide NoteHead f'''1 \- s4 s8.
				\hide r16
				s4
				s2
				s16

				f'''1. \- s1 s4
			}
		}

		\new Voice
		{
			\voiceTwo
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				c''1. \-
				\hide r2.
				\once \hide NoteHead c''2 \-
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				%<g'' b'' c''' b'''>
				<g'' b'' b'''>2 \-
				\hide r2
				\once \hide NoteHead <g'' b'' b'''>2 \-
				\hide r2.
				\once \hide NoteHead <g'' b'' b'''>8. \-
				\hide r4 s16

				\shiftOn

				s2
				s16

				%<c'' b'' c''' g'''>
				<c'' b'' g'''>2 \-
				\hide r8
				\once \hide NoteHead <c'' b'' g'''>4 \-
				\hide r4
				\once \hide NoteHead <c'' b'' g'''>4. \-
				\hide r2.
				\once \hide NoteHead <c'' b'' g'''>2 \-
			}
		}
	>>
}

exampleOriginMiniLoops =
\score
{
	\layout
	{
		\proportionalOptions
		\override Score.BarLine.stencil = #ly:bar-line::print
		indent = #15
	}

	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			s4

			\time 19/4

			\repeat volta 2
			{
				g'2.\-
					^\markup \raise #4 {  \time-bracket-range 1 2 #60 }
				\teeny d''16
				\teeny c'16
				g'4\- s8
				\teeny d'16
				\teeny c''16
				\teeny d'16
				g'4.\-

				\hide r4

				d''1 \-
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
					 #'((moveto 0 0)
						(lineto 8 0)
						(curveto 11 -1.5 13 -1.5 15 0)
						(lineto 17 0)
						(curveto 19 -2 22 -2 24 0)
						(lineto 26 0))
				}
				s1

				\hide r4 \breathMark s4
			}
		}
		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			s4 { s16 s \< s2 \> s4 \! s8 s1 s4 s2 \< s1. \> s4 \! s8 }
		}
	>>
}

% GROUND

exampleGroundDabs =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		f'4 \- \spacerRest
		f''4 \- \spacerRest
		f''16. \- \hide r4
		f'4. \-
	}
}

exampleGroundDissolve =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		<< { 
		
			\override TextScript.extra-offset = #'(1.7 . -3.1)
			f'1. \>
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
					 #'((moveto 0 0)
						(curveto 1.25 1 3.5 1 5.5 0)
						(curveto 6.75 -1 8 -1 10 0)
						(curveto 11.1 0.25 12 0.75 12.5 0)
						(curveto 14 0 15.5 2 21.5 -0.25))
				}
	
			%f'1. \glissando 
			\hide b'4	
		}

		\new Voice
		{
			\hide r2
			\hide a'4 ^\markup \noiseBurst
			\hide b'8 ^\markup \noiseBurst
			\hide d''16 ^\markup \noiseBurst
			\hide g'4 ^\markup \noiseBurst
			\override TextScript.extra-offset = #'(0 . 1)
			\hide c''4
				^\markup
				{
					\override #'(filled . #f) \path #0.2
					#'((moveto 0 0)
						(curveto 2 -0.5 4 -0.5 5 0)
						(curveto 6  0.5 7.6  0.5 8.1 0)
						(curveto 8.7 -0.8 9.6 -0.2 10 0)
					   	(curveto 11.1 -0.6 12.0 -0.1 14 0)
					  (moveto 1 -1.4)
						(curveto 3 -0.3 4.5 1.5 4.7 0.2)
						(curveto 5.4 -0.3 6.7 -0.5 7.9 -0.2)
						(curveto 10.2 0.2 12.5 0.6 13.4 0.3))
				}
		}
		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			s4 { s4 \> s1 s4 \! }
		}
		>>
	}
}

% PUSH


examplePushRearticulate =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
 			b'4\-
				^\markup \pad-markup #1 \italic { \line { vary speed/angularity ad lib. } }
			\hide r16
			b'4\-
			b'4\-
			b'4.\- \hide r16
			b'4\- \hide r16
			b'8.\- s4 \hide r16

		}

		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			{ s16 s16 \< s16 \> s16 \! s16 }
			{ s16 s16 \< s16 \> s16 \! s16 }
			\override TextScript.extra-offset = #'(0 . 1)
			s16 -\markup \italic \vcenter { / articulate }
		}
	>>
}

examplePushRearticulateFocus =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
 				b''4.\-
					^\markup \pad-markup #1 \italic { \line { (as above) } }
				s16
				d'''4\- s16
				d''8.\- s4 s16
				g'''4.\- s16
				d'''4\- s16
				g'''16\- s16
				d''8.\- s4
				\hide r16
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\dashedDurationArticulate <d'' d''' g'''>4.\- s16
				\dashedDurationArticulate <d'' b'' g'''>4\- s16
				\dashedDurationArticulate <d''' b'' g'''>8.\- s4 s16
				\dashedDurationArticulate <d'' b'' d'''>4.\- s16
				\dashedDurationArticulate <d'' b'' g'''>4\- s16
				\dashedDurationArticulate <d'' b'' d'''>16\- s16
				\dashedDurationArticulate <b'' d''' g'''>8.\- s4
				\hide r16
			}
		}
	>>
}

examplePushUpward =
\score
{
	\proportionalOptions

	\new Staff
	{
		\l-bracket

		<< {
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				d''2 \-
				\extendDuration b''4 \-
				\extendDuration \once \hide NoteHead d''4 \-
				\extendDuration \once \hide NoteHead d'''8. \-
				\extendDuration \once \hide NoteHead g'''2 \-
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\hide r2
				\dashedDuration <d'' d''' g'''>4 \-
				\dashedDuration <b'' d''' g'''>4 \-				\dashedDuration <d'' b'' g'''>8. \-
				\hide r2
			}
		} >>

		\oneVoice
		\hide r4.
		\option

		<< {
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\extendDuration d'''4 \-
				\extendDuration \once \hide NoteHead d''8. \-
				\once \hide NoteHead g'''8 \- s2
			}
		}

\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				s4
				\dashedDuration <b'' d''' g'''>8. \-
				\dashedDuration <d'' b'' d'''>8 \-
				\hide r2
			}
		} >>

		\oneVoice
		\hide r4
		\r-bracket
	}
}

% DISPLACE

exampleDisplaceSlow =
\score
{
	\layout
	{
		\proportionalOptions
		\context
		{
    		\Score
			\override NoteHead.transparent = ##t
		}
	}
	\exampleSlowMeandering
}

exampleDisplaceOscillations =
\score
{
	\layout
	{
		\proportionalOptions
		\context
		{
    		\Score
			\override NoteHead.transparent = ##t
		}
	}
	\exampleOscillations
}

exampleDisplaceScoops =
\score
{
	\layout
	{
		\proportionalOptions
		\context
		{
    		\Score
			\override NoteHead.transparent = ##t
		}
	}
	\exampleScoops
}

% ARRIVAL

breakingTrill =
\markup
{
	\center-align \concat
	{
		\vcenter \parenthesis-markup #0 ##f
		\hspace #0.5
		\vcenter \trillSign
		\hspace #0.5
		\vcenter \parenthesis-markup #0 ##t
	}
}

exampleArrivalSingles =
\score
{
	\layout
	{
		\proportionalStave
	
		\context
		{
    		\Score
			\override SpacingSpanner.shortest-duration-space = #1.8
		}
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		e''!2 \- \spacerRest
		c''!4 \- \spacerRest
		e''!8 \-
		c''2 \- \spacerRest
		d'''1 \- ^\markup
		{
			\breakingTrill
			\override #'(filled . #f) \path #0.2
				#'((moveto 0 0)
					(curveto 2 0.3 3.5 -0.5 4 0)
					(curveto 4.5 0.7 5 -1.4 5.5 0)
					(curveto 6 2.1 6.75 -4.0 7.5 1.7)
					(curveto 8.25 -4.0 9 2.1 9.5 0)
					(curveto 10 -1.4 10.5 0.7 11 0)
					(curveto 12.5 -0.5 14 0.3 16 0))
		}
		\hide r8. \breathMark
		e''2 \- ^\markup { \breakingTrill \vcenter etc. } \spacerRest
		d'''4 \- ^\markup \breakingTrill \spacerRest
		c''2 \-
		\hide r8
		e''1 \- ^\markup \breakingTrill
	}
}

exampleArrivalRapidPitchFocus =
\score
{
	\layoutArrivalNarrow

	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\extendDuration e''2 \-
					^\markup { \time-bracket-range ½ 2 #23 }
				\extendDuration \hide NoteHead d'''8. \-
				\extendDuration e''8. \-
				\extendDuration c''4 \-
				\extendDuration d'''16 \-
				\extendDuration a'''4. \-
				\extendDuration d'''4 \-
				\override TextScript.extra-offset = #'(0 . 5)
				\hide r8 s8 \breathMark s2

				\once \override NoteHead.transparent = ##f

				\extendDuration d'''2. \-
				\extendDuration a'''4. \-
				\extendDuration f''4 \-
				\extendDuration c''4. \-
				\extendDuration f''2 \-
				\override TextScript.extra-offset = #'(0 . 3.5)
				\hide r8 s8 \breathMark s2.

				\once \override NoteHead.transparent = ##f
				\extendDuration a'''4 \-
				\extendDuration d''''8. \-
				\extendDuration d'''16 \-
				\extendDuration c''16 \-
				\extendDuration e''8. \-
				\extendDuration d'''4 \-
				\extendDuration c''4 \-

				\hide r4
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\offset Y-offset #-4 Hairpin

			\modalTranspose b'' b' { c d e f g a b }
			{
				\dashedDurationStart <c'' d''' a''' d''''>2 \-
				\dashedDuration <c'' e'' a''' d''''>8. \- \<
				\dashedDuration <c'' d''' a''' d''''>8. \-
				\dashedDuration <e'' d''' a''' d''''>4\- \>
				\dashedDuration <c'' e'' a''' d''''>16 \-
				\dashedDuration <c'' e'' d''' d''''>4. \- \<
				\dashedDuration <c'' e'' a''' d''''>4 \- \>
				\hide r4 \! s2

				\dashedDurationStart <c'' f'' a'''>2. \- \>
				\dashedDuration <c'' f'' d'''>4. \-
				\dashedDuration <c'' d''' a'''>4 \-
				\dashedDuration <f'' d''' a'''>4.\- \<
				\dashedDuration <c'' d''' a'''>2 \-
				\hide r4 \! s2.

				\dashedDurationStart <c'' e'' d''' d''''>4 \- \<
				\dashedDuration <c'' e'' d''' a'''>8. \-
				\dashedDuration <c'' e'' a''' d''''>16 \- \>
				\dashedDuration <e'' d''' a''' d''''>16 \-
				\dashedDuration <c'' d''' a''' d''''>8. \- \<
				\dashedDuration <c'' e'' a''' d''''>4 \- \>
				\dashedDuration <e'' d''' a''' d''''>4 \-
				\hide r4 \!
			}
		}
	>>
}

exampleArrivalClouds =
\score
{
	\layout
	{
		\proportionalStrict
		indent = #8

		\context
		{
    		\Score
			\override SpacingSpanner.shortest-duration-space = #1.3
		}
	}

	\new Staff
	{
		\l-bracket
		\override TextScript.extra-offset = #'(0 . -3.5)
		\override TextScript.Y-extent = #'(-1 . -0.9)
		\hide b'1
			^\markup
			{
				\overlay
				{
					\override #'(filled . #f) \path #0.2
					#'((moveto 0 0)
						(curveto 4 0.9 8 -0.6 12 1.6)
					  (moveto 0.5 -1.0)
						(curveto 5 -5.0 8 -2.2 13 -2.9)
					  (moveto 3 -0.4)
					  	(curveto 9 -3.4 10 -4.6 17 -3.3)
					  (moveto 6.3 1.4)
					  	(curveto 9 -4.4 11.4 3.6 18 2.3)
					  (moveto 12.3 -0.8)
					  	(curveto 19.4 -2.4 20.4 2.1 27 -0.3)
					  (moveto 14.3 -1.8)
						(curveto 16.4 1.4 18.4 -1.4 24 -3.3)
					  (moveto 18.1 0.8)
						(curveto 23.1 3.4 28.4 -5.4 33.1 0.3)
					  (moveto 22.1 -2)
						(curveto 28.5 -3.4 29.4 -0.6 34.9 -3.4)
						(curveto 38.1 -4.6 40.4 -0.6 44.3 -3.4)
				      (moveto 20 -4)
						(curveto 21 -2.5 24 -2.5 28.9 -4)
						(curveto 32 -5.5 33 -5.5 35.4 -4)
						(curveto 37 -2.5 37.5 -2.5 38 -4)
					   	(curveto 40 -5.5 41.3 -5.5 45 -4)
					  (moveto 28 -1.4)
						(curveto 32 -0.3 42 1.5 44.9 0.2)
						(curveto 48 -0.3 51 -0.5 54.4 -0.2)
						(curveto 56 0.2 59.5 0.6 62 0.3)
					  (moveto 45 -2.7)
						(curveto 48 -1.2 58 -2.9 65 -1.9))

				}
			}
		s1 s1 s1 s1. s8

		\option-base \markup {} \markup {} #3.25

		\override TextScript.extra-offset = #'(0 . -3)
		\override TextScript.Y-extent = #'(-1 . -0.9)

		s8
		\hide b'16
			^\markup \noiseBurst
		\hide d'16
			^\markup \noiseBurst
		s2
		\hide e''4
			^\markup \noiseBurst
		\hide f'16.
			^\markup \noiseBurst
		s4
		\hide d'8.
			^\markup \noiseBurst
		\hide d'8 s16
			^\markup \noiseBurst
		\hide f''4.
			^\markup \noiseBurst

		\r-bracket
	}
}

exampleArrivalExtendA =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		a'1\- \hide r8 \breathMark \hide r32
		c''1.\- \hide r8 \breathMark
	}
}

exampleArrivalExtendB =
\score
{
	\layoutArrivalNarrow


	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\extendDuration g''1. \- s4
					^\markup {  \time-bracket-range 1 4 #27.4 }
				\extendDuration \hide NoteHead g'4 \-
				\extendDuration b''2 \-
				\extendDuration d'''8. \-
				\extendDuration g'''4 \-
				\extendDuration b'''4 \-
				\extendDuration g''4. \-
				\extendDuration g'4 \-
				\hide r4
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				<g' b'' d''' g''' b'''>1. \-
				\dashedDuration <g' b'' d''' g''' b'''>4 \-
				\dashedDuration <g'' b'' d''' g''' b'''>4 \-
				\dashedDuration <g' g'' d''' g''' b'''>2 \-
				\dashedDuration <g' g'' b'' g''' b'''>8. \-
				\dashedDuration <g' g'' b'' d''' b'''>4\-
				\dashedDuration <g' g'' b'' d''' g'''>4 \-
				\dashedDuration <g' b'' d''' g''' b'''>4. \-
				\dashedDuration <g'' b'' d''' g''' b'''>4 \-
				\hide r4
			}
		}
	>>
}

% CLUSTER ONE

exampleClusterOneA =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		g'1\- ^\markup { \raise #4 \cTw } \spacerRest
		c''2.\- ^\markup { \raise #4 \cTh } \spacerRest
		g'1\- ^\markup { \raise #4 \cTw } s8 \spacerRest
		c''2\- ^\markup { \raise #4 \cTh } \spacerRest
		g'2.\- ^\markup { \raise #4 \cTw } \spacerRest
		f''2\- ^\markup { \raise #4 \cOn } \spacerRest
		c''2\- ^\markup { \raise #4 \cTh } \spacerRest
		d'2\- ^\markup { \raise #4 \cFo } s8 \spacerRest
	}
}

exampleClusterOneB =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		c''1.\- s1 \hide r8 \breathMark \hide r32
		a'1.\- s4 \hide r8 \breathMark
	}
}

exampleClusterOneC =
\score
{
	\proportionalOptions

	\new Staff
	{
		\bracket ##f #7.5
		%\l-bracket
		s8
		<<
		{
			\shiftOff

		   	\override NoteHead.no-ledgers = ##t
			\override TextScript.extra-offset = #'(0 . -0.8)
			a'''1 \- \hide r2
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
					 #'((moveto 0 0)
						(curveto 2 -0.5 3 0.8 4.5 -0.5)
						(curveto 5.5 -1.2 6 2 8.5 -1))
				}
			\revert TextScript.extra-offset

		}
		\new Voice
		{
			\shiftOn
			\override NoteHead.no-ledgers = ##t
			<e' f'' b'' c''' e''' b'''>2 \- \hide r2
		} >>

		\oneVoice
		\hide r4

		\option-base \markup {} \markup {} #6.25
%		\option

		d'2. \- ^\markup \timbral
		\hide r4

		\option-base \markup {} \markup {} #6.25
%		\option

		g'''1.
			^\markup \override #'(voffset . 5) \teeth-indicator
			^\markup
			{
				\raise #3
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 2 0)
					(lineto 5 0)
					(curveto 6 1.5 8 1.5 9 0)
					(curveto 9.5 -1.5 10 2 10.5 0)
					(curveto 11 -1.6 12.5 2.4 13.5 0)
					(curveto 14.5 -1.5 15.8 1.6 16.5 0))
			}
		e'''1
			^\markup \override #'(voffset . 3) \teeth-indicator
			^\markup
			{
				\raise #1
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 2 0)
					(curveto 4 -0.5 5 1.5 7 1)
					(curveto 8.5 -1.5 10.8 1.6 11.5 -2))
			}
		\hide r8

		\bracket ##t #7.5
%		\r-bracket
	}
}

% CLUSTER TWO

exampleClusterTwoA =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\voiceOne
			\override TextScript.extra-offset = #'(0 . 2)
			d''1\-
				^\markup {  \time-bracket-range 1 2 #18 } s4.
			\hide r8
			e''1\- s4
			\hide r8.
			g'2.\- s8 \hide r8
			a'2.\-
			e''2\- -> s32 \hide r64 \breathMark \hide r64
			d''1.\- s4 \hide r32
		}
		\new Voice
		{
			\offset Y-offset #-2 Hairpin

			{ s16 s2 \< s8. s16 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 s16 \> s4.. s16 \! s8. }
			{ s16 s4 \< s8. s16 \> s4 s16 \! s8 }
			{ s16 s4 \< s16 s16 \> s4 s16 \! }
			{ s2 s32 s32 }
			{ s16 s2. \< s8 \> s2. s16 \! s8 }
		}
	>>
}

exampleClusterTwoB =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\voiceOne %^\markup{ c. 2-8 }
			%\override TextScript.extra-offset = #'(0 . 2)
			b'1.\-
				^\markup { \time-bracket-range 2 8 #30 } s2.
			%\revert TextScript.extra-offset
			\hide r8 \breathMark \hide r64
			c''1.\- s1.
			\hide r8 \breathMark \hide r2
			a'1.\- s4
			\hide r8 \breathMark
		}
		\new Voice
		{
			\offset Y-offset #-2 Hairpin
			{ s16 s1 \< s8 \> s1 s16 \! s8 s64 }
			{ s16 s1 \< s4. s8 \> s1 s4. s16 \! s8 s2 }
			{ s16 s2. \< s8 \> s2. s16 \! s8 }
		}
	>>
}

% DIVISION

exampleDivisionStatement =
\score
{
	\layout
	{
		\proportionalStrict
		indent = #6
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		c'2\- ^\markup {  \time-bracket-range 4 12 #36.5 } \spacerRest
		e''2.\- s8 \spacerRest
		b1\- s4 \hide r4
	}
}

exampleDivisionDissolve =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		<<
		{
			\override TextScript.extra-offset = #'(2 . -2.3)
			f'1
			^\markup
			{
  				\override #'(filled . #f) \path #gliss-thick
				#'((moveto 0 0)
					(curveto 4 -0.1 15 1 19 2.6))
			}
			s1
			\revert TextScript.extra-offset
		}

		\new Voice
		{
			\hide r2
			\hide b'4. ^\markup \noiseBurst
			\hide g'8. ^\markup \noiseBurst
			\hide d''4 ^\markup \noiseBurst
			\hide f'16. ^\markup \noiseBurst
			\hide e''2 ^\markup \noiseBurst
			\override TextScript.extra-offset = #'(-2 . 3)
			\hide c''4
				^\markup
				{
					\override #'(filled . #f) \path #0.2
					#'((moveto 0 0)
						(curveto 2 -0.8 4 -0.6 5 0)
						(curveto 6  0.5 7.6  0.9 8.1 0)
						(curveto 8.7 -0.8 9.6 -0.2 10 0)
					   	(curveto 11.1 -0.6 12.0 -0.1 14 0)
					  (moveto 1 -1.4)
						(curveto 1 -0.3 4.5 1.5 4.7 0.2)
						(curveto 5.4 -0.3 6.7 -0.5 7.9 -0.2)
						(curveto 10.2 0.2 15.5 0.6 17.4 0.3))
				}
		}
		\new Voice
		{
			\offset Y-offset #-2 Hairpin

			s4 { s4 \> s1 s1 s4 \! }
		}
		>>
	}
}

exampleDivisionB =
\score
{
	\layoutDivisionNarrow

	\new Staff \with { instrumentName = \exampleHeading }
	{
		\override NoteHead.no-ledgers = ##t

		\extendDuration <d' d'' f'' b'' e''' f'''>4 \-
		\extendDurationMore \hide NoteHead  b''8. \-
		\extendDuration <d' d'' f'' b'' e''' f'''>4. \-
		\hide r2
		\once \override NoteHead.transparent = ##f
		\extendDuration a'''4 \-
		\extendDuration <c' d''' f''' a''' b'''>2 \-
		\extendDuration a'''4. \-
		\extendDuration <c' d''' f''' a''' b'''>8 \-
		\hide r2 s8
		\extendDuration <d' d'' f'' b'' e''' f'''>8. \-
		\extendDuration \hide NoteHead  b''4 \-
		\hide c''8
			^\markup \noiseBurst
		\extendDuration a'''4. \-
		\extendDuration <c' d''' f''' a''' b'''>4. \-
		\hide r4
		\hide e''4
			^\markup \noiseBurst
		\hide g''4
			^\markup \noiseBurst
	}
}

exampleDivisionC =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		a'2.\- ^\markup {  \time-bracket-range 2 6 #14.5 } s4 s8 \spacerRest \spacerRest
		g''2\-  s2 s2 \spacerRest \spacerRest
		d'2\- s2. \spacerRest
	}
}

% LOOPS

exampleLoopsGroundDissolve =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		<< { f'1. \- }

		\new Voice
		{
			\hide r4
			\hide d''2 ^\markup \noiseBurst
			\hide c''8 ^\markup \noiseBurst
			\hide a'16. ^\markup \noiseBurst
			\hide f''2 ^\markup \noiseBurst
			\hide g''8 ^\markup \noiseBurst
			\override TextScript.extra-offset = #'(0 . 1)
			\hide e''4
				^\markup
				{
					\override #'(filled . #f) \path #0.2
					#'((moveto 0 0)
						(curveto 2 -0.5 3 -0.9 4 0)
						(curveto 5.1  0.5 5.5  1.5 6.2 0)
						(curveto 7.7 -0.8 8.6 -1.2 9.2 0)
					   	(curveto 10.1 -0.6 11.0 -0.1 11.2 0)
					  (moveto 1 -1.4)
						(curveto 1 -0.3 1.5 1.5 2.7 0.2)
						(curveto 3.4 -0.3 4.7 -0.5 5.9 -0.2)
						(curveto 6.2 0.2 7.5 0.6 9.4 0.3))
				}
		}
		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			s4 { s4 \> s1 s4 \! }
		}
		>>
	}
}

exampleLoopsGroundGliss =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		<<
		{
			\override TextScript.extra-offset = #'(2 . -2)
			f'1
			^\markup
			{
  				\override #'(filled . #f) \path #gliss-thick
				#'((moveto 0 0)
					(curveto 7 -0.2 13 1 23 2.7))
			}
			s1
			\revert TextScript.extra-offset
		}

		\new Voice
		{
			\offset Y-offset #-2 Hairpin

			s4 { s4 \> s1 s4 \! }
		}
		>>
	}
}

exampleLoopsForm =
\score
{
	\layout
	{
		\proportionalStave
		\override Score.BarLine.stencil = #ly:bar-line::print
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		\time 1/16
		s16
		\time 11/4

		\repeat volta 2
		{
			<a' dih'' a'' c''' gesil''' aes''' a''' bel'''>8. \-
			\hide r32
			<cisel'' besil'' gesil''' besil''' bih'''>8. \-
			\hide r32
			<a' dih'' a'' c''' gesil''' aes''' a''' bel'''>4. \-
			\hide r2
			<cil'' b'' bih'' cil''' g''' bih''' c''''>8. \-
				^\markup \raise #4 \pressure-diagram #1
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
					 #'((moveto 0 0)
						(lineto 2 0)
						(curveto 3 3 4 2 6 0)
						(lineto 8 0)
						(curveto 8.5 1.5 9.5 1.5 10 0)
						(lineto 11 0))
				}
			s8.
				^\markup \raise #4 \pressure-diagram #3
			s4
			\hide r4.
			<cil'' bil'' cil''' gel''' gil'''>4.. \-
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
					 #'((moveto 0 0)
						(lineto 1 0)
						(curveto 2 1.6 3.6 1.5 4.3 0.5)
						(lineto 5 0.3)
						(curveto 7.1 2 8.6 3 9 0)
						(lineto 11 0))
			}
		}
	}
}

% PRESS

examplePressRearticulate =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
 				c''2 \- s16
					^\markup \pad-markup #1 \italic { \line { vary speed/angularity ad lib. } }
				g''1 \- s16
				b'''16. \- s16
				e'''8. \- s16
				b'''4 \- s16
				\extendDuration \once \hide NoteHead g''8 \- s16
				\hide r8
				e'''8 \- s2.
				\extendDuration \once \hide NoteHead c''4 \-
				\hide r16
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\dashedDurationArticulate <g'' e''' b'''>2 \- s16
				\dashedDurationArticulate <c'' e''' b'''>1 \- s16
				\dashedDurationArticulate <c'' g'' e'''>16.\- s16
				\dashedDurationArticulate <c'' g'' b'''>8.\- s16
				\dashedDurationStart <c'' g'' e'''>4 \- s16
				\dashedDuration <c'' e''' b'''>8 \- s16
				\hide r8 
				\dashedDurationStart <c'' g'' b'''>8 \- s2.
				\dashedDuration < g'' e''' b'''>4\-
				\hide r16
			}
		}
	>>
}

examplePressDissolve =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		\offset Y-offset #-1 Hairpin

		\override TextScript.extra-offset = #'(2 . -2)
		g'8 \>
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 1.25 1 2.5 1 3.5 0)
					(curveto 4.75 -1 6 -1 7 0)
					(curveto 7.5 0.25 8 0.75 8.5 0)
					(curveto 10 0 10.5 2 12.5 -0.25))
			}
		s8 s2..
		\override TextScript.extra-offset = #'(1 . -2.5)
		\hide a'4 
			^\markup \noiseBurst
			^\markup \center-align \line { \italic { use tongue/spit }}
		\override TextScript.extra-offset = #'(0.5 . -2.5)
		\hide f'2
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 3.25 1 4.5 -3 5.5 -0.7))
			}
		\hide e'4 
			^\markup \noiseBurst
		\override TextScript.extra-offset = #'(0 . -2.2)
		\hide f'2 
			^\markup
			{
				\override #'(filled . #f) \path #gliss-thick
				 #'((moveto 0 0)
					(curveto 3.25 -0.4 4.5 2 5.5 1.4))
			}
		\override TextScript.extra-offset = #'(0 . -1.2)
		\hide e'4 \! ^\markup \noiseBurst
	}
}

% EXTEND

exampleExtendStable =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		d''1. \- \hide r8 \breathMark \hide r32
		b'2. \- \hide r8 \breathMark \hide r32
		c''2. \- \hide r8 \breathMark
	}
}

exampleExtendRapidPitchSelection =
\score
{
	\layoutExtendNarrow

	\new Staff \with { instrumentName = \exampleHeading }
	{
		\modalTranspose b'' b' { c d e f g a b }
		{
			\extendDuration d''8. \-
				^\markup { \time-bracket-range ½ 2 #22 }
			\extendDuration \hide NoteHead b''16 \-
			\extendDuration d''8. \-
			\extendDuration <d'' b'' g''' c''''>4 \-
			\extendDuration c''''16. \-
			\extendDuration <d'' b'' g''' c''''>8. \-
			\extendDuration g'''8 \-
			\extendDuration c''''8. \-
			\extendDuration <d'' b'' g''' c''''>16 \-
			\extendDuration b''4 \-
			\override TextScript.extra-offset = #'(0 . 5)
			\hide r8 s8 \breathMark s2

			\once \override NoteHead.transparent = ##f

			\extendDuration b''4. \-
			\extendDurationMore g'''8. \-
			\extendDuration <d'' b'' d''' f''' g''' a'''>2 \-
			\extendDuration f'''16. \-
			\extendDuration <d'' b'' d''' f''' g'''>4. \-
			\override TextScript.extra-offset = #'(0 . 3.5)
			\hide r4
			\hide r8 \breathMark s8

			\once \override NoteHead.transparent = ##f

			\extendDuration b''16 \-
			\extendDuration <d'' b'' g''' c''''>4 \-
			\extendDuration g'''8. \-
			\extendDuration <d'' b'' g''' c''''>16 \-
			\extendDuration d''8. \-
			\hide r4
		}
	}
}

exampleExtendWavering =
\score
{
	\layoutArrivalNarrow


	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\extendDuration a''1. \- s4
					^\markup \raise #5 {  \time-bracket-range 2 6 #24.5 }
				\extendDuration \hide NoteHead f'''4 \-
				\hide r2
				\extendDuration f'''8. \-
				\extendDuration c'''4 \-
				\hide r4
				\extendDuration a''4. \-
				\hide r8
				s4.
					^\markup \center-align \line { \italic { use tongue/spit }}

				\once \override NoteHead.transparent = ##f
				\extendDuration c'''4 \-
				\extendDuration c''4 \-
				\hide r2
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				<c'' c''' f''' b'''>1. \-
				\dashedDuration <c'' c''' f''' b'''>4 \-
				\dashedDuration <c'' a'' c''' b'''>4 \-
				\extendDuration \hide NoteHead <c'' a'' c''' f''' b'''>2 \-
				\dashedDuration <c'' a'' c''' b'''>8. \-
				\dashedDuration <c'' a'' f''' b'''>4\-
				\extendDuration <c'' a'' c''' f''' b'''>4 \-
				\dashedDuration <c'' a'' c''' b'''>4. \-
				\override TextScript.extra-offset = #'(1 . -3.5)
				\hide r8 s4.
					^\markup \noiseBurst
				\dashedDurationStart <c'' a'' f''' b'''>4 \-
				\override TextScript.extra-offset = #'(2 . -3.5)
				\dashedDuration <a'' c''' b''' f'''>4 \-
				\hide r8 s4 ^\markup \noiseBurst
				\hide r4
			}
		}
	>>
}

% TRANSITION

exampleTransitionCresc =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		<<
		{
			d''1. \-
				^\markup \pad-markup #0.5
				{
					\override #'(filled . #f) \path #gliss-thick
				 	#'((moveto 0 0)
						(curveto 1  0.5 2  0.5 3 0)
						(curveto 5 -0.5 7 -0.5 8 0)
						(curveto 8.5 0.5 9  0.5 9.5 0)
						(curveto 10 -0.5 10.8 -0.5 11.2 0)
						(curveto 11.5 0.5 12 0.5 12.5 0)
						(curveto 13 -0.5 13.5 -0.5 13.8 0)
						(curveto 14.1  0.5 14.35 0.5 14.5 0)
						(curveto 14.75 -0.5 15 -0.5 15.25 0)
						(curveto 15.5 0.5 15.75 0.5 16. 0)
						(curveto 16.75 -0.5 17.5 -0.5 18.5 0))
				}
				^\markup \italic { \time-bracket-range 1 3 #19 }

			\hide r4 \breathMark \hide r32
			a'1 \-
				^\markup
				{
					\override #'(filled . #f) \path #gliss-thick
				 	#'((moveto 0 0)
						(curveto 0.25 -0.5 0.50 -0.5 0.75 0)
						(curveto 1.00  0.5 1.25  0.5 1.50 0)
						(curveto 1.75 -0.5 2.00 -0.5 2.25 0)
						(curveto 2.50  0.5 2.75  0.5 3.00 0)
						(curveto 3.2 -0.5 3.60 -0.5 3.90 0)
						(curveto 4.50  0.5 5.00  0.5 6.50 0)
						(curveto 7.00 -0.5 7.5   -0.5 8.0 0)
						(curveto 10 0.5 12.5 0.5 15 0)
						(curveto 17 -0.5 19 -0.5 21 0)
						(curveto 23 0.5 25 0.5 27 0))
				}
			s1 \hide r8 \breathMark \hide r32
		}

		\new Voice
		{
			\offset Y-offset #-1 Hairpin

			s8 s8 \< s1 s8 s8 \! s4 \hide s32
			s8 s8  \< s1. s8 s8 \!
		}
		>>
	}
}

exampleTransitionFlicker =
\score
{
	\layout
	{
		\proportionalOptions
		indent = #15
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		\extendDuration g'2. \- 
			^\markup \pressure-diagram #3					^\markup
			{
				\override #'(filled . #f) \path #0.2				 #'((moveto 0 0)
					(lineto 10 0)
					(curveto 13 -1.5 15 -1.5 18 0)
					(lineto 22 0))
			}
	 	\once \override DurationLine.style = #'zigzag
		\extendDuration \once \hide NoteHead g'4 \-  s4
		^\markup \pressure-diagram #2
		\extendDuration \once \hide NoteHead g'4. \-
		\hide r8 s8 \breathMark \hide r8.	
		\extendDuration e'8 \- 
			^\markup \italic \raise #4  { sim. }
			^\markup
			{
				\override #'(filled . #f) \path #0.2				 #'((moveto 0 0)
					(lineto 3 0)
					(curveto 6 -1.5 9 -1.5 12 0)
					(lineto 18 0))
			}
		\once \override DurationLine.style = #'zigzag
		\extendDuration \once \hide NoteHead e'2 \- s8.
		\extendDuration \once \hide NoteHead  e'2 \-
		\hide r8 s8 \breathMark \hide r32	
	}
}

% BLOCK ONE

exampleBlockOneStable =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		d''1 \-
			^\markup { \raise #4 \cTw }
			^\markup \italic { \time-bracket-range 2 4 #13 }
		\hide r8 \breathMark \hide r32
		b'2. \- ^\markup { \raise #4 \cFo } \hide r8 \breathMark \hide r32
		c''4. \- ^\markup { \raise #4 \cOn } \hide r8 \breathMark \hide r32
		b'2. \- ^\markup { \raise #4 \cFo } \hide r8 \breathMark \hide r32
		d''1 \- ^\markup { \raise #4 \cTw } \hide r8 \breathMark \hide r32
		e'1. \- ^\markup { \raise #4 \cFv } \hide r8 \breathMark \hide r32
		g'2. \- ^\markup { \raise #4 \cSv } \hide r8 \breathMark \hide r32
		e'2. \- ^\markup { \raise #4 \cFv } \hide r8 \breathMark
	}
}

exampleBlockOneObssessive =
\score
{
	\layout
	{
		\proportionalOptions
		indent = #15
		\context
		{
			\Score
			proportionalNotationDuration = #(ly:make-moment 1/16)
			\override SpacingSpanner.shortest-duration-space = #0.8
		}
	}

	\new Staff \with { instrumentName = \exampleHeading }
	{
		b'4 \-
			^\markup { \raise #1 \cTw }
			^\markup \italic { \time-bracket-range 1 2 #21 }
		b'16 \-
		b'16. \-
		b'16. \-
		d''2. \- ^\markup { \raise #1 \cFo }
		b'16 \-
		b'8 \-
 		d''4. \-
		c''4. \- ^\markup { \raise #1 \cOn }
		d''4 \-
		\hide r2
		d''2 \-
		\hide r8
		d''8 \-
		d''16 \-
		d''8 \-
		g'2. \- ^\markup { \raise #1 \cSv } \hide r8
		a'16 \- ^\markup { \raise #1 \cTh }
		a'8 \-
		a'16. \-
		a'16 \- \hide r8
		e'1 \- ^\markup { \raise #1 \cFv }

	}
}

% BLOCK TWO

exampleBlockTwoSustains =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	{
		b'1 \- s1 \hide r8 \breathMark \hide r32
		\once \override TrillSpanner.bound-details.left.text = ##f 
    	a'1~ \- \startTrillSpan s2. \hide r8 \stopTrillSpan \breathMark \hide r32
		e'2. \- s1 \hide r8 \breathMark
	}
}

exampleBlockTwoFocus =
\score
{
	\layoutArrivalNarrow


	\new Staff \with { instrumentName = \exampleHeading }
	<<

		\new Voice
		{
			\voiceOne
			\shiftOff

			\modalTranspose b'' b' { c d e f g a b }
			{
				\extendDuration f'''1. \-
				\extendDuration \hide NoteHead f'''4 \-
					^\markup {  \time-bracket-range 1 6 #28.5 }
				\extendDuration g'''2 \-
				\extendDuration c''''8. \-
				\extendDuration g'''4 \-
				\extendDuration f'''4. \-
				\extendDuration c'''4. \-
				\extendDuration b''8 \-
				\hide r2
				\once \override NoteHead.transparent = ##f
				\extendDuration c'''2 \-
				\extendDuration c'''4 \-
				\extendDuration f'''4. \-
				\extendDuration b'''2 \-
				\extendDuration f'''8. \- s4
				\hide r4 
			}
		}

		\new Voice
		{
			\voiceTwo
			\shiftOff
			\modalTranspose b'' b' { c d e f g a b }
			{
				s1.
				\dashedDuration	c'''4 \-
				\hide r1 s1 s1 s1 s8
			    \once \override DurationLine.bound-details.left.padding = 0.625
				\once \hide NoteHead c'''4 \-
				\hide r4
			}
		}

		\new Voice
		{
			\voiceThree
			\shiftOn
			\modalTranspose b'' b' { c d e f g a b }
			{
				<b' b'' c''' g''' c''''>1. \-
				\shiftOff
				\dashedDuration <b' b'' c''' g''' c''''>4 \-
				\dashedDuration <b' b'' c''' f''' c''''>2 \-
				\dashedDuration <b' b'' c''' f''' g'''>8. \-
				\dashedDuration <b' b'' c''' f''' c''''>4\-
				\dashedDuration <b' b'' c''' g''' c''''>4. \-
				\dashedDuration <b' b'' f''' g''' c''''>4. \-
				\dashedDuration <b' c''' f''' g''' c''''>8 \-
				\hide r2
				\shiftOn
				<c'' b'' f''' b'''>2 \-
				\shiftOff
				\dashedDuration <c'' b'' f''' b'''>4 \-
				\dashedDuration <c'' b'' c''' b'''>4. \-
				\dashedDuration <c'' b'' c''' f'''>2 \-
				\dashedDuration <c'' b'' c''' b'''>8. \-
				\extendDuration \once \hide NoteHead <c'' b'' c''' b'''>4\-
				\hide r4
			}
		}
	>>
}

exampleBlockTwoSwells =
\score
{
	\proportionalStrict

	\new Staff \with { instrumentName = \exampleHeading }
	<<
		\new Voice
		{
			\override TextScript.Y-offset = #2
			b'1\-
				^\markup {  \time-bracket-range 1 4 #16 }
			s4 \hide r8
			b'1\- s4 \hide r8
			b'1\-
				^\markup \italic { vary speed over time ad lib. }
			s4 \hide r8
			b'1\- s2 \hide r8

		}
		\new Voice
		{
			\offset Y-offset #-2 Hairpin

			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 \> s2 s16 \! s8 }
			{ s16 s2 \< s8 s8 \> s8 s2 s16 \! s8 }
		}
	>>
}

