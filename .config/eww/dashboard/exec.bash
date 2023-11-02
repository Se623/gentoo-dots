#!/bin/bash

FILE="$HOME/.cache/eww_launch.dashboard"
EWW=`which eww`

run_eww() {
	${EWW} open-many \
		   system \
		   weather \
		   logout \
		   sleep \
		   reboot \
		   poweroff \
		   user \
		   dashboard
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	run_eww
else
	${EWW} close \
	       system weather \
	       logout sleep reboot poweroff user dashboard
	rm "$FILE"
fi

