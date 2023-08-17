#!/bin/bash

day=$(date +'%d')
month=$(date +'%m')

day-prep() {
if [ $day -eq 01 ] || [ $day -eq 21 ] || [ $day -eq 31 ]; then
  day_prep=${date}st
elif [ $day -eq 02 ] || [ $day -eq 22 ]; then
  day_prep=${date}nd
elif [ $day -eq 03 ] || [ $day -eq 23 ]; then
  day_prep=${date}rd
else
  day_prep=${date}th
fi
echo "$day$day_prep"
}

month-prep() {
MONTHS=(ZERO Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec)

month_prep=${MONTHS[$((month))]}
echo "$month_prep"
}

[ "$1" = "day-prep" ] && day-prep && exit
[ "$1" = "month-prep" ] && month-prep && exit
exit
