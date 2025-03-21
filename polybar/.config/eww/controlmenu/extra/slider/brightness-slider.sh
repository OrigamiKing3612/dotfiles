#!/bin/bash

icon() {
    # Lets round the float result
    bri=$(brightnessctl i -m | tr , " " | awk '{print $4}' | cut -c 1-2)

    if [[ "$bri" -gt "90" ]]; then
        echo "󰃠"
        elif [[ "$bri" -gt "50" ]]; then
        echo "󰃝"
        elif [[ "$bri" -gt "30" ]]; then
        echo "󰃟"
    else
        echo "󰃞"
    fi
}

getbri() {
    bri=$(brightnessctl i -m | tr , " " | awk '{print $4}' | cut -c 1-2)
    echo $bri
}

if [[ $1 == "--icon" ]]; then
    icon
    elif [[ $1 == "--value" ]]; then
    getbri
fi
