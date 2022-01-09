#!/usr/bin/bash

BRIGHTNESS=$(brightnessctl g)

if (($BRIGHTNESS >= 170)); then
    echo 
elif ((85 <= $BRIGHTNESS <= 170)); then
    echo 
elif (($BRIGHTNESS =< 85)); then
    echo 
else
    echo 
fi