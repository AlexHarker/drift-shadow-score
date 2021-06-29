
\include "notation.ly"
\include "score_examples.ly"


% UNFOLDING

textUnfoldingMainA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range pp mf fragile and liminal (moving between stable and underblown) }
	}
}

textUnfoldingMainB =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play drawing from and combining the following possibilities (+ colour trills ad lib.)  —  \bold { slowly change the pitch emphasis } }
		\blankline
		\line { \variant-explain A static with sporadic interruptions with colour fingerings }
		\blankline
		\score { \exampleUnfoldingStatic }
		\blankline
		\line { \variant-explain B on the edge of stablity with underblown interruptions }
		\blankline
		\score { \exampleUnfoldingUnderblow }
		\blankline
		\line { \variant-explain C with rearticulated focus pitches (articulate with tongue/smorzando/dynamics) }
		\blankline
		\score { \exampleOriginFocusRearticulate }
	}
}

textUnfoldingGlissesA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range ppp p dark and noisy fragments of broken sound }
	}
}

textUnfoldingGlissesB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play gestures drawing from and combining the following possibilities (+ bursts of breath noise throughout) }
		\line \italic \bold { to start focus on circled pitches and increase the utilised range, developing longer gestures over time  }
		\line \italic { each gesture may draw on only a small microtonal range in those indicated }
		\blankline
		\line { \variant-explain A slow glisses and meandering }
		\score { \exampleGlissesSlow }
		\blankline
		\line { \variant-explain B varying speeds and regularities of oscillation }
		\score { \exampleGlissesOscillations }
		\blankline
		\line { \variant-explain C scoops and gestures }
		\score { \exampleGlissesScoops }
		\blankline
		\line { \variant-explain D varying speeds/intensities of microtonal ornamentation (central pitch may be shifted slowly over time) }
		\blankline
		\score { \exampleMicrotones }
	}
}

textUnfoldingForm =
\markup
{  
    \center-column 
	{
		\blankline

		\column 
		{
			\line \italic { intersperse multiphonic and glissandi/microtones into distinct gestures }
			\line \italic { elecs tracks speed/levels of activity/attack points }
		}

		\blankline
		\blankline
		\line 
		{
			\overlay
			{
				\line { \score { \exampleUnfoldingFormA } \score { \exampleUnfoldingFormB } }
				\override #'(pdist . -3)
				\override #'(ldist . 3)
				\override #'(angleb . -23)
				\override #'(oneway . #t)
				\form-curve #66 #3 #74 #2.6
			}
		}
		\blankline
		
		\column 
		{
			\line { \null }
			\line \italic { vary phrase lengths to maintain interest and let episodes of focus emerge organically }
			\line \italic { start using individual ideas in short gestures + over time introduce more ideas, more linking and extended moments of obsessive focus }
			\line \bold { each gesture should be similar, yet unique, with a varying level of connection to the proceding gesture }
			\line { \null }
		}
	}
}

% ORIGIN

textOriginMainA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range pp mf fragile and liminal (moving between stable and underblown) }
	}
}

textOriginMainB =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play as multiphonics in \idea Unfolding but also adding the following possibilities (+ glisses and colour trills ad lib.) }
		\blankline
		\line { \variant-explain D quiet swells }
		\blankline
		\score { \exampleOriginSwells }
		\blankline
		\line { \variant-explain E wavering pitch selection }
		\blankline
		\score { \exampleOriginSelection }
		\blankline
		\line { \variant-explain F create short gestural mini-loops from \variant A - \variant E (incorporate gliss material also ad lib.) }
		\blankline
		\line 
		{ \score { 
			\exampleOriginMiniLoops } 
			\hspace #1.5
			\override #'(font-name . "Arial Bold")
			\override #'(font-size . 1)
			\vcenter \concat 
			{ 
				x \hspace #0.9 \repeat-range 2 4 
			}
		} 
	}
}

textOriginGlissesA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range ppp p dark and noisy fragments of broken sound }
	}
}

textOriginGlissesB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play as in glissandi/microtones in \idea Unfolding }
		\line \italic { continue to widen the ranges over time  }
		\line \italic { break into breath noise ad lib. }
	}
}

