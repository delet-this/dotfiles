#!/bin/bash

# More info : https://github.com/jaagr/polybar/wiki

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

desktop=$(echo $DESKTOP_SESSION)
count=$(xrandr --query | grep " connected" | cut -d" " -f1 | wc -l)
PRIMARY_MONITOR=$(xrandr | grep primary | cut -d ' ' -f 1)

case $desktop in

    i3)
    if type "xrandr" > /dev/null; then
      for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	if [ "$m" == "$PRIMARY_MONITOR" ]; then
	MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
	else
        MONITOR=$m polybar --reload sidebar-i3 -c ~/.config/polybar/config &
      	fi
	done
    else
    polybar --reload mainbar-i3 -c ~/.config/polybar/config &
    fi
    ;;

esac
