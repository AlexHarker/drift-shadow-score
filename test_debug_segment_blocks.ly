
#(define multi_display #f)

\include "score_blocks.ly"
\include "layout_utility.ly"
\include "layout_setup.ly"

\version "2.22.1"

% BLOCKS

\removeWithTag #'debug 
\new Score { \componentOriginMain }

\removeWithTag #'debug 
\new Score { \componentDisplace }

\removeWithTag #'debug 
\new Score { \componentGround }

\removeWithTag #'debug 
\new Score { \componentPush }

\pageBreak

\removeWithTag #'debug 
\new Score { \sectionClusterOne }

\removeWithTag #'debug 
\new Score { \sectionClusterTwo }

\removeWithTag #'debug 
\new Score { \sectionDivision }