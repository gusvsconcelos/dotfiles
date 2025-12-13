#!/bin/bash
set -e

BOLD="\033[1m"
DIM="\033[2m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
RESET="\033[0m"

ok()    { echo -e "${GREEN}✔${RESET} $1"; }
info()  { echo -e "${BLUE}▶${RESET} ${BOLD}$1${RESET}"; }
warn()  { echo -e "${YELLOW}⚠${RESET} $1"; }
sub()   { echo -e "  ${DIM}• $1${RESET}"; }

CLEAN_PACKAGES_ONLY=false

if [ "$1" == "packages" ]; then
  CLEAN_PACKAGES_ONLY=true
fi

echo -e "${BOLD}🧹 System cleanup${RESET}\n"

info "Package cache"
sub "Clearing pacman/yay cache"
yay -Scc --noconfirm
ok "Package cache cleaned"

info "Orphaned packages"
orphans=$(yay -Qtdq || true)
if [ -n "$orphans" ]; then
  sub "Removing orphaned packages"
  yay -Rns $orphans --noconfirm
  ok "Orphaned packages removed"
else
  ok "No orphaned packages found"
fi

if [ "$CLEAN_PACKAGES_ONLY" = true ]; then
  echo
  echo -e "${GREEN}${BOLD}✨ Package cleanup complete${RESET}"
  exit 0
fi

info "System logs"
sub "Vacuuming journal (≤ 50M, 2 weeks)"
sudo journalctl --vacuum-size=50M --vacuum-time=2weeks
ok "Logs cleaned"

info "Temporary files"
sub "Cleaning /tmp and /var/tmp"
sudo rm -rf /var/tmp/* /tmp/*
ok "Temporary files removed"

info "Application cache"
rm -rf ~/.cache/*
ok "App cache cleaned"

info "Application logs"
rm -rf ~/.local/share/*/logs/* 2>/dev/null || true
rm -rf ~/.cache/*/logs/* 2>/dev/null || true
ok "App logs cleaned"

info "Crash logs"
rm -rf ~/.cache/systemd/coredump/* 2>/dev/null || true
rm -rf ~/.local/share/systemd/coredump/* 2>/dev/null || true
ok "Crash logs cleaned"

info "Trash"
rm -rf ~/.local/share/Trash/*
ok "Trash emptied"

echo
echo -e "${GREEN}${BOLD}✨ Full cleanup complete${RESET}"
