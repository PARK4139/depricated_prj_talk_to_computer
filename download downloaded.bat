title %~n0
@echo off
chcp 65001
setlocal
set zip_file=Desktop.zip

cd py
py AI_TTS.py "다운로드를 시작합니다"
timeout 3
taskkill -im alsong.exe


cd ..
cd ..
cd "`"
cd "downloaded"
echo "%cd% 에서 다운로드를 시작합니다"
call curl -O http://172.30.1.85:8000/%zip_file%
cd ..
cd ..
cd "prj_talk_to_computer"
cd "py"
py AI_TTS.py "다운로드를 완료하였습니다"
timeout 2



cd ..
cd ..
cd "`"
cd "downloaded"
call bandizip.exe bx %zip_file%
cd ..
cd ..
cd "prj_talk_to_computer"
cd "py"
py AI_TTS.py "압축해제를 완료하였습니다"
timeout 2



cd ..
cd ..
cd "`"
cd "downloaded"
del %zip_file%
cd ..
cd ..
cd "prj_talk_to_computer"
cd "py"
py AI_TTS.py "압축파일 삭제를 완료하였습니다"
timeout 2




taskkill -im alsong.exe
REM pause