#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-07-28_10:53:48
#Comments:
#	genarate makefile from gyp


export GYP_GENERATORS=ninja
[ `which ninja` == "" ] && export GYP_GENERATORS=make
export GYP_GENERATORS=make

python gyp.py --depth=. linux_c.gyp 
