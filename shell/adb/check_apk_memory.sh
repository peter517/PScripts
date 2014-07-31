#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-06-08_21:20:15
#Comments:
#	record android apk memory base on the time 

[ -z $1 ] && echo "no param" && return

pid=$1
pacakge_name=$1
app_key_word=$1

data_file_name="memory_data.dat"
[ -f $data_file_name ] && rm $data_file_name
date_format="+%Y%m%d%H%M%S"

while true
do
	adb shell showmap -t $pid | grep TOTAL | awk  {'if($3~/^[0-9]+$/) printf "%.0f %d\n", '"$(date "$date_format")"' ,$3'} | tee -a $data_file_name
	#adb shell procrank | grep $app_key_word #| awk '{print $4}'
	#adb shell showmap -t $pid | grep TOTAL | awk {'print $3'}
	sleep 3
done

