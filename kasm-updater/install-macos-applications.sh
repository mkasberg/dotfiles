#!/usr/bin/env bash

set -e

# Install Homebrew (safe to re-run)
brew --version || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle install --file "$HOME/dotfiles/Brewfile"

# TODO upgrade installed brew things
