@echo off
cls
setlocal
cd /d %~dp0
echo.
echo ------------------------------------------------------
echo                UN-ZIPPER by Suman Roy
echo 	unzip files without thrid party application
echo.
echo     Check out my page at github.com/sumanrox
echo ------------------------------------------------------
echo.

:: File Extraction Details
set /p filePath=[+] File Location :
set /p extractToPath=[+] Place to Extract To :
echo.
echo [+] Unzipping....
timeout 5 /nobreak

:: Call the unzip function
Call :UnZipFile "%extractToPath%" "%filePath%"
exit /b


:: Unzip Function
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