chcp 65001
color 0a
@echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyymmddhhmmss=%%i
set from=E:\500GB\do\utils\space that test\test_from
set to=E:\500GB\do\utils\space that test\test_to


e:
cd %to%
XCOPY "%from%" "%to%" /T /E


pause
exit
cls 






