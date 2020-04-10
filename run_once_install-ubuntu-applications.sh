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

apt-get install \
    audacity \
    curl \
    default-jdk \
    filezilla \
    ffmpeg \
    gimp \
    gimp-plugin-registry \
    git \
    gitk \
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
    vim-gnome \
    vlc

# Now, manually set up:
# 
# NodeJS: https://github.com/nvm-sh/nvm
# Yarn: https://yarnpkg.com/en/
# Chrome: https://www.google.com/chrome
# Docker: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce
# Docker-Compose: https://github.com/docker/compose/releases
# VS Code: https://code.visualstudio.com/
# Atom: https://atom.io
# Spotify: https://www.spotify.com/us/download/linux/

