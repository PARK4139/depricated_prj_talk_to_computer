print("______________________________________________________   [utf-8] ")
# -*- coding: utf-8 -*-
print("______________________________________________________   [module] ")
import traceback
import time
import time
import sys
import sys
import speech_recognition as sr
import requests
import psutil  # 실행중인 프로세스 및 시스템 활용 라이브러리
import os
import os
import json
import googletrans
from urllib.parse import unquote
from sys import argv
from selenium import webdriver
from random import randint, random
from mutagen.mp3 import MP3
from gtts import gTTS
from gtts import gTTS
from datetime import datetime
from bs4 import BeautifulSoup as bs



def replacedir(file_address_deploy,file_address_overited):
    if os.path.exists(file_address_overited):
        yyyyMMddhhmmss=
        os.system('py AI_TTS.py "대체하려는 directory와 중복된 이름의 directory가 이미 목적지에 있습니다"')
        # os.system('py AI_TTS.py "삭제하고 대체하시겠습니까"')
        os.system('py AI_TTS.py "목적지에 있는 중복된 이름의 directory 삭제를 시도합니다"')
        os.remove(file_address_overited)
        os.system('py AI_TTS.py "목적지에 복제를 시도합니다"')
        os.chdir(file_address_overited)
        os.chdir('../')
        # os.chdir('..\')
        shutil.copy2(file_address_deploy,file_address_overited)
        os.system('py AI_TTS.py "directory 대체를 완료했습니다"')
        # os.system("bandizip.exe c "+file_address_deploy+" - "+yyyyMMddhhmmss+" "+file_address_deploy+"")
    else:
        os.system('py AI_TTS.py "목적지에 복제를 시도합니다"')
        shutil.copy2(file_address_deploy,file_address_overited)


print(sys.argv[1])
print(sys.argv[2])


file_address_deploy=sys.argv[1]
file_address_overited=sys.argv[2]
replacedir(file_address_deploy,file_address_overited)


file_address_deploy=
file_address_overited=
replacedir(file_address_deploy,file_address_overited)



def record_background_sound_as_mp3_file():
    pass

os.system('py AI_TTS.py "빅스비 지금 몇시야"')
record_background_sound_as_mp3_file()