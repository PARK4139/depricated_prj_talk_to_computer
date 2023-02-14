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
echo "______________________________________________________________ python 실행
cls
py
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>module import
# -*- coding: utf-8 -*-
import os
import sys
from gtts import gTTS
from datetime import datetime 
import time
import requests
from bs4 import BeautifulSoup as bs
from urllib.parse import unquote
import time
import os
import sys
import speech_recognition as sr
from selenium import webdriver
from gtts import gTTS
from sys import argv
from mutagen.mp3 import MP3
import psutil   # 실행중인 프로세스 및 시스템 활용 라이브러리
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>function defination
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

def get_length_of_mp3(target_address):
    try:
        audio = MP3(target_address)
        # print(audio.info.length)
        return audio.info.length
    except:   
        print('get_length_of_mp3 메소드에서 에러가 발생하였습니다')
        


def tasklist(): 
    for proc in psutil.process_iter():
        try:
            process_im_name = proc.name()
            processID = proc.pid
            print(process_im_name , ' - ', processID)
        
        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):   #예외처리
            pass

def taskkill(target_str): 
    # target_str = 'Music.UI.exe'
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

def AI_answer():
    if usr_input == '1':
        # AI_speak('미세먼지랭킹 날씨 정보를 디스플레이 시도합니다')
        # AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
        # AI_speak('시도완료했습니다')
        AI_speak('미세먼지랭킹 날씨 정보에 접근을 시도합니다')
        AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
        
    elif usr_input == '2':
        now = time
        yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
        HH=now.strftime('%H')
        mm=now.strftime('%M')
        # AI_speak('현재 시간은 '+HH+'시'+mm+'분'+' 입니다')
        AI_speak('현재 시간은')
        AI_speak(HH+'시')
        AI_speak(mm+'분')
        AI_speak('입니다')
        
    elif usr_input == '3': #[웹 스크랩핑 및 유효텍스트 파싱(지역별 미세먼지, 초미세먼지, 기온, 오존, 습도)]
        AI_speak('네이버 미세먼지 정보 웹크롤링을 시도합니다.')
        dataWebLocation = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80"
        dataWebLocation = unquote(dataWebLocation)
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser") 
        copied_html_selector = '#main_pack > section.sc_new._atmospheric_environment > div > div.api_cs_wrap > div > div:nth-child(3) > div.main_box > div.detail_box'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            print("{} 번째 text: {}".format(index, element.text))
             
        lines = "네이버 미세먼지정보\n"+ element.text.replace("관측지점 현재 오전예보 오후예보","",1).replace("지역별 미세먼지 정보","") .strip().replace("서울","\n서울").replace("경기","\n경기").replace("인천","\n인천").replace("강원","\n강원").replace("세종","\n세종").replace("충북","\n충북").replace("충남","\n충남").replace("전남","\n전남").replace("전북","\n전북").replace("광주","\n광주").replace("제주","\n제주").replace("대전","\n대전").replace("경북","\n경북").replace("경남","\n경남").replace("대구","\n대구").replace("울산","\n울산").replace("부산","\n부산").replace("     "," ").replace("\n ","\n").replace("  "," ").replace("  "," ")
        cls()
        print(lines.replace("관측지점 현재 오전예보 오후예보","관측지점 현재 오전예보 오후예보\n"))
        AI_speak('웹 크롤링된 네이버 미세먼지 정보를 말씀드립니다')
        # AI_speak('웹 크롤링된 네이버 미세먼지 정보 접근을 시도합니다.')
        for line in range(0,len(lines.split('\n'))):
            AI_speak(lines.split('\n')[line])
        
    elif usr_input == 'x':
        jhppc1 = 'https://remotedesktop.google.com/access/session/b797cd99-b738-f4db-9b38-9a2e25a57a47'
        AI_run(jhppc1)
        
    elif usr_input == 'xx':
        remotedesktop = 'https://remotedesktop.google.com/access'
        AI_run(remotedesktop)
        
    elif usr_input == 'sd':
        AI_speak('시스템 종료를 시도합니다')
        os.system('')# shutdown -t[to do]
        
    elif usr_input == 'foo':
        AI_speak('해당 기능은 아직 준비되지 않았습니다')
        
    else:
        AI_speak('해당 기능은 아직 준비되지 않았습니다') 

def AI_speak(text):
    # address=r""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=u""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    address=os.getcwd()+'\\mp3\\'+ text +'.mp3'
    if os.path.exists(address):
        # print('파일이 있어 재생을 시도합니다')
        # os.system('"'+address+'"')#SUCCESS
        os.system('call "'+address+'"')#SUCCESS[경로공백포함 시 인식처리]
        
        
        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3,1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3*1.05) 
        
    else:
        # print('파일이 없어 생성을 시도합니다')
        mgr_gTTS = gTTS(text=text, lang='ko')
        mgr_gTTS.save('./mp3/'+ text +'.mp3')
        os.system('call "'+address+'"')#call을 사용해서 동기처리를 기대했으나 되지 않음.대안이 필요하다.
        
        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3,1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3*1.05)

 
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
        ##이 주석은 '첫한글자_유실예방코드' 입니다>첫한글자_유실현상발견>원인분석실패>비온전대응
        # chromeMgr.get(target_str)
        #__________________________________________________________________________________ 방법2
        os.system('start '+target_str)
    elif 'txt' in last_word:
        os.system('start ' +target_str)
        # os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3') #비동기처리방식
        # os.system('call "'+os.getcwd()+'/mp3/'+ text +'.mp3"')  #동기처리방식[실패]

