#!/bin/sh

[ -z $1 ] && echo "no params" && return

. env.sh

cd $UPLOAD_PATH
rm *.apk
cp $VIDEOCHAT_PATH/bin/TVVideoChat_C.apk $UPLOAD_PATH

java -jar signapk.jar platform.x509.pem platform.pk8 TVVideoChat_C.apk TVVideoChat.apk       

. ~/adb_connect_not_wise.sh $1
adb remount
adb uninstall com.yunos.tv.videochat
adb install TVVideoChat.apk

adb shell am start -n com.yunos.tv.videochat/com.yunos.tvvideochat.activity.PreviewActivity

#other device
[ -z $2 ] && cd - && return
. ~/adb_connect_not_wise.sh $2
adb remount
adb uninstall com.yunos.tv.videochat
adb install TVVideoChat.apk

adb shell am start -n com.yunos.tv.videochat/com.yunos.tvvideochat.activity.PreviewActivity

cd -
