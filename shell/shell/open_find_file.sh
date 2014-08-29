#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	open the only file after execute the cmd 'find'`

[ -z "$1" ] && echo "no para, enter filename need to find" && return;


find_files=$(find -name $1)
find_files_num=`for file in $find_files ;do echo $file; done | wc -l`

echo "find files num: "$find_files_num
[ $find_files_num == 0 ] && echo "not find any files" && return 
[ $find_files_num != 1 ] && ( for file in $find_files ;do echo $file; done ) &&  echo " find more than one file, not open them !!!" && return

echo "start to open file: "$find_files
vim $find_files

echo "close file: "$find_files
