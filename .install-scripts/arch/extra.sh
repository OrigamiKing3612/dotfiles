#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/arch/.setup.sh

pacman -S pavucontrol nm-connection-editor brightnessctl
