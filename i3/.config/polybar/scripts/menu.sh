#!/bin/bash
option=$(echo -e "Settings\nShutdown\nReboot\nLogout" | rofi -dmenu -p "System Actions" -lines 10)

case $option in
    Settings)
        xfce4-settings-manager &
        ;;
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
