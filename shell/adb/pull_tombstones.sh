#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	pull tombstones

. env.sh


[ -z $1 ] && echo "no params" && return
[ -z $2 ] && echo "no second params" && return

. adb_connect_not_wise.sh $1

adb shell kill -6 $2
adb shell kill -6 $2

adb pull /data/tombstones/

mv tombstone_* $PC_HOME_PATH/
