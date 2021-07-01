
#(define multi_display #t)
#(define piece-title "Drift Shadow")
#(define page_five_space (if multi_display 4.5 5))

\include "score_blocks.ly"
\include "score_text.ly"
\include "layout_setup.ly"

\version "2.22.1"

% TITLE PAGE

\include "score_title.ly"

% KEY

\include "score_key.ly"

% PAGE 1

\markup
{
	\column
	{
		\fill-line 
		{ 
			\line \pad-markup #0.55 
			{ 
				\bold \override #'(font-size . 8) 
				 #piece-title 
			}
		 }
	
		\vspace #0.5
		
		\fill-line 
		{ 
			\line { \null} 
			\line \pad-markup #0.2 { \override #'(font-size . 4) { for Oboe and Electronics } } 
			\line \italic \pad-markup #0.1 { \override #'(font-size . 2) { Alex Harker with Niamh Dell \hspace #3 } } 
		}

		\vspace #0.5	

		\line { \main-part { "Opening" } }
		\vspace #0.5

		\fill-line 
		{ 
			\center-column	
			{
				\column
				{
					\line
					{
						\score-component-normal
						\componentUnfoldingMain 
						\layoutSetup
						\textUnfoldingMainA 
						\textUnfoldingMainB
						#27 #28
					}

					\vspace #2

					\line
					{
						\score-component-normal
						\componentUnfoldingGlisses						\layoutSetup
						\textUnfoldingGlissesA
						\textUnfoldingGlissesB
						#27 #32
					}
				}

				\vspace #2
				\form-component \textUnfoldingForm

				\override \textDSize
				\vspace #1
				\italic \line { elide into \reference-part "Part I" }
			}
		}
	} 
}

\pageBreak 

% PAGE 2

\markup
{
	\overlay
	{
		\column
		{
			\line 
			{ 
				\main-part { "Part I" } 
				\hspace #8
				\raise #0.5 \italic \line { (move to \reference-part "Part II" after building sufficient drama or exhausting the materials here) }
			}


			\line 
			{
				\score-component-normal
				\componentOriginMain 
				\layoutSetup
				\textOriginMainA 
				\textOriginMainB
				#27 #28
			}

			\vspace #0.8

			\line
			{
				\score-component-normal
				\componentOriginGlisses
				\layoutSetup
				\textOriginGlissesA
				\textOriginGlissesB
				#27 #0

				\vcenter \line { \hspace-normal \form-component \textOriginForm }
			}
	
			\vspace #1.4

			\line
			{
				\hspace #5
				\score-component-tight 
				\componentGround
				\layoutNarrower
				\textGroundA
				\textGroundB
				#30 #14

				%\hspace-tight

				\score-component-tight
				\componentPush
				\layoutNarrower
				\textPushA
				\textPushB
				#23.8 #27
			}

			\vspace #0.6

			\line 
			{
				\score-component-normal
				\componentDisplace
				\layoutSetup
				\textDisplaceA
				\textDisplaceB
				#29 #28

				\vcenter \parenthesis-markup #2 ##f 
				\override #'(oneway . #t)
				\form-link #0 #0 #5 #0
				\vcenter \parenthesis-markup #2 ##t

				\score-text 
				\componentDisplaceEnd 
				\layoutDisplaceEnd
				\textDisplaceEnd 
				#5.2

				\override #'(oneway . #t)
				\form-link #0 #0 #5 #0
				\vcenter \section-idea { Arrival }
			}
		}
	
		\line 
		{
			\overlay
			{
				\form-curve #17 #-40 #17 #-160
				\override #'(anglea . 0.9)
				\override #'(angleb . 0.7)
				\form-s-curve #30 #-72 #14 #-98
				\override #'(anglea . -3.5)
				%\override #'(angleb . -4)
				\form-s-curve #100 #-72 #136 #-98
				\form-s-curve #32 #-138 #14 #-112
				\override #'(oneway . #t)
				\form-s-curve #120 #-138 #136 #-112
			}
		}
	}
} 

