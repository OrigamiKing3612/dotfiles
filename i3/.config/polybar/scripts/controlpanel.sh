#!/bin/bash

settings=" Settings"
shutdown=" Shutdown"
reboot="󰜉 Reboot"
lock=" Lock"
logout="󰍃 Logout"


option=$(echo -e "$settings\n$shutdown\n$reboot\n$lock\n$logout" | rofi -dmenu -p "Control Panel" -lines 5)

case $option in
    $settings)
        xfce4-settings-manager &
        ;;
    $shutdown)
        poweroff
        ;;
    $reboot)
        reboot
        ;;
    $lock)
        i3lock
        ;;
    $logout)
        pkill -KILL -u $USER
        ;;
    *)
        exit 1
        ;;
esac
