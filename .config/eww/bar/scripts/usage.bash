#!/bin/bash

if [ "$1" == "ram" ]; then
    usage=$(echo "scale=2; $(free -t | grep Total | awk '{print $3}') / ( $(free -t | grep Total | awk '{print $2}') / 100)" | bc)
    echo "$usage"

elif [ "$1" == "cpu" ]; then
     usage=$(echo "100 - $(mpstat | grep all | awk '{printf $13}')" | bc)
     echo "$usage"
fi
