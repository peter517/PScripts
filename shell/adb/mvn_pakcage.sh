#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#

. env.sh 

cd $MMPC_JAR_PATH 
rm $VIDEOCHAT_BASE_PATH/libs/mmp*.jar
mvn package
cp $MMPC_JAR_PATH/target/mmp-client-1.0.0.jar $VIDEOCHAT_BASE_PATH/libs/

cd -

rm $VIDEOCHAT_PATH/bin/*.apk
