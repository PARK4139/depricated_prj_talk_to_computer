from gtts import gTTS
import os
import time
now = time
import sys
from datetime import datetime 
from pathlib import Path
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>jung hoon park library 
def cls():
    os.system('cls')

def chdir(path):
    os.chdir(path)
    print(os.getcwd())

def cwd():
    print(os.getcwd())

def dir():
    for i in os.listdir():
        print(i)
        # print(i, end = " ")

def mkdir(path):
    os.mkdir(path)

def mkdirtree(path):
    os.mkdirs(path)

def startRecordCommand(file_address):
    # sys.stdout = open('py cmd recording.txt', 'a', encoding='utf-8')  #>>
    # sys.stdout = open('py cmd recording.txt', 'w', encoding='utf-8')    #>
    # sys.stdout = open('py cmd recording.txt', 'r', encoding='utf-8')  #explorer "py cmd recording.txt"
    sys.stdout = open(file_address, 'w', encoding='utf-8')    #>

def endRecordCommand():
    sys.stdout.close()

 
# print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTTS style1 s")
# text='구글의 AI 음성인식 기술을 활용한 TTS 기능 연습입니다.한국인여성목소리는 설정할 수 없다고 합니다'
# lang='ko'
# gTTS_Mgr = gTTS(text=text, lang=lang )

# file_path = os.getcwd()+'\\mp3\\'+text+'.mp3'
# if os.path.exists(file_path):
    # os.startfile(file_path)
# else:
    # gTTS_Mgr.save(file_path)
    # os.startfile(file_path)

 

# print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTTS style2 s")
# yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
# file_path='.\\txt\\' + 'tmp' + yyyyMMddHHmmss+'.txt'

# startRecordCommand(file_path)   
# print(yyyyMMddHHmmss)
# print("이것은 TTS 기능의 초석이 될 테스트 샘플입니다.")
# print("이것은 파이썬 베이스로 구글의 gTTS 를 활용한 TTS 입니다.")
# print("구글의 AI 음성인식 기술을 활용한 TTS 기능 연습입니다.")
# print("한국인여성목소리는 설정할 수 없다고 합니다.")


# endRecordCommand()


# file_path='./txt/tmp'+ yyyyMMddHHmmss+'.txt'
# with open(file_path,'r',encoding='utf-8') as f:
    # text = f.read()
    # print(text)

# lang='ko'
# gTTS_Mgr = gTTS(text=text, lang=lang )
# file_path = os.getcwd()+'\\mp3\\'+text+'.mp3'
# if os.path.exists(file_path):
    # os.startfile(file_path)
# else:
    # gTTS_Mgr.save(file_path)#너무 길어서 안되는 것 같다
    
    

print(sys.argv)
print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTTS style3 s")
text=sys.argv[1]

# text='테스트'

lang='ko'
file_path = text+'.mp3'
gTTS_Mgr = gTTS(text=text, lang=lang )
# chdir('c:/')
# chdir('../..')#부모의 부모
# chdir('../../..')# 부모의 부모의 부모?
chdir('..')#부모
if os.path.exists('./mp3'):
    chdir('./mp3')
else:
    mkdir('./mp3')
    chdir('./mp3')
    
if os.path.exists(file_path):
    os.startfile(file_path)
else:
    gTTS_Mgr.save(file_path)
    os.startfile(file_path)    
    
    