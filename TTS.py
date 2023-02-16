from gtts import gTTS
import os
import time
now = time
import sys
from datetime import datetime 
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>jung hoon park library 
def cls():
    os.system('cls')

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

# file_name = os.getcwd()+'\\mp3\\'+text+'.mp3'
# if os.path.exists(file_name):
    # os.startfile(file_name)
# else:
    # gTTS_Mgr.save(file_name)
    # os.startfile(file_name)

 

# print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTTS style2 s")
# yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
# file_name='.\\txt\\' + 'tmp' + yyyyMMddHHmmss+'.txt'

# startRecordCommand(file_name)   
# print(yyyyMMddHHmmss)
# print("이것은 TTS 기능의 초석이 될 테스트 샘플입니다.")
# print("이것은 파이썬 베이스로 구글의 gTTS 를 활용한 TTS 입니다.")
# print("구글의 AI 음성인식 기술을 활용한 TTS 기능 연습입니다.")
# print("한국인여성목소리는 설정할 수 없다고 합니다.")


# endRecordCommand()


# file_name='./txt/tmp'+ yyyyMMddHHmmss+'.txt'
# with open(file_name,'r',encoding='utf-8') as f:
    # text = f.read()
    # print(text)

# lang='ko'
# gTTS_Mgr = gTTS(text=text, lang=lang )
# file_name = os.getcwd()+'\\mp3\\'+text+'.mp3'
# if os.path.exists(file_name):
    # os.startfile(file_name)
# else:
    # gTTS_Mgr.save(file_name)#너무 길어서 안되는 것 같다
    
    

print(sys.argv)
print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>gTTS style3 s")
text=sys.argv[1]
lang='ko'
gTTS_Mgr = gTTS(text=text, lang=lang )

file_name = os.getcwd()+'\\mp3\\'+text+'.mp3'
if os.path.exists(file_name):
    os.startfile(file_name)
else:
    gTTS_Mgr.save(file_name)
    os.startfile(file_name)


    
    
