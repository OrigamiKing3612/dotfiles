#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
git clone -b v2.1.3 https://github.com/catppuccin/tmux.git ~/.tmux/plugins/catppuccin/tmux

cd "$HOME/dotfiles"
stow tmux-server
