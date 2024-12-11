#/bin/bash

inotifywait -mr /home/gsina/dotfiles/waybar/mecha/ --format '%w%f %e' -e modify -e create -e delete | while read file event; do
  echo "File $file was $event"
  killall waybar
  hyprctl dispatch exec waybar
done
