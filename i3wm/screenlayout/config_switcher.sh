#!/bin/bash
COUNT=$(xrandr -d :0 -q | grep ' connected' | wc -l)
#echo $COUNT
case $COUNT in
	1)
		$HOME/.screenlayout/laptop_screen.sh
		;;
	
	3)
		$HOME/.screenlayout/two_1080p_monitors.sh
		;;
	
	4)
		$HOME/.screenlayout/utltrawide_two_1080pmonitors.sh
		;;

esac
