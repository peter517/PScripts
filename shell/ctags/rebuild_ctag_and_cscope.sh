#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-11-27_13:58:36
#Comments:
#	for ctags cscope rebuild

project_path=$1

echo "project_path="$project_path

[ -z "$project_path" -o ! -d "$project_path" ] && echo "no param" && return

echo "start build ctags evn"
ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f $project_path/tags $project_path
echo "finish build ctags evn"

echo -e "\nstart build cscope evn"
cscope -Rbq -s $project_path -f $project_path/cs.out 
echo "finsh build cscope evn"
