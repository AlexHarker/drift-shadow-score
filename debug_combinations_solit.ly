
#(define multi_display #f)

\include "score_blocks.ly"
\include "score_text.ly"
\include "layout_utility.ly"
\include "layout_setup.ly"

\version "2.22.1"

% SPACING


spacer = \markup { 
	\column {
		\line { \null }
		\line { \null }
		\line { \null }
	}
}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


% EXAMPLES

componentGlissesOriginExample =
{
	\component "Glisses Origin"

	\l-bracket
	\parenthesize b'4 
		-\markup { '\concat { \dynamic ppp - \dynamic p } \italic dark/noisy } 
	 	\glissando 
	c''4 \glissando 
	d''4
	\option
	beh''4 \glissando 
	b''4
	\option
	fih'''4 \glissando 
	g'''4
	\r-bracket
}

componentGlissesOriginDetail =
{
	\component "Gl. Origin (v2)"

	\l-bracket
	\parenthesize b'4 
		-\markup { '\concat { \dynamic ppp - \dynamic p } \italic dark/noisy } 
		^\markup { \oboe-fingering #'((cc . (one1h two1h three four)) (lh . ()) (rh . ())) } 
		^\markup { \pressure-diagram #0 }
		\glissando 
	bih'4 
		^\markup { \oboe-fingering #'((cc . (one1h three four six1h)) (lh . ()) (rh . ())) } 
		^\markup { \pressure-diagram #0 }
		\glissando
	c''4 
		^\markup { \oboe-fingering #'((cc . (two1h three three six)) (lh . ()) (rh . ())) } 
		^\markup { \pressure-diagram #1 }
 	c''4 \glissando 
	d''4 
		^\markup { \oboe-fingering #'((cc . (one two1h four)) (lh . (IandIII)) (rh . ())) } 
		^\markup { \pressure-diagram #0 }

	\option
	beh''4 
		^\markup { \oboe-fingering #'((cc . (one two four)) (lh . (I)) (rh . (c))) } 
		^\markup { \pressure-diagram #3 } \glissando b''4
	\option
	fih'''4 \glissando 
	fis'''4 
		^\markup { \oboe-fingering #'((cc . (one two four five)) (lh . (III)) (rh . (c))) } 
		^\markup { \pressure-diagram #2 } 
		\glissando 
	g'''4
	\r-bracket
}

componentGlissesCentre =
{
	\component "Glisses Centre"

	\l-bracket
	\parenthesize c''4 
		-\markup { '\concat { \dynamic ppp - \dynamic p } \italic dark/noisy } 
	 \glissando cih''4 \glissando 
	dih''4
	\option
	beh''4 \glissando 
	b''4 \glissando 
	\parenthesize c'''4
	\option
	e'''4 \glissando 
	gih'''4
	\r-bracket
}

% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% PAGE 0

\markup
{
	\main-part { "Gliss Ideas" }
}

\spacer
\spacer

\markup
{
	\score
	{
		\layoutSetup
		\componentGlissesOriginExample
	}

\score
	{
		\layoutSetup
		\componentGlissesOriginDetail
	}
}

\spacer
\spacer
\spacer

\markup
{
	\score
	{
		\layoutSetup
		\componentGlissesCentre
	}
}

\spacer
\spacer
\spacer

\markup
{
	\score-text 
	\componentOriginGlisses
	\layoutSetup
	\textOriginGlissesA
	#25
}


\pageBreak 

% PAGE 1

\markup
{
	\main-part { "Part I" }
}

\markup
{
	\combine
	\column
	{
		\line 
		{
			\score-component 
			\componentOriginMain 
			\layoutSetup
			\textOriginMainA 
			\textOriginMainB
			#25 #4 #8
		}

		\spacer
		\spacer

		\line
		{
			\hspace #5
			\score-component 
			\componentGround
			\layoutNarrower
			\textGroundA
			\textGroundB
			#25 #3 #8

			\score-component 
			\componentPush
			\layoutNarrower
			\textPushA
			\textPushB
			#25 #3 #10
		}

		\spacer
		\spacer

		\line 
		{
			\score-component 
			\componentDisplace
			\layoutSetup
			\textDisplaceA
			\textDisplaceB
			#25 #5 #10

			\score 
			{ 
				\layoutNoIndent
				\componentDisplaceEnd 
			}
		}
	}
	
	\line 
	{
		\overlay
		{
			%\form-link #8 #-4 #8 #-101
			\form-curve #17 #-4 #17 #-101
			\form-s-curve #30 #-18 #14 #-50
			\form-s-curve #32 #-80 #14 #-58
			\form-s-curve #60 #-18 #121 #-50
			\override #'(oneway ¢t)
			\form-s-curve #121 #-58 #97 #-80 
		}
	}
} 

\pageBreak 

% PAGE 2

\markup 
{
	\score-component 
	\sectionArrival
	\layoutNarrower
	\textArrivalA 
	\textArrivalB
	#25 #5 #15

	\score-text 
	\componentArrivalExtend 
	\layoutNoIndent 
	\textArrivalExtendA
	#5
}

\markup 
{
	\score-text 
	\componentArrivalDisplace 
	\layoutSetup 
	\textArrivalDisplaceA
	#25
}

\spacer

\markup 
{
	\score-component 
	\sectionClusterOne
	\layoutNarrower
	\textClusterOneA 
	\textClusterOneB
	#25 #5 #15
}

\spacer

\markup 
{
	\score-component 
	\sectionClusterTwo
	\layoutSetup
	\textClusterTwoA 
	\textClusterTwoB
	#25 #5 #18
}

\pageBreak 

% PAGE 3

\markup
{
	\main-part { "Part II" }
}

\markup 
{
	\score-component 
	\sectionDivision 
	\layoutNarrower
	\textDivisionA 
	\textDivisionB
	#25 #5 #27
}

\spacer

\markup 
{
	\line
	{
		%\score-component 
		%\componentCentreMain 
		%\textCentreA 
		%\textCentreB
		%#25 #5 #20
	
		\score
		{
			\layoutNarrower
			\componentCentreMain
		}
		\hspace #4
		\score
		{
			\layoutNarrowerNoIndent
			\componentCentrePressA
		}
		\hspace #4
		\score
		{
			\layoutNarrowerNoIndent
			\componentCentrePressB 
		}
	}
}

\markup 
{
	\score
	{
		\layoutNarrow
		\componentCentreExtendA
	}
	\score
	{
		\layoutNoIndent
		\componentCentreExtendB
	}
	\score
	{
		\layoutNoIndent
		\componentCentreExtendC
	}
}
\markup 
{
	\score
	{
		\layoutSetup
		\componentCentreExtendD
	}
}

% PAGE 4

\pageBreak 

\markup 
{
	\column
	{
		\line
		{
			\score-text 
			\sectionLoops 
			\layoutNarrower 
			\textLoopsA 
			#25
			
			\hspace #5 { (+) } \hspace #5
			
			\score-text 
			\componentLoopsExtend 
			\layoutNoIndent
			\textLoopsExtendA 
			#5
		}	

		\line
		{
			\score-text 
			\componentLoopsDisplace 
			\layoutNarrow 
			\textLoopsDisplaceA 
			#25

			\score-text 
			\componentLoopsGround 
			\layoutSetup 
			\textLoopsGroundA 
			#25
		}
	}
	
	%\textLoopsA 
	%\textLoopsB
	%#25 #5 #10
}

\spacer

\markup 
{
	\score-component 
	\sectionBlockOne
	\layoutSetup
	\textBlockOneA 
	\textBlockOneB
	#25 #5 #20
}

\spacer

\markup 
{
	\line
	{
		\score-text 
		\sectionBlockTwo 
		\layoutSetup 
		\textBlockTwoA
		#25

		\hspace #5 { (+) } \hspace #5 

		\score-text 
		\componentBlockTwoExtend 
		\layoutNoIndent 
		\textBlockTwoB
		#5
	}	
}