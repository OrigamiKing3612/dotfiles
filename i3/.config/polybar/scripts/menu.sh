#!/bin/bash
option=$(echo -e "Shutdown\nReboot\nLogout" | rofi -dmenu -p "System Actions" -lines 10)

case $option in
    Shutdown)
        poweroff
        ;;
    Restart)
        reboot
        ;;
    Logout)
        pkill -KILL -u $USER
        ;;
    *)
        exit 1
        ;;
esac
