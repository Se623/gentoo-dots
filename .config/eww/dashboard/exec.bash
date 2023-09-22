#!/bin/bash

FILE="$HOME/.cache/eww_launch.dashboard"
EWW=`which eww`

## Run eww daemon if not running already
if [[ ! `pidof eww` ]]; then
	${EWW} daemon
	sleep 1
fi

run_eww() {
	${EWW} open-many \
		   system \
		   weather \
		   logout \
		   sleep \
		   reboot \
		   poweroff \
		   user
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close \
	       system weather \
	       logout sleep reboot poweroff user 
	rm "$FILE"
fi

