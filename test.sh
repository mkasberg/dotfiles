#!/bin/bash

# Mounts dotfiles into a Docker container, installs them, and drops you into a prompt.

set -e

docker build -t dotfiles-test:latest .

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

docker run --rm -it -v "$script_dir":/home/kasm/dotfiles dotfiles-test:latest bash -c 'sh /home/kasm/dotfiles/install.sh && bash'
