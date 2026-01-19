#!/bin/bash

if pgrep -x wlsunset > /dev/null; then
    pkill wlsunset
    notify-send -a bluelight_filter "Filtro de luz azul desativado"
else
    wlsunset -t 4000 &
    notify-send -a bluelight_filter "Filtro de luz azul ativado"
fi
