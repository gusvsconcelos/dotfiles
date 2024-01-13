#!/bin/bash

export PATH="${PATH}:${HOME}/.local/bin/"

DIR=$HOME/Imagens/Wallpapers
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[ $RANDOM % ${#PICS[@]} ]}

if [[ $(pidof swww) ]]; then
  pkill swww
fi

swww img ${DIR}/${RANDOMPICS} --transition-type outer --transition-fps 75 --transition-duration 1 --transition-bezier 0.65,0,0.35,1 --transition-pos 0.938,0.972 --transition-step 1

sleep 1.25

if [[ "$(<~/.cache/wal/mode )" = "dark" ]]; then
  wal -i ${DIR}/${RANDOMPICS} --cols16
elif [[ "$(<~/.cache/wal/mode )" = "light" ]]; then
  wal -i ${DIR}/${RANDOMPICS} -l --cols16
fi

pywalfox update

. $HOME/.config/mako/update-colors.sh
. $HOME/.config/spicetify/scripts/update-colors.sh
. $HOME/.config/cava/scripts/update-colors.sh