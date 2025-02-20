#!/bin/bash
STATUS=$(pactl get-sink-mute 0 | awk '{print $2}')
toggle() {
    if [ $STATUS == "no" ]; then
        pactl set-sink-mute 0 toggle
    else
        pactl set-sink-mute 0 toggle
    fi
}

icon() {
    if [ $STATUS == "no" ]; then
        echo "󰕾"
    else
        echo "󰖁"
    fi
}

status() {
    if [ $STATUS == "no" ]; then
        echo "On"
    else
        echo "Off"
    fi
}

if [[ $1 == "--toggle" ]]; then
    toggle
elif [[ $1 == "--icon" ]]; then
    icon
elif [[ $1 == "--status" ]]; then
    status
fi
