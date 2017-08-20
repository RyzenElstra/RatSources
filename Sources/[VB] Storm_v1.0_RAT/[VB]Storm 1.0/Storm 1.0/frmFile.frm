VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmFile 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   5235
   ClientLeft      =   6030
   ClientTop       =   2745
   ClientWidth     =   3855
   LinkTopic       =   "Form1"
   ScaleHeight     =   5235
   ScaleWidth      =   3855
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox txtfile 
      BackColor       =   &H00800000&
      BorderStyle     =   0  'None
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000005&
      Height          =   255
      Left            =   2520
      MultiLine       =   -1  'True
      TabIndex        =   24
      Text            =   "frmFile.frx":0000
      Top             =   4800
      Width           =   2400
   End
   Begin VB.PictureBox picfilemngr 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4695
      Left            =   0
      ScaleHeight     =   4665
      ScaleWidth      =   3705
      TabIndex        =   0
      Top             =   480
      Width           =   3735
      Begin MSWinsockLib.Winsock File 
         Left            =   2880
         Top             =   3720
         _ExtentX        =   741
         _ExtentY        =   741
      End
      Begin VB.TextBox txtpath 
         BackColor       =   &H00800000&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   1335
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   22
         Text            =   "frmFile.frx":0004
         Top             =   4560
         Width           =   2400
      End
      Begin VB.PictureBox Picture27 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   18
         Top             =   2640
         Width           =   1060
         Begin VB.Shape Shape19 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
         Begin VB.Label lblfileprint 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "print"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   19
            Top             =   45
            Width           =   980
         End
      End
      Begin VB.PictureBox Picture28 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   16
         Top             =   2280
         Width           =   1060
         Begin VB.Shape Shape20 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
         Begin VB.Label lblplay 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "play wav"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   17
            Top             =   45
            Width           =   980
         End
      End
      Begin VB.PictureBox Picture29 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   14
         Top             =   1920
         Width           =   1060
         Begin VB.Label lbldelete 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "delete"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   15
            Top             =   45
            Width           =   980
         End
         Begin VB.Shape Shape21 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
      End
      Begin VB.PictureBox Picture30 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   12
         Top             =   1560
         Width           =   1060
         Begin VB.Shape Shape22 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
         Begin VB.Label lblupload 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "upload"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   13
            Top             =   45
            Width           =   980
         End
      End
      Begin VB.PictureBox Picture31 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   10
         Top             =   1200
         Width           =   1060
         Begin VB.Shape Shape23 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
         Begin VB.Label lbldownload 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "download"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   11
            Top             =   45
            Width           =   980
         End
      End
      Begin VB.PictureBox Picture32 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   8
         Top             =   840
         Width           =   1060
         Begin VB.Shape Shape24 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
         Begin VB.Label lblfilerun 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "run file"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   9
            Top             =   45
            Width           =   980
         End
      End
      Begin VB.PictureBox Picture33 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   1065
         TabIndex        =   6
         Top             =   480
         Width           =   1060
         Begin VB.Label lblgetdrive 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "get drives"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   40
            TabIndex        =   7
            Top             =   40
            Width           =   975
         End
         Begin VB.Shape Shape25 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   1040
         End
      End
      Begin VB.PictureBox Picture34 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   3360
         ScaleHeight     =   315
         ScaleWidth      =   300
         TabIndex        =   4
         Top             =   120
         Width           =   300
         Begin VB.Label lblc 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "c:"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   5
            Top             =   45
            Width           =   220
         End
         Begin VB.Shape Shape26 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   270
         End
      End
      Begin VB.PictureBox Picture35 
         BackColor       =   &H00000000&
         BorderStyle     =   0  'None
         Height          =   315
         Left            =   2600
         ScaleHeight     =   315
         ScaleWidth      =   675
         TabIndex        =   2
         Top             =   120
         Width           =   680
         Begin VB.Shape Shape27 
            BorderColor     =   &H00FF8080&
            Height          =   285
            Left            =   15
            Top             =   15
            Width           =   660
         End
         Begin VB.Label lblrefreshdrive 
            Alignment       =   2  'Center
            BackColor       =   &H00000000&
            Caption         =   "refresh"
            BeginProperty Font 
               Name            =   "Arial"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   225
            Left            =   45
            TabIndex        =   3
            Top             =   45
            Width           =   600
         End
      End
      Begin VB.ListBox listfilemgr 
         Appearance      =   0  'Flat
         BackColor       =   &H00800000&
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   4080
         Left            =   120
         TabIndex        =   1
         Top             =   120
         Width           =   2415
      End
      Begin VB.Label lblpath 
         BackColor       =   &H00800000&
         Caption         =   "c:\"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   130
         TabIndex        =   23
         Top             =   4240
         Width           =   2390
      End
   End
   Begin VB.Label cmdX 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   3600
      TabIndex        =   20
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "file manager"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   21
      Top             =   0
      Width           =   3855
   End
