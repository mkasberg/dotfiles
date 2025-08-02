#!/bin/bash

##
# Script to install Mike's user (non-root) apps on Ubuntu.
##

set -e

if [[ ! "$(uname -s)" == "Darwin" ]]; then
    # Default Shell
    grep "$USER" /etc/passwd | grep /usr/bin/zsh > /dev/null
    if [ $? -ne 0 ]; then
        echo "Changing user shell to zsh..."
        chsh -s /usr/bin/zsh
    fi
fi

# Oh My Zsh
if [ -d "${HOME}/.oh-my-zsh" ]; then
    echo "✅ Oh My Zsh is at: ${HOME}/.oh-my-zsh"
    omz update
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

mise upgrade

# TLDR Pages https://tldr.sh/
#which tldr > /dev/null
#if [ $? -ne 0 ]; then
#    npm install -g tldr
#fi
