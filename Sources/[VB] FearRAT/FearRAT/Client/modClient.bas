Attribute VB_Name = "modClient"
' modClient.bas  -  FEAR Client

Public Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Public Const SWP_NOSIZE = &H1
Public Const SWP_NOMOVE = &H2
Public Const HWND_TOPMOST = -1
Public Const FLAGS = SWP_NOSIZE Or SWP_NOMOVE

Global dir

Public Sub SD(data As String)
If frmMain.WS.State <> 7 Then
errmsg "Your Not Connected To Anyone!"
Exit Sub
End If
frmMain.WS.SendData data$
End Sub

Sub DispDrives(Drives)
Drives = UCase(Drives) & Chr(13) & Chr(10)
frmMain.cmbDrives.Clear
Dim blob1, blob2
blob1 = 1
For i = 1 To Len(Drives)
    If Mid(Drives, i, 1) = Chr(13) Then
        blob2 = i - 2
        frmMain.cmbDrives.AddItem Mid(Drives, blob1, (blob2 - blob1) + 2)
        blob1 = blob2 + 4
    End If
Next i
dir = "C:\"
frmMain.cmbDrives.Text = "C:\"
End Sub

Sub DispFiles(Files)
frmMain.List1.Clear
frmMain.List1.AddItem ".."
Dim blob1, blob2
blob1 = 1
For i = 1 To Len(Files)
    If Mid(Files, i, 1) = Chr(13) Then
        blob2 = i - 2
        frmMain.List1.AddItem Mid(Files, blob1, (blob2 - blob1) + 2)
        blob1 = blob2 + 4
    End If
Next i
frmMain.lbldriveinf.Caption = frmMain.List1.ListCount - 1 & " files/subdirectories in " & frmMain.cmbDrives.Text
End Sub

Public Sub errmsg(message As String)
frmerr.err = message$
frmerr.Show , frmMain
End Sub

Public Function StayOnTop(TheForm As Form)
Dim SetWinOnTop As Long
SetWinOnTop = SetWindowPos(TheForm.hwnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS)
End Function
