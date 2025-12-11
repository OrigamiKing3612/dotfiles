#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

mv ~/.bashrc ~/bashrc.backup

cd "$HOME/dotfiles"
stow bash

echo "Make sure to check bashrc.backup for any custom configurations you had before."
