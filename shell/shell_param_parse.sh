#!/bin/sh
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-11-30_10:32:51
#Comments:
#	parse shell param

echo "$1"

while getopts "nb:c" arg 

do
        case $arg in
             n)
                echo "a's arg:$OPTARG" 
                ;;
             b)
                echo "b"
                echo "$OPTARG" 
                ;;
             c)
                echo "c"
                echo "$OPTARG" 
                ;;
             ?)  #unkown param
            echo "unkonw argument"
        exit 1
        ;;
        esac
done
