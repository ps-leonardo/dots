#!/usr/bin/bash

RED='\033[0;31m'
CYAN='\033[0;36m'

echo -e "${RED}Enabling parallel Downloads for Pacman and disable debug for makepkg"
echo ""

sudo cp /etc/pacman.conf /etc/pacman.conf.t2.bkp
sudo sed -i "/^#Color/c\Color\nILoveCandy
/^#VerbosePkgLists/c\VerbosePkgLists
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
sudo cp /etc/makepkg.conf /etc/makepkg.conf.t2.bkp
sudo sed -i "/^OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/c\OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)" /etc/makepkg.conf

echo -e "${CYAN}Done"
echo ""

# Check if yay or paru is installed and installs yay if none found.
echo -e "${RED}Checking for aur helper"
aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)

if [ -z $aurhlpr ]; then
  echo -e "${RED}aur helper not found, installing yay"
  ./install_yay.sh
  aurhlpr=yay
fi

echo -e "${CYAN}Done"
echo ""

set -euo pipefail

# Install official and aur packages
echo -e "${RED}Installing official and aur packages"
sudo pacman -S --needed - <../packages.lst
$aurhlpr -S --needed - <../aur.lst
echo -e "${RED}Installing Nerd Fonts"
sudo pacman -S --needed --asdeps nerd-fonts
sudo pacman -S --needed --asdeps ttf-font-awesome

echo -e "${CYAN}Done"
echo ""

# Copy configs, scripts and wallpapers, and install lazyvim
echo -e "${RED}Copying configs, scripts and wallpapers"
./copy_cfgs.sh

echo -e "${CYAN}Done"
echo ""

# Install sddm theme and disable monitor 2 during login
echo -e "${RED}Installing sddm theme sugar-candy and disabling monitor DP-2 during login"
./sddm.sh

echo -e "${CYAN}Done"
echo ""

# Enable systemd services
echo -e "${RED}Initializing system services"
./enable_services.sh

echo -e "${CYAN}Done"
echo ""

#Apply Grub themes
echo -e "${RED}Applying grub theme"
./apply_grub_themes.sh

echo -e "${CYAN} All done, you can reboot now"
echo ""
