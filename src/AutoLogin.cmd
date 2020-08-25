@echo off
cls
title BypassAuth
color 0a
echo.
echo -------------------------------------------------------------------------
echo     AutoLogin will allow you to Automatically Login 
echo		in Microsoft Windows
echo.
echo                           written with love by
echo.
echo                             [   SUMAN ROY   ]
echo.
echo     Check out my page at github.com/sumanrox
echo -------------------------------------------------------------------------
echo.
echo Note : This script needs to be run as an Administrator
echo Note : PIN Authentication needs to be disabled, before proceeding any further
echo Note : If it shows "Access Denied", that means it has failed else "Successful"
echo.
echo =========
echo      MENU
echo =========
echo.
echo [ 1 ]  Enable Auto Login
echo.
echo [ 2 ]  Disable Auto Login
echo.

:: Give the Choice to User
set /p choice=[+] Enter Choice :
if %choice%==1 (Call :Enable) else (Call :Disable)
Exit /b 0
echo Script Executed Successfully
exit
:: Enable Auto Login Feature
:Enable
echo.
echo You have chosen to Enable Auto Login
echo -------------------------------------
set /p pass=[+] Enter Password for your Computer :
echo.
:: Passing username
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v DefaultUserName /D %username% /F
:: Passing DefaultPassword
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v DefaultPassword /D %pass% /F
:: Passing Auto Login status
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v AutoAdminLogon /D 1 /F
echo.
pause
Exit
Exit /B 0


:: Disable Auto Login Feature
:Disable
echo.
echo You have chosen to Disable Auto Login
echo -------------------------------------
echo.
:: Passing username
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v DefaultUserName /f
:: Passing DefaultPassword
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v DefaultPassword /f
:: Passing Auto Login status
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinLogon" /v AutoAdminLogon /f
echo.
echo Note if it shows "Access Denied", that means it has failed else "Successful"
pause
Exit /B 0