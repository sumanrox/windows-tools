@echo off 
title Windows GroupPolicy Installer
color 0a
echo.
echo ---------------------------------------------------
echo       		Windows GroupPolicy Installer
echo                          by
echo                    [   Suman Roy  ]
echo.
echo     Check out my page at github.com/sumanrox
echo ---------------------------------------------------
echo.
echo Starting the Installer
timeout /t 10 /nobreak
pushd "%~dp0"
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt 
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" 
pause