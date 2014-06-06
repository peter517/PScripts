#!/bin/sh

[ -z $1 ] && echo "no param" && return
pid=$1
data_file_name="memory_data.dat"
[ -f $data_file_name ] && rm $data_file_name
date_format="+%Y%m%d%H%M%S"
while true
do
        adb shell showmap -t $pid | grep TOTAL | awk  {'if($3~/^[0-9]+$/) printf "%.0f %d\n", '"$(date "$date_format")"' ,$3'} | tee -a $data_file_name
        sleep 3
done

