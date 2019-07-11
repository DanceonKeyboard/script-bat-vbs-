@echo off&setlocal enabledelayedexpansion&mode 90,33&title 批处理版象棋&color 76
:Restart
call :Module_StartWith

:loop_1
color 76
title 批处理版象棋 - 请选棋
call :Module_Echo
set "msg_4=[信息]"
call :Cmos loop_1 X Y
call :Check_1

:loop_2
color 7e
title 批处理版象棋 - 请走棋
call :Cmos loop_2 New_X New_Y
call :Check_2
if "!P_ID_%New_X%_%New_Y%!" equ "j" (msg * 你输了，加油！ 点击鼠标继续
color c0&cmos c f&goto :Restart)
set /a Undo_Num+=1
set "Undo_!Undo_Num!=P_ID_!X!_!Y!=!P_ID_%X%_%Y%! P_ID_!New_X!_!New_Y!=!P_ID_%New_X%_%New_Y%!"
set "P_ID_!New_X!_!New_Y!=!P_ID_%X%_%Y%!"&set "P_ID_!X!_!Y!=#"
set now=c
goto :Think

:Module_StartWith
set  "line_0=　　　　　　　　　　　　　　　　　　　　　　　　　　　"
set  "line_1=　┏━━┳━━┳━━┳━━┳━━┳━━┳━━┳━━┓　"
set  "line_2=　┃　　┃　　┃　　┃╲　┃　╱┃　　┃　　┃　　┃　"
set  "line_3=　┃　　┃　　┃　　┃　╲┃╱　┃　　┃　　┃　　┃　"
set  "line_4=　┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫　"
set  "line_5=　┃　　┃　　┃　　┃　╱┃╲　┃　　┃　　┃　　┃　"
set  "line_6=　┃　　┃　　┃　　┃╱　┃　╲┃　　┃　　┃　　┃　"
set  "line_7=　┣━━╬━━╋━━╋━━╋━━╋━━╋━━╬━━┫　"
set  "line_8=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set  "line_9=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_10=　╠━━╋━━╬━━╋━━╬━━╋━━╬━━╋━━╣　"
set "line_11=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_12=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_13=　┣━━┻━━┻━━┻━━┻━━┻━━┻━━┻━━┫　"
set "line_14=　┃　　　　　　　　　　　　　　　　　　　　　　　┃　"
set "line_15=　┃　　　　　　　　　　　　　　　　　　　　　　　┃　"
set "line_16=　┣━━┳━━┳━━┳━━┳━━┳━━┳━━┳━━┫　"
set "line_17=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_18=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_19=　╠━━╋━━╬━━╋━━╬━━╋━━╬━━╋━━╣　"
set "line_20=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_21=　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　　┃　"
set "line_22=　┣━━╬━━╋━━╋━━╋━━╋━━╋━━╬━━┫　"
set "line_23=　┃　　┃　　┃　　┃╲　┃　╱┃　　┃　　┃　　┃　"
set "line_24=　┃　　┃　　┃　　┃　╲┃╱　┃　　┃　　┃　　┃　"
set "line_25=　┣━━╋━━╋━━╋━━╋━━╋━━╋━━╋━━┫　"
set "line_26=　┃　　┃　　┃　　┃　╱┃╲　┃　　┃　　┃　　┃　"
set "line_27=　┃　　┃　　┃　　┃╱　┃　╲┃　　┃　　┃　　┃　"
set "line_28=　┗━━┻━━┻━━┻━━┻━━┻━━┻━━┻━━┛　"
set "line_29=　　　　　　　　　　　　　　　　　　　　　　　　　　　"
for /l %%# in (1,1,10) do set "msg_%%#= "
set now=j&set Undo_Num=0
set "str=卒炮将士象马车兵炮帅仕相马车"&set "var=abcdefghijklmn"
for %%# in (#@1 a@P b@C c@K d@A e@B f@N g@R h@p i@c j@k k@a l@b m@n m@r) do set t=%%#&set Fen_!t:@==!
for /l %%# in (0,1,13) do set E_!var:~%%#,1!=!str:~%%#,1!
for /l %%$ in (1,1,10) do for /l %%# in (1,1,9) do set P_ID_%%$_%%#=#
for %%# in (1_1@g 1_2@f 1_3@e 1_4@d 1_5@c 1_6@d 1_7@e 1_8@f 1_9@g 10_1@n 10_2@m 10_3@l 10_4@k 10_5@j 10_6@k 10_7@l 10_8@m 10_9@n 3_2@b 3_8@b 8_2@i 8_8@i 4_1@a 4_3@a 4_5@a 4_7@a 4_9@a 7_1@h 7_3@h 7_5@h 7_7@h 7_9@h) do (set "t=%%#"&set "P_ID_!t:@==!")
set "msg_1=批处理版象棋，由ａ２００２编写完成，第三方ｃｍｏｓ，引擎使用参照Ｈａｐｐｙ８８６ｒｒ"
set "msg_2=　　┏━┓┏━┓┏━┓　　　　　　┃悔┃┃重┃┃退┃　　　　　　┗━┛┗━┛┗━┛　　　　"
set "msg_4=[信息]"&set "c=h i j k l m n"&set "j=a b c d e f g"
goto :eof

