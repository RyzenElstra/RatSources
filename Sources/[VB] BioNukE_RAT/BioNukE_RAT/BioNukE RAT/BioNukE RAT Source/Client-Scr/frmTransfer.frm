VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmTransfer 
   BorderStyle     =   4  'Festes Werkzeugfenster
   Caption         =   "Transfer Manager"
   ClientHeight    =   4935
   ClientLeft      =   45
   ClientTop       =   315
   ClientWidth     =   6765
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   6765
   ShowInTaskbar   =   0   'False
   Begin VB.Timer TimerSpeed 
      Interval        =   1000
      Left            =   5640
      Top             =   2160
   End
   Begin MSComctlLib.ProgressBar ProgressBar 
      Height          =   375
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   661
      _Version        =   393216
      BorderStyle     =   1
      Appearance      =   0
      Scrolling       =   1
   End
   Begin MSWinsockLib.Winsock wsTrans 
      Left            =   3360
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2760
      Top             =   2520
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   20
      ImageHeight     =   20
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTransfer.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmTransfer.frx":0225
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListFiles 
      Height          =   1815
      Left            =   120
      TabIndex        =   0
      Top             =   3000
      Width           =   6495
      _ExtentX        =   11456
      _ExtentY        =   3201
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      HideColumnHeaders=   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ColHdrIcons     =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   6.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Name"
         Object.Width           =   11113
      EndProperty
   End
   Begin CLIENT.ChameleonButton Button 
      Height          =   375
      Left            =   4920
      TabIndex        =   13
      Top             =   2520
      Width           =   1695
      _ExtentX        =   2990
      _ExtentY        =   661
      BTYPE           =   3
      TX              =   "Stop"
      ENAB            =   -1  'True
      BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      COLTYPE         =   1
      FOCUSR          =   -1  'True
      BCOL            =   14215660
      BCOLO           =   14215660
      FCOL            =   0
      FCOLO           =   0
      MCOL            =   12632256
      MPTR            =   1
      MICON           =   "frmTransfer.frx":05CA
      UMCOL           =   -1  'True
      SOFT            =   0   'False
      PICPOS          =   0
      NGREY           =   0   'False
      FX              =   0
      HAND            =   0   'False
      CHECK           =   0   'False
      VALUE           =   0   'False
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Speed:"
      Height          =   195
      Index           =   10
      Left            =   120
      TabIndex        =   12
      Top             =   1800
      Width           =   510
   End
   Begin VB.Label Label 
      Caption         =   "-"
      Height          =   195
      Index           =   9
      Left            =   1080
      TabIndex        =   11
      Top             =   1800
      Width           =   5445
   End
   Begin VB.Label Label 
      Caption         =   "-"
      Height          =   195
      Index           =   8
      Left            =   1080
      TabIndex        =   10
      Top             =   2160
      Width           =   5445
   End
   Begin VB.Label Label 
      Caption         =   "-"
      Height          =   195
      Index           =   7
      Left            =   1080
      TabIndex        =   9
      Top             =   1440
      Width           =   5445
   End
   Begin VB.Label Label 
      Caption         =   "-"
      Height          =   195
      Index           =   6
      Left            =   1080
      TabIndex        =   8
      Top             =   1080
      Width           =   5445
   End
   Begin VB.Label Label 
      Caption         =   "-"
      Height          =   315
      Index           =   5
      Left            =   1080
      TabIndex        =   7
      Top             =   720
      Width           =   5445
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Queue:"
      Height          =   195
      Index           =   4
      Left            =   120
      TabIndex        =   6
      Top             =   2760
      Width           =   525
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Status:"
      Height          =   195
      Index           =   3
      Left            =   120
      TabIndex        =   5
      Top             =   2160
      Width           =   495
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Rest:"
      Height          =   195
      Index           =   2
      Left            =   120
      TabIndex        =   4
      Top             =   1440
      Width           =   375
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Modus:"
      Height          =   195
      Index           =   1
      Left            =   120
      TabIndex        =   3
      Top             =   1080
      Width           =   525
   End
   Begin VB.Label Label 
      AutoSize        =   -1  'True
      Caption         =   "Dateiname:"
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   2
      Top             =   720
      Width           =   810
   End
