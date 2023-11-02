#!/bin/bash

icons=$HOME/.config/eww/bar/icons/updates
#quantity=$(emerge -pvuND --with-bdeps=y world | grep "Total" | grep -oE "[0-9]+ packages" | grep -oE "[0-9]+")
quantity=123

if [ "$1" == "total" ]; then
    total="$quantity pending updates"
    echo "$total"
elif [ "$1" == "status" ]; then
    if [ "$quantity" == "" ]; then
	status="false"
    else
	status="true"
    fi
    echo "$status"
fi
