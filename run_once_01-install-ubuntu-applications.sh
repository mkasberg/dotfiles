#!/usr/bin/env bash

##
# Script to install Mike's applications for Ubuntu.
##

# Run this as sudo!
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

# Install PHP, but I don't need a web server.
apt-get install --no-install-recommends php

# Install Applications with apt-get
apt-get install \
    audacity \
    build-essential \
    curl \
    default-jdk \
    filezilla \
    ffmpeg \
    gimp \
    gimp-plugin-registry \
    git \
    gitk \
    libreadline-dev \
    libssl-dev \
    markdown \
    meld \
    php-bcmath \
    php-curl \
    php-mbstring \
    php-xml \
    php-zip \
    ruby \
    ruby-dev \
    texlive \
    texlive-fonts-extra \
    ttf-mscorefonts-installer \
    vim-gtk3 \
    vlc \
    zlib1g-dev

# Install snap packages
snap install --classic intellij-idea-community
snap install --classic heroku
snap install spotify
snap install bw


# Now, manually set up:
# 
# Yarn: https://yarnpkg.com/en/
# Docker: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce
# Docker-Compose: https://github.com/docker/compose/releases
# VS Code: https://code.visualstudio.com/
# Atom: https://atom.io

