#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-16_14:05:22
#Comments:
#	get ip by listen ping request, install the ip to the apk	

sudo pkill tcpdump

LOG=listenping.log
touch $LOG

sudo tcpdump -n -i eth0 'icmp[0]=8' -l | 
while read line;
do 
client_ip=`echo $line | awk '{ if ( $14 == 108 ) print $3}'`
echo recv ping: `date +%Y-%m-%d_%H-%M-%S` from $client_ip >> listenping.log

. vc_apk_install.sh $client_ip
done 

