#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

stow nvim lazygit
sudo pacman -S neovim lazygit ripgrep fzf oft-firamono-nerd
