#!bin/bash

icon=$HOME/.config/eww/bar/icons/clock/clock.svg

sed -i "s/.st0{fill:none;stroke:#[A-F0-9]*;/.st0{fill:none;stroke:#7DF9FF;/" $icon
sed -i "s/.st1{fill:none;stroke:#[A-F0-9]*;/.st1{fill:none;stroke:#7DF9FF;/" $icon

hours=$(date +'%I'*30 | bc)
minutes=$(date +'%M'*6 | bc)

sed -i "s/translate(0 0) rotate([0-9]*, 24, 24)/translate(0 0) rotate($hours, 24, 24)/" $icon
sed -i "s/translate(0) rotate([0-9]*, 24, 24)/translate(0) rotate($minutes, 24, 24)/" $icon

echo "$icon"
