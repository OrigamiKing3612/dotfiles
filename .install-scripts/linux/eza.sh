#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y eza

cd "$HOME/dotfiles"
stow eza
