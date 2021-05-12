#!/bin/sh

_screen() {
    xwinwrap -ov -g $1 -- mpv --fullscreen\
        --on-all-workspaces \
        --no-stop-screensaver \
        --no-resume-playback \
        --x11-bypass-compositor=yes \
        --loop-file --no-audio --mute=yes --no-osc -wid WID --no-osd-bar --quiet --fps=25\
        "$2" --background="$3" --video-zoom="$4" --hwdec=auto-safe --load-scripts=no &
}

killall xwinwrap

sleep 0.5

for i in $( xrandr -q | grep ' connected' | grep -oP '\d+x\d+\+\d+\+\d+')
do
    _screen $i "$1" "${2:-#000000}" "${3:-0}"
done
