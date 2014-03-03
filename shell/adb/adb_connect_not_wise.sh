#!/bin/sh

[ -z $1 ] && echo "no params" && adb disconnect && return

adb disconnect
adb connect 10.69.17.$1
adb devices
