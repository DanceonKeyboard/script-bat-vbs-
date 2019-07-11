@echo off
title ♂♀YueE 工作室→_→快速关机(☆_☆)/~~♀♂
mode con cols=46 lines=24
color 0d
shutdown /a >nul 2>nul
ver > %temp%\ver.temp
find /i " 5.2" %temp%\ver.temp > nul && set shutdowntime=600&& goto start
set shutdowntime=315359999
:start
cls 
set choice=
echo    　 　　　   \\\ATA///     %date%
echo 　　   　　   \\　- -　//        %time:~0,8%
echo  　　   　　 　 (　@ @　)
echo     ┏━━━oOOo━━(_)━━oOOo━━━━┓
echo     ╀                                    ╀
echo    A◎ 1.今天你关了吗(*^__^*)　　        ◎A
echo    A◎   2.赶快快快重启啦（⊙▂⊙)     ◎A
echo    A◎     3.来个定时怎么样？？？？    ◎A
rem echo    A◎       4.计划关机!（尽请期待）   ◎A
echo     ╁                         Oooo    ╁
echo     ┗━━━━━━━━oooO━━(   )━━┛
echo                       (   )    ) / 
echo                        \ (    (_/ 
echo                         \_)
set /p choice=...说吧，恁想整啥里，就在这儿输入♀♂:
If "%choice%" equ "1" goto gj 
If "%choice%" equ "2" goto cq
If "%choice%" equ "3" goto ds
If "%choice%" equ "4" goto jh
If "%choice%" equ "q" goto :eof
goto start
:gj
echo.
echo .....确定立刻关机吗?？?直接按下Enter
set /p choice=.......想反悔的话，也行，输入N:
if  /i "%choice%" equ "n" ( goto start ) else (shutdown /s /t 0)
echo.
goto end
:cq
echo.
echo .....确定立刻重启吗?？?直接按下Enter
set /p choice=.......想反悔的话，也行，输入N:
if  /i "%choice%" equ "n" ( goto start ) else (shutdown /r /t 0)
echo.
goto end
:ds
set shijian=
set /p shijian=.....恁就写上关机时间吧（秒为单位）:
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
echo ЖЖЖ输入内容含有非法字符串，请从新输入ЖЖЖ
pause > nul
goto start
:quzhi
set tempzhi=%tempzhi:~1%
if "%tempzhi%" == "" goto jixu
goto yanzheng
:jixu
if %shijian% leq %shutdowntime% (
        shutdown /s /t %shijian% /c 我屮，得狠了吧，说关就关你!!!
) else (
        echo.
        echo    ЖЖЖ你输入的关机时间超出电脑范围ЖЖЖ
        echo         请输入小于%shutdowntime%的数值
        pause>nul
        goto start
)
echo.
echo ¤¤¤电脑将在%shijian%秒后关机，抓紧了¤¤¤
echo.
echo .....确定关机时间了吗???直接按下Enter
set /p choice=.......想反悔的话，也行，输入N:
if /i "%choice%" equ "n" ( goto qx ) else ( goto end )
:jh
echo.
echo.
echo         计划关机暂未推出，请敬请关注！
echo                 ... ...
pause > nul
goto start
:qx
cls
shutdown /a > nul 2>nul
set choice=
echo     　 　　　                    %time%
echo.
echo    1.额知到错了，再也不敢关机了，绕了我吧？
echo.
echo  2.哥只是失误，最近眼睛不太好使了，时间瞧错了
echo.
echo    3.我原来是想重启来，冤这电脑不按套路出牌
echo.
echo      4.太慢了，我要立马关机里，不玩了...
echo.
echo.
echo    又反悔了吧？就你这臭脾气，深度鄙视你！！！
set /p choice=瞧见了没？上面有的后悔药让你选，自己看着办：
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