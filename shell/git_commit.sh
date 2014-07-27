#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	commit changed files under git control

if [ -z "$1" ];then
        echo "no parameter"
        return 1;
fi

commit=$1

git add -A && git commit -m "$commit" && git push


