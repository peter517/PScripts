#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

[ -z $1 ] && echo "no params" && return

adb disconnect
adb connect $1
adb remount
adb devices
