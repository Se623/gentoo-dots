#!/bin/bash

icons=$HOME/.config/eww/bar/icons/volume
vol=$(pactl list sinks | grep "Volume" | grep -hEo "[[:digit:]]{1,3}%" | head -1 | grep -o "[^%]" | tr -d '\n')
mute=$(pactl list sinks | grep "Mute" | grep -Eo "(yes|no)")

if [ "$1" == "icon" ]; then
    if [ "$vol" -gt "66" ]; then
	echo "//e90e"
    elif [ "$vol" -gt "33" ]; then
	echo "//e909"
    elif [ "$vol" -gt "0" ]; then
	echo "//e90f"
    fi
if [ "$1" == "percent" ]; then
    echo "$vol"
fi

