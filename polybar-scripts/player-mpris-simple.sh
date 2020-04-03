#!/bin/sh

player_status=$(playerctl status 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)
title=$(playerctl metadata title 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    if [ "$artist" != "" ]; then
	echo "$artist - $title" | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
    else
	echo "$title" | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
    fi
elif [ "$player_status" = "Paused" ]; then
    echo "$(playerctl metadata artist) - $(playerctl metadata title)" | awk -v len=50 '{ if (length($0) > len) print substr($0, 1, len-3) "..."; else print; }'
else
    echo ""
fi

