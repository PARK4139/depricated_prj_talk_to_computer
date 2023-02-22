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
REM @echo off
title back up directories and files as overwrited.zip.bat
color 0a
chcp 65001
cls
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i
set target_p=E:\tmp\
set target_n=IIS_kul_jung_hoon_park_logger_log_data
set target_x=.sql
set target_pn=%target_p%%target_n%
set target_pnx=%target_p%%target_n%%target_x%
set target_nx=IIS_kul_jung_hoon_park_logger_log_data.sql
REM c: 
REM d: 
e: 
REM f: 
REM cls
cd %target_p% 
bandizip.exe c "%target_n% - overwrited.zip" "%target_nx%"
copy "%target_nx%" "%target_n% - overwrited%target_x%"
del null


pause
  