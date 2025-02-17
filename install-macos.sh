#!/bin/bash

if [ "$(uname)" != "Darwin" ]; then
    echo "This script is intended for macOS only."
    exit 1
fi

# Homebrew
if ! type brew &>/dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install git tmux wget stow ripgrep bat fzf zsh nvm starship neovim lazygit

REPO_URL="https://github.com/OrigamiKing3612/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"

if ! ls README* >/dev/null 2>&1; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$CLONE_DIR"
fi
cd ~/dotfiles

# Install dotfiles
stow zsh bat clean lazygit nvim starship tmux vim
source ~/.zshrc

# bat
bat cache --build

# ghostty
brew install --cask ghostty

# nvim
nvm install 22
npm install -g tree-sitter-cli

# silicon
brew install silicon

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vi +PlugInstall +qall

# zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

source ~/.zshrc
