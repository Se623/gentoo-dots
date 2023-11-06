#!/bin/bash

vol=$(pactl list sinks | grep "Volume" | grep -hEo "[[:digit:]]{1,3}%" | head -1 | grep -o "[^%]" | tr -d '\n')
mute=$(pactl list sinks | grep "Mute" | grep -Eo "(yes|no)")

if [ "$1" == "icon-a" ]; then
    if [ "$vol" -gt "66" ]; then
	echo "\\ue91c"
    elif [ "$vol" -gt "33" ]; then
	echo "\\ue904"
    elif [ "$vol" -ge "0" ]; then
	echo "\\ue902"
    fi
if [ "$1" == "percent" ]; then
    echo "$vol"
fi
elif [ "$1" == "icon-b" ]; then
    if [ "$vol" -gt "66" ]; then
	echo "\\ue91c"
    elif [ "$vol" -gt "33" ]; then
	echo "\\ue905"
    elif [ "$vol" -ge "0" ]; then
	echo "\\ue903"
    fi
if [ "$1" == "percent" ]; then
    echo "$vol"
fi
fi