:Module_Set
for /l %%$ in (1,1,10) do for /l %%# in (1,1,9) do (
if "!P_ID_%%$_%%#!" equ "#" (
set /a t1=%%$*3-3,t2=t1+1,t3=t2+1,t4=%%#*3-3
for /f "tokens=1-6 delims= " %%a in ("%%$ %%# !t1! !t2! !t3! !t4!") do set "P_Top_%%a_%%b=!line_%%c:~%%f,3!"&set "P_Between_%%a_%%b=!line_%%d:~%%f,3!"&set "P_Bottom_%%a_%%b=!line_%%e:~%%f,3!")
for %%a in (a b c d e f g) do if "!P_ID_%%$_%%#!" equ "%%a" set "P_Top_%%$_%%#=┌─┐"&set "P_Between_%%$_%%#=│!E_%%a!│"&set "P_Bottom_%%$_%%#=└─┘"
for %%a in (h i j k l m n) do if "!P_ID_%%$_%%#!" equ "%%a" set "P_Top_%%$_%%#=╔═╗"&set "P_Between_%%$_%%#=║!E_%%a!║"&set "P_Bottom_%%$_%%#=╚═╝")
goto :eof

:Module_Echo
call :Module_Set
set "msg_3=走棋方：!E_%now%!"
cls
echo ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
for /l %%# in (1,1,10) do (
echo ┃!P_Top_%%#_1!!P_Top_%%#_2!!P_Top_%%#_3!!P_Top_%%#_4!!P_Top_%%#_5!!P_Top_%%#_6!!P_Top_%%#_7!!P_Top_%%#_8!!P_Top_%%#_9!┃!msg_%%#:~0,15!
echo ┃!P_Between_%%#_1!!P_Between_%%#_2!!P_Between_%%#_3!!P_Between_%%#_4!!P_Between_%%#_5!!P_Between_%%#_6!!P_Between_%%#_7!!P_Between_%%#_8!!P_Between_%%#_9!┃!msg_%%#:~15,15!
echo ┃!P_Bottom_%%#_1!!P_Bottom_%%#_2!!P_Bottom_%%#_3!!P_Bottom_%%#_4!!P_Bottom_%%#_5!!P_Bottom_%%#_6!!P_Bottom_%%#_7!!P_Bottom_%%#_8!!P_Bottom_%%#_9!┃!msg_%%#:~30,15!)
echo ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
goto :eof

:Check_1
if "!P_ID_%X%_%Y%!" equ "#" set "msg_4=棋不能为空！！！"&goto :loop_1
for %%# in (!%now%!) do if "!P_ID_%X%_%Y%!" equ "%%#" set "msg_4=请拿自己的棋！！！"&goto :loop_1
goto :eof

