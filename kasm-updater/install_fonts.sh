#!/bin/bash

set -e

# See https://github.com/basecamp/omakub/blob/448b3290a91a47dd066106ceaaefd9256e11c92e/bin/omakub-font

ensure_font() {
  local font_name=$1
  local url=$2
  local file_type=$3
  local file_name="${font_name/ Nerd Font/}"

  if ! $(fc-list | grep -i "$font_name" > /dev/null); then
    cd /tmp
    wget -O "$file_name.zip" "$url"
    unzip "$file_name.zip" -d "$file_name"
    cp "$file_name"/*."$file_type" ~/.local/share/fonts
    rm -rf "$file_name.zip" "$file_name"
    fc-cache
    cd -
  fi
}

if [[ ! "$(uname -s)" == "Darwin" ]]; then
  echo "Installing Fonts..."
  mkdir -p ~/.local/share/fonts
  ensure_font "JetBrainsMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip" "ttf"
  ensure_font "FiraCode Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" "ttf"
  ensure_font "SauceCodePro Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SourceCodePro.zip" "ttf"
  ensure_font "BlexMono Nerd Font" "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IBMPlexMono.zip" "ttf"
fi
