@echo off    
setlocal enabledelayedexpansion     
set var=1000    
for /r "%~dp0" %%i in (*.*) do (     
  set /a var+=1      
  if not "%%~nxi"=="%~nx0" ren "%%i" !var:~-4!%%~xi     
)    
pause>nul   
echo �������,������˳�...   
exit