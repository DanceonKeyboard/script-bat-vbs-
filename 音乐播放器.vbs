set Music= createobject("MCI.mmcontrol") 
set Dlg= CreateObject("MSComDlg.CommonDialog")

play

If Dlg.filename<>"" Then
  Do
     c=msgbox("播放---|拨放请按下[是]|暂停请按下[否]|要重新打开一个文件请按下[取消]",64+3+4096,"wuditom100 VBScript")
     
          Music.Command="STOP"
          Music.command="CLOSE"
    Select Case c
       Case 6   '确定
          Music.Command="OPEN"
          Music.command="PLAY"
       Case 2  '取消
       Dlg.FileName=""
          play
    End select
Loop

Else
   MsgBox "没有选择的文件,是否退出?",64
End If

Sub play()

   Dlg.DialogTitle="打开一个文件"
   Dlg.Filter="所有支持的文件(*.avi;*.wav;*.mid;*.mp3)|*.avi;*.wav;*.mid;*.mp3|音乐文件(*.wav;*.mid;*.mp3)|*.wav;*.mid;*.mp3|视频文件(*.avi)|*.avi|所有文件|*.*"
   Dlg.MaxFileSize=260
   Dlg.flags=4
   Dlg.action=1
If Dlg.FileName="" then
    MsgBox "没有选择的文件,是否退出?",64
    WScript.Quit
else
  Music.filename =Dlg.filename
  Music.command="OPEN"
  Music.command="PLAY"
End if  
End sub