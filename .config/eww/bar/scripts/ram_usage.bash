#!/bin/bash

if [ "$1" == "usage" ]; then
    usage=$(free -h -t | grep Total | awk '{print $3}')
    echo "$usage"

elif [ "$1" == "max"]; then
     mem_total=$(free | grep Mem | awk '{print $2}')
     echo "$mem_total"
fi
