#!/bin/bash

VOLUME_STEP=2
PA_MAX_VOLUME=100

get_current_master_volume() {
    pactl list sinks | \
        grep "Name:\|Volume:" | \
        grep -v "Base Volume:" | \
        sed 'N;s/\n//' | \
        grep $(pactl info| grep "Default Sink" | cut -d' ' -f3) | \
        awk '{print ($7 + $14)/2}'
}

get_volume_as_a_percentage() {
        echo "$(get_current_master_volume) / ${PA_MAX_VOLUME} * 100" | bc -l | cut -d'.' -f1
}

case "$1" in
    up)
        if [[ $PA_MAX_VOLUME -gt $(expr $(get_current_master_volume) + $VOLUME_STEP) ]]; then
            pactl set-sink-volume @DEFAULT_SINK@ +${VOLUME_STEP}%
        else
            pactl set-sink-volume @DEFAULT_SINK@ ${PA_MAX_VOLUME}%
        fi
        get_volume_as_a_percentage > ${SWAYSOCK}.wob
        ;;

    down)
        if [[ 0 -lt $(expr $(get_current_master_volume) - $VOLUME_STEP) ]]; then
            pactl set-sink-volume @DEFAULT_SINK@ -${VOLUME_STEP}%
        else
            pactl set-sink-volume @DEFAULT_SINK@ 0%
        fi
        get_volume_as_a_percentage > ${SWAYSOCK}.wob
        ;;
    mute)
        pactl set-sink-mute @DEFAULT_SINK@ toggle
        ;;
    status|*)
        get_volume_as_a_percentage
        ;;
esac
