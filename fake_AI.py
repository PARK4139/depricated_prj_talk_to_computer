print("______________________________________________________  mkr [module importing] ")
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
import psutil  # 실행중인 프로세스 및 시스템 활용 라이브러리
import json

print("______________________________________________________  mkr [constant defination] ")
AI_available_cmd_code_list = [
    # '0:fake AI 가용명령목록 조회',
    # '`:single mode',
    # '``:batch mode',
    '`:advanced batch mode',
    'jhppc1:jhppc1',
    'remotedesktop:remote desktop',
    'x:exit',
    'sd_s:shutdown',
    'sd_e:shutdown cancelation',
    # 'voice mode:voice mode',
    # 'voiceless mode:voiceless mode',
    '시간:시간',
    '미세먼지랭킹:',
    '네이버 종합날씨:',
    '네이버 미세먼지:',
    '네이버 초미세먼지:',
    '공간:공간',
    '기온:기온[ing]',
    '종합날씨정보:_________[TO DO]',
    '_________:_________[TO DO]',
    '172.30.1.33:_________[TO DO]',
    'taskkill:task kill[TO DO]',
    '가용명령개수:가용명령개수[TO DO]',
    '식물조언:식물조언[TO DO]',
    'foo:foo[TO DO]',
]
high_frequency_batch_cmd_routine_pattern_list = [
    # '',
    'ex) 111111:[미세먼지정보]',
    # '',
    ''
]
nbsp = ' '
print("______________________________________________________  mkr [function defination] ")


def cls():
    os.system('cls')

def chdir(path):
    os.chdir(path)
    print(os.getcwd())

def cwd():
    print(os.getcwd())


def dir():
    for i in os.listdir():
        # print(i, end = " ")
        print(i)


def CRLF():
    print('')


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
            print(process_im_name, ' - ', processID)

        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):  # 예외처리
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
                # print(target_str+' 와 자식 프로세스 죽이기를 시도했습니다')

        except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):  # 예외처리
            pass


def startRecordCommand(file_address):
    # sys.stdout = open('py cmd recording.txt', 'a', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'w', encoding='utf-8')  #
    # sys.stdout = open('py cmd recording.txt', 'r', encoding='utf-8')  # 
    sys.stdout = open(file_address, 'w', encoding='utf-8')  #


def endRecordCommand():
    sys.stdout.close()


def ipconfig():
    os.system('ipconfig')


def saveFileAs(fileAddress):
    startRecordCommand(fileAddress)
    print("이것은 param 두개가 더 필요해 보입니다.")
    endRecordCommand()


def readFile(fileAddress):
    with open(fileAddress, 'r', encoding='utf-8') as f:
        readed_text = f.read()
    return readed_text


def listen(recognizer, audio):
    pass


# def AI_respon(input_text):
# if input_text=='몇 시야':
# now = time
# yyyyMMddHHmmss=now.strftime('%Y %m %d %H %M %S')
# pass

def AI_Crawlweb(dataWebLocation, copied_html_selector):
    dataWebLocation = unquote(dataWebLocation)  # url decoding
    page = requests.get(dataWebLocation)
    soup = bs(page.text, "html.parser")

    # AI_print(page.text.split('\n'))#전체페이지를 본다

    elements = soup.select(copied_html_selector)
    for index, element in enumerate(elements, 1):
        # print("{} 번째 text: {}".format(index, element.text))
        continue
    return str(element.text)


print("______________________________________________________  mkr [AI_respon defination] ")


