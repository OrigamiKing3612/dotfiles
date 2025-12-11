#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

if [ "$PROCESSOR" = "x86_64" ]; then
    LG_ARCH="x86_64"
elif [ "$PROCESSOR" = "aarch64" ]; then
    LG_ARCH="arm64"
else
    echo "Unsupported architecture: $PROCESSOR"
    exit 1
fi

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r .tag_name)
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LG_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz

cd "$HOME/dotfiles"
stow lazygit
