chcp 65001
color 0a
REM @echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyymmddhhmmss=%%i
set from=E:\500GB\`\`\
set to=E:\500GB\from something\%yyyymmddhhmmss%\
cd %from%
mkdir "%yyyymmddhhmmss%"
move "*.*" "%yyyymmddhhmmss%"
echo d | xcopy "%from%%yyyymmddhhmmss%" "%to%" /t /e /h /k
pause
exit
e:
cls 
REM echo d | xcopy "%from%%yyyymmddhhmmss%" "%to%%yyyymmddhhmmss%" /e /h /k 
REM del


 
:: collect files of download 
:: collect files of desktop
:: collect files of documentation