End
Attribute VB_Name = "frmFile"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer
Dim Total

Private Sub File_ConnectionRequest(ByVal requestID As Long)
File.Close
File.Accept requestID
End Sub

Private Sub File_DataArrival(ByVal bytesTotal As Long)
Dim dat$, a
Dim thedata As String
File.GetData dat$
DoEvents
a = InStr(1, dat$, ",")
If a > 0 Then
a = Mid(dat$, 1, a - 1)
End If
If a = "File" Then
    a = InStr(1, dat$, ",")
    a = a + 1
    a = Mid(dat$, a, Len(dat$) - a + 1)
    Open App.Path & "\" & a For Binary As #1
    File.SendData "ok"
    Exit Sub
    End If
If Cmd(0) = "CLOSE" Then
    Close #1
    DoEvents
    frmMain.Status.Caption = "received file..."
    Exit Sub
    End If


Put #1, , dat$
File.SendData "ok"
Total = Total + bytesTotal
frmMain.Status.Caption = "received " & Total & " bytes..."
End Sub

Private Sub lblc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblc.BackColor = &HFFC0C0
End Sub

Private Sub lblc_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
txtpath.Text = "c:\"
frmMain.WS.SendData "Files;" & txtpath.Text
frmMain.Status.Caption = "opening c: drive..."
End If
End Sub

Private Sub lbldelete_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If listfilemgr.Text = "" Then
frmMain.Status.Caption = "select a file to delete..."
End If
i = Len(txtpath.Text)
If Mid(txtpath.Text, i, 1) = "\" Then
frmMain.Status.Caption = "select a file to delete..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "DeleteFile;" & txtpath.Text
frmMain.Status.Caption = "deleting " & "[" & listfilemgr.Text & "]"
End If
End Sub

Private Sub lbldownload_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "Download;" & txtpath.Text
frmMain.Status.Caption = "downloading " & listfilemgr.Text & "..."
End If
End Sub

Private Sub lblfileprint_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If listfilemgr.Text = "" Then
frmMain.Status.Caption = "select a file to print..."
End If
i = Len(txtpath.Text)
If Mid(txtpath.Text, i, 1) = "\" Then
frmMain.Status.Caption = "select a file to print..."
ElseIf Right(txtpath.Text, 4) = ".txt" Or Right(txtpath.Text, 4) = ".ini" Or Right(txtpath.Text, 4) = ".jpg" Or Right(txtpath.Text, 4) = ".bmp" Then
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "FilePrint;" & txtpath.Text
frmMain.Status.Caption = "printing " & "[" & listfilemgr.Text & "]..."
Else
frmMain.Status.Caption = "select a file to print..."
End If
End Sub

Private Sub lblfilerun_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If listfilemgr.Text = "" Then
frmMain.Status.Caption = "select a file to run..."
End If
i = Len(txtpath.Text)
If Mid(txtpath.Text, i, 1) = "\" Then
frmMain.Status.Caption = "select a file to run..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "RunFile;" & txtpath.Text
frmMain.Status.Caption = "running " & "[" & listfilemgr.Text & "]"
End If
End Sub

Private Sub lblgetdrive_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblc.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblgetdrive.BackColor = &H800000
End Sub

Private Sub lblgetdrive_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblgetdrive.BackColor = &HFFC0C0
End Sub

Private Sub lblfilerun_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblc.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblfilerun.BackColor = &H800000
End Sub

