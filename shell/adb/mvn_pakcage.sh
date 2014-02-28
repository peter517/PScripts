#!bin/sh

. env.sh 

cd $MMPC_JAR_PATH 
rm $VIDEOCHAT_BASE_PATH/libs/mmp*.jar
mvn package
cp $MMPC_JAR_PATH/target/mmp-client-1.0.0.jar $VIDEOCHAT_BASE_PATH/libs/

cd -
