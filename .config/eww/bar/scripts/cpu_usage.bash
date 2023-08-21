#!bin/bash

usage=$(echo 100 - $(mpstat | awk '{printf $13}' 2> /dev/null) | bc)
echo "$usage"


