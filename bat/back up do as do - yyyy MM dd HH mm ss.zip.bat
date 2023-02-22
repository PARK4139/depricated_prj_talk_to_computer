::특별한 일이 없다면 before os shutdown routine  
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
title back up do as do - yyyy MM dd HH mm ss.zip.bat
@echo off
color 0a
chcp 65001
cls
setlocal
set target_p=E:\500GB\
set target_n=do
set target_x=
set target_pn=%target_p%%target_n%
set target_pnx=%target_p%%target_n%%target_x%
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i
e:
cd %target_p% 
bandizip.exe c "%target_n%" "%target_n%"
ren "%target_pn%.zip" "%target_n% - %yyyyMMddhhmmss%.zip"
del null


   