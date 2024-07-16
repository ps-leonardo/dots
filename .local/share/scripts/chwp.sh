#!/usr/bin/bash

magick "$1" current.png

pidof hyprpaper >/dev/null && killall hyprpaper

(hyprpaper >/dev/null) &
