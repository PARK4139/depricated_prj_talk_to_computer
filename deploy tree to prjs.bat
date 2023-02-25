chcp 65001
setlocal
title %0
set deployed="C:\Users\WIN10PROPC3\Downloads\SERVER_ALPHA\[TO DO]\prj_talk_to_computer\py"
set overwrited1="C:\Users\WIN10PROPC3\Downloads\SERVER_ALPHA\[TO DO]\PRIVATE_RECORDS\py"
REM set overwrited2="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_chatGPT\py"
REM set overwrited3="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_AI_img_classifier\py"
REM cd "prj_talk_to_computer"
cd py
py overwrite_directory_of_prjs.py %deployed% %overwrited1%
REM py overwrite_directory_of_prjs.py %deployed% %overwrited2%
REM py overwrite_directory_of_prjs.py %deployed% %overwrited3%
REM py overwrite_directory_of_prjs.py %deployed% %overwrited4%
REM py overwrite_directory_of_prjs.py %deployed% %overwrited5%


이 파일을 파이썬으로 동작하드록 수정하자

해당 패스가 있으면
	deploy 
없으면
	pass

REM pause