#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	print ndk stack

[ -z "$1" ] && echo "no parameter" && return 1;

LOG_FILE=$1
cat $LOG_FILE | ndk-stack -sym . | head -30 | tee ndk_stack_file


