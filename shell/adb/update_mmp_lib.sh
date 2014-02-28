#!bin/sh

. env.sh

(cd $UPLOAD_PATH 
rm mmp*.jar
rm *.so)

scp $MMPC_SDK_REMOTE_PATH/*.jar $UPLOAD_PATH
scp $MMPC_SDK_REMOTE_PATH/*.so $UPLOAD_PATH

rm $VIDEOCHAT_BASE_PATH/libs/mmp*.jar
rm $VIDEOCHAT_BASE_PATH/libs/armeabi-v7a/*.so

cp $UPLOAD_PATH/mmp*.jar $VIDEOCHAT_BASE_PATH/libs
cp $UPLOAD_PATH/*.so $VIDEOCHAT_BASE_PATH/libs/armeabi-v7a
