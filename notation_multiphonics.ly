
\include "notation_techniques.ly"

% setup for microtones in eighthtones with arrows

ekmelicFont = "Ekmelos"
\include "ekmel-48ah.ily"
\ekmelicStyle sag
\ekmelicUserStyle eimm #'(
  (1/8 #xE272)
  (-1/8 #xE273)
  (1/4 #xE282)
  (-1/4 #xE284)
  (3/8 #xE299)
  (-3/8 #xE291)
  (1/2 #xE262)
  (-1/2 #xE260)
  (5/8 #xE274)
  (-5/8 #xE2C1)
)

#(define (multiphonic-number name)
	(if multi_display 
		#{ 
			_\markup 
			\override #'(font-name . "Arial Bold")  
			\tiny \center-align { \column { \line { \lower #4 #name } \vspace #0.5 } }
		#} 
		#{ _\markup{} #}))

% basic multiphonic definition to reduce formatting and characters - takes a chord, fingering list, pressure, reed position and name

multiphonic =
#(define-music-function
    (notes fingering pressure reed name)
    (ly:music? list? number? number? string?)
	
	#{
		#notes ^\markup \fingering-plus #fingering #pressure #reed
		#(multiphonic-number name)
	#})

% include list of multiphonics

\include "multiphonics.ly"

% custom multiphonic notations (revise if database changes)

MulFvEiLine = \multiphonic { <aih' d'' c''' gesil''' bel'''>4 \- } #'((cc . (one two1h three four five six)) (lh . (bes fadd)) (rh . ())) #3 #3 "58"

MulSvLine = \multiphonic { <disel'' geh'' disel''' fel''' geh'''>4 \- } #'((cc . (one two three four five six1h)) (lh . (III b)) (rh . (c))) #3 #3 "7"

MulThSvEiLine = \multiphonic { <eeh'' gesil'' f''' gesil'''>4 \- } #'((cc . (one1h two three four five six1h)) (lh . (III b)) (rh . (c))) #5 #3 "378"

MulFvThAlt = \multiphonic { <cih'' besil'' cih''' fis''' besil''' bih''' dih''''>4 } #'((cc . (one two four six1h)) (lh . (III)) (rh . (c))) #3 #4 "53"

MulFvTwAlt = \multiphonic { <bil' cih'' bes'' bel'' f''' fih''' fis''' bel''' b'''>4 } #'((cc . (one two four six1h)) (lh . (I)) (rh . (c))) #2 #3 "52"

MulTwFvSxAlt = \multiphonic { <cisel'' eesil'' d''' gisel''' ael'''>4 } #'((cc . (two1h three four)) (lh . ()) (rh . ())) #3 #3 "256"

MulEiNnAlt = \multiphonic { <a' gel'' dih''' e''' gisel''' b''' c''''>4 } #'((cc . (one1h two three)) (lh . ()) (rh . ())) #3 #3 "89"


