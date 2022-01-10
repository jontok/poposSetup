#!/bin/sh

BLANK='#00000000'
CLEAR='#ffffff22'
DEFAULT='#06a284'
WRONG='#FA7301'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$DEFAULT   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$DEFAULT         \
--wrong-color=$WRONG          \
--time-color=$DEFAULT           \
--date-color=$DEFAULT           \
--layout-color=$DEFAULT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--color '000000'              \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %m %Y"       \
