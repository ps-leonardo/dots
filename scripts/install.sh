#!/usr/bin/bash

YELLOW='\033[0;33m'
GREEN='\033[0;32m'
RESET='\033[0;0m'

echo -e "${YELLOW}:: Enabling parallel Downloads for Pacman and disabling debug for makepkg${RESET}"
sudo cp /etc/pacman.conf /etc/pacman.conf.t2.bkp
sudo sed -i "/^#Color/c\Color\nILoveCandy
/^#VerbosePkgLists/c\VerbosePkgLists
/^#ParallelDownloads/c\ParallelDownloads = 5" /etc/pacman.conf
sudo cp /etc/makepkg.conf /etc/makepkg.conf.t2.bkp
sudo sed -i "/^OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge debug lto)/c\OPTIONS=(strip docs !libtool !staticlibs emptydirs zipman purge !debug lto)" /etc/makepkg.conf

echo -e "${GREEN}:: Done${RESET}"
echo ""

# Check if yay or paru is installed and installs yay if none found.
echo -e "${YELLOW}:: Checking for aur helper${RESET}"
export aurhlpr=$(pacman -Qq yay 2>/dev/null || pacman -Qq paru 2>/dev/null)
if [ -z $aurhlpr ]; then
  echo -e "${YELLOW}:: AUR helper not found, installing yay${RESET}"
  ./install_yay.sh
  export aurhlpr=yay
fi

echo -e "${GREEN}:: Done${RESET}"
echo ""

set -euo pipefail

# Install official and aur packages
echo -e "${YELLOW}:: Installing main repos' and aur packages${RESET}"
sudo pacman -S --needed - <../packages.lst
$aurhlpr -S --needed - <../aur.lst

echo -e "${GREEN}:: Done${RESET}"
echo ""

echo -e "${YELLOW}:: Installing Nerd Fonts${RESET}"
sudo pacman -S --needed --asdeps nerd-fonts ttf-font-awesome
echo -e "${GREEN}:: Done${RESET}"
echo ""

# Copy configs and scripts
echo -e "${YELLOW}:: Copying configs and default scripts${RESET}"
./copy_cfgs.sh

echo -e "${GREEN}:: Done${RESET}"
echo ""

echo -e "${YELLOW}:: Changing default ZSH dir to ~/.config/zsh ${RESET}"
echo "ZDOTDIR=${HOME}/.config/zsh" | sudo tee -a /etc/environment
echo -e "${GREEN}:: Done${RESET}"
echo ""

# Install sddm theme and disable monitor 2 during login
echo -e "${YELLOW}:: Installing sddm theme sugar-candy and disabling monitor DP-2 during login${RESET}"
./sddm.sh

echo -e "${GREEN}:: Done${RESET}"
echo ""

# Enable systemd services
echo -e "${YELLOW}:: Initializing SystemD services${RESET}"
./enable_services.sh

echo -e "${GREEN}:: Done${RESET}"
echo ""

#Apply Grub themes
read -p $'Which grub theme would you like to apply? (yorha/amber-crt)\n' GRUBTHEME
echo -e "${YELLOW}:: Applying grub theme${RESET}"
./apply_grub_themes.sh "$GRUBTHEME"

echo -e "${GREEN}:: All done, you can reboot now${RESET}"
echo ""
