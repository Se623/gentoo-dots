#!bin/bash

mpstat 2 | while read line;
do
    usage=$(echo 100 - $(echo $line | awk '{printf $13}' 2> /dev/null) | bc)
    echo "$usage"
done;

