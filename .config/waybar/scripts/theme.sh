#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

CURRENTIMG="$(<~/.cache/wal/wal )"
MODE=""

if [[ -e "${HOME}/.cache/wal/mode" ]]; then
    MODE="$(<~/.cache/wal/mode )"
else
    cd ${HOME}/.cache/wal && touch mode

    set -o noclobber
    echo "dark" >| ${HOME}/.cache/wal/mode

    MODE="dark"
fi

if [[ $MODE = "light" ]]; then
    notify-send "Mudando para o tema escuro..."

    MODE="dark"

    wal -i $CURRENTIMG --cols16

    . $HOME/.config/mako/update-colors.sh

    set -o noclobber
    echo "dark" >| ${HOME}/.cache/wal/mode

    notify-send "Alterado para tema escuro!"
else
    notify-send "Mudando para tema claro..."

    MODE="light"

    wal -i $CURRENTIMG -l --cols16

    . $HOME/.config/mako/update-colors.sh

    set -o noclobber
    echo "light" >| ${HOME}/.cache/wal/mode

    notify-send "Alterado para tema claro!"
fi