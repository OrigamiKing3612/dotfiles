#!/bin/bash

# Clean thumbnails cache
rm -rf /home/origami/.cache/thumbnails/*

# Clean apt cache
size=$(du -sh /var/cache/apt)
echo "apt cache size: $size"

apt clean

size=$(du -sh /var/cache/apt)
echo "apt cache size: $size"

echo ""

# apt
echo "dpkg --configure -a"
dpkg --configure -a

echo "update"
apt update
apt-get update

echo "upgrade"
apt upgrade -y
apt-get upgrade -y

echo "dist-upgrade"
apt dist-upgrade -y
apt-get dist-upgrade -y

echo "autoremove"
apt autoremove -y
apt-get autoclean -y

echo "clean"
apt -s clean
apt clean all
apt-get -s clean
apt-get clean all

echo ""

# clean logs
journalctl --vacuum-time=3d

# clean older version of snap apps
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done
echo ""

# docker
docker image prune -f

echo "Done!!"
