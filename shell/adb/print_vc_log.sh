#@bin/sh

. env.sh

[ -z $1 ] && echo "no params" && adb disconnect && return

. adb_connect_not_wise.sh $1

adb logcat -v time > $PC_HOME_PATH/vc-${1}.log