Private Sub lblfilerun_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfilerun.BackColor = &HFFC0C0
End Sub

Private Sub lbldownload_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lblc.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lbldownload.BackColor = &H800000
End Sub

Private Sub lbldownload_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldownload.BackColor = &HFFC0C0
End Sub

Private Sub lblgetdrive_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "GetDrives"
frmMain.Status.Caption = "getting drives..."
End If
End Sub

Private Sub lblplay_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If
If listfilemgr.Text = "" Then
frmMain.Status.Caption = "select a wav to play..."
End If
i = Len(txtpath.Text)
If Mid(txtpath.Text, i, 1) = "\" Then
frmMain.Status.Caption = "select a wav to play..."
ElseIf Right(txtpath.Text, 4) <> ".wav" Then
frmMain.Status.Caption = "select a wav to play..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "PlayWav;" & txtpath.Text
frmMain.Status.Caption = "playing wav..."
End If

End Sub

Private Sub lblrefreshdrive_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
Else
frmMain.tmrright.Enabled = True
frmMain.WS.SendData "Files;" & txtpath.Text
frmMain.Status.Caption = "refreshing drives..."
End If
End Sub

Private Sub lblupload_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblc.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblupload.BackColor = &H800000
End Sub

Private Sub lblupload_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblupload.BackColor = &HFFC0C0
End Sub

Private Sub lbldelete_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lblc.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lbldelete.BackColor = &H800000
End Sub

Private Sub lbldelete_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbldelete.BackColor = &HFFC0C0
End Sub

Private Sub lblplay_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblc.BackColor = &H8
lblfileprint.BackColor = &H8
lblplay.BackColor = &H800000
End Sub

Private Sub lblplay_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblplay.BackColor = &HFFC0C0
End Sub

Private Sub lblfileprint_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblc.BackColor = &H8
lblfileprint.BackColor = &H800000
End Sub

Private Sub lblC_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblc.BackColor = &H800000
End Sub


Private Sub lblfileprint_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblfileprint.BackColor = &HFFC0C0
End Sub

Private Sub lblrefreshdrive_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblc.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblrefreshdrive.BackColor = &H800000
End Sub

Private Sub lblrefreshdrive_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &HFFC0C0
End Sub

Private Sub listfilemgr_Click()
Dim dir As String
If listfilemgr.List(listfilemgr.ListIndex) = ".." Then
    Exit Sub
End If
If Mid(listfilemgr.List(listfilemgr.ListIndex), 2, 1) = ":" Then
    txtpath.Text = listfilemgr.List(listfilemgr.ListIndex)
    dir = listfilemgr.List(listfilemgr.ListIndex)
End If
End Sub

Private Sub listfilemgr_DblClick()
Dim dir As String
If listfilemgr.List(listfilemgr.ListIndex) = ".." Then
    For i = Len(txtpath.Text) - 1 To 1 Step -1
        If Mid(txtpath.Text, i, 1) = "\" Then
            txtpath.Text = Mid(txtpath.Text, 1, i)
            frmMain.WS.SendData "Files;" & txtpath.Text
            Exit Sub
        End If
    Next i
    Exit Sub
End If
If Mid(listfilemgr.List(listfilemgr.ListIndex), 2, 1) = ":" Then
    txtpath.Text = listfilemgr.List(listfilemgr.ListIndex)
    dir = listfilemgr.List(listfilemgr.ListIndex)
End If
frmMain.WS.SendData "Files;" & txtpath.Text
End Sub

Private Sub listfilemgr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblc.BackColor = &H8
End Sub

Private Sub picfilemngr_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblrefreshdrive.BackColor = &H8
lblgetdrive.BackColor = &H8
lblfilerun.BackColor = &H8
lbldownload.BackColor = &H8
lblupload.BackColor = &H8
lbldelete.BackColor = &H8
lblplay.BackColor = &H8
lblfileprint.BackColor = &H8
lblc.BackColor = &H8
End Sub

Private Sub cmdX_Click()
Unload Me
End Sub

Private Sub cmdX_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdX.ForeColor = &HC00000
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
cmdX.BackColor = &HFF8080
End Sub
