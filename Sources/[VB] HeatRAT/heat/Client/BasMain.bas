Attribute VB_Name = "BasMain"


Function CorrectReservedChars(InputString As String) As String
CorrectReservedChars = InputString

CorrectReservedChars = Replace(CorrectReservedChars, "&", "&0")
CorrectReservedChars = Replace(CorrectReservedChars, ";", "&1")
CorrectReservedChars = Replace(CorrectReservedChars, "§", "&2")
CorrectReservedChars = Replace(CorrectReservedChars, "ê", "&3")

End Function

Function RetrieveReservedChars(InputString As String)
Dim LeftString As String, RightString As String
Dim CurrentPos As Single
RetrieveReservedChars = InputString

CurrentPos = InStr(1, RetrieveReservedChars, "&")

Do Until CurrentPos = 0
    
    Select Case Mid(RetrieveReservedChars, CurrentPos + 1, 1)
    Case "0"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "&" & RightString
    Case "1"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & ";" & RightString
    Case "2"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "§" & RightString
    Case "3"
        LeftString = Mid(RetrieveReservedChars, 1, CurrentPos - 1)
        RightString = Mid(RetrieveReservedChars, CurrentPos + 2)
        RetrieveReservedChars = LeftString & "ê" & RightString
    End Select
    
    CurrentPos = InStr(CurrentPos + 1, RetrieveReservedChars, "&")
Loop

End Function

Sub AddToTransferQueue(TransferType As String, Source As String, Destination As String, FileSize As Long)
Dim FileSizeStr As String
'On Error Resume Next

If FileSize < 1024 Then
    FileSizeStr = FileSize & " bytes"
Else
    FileSizeStr = Int(FileSize / 1024) & " kilobytes"
End If

Randomize

Set LstVw = frmMain.lstTransfers.ListItems.Add(, , TransferType)

LstVw.SubItems(1) = Source
LstVw.SubItems(2) = Destination
LstVw.SubItems(3) = FileSizeStr

End Sub

Public Sub FormDrag(TheForm As Form)
'Makes form move when user clicks on TitleBar labels
    ReleaseCapture
    Call SendMessage(TheForm.hwnd, WM_NCLBUTTONDOWN, HTCAPTION, 0&)
End Sub

Public Function Send(Data As String)
On Error GoTo ErrorHandler
'Sends data to server
frmMain.wsk.SendData Data & "§"
SendData Len(Data)

If frmDebug.lstSent.ListCount > 255 Then frmDebug.lstSent.RemoveItem (frmDebug.lstSent.ListCount - 1)
frmDebug.lstSent.AddItem "<" & Time & ">" & "(" & frmMain.wsk.RemoteHostIP & "): " & Data, 0

Exit Function
ErrorHandler:
Status "You are not connected to a host."
ReportError "Send", "No Connection"
End Function

Public Function Status(Data As String)
frmMain.tmrAuthour.Enabled = False
frmMain.tmrWait.Enabled = False
frmMain.tmrWait.Enabled = True
frmMain.lblMessage.Left = 0
frmMain.lblMessage.Width = frmMain.Width
frmMain.lblMessage.Caption = Data

frmMain.txtLog.Text = frmMain.txtLog.Text & vbCrLf & "<" & Time & "> " & Data & vbCrLf
frmMain.txtLog.SelStart = Len(frmMain.txtLog.Text)
End Function

Public Sub ReceiveData(Bytes As Single)
Received = Received + Bytes
frmMain.txtBytesReceived.Text = SimplifyFileSize(CLng(Received))
End Sub

Public Sub SendData(Bytes As Single)
Sent = Sent + Bytes
frmMain.txtBytesSent.Text = SimplifyFileSize(CLng(Sent))
End Sub

Public Sub ReportError(FunctionName As String, Description As String)
frmDebug.lstLocalErrors.AddItem "<" & Time & "> " & "(" & FunctionName & "): " & Description

Select Case LCase(FunctionName)
Case "filetransfer.upload"
    Reset
    tTransfer = False
    NextInQueue
Case "filetransfer.download"
    Reset
    tTransfer = False
    NextInQueue
End Select

End Sub

Sub SendFile(BufferLevel As Long)
'On Error GoTo ErrorHandler
Dim BufferData As String, FileNumber As Single, bytesTotal As Long, BytesSent As Long
Dim Timeout As Single

Reset
BufferLevel = 1024
tFileNumber = FreeFile
FileNumber = tFileNumber

Open tSource For Binary Access Read As tFileNumber

    tTotalBytes = LOF(FileNumber)
    frmMain.pbTransfer.Max = tTotalBytes
    frmMain.txtTransferDestination.Text = tDestination
    frmMain.txtTransferSource.Text = Source
    frmMain.txtTransferType.Caption = "Upload"
    
