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
set target=utils
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i
bandizip.exe c "%target% - %yyyyMMddhhmmss%" "%target%\"
del "%target% - %yyyyMMddhhmmss%"
:: 디버깅(  하드코딩 과 클린코딩 의 출력들을 비교)
REM echo "E:\4TB\2023\do\test - 2022 11 03 02 46 11\test - 2022 11 03 02 46 11.zip" "E:\4TB\2023\do"
REM echo "%cd%\%target% - %yyyyMMddhhmmss%.zip" "%address1%"
REM pause
REM exit
REM move "E:\4TB\2023\do\test - 2022 11 03 02 46 11\test - 2022 11 03 02 46 11.zip" "E:\4TB\2023\do"




:: TBD
REM echo y | rmdir /s /q "%address2%"  
REM start "remove directory useless.bat"




if %ERRORLEVEL%=0 do (exit)
if not %ERRORLEVEL%=0 do ( color 04 )
pause
