# -*- coding: utf-8 -*-
import time
import os
from gtts import gTTS
from sys import argv
import speech_recognition as sr

def cls():
    import os
    os.system('cls')

def cwd():
    import os
    print(os.getcwd())

def dir():
    import os
    for i in os.listdir():
        print(i)
        # print(i, end = " ")

def mkdir(path):
    import os
    os.mkdir(path)

def mkdirtree(path):
    import os
    os.mkdirs(path)

def startRecordCommand(file_address):
    import sys
    from datetime import datetime 
    # sys.stdout = open('py cmd recording.txt', 'a', encoding='utf-8')  #>>
    # sys.stdout = open('py cmd recording.txt', 'w', encoding='utf-8')    #>
    # sys.stdout = open('py cmd recording.txt', 'r', encoding='utf-8')  #explorer "py cmd recording.txt"
    sys.stdout = open(file_address, 'w', encoding='utf-8')    #>

def endRecordCommand():
    import sys
    sys.stdout.close()

def ipconfig():
    import os
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
        os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3')
    else:
        mgr_gTTS = gTTS(text=text, lang='ko')
        mgr_gTTS.save('./mp3/'+ text +'.mp3')
        os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3')

def AI_listen():
    # AI_speak('대기중입니다')
    r = sr.Recognizer()
    m = sr.Microphone() 
    # audio = sr.Microphone() 
    # with sr.Microphone() as source:
    with m as source:
        # AI_speak('듣고 있습니다')
        print('듣고 있습니다')
        audio=r.listen(source)
    
    try:
        text=r.recognize_google(audio, language='ko-KR') #잘 못 알아먹는다..
        # text=r.recognize_google_cloud(audio, language='ko-KR') # 인증 키가 없어서 안되나보다.
        # text=r.recognize_ibm(audio, language='ko')  # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')  #안되는데 그냥
        # text=r.recognize_bing(audio, language='ko')    # 인증 키가 없어서 안되나보다.
        # text=r.recognize_sphinx(audio, language='ko')   
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


# print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AI_Territory s
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



cnt = 0
while(True):
    # AI_speak('시스템이 준비되었습니다')
    AI_listen()
    AI_answer()
    time.sleep(5)
        
    # cnt ++
    # if cnt == 1
    # cls()
    # break
# print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> AI_Territory e




