@ echo off

set /p abc =enter the dir to encryptio

copy abc\* 1..\* /y
del /q abc\*