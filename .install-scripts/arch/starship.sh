#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

stow starship
sudo pacman -S starship
