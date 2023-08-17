#!/bin/bash

usage() {
usage=$(free -h -t | grep Total | awk '{print $3 " | " $2}')
echo "$usage"
}

usage_mem() {
mem_total=$(free | grep Mem | awk '{print $2}')
mem_avail=$(echo "${mem_total} - $(free | grep Mem | awk '{print $7}')" | bc)
usage_mem=$(echo "scale=2; ${mem_avail} / ${mem_total} * 100" | bc)
echo "$usage_mem"
}

usage_swap() {
swap_total=$(free | grep Swap | awk '{print $2}')
swap_avail=$(free | grep Swap | awk '{print $3}')
usage_swap=$(echo "scale=2; ${swap_avail} / ${swap_total} * 100" | bc)
echo "$usage_swap"
}

[ "$1" = "usage" ] && usage && exit
[ "$1" = "usage_mem" ] && usage_mem && exit
[ "$1" = "usage_swap" ] && usage_swap && exit
exit
