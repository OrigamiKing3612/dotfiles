#!/bin/bash

sudo pacman -S hyprland hypridle hyprlock hyprpaper waybar wofi rofi hyprpolkitagent swaync blueman alsa-utils bluez
yay -S hyprshot wlogout

sudo mkdir -p /usr/share/wlogout/icons
sudo ln -s ~/.config/wlogout/icons/* /usr/share/wlogout/icons/
chmod +r ~/.config/wlogout/icons/*.svg

