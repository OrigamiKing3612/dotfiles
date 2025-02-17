#/bin/bash

if [ "$(uname)" != "Linux" ]; then
    echo "This script is intended for Linux only."
    exit 1
fi

# Install required packages based on distro
if [[ "$(uname -r)" == *ARCH* ]]; then
    sudo pacman -Syu --noconfirm
    sudo pacman -S --noconfirm curl git tmux wget stow ripgrep yazi lazygit base-devel
else
    sudo apt update && sudo apt install -y curl git tmux wget stow ripgrep build-essential
fi

if [ "$PROCESSOR" = "x86_64" ]; then
    NVIM_ARCH="64"
elif [ "$PROCESSOR" = "aarch64" ]; then
    NVIM_ARCH="arm64"
else
    echo "Unsupported architecture: $PROCESSOR"
    exit 1
fi
REPO_URL="https://github.com/OrigamiKing3612/dotfiles.git"
CLONE_DIR="$HOME/dotfiles"
PROCESSOR=$(uname -m)

# Check if a README file exists (case-insensitive)
if ! ls README* >/dev/null 2>&1; then
    echo "Cloning repository..."
    git clone "$REPO_URL" "$CLONE_DIR"
fi

cd "$HOME/dotfiles"
stow bash bat clean lazygit nvim starship tmux vim yazi silicon

# ---------- Installing Stuff ----------

# bat
bat cache --build

# lazygit

# nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux{$NVIM_ARCH}.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux{$NVIM_ARCH}.tar.gz

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install 22
npm install -g tree-sitter-cli

# starship
curl -sS https://starship.rs/install.sh | sh -s -- -y

# tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# vim (don't install beucase different versions)
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# vi +PlugInstall +qall
if [[ "$(uname -r)" != *ARCH* ]]; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit.tar.gz
fi

source ~/.bashrc
