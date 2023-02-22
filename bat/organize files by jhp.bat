:: js
setlocal
set foo =.js
for %%i in (*.js) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .js
move "*.js" "%to_path%"
cd %from_path% 
rmdir .js  


 


:: css
setlocal
set foo =.css
for %%i in (*.css) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=css
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .css
move "*.css" "%to_path%"
cd %from_path% 
rmdir .css  
 




:: txt
setlocal
set foo =.txt
for %%i in (*.txt) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .txt
move "*.txt" "%to_path%"
cd %from_path% 
rmdir .txt  


::xls
setlocal
set foo =.xls 
for %%i in (*.xls) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .xls
move "*.xls" "%to_path%"
cd %from_path% 
rmdir .xls 




::cell
setlocal
set foo =.cell 
for %%i in (*.cell) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .cell
move "*.cell" "%to_path%"
cd %from_path% 
rmdir .cell


::xmind
setlocal
set foo =.xmind 
for %%i in (*.xmind) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .xmind
move "*.xmind" "%to_path%"
cd %from_path% 
rmdir .xmind




::docx
setlocal
set foo =.docx 
for %%i in (*.docx) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .docx
move "*.docx" "%to_path%"
cd %from_path% 
rmdir .docx
  
 


::pdf
setlocal
set foo =.pdf 
for %%i in (*.pdf) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .pdf
move "*.pdf" "%to_path%"
cd %from_path% 
rmdir .pdf
  


::xlsx
setlocal
set foo =.xlsx 
for %%i in (*.xlsx) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=document
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .xlsx
move "*.xlsx" "%to_path%"
cd %from_path% 
rmdir .xlsx
  
 
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
 
