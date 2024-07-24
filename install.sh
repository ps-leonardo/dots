#!/usr/bin/bash

echo "Enabling parallel Downloads for Pacman and disable debug for makepkg"
sudo cp /etc/pacman.conf /etc/pacman.conf.t2.bkp
sudo sed -i "/^#Color/c\Color\nILoveCandy
/^#VerbosePkgLists/c\VerbosePkgLists
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
sudo cp /etc/makepkg.conf /etc/makepkg.conf.t2.bkp
sudo sed -i "/^OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/c\OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)" /etc/makepkg.conf

# Check if yay or paru is installed and installs yay if none found.
echo "Checking for aur helper"
aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)

if [ -z $aurhlpr ]; then
  echo "aur helper not found, installing yay"
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

# Install LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Enable systemd services
sudo systemctl enable bluetooth
sudo systemctl enable sddm
