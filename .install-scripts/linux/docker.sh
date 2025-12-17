#!/bin/bash

set -e

source ~/dotfiles/.install-scripts/linux/.setup.sh

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
rm get-docker.sh