textOriginForm =
\markup
{  
    \center-column 
	{
		\column 
		{
			\line \italic { continue to intersperse multiphonic and glissandi/microtones into longer phrases }
			\line \italic { elecs tracks speed/levels of activity/attack points/space and follow changes of section/idea }
			\line { \null }
			\line \italic { allow moments of focus, as before, but also explore other materials in \reference-part "Part I" as indicated }
			\line \bold { each time through try to make something new }
		}
	}
}


% DISPLACE

textDisplaceA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p f messy and gestural, pushing against the established texture }
	}
}

textDisplaceB =
\markup 
{ 
\override \textBSize \column 
	{
		\line \italic { play using the ideas from \idea Origin (+ flz. ad lib.)  }
		\line \italic { add gestural ideas below using \bold { lip and key glisses / pitch focus / dynamic inflections } }
		\line \italic { elecs introduce similar multiphonics and gestures }
		\line \bold { each time through increase intensity along with options and instability }
		\blankline
		\line { \variant-explain A slow changes and meandering }
		\score { \exampleDisplaceSlow }
		\blankline
		\line { \variant-explain B varying speeds and regularities of oscillation }
		\score { \exampleDisplaceOscillations }
		\blankline
		\line { \variant-explain C scoops and gestures }
		\score { \exampleDisplaceScoops }
		\blankline
	}
}

textDisplaceEnd =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mf stable + focussed (cresc ad lib.) }
	}
}


% GROUND

textGroundA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mf strong + focussed (optional trill) }
	}
}

textGroundB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play \bold { sustain } till elecs double then \variant A (+ \variant B ) }
		\line \italic { elecs double then follow the dissolve }
		\line \bold { move on only once doubling dissolves }
		\blankline
		\line { \variant-explain A dissolve into noise/bits with teeth wobble }
		\blankline
		\score { \exampleGroundDissolve }
		\blankline
		\line { \variant-explain B slow dabs of \bold \concat { F \fontsize #-0.5 \super \sharp } timbral notes }
		\blankline
		\score { \exampleGroundDabs }
	}
}


% PUSH

textPushA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mp stable + focussed }
	}
}

textPushB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play \bold {  slow sustains then optionally } \variant A and/or \variant B }
		\line \italic { move freely + slowly between fingerings }
		\line \italic { elecs double and track activity } 
		\line \bold { hold sustains till doubling is dominant in elecs }
		\blankline
		\line { \variant-explain A fast pulsing/rearticulation }
		\blankline
		\score { \examplePushRearticulate }
		\blankline
		\line { \variant-explain B rearticulation with changing pitch focus each attack }
		\blankline
		\score { \examplePushRearticulateFocus }
		\blankline
		\line { \variant-explain C pushing upwards to high \bold \concat { G \fontsize #-0.5 \super \natural } }
		\blankline
		\score { \examplePushUpward }
		\blankline
	}
}


% ARRIVAL

textArrivalA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p mf with stable tuning to maximise consonance }
	}
}

textArrivalB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { play interspersing \variant A and \variant B in blocks (+ \variant C ad lib.)  }
		\line \italic { elecs double and track activity }
		\blankline
		\line { \variant-explain A multiphonics with moderate to rapid pitch focus and dynamic inflections  }
		\blankline
		\score { \exampleArrivalRapidPitchFocus }
		\blankline
		\line { \variant-explain B single notes with optional 'breaking' trills as hairpins (irregular but with a vague sense of pulse)  }
		\blankline
		\score { \exampleArrivalSingles }
		\blankline
		\line { \variant-explain C noise clouds/bursts (breath + keys + tongue constriction as needed) }
		\blankline
		\score { \exampleArrivalClouds }
		\blankline
	}
}

textArrivalExtendA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f underpin the harmony (tune consonantly)  }
	}
}

textArrivalExtendB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { play one or more multiphonics changing infrequently }
		\line \italic { elecs complete harmonic field }
		\line \bold { use only once per instance of this section }
		\blankline
		\line { \variant-explain A stable sustains }
		\blankline
		\score { \exampleArrivalExtendA }
		\blankline
		\line { \variant-explain B sustains + occasional slow wide pitch focus inflections (low)  }
		\blankline
		\score { \exampleArrivalExtendB }
	}
}

textArrivalDisplaceA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p f messy and gestural, pushing against the established texture }
	}
}

textArrivalDisplaceB =
\markup
{  
    \override \textBSize \column 
	{
		\line \italic { play as \idea Displace but build messiness sensitively over time }
		\line \italic { embrace tuning clashes, but also subtle dynamics }
		\line \italic { continue to insperse with noise clouds }
		\line \italic { elecs adds further displacements to the core \idea Arrival harmony }
		\line \bold { use to add complexity or to dissolve/end this section }

	}
}


