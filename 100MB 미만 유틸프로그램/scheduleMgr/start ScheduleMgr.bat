REM echo ______________________________________________________________________________________ ScheduleMgr
@echo off
chcp 65001 > null
setlocal
set path=%path%
set filedrive=%%~dpath
set filepath=%%~ppath
set filename=%%~npath
set fileextension=%%~xpath
set n=%%~npath
set leaf1=E:\500GB\do\utils\scheduleMgr
set x=bat 
set m1=수행시도요청. 
set m2=수행시도완료.
set via="C:\Program Files\DAUM\PotPlayer\PotPlayerMini64.exe"
set this1="E:\500GB\ing_huge\refresh\sound\들으면 극락 갈 고래 울음소리 8시간   Whale Sounds 8 Hours.mp4"
set this2="E:\500GB\ing_huge\refresh\sound\🔥 천둥 같은 목소리의 미친 라이브...!  Sam Ryder - Tiny Riot [가사 해석 번역].mp4"
set this3="C:\Users\JungHoonPark\Desktop\sound\시간 신나고 경쾌한 시원청량 뉴에이지 음악 힐링 음악 모음│duggy music 모음 001091.mp4"
REM set thisPlaylist1=


title %n%%x%
cd %leaf1%
start /max java -jar ScheduleMgr.jar
del null
REM pause > null  
REM echo ______________________________________________________________________________________ ScheduleMgr
REM exit 


