#!/bin/bash

if [ ! -f $1 ];then
        echo "no file"
        return;
fi

oldIFS=$IFS
IFS=”=“

declare -a propMap

while read k v
do
        propMap[$k]=$v
done < $1

IFS=$oldIFS


#echo ${propMap["a"]}
#echo ${propMap["b"]}
