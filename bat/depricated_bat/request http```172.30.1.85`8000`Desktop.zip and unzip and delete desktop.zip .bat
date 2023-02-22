@echo off
chcp 65001
setlocal

cd "[TO DO]"


call curl -O http://172.30.1.85:8000/Desktop.zip
py AI_TTS.py "다운로드를 완료하였습니다"

call bandizip.exe bx Desktop.zip
py AI_TTS.py "압축해제를 완료하였습니다"

del Desktop.zip
py AI_TTS.py "압축파일 삭제를 완료하였습니다"

pause