Do Until Loc(FileNumber) >= LOF(FileNumber)

   
    If LOF(FileNumber) - Loc(FileNumber) < BufferLevel Then
        BufferData = Space(LOF(FileNumber) - Loc(FileNumber))
        tBytesThisSecond = tBytesThisSecond + (LOF(FileNumber) - Loc(FileNumber))
    Else
        BufferData = Space(BufferLevel)
        tBytesThisSecond = tBytesThisSecond + BufferLevel
    End If
    
    Get FileNumber, , BufferData
        
    Do While tPaused = True
        DoEvents
        If tTerminated = True Then GoTo ErrorHandler
    Loop
      
    Send "fd;" & BasMain.CorrectReservedChars(BufferData)
    
    tBytesDone = Loc(FileNumber)
    SetTransferStats
        
    Timeout = 1000000
        
    'Do While tBlockSent = False
    '
    '    If tTerminated = True Then GoTo ErrorHandler
    '
    '    If Timeout < 1 Then
    '        Send "faction;terminate"
    '        ReportError "SendFile", "Timed out waiting for a response."
    '        GoTo ErrorHandler
    '    End If
    '
    '    If frmMain.wsk.State <> sckConnected Then GoTo ErrorHandler
    '    Timeout = Timeout - 1
    '    DoEvents
    'Loop
    
    tPaused = False
    tBlockSent = False
Loop


Close FileNumber

tTransfer = False
tFileNumber = 0
Send "faction;done"
BasMain.NextInQueue

Exit Sub

ErrorHandler:
    tTransfer = False
    tFileNumber = 0
    Reset
    NextInQueue
End Sub

Sub ReceiveFile(Data As String, bytesTotal As Long)

If tFileNumber = 0 Then
    Reset
    tFileNumber = FreeFile
    Open tDestination For Binary Access Write As tFileNumber
End If

tBytesDone = tBytesDone + bytesTotal
tBytesThisSecond = tBytesThisSecond + bytesTotal

SetTransferStats
Put tFileNumber, , Data

'If tBytesDone > tTotalBytes Then
'    Reset
'    tTransfer = False
'    tFileNumber = 0
'    Status "received file '" & tDestination & "'"
'    BasMain.NextInQueue
'    Exit Sub
'End If

Exit Sub

ErrorHandler:
    Reset
    tFileNumber = 0
    tTransfer = False
    Send "faction;terminate"
    ReportError "receiveFile", "Error receiveing file (" & Err.Description & ")"
    BasMain.NextInQueue
End Sub

Function SimplifyDirectory(DirectoryPath As String) As String
Dim Temp() As String

Temp() = Split(DirectoryPath, "\")

For i = 0 To UBound(Temp) - 1
    If Temp(i) = "" Then GoTo NextStr
    SimplifyDirectory = SimplifyDirectory & Temp(i) & "\"
NextStr:
Next i

End Function

Public Sub SetTransferStats()
On Error Resume Next
With basDeclare.FileTransfer
    frmMain.txtTransferBytes.Caption = SimplifyFileSize(.TotalBytesTransfered) & " of " & SimplifyFileSize(.TotalBytes)
    
    If .TotalBytes >= .TotalBytesTransfered Then
        frmMain.pbTransfer.Value = .TotalBytesTransfered
    End If
    
End With
End Sub

Sub NextInQueue()
Dim FileNumber As Single, Direction As String, Source As String, Destination As String, FileSize As String, LstItem As ListItem

If basDeclare.FileTransfer.FileTransfer = True Then Exit Sub

If frmMain.lstTransfers.ListItems.Count = 0 Then
    Status "Transfer queue completed."
    frmMain.txtTransferType.Caption = "None"
    frmMain.txtTransferDestination.Text = ""
    frmMain.txtTransferSource.Text = ""
    frmMain.txtTransferBytes.Caption = ""
    frmMain.pbTransfer.Value = 0
    tTransfer = False
    Exit Sub
End If

Set LstItem = frmMain.lstTransfers.ListItems(1)

Direction = LstItem.Text
Source = LstItem.SubItems(1)
Destination = LstItem.SubItems(2)

Select Case LCase(Direction)
Case "upload"
    With basDeclare.FileTransfer
        .FileTransfer = True
        .DestinationFile = Destination
        .SourceFile = Source
        .Direction = "upload"
        .BufferLevel = 2048
        .TransferFileNumber = 0
    End With
    
    
    Send "faction;receive;" & Source & "*" & Destination & "*" & FileLen(Source)
    
    frmMain.txtTransferType.Caption = "Upload"
    frmMain.txtTransferDestination.Text = tDestination
    frmMain.txtTransferSource.Text = tSource
    
Case "download"
    
    If tPaused = False Then Send "transfer;pause;0" Else Send "transfer;pause;1"
    
    Send "faction;send;" & Source & "*" & Destination
    
    basDeclare.FileTransfer.FileTransfer = True
    frmMain.txtTransferType.Caption = "Download"
    frmMain.txtTransferDestination.Text = Destination
    frmMain.txtTransferSource.Text = Source
    
End Select

ErrorHandler:
frmMain.lstTransfers.ListItems.Remove 1
End Sub

Function SimplifyFileSize(FileSize As Long) As String

If FileSize < 1024 Then
    SimplifyFileSize = FileSize & " bytes"
ElseIf FileSize >= 1024 And FileSize < 1024 ^ 2 Then
    SimplifyFileSize = Round(FileSize / 1024, 2) & " KB"
Else
    SimplifyFileSize = Round(FileSize / 1024 ^ 2, 2) & " MB"
End If

End Function

    'Private NEW_OK_TEXT As String

Private Function GetAddressofFunction(Add As Long) As Long

    GetAddressofFunction = Add
End Function

Private Function BrowseCallbackProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal lp As Long, ByVal pData As Long) As Long
    On Local Error Resume Next
    Dim lpIDList As Long, ret As Long, sBuffer As String, qwe As String

    Select Case uMsg
    
    Case BFFM_INITIALIZED
        
        SendMessage hwnd, BFFM_SETSELECTION, 1, m_CurrentDirectory
    
    Case BFFM_SELCHANGED
        
        sBuffer = Space(MAX_PATH)
        ret = SHGetPathFromIDList(lp, sBuffer)

        If ret = 1 Then
            SendMessage hwnd, BFFM_SETSTATUSTEXT, 0, sBuffer
        End If

    End Select

