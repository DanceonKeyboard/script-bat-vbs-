Rem 使用百度云二维码API
Option Explicit
Const [二维码宽] = 500
Const [二维码高] = 500
Dim strURL
strURL = Replace(Replace(InputBox("输入文本：" & vbNewLine & _
"\r = 回车符" & vbNewLine & "\n = 换行符","二维码生成工具"),"\r",vbCr),"\n",vbLf)
If Not strURL = "" Then
	With CreateObject("InternetExplorer.Application")
		.AddressBar = False
		.MenuBar = False
		.Resizable = False
		.StatusBar = False
		.ToolBar = False
		.Width = [二维码宽] * 1.2
		.Height = [二维码高] * 1.2
		.Visible = True
		.Navigate "http://pan.baidu.com/share/qrcode?w=" & [二维码宽]& _
		"&h=" & [二维码高] & "&url=" &strURL
	End With
End If
strURL = Empty
Rem objIE.Quit
Rem 不退出，保留窗口。