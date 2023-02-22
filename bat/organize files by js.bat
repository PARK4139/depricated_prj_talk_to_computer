:: js
setlocal
set foo =.png
for %%i in (*.png) do if not "%~nx0"=="%%~nxi" (
if not exist "%%~xi\" md "%%~xi"
move "%%i" "%%~xi"
) 
set as=js
mkdir %as%
set from_path=%cd%
set to_path=%cd%\%as%
cd .png
move "*.png" "%to_path%"
cd %from_path% 
rmdir .png  
 
