#!bin/bash

[ $# != 3 ] && echo "enter: filename srcStr disStr" && return

filename=$1

srcStr=`egrep -o $2 $filename`

declare -a srcArr
declare -i len
len=0

for str in $srcStr
do
	echo "srcStr "$str
	srcArr[$len]=$str
	let len=$len+1	
done

dstStr=`egrep -o $3 $filename`

declare -a dstArr
len=0

for str in $dstStr
do
        echo "dstSrc "$str
        dstArr[$len]=$str
        let len=$len+1
done

echo $len

for((i=0;i<$len;i++))
do
	sed -i "s/${srcArr[$i]}/${dstArr[$i]}/g" readKV.sh
done
