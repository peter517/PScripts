:echo off
set box_ip=%~n0
adb disconnect
adb connect %box_ip%
adb remount
set pull_log_time=%date:~0,4%-%date:~5,2%-%date:~8,2%_%time:~0,2%-%time:~3,2%-%time:~6,2%
adb logcat -v time > vc_%pull_log_time%.txt
:pause
