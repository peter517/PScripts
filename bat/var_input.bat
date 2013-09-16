@ echo off
set /p ans =Enter:[a,b,e]?
if "%ans%"=="a" goto a
if "%ans%"=="b" goto b
if "%ans%"=="e" goto end
:a
echo off > a.txt 
goto end
:b
echo off > b.txt
goto end
:end
echo Good Bye!
pause