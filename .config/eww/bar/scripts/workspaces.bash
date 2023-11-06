#!/bin/bash
focus=$(hyprctl activeworkspace -j | grep "id" | grep -io "[0-9]")
ws="(box :class 'icon-small' :height 40"

for i in 1 2 3 4 5 6 
do
    if [ "$i" == "$focus" ]; then
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :valign 'fill' :text ''))"
    else
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :text ''))"
    fi
done

ws="${ws})"

echo $ws
