#!/bin/bash
#Copyright (C) 2010-2020 PScript Project
#Author:pengjun
#Email:peter517@126.com
#CreateTime:2014-04-04_15:34:05
#Comments:
#	install java sdk and export the var in .bashrc 

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

echo "export JRE_HOME=/usr/lib/jvm/java-7-oracle/jre" >> ~/.bashrc
echo "export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH" >> ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH" >> ~/.bashrc
