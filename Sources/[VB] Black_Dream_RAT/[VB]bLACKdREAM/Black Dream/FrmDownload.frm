VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FrmDownload 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Download file"
   ClientHeight    =   1995
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6585
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmDownload.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1995
   ScaleWidth      =   6585
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer 
      Interval        =   1
      Left            =   960
      Top             =   0
   End
   Begin MSWinsockLib.Winsock WinSockCtl 
      Left            =   480
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "C&ancel"
      Height          =   375
      Left            =   4080
      TabIndex        =   6
      Top             =   1440
      Width           =   1095
   End
   Begin VB.CommandButton CmdDownload 
      Caption         =   "&Download"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5280
      TabIndex        =   5
      Top             =   1440
      Width           =   1095
   End
   Begin VB.CommandButton CmdSpecify 
      Caption         =   "&Save As"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   5280
      TabIndex        =   4
      Top             =   840
      Width           =   1095
   End
   Begin VB.TextBox SaveToText 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   960
      Locked          =   -1  'True
      TabIndex        =   3
      Text            =   "C:\"
      Top             =   840
      Width           =   4215
   End
   Begin VB.TextBox FileDownload 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   1800
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   360
      Width           =   4575
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmDownload.frx":08CA
      Top             =   1320
      Width           =   480
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Save to:"
      Height          =   195
      Left            =   240
      TabIndex        =   2
      Top             =   840
      Width           =   615
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "File to download:"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   240
      TabIndex        =   0
      Top             =   360
      Width           =   1410
   End
End
Attribute VB_Name = "FrmDownload"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim TransferFileOpen As Boolean
Dim AppendToFile As Boolean
Dim LoadedSize As Boolean
Dim FileBinary As String
Dim FileNumber As Long
Dim TotalBytes As Long
Dim FoundBytes As Long
Dim GotBytes As Long

Private Sub CmdCancel_Click()
    If FrmBusy.Visible = True Then Unload FrmBusy
    WinSockCtl.Close
    Unload Me
End Sub

Private Sub CmdDownload_Click()

    On Error GoTo FinaliseError
    
    If CmdDownload.Caption = "&Close" Then
        Unload Me
        Exit Sub
    End If

    CmdDownload.Enabled = False
    CmdSpecify.Enabled = False

    WinSockCtl.Close
    
    WinSockCtl.Connect FrmMain.IPConnect, 4433
        
    Do Until WinSockCtl.State <> 6
        DoEvents: Loop
    
    FrmMain.WinSockCtl.SendData "1-0" & FileDownload.Text
    
    Exit Sub
    
FinaliseError:
    
    MsgBox "Error, could not download file.", vbCritical, "Error"
    CmdDownload.Caption = "&Close"
    CmdDownload.Enabled = True
    CmdCancel.Enabled = False
    WinSockCtl.Close

End Sub

Private Sub CmdSpecify_Click()
    
    On Error GoTo FinaliseError
    
    CommonDialog.flags = &H400 + &H4 + &H8 + &H2 + &H800
    CommonDialog.DialogTitle = "Save File As..."
    CommonDialog.Filter = "All files (*.*)|*.*"
    CommonDialog.ShowSave
    If CommonDialog.FileName = "" Then Exit Sub
    SaveToText.Text = CommonDialog.FileName
    Exit Sub
    
FinaliseError:
    If Err = 32755 Then
        Exit Sub
            Else
        MsgBox "An unknown error occured.", vbCritical, "Error"
    End If

End Sub

Private Sub Form_Load()
    Me.Caption = "Download file from remote host (" & FrmMain.WinSockCtl.RemoteHostIP & ")"
    If FrmFileBrowse.ListFiles.SelectedItem.Text = "" Then MsgBox "Their is no file selected.", vbInformation, "Download": Unload Me: Exit Sub
    FileDownload.Text = FrmFileBrowse.TextDirectory.Text
    If Right(FileDownload.Text, 1) <> "\" And Right(FileDownload.Text, 1) <> "/" Then FileDownload.Text = FileDownload.Text & "\"
    FileDownload.Text = FileDownload.Text & FrmFileBrowse.ListFiles.SelectedItem.Text
    SaveToText.Text = SaveToText.Text & FrmFileBrowse.ListFiles.SelectedItem.Text
