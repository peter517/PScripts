#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	print ndk stack info with symbols so

[ -z "$1" -o -z "$2" ] && echo "no parameter" && return 1;
[ -z "$ANDROID_NDK_ROOT" ] && echo "android ndk root var is null" && return 1;

so_path=$1
stack_address=$2

$ANDROID_NDK_ROOT/toolchains/arm-linux-androideabi-4.6/prebuilt/linux-x86_64/bin/arm-linux-androideabi-addr2line -C -f -e $so_path $stack_address


