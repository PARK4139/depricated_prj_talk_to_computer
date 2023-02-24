color 09
rem // ______________________________________________________________ getAdmin  _________________________________________________________________
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
:------------------------------------------ below cript will acted as administrator mode ------------------------------------------
rem ______________________________________________________________ replace encoding mode as utf-8
chcp 65001
rem
rem
rem
rem
rem
rem
rem
rem
rem backUpTargetFolder
c:	
setlocal
set target=eng to kor
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddhhmmss=%%i
echo d | xcopy "%cd%\%target%" "%cd%\%target% - %yyyyMMddhhmmss%" /e /h /k
rem
rem
rem
rem
rem
rem
rem 
rem
if %ERRORLEVEL%=0 do (echo exit )
if not %ERRORLEVEL%=0 do ( pause )
rem
rem
rem
rem
rem
rem
rem 
rem
rem 만약 어제날짜가 5개가 있으면 첫번째와 마지막폴더를 남기고 모두 삭제한다.
rem 만약 오늘날짜에서 1일 뺀 날짜(어제날짜) 가 
rem
rem
rem 
rem
rem
rem 
rem
rem 해당파일을 23:59||60min||10min||1min(집중작업모드) 마다 작동하도록한다.