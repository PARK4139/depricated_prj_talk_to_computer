@echo off
chcp 65001
setlocal

cd "downloaded"
call curl -O http://172.30.1.85:8000/Desktop.zip
cd ..
cd py
py AI_TTS.py "다운로드를 완료하였습니다"



cd ..
cd "downloaded"
call bandizip.exe bx Desktop.zip
cd ..
cd py
py AI_TTS.py "압축해제를 완료하였습니다"



cd ..
cd "downloaded"
del Desktop.zip
cd ..
cd py
py AI_TTS.py "압축파일 삭제를 완료하였습니다"


taskkill -im alsong.exe
pause