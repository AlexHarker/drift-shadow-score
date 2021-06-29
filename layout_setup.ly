
% BASIC SETUP ELEMENTS

\header 
{ 
	tagline = "" % removed 
} 

\pointAndClickOff
\version "2.22.1"

% PAGE NUMBERS

#(define-markup-command (page-rn layout props front-length) (number?)

	(define rn "i")
	(define page 0)
	
	(set! page (chain-assoc-get 'page:page-number props 1))
	(set! rn 
		(if (<= page front-length)
			(list-ref '(" " "i" "ii" "iii" "iv" "v") (if (= page 0) 1 (- page 1)))
			(number->string (- page front-length))))

	(interpret-markup layout props
	#{ \markup { #rn } #}
))

% LAYOUT

\paper 
{
	#(set-paper-size "a3landscape")
	top-margin = 1\cm
	bottom-margin = 1\cm	
	left-margin = 1\cm
	right-margin = 1\cm	
	print-page-number = #f
	
	oddFooterMarkup = 
	\markup 
	{ 
		\override #'(font-size . 3)
		\fill-line { \bold \page-rn #3 }
	}
	evenFooterMarkup = \oddFooterMarkup	
}

#(set-global-staff-size 16)
\layoutSetup
