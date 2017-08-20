VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form FrmUpload 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Upload to server"
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
   Icon            =   "FrmUpload.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1995
   ScaleWidth      =   6585
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdSaveAs 
      Caption         =   "&Open"
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
      TabIndex        =   6
      Top             =   360
      Width           =   1095
   End
   Begin VB.TextBox FileUpload 
      BackColor       =   &H8000000F&
      Height          =   285
      Left            =   1560
      Locked          =   -1  'True
      TabIndex        =   3
      Top             =   360
      Width           =   3615
   End
   Begin VB.TextBox SaveToText 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Top             =   840
      Width           =   5415
   End
   Begin VB.CommandButton CmdUpload 
      Caption         =   "&Upload"
      Default         =   -1  'True
      Enabled         =   0   'False
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
      TabIndex        =   1
      Top             =   1440
      Width           =   1095
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "C&ancel"
      Height          =   375
      Left            =   4080
      TabIndex        =   0
      Top             =   1440
      Width           =   1095
   End
   Begin MSWinsockLib.Winsock WinSockCtl 
      Left            =   480
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog CommonDialog 
      Left            =   0
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "File to upload:"
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
      TabIndex        =   5
      Top             =   360
      Width           =   1170
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Save to:"
      Height          =   195
      Left            =   240
      TabIndex        =   4
      Top             =   840
      Width           =   615
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   240
      Picture         =   "FrmUpload.frx":08CA
      Top             =   1320
      Width           =   480
   End
End
Attribute VB_Name = "FrmUpload"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Send_File(FileName As String)
    
    Dim FileNumber As Integer
    Dim FileBinary As String
    Dim BlockSize As Integer
    Dim SentSize As Long
    
    FileNumber = FreeFile
    Open FileName For Binary As #FileNumber
        
        FrmBusy.Show
        
        BlockSize = 4000
        FileBinary = Space(BlockSize)
        WinSockCtl.SendData ";" & LOF(FileNumber)

        '{
        WaitTime = 0                'This creates a pause so the size is sent in time to Client
        Do Until WaitTime = 1000    'so the file binary doesn't add onto the end of the size
            DoEvents:               'and become a type mismatch
            WaitTime = WaitTime + 1: Loop
        '}
        
        SentSize = 0
        
        Do
        
            If (SentSize / LOF(FileNumber)) * 100 > 100 Then
                FrmBusy.Progress.Value = 100
                FrmBusy.lbldescription.Caption = "Downloading file (" & FrmFileBrowse.ListFiles.SelectedItem.Text & "), (" & FormatKB(LOF(FileNumber)) & ", " & LOF(FileNumber) & " Bytes) of (" & FormatKB(LOF(FileNumber)) & ", " & LOF(FileNumber) & " Bytes) Complete"
                FrmBusy.Caption = "File transfer Complete"
            Else
                FrmBusy.Progress.Value = (SentSize / LOF(FileNumber)) * 100
                FrmBusy.lbldescription.Caption = "Downloading file (" & FrmFileBrowse.ListFiles.SelectedItem.Text & "), (" & FormatKB(SentSize) & ", " & SentSize & " Bytes) of (" & FormatKB(LOF(FileNumber)) & ", " & LOF(FileNumber) & " Bytes) Complete"
                FrmBusy.Caption = "Processing please wait..." & CLng(FrmBusy.Progress.Value) & "%"
            End If
        
            Get #FileNumber, , FileBinary
            SentSize = SentSize + Len(FileBinary)
            WinSockCtl.SendData FileBinary
            DoEvents: Loop Until EOF(FileNumber)
            
        Unload FrmBusy
        MsgBox "File transfer complete.", vbInformation, "Upload"
        CmdUpload.Caption = "&Close"
        CmdUpload.Enabled = True
        CmdCancel.Enabled = False
        WinSockCtl.Close
            
    Close #FileNumber

End Sub

Private Sub CmdCancel_Click()
    If FrmBusy.Visible = True Then Unload FrmBusy
    WinSockCtl.Close
    Unload Me
End Sub

Private Sub CmdSaveAs_Click()
    
    On Error GoTo FinaliseError
    
    'CommonDialog.flags = &H400 + &H4 + &H8 + &H2 + &H800
    CommonDialog.DialogTitle = "Open File..."
    CommonDialog.Filter = "All files (*.*)|*.*"
    CommonDialog.ShowOpen
    If CommonDialog.FileName = "" Then Exit Sub
    FileUpload.Text = CommonDialog.FileName
    Exit Sub
    
FinaliseError:
    If Err = 32755 Then
        Exit Sub
            Else
        MsgBox "An unknown error occured.", vbCritical, "Error"
    End If

End Sub

Private Sub CmdUpload_Click()

    On Error GoTo FinaliseError
    
    If CmdUpload.Caption = "&Close" Then
        Unload Me
        Exit Sub
    End If

    CmdUpload.Enabled = False
    CmdSaveAs.Enabled = False

    WinSockCtl.Close
    WinSockCtl.Connect FrmMain.IPConnect, 4433
        
    Do Until WinSockCtl.State <> 6
        DoEvents: Loop
    
    FrmMain.WinSockCtl.SendData "1-1" & SaveToText.Text & Chr(0) & FileLen(FileUpload.Text)
    Send_File FileUpload.Text
    
    Exit Sub
    
FinaliseError:
    
    If FrmBusy.Visible = True Then Unload FrmBusy
    MsgBox "Error, could not upload file.", vbCritical, "Error"
    CmdUpload.Caption = "&Close"
    CmdUpload.Enabled = True
    CmdCancel.Enabled = False
    WinSockCtl.Close

End Sub

Private Sub FileUpload_Change()
    If SaveToText.Text <> "" And FileUpload.Text <> "" Then CmdUpload.Enabled = True Else CmdUpload.Enabled = False
End Sub

Private Sub SaveToText_Change()
    If SaveToText.Text <> "" And FileUpload.Text <> "" Then CmdUpload.Enabled = True Else CmdUpload.Enabled = False
End Sub

Private Sub WinsockCtl_Close()
    WinSockCtl.Close
End Sub

Private Sub WinsockCtl_Connect()
    If WinSockCtl.State <> 7 Then WinSockCtl.Close
End Sub

Private Sub WinSockCtl_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    
    If FrmBusy.Visible = True Then Unload FrmBusy
    MsgBox "Error, could not upload file.", vbCritical, "Error"
    CmdUpload.Caption = "&Close"
    CmdUpload.Enabled = True
    CmdCancel.Enabled = False
    WinSockCtl.Close
    
End Sub
