#!/bin/sh

# Non-interactive dotfiles install script for use with Codespaces.
# Assumes dotfiles have been cloned to ~/dotfiles.
# https://www.chezmoi.io/docs/how-to/#use-chezmoi-with-github-codespaces-visual-studio-codespaces-or-visual-studio-code-remote---containers

set -e # exit on error

install_apps=N
quiet=N

# See https://man7.org/linux/man-pages/man1/getopts.1p.html
while getopts aq opt; do
  case $opt in
    a)
      install_apps=y
      ;;
    q)
      quiet=y
      ;;
  esac
done

if [ ! "$(command -v chezmoi)" ]; then
  bin_dir="$HOME/bin"
  chezmoi="$bin_dir/chezmoi"
  if [ "$(command -v curl)" ]; then
    sh -c "$(curl -fsLS https://git.io/chezmoi)" -- -b "$bin_dir"
  elif [ "$(command -v wget)" ]; then
    sh -c "$(wget -qO- https://git.io/chezmoi)" -- -b "$bin_dir"
  else
    echo "To install chezmoi, you must have curl or wget installed." >&2
    exit 1
  fi
else
  chezmoi=chezmoi
fi

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"
# exec: replace current process with chezmoi init
if [ "$quiet" = "y" ]; then
  exec "$chezmoi" init --apply "--source=$script_dir" --promptString "Email for .gitconfig=kasberg.mike@gmail.com,Store secrets on this machine (y/N)=N,Install applications (y/N)=$install_apps"
else
  exec "$chezmoi" init --apply "--source=$script_dir"
fi
