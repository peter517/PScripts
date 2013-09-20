#!/bin/sh

sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java7-installer

#export JAVA_HOME=/usr/lib/jvm/java-7-oracle/
#export JRE_HOME=/usr/lib/jvm/java-7-oracle/jre
#export CLASSPATH=.:$JAVA_HOME/lib:$JRE_HOME/lib:$CLASSPATH
#export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

