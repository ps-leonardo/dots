#!/bin/bash

set -euo pipefail

if [[ "$1" == "yorha" ]]; then
  GRUBTHEME="yorha-grub"
elif [[ "$1" == "amber-crt" ]]; then
  GRUBTHEME="crt-amber-theme"
else
  echo "Invalid option"
  exit
fi

cd /boot/grub/themes/

sudo cp /etc/default/grub /etc/default/grub.t2.bkp
sudo unzip ~/Repos/dots/optionals/grub/yorha-grub.zip
sudo unzip ~/Repos/dots/optionals/grub/crt-amber-theme.zip

sudo sed -i "/^GRUB_DEFAULT=/c\GRUB_DEFAULT=saved
/^GRUB_GFXMODE=/c\GRUB_GFXMODE=2560x1080x32,auto
/^GRUB_THEME=/c\GRUB_THEME=\"/boot/grub/themes/$GRUBTHEME/theme.txt\"
/^#GRUB_THEME=/c\GRUB_THEME=\"/boot/grub/themes/$GRUBTHEME/theme.txt\"
/^#GRUB_SAVEDEFAULT=true/c\GRUB_SAVEDEFAULT=true" /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg
