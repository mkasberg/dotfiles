#!/bin/bash

##
# Script to install & update Mike's applications for Ubuntu.
##

set -e

# Run this as sudo!
if [ $EUID != 0 ]; then
    sudo bash "$0" "$@"
    exit $?
fi

apt update
apt upgrade

# Install tools used later
apt install -y gpg sudo wget curl

# Mise Apt Repo
# https://mise.jdx.dev/installing-mise.html#apt
if [ ! -f /etc/apt/sources.list.d/mise.list ]; then
    install -dm 755 /etc/apt/keyrings
    wget -qO - https://mise.jdx.dev/gpg-key.pub | gpg --dearmor | tee /etc/apt/keyrings/mise-archive-keyring.gpg 1> /dev/null
    echo "deb [signed-by=/etc/apt/keyrings/mise-archive-keyring.gpg arch=amd64] https://mise.jdx.dev/deb stable main" | tee /etc/apt/sources.list.d/mise.list
    apt update
fi

# GH CLI Repo
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md
if [ ! -f /ect/apt/sources.list.d/github-cli.list ]; then
	mkdir -p -m 755 /etc/apt/keyrings
	out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg
	cat $out | tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
	chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
	mkdir -p -m 755 /etc/apt/sources.list.d
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | tee /etc/apt/sources.list.d/github-cli.list > /dev/null
	apt update
fi

# Install PHP, but I don't need a web server.
apt install -y --no-install-recommends php

# Install Applications with apt
apt install \
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
    gh \
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
    snap install --classic intellij-idea-community
    snap install localsend
    snap install --classic nvim
    snap install spotify
fi