:Check_2
set t=0
set F_c=!j!&set F_j=!c!
for %%# in (!F_%now%!) do if "!P_ID_%New_X%_%New_Y%!" equ "%%#" set "msg_4=非法走棋！！！"&goto :loop_1
call :CalcA
if "!P_ID_%X%_%Y%!" equ "a" (if !X! leq 5 (if !Return! equ -1 goto :eof) else (for %%# in (-1 200 -200) do if !Return! equ %%# goto :eof))
if "!P_ID_%X%_%Y%!" equ "h" (if !X! geq 6 (if !Return! equ 1 goto :eof) else (for %%# in (1 200 -200) do if !Return! equ %%# goto :eof))
for %%# in (b i) do (if "!P_ID_%X%_%Y%!" equ "%%#" (if "!P_ID_%New_X%_%New_Y%!" equ "#" (
if !Return! lss 200 if !Return! gtr 0 (call :CalcB 4&if !CalcB_Return! equ 1 goto :eof)
if !Return! lss 0 if !Return! gtr -200 (call :CalcB 2&if !CalcB_Return! equ 1 goto :eof)
if "!Return:~-2!" equ "00" if !Return! gtr 0 (call :CalcB 3&if !CalcB_Return! equ 1 goto :eof)
if "!Return:~-2!" equ "00" if !Return! lss 0 (call :CalcB 1&if !CalcB_Return! equ 1 goto :eof)
) else (
if !Return! lss 200 if !Return! gtr 0 (call :CalcB 4&if !CalcB_Return! equ 3 goto :eof)
if !Return! lss 0 if !Return! gtr -200 (call :CalcB 2&if !CalcB_Return! equ 3 goto :eof)
if "!Return:~-2!" equ "00" if !Return! gtr 0 (call :CalcB 3&if !CalcB_Return! equ 3 goto :eof)
if "!Return:~-2!" equ "00" if !Return! lss 0 (call :CalcB 1&if !CalcB_Return! equ 3 goto :eof))))
if "!P_ID_%X%_%Y%!" equ "c" (if !New_X! geq 1 if !New_X! leq 3 if !New_Y! geq 4 if !New_Y! leq 6 (for %%# in (1 -1 200 -200) do if !Return! equ %%# goto :eof)
if "!P_ID_%New_X%_%New_Y%!" equ "j" (call :CalcB 2&if !CalcB_Return! equ 2 goto :eof))
if "!P_ID_%X%_%Y%!" equ "j" (if !New_X! geq 8 if !New_X! leq 10 if !New_Y! geq 4 if !New_Y! leq 6 (for %%# in (1 -1 200 -200) do if !Return! equ %%# goto :eof)
if "!P_ID_%New_X%_%New_Y%!" equ "c" (call :CalcB 4&if !CalcB_Return! equ 2 goto :eof))
if "!P_ID_%X%_%Y%!" equ "d" (if !New_X! geq 1 if !New_X! leq 3 if !New_Y! geq 4 if !New_Y! leq 6 (
for %%# in (201 199 -199 -201) do if !Return! equ %%# goto :eof))
if "!P_ID_%X%_%Y%!" equ "k" (if !New_X! geq 8 if !New_X! leq 10 if !New_Y! geq 4 if !New_Y! leq 6 (
for %%# in (201 199 -199 -201) do if !Return! equ %%# goto :eof))
if "!P_ID_%X%_%Y%!" equ "e" (if !New_X! leq 5 (
if !Return! equ 402 (set /a t1=X-1,t2=Y-1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ 398 (set /a t1=X+1,t2=Y-1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ -398 (set /a t1=X-1,t2=Y+1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ -402 (set /a t1=X+1,t2=Y+1&call :Command_1 !t1! !t2!&if defined t goto :eof)))
if "!P_ID_%X%_%Y%!" equ "l" (if !New_X! geq 6 (
if !Return! equ 402 (set /a t1=X-1,t2=Y-1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ 398 (set /a t1=X+1,t2=Y-1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ -398 (set /a t1=X-1,t2=Y+1&call :Command_1 !t1! !t2!&if defined t goto :eof)
if !Return! equ -402 (set /a t1=X+1,t2=Y+1&call :Command_1 !t1! !t2!&if defined t goto :eof)))
for %%# in (f m) do (if "!P_ID_%X%_%Y%!" equ "%%#" (
for %%$ in (202 -198) do if !Return! equ %%$ (set /a t1=X-1,t2=Y&call :Command_1 !t1! !t2!&if defined t goto :eof)
for %%$ in (401 399) do if !Return! equ %%$ (set /a t1=X,t2=Y-1&call :Command_1 !t1! !t2!&if defined t goto :eof)
for %%$ in (-401 -399) do if !Return! equ %%$ (set /a t1=X,t2=Y+1&call :Command_1 !t1! !t2!&if defined t goto :eof)
for %%$ in (198 -202) do if !Return! equ %%$ (set /a t1=X+1,t2=Y&call :Command_1 !t1! !t2!&if defined t goto :eof)))
for %%# in (g n) do (if "!P_ID_%X%_%Y%!" equ "%%#" (if "!P_ID_%New_X%_%New_Y%!" equ "#" (
if !Return! lss 200 if !Return! gtr 0 (call :CalcB 4&if !CalcB_Return! equ 1 goto :eof)
if !Return! lss 0 if !Return! gtr -200 (call :CalcB 2&if !CalcB_Return! equ 1 goto :eof)
if "!Return:~-2!" equ "00" if !Return! gtr 0 (call :CalcB 3&if !CalcB_Return! equ 1 goto :eof)
if "!Return:~-2!" equ "00" if !Return! lss 0 (call :CalcB 1&if !CalcB_Return! equ 1 goto :eof)
) else (
if !Return! lss 200 if !Return! gtr 0 (call :CalcB 4&if !CalcB_Return! equ 2 goto :eof)
if !Return! lss 0 if !Return! gtr -200 (call :CalcB 2&if !CalcB_Return! equ 2 goto :eof)
if "!Return:~-2!" equ "00" if !Return! gtr 0 (call :CalcB 3&if !CalcB_Return! equ 2 goto :eof)
if "!Return:~-2!" equ "00" if !Return! lss 0 (call :CalcB 1&if !CalcB_Return! equ 2 goto :eof))))
set "msg_4=非法走棋！！！"&goto :loop_1

:Think
color 76
title 批处理版象棋 - 电脑思考中，请稍后...
set "msg_4=电脑思考中，请稍后..."
call :Module_Echo
set "msg_4=[信息]"&set put=&set Fen=
for /l %%# in (10,-1,1) do (
set "Fen=!Fen!/"
for /l %%$ in (1,1,9) do (
set "t=!P_ID_%%#_%%$!"
for %%@ in (!t!) do set Fen=!Fen!!Fen_%%@!))
set Fen=!Fen:~1!
for /f "tokens=1,2 delims= " %%a in ('CallUCCI.bat !Fen! w - - 0 !Undo_Num!') do if "%%a" equ "bestmove" set put=%%b
if not defined put msg * 这盘算我输，单击鼠标再来一盘&color c0&cmos c f&goto :Restart
set put=!put:a=1!&set put=!put:b=2!&set put=!put:c=3!&set put=!put:d=4!&set put=!put:e=5!&set put=!put:f=6!&set put=!put:g=7!&set put=!put:h=8!&set put=!put:i=9!
set /a t1=!put:~0,1!,t2=!put:~1,1!+1,t3=!put:~2,1!,t4=!put:~3,1!+1
set /a Undo_Num+=1
set "Undo_!Undo_Num!=P_ID_!t2!_!t1!=!P_ID_%t2%_%t1%! P_ID_!t4!_!t3!=!P_ID_%t4%_%t3%!"
if "!P_ID_%t4%_%t3!" equ "c" (msg * 我输了，IQ太低，点击鼠标继续
color c0&cmos c f&goto :Restart)
set P_ID_!t4!_!t3!=!P_ID_%t2%_%t1%!&set P_ID_!t2!_!t1!=#
set now=j&goto :loop_1

:CalcA
set /a t1=X-New_X,t2=(Y-New_Y)*200
set /a Return=t1+t2
goto :eof

:CalcB
set CalcB_Return=0
if "%~1" equ "1" for /l %%# in (!Y!,1,!New_Y!) do if "!P_ID_%X%_%%#!" neq "#" set /a CalcB_Return+=1
if "%~1" equ "2" for /l %%# in (!X!,1,!New_X!) do if "!P_ID_%%#_%Y%!" neq "#" set /a CalcB_Return+=1
if "%~1" equ "3" for /l %%# in (!New_Y!,1,!Y!) do if "!P_ID_%X%_%%#!" neq "#" set /a CalcB_Return+=1
if "%~1" equ "4" for /l %%# in (!New_X!,1,!X!) do if "!P_ID_%%#_%Y%!" neq "#" set /a CalcB_Return+=1
goto :eof

:Cmos
cmos c f
set /a t1=!errorlevel!-1001
if !errorlevel:~-3! equ 001 goto :%~1
if !t1! leq 2000 goto :%~1
set t2=!t1:~0,-3!
set /a %~3=(t2-1)/6+1,%~2=(t1-t2*1000-1)/3+1
if "!%~2!_!%~3!" equ "2_11" goto :Undo
if "!%~2!_!%~3!" equ "2_12" goto :Restart
if "!%~2!_!%~3!" equ "2_13" exit
if !%~2! gtr 10 goto :%~1
if !%~2! lss 1 goto :%~1
if !%~3! gtr 9 goto :%~1
if !%~3! lss 1 goto :%~1
goto :eof

:Undo
if !Undo_Num! lss 2 set "msg_4=没有可悔的棋！！！"&goto :loop_1
set /a t1=Undo_Num,t2=t1-1,Undo_Num-=2
for /f "tokens=1,2 delims= " %%a in ("!Undo_%t1%!") do set "%%a"&set "%%b"
for /f "tokens=1,2 delims= " %%a in ("!Undo_%t2%!") do set "%%a"&set "%%b"
goto :loop_1

:Command_1
set t=&if "!P_ID_%~1_%~2!" equ "#" set t=1
goto :eof