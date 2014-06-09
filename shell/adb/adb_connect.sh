#!/bin/sh

[ -z $1 ] && echo "no params" && return

adb disconnect
adb connect 10.69.20.$1
adb devices
