wscript.echo printer(" ","*","113111111112212111313111513",7)

function printer(a1,a2,b,c)'һ������ַ����ĺ���
for i = 1 to len(b)
b1 = Mid(b,i,1)
 for j = 1 to b1
     s=s&a1
     n=n+1
     if n=c then 
     s=s&chr(10)
     n=0
     end if
 next
a3=a1
a1=a2
a2=a3
next

printer=s
end function