#!/bin/bash

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
