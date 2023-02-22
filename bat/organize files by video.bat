:: mkv
setlocal
set foo =.mkv
for %%i in (*.mkv) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=video
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .mkv
move "*.mkv" "%to_path%"
cd %from_path% 
rmdir .mkv  
 


:: mp4
setlocal
set foo =.mp4
for %%i in (*.mp4) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=video
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .mp4
move "*.mp4" "%to_path%"
cd %from_path% 
rmdir .mp4  
 



:: avi
setlocal
set foo =.avi
for %%i in (*.avi) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=video
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .avi
move "*.avi" "%to_path%"
cd %from_path% 
rmdir .avi  
 
