#!/bin/bash
focus=$(hyprctl activeworkspace -j | grep "id" | grep -io "[0-9]")
ws="(box :class 'icon-small' :spacing 5 :valign 'center'"

for i in 1 2 3 4 5 6 
do
    if [ "$i" == "$focus" ]; then
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :text '\\ue932'))"
    else
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' (label :class 'icon-small' :text '\\ue931'))"
    fi
done

ws="${ws})"

echo $ws
