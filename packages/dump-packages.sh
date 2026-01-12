#!/usr/bin/env bash

case "$OSTYPE" in
  darwin*)
    echo "Need to setup"
    ;;
  linux*)
    echo "Dumping PACMAN packages to ~/dotfiles/packages/pkglist.txt"
    pacman -Qqen > ~/dotfiles/packages/pkglist.txt

    echo "Dumping AUR packages to ~/dotfiles/packages/foreignpkglist.txt"
    pacman -Qqem > ~/dotfiles/packages/foreignpkglist.txt

    echo "All packages have been dumped successfully!"
    ;;
esac
