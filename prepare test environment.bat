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
REM pip install gTTS
REM pip install playsound
REM pip install SpeechRecognition
REM pip install PyAudio
REM pip install selenium
REM pip install psutil
REM pip install mutagen  
echo "______________________________________________________________ python 실행
cls


py


# -*- coding: utf-8 -*-
import time
import os
import sys
import speech_recognition as sr
from selenium import webdriver
from gtts import gTTS
from sys import argv
from mutagen.mp3 import MP3  
import psutil   # 실행중인 프로세스 및 시스템 활용 라이브러리

def cls():
    os.system('cls')

def cwd():
    print(os.getcwd())

def dir():
    for i in os.listdir():
        # print(i, end = " ")
        print(i)

def mkdir(path):
    os.mkdir(path)

def mkdirtree(path):
    os.mkdirs(path)

def get_length_mp3(target_address):
    try:
        audio = MP3(target_address)  
        print(audio.info.length)
        return audio.info.length
    except:   
        print('get_length_mp3 메소드에서 에러가 발생하였습니다')
        AI_speak('get_length_mp3 메소드에서 에러가 발생하였습니다')
        time.sleep(5)


def tasklist(): 
    for proc in psutil.process_iter():
        try:
            process_im_name = proc.name()
            processID = proc.pid
            print(process_im_name , ' - ', processID)
        
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):   #예외처리
            pass

def taskkill(target_str): 
    for proc in psutil.process_iter():
        try:
            process_im_name = proc.name()
            processID = proc.pid
            # print(process_im_name , '          - ', processID)
        
            if process_im_name.strip() == target_str:
                parent_pid = processID 
                parent = psutil.Process(parent_pid) 
                for child in parent.children(recursive=True):  
                    child.kill()
                parent.kill()
                print(target_str+' 프로세스 죽이기를 시도했습니다')
            
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):   #예외처리
            pass


def startRecordCommand(file_address):
    from datetime import datetime 
    # sys.stdout = open('py cmd recording.txt', 'a', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'w', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'r', encoding='utf-8')  # 
    sys.stdout = open(file_address, 'w', encoding='utf-8')    #

def endRecordCommand():
    sys.stdout.close()

def ipconfig():
    os.system('ipconfig')

def saveFileAs(fileAddress):
    startRecordCommand(fileAddress)    
    print("이것은 param 두개가 더 필요해 보입니다.")
    endRecordCommand()

def readFile(fileAddress):
    with open(fileAddress,'r',encoding='utf-8') as f:
        readed_text = f.read()
    return readed_text

def listen(recognizer, audio): 
    pass

def AI_answer(input_text):
    if input_text=='몇 시야':
        now = time
        yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
    pass

def AI_speak(text):
    if os.path.exists('./mp3/'+ text +'.mp3'):
        # os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3') #비동기처리방식
        # os.system('call "'+os.getcwd()+'/mp3/'+ text +'.mp3"')  #동기처리방식[실패]
        os.system('"'+os.getcwd()+'/mp3/'+ text +'.mp3"')
        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        time.sleep(5)
        target_str = 'Music.UI.exe'
        for proc in psutil.process_iter():
            try:
                process_im_name = proc.name()
                processID = proc.pid        
                if process_im_name.strip() == target_str:
                    parent_pid = processID 
                    parent = psutil.Process(parent_pid) 
                    for child in parent.children(recursive=True):  
                        child.kill()
                    parent.kill()
                    print(target_str+' 프로세스 죽이기를 시도했습니다')
                
            except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):   #예외처리
                pass
        
    else:
        mgr_gTTS = gTTS(text=text, lang='ko')
        mgr_gTTS.save('./mp3/'+ text +'.mp3')
        # os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3') #비동기처리방식
        os.system('call "'+os.getcwd()+'/mp3/'+ text +'.mp3"')  #동기처리방식

