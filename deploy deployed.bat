@echo off
chcp 65001
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
set log_file=deployed.log



cd log
echo "server started tiem : yyyyMMddHHmmss" > %log_file%
cls
REM ipconfig | find "172" > %log_file%
ipconfig -all | find "172"
ipconfig -all | find "172" > %log_file%




cd ..
cd py
py AI_TTS.py "deploying server 를 시작합니다"
REM timeout 2
REM taskkill -im alsong.exe
cd ..
cd ..
cd "`"
cd "deployed"
cmd /k py -m http.server 8000



cd ..
cd ..
cd "prj_talk_to_computer"
cd py
py AI_TTS.py "deploying server 를 종료합니다"




timeout 10
taskkill -im alsong.exe