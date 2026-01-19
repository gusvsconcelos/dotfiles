#!/usr/bin/env bash

$1

STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
VOL=$(awk '{print int($2*100)}' <<< "$STATUS")

if grep -q MUTED <<< "$STATUS"; then
    notify-send -a volume_osd -h string:x-canonical-private-synchronous:volume "Mudo"
else
    notify-send -a volume_osd -h string:x-canonical-private-synchronous:volume \
                -h int:value:"$VOL" "Volume: $VOL%"
fi
