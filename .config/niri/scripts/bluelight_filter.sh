#!/bin/bash

if pgrep -x wlsunset > /dev/null; then
    pkill wlsunset
    notify-send "Blue light filter disabled"
else
    wlsunset -t 4000 &
    notify-send "Blue light filter enabled"
fi
