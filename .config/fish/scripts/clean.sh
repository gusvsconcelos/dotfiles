#!/bin/bash
set -Eeuo pipefail

DRY_RUN=false
PACKAGES_ONLY=false

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    packages)  PACKAGES_ONLY=true ;;
  esac
done

BOLD="\033[1m"
DIM="\033[2m"

FG_RED="\033[38;5;203m"
FG_GREEN="\033[38;5;114m"
FG_YELLOW="\033[38;5;180m"
FG_BLUE="\033[38;5;75m"
FG_GRAY="\033[38;5;245m"

RESET="\033[0m"

ICON_OK=""
ICON_INFO=""
ICON_WARN=""
ICON_RUN="󰜎"
ICON_DOT=""
ICON_CLEAN="󰃢"

header() {
  echo
  echo -e "${BOLD}${FG_BLUE}${ICON_CLEAN}  $1${RESET}"
  echo -e "${FG_GRAY}────────────────────────────────${RESET}"
}

info() {
  echo -e "${FG_BLUE}${ICON_INFO}${RESET} ${BOLD}$1${RESET}"
}

sub() {
  echo -e "  ${FG_GRAY}${ICON_DOT} $1${RESET}"
}

ok() {
  echo -e "${FG_GREEN}${ICON_OK}${RESET} $1"
}

warn() {
  echo -e "${FG_YELLOW}${ICON_WARN}${RESET} $1"
}

trap 'echo -e "\n${FG_RED}${ICON_WARN} Error on line $LINENO${RESET}"' ERR

run() {
  if $DRY_RUN; then
    echo -e "  ${FG_YELLOW}[DRY]${RESET} $*"
  else
    "$@"
  fi
}

if ! $DRY_RUN && ! $PACKAGES_ONLY; then
  sudo -v
fi

echo -e "${BOLD}${FG_BLUE}"
echo "──────────────────────────"
echo "  System Cleanup Utility"
echo "──────────────────────────"
echo -e "${RESET}"

$DRY_RUN && warn "Dry-run mode enabled (no changes will be made)"

header "Packages"

info "Package cache"
sub "Clearing pacman/yay cache"
run yay -Scc --noconfirm
ok "Package cache processed"

info "Orphaned packages"
orphans="$(yay -Qtdq || true)"
if [[ -n "$orphans" ]]; then
  sub "Removing orphaned packages"
  run yay -Rns --noconfirm $orphans
  ok "Orphaned packages processed"
else
  ok "No orphaned packages found"
fi

if $PACKAGES_ONLY; then
  echo
  ok "Package cleanup complete"
  exit 0
fi

header "Logs"

info "System journal"
sub "Vacuuming (≤ 50M, last 2 weeks)"
run sudo journalctl --vacuum-size=50M --vacuum-time=2weeks
ok "Journal cleaned"

info "Crash dumps"
run rm -rf --one-file-system \
  ~/.cache/systemd/coredump/* \
  ~/.local/share/systemd/coredump/* 2>/dev/null || true
ok "Crash dumps removed"

info "Application logs"
run rm -rf --one-file-system \
  ~/.local/share/*/logs/* \
  ~/.cache/*/logs/* 2>/dev/null || true
ok "Application logs removed"

header "Filesystem"

info "Temporary directories"
sub "Cleaning /tmp and /var/tmp"
run sudo rm -rf --one-file-system /tmp/* /var/tmp/*
ok "Temporary files removed"

info "User cache"
run rm -rf --one-file-system ~/.cache/*
ok "User cache cleared"

info "Trash"
run rm -rf --one-file-system ~/.local/share/Trash/*
ok "Trash emptied"

echo
ok "Full cleanup complete"
