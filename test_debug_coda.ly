
#(define multi_display #t)

\include "score_blocks.ly"
\include "score_text.ly"
\include "layout_utility.ly"
\include "layout_setup.ly"

\version "2.22.1"


\markup 
{
	\column
	{
		\line { \main-part { "Closing" } }

		\score
		{
			\layoutSetup
			\sectionCodaA
		}
		\line
		{
			\score
			{
				\layoutSetup
				\sectionCodaB
			}	
			\score
			{
				\layoutNoIndent
				\sectionCodaC
			}
		}

		\line
		{
			\score
			{
				\layoutSetup
				\sectionCodaD
			}
			\score
			{
				\layoutEnd
				\sectionCodaE
			}
		}

		\score
		{
			\layoutSetup
			\sectionCodaRecording
		}
	}
}




