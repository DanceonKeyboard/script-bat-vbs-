Const [�ٶ�] = 0
Const [����] = 100
Const [TXT] = "�½��ı��ĵ�.txt"

Dim fso,SpV,SpFS,output,text

Set fso = CreateObject("Scripting.FileSystemObject")
If Not (fso.FileExists([TXT]) And LCase(fso.GetExtensionName([TXT]))="txt") Then
	MsgBox "�ļ������ڻ��� .txt"
	WScript.Quit
End If

output = fso.GetBaseName([TXT])&".wav"
text = fso.OpenTextFile([TXT],1).ReadAll()
text = Replace(text,vbCr,"��")
text = Replace(text,vbLf,"��")

Set SpV = CreateObject("SAPI.SpVoice")
SpV.GetAudioOutputs
SpV.Rate = [�ٶ�]
SpV.Volume = [����]

Set SpFS = CreateObject("SAPI.SpFileStream")
SpFS.Open output,3,False

Set SpV.AudioOutputStream = SpFS
SpV.Speak text
Do : Loop Until SpV.WaitUntilDone(100)
SpFS.Close

MsgBox "Bingo!"