% CLUSTER 1

textClusterOneA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f stable multiphonics (reduce louder ones as much as possible) }
	}
}

textClusterOneB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play either as \concat { \variant A \hspace #0.3 , } \variant B or \variant C or intersperse in blocks — \bold { reorder freely, often rocking back and forth between pairs, hinting at short loops } }
		\line \italic { elecs track speed/levels of activity }
		\blankline
		\line { \variant-explain A uneven slow rocking patterns }
		\blankline
		\score { \exampleClusterOneA }
		\blankline
		\line { \variant-explain B long separate sustains (allow elecs to complete harmonic field) }
		\blankline
		\score { \exampleClusterOneB }
		\blankline
		\line { \variant-explain C intersperse multiphonics slurred to high notes (+ wobble), timbral low notes and high smorzando teeth tones wobbling between partials }
		\blankline
		\score { \exampleClusterOneC }
	}
}


% CLUSTER 2

textClusterTwoA =
\markup 
{ 
	\override \textASize \column 
	{
		\line \italic { \dynamic-range mp f stable multiphonics (as quiet as possible) }
	}
}

textClusterTwoB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play either as \variant A or \variant B or morph between the two — \bold { continuously reorder avoiding close repetition/looping } }
		\line \italic { elecs track speed }
		\blankline
		\line { \variant-explain A slow swells w/ occassional small pockets of faster change + accent }
		\blankline
		\score { \exampleClusterTwoA }
		\blankline
		\line { \variant-explain B v. slow swells w/ occassional extremely long notes (till elecs responds) }
		\blankline
		\score { \exampleClusterTwoB }
	}
}


% DIVISION

textDivisionA =
\markup
{
	\override \textASize \column 
	{
		\line \italic { \block-dynamic f stable multiphonics }
	}
}

textDivisionForm  =
\markup
{
	\override \textBSize \column 
	{
		\line \italic { play as \idea statement + optionally \concat { \variant A \hspace #0.3 , } \variant B or \variant C }
		\line \italic { elecs complete harmonic field with added filtering }
		\blankline
		\line \bold { each instance a surprise }

	}
}

textDivisionB =	
\markup
{ 
	\override \textBSize 
	\column 
	{
		\line { \idea statement \hspace #30 \raise #0.6 \optional-add }
		\blankline
		\line { \selection-range 1 3 multiphonics pure/strong }
		\line \italic { prefer to end the statement section low (esp. on \normal-text \concat { \bold C \fontsize #-0.5 \super \natural ) } }
		\blankline
		\score { \exampleDivisionStatement }
		
		\vspace #2
		\form-component \textDivisionForm
	}
	\hspace #4
	\override \textBSize \column 
	{
		\line { \idea dissolve }
		\blankline
		\line { (keep multiphonic static or change infrequently) }
		\blankline
		\line { \variant-explain A dissolve through lip or key gliss with breath noise  }
		\blankline
		\score { \exampleDivisionDissolve }
		\blankline
		\line { \variant-explain B switch between multiphonics and high tones w/ optional breath noise  }
		\blankline
		\score { \exampleDivisionB }
		\blankline
		\line { \variant-explain C very slow changes between stable multiphonics }
		\blankline
		\score { \exampleDivisionC }
	}
}


% LOOPS

textLoopsA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p mp multiphonics or \dynamic-space \block-dynamic pp single notes }
		\line \italic { always as clean as possible }
	}
}

textLoopsExtendA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range pp mp ethereal and floating, \bold { interspersed with noise bursts } }
		\line \italic { allow moments of stability but mostly underblown with pitch focus inflections }
	}
}

textLoopsForm =
\markup
{  
    \center-column 
	{
		\column 
		{
			\line \italic { the core material should be short loops from the two upper core harmonic blocks  }
			\line \italic { alternatively play freely using only the first block  }
			\line \italic { in either case use the lower displacement and grounding options to create interest  }
			\line \italic { elecs tracks individual ideas }
			
			\line 
			{
				\column 
				{
					\line \italic { make loops from \selection-range 1 3 multiphonics from the first block followed by \selection-range 0 3 multiphonics from the second }
					\line \italic { loops should have a loose sense of pulse often emphasizing a short-long rhythmic pattern }
					\line \italic { repeat loops \bold { several times } before developing mostly slowly (small additions / switching out short segments) }
					\line \bold { keep loops as consistent as possible, even when using inflections }
				}
				\lower #5 \score { \exampleLoopsForm }
				\hspace #1.5
				\override #'(font-name . "Arial Bold")
				\override #'(font-size . 1)
				
				\lower #4.8 \vcenter \concat 
				{ 
				x \hspace #0.9 \repeat-range 3 8 
				}
				\hspace #2
			}
		}
	}
}


