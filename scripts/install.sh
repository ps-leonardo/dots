#!/usr/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0;0m'

echo -e "${RED}Enabling parallel Downloads for Pacman and disable debug for makepkg${RESET}"
sleep 5
sudo cp /etc/pacman.conf /etc/pacman.conf.t2.bkp
sudo sed -i "/^#Color/c\Color\nILoveCandy
/^#VerbosePkgLists/c\VerbosePkgLists
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
sudo cp /etc/makepkg.conf /etc/makepkg.conf.t2.bkp
sudo sed -i "/^OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/c\OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)" /etc/makepkg.conf

echo -e "${GREEN}Done${RESET}"
echo ""

# Check if yay or paru is installed and installs yay if none found.
echo -e "${RED}Checking for aur helper${RESET}"
sleep 5
aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)
if [ -z $aurhlpr ]; then
  echo -e "${RED}aur helper not found, installing yay${RESET}"
  ./install_yay.sh
  aurhlpr=yay
fi

echo -e "${GREEN}Done${RESET}"
echo ""

set -euo pipefail

# Install official and aur packages
echo -e "${RED}Installing official and aur packages${RESET}"
sleep 5
sudo pacman -S --needed - <../packages.lst
$aurhlpr -S --needed - <../aur.lst

echo -e "${GREEN}Done${RESET}"
echo ""

echo -e "${RED}Installing Nerd Fonts${RESET}"
sleep 5
sudo pacman -S --needed --asdeps nerd-fonts
sudo pacman -S --needed --asdeps ttf-font-awesome

echo -e "${GREEN}Done${RESET}"
echo ""

# Copy configs and scripts
read -p $'Which theme would you like to install? (tokyo-night/catppuccin-mocha)\n' THEME
echo -e "${RED}Copying $THEME configs, and default scripts${RESET}"
sleep 5
./copy_cfgs.sh "$THEME"

echo -e "${GREEN}Done${RESET}"
echo ""

# Install sddm theme and disable monitor 2 during login
echo -e "${RED}Installing sddm theme sugar-candy and disabling monitor DP-2 during login${RESET}"
sleep 5
./sddm.sh

echo -e "${GREEN}Done${RESET}"
echo ""

# Enable systemd services
echo -e "${RED}Initializing system services${RESET}"
sleep 5
./enable_services.sh

echo -e "${GREEN}Done${RESET}"
echo ""

#Apply Grub themes
read -p $'Which grub theme would you like to apply? (yorha/amber-crt)\n' GRUBTHEME
echo -e "${RED}Applying grub theme${RESET}"
./apply_grub_themes.sh "$GRUBTHEME"

echo -e "${GREEN} All done, you can reboot now${RESET}"
echo ""
