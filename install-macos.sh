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

brew install git

REPO_URL="https://github.com/OrigamiKing3612/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"

if ! ls README* >/dev/null 2>&1; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$CLONE_DIR"
fi
cd ~/dotfiles

brew bundle --file=./Brewfile

# Install dotfiles
stow bat eza ghostty git kanata barabiner lazygit npm nushell nvim raycast sesh silicon starship tmux vim yazi zsh
source ~/.zshrc

# bat
bat cache --build

# nvim
nvm install 25
npm install -g tree-sitter-cli

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

source ~/.zshrc
