#!/bin/bash

##
# Script to install & update Mike's AUR applications for Arch Linux.
##

set -e

# Install yay AUR helper if not present
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
    yay -Y --gendb
fi

# Install packages from the AUR
yay -S --needed \
    fastfetch \
    intellij-idea-community-edition \
    localsend-bin \
    mise \
    spotify-launcher \
    ttf-ms-fonts
