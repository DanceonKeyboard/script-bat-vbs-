<html>
<title>五子棋界面 - zh159</title>
<hrad>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<HTA:APPLICATION
ID="MyhyliApp"
APPLICATIONNAME="五子棋界面 - zh159"
BORDER="thin"
BORDERSTYLE=""
VERSION="1.0"
SCROLL="no"
ICON="C:\WINDOWS\System32\wuauclt.exe"
INNERBORDER="no"
CONTEXTMENU="no"
CAPTION="yes"
MAXIMIZEBUTTON="no"
MINIMIZEBUTTON="yes"
SHOWINTASKBAR="yes"
SINGLEINSTANCE="yes"
SYSMENU="yes"
WINDOWSTATE="normal"
NAVIGABLE="yes"
/>
</hrad>

<script language="javascript"></script>
<script language="VBScript"></script>

<style>
.GUIwh {width:24;height:24;cursor:hand;}
</style>

<body background="bg.gif" scroll="no" style="background: SteelBlue ;color:#ffffff;">

<table align="center" width="630" border="1" cellspacing="0" cellpadding="10" borderColor="#ffffff" style="font: 13px 宋体;border-collapse:collapse;">
  <tr align="center">
    <td width="450" height="450">
      <table border="0" cellspacing="0" cellpadding="0" borderColor="#ffffff" style="font: 21px 宋体;border:2px solid #ffffff;">
        <script language="VBScript">
        str = "ABCDEFGHIJKLMNOPQRS"
        For i = 1 To Len(str)
                with document
                .write "<tr align='center'>"
                For n = 1 To Len(str)
                        stri = MID(str,i,1)
                        strn = MID(str,n,1)
                        tdstr = "<td id='GUI_" & strn & stri & "' class='GUIwh'><span onclick='Test(this)' onMouseOver='innerText=""●"";style.color=""blue""' onMouseOut='innerText=""┼"";style.color=""""'>┼</span></td>"
                        s = "┼"

                        If (stri = "A" and strn = "A") Then .write Replace(tdstr,s,"┌")
                        If stri = "A" Then If not (strn = "A" or strn = "S") Then .write Replace(tdstr,s,"┬")
                        If (stri = "A" and strn = "S") Then .write Replace(tdstr,s,"┐")

                        If not (stri = "A" or stri = "S") Then If strn = "A" Then .write Replace(tdstr,s,"├")
                        If not (stri = "A" or stri = "S" or strn = "A" or strn = "S") Then .write tdstr
                        If not (stri = "A" or stri = "S") Then If strn = "S" Then .write Replace(tdstr,s,"┤")
                       
                        If (stri = "S" and strn = "A") Then .write Replace(tdstr,s,"└")
                        If stri = "S" Then If not (strn = "A" or strn = "S") Then .write Replace(tdstr,s,"┴")
                        If (stri = "S" and strn = "S") Then .write Replace(tdstr,s,"┘")
                Next
                .write "</tr>"
                end with
        Next
        </script>
      </table>
    </td>
    <td>
      <span id="PC"><button>电脑先下</button><br><br>直接点击为玩家先下</span>
    </td>
  </tr>
</table>
</body>

<script language="VBScript">

  width = 660
  height = 550
  window.resizeTo width, height
  ileft=(window.screen.width-width)/2
  itop=(window.screen.height-height)/2
  window.moveTo ileft,itop

        Sub Test(this)
this.parentNode.style.cursor = "default"
this.parentNode.innerHtml = "●"
PC.style.display = "none"
        End Sub


        Sub Title
Document.title = "五子棋 - zh159 - " & FormatDateTime(Now, 1) & "  " & WeekdayName(WeekDay(now)) & "  " & FormatDateTime(Now, 3)
        End Sub

Title:setInterval "Title()",500

</script>

</html>