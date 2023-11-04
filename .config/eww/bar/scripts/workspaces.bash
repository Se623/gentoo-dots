#!/bin/bash
active=$(hyprctl activeworkspace -j | grep "id" | grep -io "[0-9]")
ws="(box :class 'icon-small' :spacing 5 :valign 'center'"

for i in 1 2 3 4 5 6 
do
    if [ "$i" == "$active" ]; then
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' '•')"
    else
	ws="${ws} (button :onclick 'hyprctl dispatch workspace $i' '○')"
    fi
done

ws="${ws})"

echo $ws
