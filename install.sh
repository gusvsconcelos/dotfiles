#!/bin/bash

mapfile -t pkgs < packages.txt
avail=($(comm -12 <(pacman -Slq | sort -u) <(printf '%s\n' "${pkgs[@]}" | sort -u)))
missing=($(comm -23 <(printf '%s\n' "${pkgs[@]}" | sort -u) <(printf '%s\n' "${avail[@]}" | sort -u)))
not_installed=()

sudo pacman -Syu
sudo pacman -S "${avail[@]}" --needed
if ! pacman -Q yay &>/dev/null; then
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si
  cd -
  rm -rf /tmp/yay
fi
yay -S "${missing[@]}" --needed

for pkg in "${pkgs[@]}"; do
  if ! pacman -Q "$pkg" &>/dev/null; then
    not_installed+=("$pkg")
  fi
done

if [ ${#not_installed[@]} -eq 0 ]; then
  echo "All packages installed."
else
  echo "Not installed: ${not_installed[*]}"
fi
