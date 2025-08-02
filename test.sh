#!/bin/bash

# Mounts dotfiles into a Docker container, installs them, and drops you into a prompt.

set -e

DOCKERFILE="Dockerfile"
IMAGE_NAME="dotfiles-test:latest"
USERNAME="ubuntu"

if [[ "$1" == "--arch" ]]; then
  DOCKERFILE="Dockerfile.arch"
  IMAGE_NAME="dotfiles-test:arch"
  USERNAME="dev"
fi

docker build -t "$IMAGE_NAME" -f "$DOCKERFILE" .

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

docker run --rm -it -v "$script_dir:/home/$USERNAME/dotfiles" "$IMAGE_NAME" bash -c "sh /home/$USERNAME/dotfiles/install.sh && bash"
