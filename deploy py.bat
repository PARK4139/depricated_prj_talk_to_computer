chcp 65001
setlocal
title %0
set deployed="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_talk_to_computer\py"
set overwrited1="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_server_communication\py"
set overwrited2="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_mgr\py"
set overwrited3="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_deploy_target_to_projs\py"
set overwrited4="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_chatGPT\py"
set overwrited5="C:\Users\WIN10PROPC3\Desktop\SERVER_ALPHA\[TO DO]\prj_AI_img_classifier\py"
cd py
py overwrite_directory_of_prjs.py %deployed% %overwrited1%
py overwrite_directory_of_prjs.py %deployed% %overwrited2%
py overwrite_directory_of_prjs.py %deployed% %overwrited3%
py overwrite_directory_of_prjs.py %deployed% %overwrited4%
py overwrite_directory_of_prjs.py %deployed% %overwrited5%






pause