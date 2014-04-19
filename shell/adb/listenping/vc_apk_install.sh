#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

[ -z $1 ] && echo "no params" && return

APK_PATH=/home/pengjun/xiaocheng/mmpc-android/release/TVVideoChat.apk
. adb_connect_whole_ip.sh $1
adb remount
adb uninstall com.yunos.tv.videochat
adb install $APK_PATH

adb shell am start -n com.yunos.tv.videochat/com.yunos.tvvideochat.activity.PreviewActivity

