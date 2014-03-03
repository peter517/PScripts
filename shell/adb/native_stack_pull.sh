#!/bin/sh

. env.sh


[ -z $1 ] && echo "no params" && adb disconnect && return
[ -z $2 ] && echo "no params" && adb disconnect && return

. adb_connect_not_wise.sh $1

adb shell kill -6 $2
adb shell kill -6 $2

adb pull /data/tombstones/

mv tombstone_* $PC_HOME_PATH/
