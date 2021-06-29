
\include "score_key_elements.ly"

% PAGE i

\markup
{
	\column
	{
		\vspace #2
		\fill-line { \line { \bold \override #'(font-size . 10) { Key } } }
		\vspace #4

		\fill-line { \line \key-title { Overall Form } }
		\vspace #1

		\fill-line { \override #'(line-width . 150) \italic \explain-form-a }
		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \explain-form-b }
		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \bold \explain-form-c }

		\vspace #2

		\fill-line {  \line \key-title { Notation of Form } }

		\vspace #2

		\fill-line
		{
			\score-component-normal 
			\key-insert
			\layoutSetup
			\text-empty
			\text-sections
			#0 #0
		}

		\vspace #2

		\fill-line
		{
			\line
			{
				\score
				{
					\layoutSetup
					\key-plus
				}
	
				\score-component-normal 
				\key-add-or
				\layoutSetup
				\text-empty
				\text-plus
				#0 #0
			}
		}

		\vspace #2

		\fill-line { \line { \italic { dashed lines help separate 'insert' sections visually from other music } } }

		\divider #2

		\vspace #3
		
		\fill-line 
		{
			\score-component-normal 
			\key-brackets 
			\layoutSetup
			\text-empty
			\text-brackets
			#0 #0 
		}

		\vspace #2

		\fill-line 
		{
			\score-component-normal 
			\key-or-alt 
			\layoutSetup
			\text-empty
			\text-or-alt
			#0 #0
		}
	}
}

\pageBreak

% PAGE ii

\markup
{
	\column
	{
		\vspace #4

		\fill-line { \line \key-title { Notation of Techniques } }

		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \explain-techniques-a }
		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \explain-techniques-b }
		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \explain-techniques-c }
		\vspace #1
		\fill-line { \override #'(line-width . 150) \italic \bold \explain-techniques-d }

		\vspace #3

		\fill-line
		{
			\score
			{
				\layoutTechniques
				\key-techniques-a
			}
		}

		\vspace #3

		\fill-line
		{
			\score
			{
				\layoutTechniques
				\key-techniques-b
			}
		}

		\vspace #3

		\fill-line
		{
			\score-component-normal 
			\key-techniques-c
			\layoutSetup
			\text-empty
			\text-techniques
			#0 #0
		}

		\vspace #3

		\fill-line
		{
			\line
			{
				\column 
				{	
					\score { \exampleOriginSelection }
					\vspace #2
					\score { \exampleArrivalRapidPitchFocus }				}
				\hspace #5
				\column 
				{	
					\vspace #1
					\text-selection-focus
				}
			}
		}
	}
}

% selection vs focus


