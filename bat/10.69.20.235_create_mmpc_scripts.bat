
@echo init param...

@echo off
set file_name=%~n0
set box_ip=%file_name:~0,-20%
set dir_name=%box_ip%

set adb_connent_bat=%box_ip%_adb_connect.bat
set pull_log_bat=%box_ip%_pull_log.bat
set install_bat=%box_ip%_install.bat
set remote_server=10.69.20.112
set install_online_bat=%box_ip%_install_online.bat
set apk_name=TVVideoChat.apk
set apk_main_activity_name=com.yunos.tv.videochat/com.yunos.tvvideochat.activity.PreviewActivity
set max_pull_wait_time=10000
set pull_record_bat=%box_ip%_pull_record.bat
set pull_playout_bat=%box_ip%_pull_playout.bat
set pull_avinout_chart_bat=%box_ip%_pull_avinout_chart.bat

if exist %dir_name%  (
   @del /f /s %dir_name%\*.bat > nul
) else (
	md %dir_name%
)

@echo on
:adb_connect
@echo @adb disconnect > %dir_name%/%adb_connent_bat%
@echo @adb connect %box_ip% >> %dir_name%/%adb_connent_bat%
@echo @adb remount >> %dir_name%/%adb_connent_bat%
@echo @adb devices >> %dir_name%/%adb_connent_bat%
@attrib %dir_name%/%adb_connent_bat% +r
@echo create %adb_connent_bat% finshed!

:pull_log
@echo @call %adb_connent_bat% > %dir_name%/%pull_log_bat%
@echo @echo start pull log... >> %dir_name%/%pull_log_bat%
@echo @set pull_log_time=%%date:~0,4%%-%%date:~5,2%%-%%date:~8,2%%_%%time:~0,2%%-%%time:~3,2%%-%%time:~6,2%%>> %dir_name%/%pull_log_bat%
@echo adb logcat -v time -d ^> vc_%%pull_log_time%%.txt >> %dir_name%/%pull_log_bat%
@echo @echo finsh pull log >> %dir_name%/%pull_log_bat%
@echo @pause >> %dir_name%/%pull_log_bat%
@attrib %dir_name%/%pull_log_bat% +r
@echo create %pull_log_bat% finshed!

:install
:@echo @call %adb_connent_bat% > %dir_name%/%install_bat%
:@echo @echo start install apk...  >> %dir_name%/%install_bat%
:@echo @adb uninstall com.yunos.tv.videochat >> %dir_name%/%install_bat%
:@echo @cd.. >> %dir_name%/%install_bat%
:@echo adb install %apk_name% >> %dir_name%/%install_bat%
:@echo @adb shell am start -n %apk_main_activity_name% >> %dir_name%/%install_bat%
:@echo @echo finsh install apk >> %dir_name%/%install_bat%
:@echo @pause >> %dir_name%/%install_bat%
:@attrib %dir_name%/%install_bat% +r
:@echo create %install_bat% finshed!

:install_online
:@echo @call %adb_connent_bat% > %dir_name%/%install_online_bat%
:@echo @adb shell ping -c 1 -s 100 %remote_server% >> %dir_name%/%install_online_bat%
:@echo @echo start install apk online... >> %dir_name%/%install_online_bat%
:@echo @pause >> %dir_name%/%install_online_bat%
:@attrib %dir_name%/%install_online_bat% +r
:@echo create %install_online_bat% finshed!

:pull record
@echo @call %adb_connent_bat% > %dir_name%/%pull_record_bat%
@echo @echo start pull record...  >> %dir_name%/%pull_record_bat%
@echo @adb shell rm /sdcard/mmpc/audio/* >> %dir_name%/%pull_record_bat%
@echo adb shell am broadcast -a m.record.start >> %dir_name%/%pull_record_bat%
@echo @timeout /t %max_pull_wait_time% >> %dir_name%/%pull_record_bat%
@echo @adb shell am broadcast -a m.record.stop >> %dir_name%/%pull_record_bat%
@echo @adb pull /sdcard/mmpc/audio/ >> %dir_name%/%pull_record_bat%
@echo @echo finsh pull record >> %dir_name%/%pull_record_bat%
@echo @pause >> %dir_name%/%pull_record_bat%
@attrib %dir_name%/%pull_record_bat% +r
@echo create %pull_record_bat% finshed!

:pull playout
@echo @call %adb_connent_bat% > %dir_name%/%pull_playout_bat%
@echo @echo start pull playout...  >> %dir_name%/%pull_playout_bat%
@echo @adb shell rm /sdcard/mmpc/audio/* >> %dir_name%/%pull_playout_bat%
@echo adb shell am broadcast -a m.playout.start >> %dir_name%/%pull_playout_bat%
@echo @timeout /t %max_pull_wait_time% >> %dir_name%/%pull_playout_bat%
@echo @adb shell am broadcast -a m.playout.stop >> %dir_name%/%pull_playout_bat%
@echo @adb pull /sdcard/mmpc/audio/ >> %dir_name%/%pull_playout_bat%
@echo @echo finsh pull playout >> %dir_name%/%pull_playout_bat%
@echo @pause >> %dir_name%/%pull_playout_bat%
@attrib %dir_name%/%pull_playout_bat% +r
@echo create %pull_playout_bat% finshed!

:pull avinout chart
:@echo @call %adb_connent_bat% > %dir_name%/%pull_avinout_chart_bat%
:@echo @echo start pull avinout chart...  >> %dir_name%/%pull_avinout_chart_bat%
:@echo @adb shell rm /sdcard/mmpc/chart/* >> %dir_name%/%pull_avinout_chart_bat%
:@echo adb shell am broadcast -a m.avinout.save >> %dir_name%/%pull_avinout_chart_bat%
:@echo @adb pull /sdcard/mmpc/chart/ >> %dir_name%/%pull_avinout_chart_bat%
:@echo @echo finsh pull avinout chart >> %dir_name%/%pull_avinout_chart_bat%
:@echo @pause >> %dir_name%/%pull_avinout_chart_bat%
:@attrib %dir_name%/%pull_avinout_chart_bat% +r
:@echo create %pull_avinout_chart_bat% finshed!

@pause