::getAdmin  
REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM if '%errorlevel%' NEQ '0' ( echo Requesting administrative privileges... goto UACPrompt 
REM ) else ( goto gotAdmin ) 
REM :UACPrompt 
	REM echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
	REM set params = %*:"="" 
	REM echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" 
	REM "%temp%\getadmin.vbs" 
	REM del "%temp%\getadmin.vbs" 
	REM exit /B 
REM :gotAdmin
	REM pushd "%CD%"
	REM CD /D "%~dp0"
REM :------------------------------------------ below cript will acted as administrator mode ------------------------------------------ 
cls
echo off
color 0a
chcp 65001 
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i



bandizip.exe c "dbever script segment - %yyyyMMddhhmmss%" C:\Users\JungHoonPark\AppData\Roaming\DBeaverData\workspace6\General\Scripts
bandizip.exe c "dbever script segment - overwrited" C:\Users\JungHoonPark\AppData\Roaming\DBeaverData\workspace6\General\Scripts





:: to do 백업 연동
REM call "E:\back up do as do - overwrited.bat"
REM cmd /c "E:\back up do as do - overwrited.bat"
REM explorer "E:\back up do as do - overwrited.bat"
REM start "E:\back up do as do - overwrited.bat"

 


if %ERRORLEVEL%=0 do (exit)
if not %ERRORLEVEL%=0 do ( color 04 )
pause
exit
