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
