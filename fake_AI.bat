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
@echo off
echo "______________________________________________________________ python 실행
cls
py fake_AI.py
REM timeout 10





REM pause