def AI_respon(usr_input):
    if usr_input == 'x':
        AI_speak('fake AI 를 종료합니다')
        exit()

    elif usr_input == '미세먼지랭킹':
        # AI_speak('미세먼지랭킹 날씨 정보를 디스플레이 시도합니다')
        # AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')
        # AI_speak('시도완료했습니다')
        # AI_speak('미세먼지랭킹 날씨 정보에 접근을 시도합니다')
        # AI_speak('미세먼지랭킹 정보 접근 시도')
        # AI_speak('미세먼지랭킹 정보')
        AI_run('https://www.dustrank.com/air/air_dong_detail.php?addcode=41173103')

    elif usr_input == '네이버 종합날씨':
        AI_run('https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8')

    elif usr_input == '시간':
        pass

    elif usr_input == '네이버 초미세먼지':
        # AI_speak('네이버 초미세먼지 정보 웹크롤링을 시도합니다.')
        dataWebLocation = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EC%B4%88%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80"
        copied_html_selector = '#main_pack > section.sc_new._atmospheric_environment > div > div.api_cs_wrap > div > div:nth-child(3) > div.main_box > div.detail_box'

        lines = "네이버 초미세먼지 정보\n" + AI_Crawlweb(dataWebLocation, copied_html_selector).replace("관측지점 현재 오전예보 오후예보", "",
                                                                                              1).replace("지역별 미세먼지 정보",
                                                                                                         "").strip().replace(
            "서울", "\n서울").replace("경기", "\n경기").replace("인천", "\n인천").replace("강원", "\n강원").replace("세종",
                                                                                                    "\n세종").replace(
            "충북", "\n충북").replace("충남", "\n충남").replace("전남", "\n전남").replace("전북", "\n전북").replace("광주",
                                                                                                    "\n광주").replace(
            "제주", "\n제주").replace("대전", "\n대전").replace("경북", "\n경북").replace("경남", "\n경남").replace("대구",
                                                                                                    "\n대구").replace(
            "울산", "\n울산").replace("부산", "\n부산").replace("     ", " ").replace("\n ", "\n").replace("  ", " ").replace(
            "  ", " ")
        # AI_speak('웹크롤링이 완료되었습니다')
        # AI_speak('서울과 경기도에 대한 미세먼지 정보를 말씀드립니다')
        AI_speak('서울 경기도 미세먼지 정보')

        # for line in range(0,len(lines.split('\n'))):
        # AI_speak(lines.split('\n')[line])

        # for line in range(0,len(lines.split(' '))):
        # AI_speak(lines.split(' ')[line].strip())

        for line in range(0, len(lines.split('\n'))):
            if '서울' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

            if '경기' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])



    elif usr_input == '공간':

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 지역 정보'
        dataWebLocation = 'https://weather.naver.com/'
        copied_html_selector = '#now > div > div.location_info_area > div.location_area > strong'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s
        # INFO_NAME='구글 지역 정보'
        # dataWebLocation = "https://www.google.com/search?q=%EA%B8%B0%EC%98%A8&oq=%EA%B8%B0%EC%98%A8&aqs=chrome..69i57j35i39j46i131i199i433i465i512j0i131i433i512l3j46i199i465i512j69i61.1706j1j7&sourceid=chrome&ie=UTF-8"
        # copied_html_selector = '#oFNiHe > div > div > div > div.eKPi4 > span.BBwThe'
        # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e

        # AI_speak(INFO_NAME+nbsp+'웹크롤링을 시도합니다')
        # AI_speak('웹크롤링이 완료되었습니다')
        # AI_speak('현재위치에 대한 정보를 말씀드립니다')
        lines = AI_Crawlweb(dataWebLocation, copied_html_selector)
        # AI_print(lines)
        # print(lines)
        # AI_speak(INFO_NAME +'크롤링 결과를 말씀드립니다')
        AI_speak(INFO_NAME + '는')
        AI_speak(lines.strip())
        AI_speak('인 것으로 추측됩니다')


    elif usr_input == '기온':  # [웹 스크랩핑 및 유효텍스트 파싱]

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 체감온도 정보'
        dataWebLocation = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8'
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s # 구글 지역 정보 option s
        # INFO_NAME='구글 체감온도 정보'
        # dataWebLocation = ''
        # copied_html_selector = ''
        # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e # 구글 지역 정보 option e

        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")

        # AI_print(page.text.split('\n'))#전체페이지를 본다

        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)

        AI_speak(INFO_NAME + '는')
        AI_speak(element_str.strip())
        AI_speak('인 것으로 추측됩니다')

    elif usr_input == '종합날씨정보':

        # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s # 네이버 지역 정보 option s
        INFO_NAME = '네이버 종합날씨정보 정보'
        dataWebLocation = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query=%EA%B8%B0%EC%98%A8'
        # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e # 네이버 지역 정보 option e

        dataWebLocation = unquote(dataWebLocation)  # url decoding
        page = requests.get(dataWebLocation)
        soup = bs(page.text, "html.parser")

        # print("______________________________________________________  mkr [전체페이지 출력 시도] ")
        # AI_print(page.text.split('\n'))

        print("______________________________________________________  mkr [기온] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('기온')
        AI_speak(element_str.strip().replace('°', ''))
        AI_speak('도')
        print("______________________________________________________  mkr [현재온도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.weather_graphic > div.temperature_text > strong'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip().replace('현재 온도', '')
        print(element_str)
        AI_speak('현재온도')
        AI_speak(element_str.replace('°', ''))
        AI_speak('도')
        print("______________________________________________________  mkr [체감온도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(2)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('체감온도')
        AI_speak(element_str.replace('°', ''))
        AI_speak('도')
        print("______________________________________________________  mkr [습도] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(4)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text.strip()
        print(element_str)
        AI_speak('습도')
        AI_speak(element_str.replace('%', ''))
        AI_speak('퍼센트')
        print("______________________________________________________  mkr [바람] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div._today > div.temperature_info > dl > dd:nth-child(6)'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('바람')
        AI_speak(element_str.strip().replace('m/s', ''))
        AI_speak('미터퍼세크')
        print("______________________________________________________  mkr [미세먼지] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div.report_card_wrap > ul > li.item_today.level1 > a > span'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('미세먼지')
        AI_speak(element_str.strip())
        print("______________________________________________________  mkr [초미세먼지] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div.report_card_wrap > ul > li.item_today.level3 > a > span'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('초미세먼지')
        AI_speak(element_str.strip())
        print("______________________________________________________  mkr [자외선] ")
        copied_html_selector = '#main_pack > section.sc_new.cs_weather_new._cs_weather > div._tab_flicking > div.content_wrap > div.open > div:nth-child(1) > div > div.weather_info > div > div.report_card_wrap > ul > li.item_today.level2 > a > span'
        elements = soup.select(copied_html_selector)
        for index, element in enumerate(elements, 1):
            # print("{} 번째 text: {}".format(index, element.text))
            continue
        element_str = element.text
        print(element_str)
        AI_speak('자외선')
        AI_speak(element_str.strip())
        # print("______________________________________________________  mkr [_________] ")
        # copied_html_selector = '_________'
        # elements = soup.select(copied_html_selector)
        # AI_print(elements)#추출된 elements 출력 시도
        # print("______________________________________________________  mkr [_________] ")
        # copied_html_selector = '_________'
        # elements = soup.select(copied_html_selector)
        # AI_print(elements)#추출된 elements 출력 시도

        for i in range(0, len(page.text.split('\n'))):
            if 'hourlyFcastListJson' in page.text.split('\n')[i]:
                # print("______________________________________________________  mkr [hourlyFcastListJson 들어있는 줄들 출력시도] ")
                str_containing_hourlyFcastListJson = page.text.split('\n')[i].strip()
                # print(type(str_containing_hourlyFcastListJson))
                # print(str_containing_hourlyFcastListJson)
                print("______________________________________________________  mkr [json_str] ")
                json_str = str_containing_hourlyFcastListJson.split('=')[-1].split(';')[0].strip()
                # print(type(json_str))
                # print(json_str)
                # print(json.dumps(json_str, indent=4, sort_keys=True))
                print("______________________________________________________  mkr [json_obj] ")
                json_obj = json.loads(json_str)
                # print(type(json_str))
                # print(json_obj)
                # print(json.dumps(json_obj, indent=4, sort_keys=True))

        print("______________________________________________________  mkr [json_obj[i]['windSpd']][json obj 내부의 ] ")
        # for i in range(0,len(json_obj)):
        # print(str(i),':', str(json_obj[i]['windSpd']))
        # pass

        print("______________________________________________________  mkr [tmp.json 에 저장] ")
        file_path = "./json/tmp.json"

        json_dict = {}
        json_dict['head'] = []
        json_dict['head'].append({
            "title": "Android Q, Scoped Storage",
            "url": "https://codechacha.com/ko/android-q-scoped-storage/",
            "draft": "false"
        })
        json_dict['body'] = []
        json_dict['body'].append({
            "that i want to save": str(json_obj[40]['windSpd']),
            "that i want to save2": "foo"
            # "that i want to save": str(json.dump(json_obj[40]['windSpd']))
        })
        json_dict['tail'] = []
        json_dict['tail'].append({
            "title": "Android Q, Scoped Storage",
            "url": "https://codechacha.com/ko/android-q-scoped-storage/",
            "draft": "false"
        })
        json_dict['tail'].append({
            "that i want to save str": "i",
            "that i want to save str2": "love",
            "that i want to save str2": "love"
        })
        print(json_dict)
        print(type(json_dict))

        with open(file_path, 'w') as outfile:
            json.dump(json_dict, outfile, indent=4)

        AI_speak(INFO_NAME + '는')
        AI_speak('________')
        AI_speak('인 것으로 추측됩니다')


    elif usr_input == '네이버 미세먼지':
        AI_speak('네이버 미세먼지 정보 웹크롤링을 시도합니다.')
        dataWebLocation = "https://search.naver.com/search.naver?where=nexearch&sm=tab_etc&qvt=0&query=%EC%A0%84%EA%B5%AD%EB%AF%B8%EC%84%B8%EB%A8%BC%EC%A7%80"
        copied_html_selector = '#main_pack > section.sc_new._atmospheric_environment > div > div.api_cs_wrap > div > div:nth-child(3) > div.main_box > div.detail_box'

        lines = "네이버 미세먼지정보\n" + AI_Crawlweb(dataWebLocation, copied_html_selector).replace("관측지점 현재 오전예보 오후예보", "",
                                                                                            1).replace("지역별 미세먼지 정보",
                                                                                                       "").strip().replace(
            "서울", "\n서울").replace("경기", "\n경기").replace("인천", "\n인천").replace("강원", "\n강원").replace("세종",
                                                                                                    "\n세종").replace(
            "충북", "\n충북").replace("충남", "\n충남").replace("전남", "\n전남").replace("전북", "\n전북").replace("광주",
                                                                                                    "\n광주").replace(
            "제주", "\n제주").replace("대전", "\n대전").replace("경북", "\n경북").replace("경남", "\n경남").replace("대구",
                                                                                                    "\n대구").replace(
            "울산", "\n울산").replace("부산", "\n부산").replace("     ", " ").replace("\n ", "\n").replace("  ", " ").replace(
            "  ", " ")
        # print(lines.replace("관측지점 현재 오전예보 오후예보","관측지점 현재 오전예보 오후예보\n"))
        # AI_speak('웹 크롤링된 네이버 미세먼지 정보 접근을 시도합니다.')
        # AI_speak('네이버 미세먼지 정보입니다')
        # AI_speak('다음은 네이버 미세먼지 정보입니다')
        # AI_speak('관측지점 현재 오전예보 오후예보')
        # AI_speak('웹 크롤링된 네이버 미세먼지 정보를 말씀드립니다')
        AI_speak('웹크롤링이 완료되었습니다')
        AI_speak('서울과 경기도에 대한 정보를 말씀드립니다')

        # for line in range(0,len(lines.split('\n'))):
        # AI_speak(lines.split('\n')[line])

        # for line in range(0,len(lines.split(' '))):
        # AI_speak(lines.split(' ')[line].strip())

        for line in range(0, len(lines.split('\n'))):
            if '서울' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

            if '경기' in lines.split('\n')[line]:
                tmp = lines.split('\n')[line].split(' ')
                for i in range(0, len(tmp) - 3):
                    AI_speak(tmp[i])

    elif usr_input == '5':
        AI_print(AI_available_cmd_code_list)
        AI_speak("조회되었습니다")

    # elif usr_input == 'voiceless mode':
    # def AI_speak(text):
    # print(text)

    # elif usr_input == 'voice mode':
    # def AI_speak(text):
    # address=os.getcwd()+'\\mp3\\'+ text +'.mp3'

    # if os.path.exists(address):
    # os.system('call "'+address+'"')
    # length_of_mp3 = get_length_of_mp3(address)
    # length_of_mp3 = float(length_of_mp3)
    # length_of_mp3 = round(length_of_mp3,1)
    # time.sleep(length_of_mp3*1.05)

    # else:
    # mgr_gTTS = gTTS(text=text, lang='ko')
    # mgr_gTTS.save('./mp3/'+ text +'.mp3')
    # os.system('call "'+address+'"')

    # length_of_mp3 = get_length_of_mp3(address)
    # length_of_mp3 = float(length_of_mp3)
    # length_of_mp3 = round(length_of_mp3,1)
    # time.sleep(length_of_mp3*1.05)

    # taskkill('ALSong.exe')

    # elif usr_input == '`':
    #     AI_speak('single mode 가 시작되었습니다')
    #     # print('single mode s single mode s single mode s single mode s single mode s single mode s single mode s single mode s single mode s ')
    #     while(True):
    #         batch_mode_input=input('>>>')
    #         if batch_mode_input =='x':
    #             AI_speak('single mode를 종료합니다')
    #             break
    #         elif len(batch_mode_input)==1:
    #             usr_input=AI_available_cmd_code_list[int(batch_mode_input)-1].split(':')[0]
    #             AI_respon(usr_input)
    #         elif batch_mode_input =='':
    #             AI_speak('아무것도 입력되지 않았습니다')
    #         elif batch_mode_input =='`':
    #             AI_speak('백팁은 single mode에서 입력하실 수 없습니다.')
    #         else:
    #             AI_speak('single mode 에서는 1자리만 입력하실 수 있습니다.')
    #     # print('eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e eingle mode e ')
    #

    # elif usr_input == '``':
    #     AI_speak('batch mode 가 시작되었습니다')
    #     # print('batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s batch mode s ')
    #     while(True):
    #         batch_mode_input=input('>>>')
    #         if batch_mode_input=='x' or batch_mode_input=='X' :
    #             AI_speak('batch mode를 종료합니다')
    #             break
    #         # batch_mode_input=list(batch_mode_input)                         # batch_mode_input = [3,2,1]
    #         # AI_speak('입력된 배치명령의 개수는' + str(len(batch_mode_input)+1) +'개 입니다')
    #         if batch_mode_input == '':
    #             AI_speak('아무것도 입력되지 않았습니다')
    #             AI_speak('명령코드를 입력해주세요')
    #         else:
    #             AI_speak('입력된 배치명령의 개수는' + str(len(batch_mode_input)) +'개 입니다')
    #             for i in range(0,len(batch_mode_input)):                      # i=0
    #                 usr_input=AI_available_cmd_code_list[int(batch_mode_input[i])-1].split(':')[0] #usr_input=AI_available_cmd_code_list[2].split(':')[0]
    #                 AI_speak(str(i+1)+'번째 코드를 실행시도합니다')
    #                 AI_respon(usr_input)
    #
    #     # print('batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e batch mode e ')

    elif usr_input == '`':
        # AI_speak('advanced batch mode 가 시작되었습니다')
        # print('advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s advanced batch mode s')
        while (True):
            batch_mode_input = input("                                                                                                ")
            if batch_mode_input == 'x' or batch_mode_input == 'X':
                AI_speak('advanced batch mode를 종료합니다')
                break
            elif batch_mode_input == '':
                AI_speak('아무것도 입력되지 않았습니다')
                AI_speak('명령코드를 입력해주세요')
            else:
                list = batch_mode_input.split(' ')
                # AI_speak('입력된 코드 목록 입니다')
                # for str in list:
                #     AI_speak(str)
                # for i in range(0,len(list)-2):
                for list_element in list:
                    # AI_speak(str((i+1))+'번째 코드를 실행시도합니다')
                    # print(list[i])
                    # AI_respon(str(list[i]))
                    # if len(AI_available_cmd_code_list)<AI_available_cmd_code_list[int(list[i])-1].split(':')[0]:
                    # AI_respon(AI_available_cmd_code_list[int(list[i])-1].split(':')[0])
                    # print(list_element)
                    # for i in range(0, len(AI_available_cmd_code_list) - 1):
                    #     if usr_input in AI_available_cmd_code_list[i].split(':')[0]:
                    #         # if usr_input!='' or usr_input!='`':
                    #         if usr_input != '':
                    #             # AI_speak(AI_available_cmd_code_list[i].split(':')[0]+'에 대한 명령코드가 입력되었습니다')
                    #             pass
                    #
                    # AI_respon(usr_input)
                    # try:
                    # print(len(AI_available_cmd_code_list[int(list_element) - 1]))
                    # print(AI_available_cmd_code_list[int(list_element) - 1])
                    # AI_speak(AI_available_cmd_code_list[int(list_element) - 1].split(':')[0])
                    try:
                        AI_respon(AI_available_cmd_code_list[int(list_element) - 1].split(':')[0])
                    except Exception as e:  # 모든 예외의 에러 메시지를 출력할 때는 Exception을 사용
                        print('예외가 발생했습니다')
                        print(e)
                        AI_speak('예외가 발생했습니다')
                        # AI_speak('가용코드 목록에 없는 코드입니다')

        # print('advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e advanced batch mode e')


    elif usr_input == '가용명령개수':
        AI_speak('가용명령의 개수는' + str(len(AI_available_cmd_code_list)) + '개 이고')

    elif usr_input == '식물조언':
        AI_speak('식물에게 물샤워를 줄시간입니다')
        AI_speak('물샤워를 시켜주세요')
        AI_speak('오늘은 식물에게 햇빛샤워를 시켜주는날입니다')
        AI_speak('하늘이가 없을때 샤워를 시켜주세요')
        AI_speak('하트축전에게 빠르게 식물등빛을 주세요')
        AI_speak('이러다 죽습니다 서둘러 등빛을 주세요')
        # AI_speak('이러다 죽습니다')
        # AI_speak('서둘러 등빛을 주세요')

    elif usr_input == '':
        AI_speak('아무것도 입력되지 않았습니다')
        AI_speak('명령코드를 입력해주세요')
        AI_speak('_______')


    elif usr_input == 'jhppc1':
        jhppc1 = 'https://remotedesktop.google.com/access/session/b797cd99-b738-f4db-9b38-9a2e25a57a47'
        AI_run(jhppc1)

    elif usr_input == 'remotedesktop':
        remotedesktop = 'https://remotedesktop.google.com/access'
        AI_run(remotedesktop)

    elif usr_input == 'sd_s':
        AI_speak('1시간 뒤')
        AI_speak('시스템 종료를 시도합니다')
        os.system('shutdown /s /t 3600')  # 1시간 뒤
        # os.system('shutdown /s /t 600') #10분 뒤


    elif usr_input == 'sd_e':
        os.system('shutdown -a')

    elif usr_input == 'foo':
        AI_speak('해당 기능은 아직 준비되지 않았습니다')

    else:
        # AI_speak('입력하신 내용이 usr_input 는 oooo 과 유사합니다') #[to do]
        AI_speak('해당 기능은 아직 준비되지 않았습니다')


def AI_speak(text):
    # address=r""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=u""+os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    # address=os.getcwd()+'\\mp3\\음성인식 준비되었습니다.mp3'
    address = os.getcwd() + '\\mp3\\' + text + '.mp3'

    if os.path.exists(address):
        # print('파일이 있어 재생을 시도합니다')
        # os.system('"'+address+'"')#SUCCESS
        os.system('call "' + address + '"')  # SUCCESS[경로공백포함 시 인식처리]

        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3, 1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3 * 1.05)


    else:
        # print('파일이 없어 생성을 시도합니다')
        mgr_gTTS = gTTS(text=text, lang='ko')
        mgr_gTTS.save('./mp3/' + text + '.mp3')
        os.system('call "' + address + '"')  # call을 사용해서 동기처리를 기대했으나 되지 않음.대안이 필요하다.

        # mp3 파일의 재생 길이를 알아내서 그 시간만큼 sleep 시키는 코드를 추가[to do]
        length_of_mp3 = get_length_of_mp3(address)
        # print(length_of_mp3)
        length_of_mp3 = float(length_of_mp3)
        # print(length_of_mp3)
        length_of_mp3 = round(length_of_mp3, 1)
        # print(length_of_mp3)
        # time.sleep(length_of_mp3*0.95)
        # time.sleep(length_of_mp3*1.00)
        time.sleep(length_of_mp3 * 1.05)

    taskkill('ALSong.exe')


def AI_listen():
    r = sr.Recognizer()
    m = sr.Microphone()
    # audio = sr.Microphone() 
    # with sr.Microphone() as source:

    with m as source:
        # AI_speak('듣고 있습니다')
        print('듣고 있습니다')
        audio = r.listen(source)

    try:
        text = r.recognize_google(audio, language='ko-KR')  # 잘 못 알아먹는다.. 그러나 된다.
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
        if '%' in target_str:
            target_str = 'explorer "' + unquote(target_str).strip()+'"'  # url decoding
            print("mkr749 : "+target_str)
            os.system(target_str)
        else:
            os.system('start ' + target_str)
            # os.system('explorer ' + target_str)
        # __________________________________________________________________________________ 방법1 s
        # chromeMgr = webdriver.Chrome()
        ##이 주석은 '첫한글자_유실예방코드' 입니다>첫한글자_유실현상발견>원인분석실패>비온전대응
        # chromeMgr.get(target_str)
        # __________________________________________________________________________________ 방법1 e

    elif 'txt' in last_word:
        os.system('start ' + target_str)
        # os.startfile(os.getcwd()+'/mp3/'+ text +'.mp3') #비동기처리방식
        # os.system('call "'+os.getcwd()+'/mp3/'+ text +'.mp3"')  #동기처리방식[실패]


def AI_print(target_list):
    cnt = 1
    for target in target_list:
        # print('+str(cnt)+nbsp+':'+nbsp+target)
        # print('         '+str(cnt)+nbsp+':'+nbsp+target)
        print('                                             ' + str(cnt) + nbsp + ':' + nbsp + target)
        # CRLF()
        cnt += 1


print("______________________________________________________  mkr [time initialization] ")
localtime = time.localtime()
yyyy = time.localtime().tm_year
MM = time.localtime().tm_mon
dd = time.localtime().tm_mday
HH = time.localtime().tm_hour
mm = time.localtime().tm_min
ss = time.localtime().tm_sec
timestamp = time.time()
weekday = time.localtime().tm_wday
elapsedDaysFromJan01 = time.localtime().tm_yday
yyyyMMddHHmmss = time.strftime('%Y %m %d %H %M %S')
customTime1 = time.strftime('%Y-%m-%d %H:%M:%S')
customTime2 = time.strftime('%Y-%m-%d %H:%M')
print("______________________________________________________  mkr [디버깅용 코드] ")
# os.system("pause")#
print("______________________________________________________  mkr [main territory] ")
cnt = 0
started_time = 0
while (True):
    if cnt == 0:
        # AI_speak('while routine에 접근을 시도합니다')
        started_time = time.strftime('%Y %m %d %H %M %S')
        # AI_speak('컴퓨터와 대화할 준비가 되었습니다')
        # taskkill('ALSong.exe')
        cnt += 1
        cls()
    recorded_time = time
    yyyyMMddHHmmss = recorded_time.strftime('%Y %m %d %H %M %S')
    HH = recorded_time.strftime('%H')
    mm = recorded_time.strftime('%M')
    ss = recorded_time.strftime('%S')
    cls()
    CRLF()
    CRLF()
    CRLF()
    CRLF()
    CRLF()
    # print(' '+'가용명령코드목록')
    print('                                     ' + '가용명령코드목록')
    CRLF()
    AI_print(AI_available_cmd_code_list)
    CRLF()
    # print(' '+'일괄명령패턴목록')
    print('                                     ' + '일괄명령패턴목록')
    CRLF()
    AI_print(high_frequency_batch_cmd_routine_pattern_list)
    # AI_cmd_code='taskkill'
    # AI_cmd_code='1'
    # AI_cmd_code='2'
    # AI_cmd_code='3'
    # AI_cmd_code='4'
    # usr_input=AI_cmd_code
    # AI_speak('원하시는 명령코드를 입력해 주세요')  # 이걸 멀티 쓰레드로 만들어서  하나의 쓰레드로 5초 카운트 후 AI_speak('원하시는 명령코드를 입력해 주세요')를 수행후 쓰레드 종료 AI_speak('fake AI의 가용명령목록 조회를 원하시면 백팁을 눌러주세요')
    # usr_input = input("원하시는 명령코드를 입력해 주세요 >>>")
    CRLF()
    usr_input = input("                                                                                                ").strip()
    CRLF()

    for i in range(0, len(AI_available_cmd_code_list) - 1):
        if usr_input in AI_available_cmd_code_list[i].split(':')[0]:
            # if usr_input!='' or usr_input!='`':
            if usr_input != '':
                # AI_speak(AI_available_cmd_code_list[i].split(':')[0]+'에 대한 명령코드가 입력되었습니다')
                pass

    AI_respon(usr_input)

    if ss == '30':
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
        if 9 <= int(HH) and int(HH) <= 23 and int(mm) % 15 == 0:
            AI_speak('현재 시간은')
            AI_speak(HH + '시')
            AI_speak(mm + '분')
            AI_speak('입니다')
        # if int(mm)%00==0:
        # AI_speak('현재 시간은 '+HH+'시'+mm+'분'+' 입니다')
        # 아침 6시 부터는 5분마다 시간 말하기
        if HH == '06' and int(mm) % 5 == 0:
            AI_speak('현재 시간은')
            AI_speak(HH + '시')
            AI_speak(mm + '분')
            AI_speak('입니다')
        if HH == '07' and int(mm) % 5 == 0:
            AI_speak('현재 시간은')
            AI_speak(HH + '시')
            AI_speak(mm + '분')
            AI_speak('입니다')

        if HH == '08' and mm == '00':
            AI_speak('현재 시간은')
            AI_speak(HH + '시')
            AI_speak(mm + '분')
            AI_speak('입니다')
            AI_speak('더이상 나가는 것을 지체하기 어렵습니다')
        if HH == '06' and mm == '30':
            AI_speak('음악을 재생합니다')
        if HH == '08' and mm == '50':
            AI_speak('업무시작 10분전입니다')
            AI_speak('업무준비를 시작하세요')
        if HH == '09' and mm == '00':
            AI_speak('음악을 종료합니다')
            # taskkill('Music.UI.exe')
            # taskkill('ALSong.exe')
            # time.sleep(10)
        if HH == '11' and mm == '30':
            AI_speak('점심시간입니다')
        if HH == '11' and mm == '30':
            AI_speak('음악을 재생합니다')
        if HH == '11' and mm == '50':
            AI_speak('12시 10분 전입니다')
            AI_speak('주무실 것을 추천드립니다')

time.sleep(60 * 3)
taskkill('ALSong.exe')

# [DONE]
# 1. 스케줄작업 수행기능
# 2. 미세먼지 웹스크래핑 기능
# 3. 1시간뒤 시스템 종료 예약 기능
# [ING]
# [TO DO]
# 파이썬 멀티쓰레드로 만들자 정확히는 더블스레드로 하나의 싱글스레드는 스케쥴작업을 계속 수행을하고 다른 하나의 싱글쓰레드는 사용자로부터 request받아 response 하도록 하자
# AI_listen()
# AI_respon(usr_input)
# usr_input = input("원하시는 명령코드를 입력해 주세요 >>> ")
# 이걸 js + node.js  p5.speech.js   이렇게 합하면 될것 같은디.  일단 해보자.

# "______________________________________________________  test_Territory e
