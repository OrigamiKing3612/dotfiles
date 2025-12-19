#!/bin/bash

set -e

if [ "$(uname)" != "Linux" ]; then
    echo "This script is intended for Linux only."
    exit 1
fi

if ! [[ "$(uname -r)" =~ *ARCH* ]]; then
    echo "This script is intended for Arch Linux only."
    exit 1
fi

sudo pacman -Syu --noconfirm

needed=(git jq curl wget stow tar base-devel)

for pkg in "${needed[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        echo "$pkg not found. Installing..."
        sudo pacman -S "$pkg"
    fi
done

: "${PROCESSOR:=$(uname -m)}"
