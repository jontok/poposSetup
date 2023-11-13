#!/usr/bin/env sh

sleep .5
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload window &
  done
else
    polybar --reload window &
fi
echo "Bars launched..."

