#!/bin/bash

# lock=" Lock"
# setvol="Set Volume"
# volup="󰝟 Volume Up"
# voldown="󰝞 Volume Down"
#
# option=$(echo -e "$lock\n$setvol\n$volup\n$voldown" | rofi -dmenu -p "Control Panel" -lines 4)
#
# case $option in
#     $lock)
#         i3lock
#         ;;
#     $setvol)
#         bash ~/.config/polybar/scripts/controlpanel/volume.sh
#         ;;
#     $volup)
#         pamixer --increase 10
#         ;;
#     $voldown)
#         pamixer --decrease 10
#         ;;
#     *)
#         exit 1
#         ;;
# esac
eww open controlcenter
