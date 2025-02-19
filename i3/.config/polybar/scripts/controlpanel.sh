#!/bin/bash

lock=" Lock"
volup="󰝟 Volume Up"
voldown="󰝞 Volume Down"

option=$(echo -e "$lock\n$volup\n$voldown" | rofi -dmenu -p "Control Panel" -lines 5)

case $option in
    $lock)
        i3lock
        ;;
    $volup)
        pamixer --increase 5
        ;;
    $voldown)
        pamixer --decrease 5
        ;;
    *)
        exit 1
        ;;
esac
