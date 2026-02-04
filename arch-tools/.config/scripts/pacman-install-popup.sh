#!/usr/bin/env bash

kitty --class floating-popup -e bash -c '
  pacman -Slq | fzf --multi --preview "pacman -Si {1}" \
  | xargs -ro sudo pacman -S;
' &
