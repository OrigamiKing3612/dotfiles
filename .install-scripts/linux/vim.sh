#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y vim fzf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd "$HOME/dotfiles"
stow vim

cd "$HOME"

vim +PlugInstall +qall
