#!/bin/bash
focus=$(hyprctl activeworkspace -j | grep "id" | grep -io "[0-9]")
active=( $(hyprctl workspaces -j | grep "id" | grep -io "[0-9]" | tr '\r\n' ' ') )
ws="(box :class 'icon-small' :height 35"

for i in 1 2 3 4 5 6 
do
    if [ "$i" == "$focus" ]; then
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :valign 'fill' :text ''))"
    elif [[ " ${active[*]} " =~ " ${i} " ]]; then
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :text ''))"
    else
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :text ''))"
    fi
done

ws="${ws})"

echo $ws
