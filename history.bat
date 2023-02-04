REM echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>pip 을 인식 못함 error 발생>환경변수 영구추가
REM set PATH_THAT_I_WANT_TO_ADD=C:\Users\WIN10PROPC3\AppData\Local\Programs\Python\Python311\Scripts
REM setx path "%path%;%PATH_THAT_I_WANT_TO_ADD%;"
REM echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>project_py 이동
REM cd C:\Users\WIN10PROPC3
REM mkdir prjs
REM cd C:\Users\WIN10PROPC3\prjs
REM echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>project_TTS_STT 이동
REM mkdir project_TTS_STT
REM cd project_TTS_STT
REM echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>pyVirtualEnvironment1 활성화
REM python -m venv pyVirtualEnvironment1
REM .\pyVirtualEnvironment1\Scripts\activate
REM echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>library 설치
REM pip install gTTS
REM pip install playsound
REM pip install SpeechRecognition
REM pip install PyAudio
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>python 실행
python history.py