\pageBreak 

% PAGE 3

\markup 
{
	\column	
	{
		\line 
		{
			\overlay
			{

				\lower #23.4 
				\score-component-normal
				\sectionArrival
				\layoutNarrower
				\textArrivalA 
				\textArrivalB
				#29 #34

				\arrive-from { \previous-idea Displace }
			}

			\hspace #7
			\override #'(oneway . #t)
			\lower #23.4 \form-link #0 #0 #10 #0
			\hspace-form-link
			\lower #23.4 \vcenter \section-idea { Origin }
		}

		\vspace #0.2

		\line
		{
			\hspace-optional

			\score-component-normal 
			\componentArrivalExtend 
			\layoutNoIndent
			\textArrivalExtendA
			\textArrivalExtendB
			#10 #23.4

			\hspace-tight

			\score-component-normal
			\componentArrivalDisplace 
			\layoutNoIndent 
			\textArrivalDisplaceA
			\textArrivalDisplaceB
			#11.5 #0
		}

		\divider #1.75

		\score-component-normal
		\sectionClusterOne
		\layoutClusterOne
		\textClusterOneA 
		\textClusterOneB
		#28 #28

		\divider #1.75

		\score-component-normal
		\sectionClusterTwo
		\layoutSetup
		\textClusterTwoA 
		\textClusterTwoB
		#30 #23.4
	} 
}

\pageBreak 


% PAGE 4

\markup
{
	\overlay
	{
		\column
		{
			\line \main-part { "Part II" }

			\lower #23.4 \line 
			{
				\score-component-normal 
				\sectionDivision 
				\layoutNarrower
				\textDivisionA 
				\textDivisionB
				#31.5 #27

				\hspace #1.5
				\override #'(oneway . #t)
				\form-link #0 #0 #10 #0
				\hspace-form-link
				\vcenter \section-idea { Centre }
			}

			\divider #(if multi_display 3 4)
	
			\line
			{
				\score-text 
				\sectionLoops 
				\layoutNarrower 
				\textLoopsA 
				#32
						
				\score-text 
				\componentLoopsExtend 
				\layoutNoIndent
				\textLoopsExtendA 
				#9.5
			}
	
			\vspace #2

			\line
			{
				\hspace-optional

				\score-component-normal
				\componentLoopsDisplace 
				\layoutNarrowNoIndent
				\textLoopsDisplaceA 
				\textLoopsDisplaceB
				#9.7 #0
			
				\hspace-normal 

				\score-component-normal
				\componentLoopsGround 
				\layoutNoIndent 
				\textLoopsGroundA 
				\textLoopsGroundB 
				#12 #25
			}		
			
			\vspace #1.5

			\overlay
			{
				\fill-line { \line { \form-component \textLoopsForm } }
				\lower #11 \line
				{
					\override #'(oneway . #t)
					\form-link #248 #0 #258 #0
					\hspace-form-link
					\vcenter \section-idea { Centre }
				}
			}
		}
		
		\line 
		{
			\overlay
			{
				\override #'(oneway . #t)
				\override #'(hinside . 0.01)
				\override #'(vinside . 0.3)
				\form-s-curve #27 #-37 #9 #(if multi_display -84 -87)
			}
		}
	}
}

% PAGE 5

\pageBreak 

