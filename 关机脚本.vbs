@echo off
title ���YueE �����ҡ�_�����ٹػ�(��_��)/~~���
mode con cols=46 lines=24
color 0d
shutdown /a >nul 2>nul
ver > %temp%\ver.temp
find /i " 5.2" %temp%\ver.temp > nul && set shutdowntime=600&& goto start
set shutdowntime=315359999
:start
cls 
set choice=
echo    �� ������   \\\ATA///     %date%
echo ����   ����   \\��- -��//        %time:~0,8%
echo  ����   ���� �� (��@ @��)
echo     ��������oOOo����(_)����oOOo����������
echo     ��                                    ��
echo    A�� 1.�����������(*^__^*)����        ��A
echo    A��   2.�Ͽ������������Ѩy��)     ��A
echo    A��     3.������ʱ��ô����������    ��A
rem echo    A��       4.�ƻ��ػ�!�������ڴ���   ��A
echo     ��                         Oooo    ��
echo     ������������������oooO����(   )������
echo                       (   )    ) / 
echo                        \ (    (_/ 
echo                         \_)
set /p choice=...˵�ɣ������ɶ��������������:
If "%choice%" equ "1" goto gj 
If "%choice%" equ "2" goto cq
If "%choice%" equ "3" goto ds
If "%choice%" equ "4" goto jh
If "%choice%" equ "q" goto :eof
goto start
:gj
echo.
echo .....ȷ�����̹ػ���?��?ֱ�Ӱ���Enter
set /p choice=.......�뷴�ڵĻ���Ҳ�У�����N:
if  /i "%choice%" equ "n" ( goto start ) else (shutdown /s /t 0)
echo.
goto end
:cq
echo.
echo .....ȷ������������?��?ֱ�Ӱ���Enter
set /p choice=.......�뷴�ڵĻ���Ҳ�У�����N:
if  /i "%choice%" equ "n" ( goto start ) else (shutdown /r /t 0)
echo.
goto end
:ds
set shijian=
set /p shijian=.....��д�Ϲػ�ʱ��ɣ���Ϊ��λ��:
if "%shijian%" equ "" goto start
set tempzhi=%shijian%
:yanzheng
set zhi=%tempzhi:~0,1%
if "%zhi%" equ "0" goto quzhi
if "%zhi%" equ "1" goto quzhi
if "%zhi%" equ "2" goto quzhi
if "%zhi%" equ "3" goto quzhi
if "%zhi%" equ "4" goto quzhi
if "%zhi%" equ "5" goto quzhi
if "%zhi%" equ "6" goto quzhi
if "%zhi%" equ "7" goto quzhi
if "%zhi%" equ "8" goto quzhi
if "%zhi%" equ "9" goto quzhi
echo.
echo �������������ݺ��зǷ��ַ�������������맨����
pause > nul
goto start
:quzhi
set tempzhi=%tempzhi:~1%
if "%tempzhi%" == "" goto jixu
goto yanzheng
:jixu
if %shijian% leq %shutdowntime% (
        shutdown /s /t %shijian% /c �������ú��˰ɣ�˵�ؾ͹���!!!
) else (
        echo.
        echo    ������������Ĺػ�ʱ�䳬�����Է�Χ������
        echo         ������С��%shutdowntime%����ֵ
        pause>nul
        goto start
)
echo.
echo ������Խ���%shijian%���ػ���ץ���ˡ���
echo.
echo .....ȷ���ػ�ʱ������???ֱ�Ӱ���Enter
set /p choice=.......�뷴�ڵĻ���Ҳ�У�����N:
if /i "%choice%" equ "n" ( goto qx ) else ( goto end )
:jh
echo.
echo.
echo         �ƻ��ػ���δ�Ƴ����뾴���ע��
echo                 ... ...
pause > nul
goto start
:qx
cls
shutdown /a > nul 2>nul
set choice=
echo     �� ������                    %time%
echo.
echo    1.��֪�����ˣ���Ҳ���ҹػ��ˣ������Ұɣ�
echo.
echo  2.��ֻ��ʧ������۾���̫��ʹ�ˣ�ʱ���ƴ���
echo.
echo    3.��ԭ��������������ԩ����Բ�����·����
echo.
echo      4.̫���ˣ���Ҫ����ػ��������...
echo.
echo.
echo    �ַ����˰ɣ��������Ƣ������ȱ����㣡����
set /p choice=�Ƽ���û�������еĺ��ҩ����ѡ���Լ����Ű죺
echo.
if "%choice%" equ "" goto qx
if "%choice%" equ "1" goto start 
if "%choice%" equ "2" goto ds
if "%choice%" equ "3" goto cq
if "%choice%" equ "4" goto gj
if "%choice%" equ "q" goto :eof
:end
echo.
echo                  Good Bye!!!
echo                                    %date%
pause>nul