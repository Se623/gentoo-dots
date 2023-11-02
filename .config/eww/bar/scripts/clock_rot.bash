#!bin/bash

icon=$HOME/.config/eww/icons/clock/clock.svg

sed -i "s/.st0{fill:#[A-F0-9]*;/.st0{fill:#7DF9FF;/" $icon

hours=$(date +'%I'*30 | bc)
minutes=$(date +'%M'*6 | bc)

sed -i "s/translate(0) rotate([0-9]*, 50, 50)/translate(0) rotate($hours, 50, 50)/" $icon
sed -i "s/translate(0 0) rotate([0-9]*, 50, 50)/translate(0 0) rotate($minutes, 50, 50)/" $icon

echo "$icon"