End Sub

Private Sub WinsockCtl_Close()
    WinSockCtl.Close
End Sub

Private Sub WinsockCtl_Connect()
    If WinSockCtl.State <> 7 Then WinSockCtl.Close
End Sub

Private Sub WinSockCtl_DataArrival(ByVal bytesTotal As Long)

    On Error Resume Next
    
    WaitTime = 0
    Do Until WaitTime = 1
        WaitTime = WaitTime + 1: DoEvents
        Loop 'Pausing it helps the file be written before the next data blocks arrive
    
    If TransferFileOpen = False Then
        LoadedSize = False
        TotalBytes = 0
        FoundBytes = 0
        GotBytes = 0
        FileBinary = ""
        FrmBusy.Show
        FileNumber = FreeFile
        Close #FileNumber
        Open SaveToText For Binary Access Write As #FileNumber
            TransferFileOpen = True
            AppendToFile = True
    Else
        DoEvents
    End If
    
    Dim Data As String
    WinSockCtl.GetData Data

    If LoadedSize = False Then
        TotalBytes = CLng(Right(Data, Len(Data) - 1))
        LoadedSize = True
    Else
        If AppendToFile = True Then
            GotBytes = GotBytes + Len(Data)
            
            If (GotBytes / TotalBytes) * 100 > 100 Then
                FrmBusy.Progress.Value = 100
                FrmBusy.lbldescription.Caption = "Downloading file (" & FrmFileBrowse.ListFiles.SelectedItem.Text & "), (" & FormatKB(TotalBytes) & ", " & TotalBytes & " Bytes) of (" & FormatKB(TotalBytes) & ", " & TotalBytes & " Bytes) Complete"
                FrmBusy.Caption = "File transfer Complete"
            Else
                FrmBusy.Progress.Value = (GotBytes / TotalBytes) * 100
                FrmBusy.lbldescription.Caption = "Downloading file (" & FrmFileBrowse.ListFiles.SelectedItem.Text & "), (" & FormatKB(GotBytes) & ", " & GotBytes & " Bytes) of (" & FormatKB(TotalBytes) & ", " & TotalBytes & " Bytes) Complete"
                FrmBusy.Caption = "Processing please wait..." & CLng(FrmBusy.Progress.Value) & "%"
            End If
            
            If GotBytes >= TotalBytes Then
                AppendToFile = False
                Put #FileNumber, , Left(Data, Len(Data) - (GotBytes - TotalBytes) - 4)
                Close #FileNumber
                Unload FrmBusy
                TransferFileOpen = False
                CmdCancel.Enabled = False
                CmdDownload.Caption = "&Close"
                CmdDownload.Enabled = True
                MsgBox "File transfer complete.", vbInformation, "Download"
            Else
                FoundBytes = FoundBytes + Len(Data)
                Put #FileNumber, , Data
            End If
        End If
    End If
    
    Exit Sub
    
FinaliseError:

    If FrmBusy.Visible = True Then Unload FrmBusy
    MsgBox "Error, could not download file.", vbCritical, "Error"
    TransferFileOpen = False 'This is so that not all data is lost after error position
                             'If still transfering
    CmdDownload.Caption = "&Close"
    CmdDownload.Enabled = True
    CmdCancel.Enabled = False
    Close #FileNumber
    WinSockCtl.Close
    
End Sub

Private Sub WinSockCtl_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    
    If FrmBusy.Visible = True Then Unload FrmBusy
    MsgBox "Error, " & Scode & " " & Description & ", (could not download file).", vbCritical, "Error"
    CmdDownload.Caption = "&Close"
    CmdDownload.Enabled = True
    CmdCancel.Enabled = False
    Close #FileNumber
    WinSockCtl.Close
    
End Sub
