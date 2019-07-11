@echo off&setlocal enabledelayedexpansion
color f0&mode con cols=57 lines=16 
title  …数独…By 缘鸟_yangfengoo 
rem 看VBT3群讨论这个问题好久自己闲的无聊也来练练手
rem NOW,LET'S GO!2010,10,9 22:59
::使用说明
ECHO,
echo, 1,本游戏支持鼠标需要第三发工具Cmos.exe,已打包
echo, 2,原始数据偷懒采用Bathome水王523066680的代码生成
echo, 3,本游戏会自动帮你分析某格内可能填写数字
echo, 4,所以请输入提示中的数字,否则会屏蔽你的错误输入
echo, 5,无聊练手之作,耗时一天仓促完成,欢迎大家测试并指正错误
echo, 6,好了,LET'S GO! 
echo,                      BY 缘鸟_yangfengoo
SET/P=
mode con cols=45 lines=24 
:starts
set bj=0&call :test
::布置数独数据
for /l %%i in (1,1,81) do (
    set /a s=!random!%%100
 if !s! lss 60 (set bj_%%i= !bj%%i!) else (set bj_%%i=¤)
)
call :huabiao xx 画初始表
:st
::获得X Y的坐标
cmos 0 -1 1 0 21
set /a P=%errorlevel%
set /a X=%P:~0,-3%
set /a Y=%P%-1000*%X%
::坐标处理
set/a x=(X-4),y=(Y-3),z=(x/2)%%2+y%%2
if not !z!==2 echo,请左键单击 ¤ 来输入数据&goto st
set/a xx=(x/2+1)/2,yy=y/2+1,zb=xx+yy*9-9
::echo xx=!xx! yy=!yy! zb=!zb! 
call :fuzhu
if "!num!"=="" goto :shibai
for /l %%a in (1,1,9) do set num=!num:%%a=%%a !
for %%a in (!zb!) do (
   if not "!bj_%%a!"=="¤" goto cxhb
   set /p "sr=此处可填写数字(!num!):"
   if !sr! geq 1 if !sr! leq 9 echo !num! | findstr /c:"!sr!" &&set bj_%%a= !sr!|| goto cxhb
   )
set sy=0&for /l %%a in (1,1,81) do if !bj_%%a!==¤ set/a sy+=1
::重新画表
:cxhb
call :huabiao
if !sy!==0 msg * 祝贺你完成游戏! &pause&goto :starts
goto :st
pause
::此功能未作严格测试，可能出错
:shibai
set/p shi=你已经填写错误导致失败,是否查看答案(Y/N):
if /i !shi!==n goto :starts
set shi=&echo,>"%temp%\daan.txt"
for /l %%a in (1,1,81) do (
   set shi=!shi!!bj%%a!  
   set/a bai=%%a%%9
   if !bai!==0 echo,&echo,!shi!>>"%temp%\daan.txt"&set shi=
   )
>"%temp%\daan.bat" (
echo @echo off
echo mode con cols=45 lines=18
echo type "%temp%\daan.txt"
echo set/p=
)
start "" "%temp%\daan.bat"
call :huabiao
set/p shi=请对比后,按任意键重新开始&goto :starts
::辅助功能排除已存在的数据,显示可填写数字
:fuzhu
set/a num=123456789,heng1=yy*9-8,heng2=yy*9,xxx=72+xx
call :tihuan !heng1! 1 !heng2!
call :tihuan !xx! 9 !xxx!
set/a xx=(xx-1)/3,yy=(yy-1)/3,zz=xx*3+1+yy*27,zzz=zz+2
for %%a in (x y z) do call :tihuan !zz! 1 !zzz!&set/a zz+=9,zzz+=9
goto :eof
::排除已存在的数据
:tihuan
for /l %%a in (%1,%2,%3) do (
  if not "!bj_%%a!"=="¤" for %%b in (!bj_%%a!) do set num=!num:%%b=!
  )
if "!num!"=="" goto :shibai
echo !num! | findstr /c:"=" && goto :shibai
goto :eof 
::画表 
:huabiao
cls&cls&set _n=1&set _nn=9
echo        ###请左键单击 ¤ 来输入数据###&echo,
echo    ┏━┯━┯━┳━┯━┯━┳━┯━┯━┓
for /l %%i in (1,1,9) do (
   set hb=
   for /l %%a in (!_n!,1,!_nn!) do (
      set/a hb#=%%a%%3
      if not !hb#!==0 (set hb=!hb!!bj_%%a!│) else (set hb=!hb!!bj_%%a!┃)
   )
   set/a _n+=9,_nn+=9,hb_=%%i%%3
   echo    ┃!hb!
   if not !hb_!==0 (
      echo    ┠─┼─┼─╂─┼─┼─╂─┼─┼─┨
   ) else (
  if %%i lss 9 echo    ┣━┿━┿━╋━┿━┿━╋━┿━┿━┫
   )
)  
echo    ┗━┷━┷━┻━┷━┷━┻━┷━┷━┛
goto :eof

::随机生成数独数据,用现成的,稍作改动。
::code by 523066680@Bathome
:test
set "numx=123456789"
set "ca=call :next"
:first
set /a ra=%random%%%9+1,rb=%random%%%9+1
set numx=!numx:%ra%=x!
set numx=!numx:%rb%=%ra%!
set numx=!numx:x=%rb%!
if %ra% neq 9 (goto :first)
set h1=%numx%
%ca% 1 2
%ca% 2 3
set h4=%h1:~2,1%%h1:~0,2%%h1:~5,1%%h1:~3,2%%h1:~8,1%%h1:~6,2%
%ca% 4 5
%ca% 5 6
set h7=%h4:~2,1%%h4:~0,2%%h4:~5,1%%h4:~3,2%%h4:~8,1%%h4:~6,2%
%ca% 7 8
%ca% 8 9
for /l %%a in (1,1,9) do (for /l %%b in (1,1,9) do (set h%%a=!h%%a:%%b=%%b !))
for /l %%a in (1,1,9) do for %%b in (!h%%a!) do set/a bj+=1&set bj!bj!=%%b
:next
set h%2=!h%1:~3,3!!h%1:~6!!h%1:~0,3!
goto :eof