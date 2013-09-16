@echo off

@for /f "delims=" %%i in ('dir /b *.*') do (
@IF EXIST "F:\srcDir\%%i" del "F:\dstDir\%%i"
)
@pause