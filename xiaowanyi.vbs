msgbox "��ֻ��һ��С��Ϸ",,"�Ǻ�"
dim name,age
name=inputbox ("���������������",,"L2")
age=inputbox ("������������䣺",,"100")
msgbox "������"&name&" ��"&"����"&age&"~~",,"����һ��"
msgbox "��ֻ��һ������",,"�Ǻ�"
for i=1 to 3
msgbox "������"&name&" "&"ˣ��һ��~ "&i&"%",,"����"
dim a
for a=0 to 10
msgbox "Ҫ�����Ĺ�! "&a&"%",,"С���Ҵ��ˣ�~"
if a=10 then 
exit for
end if 
next
next