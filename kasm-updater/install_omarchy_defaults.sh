#!/bin/bash

##
# Set Mike's default applications on Omarchy.
#
# These are applied with omarchy commands rather than committing the files they
# write (~/.config/mimeapps.list, ~/.config/xdg-terminals.list, and
# ~/.local/state/omarchy/defaults/editor) because xdg tools replace
# mimeapps.list instead of editing it, and the editor file is Omarchy's own state.
# Each command is safe to re-run, and installs the app if it's missing.
##

set -e

omarchy default browser firefox
omarchy default terminal ghostty
omarchy default editor vim

# Make vi run vim, like Ubuntu does. Arch's vi package is the original ex-vi.
# /usr/local/bin comes before /usr/bin in PATH and pacman never touches it, so
# this covers every user, sudo, and scripts without conflicting with packages.
if [[ ! -e /usr/local/bin/vi && ! -L /usr/local/bin/vi ]]; then
  sudo ln -s /usr/bin/vim /usr/local/bin/vi
fi
