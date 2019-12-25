#!/bin/sh

player_status=$(playerctl status 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)" | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
elif [ "$player_status" = "Paused" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)" | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
else
    echo ""
fi

