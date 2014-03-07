#!/bin/sh

. env.sh

[ -z $1 ] && echo "no params" && return

. adb_connect_not_wise.sh $1

timeout 4s adb logcat -v time > $PC_HOME_PATH/vc-${1}.log

[ -z $2 ] && return
. adb_connect_not_wise.sh $2

timeout 4s adb logcat -v time > $PC_HOME_PATH/vc-${2}.log

