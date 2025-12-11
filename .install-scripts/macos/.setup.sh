#!/bin/bash

set -e

if [ "$(uname)" != "Darwin" ]; then
    echo "This script is intended for macOS only."
    exit 1
fi

if ! type brew &>/dev/null; then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
