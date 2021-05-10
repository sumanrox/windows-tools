@echo off
cls
title Windows Update Troubleshoot
color 0a
echo.
echo -----------------------------------------------
echo       		Windows-UT [   Suman Roy  ]
echo.
echo       Windows UT utility will allow you to 
echo         troubleshoot windows update issues
echo.
echo.
echo     Check out my page at github.com/sumanrox
echo -----------------------------------------------
echo.
echo Starting the Update Troubleshooting Service
echo.
timeout /t 10 /nobreak
cls
call :STOP_SERVICE
call :CLEAN_UPDATE_CACHE
call :RUN_RESTORATION
call :START_SERVICE
cls
echo Restarting the system
echo.
timeout /t 5 /nobreak
shutdown /f /r /t 00
EXIT /B %ERRORLEVEL%
:RUN_RESTORATION
cls
echo Running Restoration
echo -----------------------------------------------
echo.
sfc /scannow
dism /online /cleanup-image /restorehealth
exit /B 0
:CLEAN_UPDATE_CACHE
cls
echo Creating Backup of Update Cache
move %systemroot%\SoftwareDistribution SoftwareDistribution.old
move %systemroot%\system32\catroot2 catroot2.old
echo Creating Clean Cache
mkdir %systemroot%\SoftwareDistribution
mkdir %systemroot%\system32\catroot2
exit /B 0
:STOP_SERVICE
cls
echo Stopping Services
echo ----------------------------------------------- 
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
exit /B 0
:START_SERVICE
cls
echo Starting Services
echo -----------------------------------------------
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
exit /B 0