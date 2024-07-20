#!/usr/bin/bash

# Check if yay or paru is installed and installs yay if none found.
aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)

if [ -z $aurhlpr ]; then 
	echo 'aur helper not found, installing yay'
	./install_yay.sh
	aurhlpr=yay
fi

set -euo pipefail

# Install official and aur packages
sudo pacman -S --needed - <packages.lst
$aurhlpr -S --needed - <aur.lst

# Copy configs, scripts and wallpapers
cp -r ~/Repos/dots/.config/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

# Install tela circle dracula icon theme
git clone https://github.com/vinceliuice/Tela-circle-icon-theme.git ~/Repos/Tela-circle-icon-theme
~/Repos/Tela-circle-icon-theme/install.sh -n 'Tela-circle-dracula-dark' -c

# Enalbe systemd services
sudo systemctl enable bluetooth
sudo systemctl enable sddm
