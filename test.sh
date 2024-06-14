#!/bin/bash
set -e

# Mounts dotfiles into a Docker container, installs them, and drops you into a prompt.

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

docker run --rm -it -v "$script_dir":/home/vscode/dotfiles --user vscode --workdir /home/vscode mcr.microsoft.com/devcontainers/base:ubuntu bash -c 'sh /home/vscode/dotfiles/install.sh && bash'
