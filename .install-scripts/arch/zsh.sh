#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

stow zsh lazygit bat
sudo pacman -S zsh starship bat
