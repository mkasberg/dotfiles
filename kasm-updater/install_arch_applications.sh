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

# Install yay AUR helper if not present
if ! command -v yay &> /dev/null; then
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
    rm -rf /tmp/yay
fi

# Install Applications with pacman
pacman -S --needed \
    audacity \
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
    gnome-tweaks \
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
    markdown \
    meld \
    neovim \
    openscad \
    p7zip \
    php \
    php-bcmath \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    python \
    ripgrep \
    ruby \
    rust \
    the_silver_searcher \
    texlive-most \
    texlive-fontsextra \
    transmission-gtk \
    units \
    gvim \
    vlc \
    zlib \
    zsh

# Install packages from the AUR
yay -S --needed \
    fastfetch \
    intellij-idea-community-edition \
    localsend-bin \
    mise \
    spotify-launcher \
    ttf-ms-fonts
