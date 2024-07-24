#!/usr/bin/bash

echo "Enabling parallel Downloads for Pacman and disable debug for makepkg"

sudo cp /etc/pacman.conf /etc/pacman.conf.t2.bkp
sudo sed -i "/^#Color/c\Color\nILoveCandy
/^#VerbosePkgLists/c\VerbosePkgLists
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
sudo cp /etc/makepkg.conf /etc/makepkg.conf.t2.bkp
sudo sed -i "/^OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/c\OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)" /etc/makepkg.conf

echo "\n"
sleep 0.5

# Check if yay or paru is installed and installs yay if none found.
echo "Checking for aur helper"
aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)

if [ -z $aurhlpr ]; then
  echo "aur helper not found, installing yay"
  ./install_yay.sh
  aurhlpr=yay
fi

echo "\n"
sleep 0.5

set -euo pipefail

# Install official and aur packages
echo "Installing official and aur packages"
sudo pacman -S --needed - <packages.lst
$aurhlpr -S --needed - <aur.lst

echo "\n"
sleep 0.5

# Install nerd fonts
echo "Installing Nerd Fonts"
sudo pacman -S --needed --asdeps nerd-fonts
sudo pacman -S --needed --asdeps ttf-font-awesome

echo "\n"
sleep 0.5

# Copy configs, scripts and wallpapers
echo "Copying configs, scripts and wallpapers"
cp -r ~/Repos/dots/.config/* ~/.config/
cp -r ~/Repos/dots/.local/share ~/.local/

echo "\n"
sleep 0.5

# Install LazyVim
echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo "\n"
sleep 0.5

# Install sddm theme and disable monitor 2 during login
echo "Installing sddm theme sugar-candy and disabling monitor DP-2 during login"
./sddm.sh

echo "\n"
sleep 0.5

# Enable systemd services
echo "Initializing system services"
sudo systemctl enable bluetooth
sudo systemctl enable sddm
