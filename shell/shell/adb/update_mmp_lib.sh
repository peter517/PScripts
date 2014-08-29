#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

. env.sh

(cd $UPLOAD_PATH && rm mmp*.jar && rm *.so)

rm $VIDEOCHAT_BASE_PATH/libs/mmp*.jar
rm $VIDEOCHAT_BASE_PATH/libs/armeabi-v7a/*.so

scp $MMPC_SDK_REMOTE_PATH/*.jar $UPLOAD_PATH
scp $MMPC_SDK_REMOTE_PATH/*.so $UPLOAD_PATH

cp $UPLOAD_PATH/mmp*.jar $VIDEOCHAT_BASE_PATH/libs
cp $UPLOAD_PATH/*.so $VIDEOCHAT_BASE_PATH/libs/armeabi-v7a

rm $VIDEOCHAT_PATH/bin/*.apk
