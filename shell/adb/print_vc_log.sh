#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

. env.sh

[ -z $1 ] && echo "no params" && return

. adb_connect.sh $1

adb logcat -v time -d > $PC_HOME_PATH/vc-${1}.log

[ -z $2 ] && return
. adb_connect.sh $2

adb logcat -v time -d > $PC_HOME_PATH/vc-${2}.log

