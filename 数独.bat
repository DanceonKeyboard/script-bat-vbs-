@echo off&setlocal enabledelayedexpansion
color f0&mode con cols=57 lines=16 
title  ��������By Ե��_yangfengoo 
rem ��VBT3Ⱥ�����������þ��Լ��е�����Ҳ��������
rem NOW,LET'S GO!2010,10,9 22:59
::ʹ��˵��
ECHO,
echo, 1,����Ϸ֧�������Ҫ����������Cmos.exe,�Ѵ��
echo, 2,ԭʼ����͵������Bathomeˮ��523066680�Ĵ�������
echo, 3,����Ϸ���Զ��������ĳ���ڿ�����д����
echo, 4,������������ʾ�е�����,�����������Ĵ�������
echo, 5,��������֮��,��ʱһ��ִ����,��ӭ��Ҳ��Բ�ָ������
echo, 6,����,LET'S GO! 
echo,                      BY Ե��_yangfengoo
SET/P=
mode con cols=45 lines=24 
:starts
set bj=0&call :test
::������������
for /l %%i in (1,1,81) do (
    set /a s=!random!%%100
 if !s! lss 60 (set bj_%%i= !bj%%i!) else (set bj_%%i=��)
)
call :huabiao xx ����ʼ��
:st
::���X Y������
cmos 0 -1 1 0 21
set /a P=%errorlevel%
set /a X=%P:~0,-3%
set /a Y=%P%-1000*%X%
::���괦��
set/a x=(X-4),y=(Y-3),z=(x/2)%%2+y%%2
if not !z!==2 echo,��������� �� ����������&goto st
set/a xx=(x/2+1)/2,yy=y/2+1,zb=xx+yy*9-9
::echo xx=!xx! yy=!yy! zb=!zb! 
call :fuzhu
if "!num!"=="" goto :shibai
for /l %%a in (1,1,9) do set num=!num:%%a=%%a !
for %%a in (!zb!) do (
   if not "!bj_%%a!"=="��" goto cxhb
   set /p "sr=�˴�����д����(!num!):"
   if !sr! geq 1 if !sr! leq 9 echo !num! | findstr /c:"!sr!" &&set bj_%%a= !sr!|| goto cxhb
   )
set sy=0&for /l %%a in (1,1,81) do if !bj_%%a!==�� set/a sy+=1
::���»���
:cxhb
call :huabiao
if !sy!==0 msg * ף���������Ϸ! &pause&goto :starts
goto :st
pause
::�˹���δ���ϸ���ԣ����ܳ���
:shibai
set/p shi=���Ѿ���д������ʧ��,�Ƿ�鿴��(Y/N):
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
set/p shi=��ԱȺ�,����������¿�ʼ&goto :starts
::���������ų��Ѵ��ڵ�����,��ʾ����д����
:fuzhu
set/a num=123456789,heng1=yy*9-8,heng2=yy*9,xxx=72+xx
call :tihuan !heng1! 1 !heng2!
call :tihuan !xx! 9 !xxx!
set/a xx=(xx-1)/3,yy=(yy-1)/3,zz=xx*3+1+yy*27,zzz=zz+2
for %%a in (x y z) do call :tihuan !zz! 1 !zzz!&set/a zz+=9,zzz+=9
goto :eof
::�ų��Ѵ��ڵ�����
:tihuan
for /l %%a in (%1,%2,%3) do (
  if not "!bj_%%a!"=="��" for %%b in (!bj_%%a!) do set num=!num:%%b=!
  )
if "!num!"=="" goto :shibai
echo !num! | findstr /c:"=" && goto :shibai
goto :eof 
::���� 
:huabiao
cls&cls&set _n=1&set _nn=9
echo        ###��������� �� ����������###&echo,
echo    �����ө��ө��ש��ө��ө��ש��ө��ө���
for /l %%i in (1,1,9) do (
   set hb=
   for /l %%a in (!_n!,1,!_nn!) do (
      set/a hb#=%%a%%3
      if not !hb#!==0 (set hb=!hb!!bj_%%a!��) else (set hb=!hb!!bj_%%a!��)
   )
   set/a _n+=9,_nn+=9,hb_=%%i%%3
   echo    ��!hb!
   if not !hb_!==0 (
      echo    �ĩ��੤�੤�橤�੤�੤�橤�੤�੤��
   ) else (
  if %%i lss 9 echo    �ǩ��㩥�㩥�贈�㩥�㩥�贈�㩥�㩥��
   )
)  
echo    �����۩��۩��ߩ��۩��۩��ߩ��۩��۩���
goto :eof

::���������������,���ֳɵ�,�����Ķ���
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