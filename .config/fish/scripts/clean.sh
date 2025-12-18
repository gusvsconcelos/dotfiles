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

FG_BLUE="\033[34m"
FG_GREEN="\033[32m"
FG_PURPLE="\033[35m"
FG_YELLOW="\033[33m"
FG_GRAY="\033[90m"
RESET="\033[0m"

ICON_INFO="ℹ"
ICON_OK="✔"
ICON_WARN="⚠"
ICON_DR="󰐊"

info() { echo -e "${FG_BLUE}${ICON_INFO} ${RESET}$1"; }
warn() { echo -e "${FG_YELLOW}${ICON_WARN} ${RESET}$1"; }
ok()   { echo -e "${FG_GREEN}${ICON_OK} ${RESET}$1"; }

run() {
  if $DRY_RUN; then
    case "$1" in
      rm)
        echo -e "${FG_PURPLE}${ICON_DR} ${RESET}Would remove: $3 ..."
        ;;
      yay|sudo)
        echo -e "${FG_PURPLE}${ICON_DR} ${RESET}$*"
        ;;
      *)
        echo -e "${FG_PURPLE}${ICON_DR} ${RESET}$*"
        ;;
    esac
  else
    "$@"
  fi
}

if ! $DRY_RUN && ! $PACKAGES_ONLY; then
  sudo -v
fi

echo -e "${FG_PURPLE}=== System Cleanup Utility ===${RESET}"
$DRY_RUN && warn "Dry-run mode enabled (no changes will be made)"

echo
info "Packages"

run yay -Scc --noconfirm
ok "Package cache cleaned"

orphans="$(yay -Qtdq || true)"
if [[ -n "$orphans" ]]; then
  run yay -Rns --noconfirm $orphans
  ok "Orphans removed"
else
  ok "No orphaned packages"
fi

$PACKAGES_ONLY && { ok "Package cleanup complete"; exit 0; }

echo
info "Logs"

run sudo journalctl --vacuum-size=50M --vacuum-time=2weeks
ok "System journal cleaned"

run rm -rf ~/.cache/systemd/coredump/* "coredumps"
run rm -rf ~/.local/share/*/logs/* ~/.cache/*/logs/* "application logs"
ok "Crash dumps & application logs removed"

echo
info "Filesystem"

run sudo rm -rf /tmp/* "/tmp files"
run sudo rm -rf /var/tmp/* "/var/tmp files"
run rm -rf ~/.cache/* "user cache"
run rm -rf ~/.local/share/Trash/* "trash"
ok "Temporary files, cache & trash cleared"

echo
ok "Full cleanup complete"
