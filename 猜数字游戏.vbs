Randomize

dim a,b,c

c = msgbox ("���ʲôҲ������,��һ�����ȷ����,�Զ��˳���Ϸ,����Ҫ��ʾ�������",1,"��ʾ")

a = int(round (rnd*100))

b = inputbox("������һ��1~100����:","������")

mysub a,b,c
 
 

sub mysub (a,b,c)
	
if (c=1) then
		
msgbox ("������ģ�"&b)
	
end if
 
	
if not isnumeric(b) then 
		
msgbox "�˳���Ϸ"
	
else
		
select case sgn(b-a)
			
case 0
				
msgbox "��ϲ���,������ǣ�"&a
			
case 1
				
msgbox "�������ֵ̫����"
				
b = inputbox("������һ��1~100����:","������")
				
mysub a,b,c
			
case -1
				
msgbox "�������ֵ̫С��"
				
b = inputbox("������һ��1~100����:","������")
				
mysub a,b,c
		
end select
	
end if

end sub
