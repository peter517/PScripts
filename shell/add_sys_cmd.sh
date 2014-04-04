#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

if [ -z "$1" ] || [ -z "$2" ];then
	echo "no parameter"
	return 1;
fi


envfile=".bashrc"
cmd=$1
script=$2

cd ~
isExist=`grep -w "alias ""$1" $envfile`

if [ "$isExist" ];then
	cd -
	echo "cmd existed!"
	return 1;
fi

insertNum=`grep -nw "alias" $envfile | cut -d : -f 1 | tail -1`

sed -i $insertNum'a''alias '$cmd'=''\". '$script'\"' $envfile 


source .bashrc
cd -
echo "add success"
