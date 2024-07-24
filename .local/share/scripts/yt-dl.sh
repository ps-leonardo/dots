#!/bin/bash

while getopts "av" opt; do
  case $opt in
  a)
    yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail "$2" -o "~/Music/%(title)s.%(ext)s"
    ;;
  v)
    yt-dlp -f bestvideo+bestaudio/best "$2" -o "~/Videos/%(title)s.%(ext)s"
    ;;
  \?)
    echo "errorrrrrrr"
    exit 1
    ;;
  esac
done
