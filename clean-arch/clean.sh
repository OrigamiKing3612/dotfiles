#!/bin/bash

# Clean thumbnails cache
rm -rf /home/origami/.cache/thumbnails/*

echo ""

echo "Sync Database"
pacman -Syyu

echo "remove unused packages"
pacman -Rns

orphans=$(pacman -Qdtq)
if [ -n "$orphans" ]; then
    echo "remove orphaned packages"
    sudo pacman -Rns $orphans --noconfirm
fi

if command -v yay &>/dev/null; then
    echo "clean aur packges"
    yay -Sc --noconfirm
fi

echo ""

# clean logs
journalctl --vacuum-time=3d

# docker
if type docker &>/dev/null; then
    docker image prune -f
fi

echo "Done!!"
