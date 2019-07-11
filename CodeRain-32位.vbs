Rem Code BY 老刘
Rem 转载请注明出处

Const CharMap = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
Dim Console
Set Console = CreateObject("Vbscript.Console")
Console.Title Chr(&HA1BE)&Chr(&HC0CF)&Chr(&HC1F5)&Chr(&HB1E0)&Chr(&HD0B4)&Chr(&HA1BF)&Chr(&HC4A3)&Chr(&HC4E2)&Chr(&HBADA)&Chr(&HBFCD)&Chr(&HB5DB)&Chr(&HB9FA)&Chr(&HCAFD)&Chr(&HC2EB)&Chr(&HD3EA)
Width = Console.ViewWidth - 1
Height = Console.ViewHeight - 2
SingleRowMaxRaindrop = 3
Console.CursorVisable = False
Console.SetViewSize Width + 2,Height + 1
Console.ForeColor = 10
Dim NowDown(),y(),Length()
ReDim NowDown(Width - 1),y(Height - 1),SpaceArray(Width - 1),Length(Width - 1)

For i = 1 To Width
	SpaceArray(i - 1) = " "
Next

For i = 1 To Height
	y(i-1)=SpaceArray
Next

'For i = 1 To Width 
'	NowDown(i - 1) = Empty
'Next

'For i = 1 To Width 
'	Length(i - 1) = Fix(Rnd * (Height / 3) * 2) + Fix(Height / 4)
'Next

While True
	For i = 0 To UBound(NowDown)
		If NowDown(i) = Empty Then	'新增雨滴
			NowDown(i) = - Fix(Rnd * Height)
			Length(i) = Fix(Rnd * (Height / 3) * 2) + Fix(Height / 4)
		End If
		If NowDown(i) < Height And NowDown(i) >= 0 Then	'画雨滴
			y(NowDown(i))(i) = Mid(CharMap,Fix(Rnd * Len(CharMap)) + 1,1)
		End If
		If NowDown(i) - Length(i) >= 0 And NowDown(i) - Length(i) < Height Then	'擦除雨滴
			y(NowDown(i) - Length(i))(i) = " "
		End If
		If NowDown(i) - Length(i) + 1 = Height Then	'判断是否下落完成
			NowDown(i) = Empty
		Else
			NowDown(i) = NowDown(i) + 1
		End If
	Next
	On Error Resume Next
	Console.MoveCursor 0,0
	If Err.Number <> 0 Then WScript.Quit
	On Error Goto 0
	Console.WriteText GetStr(y)
	'WScript.Echo String(UBound(y)+1,"-")
	'WScript.Echo GetStr(y)
	WScript.Sleep 10
Wend

Function GetStr(Arr)
	Dim Str
	Str = ""
	For i = 0 To UBound(Arr)
		Str = Str & Join(Arr(i),"") & vbNewLine
	Next
	GetStr = Str
End Function