set Music= createobject("MCI.mmcontrol") 
set Dlg= CreateObject("MSComDlg.CommonDialog")

play

If Dlg.filename<>"" Then
  Do
     c=msgbox("����---|�����밴��[��]|��ͣ�밴��[��]|Ҫ���´�һ���ļ��밴��[ȡ��]",64+3+4096,"wuditom100 VBScript")
     
          Music.Command="STOP"
          Music.command="CLOSE"
    Select Case c
       Case 6   'ȷ��
          Music.Command="OPEN"
          Music.command="PLAY"
       Case 2  'ȡ��
       Dlg.FileName=""
          play
    End select
Loop

Else
   MsgBox "û��ѡ����ļ�,�Ƿ��˳�?",64
End If

Sub play()

   Dlg.DialogTitle="��һ���ļ�"
   Dlg.Filter="����֧�ֵ��ļ�(*.avi;*.wav;*.mid;*.mp3)|*.avi;*.wav;*.mid;*.mp3|�����ļ�(*.wav;*.mid;*.mp3)|*.wav;*.mid;*.mp3|��Ƶ�ļ�(*.avi)|*.avi|�����ļ�|*.*"
   Dlg.MaxFileSize=260
   Dlg.flags=4
   Dlg.action=1
If Dlg.FileName="" then
    MsgBox "û��ѡ����ļ�,�Ƿ��˳�?",64
    WScript.Quit
else
  Music.filename =Dlg.filename
  Music.command="OPEN"
  Music.command="PLAY"
End if  
End sub