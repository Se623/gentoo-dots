#!/bin/bash


connect=$(nmcli -t -f NAME connection show --active | head -n1 | sed 's/\"/\\"/g' | sed 's/ /-/g')
power=$(nmcli -f in-use,signal dev wifi | grep "*" | awk '{print $2}')
state=""

if [ "$1" == "type" ]; then
    if [[ $connect =~ "Wired" ]]; then
	state="Wired Connection"
    elif [ $connect == "lo" ]; then
	state="Disconnected"
    else
	state="Wi-Fi Connection ($connect)"
    fi

    echo "$state"

elif [ "$1" == "power" ]; then
    echo "$power"

elif [ "$1" == "icon" ]; then
    if [ "$power" == "" ]; then
        if [ $connect == *"Wired"* ]; then
            echo "\\ue900"
        else
            echo "\\ue901"
        fi
    elif [ "$power" -gt "66" ]; then
        echo "\\ue906"
    elif [ "$power" -gt "33" ]; then
       	echo "\\ue90b"
    elif [ "$power" -gt "0" ]; then
       	echo "\\ue909"
    fi
fi
