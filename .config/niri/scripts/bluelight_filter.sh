#!/bin/bash

if pgrep -x wlsunset > /dev/null; then
    pkill wlsunset
    notify-send -a bluelight_filter "Blue light filter disabled"
else
    wlsunset -t 4000 &
    notify-send -a bluelight_filter "Blue light filter enabled"
fi
