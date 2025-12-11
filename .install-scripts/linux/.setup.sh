#!/bin/bash

set -e

if [ "$(uname)" != "Linux" ]; then
    echo "This script is intended for Linux only."
    exit 1
fi

if [[ "$(uname -r)" =~ *ARCH* ]]; then
    echo "Updating package lists for Debian-based system..."
    exit 1
fi

if [ "$EUID" -ne 0 ]; then
    echo "Please run with sudo"
    exit 1
fi

sudo apt update

needed=(git jq curl wget stow tar)

for pkg in "${needed[@]}"; do
    if ! command -v "$pkg" >/dev/null 2>&1; then
        echo "$pkg not found. Installing..."
        sudo apt install -y "$pkg"
    fi
done
