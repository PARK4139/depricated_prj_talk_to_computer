 

REM :: // ______________________________________________________________ getAdmin  _________________________________________________________________
REM >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM :: // ______________________________________________________________ If error flag set, we do not have admin.  _________________________________________________________________
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
color 0c
setlocal

set path_destination=%cd%
REM c:
REM d:
REM e:
REM f:
cd "`"
mkdir "`"
for /r %%i in (*.*) do move "%%i" "%path_destination%"
cd ..
for /f "usebackq delims=" %%i in (`"dir /s /b /ad | sort /r"`) do rd "%%i" 2>NUL 
 