def AI_listen():
    r = sr.Recognizer()
    m = sr.Microphone() 
    # audio = sr.Microphone() 
    # with sr.Microphone() as source:
    with m as source:
        # AI_speak('듣고 있습니다')
        print('듣고 있습니다')
        audio=r.listen(source)
    
    try:
        text=r.recognize_google(audio, language='ko-KR') #잘 못 알아먹는다.. 그러나 된다.
        # text=r.recognize_google_cloud(audio, language='ko-KR') # 인증 키가 없어서 안되나보다.
        # text=r.recognize_ibm(audio, language='ko')  # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')  #안되는데 
        # text=r.recognize_bing(audio, language='ko')    # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')  #안되는데  
        print(text)    
    except sr.UnknownValueError:
        # AI_speak('언노운 익셉션이 발생하였습니다')
        print('언노운 익셉션이 발생하였습니다')
    except sr.RequestError as e:
        # AI_speak('리퀘스트 익셉션이 발생하였습니다')
        print('리퀘스트 익셉션이 발생하였습니다')
        # print('에러 코드 : {0}'.format(e))
        # print('에러 가능 원인 : API Key 에러, 네트워크 단절, 등')
    stop_listening = r.listen_in_background(m, listen)  
    # print(audio)
    # print(listen)
    # print(r)
    # print(m)

def AI_run(target_str):
    last_word = target_str.split('.')[-1]
    if 'http' in target_str:
        #__________________________________________________________________________________ 방법1
        # chromeMgr = webdriver.Chrome()
        ##다음 코드의 c 가 사라지는 것을 막기 위한 주석 조치
        # chromeMgr.get(target_str)
        #__________________________________________________________________________________ 방법2
        os.system('start '+target_str)
    elif 'txt' in last_word:
        os.system('start ' +target_str)

def AI_print(target_list):
    for target in target_list
        print(target)

localtime = time.localtime()
yyyy=time.localtime().tm_year
MM=time.localtime().tm_mon
dd=time.localtime().tm_mday
HH=time.localtime().tm_hour
mm=time.localtime().tm_min
ss=time.localtime().tm_sec
timestamp=time.time()
weekday=time.localtime().tm_wday
elapsedDaysFromJan01=time.localtime().tm_yday
yyyyMMddHHmmss=time.strftime('%Y %m %d %H %M %S')
customTime1=time.strftime('%Y-%m-%d %H:%M:%S')
customTime2=time.strftime('%Y-%m-%d %H:%M') 
bnsp=' '  



cls()
#"______________________________________________________  test_Territory s
get_length_mp3('./mp3/대기중입니다.mp3')


remotedesktop = 'https://remotedesktop.google.com/access'
jhppc1 = 'https://remotedesktop.google.com/access/session/b797cd99-b738-f4db-9b38-9a2e25a57a47'
AI_run(jhppc1)
#"______________________________________________________  test_Territory e




AI_cmd_code_list=[
'1:미세먼지',
'2:시간',
'2:공간',
]
# AI_speak('AI 시스템이 준비되었습니다')
AI_speak('컴퓨터와 대화할 준비가 되었습니다.')
cls()
AI_print(AI_cmd_code_list)
AI_speak('원하시는 명령코드를 입력해 주세요')
time.sleep(1)
AI_cmd_code='1'
AI_speak(AI_cmd_code_list[AI_cmd_code-1].split(':')[-1]+'에 대한 명령코드가 입력되었습니다.')
time.sleep(1)


if AI_cmd_code == '1':
    # AI_speak('미세먼지랭킹 날씨 정보를 디스플레이 시도합니다')
    # AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
    # AI_speak('시도완료했습니다')
    AI_speak('미세먼지랭킹 날씨 정보 디스플레이를 시도합니다')
    AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
elif AI_cmd_code == '2':
    AI_speak('해당 기능은 아직 기능이 준비되지 않았습니다')


# cnt = 0
# while(True):
    # AI_listen()
    # AI_answer()
    # time.sleep(5)    
    # cnt ++
    # if cnt == 1
    # cls()
    # break
# print("______________________________________________________  AI_Territory e



