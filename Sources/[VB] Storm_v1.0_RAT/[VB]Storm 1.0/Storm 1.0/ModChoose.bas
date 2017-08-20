Attribute VB_Name = "ModChoose"
Public Sub Choose()
'Open the Common Dialog Color selector
On Error Resume Next
frmScreenSave.CommonDialog1.ShowColor

'Give the Picture the color you choose as back color

frmScreenSave.lbltextcolor.BackColor = frmScreenSave.CommonDialog1.Color

'Divide the R G and B to get 3 color of a range from 0 to 255.

r = frmScreenSave.CommonDialog1.Color And 255
g = (frmScreenSave.CommonDialog1.Color \ 256) And 255
b = (frmScreenSave.CommonDialog1.Color \ 65536) And 255

'Give the value to the RGB Label

frmScreenSave.textcolor.Caption = r & " " & g & " " & b

End Sub

Public Sub Choose2()
' same function as above
frmScreenSave.CommonDialog1.ShowColor
frmScreenSave.lblbackcolor.BackColor = frmScreenSave.CommonDialog1.Color
r = frmScreenSave.CommonDialog1.Color And 255
g = (frmScreenSave.CommonDialog1.Color \ 256) And 255
b = (frmScreenSave.CommonDialog1.Color \ 65536) And 255
frmScreenSave.labelbackcolor.Caption = r & " " & g & " " & b
End Sub

Public Sub Choose3()
' same function as above
frmColor.CommonDialog1.ShowColor
frmColor.lblmenucolor.BackColor = frmColor.CommonDialog1.Color
End Sub

Public Sub Choose4()
' same function as above
frmColor.CommonDialog1.ShowColor
frmColor.lblfacecolor.BackColor = frmColor.CommonDialog1.Color
End Sub

Public Sub Choose5()
' same function as above
frmColor.CommonDialog1.ShowColor
frmColor.lblwindowcolor.BackColor = frmColor.CommonDialog1.Color
End Sub
