#!/bin/bash

##
# Script to install & update Mike's applications on Omarchy.
#
# Omarchy already ships docker, git, base-devel, fastfetch, fzf, jq, ripgrep,
# ruby, neovim, mise, gh (via mise), localsend, JetBrainsMono Nerd Font, and
# more, so they're not listed here. The omarchy commands handle sudo
# themselves, so run this as your normal user.
##

set -e

# Updates system packages and runs Omarchy's migrations. Don't use pacman -Syu
# directly on Omarchy, it skips the migrations.
omarchy update -y

# Install Applications from the Arch repos (skips any already installed)
omarchy pkg add \
    7zip \
    audacity \
    borg \
    filezilla \
    gimp \
    goaccess \
    htop \
    intellij-idea-oss \
    meld \
    openscad \
    php \
    rust \
    spotify-launcher \
    the_silver_searcher \
    transmission-gtk \
    ttf-firacode-nerd \
    ttf-ibmplex-mono-nerd \
    ttf-sourcecodepro-nerd \
    vim \
    vlc \
    zsh

# Install Applications from the AUR
omarchy pkg aur add \
    ttf-ms-fonts
