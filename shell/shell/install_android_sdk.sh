#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	install android sdk and export the var in .bashrc

sudo add-apt-repository ppa:upubuntu-com/sdk
sudo apt-get update
sudo apt-get install android-sdk

echo "export ANDROID_SDK_ROOT=/home/pengjun/android-sdk-linux" >> ~/.bashrc
echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/tools " >> ~/.bashrc
echo "export PATH=${PATH}:${ANDROID_SDK_ROOT}/platform-tools" >> ~/.bashrc

