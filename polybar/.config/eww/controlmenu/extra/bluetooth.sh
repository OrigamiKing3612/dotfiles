#!/bin/bash

toggle() {
    STATUS="$(bluetoothctl show | grep Powered | awk '{print $2}')"
    if [ $STATUS == "yes" ]; then
        bluetoothctl power off
    else
        bluetoothctl power on
    fi
}

icon() {
        # not connected
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
                echo "󰂲"
        else
                # on
                if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
                        echo "󰂯"
                else
                        echo "󰂱"
                fi
        fi
}

class() {
    # off
    if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]
    then
        echo "󰂲"
    else
        # on
        if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]
        then
            echo "󰂯"
            # connected
        else
            echo "󰂯"
        fi
    fi
}

status() {
        # not connected
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
                echo "Off"
        else
                # on
                if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
                        echo "On"
                else
                        # get device alias
                        DEVICE=`echo info | bluetoothctl | grep 'Alias:' | awk -F:  '{ print $2 }'`
                        echo "$DEVICE"
                fi
        fi
}

battery() {
        # not connected
        if [ $(bluetoothctl show | grep "Powered: yes" | wc -c) -eq 0 ]; then
                echo "Currently Off"
        else
                # on
                if [ $(echo info | bluetoothctl | grep 'Device' | wc -c) -eq 0 ]; then
                        echo "Not Connected"
                else
                        BATTERY=`upower -i /org/freedesktop/UPower/devices/headset_dev_33_33_55_33_90_D0 | grep percentage | cut -b 26-28`
                        echo "Battery Level: $BATTERY"
                fi
        fi
}

if [[ $1 == "--status" ]]; then
        status
elif [[ $1 == "--icon" ]]; then
        icon
elif [[ $1 == "--toggle" ]]; then
        toggle
elif [[ $1 == "--class" ]]; then
    class
elif [[ $1 == "--battery" ]]; then
    battery
fi
