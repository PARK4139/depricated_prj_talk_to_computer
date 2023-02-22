chcp 65001
setlocal
c: 
cd "C:\Users\JungHoonPark\Desktop\`"
echo.
echo.
echo.
echo.
echo __________________________________________________ cwd 를 확인하세요!  
echo.
echo.
echo.
echo.

pause
for %%i in (*) do (
 if not "%%~ni" == "?????" (
  md "%%~ni" && move "%%~i" "%%~ni"
 )
)

