@echo off
mode con:cols=80 lines=28
color 17
title win7/8����WiFi       
:main
color 17
cls
echo #################################################
echo ##                                             ##
echo ##             win7/8�����ȵ�                  ##
echo ##                                             ##
echo ##                                             ##
echo ##             ����WiFi�ȵ�--1                 ##
echo ##             �ر�WiFi�ȵ�--2                 ##
echo ##             ����WiFi�ȵ�--3                 ##
echo ##                                             ##
echo ##      һ��������Ĭ�Ͻ���SSIDΪWiFi����       ##
echo ##          123456789���ȵ㲢�˳�������        ##
echo ##                                             ##
echo #################################################
echo ���б�������Ҫ����ԱȨ�ޣ�����ͼ���Ҽ�ѡ��
echo �����߲�֧��XP��ǰϵͳ����֧��winNT6.�Ժ�汾
echo tips:
echo      Vista֮��Windows������WIFI�����ܣ������߾����ô�������ȵ㡣
echo
echo
echo
set /p option=���������ѡ�����q���˳���
@echo off
if "%option%"=="1" goto start
if "%option%"=="2" goto stop
if "%option%"=="3" goto set
if "%option%"=="0" goto onekey
if "%option%"=="q" goto exit
if "%option%"=="main" goto main

:start
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan start hostednetwork

echo �밴���������������...
pause>nul
goto main
:exit
echo ��л����ʹ�ã������߼����˳���
echo �����κ���������ϵ���ˡ�
echo �ٴθ�л����ʹ�ã�:D
echo 5..
echo 4..
echo 3..
echo 2..
echo 1..
echo ������ܿ����⼸���֣�˵����ĵ�����Щ����--��
exit

:set
set /p ssid=������Ҫ�������ȵ����ƣ�SSID��:
set /p key=������Ҫ�������ȵ����루8λ���ϣ�:
echo �����ס���Եȣ�Windows���ں�̨����...һֱ��ס���Ժ��������б�����
netsh wlan set hostednetwork mode=allow ssid="%SSID%" key="%key%"
echo �����������ʾ����������Ϣ�����ɹ���
echo ----��������ģʽ������Ϊ����
echo ----�ѳɹ����ĳ��������SSID��
echo ----�ѳɹ������й�������û���Կ���롣
echo �������������������������ѯ
echo �밴���������������...
pause>nul
goto main

:onekey
netsh wlan set hostednetwork mode=allow ssid="WIFI" key=123456789
netsh wlan start hostednetwork
exit































