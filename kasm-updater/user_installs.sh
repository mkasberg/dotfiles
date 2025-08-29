#!/bin/bash

##
# Script to install Mike's user (non-root) apps on Ubuntu.
##

set -e

if [[ ! "$(uname -s)" == "Darwin" ]]; then
    # Default Shell
    grep "$USER" /etc/passwd | grep /usr/bin/zsh > /dev/null || {
        echo "Changing user shell to zsh..."
        chsh -s /usr/bin/zsh
    }
fi

# Oh My Zsh
if [ -d "${HOME}/.oh-my-zsh" ]; then
    echo "✅ Oh My Zsh is at: ${HOME}/.oh-my-zsh"
    # Needs to be in zsh, and needs to be in interactive mode to source ~/.zshrc
    zsh -i -c "omz update; exit"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
fi

mise upgrade
