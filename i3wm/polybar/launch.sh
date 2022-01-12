#!/usr/bin/env sh

# Terminate already running bar instances
# killall -q polybar

# Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar base &

sleep .5
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload settings &
    MONITOR=$m polybar --reload window &
    MONITOR=$m polybar --reload wsbar &
    MONITOR=$m polybar --reload back &
    MONITOR=$m polybar --reload root &
  done
else
    polybar --reload settings &
    polybar --reload window &
    polybar --reload wsbar &
    polybar --reload back &
    polybar --reload root &
    polybar --reload mon2 &
fi




echo "Bars launched..."

