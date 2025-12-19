#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

cd "$HOME"

sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

rm -rf "$HOME/yay"
