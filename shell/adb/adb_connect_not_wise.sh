#!/bin/sh

[ -z $1 ] && echo "no params" && return

adb disconnect
adb connect 10.69.17.$1
adb devices
