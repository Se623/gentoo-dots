#!/bin/bash

bat=/sys/class/power_supply/BAT0/
icons=$HOME/.config/eww/bar/icons/battery
per="$(cat "$bat/capacity")"

if [ "$1" == "icon" ]; then
    
    [ $(cat "$bat/status") == "Charging" ] && echo "${icons}/battery-charge.svg" && exit
    
    if [ "$per" -gt "10" ]; then
	width=$(bc<<<"scale=2;28/100*$per")
	sed -i "s/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"[0-9]\+.[0-9]\+\"/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"$width\"/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
	icon=${icons}/battery-full.svg
    else
	icon=${icons}/battery-low.svg
    fi
    echo "$icon"
    
elif [ "$1" == "percent" ]; then

    echo $per

elif [ "$1" == "color" ]; then

    if [ "$per" -gt "25" ]; then
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#33FF93;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
	sed -i "s/.st1{fill:none;stroke:#[A-F0-9]*;stroke-miterlimit:10;}/.st1{fill:none;stroke:#33FF93;stroke-miterlimit:10;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
	color=green
    elif [ "$per" -gt "10" ]; then
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#F9B45B;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
	sed -i "s/.st1{fill:none;stroke:#[A-F0-9]*;stroke-miterlimit:10;}/.st1{fill:none;stroke:#F9B45B;stroke-miterlimit:10;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
        color=yellow
    else
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#E05C4B;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
	sed -i "s/.st1{fill:none;stroke:#[A-F0-9]*;stroke-miterlimit:10;}/.st1{fill:none;stroke:#E05C4B;stroke-miterlimit:10;}/" $HOME/.config/eww/bar/icons/battery/battery-full.svg
        color=red
    fi
    echo "$color"
fi

