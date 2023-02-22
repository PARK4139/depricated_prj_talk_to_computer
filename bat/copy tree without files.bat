REM ______________________________________________________________________________________  <    >
@echo
REM ______________________________________________________________________________________  <    >
color 0d

REM ______________________________________________________________________________________  <  backUpAll.bat is complete partly.  >
rem // ______________________________________________________________ getAdministratorRights  _________________________________________________________________
REM // ______________________________________________________________ Check for permissions _________________________________________________________________
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM // ______________________________________________________________ If error flag set, we do not have admin.  _________________________________________________________________
if '%errorlevel%' NEQ '0' ( echo Requesting administrative privileges... goto UACPrompt 
) else ( goto gotAdmin ) 
:UACPrompt 
	echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
	set params = %*:"="" 
	echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" 
	
	"%temp%\getadmin.vbs" 
	del "%temp%\getadmin.vbs" 
	exit /B 
	
:gotAdmin
	pushd "%CD%"
	CD /D "%~dp0"
:------------------------------------------ below script will acted as administrator mode ------------------------------------------


chcp 65001
color 0a
@echo off
setlocal
:: for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyymmddhhmmss=%%i

:: module 1
set target=C:\Users\JungHoonPark\IdeaProjects\foo\src\코드분석및설명용\a입사

:: module 2
set to=E:\500GB\do\utils\space that copy directory tree without files\here


e:
cd %to%
xcopy "%target%" . /E /T    
echo .......이건 수동으로 밖에 않되나?


REM pause
exit
cls 









