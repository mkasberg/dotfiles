#!/bin/bash
set -e

# Run with no args.
# Downloads a docker container and initializes dotfiles inside the container.
# Then calls itself in verify mode (--verify) inside the container.

# POSIX way to get script's dir: https://stackoverflow.com/a/29834779/12156188
script_dir="$(cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P)"

if [ "$1" != "--verify" ]; then
  # Install and verify dotfiles inside a container
  docker run --rm -v "$script_dir":"/home/vscode/dotfiles" --user vscode --workdir /home/vscode mcr.microsoft.com/vscode/devcontainers/base:ubuntu bash -c 'sh /home/vscode/dotfiles/install.sh -q -a && sh /home/vscode/dotfiles/test.sh --verify'
  exit 0
fi

# In verify mode (typically inside the container).
echo "Verifying dotfiles..."
echo ""
status=0

if [ -x "$HOME/bin/chezmoi" ]; then
  echo 'OK    chezmoi is present in ~/bin'
else
  status=1
  echo 'FAIL  chezomi is not present in ~/bin'
fi

if [ -e "$HOME/dotfiles/README.md" ]; then
  echo 'OK    ~/dotfiles/README.md exists'
else
  status=1
  echo 'FAIL  ~/dotfiles/README.md does not exist'
fi


if grep -q Mike ~/.bashrc; then
  echo 'OK    ~/.bashrc has been customized'
else
  status=1
  echo 'FAIL  ~/.bashrc has not been customized'
fi

# We want to test with a package that my script installs but that is
# not present by default in a vscode dev container.
if dpkg -s openscad >> /dev/null; then
  echo 'OK    package openscad is installed'
else
  status=1
  echo 'FAIL  package openscad is not installed'
fi

echo ""
if [ "$status" -eq 0 ]; then
  echo "All checks passed!"
else
  echo "One or more checks FAILED!"
fi

exit $status
