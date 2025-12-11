#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

case "$PROCESSOR" in
x86_64)
    LG_ARCH="x86_64"
    ;;
aarch64)
    LG_ARCH="arm64"
    ;;
*)
    echo "Unsupported architecture: $PROCESSOR"
    exit 1
    ;;
esac

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | jq -r .tag_name | tr -d '\n')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${LG_ARCH}.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit.tar.gz

cd "$HOME/dotfiles"
stow lazygit
