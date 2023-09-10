#!/bin/bash

if [ "$1" == "ram" ]; then
    usage=$(free | grep Mem | awk '{print $3}')
    echo "$usage"

elif [ "$1" == "ram-total" ]; then
     mem_total=$(free | grep Mem | awk '{print $2}')
     echo "$mem_total"

elif [ "$1" == "cpu" ]; then
     usage=$(echo "100 - $(mpstat | grep all | awk '{printf $13}')" | bc)
     echo "$usage"
fi
