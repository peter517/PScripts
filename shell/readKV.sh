#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

if [ ! -f $1 ];then
        echo "no file"
        return;
fi

filename=$1

oldIFS=$IFS
IFS=”=“

declare -a propMap

while read k v
do
        propMap[$k]=$v
done < $filename

IFS=$oldIFS


echo ${propMap["a"]}
echo ${propMap["b"]}
