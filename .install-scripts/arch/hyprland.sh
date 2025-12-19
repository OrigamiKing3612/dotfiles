#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

sudo pacman -S hyprland hypridle hyprlock hyprpaper waybar wofi rofi hyprpolkitagent swaync blueman alsa-utils bluez brightnessctl pavucontrol pamixer hyprlauncher hyprtoolkit hyprutils
yay -S hyprshot wlogout

sudo mkdir -p /usr/share/wlogout/icons
sudo ln -s ~/.config/wlogout/icons/* /usr/share/wlogout/icons/
chmod +r ~/.config/wlogout/icons/*.svg
