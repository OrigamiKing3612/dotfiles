#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

curl -sS https://starship.rs/install.sh | sh -s -- -y

cd "$HOME/dotfiles"
stow starship-server

source "$HOME/.bashrc"
