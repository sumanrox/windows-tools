@echo off
cls
title Windows Update Troubleshoot
color 0a
echo.
echo -------------------------------------------------------------------------
echo       		Windows-UT by [   Suman Roy  ]
echo       Windows UT utility will allow you to troubleshoot windows update issues
echo.
echo.
echo     Check out my page at github.com/sumanrox
echo -------------------------------------------------------------------------
echo.
echo Starting Troubleshooter
timeout /t 10
cls 
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
cls
sfc /scannow
dism /online /cleanupimage /restorehealth
cls
rmdir %systemroot%\SoftwareDistribution /S /Q
rmdir %systemroot%\system32\catroot2 /S /Q
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
cls
echo Restarting System in 20 Secs
echo.
echo Check for updates after restart is done