#!/bin/bash

set -euo pipefail  # Exit on error, undefined vars, pipe failures

if [ "$(uname)" != "Darwin" ]; then
    echo "This script is intended for macOS only."
    exit 1
fi

echo "Setting up dotfiles for macOS..."

# Homebrew
if ! type brew &>/dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing system packages..."
brew install git tmux wget stow ripgrep bat fzf zsh nvm starship neovim lazygit zoxide

REPO_URL="https://github.com/OrigamiKing3612/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"

if ! ls README* >/dev/null 2>&1; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$CLONE_DIR"
    cd "$CLONE_DIR"
else
    echo "Repository already exists, updating..."
    cd "$HOME/dotfiles"
    git pull
fi

echo "Setting up dotfiles with stow..."
# Backup existing .zshrc if it exists and isn't a symlink
if [ -f ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup.$(date +%Y%m%d_%H%M%S)
fi

# Install dotfiles
stow zsh bat clean lazygit nvim starship tmux vim

# ---------- Installing Additional Tools ----------

# bat
echo "Building bat cache..."
bat cache --build

# ghostty
if ! command -v ghostty &> /dev/null; then
    echo "Installing Ghostty terminal..."
    brew install --cask ghostty
else
    echo "Ghostty already installed, skipping..."
fi

# nvim node dependencies
echo "Installing Node.js and tree-sitter-cli..."
nvm install --lts
nvm use --lts
npm install -g tree-sitter-cli

# silicon
if ! command -v silicon &> /dev/null; then
    echo "Installing Silicon..."
    brew install silicon
else
    echo "Silicon already installed, skipping..."
fi

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
    echo "Installing tmux plugin manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager already installed"
fi

# vim (legacy support)
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vi +PlugInstall +qall
fi

# zsh plugins
if [ ! -d ~/.zsh/zsh-syntax-highlighting ]; then
    echo "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting
fi

if [ ! -d ~/.zsh/zsh-autosuggestions ]; then
    echo "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
fi

echo "================================================"
echo "✅ Dotfiles setup completed successfully!"
echo "================================================"
echo "Next steps:"
echo "1. Restart your terminal or run 'source ~/.zshrc'"
echo "2. Open tmux and press Ctrl-s + I to install plugins"
echo "3. Open nvim and run ':Lazy sync' to install plugins"
echo "================================================"

source ~/.zshrc
