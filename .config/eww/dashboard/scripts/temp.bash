#!/bin/bash
temp=$(sensors | grep 'Package id 0:' | grep -oE '[0-9]+.[0-9]+' | tr '\n' ' ' | awk '{print $1}')
max=$(sensors | grep 'Package id 0:' | grep -oE '[0-9]+.[0-9]+' | tr '\n' ' ' | awk '{print $2}')

if [ "$1" == "temp" ]; then
    echo "$temp"
elif [ "$1" == "max" ]; then
    echo "$max"
elif [ "$1" == "icon" ]; then
    sed -i "s/.st1{fill:none;stroke:#[A-F0-9]*;/.st1{fill:none;stroke:#7DF9FF;/" $home/.config/eww/icons/temp/temp.svg
    echo "$home/.config/eww/icons/temp/temp.svg"
fi
