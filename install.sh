#!/usr/bin/env bash

general() {
  cd ~/dotfiles/
  stow bat btop clang eza ghostty kitty nvim prettier starship yazi zellij zsh
}

macos_clause() {
  echo "Detected macOS"
  cd ~/dotfiles/ || exit 1
  stow mac-tools
}

linux_clause() {
  echo "Detected Linux"
  cd ~/dotfiles/ || exit 1
  stow arch-tools
}

case "$OSTYPE" in
  darwin*) general; macos_clause ;;
  linux*)  general; linux_clause ;;
  *) echo "Unsupported OSTYPE: $OSTYPE" >&2; exit 1 ;;
esac

