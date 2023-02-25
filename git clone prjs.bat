title %~n0
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> variable defination
chcp 65001
@echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
cls
cd ..
REM git clone https://github.com/PARK4139/prj_talk_to_computer.git
REM git clone https://github.com/PARK4139/prj_AI_img_classifier.git
REM git clone https://github.com/PARK4139/prj_util_batch_2023.git
REM git clone https://github.com/PARK4139/prj_digital_world.git
REM git clone https://github.com/PARK4139/prj_chatGPT.git
REM git clone https://github.com/PARK4139/prj_withv_RPA.git
git clone https://github.com/PARK4139/PRIVATE_RECORDS.git
cd "prj_talk_to_computer"
cd py
call py AI_TTS.py "깃허브에 프로젝트 다운로드를 완료했습니다"
timeout 2
taskkill -im ALSong.exe
:: 왜 안꺼지냐 alsong..