BrowseCallbackProc = 0
End Function

Function BrowseForFolder(Optional ByVal Title As String = "", Optional ByVal RootDir As String = "", Optional ByVal StartDir As String = "", Optional Owner As Form = Nothing, Optional ByVal NewStyle As Boolean = True, Optional ByVal IncludeFiles As Boolean = False) As String
    Dim lpIDList As Long, lpIDList2 As Long, IDL As ITEMIDLIST
    Dim sBuffer As String, tBrowseInfo As BrowseInfo, r As Long

    If Len(RootDir) > 0 Then

        If PathIsDirectory(RootDir) Then
            SHParseDisplayName StrPtr(RootDir), ByVal 0&, lpIDList2, ByVal 0&, ByVal 0&
            tBrowseInfo.pIDLRoot = lpIDList2
        Else
            r = SHGetSpecialFolderLocation(ByVal 0&, &H11, IDL) ' get "My Computer" Folder
            If r = 0 Then tBrowseInfo.pIDLRoot = IDL.mkid.cb
        End If

    Else
        r = SHGetSpecialFolderLocation(ByVal 0&, &H11, IDL) ' get "My Computer" Folder
        If r = 0 Then tBrowseInfo.pIDLRoot = IDL.mkid.cb
    End If


    If Len(StartDir) > 0 Then
        m_CurrentDirectory = StartDir & vbNullChar
    Else
        m_CurrentDirectory = vbNullChar
    End If


    If Len(Title) > 0 Then
        tBrowseInfo.lpszTitle = lstrcat(Title, "")
    Else
        tBrowseInfo.lpszTitle = lstrcat("Select A Directory", "")
    End If

    tBrowseInfo.lpfnCallback = GetAddressofFunction(AddressOf BrowseCallbackProc)
    tBrowseInfo.ulFlags = BIF_RETURNONLYFSDIRS
    If IncludeFiles Then tBrowseInfo.ulFlags = tBrowseInfo.ulFlags + BIF_BROWSEINCLUDEFILES


    If NewStyle Then
        tBrowseInfo.ulFlags = tBrowseInfo.ulFlags + BIF_NEWDIALOGSTYLE + BIF_UAHINT
        OleInitialize Null ' Initialize OLE and COM
    Else
        tBrowseInfo.ulFlags = tBrowseInfo.ulFlags + BIF_STATUSTEXT
    End If

    If Not (Owner Is Nothing) Then tBrowseInfo.hWndOwner = Owner.hwnd
    lpIDList = SHBrowseForFolder(tBrowseInfo)


    If Len(RootDir) > 0 Then
        If PathIsDirectory(RootDir) Then CoTaskMemFree lpIDList2
    End If


    If (lpIDList) Then
        sBuffer = Space(MAX_PATH)
        SHGetPathFromIDList lpIDList, sBuffer
        CoTaskMemFree lpIDList
        sBuffer = Left(sBuffer, InStr(sBuffer, vbNullChar) - 1)
        BrowseForFolder = sBuffer
    Else
        BrowseForFolder = ""
    End If

End Function

Function TrueFalseToNumber(TF As Boolean) As Integer
    If TF = True Then
        TrueFalseToNumber = 1
    Else
        TrueFalseToNumber = 0
    End If
End Function
