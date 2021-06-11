#!/usr/bin/env bash

# Ubuntu Mono Nerd Font
if [ ! -e ~/.local/share/fonts/Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono.ttf ]; then
    curl -fLo ~/.local/share/fonts/Ubuntu\ Mono\ Nerd\ Font\ Complete\ Mono.ttf 'https://github.com/ryanoasis/nerd-fonts/blob/v2.1.0/patched-fonts/UbuntuMono/Regular/complete/Ubuntu%20Mono%20Nerd%20Font%20Complete%20Mono.ttf?raw=true'
fi

if [ ! -e ~/.local/share/fonts/Ubuntu\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono.ttf ]; then
    curl -fLo ~/.local/share/fonts/Ubuntu\ Mono\ Bold\ Nerd\ Font\ Complete\ Mono.ttf 'https://github.com/ryanoasis/nerd-fonts/blob/v2.1.0/patched-fonts/UbuntuMono/Bold/complete/Ubuntu%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf?raw=true'
fi

if [ ! -e ~/.local/share/fonts/Ubuntu\ Mono\ Italic\ Nerd\ Font\ Complete\ Mono.ttf ]; then
    curl -fLo ~/.local/share/fonts/Ubuntu\ Mono\ Italic\ Nerd\ Font\ Complete\ Mono.ttf 'https://github.com/ryanoasis/nerd-fonts/blob/v2.1.0/patched-fonts/UbuntuMono/Regular-Italic/complete/Ubuntu%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf?raw=true'
fi

if [ ! -e ~/.local/share/fonts/Ubuntu\ Mono\ Bold\ Italic\ Nerd\ Font\ Complete\ Mono.ttf ]; then
    curl -fLo ~/.local/share/fonts/Ubuntu\ Mono\ Bold\ Italic\ Nerd\ Font\ Complete\ Mono.ttf 'https://github.com/ryanoasis/nerd-fonts/blob/v2.1.0/patched-fonts/UbuntuMono/Bold-Italic/complete/Ubuntu%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf?raw=true'
fi

