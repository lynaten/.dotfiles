#!/usr/bin/env sh

cur=$(hyprctl getoption cursor:zoom_factor | awk '/^float:/ {print $2}')

if awk "BEGIN {exit !($cur < 1.25)}"; then
    hyprctl keyword cursor:zoom_factor 2.5
else
    hyprctl keyword cursor:zoom_factor 1
fi
