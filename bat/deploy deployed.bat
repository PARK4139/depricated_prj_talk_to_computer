@echo off
chcp 65001
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i

echo "server started tiem : yyyyMMddHHmmss" > deployed.log
cls
ipconfig | find "172" > deployed.log



cd py
py AI_TTS.py "배포 server 를 시작합니다"




cd ..
cd deployed
cmd /k py -m http.server 8000




cd py
py AI_TTS.py "배포 server 를 종료합니다"




taskkill -im alsong.exe