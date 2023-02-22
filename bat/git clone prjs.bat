echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> variable defination
chcp 65001
@echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
cls
git clone https://github.com/PARK4139/prj_talk_to_computer.git
git clone https://github.com/PARK4139/PLAY_GROUND.git
git clone https://github.com/PARK4139/prj_AI_img_classifier.git
git clone https://github.com/PARK4139/prj_mgr.git
git clone https://github.com/PARK4139/prj_youtube_donwloading.git
git clone https://github.com/PARK4139/prj_util_batch_2023.git
git clone https://github.com/PARK4139/prj_server_communication.git
git clone https://github.com/PARK4139/prj_digital_world.git
git clone https://github.com/PARK4139/prj_chatGPT.git
git clone https://github.com/PARK4139/prj_withv_RPA.git

exit