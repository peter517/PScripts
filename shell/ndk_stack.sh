#!bin/bash

[ -z "$1" ] && echo "no parameter" && return 1;

LOG_FILE=$1
cat $LOG_FILE | ndk-stack -sym . | head -30 | tee ndk_stack_file


