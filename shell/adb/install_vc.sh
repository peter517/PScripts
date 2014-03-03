#!/bin/sh

[ -z $1 ] && echo "no params" && adb disconnect && return

. adb_connect_not_wise.sh $1
. env.sh

cd $UPLOAD_PATH
rm *.apk
cp $VIDEOCHAT_PATH/bin/TVVideoChat_C.apk $UPLOAD_PATH

java -jar signapk.jar platform.x509.pem platform.pk8 TVVideoChat_C.apk TVVideoChat.apk       
adb remount
adb uninstall com.yunos.tv.videochat
adb install TVVideoChat.apk

cd -

adb shell am start -n com.yunos.tv.videochat/com.yunos.tvvideochat.activity.PreviewActivity
