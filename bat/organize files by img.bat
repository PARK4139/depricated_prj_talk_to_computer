:: png
setlocal
set foo =.png
for %%i in (*.png) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=imgs
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .png
move "*.png" "%to_path%"
cd %from_path% 
rmdir .png  


:: jpg
setlocal
set foo =.jpg
for %%i in (*.jpg) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=imgs
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .jpg
move "*.jpg" "%to_path%"
cd %from_path% 
rmdir .jpg  




:: jfif
setlocal
set foo =.jfif
for %%i in (*.jfif) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=imgs
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .jfif
move "*.jfif" "%to_path%"
cd %from_path% 
rmdir .jfif  



:: gif
setlocal
set foo =.gif
for %%i in (*.gif) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=imgs
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .gif
move "*.gif" "%to_path%"
cd %from_path% 
rmdir .gif  



:: jpeg
setlocal
set foo =.jpeg
for %%i in (*.jpeg) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=imgs
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .jpeg
move "*.jpeg" "%to_path%"
cd %from_path% 
rmdir .jpeg  





