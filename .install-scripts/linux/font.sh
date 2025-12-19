#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraMono.zip
unzip FiraMono.zip
fc-cache -fv
fc-list | grep -i fira
