#!/bin/bash

set -e

ascii_art='
    ██╗  ██╗ █████╗ ███████╗███╗   ███╗
    ██║ ██╔╝██╔══██╗██╔════╝████╗ ████║
    █████╔╝ ███████║███████╗██╔████╔██║
    ██╔═██╗ ██╔══██║╚════██║██║╚██╔╝██║
    ██║  ██╗██║  ██║███████║██║ ╚═╝ ██║
    ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝
'

# Define the color gradient (yellow to red)
colors=(
  '' # First line
  '\033[38;5;214m' # Orange
  '\033[38;5;208m' # Dark Orange
  '\033[38;5;202m' # Orange-Red
  '\033[38;5;196m' # Red
  '\033[38;5;160m' # Dark Red
  '\033[38;5;124m' # Darker Red
)

# Split the ASCII art into lines
lines=()
while IFS= read -r line; do
  lines+=("$line")
done <<< "$ascii_art"

echo ""
# Print each line with the corresponding color
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
