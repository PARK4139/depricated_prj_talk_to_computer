title %~n0
echo "______________________________________________________________________________________________________________________________ variable 
chcp 65001
@echo off
setlocal
for /f "delims=" %%i in ('Powershell.exe get-date -Format 'yyyy MM dd HH mm ss'') do set yyyyMMddHHmmss=%%i
cls
echo "______________________________________________________________________________________________________________________________ add
git add *  
echo "______________________________________________________________________________________________________________________________ commit
git commit -m "%yyyyMMddHHmmss%"
echo "______________________________________________________________________________________________________________________________ push
git push -u origin main  
echo "______________________________________________________________________________________________________________________________ status
:: git status | find "clean"
git status  
cd py
call py AI_TTS.py "깃허브에 프로젝트 커밋시도를 완료했습니다"
taskkill -im Alsong.exe


cd ..
call py git_add_push_commit_and_pause_and_delete_prj.py



tmp.txt 가 없다면
	tmp.txt 를 만들고
tmp.txt 가 있다면
	tmp.txt 를 비우고
tmp.txt 를 작성



tmp.txt 를 읽어온다
tmp.txt 에 작성된 내용대로 실행한다
