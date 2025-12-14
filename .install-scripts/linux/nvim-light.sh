#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

case "$PROCESSOR" in
x86_64)
    NVIM_ARCH="x86_64"
    ;;
aarch64)
    NVIM_ARCH="arm64"
    ;;
*)
    echo "Unsupported architecture: $PROCESSOR"
    exit 1
    ;;
esac

sudo apt install -y ripgrep fzf

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${NVIM_ARCH}.tar.gz
sudo rm -rf /opt/nvim
sudo mkdir -p /opt/nvim
sudo tar -xzf nvim-linux-${NVIM_ARCH}.tar.gz -C /opt/nvim --strip-components=1
rm nvim-linux-${NVIM_ARCH}.tar.gz

VERSION=$(curl -s "https://api.github.com/repos/nvm-sh/nvm/releases/latest" | jq -r .tag_name | tr -d '\n')
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${VERSION}/install.sh | bash
source ~/.bashrc
nvm install 25
npm install -g tree-sitter-cli

cd "$HOME/dotfiles"
stow nvim-light
