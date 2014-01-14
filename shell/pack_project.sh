#!bin/sh

pack_dir=pack_wp
win_path=/cygdrive/d/project/mmpc-wp/src/client/windows/webrtc/trunk/build/Win32/Release/
android_path=/cygdrive/d/project/mmpc-wp/src/client/android/wiseprojection/bin/
target_path=/cygdrive/c/Users/pengjun.pj/Desktop/wp/
pack_name=wp_$(date +%Y%m%d).tar
win_app_name=wise_projection_qt_win.exe
android_app_name=WirelessProjectionAndroid.apk
cur_path=$(pwd)
build_info_file=build_info.txt

if [ -d $pack_dir ]; then
	rm $pack_dir/*
else
	mkdir $pack_dir
fi

echo "build date: "$(date) > $pack_dir/$build_info_file

echo "start bulid pack "$pack_name".........."

(cp $win_path/$win_app_name $cur_path/$pack_dir)
(cp $android_path/$android_app_name $cur_path/$pack_dir)
(cd $pack_dir && tar -cvf $target_path/$pack_name $build_info_file $win_app_name $android_app_name)  

echo "success to bulid pack "$pack_name"!"
