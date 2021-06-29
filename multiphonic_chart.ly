
#(define multi_display #t)

\include "notation_multiphonics.ly"

% BASIC SETUP ELEMENTS

\header { 
  tagline = ""  % removed 
} 

\version "2.22.1"  % necessary for upgrading to future LilyPond versions.

% LAYOUT

\layout 
{
	\context 
	{
    	\Score
       	\override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/128)
		\override BarLine.stencil = ##f
		\override BarNumber.stencil = ##f
    }
	\context 
	{
		\Staff
	  	\remove "Time_signature_engraver"
      	\hide Stem
	  	%\override Staff.AccidentalPlacement.padding = #0.2
    }
}

% SCORE

\new Score
{
	\accidentalStyle dodecaphonic  

	\MulFoEi
	\MulOnThSv
	\MulEiA
	\MulOn
	\MulFv
	\MulOnZo
	\MulOnTwA
	\MulOnSxSx
	\MulThFoEi
	\MulThFvZo
	\MulThFvTw
	\MulThSvTh
	\MulSx
	\MulThFoNn
	\MulThFvOn
	\MulEiEi
	\MulEiNn
	\MulFoFo
	\MulFoFv
	\MulSxFv
	\MulFoZo
	\MulSvZo
	\MulTwTw
	\MulTwTh
	\MulTwSx
	\MulThSxSx
	\MulFvTh
	\MulOnOnOn
	\MulNnSv 
	\MulFoSv
	\MulThNn
	\MulFvTw
	\MulFoSx
	\MulOnOnEi
	\MulOnZoTh
	\MulOnZoNn
	\MulOnFoFo
	\MulOnFoFv
	\MulOnFoSx
	\MulThFvTh
	\MulThFvFo
	\MulFvEi
	\MulSv
	\MulTwEiSv
	\MulTwFoNn
	\MulTwFvNn
	\MulTwSxEi
	\MulTwFvOn
	\MulThZoNn
	\MulTwFvSx
	\MulTwFvSv
	\MulTwFvEi
	\MulTwSxFv
	\MulTwFoZoZ
	\MulFvSx
	\MulOnSx
	\MulTwFoTw
	\MulFvZo
	\MulOnZoFo
	\MulSxTw
	\MulFvSv
	\MulSxZo
	\MulSxEi
	\MulSxSv
	\MulSvFv
	\MulOnZoEi
	\MulOnOnZo
	\MulOnOnTw
	\MulThTwSv
	\MulOnThFv
	\MulThThFo
	\MulThTwEi
	\MulThSv
	\MulOnOnTh
	\MulOnOnFo
	\MulTwZoZo
	\MulThSx
	\MulOnThSx
	\MulThZoSx
	\MulOnOnSv
	\MulTwNnTw
	\MulThTwNn
	\MulThThOn
	\MulThThNn
	\MulOnZoSx
	\MulOnZoSv
	\MulOnThA
	\MulSvFo
	\MulTwZoFo
	\MulNnNn
	\MulTwZoOn
	\MulOnEi
	\MulThFvSv
	\MulThFvNn
	\MulOnFo
	\MulTwSv
	\MulThSxOn
	\MulTwSvFo
	\MulOnNnZ
	\MulThZo
	\MulTwSxFo
}

