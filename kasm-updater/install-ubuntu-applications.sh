#!/bin/bash

##
# Script to install & update Mike's applications for Ubuntu.
##

set -e

if [[ $EUID -ne 0 ]]; then
  SUDO='sudo'
else
  SUDO=''
fi

$SUDO apt update
$SUDO apt upgrade

# Install tools used later
$SUDO apt install -y gpg sudo wget curl

# Mise Apt Repo
# https://mise.jdx.dev/installing-mise.html#apt
if [ ! -f /etc/apt/sources.list.d/mise.list ]; then
    $SUDO install -dm 755 /etc/apt/keyrings
    wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | $SUDO tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | $SUDO tee /etc/apt/sources.list.d/mise.list
    $SUDO apt update
fi

# Install PHP, but I don't need a web server.
$SUDO apt install -y --no-install-recommends php

# Install Applications with apt
$SUDO apt install \
    audacity \
    borgbackup \
    build-essential \
    curl \
    default-jdk \
    docker.io \
    docker-buildx \
    docker-compose \
    fastfetch \
    ffmpeg \
    filezilla \
    flameshot \
    fontconfig \
    fzf \
    gimp \
    git \
    gitk \
    gnome-tweaks \
    goaccess \
    htop \
    imagemagick \
    jq \
    libffi-dev \
    libmysqlclient-dev \
    libpq-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    libyaml-dev \
    markdown \
    meld \
    mise \
    openscad \
    p7zip \
    php-bcmath \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    python3 \
    ripgrep \
    ruby \
    ruby-dev \
    rustc \
    silversearcher-ag \
    texlive \
    texlive-fonts-extra \
    transmission \
    ttf-mscorefonts-installer \
    units \
    vim-gtk3 \
    vlc \
    zlib1g-dev \
    zsh

# Install snap packages
if command -v snap &> /dev/null; then
    $SUDO snap install --classic intellij-idea-community
    $SUDO snap install localsend
    $SUDO snap install --classic nvim
    $SUDO snap install spotify
fi
