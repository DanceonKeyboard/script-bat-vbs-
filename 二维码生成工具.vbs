Rem ʹ�ðٶ��ƶ�ά��API
Option Explicit
Const [��ά���] = 500
Const [��ά���] = 500
Dim strURL
strURL = Replace(Replace(InputBox("�����ı���" & vbNewLine & _
"\r = �س���" & vbNewLine & "\n = ���з�","��ά�����ɹ���"),"\r",vbCr),"\n",vbLf)
If Not strURL = "" Then
	With CreateObject("InternetExplorer.Application")
		.AddressBar = False
		.MenuBar = False
		.Resizable = False
		.StatusBar = False
		.ToolBar = False
		.Width = [��ά���] * 1.2
		.Height = [��ά���] * 1.2
		.Visible = True
		.Navigate "http://pan.baidu.com/share/qrcode?w=" & [��ά���]& _
		"&h=" & [��ά���] & "&url=" &strURL
	End With
End If
strURL = Empty
Rem objIE.Quit
Rem ���˳����������ڡ