echo " ______________________________________________________________ variable defination
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
REM echo "______________________________________________________________ pip 환경변수 영구추가
REM set PATH_THAT_I_WANT_TO_ADD=C:\Users\WIN10PROPC3\AppData\Local\Programs\Python\Python311\Scripts
REM setx path "%path%;%PATH_THAT_I_WANT_TO_ADD%;"
REM echo "______________________________________________________________ project_py 이동
REM cd C:\Users\WIN10PROPC3
REM mkdir prjs
REM cd C:\Users\WIN10PROPC3\prjs
REM echo "______________________________________________________________ project_TTS_STT 이동
REM mkdir project_TTS_STT
REM cd project_TTS_STT
REM echo "______________________________________________________________ pyVirtualEnvironment1 활성화
REM python -m venv pyVirtualEnvironment1
REM .\pyVirtualEnvironment1\Scripts\activate
REM echo "______________________________________________________________ library 설치
REM pip list
REM pip install requests               
REM pip install beautifulsoup4    	   
REM pip install gTTS
REM pip install playsound
REM pip install gTTS
REM pip install playsound
REM pip install SpeechRecognition
REM pip install PyAudio
REM pip install selenium
REM pip install psutil
REM pip install mutagen
chcp 65001
@echo off
echo "______________________________________________________________ python 실행
cls
start /max py fake_AI.py
REM echo "______________________________________________________________ debugging mode 
REM timeout 10
REM pause

REM echo " ______________________________________________________________ add
REM git add *  
REM echo " ______________________________________________________________ commit
REM git commit -m "%yyyyMMddHHmmss%" 
REM echo " ______________________________________________________________ push
REM git push -u origin main  
REM echo " ______________________________________________________________ status
REM :: git status | find "clean"
REM git status  
REM cls
REM echo " ______________________________________________________________ add
REM git add * | find "clean"
REM echo " ______________________________________________________________ commit
REM git commit -m "%yyyyMMddHHmmss%" | find "clean"
REM echo " ______________________________________________________________ push
REM git push -u origin main | find "100%"
REM echo " ______________________________________________________________ status
REM :: git status | find "clean"
REM git status | find "clean"







REM pause
REM timeout 2
exit