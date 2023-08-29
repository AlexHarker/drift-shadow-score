
\include "notation.ly"
\include "layout_utility.ly"

% SCORE SECTIONS

% UNFOLDING

componentUnfoldingMain =
{
	\component Unfolding

	\time 11/4

	\l-bracket
	\tie-custom { \smallNote cis''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulFoEi
	\alt-sign-markup
		\markup { \override #'(offset . 0) \trill-gliss \trillSign "/ gliss" ##f }
	\MulFvThAlt
	\alt-sign
	\MulNnSv
	\tie-custom { \smallNote fis'''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #2
	\option
	\tie-custom { \smallNote c''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulOnThSv
	\alt-sign
	\MulOnZoNn
	\once \override TextScript.self-alignment-X = #0
	\once \override TextScript.extra-offset = #'(0.3 . 0)
	\tie-custom { \smallNote fisil'''4 } #3.2 #-5.2 #0.5 ##t
		^\markup { \hcenter-in #1 { \vcenter \pressure-diagram #2 \vcenter / \vcenter \pressure-diagram #3 } }
	\r-bracket
}

componentUnfoldingGlisses =
{
	\accidentalStyle dodecaphonic

	\l-bracket
	c''4 \glissando \circle-note cisel''4 \glissando d''4
	\option
	\parenthesize bes''4 \glissando \circle-note beh''4 \glissando b''4
	\option
	fih'''4  \glissando \circle-note fis'''4 \glissando g'''4
	\r-bracket
}

% ORIGIN

componentOriginMain =
{
	\section Origin \markup \repeat-min 6

	\time 11/4

	\l-bracket
	\tie-custom { \smallNote cis''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulFoEi
	\alt-sign-markup
		\markup { \override #'(offset . 0) \trill-gliss \trillSign "/ gliss" ##f }
	\MulFvThAlt
	\alt-sign
	\MulNnSv
	\tie-custom { \smallNote fis'''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #2
	\option
	\tie-custom { \smallNote c''4 } #3.2 #-0. #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulOnThSv
	\alt-sign
	\MulOnZoNn
	\once \override TextScript.self-alignment-X = #0
	\once \override TextScript.extra-offset = #'(0.3 . 0)
	\tie-custom { \smallNote fisil'''4 } #3.2 #-5.2 #0.5 ##t
		^\markup { \hcenter-in #1 { \vcenter \pressure-diagram #2 \vcenter / \vcenter \pressure-diagram #3 } }
	\r-bracket
}

componentOriginGlisses =
{
	\accidentalStyle dodecaphonic

	\l-bracket
	\parenthesize b'4 \glissando c''4 \glissando \circle-note cisel''4 \glissando d''4
	\option
	\parenthesize bes''4 \glissando \circle-note beh''4 \glissando b''4
	\option
	\parenthesize f'''4 \glissando fih'''4  \glissando \circle-note fis'''4 \glissando g'''4
	\r-bracket
}

% Displace

componentDisplace =
{
	\section Displace \markup \repeat-min 3

	\l-bracket
	\MulFoZo
	\option-arrow
	\MulFoSv
	\alt-sign-markup
		\markup { \override #'(offset . -1.3) \trill-gliss \trillSign "/ gliss" ##f }
	\MulFvTwAlt
	\alt-sign
	\MulThNn
	\tie-custom { \smallNote aih''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #3
	\option-arrow
	\MulOnOnEi
	\option-arrow
	\MulOnZoTh
	\r-bracket
}

componentDisplaceEnd =
{
	\accidentalStyle dodecaphonic

	\time 5/4

	\MulFvEiLine s
	\MulSvLine s 		% \MulThSvEiLine s (this was the replacement)

	\staveSpacer
}

% GROUND

componentGround =
{
	\section Ground \markup \repeat-min 1

	\l-bracket
	\MulThFvTh
	s8
	\option-markup
		\markup { \override #'(offset . 1) \trill-gliss \trillSign 		\override #'(baseline-skip . 2.2) \center-column { \line { occasional } \line { flickering } } ##t }
	\MulThFvFo
	\r-bracket
	s4
	fis'4
		^\markup \timbral
		^\markup \pressure-diagram #2
	fis''
		^\markup \timbral
		^\markup \pressure-diagram #3
}

% PUSH

componentPush =
{
	\section Push \markup \repeat-min 1


	\tie-custom { cisel'' 4 } #4.5 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	s8.
	\l-bracket
	\MulOnFoFo
	\option
	\MulOnFoFv
	\or-sign-markup \markup { \trill-gliss \trillSign rapid   ##f }
	\MulOnFoSx
	\r-bracket
	\tie-custom { g''' 4 } #4.5 #-7 #0.5 ##t
		^\markup \pressure-diagram #3
}

% ARRIVAL

% notes E (D) / C D / Dqs / D / Bqs

sectionArrival =
{
	\section Arrival \markup \repeat-range 2 4

	\l-bracket
	\MulTwEiSv
	s16
	\tie-custom { \smallNote e''4 } #3.2 #-5.2 #0 ##f
		^\markup \pressure-diagram #2
		^\markup \strong-lip-pressure
		^\markup \translate #'(1 . 0) \oboe-trill-octave-fingering #2
	\option
	\MulTwFoNn
	s16
	\tie-custom { \smallNote c''4 } #3.2 #-5.2 #0 ##f
		^\markup \pressure-diagram #0
		^\markup \translate #'(4 . 0) \oboe-trill-octave-fingering #3
	\tie-custom { \smallNote d'''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #3
	\option
	\MulTwFvNn
	\tie-custom { \smallNote dil'''4 } #3.2 #-5.2 #0.4 ##t
		^\markup \pressure-diagram #3
		^\markup \translate #'(0.6 . 0) \oboe-trill-cc-fingering #7
	\option
	\MulTwSxEi
	s16
	\tie-custom { \smallNote dil'''4 } #3.2 #-5.2 #0.4 ##t
		^\markup \pressure-diagram #3
		^\markup \translate #'(0.6 . 0) \oboe-trill-octave-fingering #1
	\option
	\MulTwFvOn
	\r-bracket
}

componentArrivalDisplace =
{
	\optional-component

	\l-bracket
	\MulThZoNn
	\option
	\MulTwFvSxAlt
	\option
	%\option-markup 		% alteration makes this impossible
	%	\markup { \override #'(offset . 1.3) \trill-gliss \trillSign irregular ##t }
	\MulTwFvSv
	\option-markup
		\markup { \override #'(offset . 2.8) \trill-gliss \trillSign irregular ##t }
	\MulTwFvEi
	\r-bracket
}

componentArrivalExtend =
{
	\optional-component

	\l-bracket
	\MulOn
	\option
	\MulOnSx
	\option
	\MulFvSx
	\r-bracket
}

 % CLUSTER ONE

sectionClusterOne =
{
	\insert-section "Cluster 1" \markup \repeat-range 1 3

	\l-bracket
	s8
	\MulOnSxSx
	s8
	\option
	\smallNote ees'4
		^\markup \timbral
		^\markup \pressure-diagram #2
	s4
	\MulThFoEi
	s8
	\tie-custom { \smallNote gisil'''4 } #3.2 #-5.2 #0.5 ##t
		^\markup \teeth-indicator
	s4
	\option-brackets

	% DOESN'T WORK ON INSTRUMENT!
	%{
	-markup
	\markup { \override #'(offset . 1.9) \trill-gliss \trillSign 		\override #'(baseline-skip . 2.2) \center-column { \line { occasional } \line { rocking } }  ##t }
	%}

	s8
	\smallNote ees'4
		^\markup \timbral
		^\markup \pressure-diagram #2
	s4
	\MulThFvZo
	s8
	\tie-custom { \smallNote aeh'''4 } #3.2 #-5.2 #0.4 ##t
		^\markup \teeth-indicator
	s4
	\option
	\smallNote eel'4 ^\markup \timbral
		^\markup \pressure-diagram #2
	s4
	\MulThFvTw
	s8
	\tie-custom { \smallNote fisel'''4 } #3.2 #-5.2 #0.4 ##t
		^\markup \teeth-indicator
	s8
	\r-bracket
}

% CLUSTER TWO

sectionClusterTwo =
{
	\insert-section "Cluster 2" \markup \repeat-range 1 3

	\l-bracket
	\MulEiA
	\option
	\MulOn
	\or-sign
	\MulFv
	\option
	\MulOnZo
	\option
	\MulOnTwA
	\r-bracket
}

% DIVISION

sectionDivision =
{
	\insert-section Division \markup \repeat-min 3

	\l-bracket
	\MulThSvTh
	s32
	\tie-custom { \smallNote geh'''4 } #3.2 #-5.2 #0.4 ##t
		^\markup \pressure-diagram #3
	\option
	\MulSx
	s32
	\tie-custom { \smallNote bih''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #3
	\option
	\MulThFoNn
	s32
	\tie-custom { \smallNote aesel'''4 } #3.2 #-5.2 #0.2 ##t
		^\markup \teeth-indicator
	\parenthesis ##f #0
	\MulThFvOn
	s32
	\tie-custom { \smallNote c''''16 } #3.2 #-5.2 #0 ##t
		^\markup \teeth-indicator
	s32
	\parenthesis ##t #0
	\r-bracket
}

% Centre

componentCentreMain =
{
	\section Centre \markup \repeat-min 4

	\l-bracket
	\tie-custom { \smallNote eel'''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #3
	s4.
	\MulThTwSv
	\option
	\tie-custom { \smallNote del''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	s4.
	\MulOnThFv
	s8.
	\tie-custom { \smallNote g'''4 } #3.2 #-5.2 #0 ##t
		^\markup \pressure-diagram #3
	\option-arrow
	\tie-custom { \smallNote cis''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	s4
	\MulThZoSx
	s8.
	\tie-custom { \smallNote eil'''4 } #3.2 #-5.2 #0.3 ##t
		^\markup \pressure-diagram #4
	\option-arrow
	\tie-custom { \smallNote besil''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #2
	s4.
	\MulThSx
	\option-arrow
	\tie-custom { \smallNote cis''4 } #3.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	s4.
	\MulOnOnSv
	s8.
	\tie-custom { \smallNote geh'''4 } #3.2 #-5.2 #0.3 ##t
		^\markup \pressure-diagram #2
	\r-bracket
}

componentCentreGlisses =
{
	\accidentalStyle dodecaphonic

	\l-bracket
	\parenthesize cil''4 \glissando cih''4 \glissando \circle-note cis''4 \glissando dih''4
	\option
	\circle-note besil''4 \glissando cil'''4 \glissando \parenthesize cih'''
	\option
	\circle-note eel'''4 \glissando \glissando fis''' \glissando \circle-note gel'''4 \glissando gih'''4
	\r-bracket
}

% PRESS

componentCentrePressA =
{
	\section Press \markup \repeat-range 1 3

	\l-bracket
	\MulThThFo
	\alt-sign
	\MulThThOn
	\alt-sign
	\MulTwNnTw
	\option
	\MulThTwEi
	\alt-sign
	\MulThThNn
	\r-bracket
}

componentCentrePressB =
{
	\optional-component

	\l-bracket
	\MulThSv
	\option
	\MulSv			%\MulThSvEi (this was the replacement)
	\r-bracket
}

componentCentreExtendA =
{
	\section Extend \markup \repeat-min 1

	\l-bracket
	\tie-custom { \smallNote cisil''4 } #2.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulOnOnTh
s16
	\tie-custom { \smallNote geh'''4 } #2.2 #-4.2 #0.4 ##t
		^\markup \pressure-diagram #2
	\option
	\tie-custom { \smallNote d''4 } #2.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #0
	\MulOnOnFo
s16
	\tie-custom { \smallNote gel'''4 } #2.2 #-4.2 #0 ##t
		^\markup \pressure-diagram #2
	\option
	\tie-custom { \smallNote dil''4 } #2.2 #0 #-0.3 ##t
		^\markup \pressure-diagram #2
	\MulTwZoZo
s16
	\tie-custom { \smallNote gih'''4 } #2.2 #-4.2 #0 ##t
		^\markup \pressure-diagram #4
	\r-bracket
}

componentCentreExtendB =
{
	\add-or-component

	\parenthesis ##f #3.5
	\MulTwZoZo
	\parenthesis ##t #-2.5

	\l-bracket
	\smallNote eel'4
		^\markup \timbral
		^\markup \pressure-diagram #2
	\MulThFvTw
	\alt-sign
	\MulOn
	\option
	\MulThSv
	\alt-sign
	\MulThSx
	\r-bracket
}

componentTransitionA =
{
	\section Transition \markup 1

	\l-bracket
	\MulOnThSx
	\option
	\MulOnOnEi
	\r-bracket
}

componentTransitionB =
{
	\optional-component

	\l-bracket
	\MulFoZo
	\alt-sign
	\MulOnZoSx
	\alt-sign
	\MulOnZoSv
	\r-bracket
}

% LOOPS

% for the d quarter sharp here we can use 9 or 66 (or 155)
sectionLoops =
{
	\section Loops \markup \repeat-min 2

	\l-bracket
	\MulFvSv
	\smallNote ail'4
		^\markup \pressure-diagram #0
	\or-sign
	\MulSxTw
	\smallNote a'4
		^\markup \pressure-diagram #0
	\option
	\MulTwFoTw
	\smallNote desil'''4
		^\markup \pressure-diagram #3
	\option-arrow
	\MulFvZo
	\smallNote cis''4
		^\markup \pressure-diagram #0
	\or-sign
	\MulOnZoFo
	 \smallNote cisel''4
		^\markup \pressure-diagram #0
	\option
	\smallNote dih''4
		^\markup \fingering-plus #'((cc . (one two1h three four five six1h)) (lh . (III b)) (rh . (cis))) #0 #3
	\r-bracket
}

sectionLoopsMultis =
{
	\section Loops \markup \repeat-min 2

	\l-bracket
	\MulFvSv
	\or-sign
	\MulSxTw
	\option
	\MulTwFoTw
	\option-arrow
	\MulFvZo
	\or-sign
	\MulOnZoFo
	\r-bracket
}

sectionLoopsNotes =
{
	\accidentalStyle dodecaphonic

	\l-bracket
	\smallNote ail'4
		^\markup \pressure-diagram #0
	\or-sign
	\smallNote a'4
		^\markup \pressure-diagram #0
	\option
	\smallNote desil'''4
		^\markup \pressure-diagram #3
	\option
	\smallNote cis''4
		^\markup \pressure-diagram #0
	\option
	\smallNote cisel''4
		^\markup \pressure-diagram #0
	\r-bracket
}

componentLoopsExtend =
{
	\optional-component

	\l-bracket
	\MulOnZoEi
	\option
	\MulOnOnOn
	\option-markup
		\markup { \override #'(offset . 1.5) \trill-gliss \trillSign \null ##t }
	\MulOnOnZo
	\option-markup
		\markup { \override #'(offset . 2.5) \trill-gliss \trillSign \null ##t }
	\MulOnZoNn
	\option
	\MulOnOnTw
	\r-bracket
}

componentLoopsDisplace =
{
	\optional-component

	\l-bracket
	\MulSvFv
	\smallNote aih'4
		^\markup \pressure-diagram #0
	\smallNote cih'''4
		^\markup \pressure-diagram #3
	\option
	\MulSxZo
	\smallNote ail'4
		^\markup \pressure-diagram #0
	\smallNote cih'''4
		^\markup \pressure-diagram #3
	\option
	\MulSxSv
	\smallNote a'4
		^\markup \pressure-diagram #1
	\smallNote cih'''4
		^\markup \pressure-diagram #2
	\option-markup
		\markup { \override #'(offset . -3.5) \trill-gliss \trillSign \null ##t }
	\MulSxEi
	\smallNote dis''4 ^\markup \pressure-diagram #0
	\smallNote cis'''4 ^\markup \pressure-diagram #3
	\r-bracket
}

componentLoopsGround =
{
	\optional-component

	\l-bracket
	\MulEiA
	\tie-custom { \smallNote dih'4 }  #3.2 #-5.2 #0 ##f
		^\markup \pressure-diagram #1
	\r-bracket
}

% BLOCK ONE

% possible low and high from 88/89/44/45
sectionBlockOne =
{
	\insert-section "Block 1" \markup \repeat-range 1 3

	\l-bracket
	\MulThSxTw
	\option
	\MulEiEi
	\alt-sign
	\MulEiNnAlt
	\option
	\MulFoFo
	\alt-sign
	\MulFoFv
	\option
	\MulSxFv
	\or-sign
	\MulSvZo
	\r-bracket
}

% BLOCK TWO

sectionBlockTwo =
{
	\insert-section "Block 2" \markup \repeat-range 1 3

	\l-bracket
	\MulTwTw
	\alt-sign-markup
		\markup { \trill-gliss \trillSign flickering ##f }
	\MulTwTh
	\alt-sign
	\MulTwSx
	\r-bracket
}

componentBlockTwoExtend =
{
	\optional-component

	\l-bracket
	\MulThSxSx
	\option
	\MulFoEi
	\alt-sign-markup
		\markup { \trill-gliss \trillSign "/ gliss" ##f }
	\MulFvThAlt
	\r-bracket
}

% CODA

sectionCodaMultis =
{
	\component Coda

	\l-bracket
	\MulOnThA
	\MulOnTwA
	\MulSvFo
	\MulTwZoFo
	\MulNnNn
	\MulTwZoOn

	\option

	\MulThSxTw
	\MulThSxOn
	\MulSxEi
	\MulTwSvFo

	\option

	\MulTwSxFo
	\MulThTwSv

	\option

	\MulOnEi
	\MulTwSx
	\MulThFvSv
	\MulThFvNn

	\option

	\MulTwTw
	\MulTwTh
	\MulOnNnZ

	\option

	\MulOnFo
	\MulTwSv

	\option

	\MulThZo

	\r-bracket
}

sectionCodaA =
{
	\component Coda

	\l-bracket
	\tie-custom { \smallNote ees'4 } #3.2 #0 #-0.3 ##f
		^\markup \pressure-diagram #2
	s8
	\MulOnThA
	\option
	\tie-custom { \smallNote e'4 } #3.2 #0 #-0.3 ##f
		^\markup \pressure-diagram #2
	s8
	\MulOnTwA
	\r-bracket
}

swell =
^\markup { \hspace #3 "*"}

focus =
^\markup { \hspace #3 "**"}

teethmod =
^\markup { \hspace #3 "***"}

swellfocus =
^\markup { \hspace #3 \override #'(baseline-skip . 1.5) \column { \line {"*"} \line {"**"} } }

swellteeth =
^\markup { \hspace #3 \override #'(baseline-skip . 1.5) \column { \line {"*"} \line {"***"} } }


sectionCodaB =
{
	\optional-component

	\l-bracket
	\MulSvFo
	\swell
	\or-sign
	\MulThSxOn
	\swellteeth
	\option
	\MulTwZoFo
	\swellfocus
	\or-sign
	\MulSxEi
	\swellfocus
	\option
	\MulNnNn
	\swellfocus
	\option
	\MulTwZoOn
		\focus
		^\markup { \italic \pad-markup #0.8 "modulate roll" }
	\r-bracket
}

sectionCodaC =
{
	\optional-component

	\l-bracket
	\MulTwSxFo
	\swellfocus
	\option
	\MulThTwSv
	\swell
	\r-bracket
}

sectionCodaD =
{
	\optional-component

	\l-bracket
	\MulOnEi
	\option
	\MulTwSx
	\focus
	\option
	\MulThFvSv
	\teethmod
	\option
	\MulThFvNn
	\teethmod
	\r-bracket
}

sectionCodaE =
{
	\optional-component

	\time 13/4

	\l-bracket
	\tie-custom { \smallNote gel'4 } #3.2 #0 #-0.3 ##f
		^\markup \pressure-diagram #2
	s8
	\MulOnFo
	\tie-custom { \smallNote disel'''4 } #3.2 #-5.4 #0.4 ##t
		^\markup \pressure-diagram #3
	\option
	\tie-custom { \smallNote gih'4 } #3.2 #0 #-0.3 ##f
		^\markup \timbral
		^\markup \pressure-diagram #1
	s8
	\MulTwSv
	\tie-custom { \smallNote fil'''4 } #3.2 #-5.4 #0.4 ##t
		^\markup \timbral
		^\markup \pressure-diagram #3
	\option
	\MulThZo
	\tie-custom { \smallNote bil''4 } #3.2 #-5.4 #0.4 ##t
		^\markup \timbral
		^\markup \pressure-diagram #3
	\r-bracket

	\bar "|."
}

sectionCodaRecording =
{
	\component "Recording Only"

	\l-bracket
	\MulTwTw
	\swell
	\option
	\MulTwTh
	\swell
	\option
	\MulOnNnZ
	\swellteeth
	\r-bracket
}
