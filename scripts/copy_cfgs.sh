#!/usr/bin/bash

set -euo pipefail

echo "Copying configs, scripts and wallpapers"
cp -r ~/Repos/dots/.config/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

# Install LazyVim
echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