textLoopsDisplaceA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mp mf (underblow if needed) messy and gestural, pushing against the established texture }
		\line \bold { use within loops but also to break looped patterns }
	}
}

textLoopsDisplaceB =
\markup
{  
     \override \textBSize \column 
	{
		\line \italic { play as the core material + techniques from \idea Displace }
		\line \italic { use techniques to inflect individual notes/multiphonics }
		\line \italic { elecs will add multiphonics to the core set from \idea Loops }
	}
}

textLoopsGroundA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f stable }
		\line \bold { ground the harmony  }
	}
}

textLoopsGroundB =
\markup
{  
    \override \textBSize \column 
	{
		\line \italic { play as \bold { sustain + optional dissolve } as below }
		\line \italic { pitch/multiphonic ad lib. }
		\line \italic { use ideas individually or in combination }
		\line \italic { elecs doubles and then tracks ending }
		\blankline
		\line { \variant-explain A dissolve into noise }
		\blankline
		\score { \exampleLoopsGroundDissolve }
		\blankline
		\line { \variant-explain B upwards gliss }
		\blankline
		\score { \exampleLoopsGroundGliss }
	}
}

% CENTRE

textCentreMainA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range pp mf vary between focused/stable and fragile/liminal (underblown where needed) }
	}
}

textCentreMainB =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play primarily as multiphonics in \idea Origin (+ colour trills ad lib.) }
		\line \italic { as multiphonics are added over time introduce techniques as in \idea Displace }
		\line \italic { vary the level of stability and focus (in terms of number of multiphonics)  }
	}
}

textCentreGlissesA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range ppp p dark and noisy fragments of broken sound }
	}
}

textCentreGlissesB =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play as in glissandi/microtones in \idea Origin }
		\line \italic { break into breath noise ad lib. }
		\line \italic { to start focus on circled pitches }
		\line \italic { widen the pitch ranges over time }
	}
}

textCentreForm =
\markup
{  
    \center-column 
	{
		\column 
		{
			\line \italic { intersperse multiphonic and glissandi/microtones into varied phrases }
			\line \italic { elecs tracks speed/levels of activity/attack points/space and follow changes of section/idea }
			\line { \null }
			\line \italic { increasing blur the distinction between glissandi/microtones and multiphonics }

			\line \italic { create strong moments of focus, but also explore other materials in \reference-part "Part II" as indicated }
			\line \bold { each time through try to make something new }
		}
	}
}


% PRESS

textPressA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mp f pushing against the established harmony (keep pitch high) }
	}
}

textPressB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mf refocussing the harmony }
	}
}

textPressC =
\markup 
{ 
	\override \textBSize \column 
	{
		\line \italic { play the \bold { first block } using \variant A and \variant B and the \bold { second block as clean sustains emphasizing low partials } }
		\line \italic { elecs double and track activity }
		\blankline
		\line { \variant-explain A rearticulation with changing pitch focus each attack (and sometimes within attacks) }
		\blankline
		\score { \examplePressRearticulate }
		\blankline
		\line { \variant-explain B add gliss/breaks with noise to the end of sustains }
		\blankline
		\score { \examplePressDissolve }
	}
}


% EXTEND

textExtendA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mp flickering and unstable, exploring the edges/breaks in the sound  }
	}
}

textExtendB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f strong + focussed, emphasizing low pitches  }
	}
}

textExtendC =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play using the ideas below freely combined }
		\line \italic { elecs track which blocks are in play and levels of activity and fill in harmony }
		\line \bold { use briefly as a route elsewhere or a field to inhabit }
		\blankline
		\line { \variant-explain A stable sustains with \bold { either block } (+ noise bursts for \bold { "second block" } only) }
		\blankline
		\score { \exampleExtendStable }
		\blankline
		\line { \variant-explain B rapid flickering pitch selection with \bold { first block } (+ occassionally stable moments) }
		\blankline
		\score { \exampleExtendRapidPitchSelection }
		\blankline
		\line { \variant-explain C sustains + wavering pitch focus + noise bursts with \bold { second block } }
		\blankline
		\score { \exampleExtendWavering }
	}
}


