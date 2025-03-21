#!/bin/bash

icon() {
    if [[ "$(pactl get-sink-mute 0 | awk '{print $2}')" = "no" ]]; then

        vol=$(pactl get-sink-volume 0 | grep -Po '\d+(?=%)' | head -n 1)

        if [[ ${vol} -ge 80 ]]; then
            echo "󰕾 "
        elif [[ ${vol} -ge 40 ]]; then
            echo "󰖀 "
        elif [[ ${vol} -ge 10 ]]; then
            echo "󰕿 "
        else
            echo "󰝟 "
        fi
    else
        echo "󰝟 "
    fi
}

getvol() {
    vol=$(pactl get-sink-volume 0 | grep -Po '\d+(?=%)' | head -n 1)
    echo $vol
}

if [[ $1 == "--icon" ]]; then
    icon
elif [[ $1 == "--value" ]]; then
    getvol
fi