End
Attribute VB_Name = "frmTransfer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim DOING As Boolean
Dim tLocFile As String
Dim tRemFile As String
Public Function AddDownload(ByVal tRemoteFile As String)
    On Error Resume Next
    ListFiles.ListItems.Add , , Replace(tRemoteFile, "\\", "\"), , 1
    GoNext
    Me.Show
End Function
Public Function AddUpload(ByVal tLocalFile, ByVal tRemoteFile As String)
    On Error Resume Next
    ListFiles.ListItems.Add , , tLocalFile & " -> " & Replace(tRemoteFile, "\\", "\"), , 2
    GoNext
    Me.Show
End Function
Sub GoNext()
    On Error Resume Next
    If DOING = True Then Exit Sub
    
    Dim tFile As String
    tFile = ListFiles.ListItems(1).Text
    If tFile = "" Then Exit Sub
    
    'Initialise
    Label(9) = "0 KB/s": Label(9).Tag = 0
    Label(7) = "0 KB": Label(7).Tag = 0
    Label(8) = "Warte auf Server..."
    ProgressBar.Value = 0
    TimerSpeed.Tag = 0
    wsTrans.Close
    wsTrans.LocalPort = "101"
    wsTrans.Listen
    DOING = True
    If ListFiles.ListItems(1).SmallIcon = 1 Then 'Download
        Open App.Path & "\Download\" & FileOnly(tFile) For Output As #1
        Label(5) = FileOnly(tFile)
        Senden Server.Index, CMD_DOWNLOAD & tFile
        Label(6) = "Download"
    Else 'Upload
        Dim tmp As Variant: tmp = Split(tFile, " -> ")
        tLocFile = tmp(0)
        tRemFile = tmp(1)
        Label(5) = FileOnly(tLocFile)
        Label(6) = "Upload"
        Senden Server.Index, CMD_UPLOAD & tRemFile
    End If
End Sub


Private Sub Button_Click()
    wsTrans.Close
    Closing
End Sub

Private Sub TimerSpeed_Timer()
    On Error Resume Next
    If DOING <> True Then Exit Sub
    Label(9) = ByteToKB(TimerSpeed.Tag) & " KB/s"
    TimerSpeed.Tag = 0
    DoEvents
End Sub

Private Sub Closing()
  '  On Error Resume Next
    If DOING = True Then
        Close #1
        If Label(5) = "screen.jpg" Then Shell "rundll32.exe shimgvw.dll,ImageView_Fullscreen " & App.Path & "\Download\screen.jpg", vbMaximizedFocus
        Label(7) = "-"
        Label(5) = "-"
        Label(8) = "Fertig"
        Label(6) = "-"
        Label(9) = "-"
        ProgressBar.Value = 0
        ListFiles.ListItems.Remove 1
        DOING = False
        GoNext
    End If
End Sub


Private Sub wsTrans_Close()
    Closing
End Sub

Private Sub wsTrans_ConnectionRequest(ByVal requestID As Long)
    wsTrans.Close
    On Error Resume Next
    wsTrans.Accept requestID
    If Label(6) = "Download" Then
        Label(8) = "Empfange Datei..."
    Else
        Label(8) = "Übertrage Datei..."
        DoEvents
        Dim curbyte As Long, dFileSize As Long, bBuffer As String, sPacketSize As Long, FF As Long, PrevPackSize As Long
        FF = FreeFile
        curbyte = 0
        dFileSize = FileLen(tLocFile)
        ProgressBar.Max = dFileSize
        Label(7).Tag = dFileSize
        sPacketSize = 8000
        
        Open tLocFile For Binary Access Read As #FF
            Do Until (dFileSize - curbyte) < sPacketSize
                bBuffer = Space(sPacketSize)
                Get #FF, curbyte + 1, bBuffer
                wsTrans.SendData bBuffer
                curbyte = curbyte + sPacketSize
                bBuffer = ""
                DoEvents
                Do While wsTrans.Tag <> True
                    DoEvents
                Loop
                wsTrans.Tag = False
            Loop
            DoEvents
            PrevPackSize = dFileSize - curbyte
            bBuffer = Space(PrevPackSize)
            Get #FF, curbyte + 1, bBuffer
            curbyte = curbyte + PrevPackSize
            wsTrans.SendData bBuffer
            
            Do While wsTrans.Tag <> True
                    DoEvents
            Loop
            
            wsTrans.Close
            Closing
    End If
End Sub

Private Sub wsTrans_DataArrival(ByVal bytesTotal As Long)
    On Error Resume Next
    Dim tmp As String
    wsTrans.GetData tmp
    Print #1, tmp;
    ProgressBar.Value = ProgressBar.Value + bytesTotal
    Label(7).Tag = Label(7).Tag - bytesTotal
    Label(7) = ByteToKB(Label(7).Tag) & " KB"
    TimerSpeed.Tag = TimerSpeed.Tag + bytesTotal
    DoEvents
End Sub

Private Sub wsTrans_SendComplete()
    wsTrans.Tag = True
End Sub

Private Sub wsTrans_SendProgress(ByVal bytesSent As Long, ByVal bytesRemaining As Long)
    TimerSpeed.Tag = TimerSpeed.Tag + bytesSent
    ProgressBar.Value = ProgressBar.Value + bytesSent
    Label(7).Tag = Label(7).Tag - bytesSent
    Label(7) = ByteToKB(Label(7).Tag) & " KB"
End Sub
