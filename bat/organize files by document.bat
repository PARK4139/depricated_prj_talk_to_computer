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


::
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




::
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


::
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




::
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
  
 


::
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
  


::
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
  
 