\markup 
{
	\overlay
	{	
		\column
		{
			\line
			{
				\overlay
				{
					\lower #23.4
					\score-component-normal 
					\componentCentreMain 
					\layoutNarrow
					\textCentreMainA 
					\textCentreMainB
					#25 #0

					\override #'(offset . 7.8)
					\arrive-from 
					{ 
						\previous-idea Loops 
						\vspace #(/ 1 3)
						\previous-idea Division 
					}
				}
				
				\hspace #12.2
				\lower #23.4 \line
				{
					\override #'(oneway . #t)
					\form-link #0 #0 #10 #0
					\hspace-form-link
					\vcenter \section-idea { Loops }
				}
			}

			\vspace #2

			\line
			{
				\score-component-normal 
				\componentCentreGlisses
				\layoutSetup
				\textCentreGlissesA
				\textCentreGlissesB
				#27 #0

				\vcenter { \hspace #4 \form-component \textCentreForm }
			}

			\vspace #page_five_space

			\line
			{
				\hspace #5
				\score-text 
				\componentCentrePressA
				\layoutSetup
				\textPressA
				#27
		
				\score-component-normal 
				\componentCentrePressB 
				\layoutNoIndent
				\textPressB
				\textPressC
				#10 #23.4
			}

			\vspace #page_five_space

			\line 
			{
				\score-text 
				\componentCentreExtendA
				\layoutNarrow
				\textExtendA
				#27
		
				\score-component-normal 
				\componentCentreExtendB
				\layoutNarrowerNoIndent
				\textExtendB
				\textExtendC
				#11.5 #33
			}

			\vspace #1.5

			\line
			{
				\hspace #225
				\override #'(oneway . #t)
				\form-link #0 #0 #10 #0
				\hspace-form-link
				\vcenter \section-idea { Transition }
			}
		}	

		\line 
		{
			\overlay
			{
				\form-curve #17 #-32 #17 #-154

				\override #'(anglea . -4)
				\override #'(angleb . 4)
				\override #'(ldist . 10)
				\override #'(pdist . 5)			
				\form-curve #23 #(if multi_display -59 -56) #14 #-95
			}
		}
	}
}	

% PAGE 6

\pageBreak 

\markup 
{
	\column
	{
		\vspace #4 

		\line
		{
			\overlay
			{
				\lower #23.4
				\line
				{
					\score-text 
					\componentTransitionA 
					\layoutSetup 
					\textTransitionA
					#30.2

					\score-component-normal
					\componentTransitionB 
					\layoutNoIndent 
					\textTransitionB
					\textTransitionC
					#10.5 #25

					\hspace #4
					\override #'(oneway . #t)
					\form-link #0 #0 #10 #0
					\hspace-form-link
					\vcenter \reference-part { Closing }
				}

				\arrive-from { \previous-idea Extend }
			}
		}

		\vspace #4 

		\divider #4

		\line
		{
			\score-component-normal
			\sectionBlockOne
			\layoutSetup
			\textBlockOneA 
			\textBlockOneB
			#27.7 #25
		}

		\divider #4

		\line
		{
			\score-text 
			\sectionBlockTwo 
			\layoutSetup 
			\textBlockTwoA
			#31.9

			\score-component-normal
			\componentBlockTwoExtend 
			\layoutNoIndent 
			\textBlockTwoB
			\textBlockTwoC
			#11.8 #30
		}

		\divider #4
	}
}


\pageBreak 

\markup 
{
	\column
	{
		\line { \main-part { "Closing" } }

		\line
		{
			\score-component-normal
			\sectionCodaA 
			\layoutSetup 
			\textCodaAA
			\textSuspend
			#27.1 #0

			%% RECORDING ONLY

			%\hspace #60

			%\score-text 
			%\sectionCodaRecording 
			%\layoutSetup 
			%\textCodaRecA
			%#31.5	
		}

		\vspace #3

		\line
		{
			\score-text 
			\sectionCodaB 
			\layoutSetup 
			\textCodaBA
			#27

			\hspace #4 

			\score-text 
			\sectionCodaC 
			\layoutNoIndent 
			\textCodaCA
			#11.2
		}

		\vspace #3

		\line
		{
			\score-text 
			\sectionCodaD 
			\layoutSetup 
			\textCodaDA
			#28.8

			\hspace #4 

			\score-text 
			\sectionCodaE
			\layoutEnd 
			\textCodaEA
			#8.7
		}

		\vspace #3

		\fill-line { \line { \form-component \textCoda } }
	}
}



