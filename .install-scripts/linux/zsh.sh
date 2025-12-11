#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

sudo apt install -y zsh

cd "$HOME/dotfiles"
stow zsh
