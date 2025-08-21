#!/bin/bash

set -euo pipefail  # Exit on error, undefined vars, pipe failures

if [ "$(uname)" != "Linux" ]; then
    echo "This script is intended for Linux only."
    exit 1
fi

# ---------- Variables ----------

PROCESSOR=$(uname -m)
REPO_URL="https://github.com/OrigamiKing3612/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"
if [ "$PROCESSOR" = "x86_64" ]; then
    NVIM_ARCH="64"
elif [ "$PROCESSOR" = "aarch64" ]; then
    NVIM_ARCH="arm64"
else
    echo "Unsupported architecture: $PROCESSOR"
    exit 1
fi

# ---------- Installing Dependencies ----------

echo "Installing system packages..."
if [[ "$(uname -r)" == *ARCH* ]]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm curl git tmux wget stow ripgrep yazi lazygit base-devel neovim neofetch gh bat zoxide
else
    sudo apt update && sudo apt install -y curl git tmux wget stow ripgrep build-essential neofetch gh bat zoxide
fi

if ! ls README* >/dev/null 2>&1; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$CLONE_DIR"
    cd "$CLONE_DIR"
else
    echo "Repository already exists, updating..."
    cd "$HOME/dotfiles"
    git pull
fi

touch ~/.hushlogin

echo "Setting up dotfiles with stow..."
# Backup existing .bashrc if it exists and isn't a symlink
if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.backup.$(date +%Y%m%d_%H%M%S)
fi

stow bash bat clean lazygit nvim starship-server tmux vim yazi silicon

# ---------- Installing Stuff ----------

# bat
bat cache --build

# lazygit
if [[ "$(uname -r)" != *ARCH* ]]; then
    if ! command -v lazygit &> /dev/null; then
        echo "Installing lazygit..."
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit -D -t /usr/local/bin/
        rm lazygit lazygit.tar.gz
    else
        echo "lazygit already installed, skipping..."
    fi
fi

# nvim
if [[ "$(uname -r)" != *ARCH* ]]; then
    echo "Installing Neovim for architecture: $PROCESSOR (using nvim-linux${NVIM_ARCH}.tar.gz)"
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux${NVIM_ARCH}.tar.gz
    sudo rm -rf /opt/nvim-linux${NVIM_ARCH}
    sudo tar -C /opt -xzf nvim-linux${NVIM_ARCH}.tar.gz
    rm nvim-linux${NVIM_ARCH}.tar.gz
    
    # Add nvim to PATH if not already there
    if ! command -v nvim &> /dev/null; then
        echo "export PATH=\"/opt/nvim-linux${NVIM_ARCH}/bin:\$PATH\"" >> ~/.bashrc
    fi
fi

# Install NVM if not already installed
if [ ! -d "$HOME/.nvm" ]; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
else
    echo "NVM already installed, skipping..."
fi

# Source NVM for current session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Install and use LTS Node.js
echo "Installing Node.js LTS..."
nvm install --lts
nvm use --lts
npm install -g tree-sitter-cli

# starship
if ! command -v starship &> /dev/null; then
    echo "Installing Starship prompt..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "Starship already installed, skipping..."
fi

# tmux
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "tmux plugin manager already installed"
fi

# vim (don't install beucase different versions)
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vi +PlugInstall +qall

source ~/.bashrc
echo "================================================"
echo "✅ Dotfiles setup completed successfully!"
echo "================================================"
echo "Next steps:"
echo "1. Restart your terminal or run 'source ~/.bashrc'"
echo "2. Open tmux and press Ctrl-s + I to install plugins"
echo "3. Open nvim and run ':Lazy sync' to install plugins"
echo "4. Run 'neofetch' to see system info"
echo "================================================"
neofetch
