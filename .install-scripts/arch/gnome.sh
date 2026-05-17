#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

sudo pacman -S gdm gnome-font-viewer gnome-tweaks gnome-session gnome-menus nautilus gnome-control-center gnome-system-monitor gnome-disk-utility gnome-screenshot ghostty
