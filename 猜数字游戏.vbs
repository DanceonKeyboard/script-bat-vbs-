Randomize

dim a,b,c

c = msgbox ("如果什么也不输入,下一步点击确定键,自动退出游戏,另需要提示随机数吗",1,"提示")

a = int(round (rnd*100))

b = inputbox("请输入一个1~100整数:","猜数字")

mysub a,b,c
 
 

sub mysub (a,b,c)
	
if (c=1) then
		
msgbox ("我输入的："&b)
	
end if
 
	
if not isnumeric(b) then 
		
msgbox "退出游戏"
	
else
		
select case sgn(b-a)
			
case 0
				
msgbox "恭喜答对,随机数是："&a
			
case 1
				
msgbox "输入的数值太大了"
				
b = inputbox("请输入一个1~100整数:","猜数字")
				
mysub a,b,c
			
case -1
				
msgbox "输入的数值太小了"
				
b = inputbox("请输入一个1~100整数:","猜数字")
				
mysub a,b,c
		
end select
	
end if

end sub
