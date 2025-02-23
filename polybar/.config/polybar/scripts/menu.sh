#!/bin/bash

settings=" Settings"
lock=" Lock"
shutdown=" Shutdown"
reboot="󰜉 Reboot"
logout="󰍃 Logout"
volume="  Volume Control"


option=$(echo -e "$settings\n$volume\n$shutdown\n$reboot\n$lock\n$logout" | rofi -dmenu -p "System Actions" -lines 5)

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
    $volume)
        pavucontrol
        ;;
    *)
        exit 1
        ;;
esac
