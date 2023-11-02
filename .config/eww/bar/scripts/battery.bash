#!/bin/bash

bat=/sys/class/power_supply/BAT0/
icons=$HOME/.config/eww/icons/battery
per="$(cat "$bat/capacity")"

if [ "$1" == "icon" ]; then
    
    [ $(cat "$bat/status") == "Charging" ] && echo "${icons}/battery-charge.svg" && exit
    
    if [ "$per" -gt "10" ]; then
	width=$(bc<<<"scale=2;28/100*$per")
	sed -i "s/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"[0-9]\+.[0-9]\+\"/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"$width\"/" $HOME/.config/eww/bar/icons/battery/battery.svg
	icon=${icons}/battery.svg
    else
	sed -i "s/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"[0-9]\+.[0-9]\+\"/<rect x=\"8\" y=\"18\" class=\"st0\" width=\"$width\"/" $HOME/.config/eww/bar/icons/battery/battery-low.svg
	icon=${icons}/battery-low.svg
    fi
    echo "$icon"
    
elif [ "$1" == "percent" ]; then

    echo $per

elif [ "$1" == "color" ]; then

    if [ "$per" -gt "25" ]; then
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#33FF93;}/" $HOME/.config/eww/icons/battery/battery.svg
	color=green
    elif [ "$per" -gt "10" ]; then
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#F9B45B;}/" $HOME/.config/eww/icons/battery/battery.svg
        color=yellow
    else
	sed -i "s/.st0{fill:#[A-F0-9]*;}/.st0{fill:#E05C4B;}/" $HOME/.config/eww/bar/icons/battery/battery-low.svg
        color=red
    fi
    echo "$color"
fi

