@echo off
mode con:cols=80 lines=28
color 17
title win7/8无线WiFi       
:main
color 17
cls
echo #################################################
echo ##                                             ##
echo ##             win7/8无线热点                  ##
echo ##                                             ##
echo ##                                             ##
echo ##             开启WiFi热点--1                 ##
echo ##             关闭WiFi热点--2                 ##
echo ##             建立WiFi热点--3                 ##
echo ##                                             ##
echo ##      一键开启将默认建立SSID为WiFi密码       ##
echo ##          123456789的热点并退出本程序        ##
echo ##                                             ##
echo #################################################
echo 运行本工具需要管理员权限，请在图标右键选择
echo 本工具不支持XP以前系统，仅支持winNT6.以后版本
echo tips:
echo      Vista之后Windows内置了WIFI共享功能，本工具就利用此命令建立热点。
echo
echo
echo
set /p option=请输入相关选项，输入q则退出：
@echo off
if "%option%"=="1" goto start
if "%option%"=="2" goto stop
if "%option%"=="3" goto set
if "%option%"=="0" goto onekey
if "%option%"=="q" goto exit
if "%option%"=="main" goto main

:start
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan start hostednetwork

echo 请按任意键返回主界面...
pause>nul
goto main
:exit
echo 感谢您的使用，本工具即将退出。
echo 如有任何问题请联系本人。
echo 再次感谢您的使用！:D
echo 5..
echo 4..
echo 3..
echo 2..
echo 1..
echo 如果你能看清这几行字，说明你的电脑有些卡。--！
exit

:set
set /p ssid=请输入要建立的热点名称（SSID）:
set /p key=请输入要建立的热点密码（8位以上）:
echo 如果卡住请稍等，Windows正在后台处理...一直卡住请稍后重新运行本工具
netsh wlan set hostednetwork mode=allow ssid="%SSID%" key="%key%"
echo 建立完毕若显示以下三条信息则建立成功。
echo ----承载网络模式已设置为允许。
echo ----已成功更改承载网络的SSID。
echo ----已成功更改托管网络的用户密钥密码。
echo 若返回其他结果请自行上网查询
echo 请按任意键返回主界面...
pause>nul
goto main

:onekey
netsh wlan set hostednetwork mode=allow ssid="WIFI" key=123456789
netsh wlan start hostednetwork
exit