% TRANSITION

textTransitionA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f strong sustains }
	}
}

textTransitionB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mf stable but dissonant slabs of sound  }
		\line \italic { enmeshed within the texture }
	}
}

textTransitionC =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play as \bold sustains (+ flz. ad lib.)  or \variant A and \variant B as relevant to the block }
		\line \italic { elecs fill in harmony }
		\blankline
		\line { \variant-explain A \bold { first block } - sustains, each one with a crescendo, varying speed of beating ad lib. }
		\blankline
		\score { \exampleTransitionCresc }
		\blankline
		\line { \variant-explain B \bold { second block } - sustains with flickering from underblowing }
		\blankline
		\score { \exampleTransitionFlicker }
	}
}


% BLOCK 1

textBlockOneA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mp mf stable/angular sound complexes (blend into the texture) }
	}
}

textBlockOneB =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play with either \variant A or \variant B or move between them (both + flz. ad lib.) — \bold { move slowly between groups, focussing on just a few fingerings at a time }  }
		\line \italic { elecs track activity and fill in the missing harmony }
		\blankline
		\line { \variant-explain A long sustains }
		\blankline
		\score { \exampleBlockOneStable }
		\blankline
		\line { \variant-explain B obsessive angular rearticulated patterns }
		\blankline
		\score { \exampleBlockOneObssessive }
	}
}

% BLOCK 2

textBlockTwoA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \block-dynamic mf stable but dissonant slabs of sound }
	}
}

textBlockTwoB =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p mp within the texture (underblow if needed) }
	}
}

textBlockTwoC =
\markup
{ 
	\override \textBSize \column 
	{
		\line \italic { play using any combination of \concat { \variant A \hspace #0.3 , }  \variant B and \variant C to create a dense texture }
		\line \italic { elecs fill out texture (filtering materials from the second block) }
		\blankline
		\line { \variant-explain A \bold { first block } - long sustains + flickering trill / flz. ad lib. }
		\blankline
		\score { \exampleBlockTwoSustains }
		\blankline
		\line { \variant-explain B \bold { second block } - moderate to slowly varying pitch focus, maintaining multiphonics but emphasizing higher partials }
		\blankline
		\score { \exampleBlockTwoFocus }
		\blankline
		\line { \variant-explain C \bold { second block } - quiet swells (allowing underblowing at the ends of each swell) }
		\blankline
		\score { \exampleBlockTwoSwells }
	}
}

% CODA

% CENTRE

textCodaAA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f strong low + high partials }
	}
}

textCodaBA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mp mf constant and well-blended }
	}
}

textCodaCA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range mf f disrupting the flow }
	}
}

textCodaDA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p mp refocussing on a new fundamental }
	}
}

textCodaEA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range pp mp quietly displacing the stablity }
	}
}

textCodaRecA =
\markup
{  
    \override \textASize \column 
	{
		\line \italic { \dynamic-range p f static/stable }
	}
}

textSuspend =
\markup
{  
    \override \textBSize \column 
	{
		\line \bold { first time through remain suspended here for a long time }
	}
}

textCoda =
\markup
{  
    \center-column 
	{
		\column 
		{
			\line \italic { starting with only the first block, loop around the material, each time progressing as far as before or further through the blocks }
			\line \italic { aim to play some multiphonics from each block, but not necessarily all, each time }
			\line \italic { when moving back to loop you can return to the first block or something further on ad lib. }
			\line \italic { play the final block only on the last repeat  }
			\line \italic { elecs track progress and shadow the harmony }		}

		\vspace #1

		\override \textBSize \column 
		{
			\line \italic { play as \bold sustains or using the ideas below as relevant }
			\line \italic { elecs doubles and fills in the harmony, tracking progress }
			\blankline
			\line { \variant-explain A dynamic swells \bold { (where marked *) } }
			\line { \variant-explain B free pitch focus and/or selection \bold { (where marked **) } }
			\line { \variant-explain C teeth modulation \bold { (where marked ***) } }
			\line { \variant-explain D specific notes selections \bold { (as notated) } }
		}

		\vspace #1.5
		\line \bold { gradually more and more still and fragile }
	}
}