def AI_print(target_list):
    for target in target_list:
        print(target)


#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>time initialization
cls()
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
#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>dictionary")
cls()
nbsp=' '
#"______________________________________________________  mkr1
cls()
AI_available_cmd_code_list=[
'1:미세먼지',
'2:시간',
'3:네이버 미세먼지',
'4:공간',
'5:fake AI 가용명령목록 조회',
'6:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'7:네이버 초미세먼지',
'x:jhppc1',
'xx:remotedesktop',
'sd:shutdown',
'taskkill:taskkill',
'foo:foo',
'last:remotedesktop'
]
AI_speak('fake AI 시스템이 활성화되었습니다')
AI_speak('컴퓨터와 대화할 준비가 되었습니다')
#"______________________________________________________  mkr2
cls()
AI_print(AI_available_cmd_code_list)
AI_speak('원하시는 명령코드를 입력해 주세요')
# AI_cmd_code='sd'
# AI_cmd_code='taskkill'
# AI_cmd_code='1'
# AI_cmd_code='2'
AI_cmd_code='3'
# AI_cmd_code='4'
usr_input=AI_cmd_code


#"______________________________________________________  mkr3[what was your childhood nickname? 테스트]
cls()
# cnt=0
# while(True):
    # usr_input = input("what was your childhood nickname? ")
    # if usr_input=='monkey':
        # print('')
        # print('!!!!!!this is correct answer!!!!!')
        # print('bye~!')
        # print('')
        # break
            
    # elif cnt%10==0 and cnt!=0:
        # print('this is correct answer')
        # print('')
        # print('hint! >>> This is a species of primate')
        # print('')
        # cnt+=1
            
    # else:
        # print('this is wrong answer, try again')
        # cnt+=1
            
#"______________________________________________________  mkr3
cls()
for i in range(0,len(AI_available_cmd_code_list)-1):
    if usr_input in AI_available_cmd_code_list[i].split(':')[0]:
        AI_speak(AI_available_cmd_code_list[i].split(':')[-1]+'에 대한 명령코드가 입력되었습니다')
        # time.sleep(5)
        time.sleep(4)
        break

#"______________________________________________________  mkr4
cls()
AI_answer()
#"______________________________________________________  mkr5
cls()
cnt = 0
while(True):
    if cnt==0:
        AI_speak('while routine에 접근을 시도합니다')
        cnt+=1
    
    now = time
    yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
    HH=now.strftime('%H')
    mm=now.strftime('%M')
    ss=now.strftime('%S')
    
    if ss=='30':
        # 분마다 말하기
        # if int(mm)%'05'==0:
            # AI_speak('현재 시간은')
            # AI_speak(HH+'시')
            # AI_speak(mm+'분')
            # AI_speak('입니다')
        # if int(mm)%'10'==0:
            # AI_speak('현재 시간은')
            # AI_speak(HH+'시')
            # AI_speak(mm+'분')
            # AI_speak('입니다')
        if int(mm)%15==0:
            AI_speak('현재 시간은')
            AI_speak(HH+'시')
            AI_speak(mm+'분')
            AI_speak('입니다')
        # if int(mm)%00==0:
            # AI_speak('현재 시간은 '+HH+'시'+mm+'분'+' 입니다')
        #아침 6시 부터는 5분마다 시간 말하기
        if HH=='06' and int(mm)%5==0:
            AI_speak('현재 시간은')
            AI_speak(HH+'시')
            AI_speak(mm+'분')
            AI_speak('입니다')
        if HH=='07' and int(mm)%5==0:
            AI_speak('현재 시간은')
            AI_speak(HH+'시')
            AI_speak(mm+'분')
            AI_speak('입니다')

        if HH=='08' and mm=='00':
            AI_speak('현재 시간은')
            AI_speak(HH+'시')
            AI_speak(mm+'분')
            AI_speak('입니다')
            AI_speak('더이상 나가는 것을 지체하기 어렵습니다')
        if HH=='06' and mm=='30':
            AI_speak('음악을 재생합니다')
        if HH=='08' and mm=='50':    
            AI_speak('업무시작 10분전입니다')
            AI_speak('업무준비를 시작하세요')
        if HH=='09' and mm=='00':    
            AI_speak('음악을 종료합니다')
            # taskkill('Music.UI.exe')
            # taskkill('alsong.exe')
            # time.sleep(10)
        if HH=='11' and mm=='30':
            AI_speak('점심시간입니다')
        if HH=='11' and mm=='30':
            AI_speak('음악을 재생합니다')
        if HH=='11' and mm=='50':
            AI_speak('12시 10분 전입니다')
            AI_speak('주무실 것을 추천드립니다')
		
    



# cls()
#[DONE]
#1. 스케줄작업 수행기능
#2. 미세먼지 웹스크래핑 기능
#[ING]
#[TO DO]
#파이썬 멀티쓰레드로 만들자 정확히는 더블스레드로 하나의 싱글스레드는 스케쥴작업을 계속 수행을하고 다른 하나의 싱글쓰레드는 사용자로부터 sd 입력받으면 shutdown 할 수 있도록 하자
    # AI_listen()
    # AI_answer()
    # usr_input = input("원하시는 명령코드를 입력해 주세요 >>> ")
#이걸 js + node.js  p5.speech.js   이렇게 합하면 될것 같은디.  일단 해보자.
        
#"______________________________________________________  test_Territory e

