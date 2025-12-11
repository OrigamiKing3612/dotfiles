#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y bat

cd "$HOME/dotfiles"
stow bat

cd "$HOME"

bat cache --build
