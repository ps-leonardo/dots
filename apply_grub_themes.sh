#!/bin/bash

cd /boot/grub/themes/

sudo cp /etc/default/grub /etc/default/grub.t2.bkp
sudo unzip ~/Repos/dots/grub/yorha-grub.zip
sudo unsip ~/Repos/dots/grub/crt-amber-theme.zip

sudo sed -i "/^GRUB_DEFAULT=/c\GRUB_DEFAULT=saved
/^GRUB_GFXMODE=/c\GRUB_GFXMODE=2560x1080x32,auto
/^GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/crt-amber-theme/theme.txt\"
/^#GRUB_THEME=/c\GRUB_THEME=\"/usr/share/grub/themes/crt-amber-theme/theme.txt\"
/^#GRUB_SAVEDEFAULT=true/c\GRUB_SAVEDEFAULT=true" /etc/default/grub

sudo grub-mkconfig -o /boot/grub/grub.cfg

sleep 2
