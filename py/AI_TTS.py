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

        

# print("_____________________________________________________ AI_TTS.py s")



# text='테스트'
try:
    text=sys.argv[1]
except:
    text='exception 이 발생하였습니다'


lang='ko'
file_path = text+'.mp3'
gTTS_Mgr = gTTS(text=text, lang=lang )
# chdir('c:/')
# chdir('../..')#부모의 부모
# chdir('../../..')# 부모의 부모의 부모?
chdir('..')#부모
tmp = './mp3'


if os.path.exists(tmp):
    chdir(tmp)
else:
    mkdir(tmp)
    chdir(tmp)
    
if os.path.exists(file_path):
    os.startfile(file_path)
       
else:
    gTTS_Mgr.save(file_path)
    os.startfile(file_path)
    
    
# print("_____________________________________________________ AI_TTS.py e")