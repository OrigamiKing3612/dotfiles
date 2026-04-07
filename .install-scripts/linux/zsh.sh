#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y zsh

cd "$HOME/dotfiles"
stow zsh
zcompile ./.extra_files/sesh.zsh
zcompile ./.extra_files/zsh_syntax_highlighting.zsh
