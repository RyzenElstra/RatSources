VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsFileTransfer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Declare Function GetTickCount Lib "kernel32" () As Long

Public SourceFile As String, DestinationFile As String, TransferFileNumber As Integer
Public Direction As String, FileTransfer As Boolean, BufferLevel As Long, BlockSent As Boolean
Public TotalBytesTransfered As Long, TotalBytes As Long
Public Cancel As Boolean, Pause As Boolean

Public Function SendFile()
    Dim Data As String, SentTime As Long
    FileTransfer = True
    Cancel = False
    
    BufferLevel = 5120

    TransferFileNumber = FreeFile
    Open SourceFile For Binary Access Read As TransferFileNumber
    
    TotalBytes = LOF(TransferFileNumber)
    TotalBytesTransfered = 0
    
    Do Until TotalBytesTransfered >= TotalBytes
        
        If TotalBytes - TotalBytesTransfered < BufferLevel Then
            Data = String(TotalBytes - TotalBytesTransfered, Chr(0))
            Get TransferFileNumber, , Data
        Else
            Data = String(BufferLevel, Chr(0))
            Get TransferFileNumber, , Data
        End If
        
        BlockSent = False
        
        Do Until Pause = False
            DoEvents
        Loop
        
        modMain.Send "fd;" & modMain.CorrectReservedChars(Data)
        SentTime = GetTickCount
        
        TotalBytesTransfered = Loc(TransferFileNumber)
        
        
        Do Until BlockSent = True
            DoEvents
            If FileTransfer = False Or Cancel = True Then GoTo ErrorHandler
            If (GetTickCount - SentTime) / 1000 >= 5 Then Exit Do
        Loop
        
    Loop
    Close TransferFileNumber
    
    Send "faction;done"
    
    FileTransfer = False
    Exit Function
ErrorHandler:
    modMain.SendError "clsFileTransfer.ReceiveFile", "#" & Err.Number & ": " & Err.Description
    modMain.Send "faction;terminate"
    modProcess.FileAction "terminate"
End Function

Public Function ReceiveFile(Data As String)
    On Error GoTo ErrorHandler
    
    If FileTransfer = False Then GoTo ErrorHandler
    
    If FileIsOpen(TransferFileNumber) = False Then
        If TransferFileNumber = 0 Then
            TransferFileNumber = FreeFile
        End If
        Open DestinationFile For Binary Access Write As TransferFileNumber
    End If
    
    Put TransferFileNumber, , Data
    TotalBytesTransfered = TotalBytesTransfered + Len(Data)
        
    Exit Function
ErrorHandler:
    FileTransfer = False
    modMain.Send "faction;terminate"
    modMain.SendError "clsFileTransfer.receiveFile", "#" & Err.Number & ": " & Err.Description
End Function

Private Function FileIsOpen(FileNumber As Integer) As Boolean
    On Error GoTo ErrorHandler
    
    Loc FileNumber
    
    FileIsOpen = True
    
    Exit Function
ErrorHandler:
    FileIsOpen = False
End Function
