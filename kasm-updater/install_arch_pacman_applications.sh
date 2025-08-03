#!/bin/bash

##
# Script to install & update Mike's applications for Arch Linux.
##

set -e

# Run this as sudo!
if [ $EUID != 0 ]; then
    sudo bash "$0" "$@"
    exit $?
fi

pacman -Syu --noconfirm

# Install base-devel and git if not present, needed for AUR helper
pacman -S --needed --noconfirm base-devel git

# Install Applications with pacman
pacman -S --needed \
    audacity \
    base-devel \
    borg \
    curl \
    docker \
    docker-buildx \
    docker-compose \
    fastfetch \
    ffmpeg \
    filezilla \
    flameshot \
    fontconfig \
    fzf \
    github-cli \
    gimp \
    git \
    goaccess \
    htop \
    imagemagick \
    jq \
    libffi \
    mariadb-libs \
    postgresql-libs \
    readline \
    openssl \
    libxml2 \
    libyaml \
    meld \
    neovim \
    openscad \
    p7zip \
    php \
    python \
    ripgrep \
    ruby \
    rust \
    the_silver_searcher \
    transmission-gtk \
    gvim \
    vlc \
    zlib \
    zsh
