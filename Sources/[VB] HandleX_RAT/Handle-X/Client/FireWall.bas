Attribute VB_Name = "M_FireWall"
'Declerations
Private Declare Function GetProcessHeap Lib "kernel32" () As Long
Private Declare Function htons Lib "ws2_32.dll" (ByVal dwLong As Long) As Long
Private Declare Function AllocateAndGetTcpExTableFromStack Lib "iphlpapi.dll" (pTcpTableEx As Any, ByVal bOrder As Long, ByVal heap As Long, ByVal zero As Long, ByVal Flags As Long) As Long
Private Declare Function AllocateAndGetUdpExTableFromStack Lib "iphlpapi.dll" (pUdpTableEx As Any, ByVal bOrder As Long, ByVal heap As Long, ByVal zero As Long, ByVal Flags As Long) As Long
Private Declare Function SetTcpEntry Lib "iphlpapi.dll" (ByRef pTcpTable As MIB_TCPROW) As Long
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Private Declare Function OpenThread Lib "Kernel32.dll" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Boolean, ByVal dwThreadId As Long) As Long
Private Declare Function SuspendThread Lib "Kernel32.dll" (ByVal hThread As Long) As Long
Private Declare Function ResumeThread Lib "Kernel32.dll" (ByVal hThread As Long) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal lFlags As Long, ByVal lProcessID As Long) As Long
Private Declare Function Thread32First Lib "Kernel32.dll" (ByVal HSnapshot As Long, ByRef lpte As THREADENTRY32) As Boolean
Private Declare Function Thread32Next Lib "Kernel32.dll" (ByVal HSnapshot As Long, ByRef lpte As THREADENTRY32) As Boolean
Private Declare Function EnumProcessModules Lib "PSAPI.DLL" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Private Declare Function GetModuleFileNameExA Lib "PSAPI.DLL" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal HSnapshot As Long, lppe As Any) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal HSnapshot As Long, lppe As Any) As Long
Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function GetExitCodeProcess Lib "kernel32" (ByVal hProcess As Long, lpExitCode As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByRef pDest As Any, ByRef pSource As Any, ByVal length As Long)

'Constants
'Constants
Private Const ERROR_NOT_SUPPORTED = 50&
Private Const INFINITE = &HFFFF     '  Infinite timeout
Private Const SW_VISIBLE = 0
Private Const STARTF_USESHOWWINDOW = &H1
Private Const STARTF_USESTDHANDLES = &H100&
Private Const NORMAL_PRIORITY_CLASS = &H20&
Private Const MAX_PATH = 260
Private Const EM_SETSEL = &HB1
Private Const EM_REPLACESEL = &HC2
'''''''''''''''''''''''''For Process
Private Const SYNCHRONIZE = &H100000
Private Const PROCESS_SET_INFORMATION As Long = &H200
Private Const PROCESS_QUERY_INFORMATION As Long = &H400
Private Const PROCESS_ALL_ACCESS = &H1F0FFF
Private Const PROCESS_TERMINATE As Long = &H1
Private Const PROCESS_VM_READ As Long = &H10
Private Const CREATE_SUSPENDED = &H4
Private Const THREAD_SUSPEND_RESUME As Long = &H2
Private Const TH32CS_SNAPHEAPLIST = &H1
Private Const TH32CS_SNAPPROCESS = &H2
Private Const TH32CS_SNAPTHREAD = &H4
Private Const TH32CS_SNAPMODULE = &H8
Private Const TH32CS_SNAPALL = (TH32CS_SNAPHEAPLIST + TH32CS_SNAPPROCESS + TH32CS_SNAPTHREAD + TH32CS_SNAPMODULE) 'Types & Enums
Private Type THREADENTRY32
    dwSize As Long
    cntUsage As Long
    th32ThreadID As Long
    th32OwnerProcessID As Long
    tpBasePri As Long
    tpDeltaPri As Long
    dwFlags As Long
End Type
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
Private Type AppDiskRecord
    FullPath As String * MAX_PATH
    State As Byte
End Type
Public Type MIB_TCPROW
    dwState As Long
    dwLocalAddr As Long
    dwLocalPort As Long
    dwRemoteAddr As Long
    dwRemotePort As Long
End Type
Private Type FileInfor
    Path As String
    Type As String
    CerTm As String
    FSize As Long
End Type
Private Type Cols
    Type As String * 3
    LocalName As String
    LocalPort As String
    RemotName As String
    RemotPort As String
    State As String * 11
    PID As Long
    FleData As FileInfor
End Type
'Variables
Private Cells() As Cols 'to holde the current connections
Private TCPRows() As MIB_TCPROW 'to holde the TCP table at all
Private cRows As Long, dRows As Long
Private cTablePtr As Long, dTablePtr As Long
Private TheThreads() As THREADENTRY32
Private OldItems() As String
Private ThrdCnt As Long
Private LDFlag  As Boolean
Private AppDiskFilePath As String
Private FFile As Integer 'Carry the opened file Number
Private ActiveFireWall As Boolean
Public FirewallRunning As Boolean
Public Sub FireWallButtonsCL(Index As Integer)
  On Error Resume Next
 'Check items in the list
  If (Index < 8) And (Frm_Main.ConnectionsList.ListItems.Count = 0) Then Exit Sub
  Select Case Index
        Case 0 'Block
            If MsgBox("Are you sure you want to  kill this  application connection: " & Frm_Main.ConnectionsList.SelectedItem.Text & vbCrLf & _
            "Witch Uses Local Port Number: " & Frm_Main.ConnectionsList.SelectedItem.SubItems(4) & " ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                If KillCon(Frm_Main.ConnectionsList.SelectedItem.Index - 1) = True Then
                    MsgBox "Connection Has Been Killed Successfully.", vbInformation, AppName
                Else
                    MsgBox "Unable To Kill This Connection.", vbInformation, AppName
                End If
            End If
        Case 1 'End Process
            If MsgBox("Are you sure you want to terminate the application: " & Frm_Main.ConnectionsList.SelectedItem.Text & vbCrLf & _
            "Witch Uses Local Port Number: " & Frm_Main.ConnectionsList.SelectedItem.SubItems(4) & " ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                If EndProcess(Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).PID) = True Then
                    MsgBox "Application Has Been Terminated Successfully.", vbInformation, AppName
                Else
                    MsgBox "Unable To Get Access To This Application.", vbInformation, AppName
                End If
            End If
        Case 2 'Suspend
            If MsgBox("Are you sure you want to  suspend the application: " & Frm_Main.ConnectionsList.SelectedItem.Text & vbCrLf & _
            "Witch Uses Local Port Number: " & Frm_Main.ConnectionsList.SelectedItem.SubItems(4) & " ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                If SuspendProg(Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).PID) = True Then
                    MsgBox "Application Has Been Suspended Successfully.", vbInformation, AppName
                Else
                    MsgBox "Unable To Suspend This Application.", vbInformation, AppName
                End If
            End If
        Case 3 'Resume
            If MsgBox("Are you sure you want to resume the application: " & Frm_Main.ConnectionsList.SelectedItem.Text & vbCrLf & _
            "Witch Uses Local Port Number: " & Frm_Main.ConnectionsList.SelectedItem.SubItems(4) & " ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                If ResumeProg(Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).PID) = True Then
                    MsgBox "Application Has Been Resumed To Be Active Successfully.", vbInformation, AppName
                Else
                    MsgBox "Unable To Resume This Application.", vbInformation, AppName
                End If
            End If
        Case 4 'Block All
            If MsgBox("Are you sure you want to kill all connections (If Possible) In Your System ??", vbQuestion + vbYesNo) = vbYes Then
                For i = 1 To Frm_Main.ConnectionsList.ListItems.Count
                    KillCon (Frm_Main.ConnectionsList.ListItems(i).Tag)
                Next i
            End If
        Case 5 'Delete a Filepath which related to the selected connection
            Dim AppPath As String, FeedBack As String
            AppPath = Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).FleData.Path
            If MsgBox("Are you sure you want to Delete the file: [" & AppPath & "]" & vbCrLf & _
                "Witch Uses Local Port Number: " & Frm_Main.ConnectionsList.SelectedItem.SubItems(4) & " ??", vbQuestion + vbYesNo, AppName) = vbYes Then
                    FeedBack = DelApplicationSFile(Frm_Main.ConnectionsList.SelectedItem.Tag)
                    MsgBox Frm_Main.ConnectionsList.SelectedItem.Tag, vbInformation, AppName
            End If
        Case 6 'File Datails
                With FireWall
                     .Left = (Screen.Width / 2) - (.Width / 2)
                     .Top = (Screen.Height / 2) - (.Height / 2)
                     .TxtFireWall(0) = Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).FleData.Path
                     .TxtFireWall(1) = String_Size(Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).FleData.FSize)
                     .TxtFireWall(2) = Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).FleData.Type
                     .TxtFireWall(3) = Cells(Frm_Main.ConnectionsList.SelectedItem.Tag).FleData.CerTm
                     .ShowWindow (3)
                     .Show 1
                End With
        Case 7 'Register The IP first and then Drop The IP tools menu
             CurIPToTest = Frm_Main.ConnectionsList.SelectedItem.SubItems(5)
                With Frm_Main
                   .FireWallButtons(Index).ToolTipText = CurIPToTest
                   .PopupMenu Menus.IPtools, , _
                   .room(10).Left + .FireWallButtons(Index).Left + 20, _
                   .room(10).Top + .FireWallButtons(Index).Top + .FireWallButtons(Index).Height + 10
                End With
        Case 8 'Add application
                Dim NewAPP As String
                With FileBrowser
                    .CMD1.CancelError = False
                    .CMD1.DialogTitle = "Select The Executable Witch You Want From X-Firewall To Keep Track Of It's Access To The Network."
                    .CMD1.Filter = "Executable Files(*.exe)|*.exe|Com Files(*.com)|*.Com|Screen Saver Files(*.scr)|*.scr|Dos Executable Files(*.pif;*.bat)|*.pif;*.bat|MSI Files (*.msi)|*.msi "
                    .CMD1.ShowOpen
                     NewAPP = Trim$(.CMD1.FileName)
                End With
                If Len(NewAPP) Then
                    With FireWall
                         .Left = (Screen.Width / 2) - (.Width / 2)
                         .Top = (Screen.Height / 2) - (.Height / 2)
                         .TxtEditServer(0) = NewAPP
                         .AddOpt(0).Value = True
                         .ShowWindow (1)
                         .Show 1
                         'Add The New Application
                          If Len(.NewAPP) Then
                            SetDiskState .NewAPP, .AppSatet
                          End If
                    End With
                End If
        Case 9 'Allow Application
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 0
        Case 10 'Block Application
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 1
        Case 11 'Ask For
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 2
        Case 12 'End Process
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 3
        Case 13 'Del File
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 4
        Case 14 'Suspend
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 5
        Case 15 'Handle The Application 'Try to block,end process ,suspend
             'Modify the disk
              SetDiskState Frm_Main.ApplicationList.SelectedItem.Key, 6
        Case 16 'Delete All The List
              If MsgBox("Are you sure you want to delete the whole applications list ?", vbExclamation + vbYesNo, AppName) = vbYes Then
                    Kill AppDiskFilePath
                   'Confirm Deleting
                    If CStr(CBool(PathFileExists(AppDiskFilePath))) = False Then
                        Frm_Main.ApplicationList.ListItems.Clear
                    Else
                        MsgBox "Unable to delete the whole applications list. " & vbCrLf & "If you are openning the related file,leave it and try again .", vbInformation, AppName
                    End If
              End If
  End Select
End Sub
Public Sub FireWallCheckBoxes(Index As Integer)
    If (LDFlag And FirewallRunning) Then ShowConnectionList
End Sub
Public Sub GiveDetailsAbtConnection()
    'Give Details about the selected Application (Ports and IP's)
     Dim Msg As String
     Dim CellID As Integer
     CellID = Frm_Main.ConnectionsList.SelectedItem.Tag
    'Collect Information
     Msg = "Connection Details :-" & vbCrLf
     Msg = Msg & "---------------------" & vbCrLf & vbCrLf
     Msg = Msg & "Process Name : " & Frm_Main.ConnectionsList.SelectedItem.Text & vbCrLf
     Msg = Msg & "Source File : " & Cells(CellID).FleData.Path & vbCrLf
     Msg = Msg & "Connection Type : " & Cells(CellID).Type & vbCrLf
     Msg = Msg & "Connection State : " & Cells(CellID).State & vbCrLf
     Msg = Msg & "Application Access : " & Frm_Main.ConnectionsList.SelectedItem.SubItems(3) & vbCrLf
     Msg = Msg & vbCrLf
     Msg = Msg & "Local IP : " & Cells(CellID).LocalName & vbCrLf
     Msg = Msg & "Local Port : " & Cells(CellID).LocalPort & vbCrLf
     Msg = Msg & "Remote IP : " & Cells(CellID).RemotName & vbCrLf
     Msg = Msg & "Remote Port : " & Cells(CellID).RemotPort & vbCrLf
    'Show Information
     Editor.SetString Msg, "Connection details"
End Sub
Public Sub LoadFireWall()
   'Set a timer In The System to serve the firewall check each 100 ms
    'Add Me To Old Applications
    'Check Operating System Platforms (This Fire Wall don't work with win9X plateform)
    If OSPlateForm <> Platform_Windows_NT_2K_XP Then
        MsgBox "Unable To Load The FireWall , It Don't Work With This OS PlateForm!" & vbCrLf & "Suggested OS : WinNT/XP", vbExclamation, AppName
        Exit Sub
    End If
    ReDim OldItems(0)
    OldItems(0) = "None"
    AppDiskFilePath = Sys_Dir & "X-Firewall.txt"
   'Load Applications In The Application Lest
    LoadApplicationList
    Frm_Main.FireWallCheck(0).Value = 1
    ActiveFireWall = True
    If FirewallRunning Then SetTimer WHandle, 1, 1000, AddressOf Check
End Sub
Private Sub Check()
'Set The Local Information
On Error Resume Next
If Not ActiveFireWall Then Exit Sub
Frm_Main.RoomTitle(7) = "\Handle-X\X-FireWall V1.0 :\> [Local Host Name : " & LocalHostName & " ][Local IP : " & LocalIP & " ]"
If Not LDFlag Then    'First Time
    NoChange
    LDFlag = True
    GoTo AtLoad
End If
If NoChange = UBound(Cells()) + 1 Then Exit Sub 'Check For New Cnnections
Erase Cells() 'Clear The Buffer
AtLoad:
Call GetConnections
ShowConnectionList
End Sub
Private Sub ShowConnectionList()
    On Error Resume Next
    Dim i As Integer, j As Integer  'Gneeral Counter
    Dim RetState As Integer, Found As Boolean
    Frm_Main.ConnectionsList.ListItems.Clear 'Clears The Current Connections
    For i = 0 To UBound(Cells())
   'Filters
    If (Frm_Main.FireWallCheck(0).Value = 0) And Cells(i).Type = "TCP" Then GoTo NextItem
    If (Frm_Main.FireWallCheck(1).Value = 0) And Cells(i).Type = "UDP" Then GoTo NextItem
    If (Frm_Main.FireWallCheck(2).Value = 0) And Mid$(Cells(i).FleData.Path, 2, 1) <> ":" Then GoTo NextItem
    If (Frm_Main.FireWallCheck(3).Value = 0) And Cells(i).State = "LISTENING  " Then GoTo NextItem
   'Check Connection State and FireWall Behavior
         If LCase(Cells(i).FleData.Path) = LCase(AppPath) Then GoTo NextItem 'Exit if Me Who Will Connect
         RetState = GetDiskState(Cells(i).FleData.Path)
         Select Case RetState
                Case 0  'Allow
                    'Do Nothing
                Case 1  'Block Connection
                    KillCon (i)
                Case 2   'Ask
                    'Check If System Operation (Cann't Be Blocked After)
                     If Mid$(Cells(i).FleData.Path, 2, 1) = ":" Then 'Full Path Aplication
                        'Check Not In The OLD iTEMS With the path and local port
                          For j = 0 To UBound(OldItems)
                                If Cells(i).FleData.Path & Cells(i).LocalPort = OldItems(j) Then
                                    Found = True
                                    Exit For
                                End If
                          Next j
                        If Found = False Then 'New Item
                            ReDim Preserve OldItems(UBound(OldItems) + 1) 'Add It As An OldItem
                            OldItems(UBound(OldItems)) = Cells(i).FleData.Path & Cells(i).LocalPort
                            Alert (i)
                        End If
                     End If
                Case 3  'End Process
                     EndProcess Cells(i).PID
                Case 4  'Del File
                     DelApplicationSFile i
                Case 5  'Suspend
                     SuspendProg Cells(i).PID
                Case 6  'Handle
                    'Try To Block
                     If KillCon(i) = False Then
                        'Try To EndProcess
                            If EndProcess(Cells(i).PID) = False Then
                                'Try To Suspend
                                    SuspendProg Cells(i).PID
                            End If
                     End If
        End Select
        SetListEnt i, CByte(RetState)
        Found = False
NextItem:
    Next
End Sub
Private Sub SetListEnt(Index As Integer, State As Byte)
    On Error Resume Next
    Dim ItemKey As String
    Dim ItemName As String
    ItemName = Mid$(Cells(Index).FleData.Path, InStrRev(Cells(Index).FleData.Path, "\") + 1)
    ItemKey = Cells(Index).FleData.Path & Index
    With Frm_Main.ConnectionsList
        .ListItems.Add , ItemKey, ItemName
        .ListItems(ItemKey).SubItems(1) = Cells(Index).Type
        .ListItems(ItemKey).Tag = Index 'Set The Related Item In The Cells Buffer
        .ListItems(ItemKey).SubItems(2) = Cells(Index).State
        .ListItems(ItemKey).SubItems(3) = AccessStateConversion(State)
        .ListItems(ItemKey).SubItems(4) = Cells(Index).LocalPort
        .ListItems(ItemKey).SubItems(5) = Cells(Index).RemotName
        .ListItems(ItemKey).SubItems(6) = Cells(Index).RemotPort
    End With
End Sub
Public Sub GetConnections()
On Error Resume Next
Dim Ctr As Long
Dim nState As Long, nLocalAddr As Long, nLocalPort As Long, nRemoteAddr As Long, nRemotePort As Long
ReDim Preserve Cells(0 To cRows + dRows - 1)
For Ctr = 0 To cRows - 1 '// read 24 bytes at a time
    CopyMemory nState, ByVal cTablePtr + 4 + 24 * Ctr, 4
    CopyMemory nLocalAddr, ByVal cTablePtr + 8 + 24 * Ctr, 4
    CopyMemory nLocalPort, ByVal cTablePtr + 12 + 24 * Ctr, 4
    CopyMemory nRemoteAddr, ByVal cTablePtr + 16 + 24 * Ctr, 4
    CopyMemory nRemotePort, ByVal cTablePtr + 20 + 24 * Ctr, 4
    CopyMemory Cells(Ctr).PID, ByVal cTablePtr + 24 + 24 * Ctr, 4
    Cells(Ctr).LocalName = GetIPAddress(nLocalAddr)
    Cells(Ctr).LocalPort = GetPort(nLocalPort)
    Cells(Ctr).RemotName = GetIPAddress(nRemoteAddr)
    Cells(Ctr).RemotPort = GetPort(nRemotePort)
    Cells(Ctr).State = Trim$(GetState(nState))
    Cells(Ctr).Type = "TCP"
    Cells(Ctr).FleData.Path = GetAppPath(Cells(Ctr).PID)
    Cells(Ctr).FleData.CerTm = FileDateTime(Cells(Ctr).FleData.Path)
    Cells(Ctr).FleData.FSize = FileLen(Cells(Ctr).FleData.Path)
    Cells(Ctr).FleData.Type = UCase(Mid$(Cells(Ctr).FleData.Path, InStrRev(Cells(Ctr).FleData.Path, ".") + 1)) & " File"
    ReDim Preserve TCPRows(Ctr)
    TCPRows(Ctr).dwLocalAddr = nLocalAddr
    TCPRows(Ctr).dwLocalPort = nLocalPort
    TCPRows(Ctr).dwRemoteAddr = nRemoteAddr
    TCPRows(Ctr).dwRemotePort = nRemotePort
    TCPRows(Ctr).dwState = nState
Next Ctr
For Ctr = cRows To cRows + dRows - 1   '// read 12 bytes at a time
    CopyMemory nLocalAddr, ByVal dTablePtr + 4 + 12 * Ctr, 4
    CopyMemory nLocalPort, ByVal dTablePtr + 8 + 12 * Ctr, 4
    CopyMemory Cells(Ctr).PID, ByVal dTablePtr + 12 + 12 * Ctr, 4
    Cells(Ctr).LocalName = GetIPAddress(nLocalAddr)
    Cells(Ctr).LocalPort = GetPort(nLocalPort)
    Cells(Ctr).RemotName = "*"
    Cells(Ctr).RemotPort = "*"
    Cells(Ctr).State = "*"
    Cells(Ctr).Type = "UDP"
    Cells(Ctr).FleData.Path = GetAppPath(Cells(Ctr).PID)
    Cells(Ctr).FleData.CerTm = FileDateTime(Cells(Ctr).FleData.Path)
    Cells(Ctr).FleData.FSize = FileLen(Cells(Ctr).FleData.Path)
    Cells(Ctr).FleData.Type = UCase(Mid$(Cells(Ctr).FleData.Path, InStrRev(Cells(Ctr).FleData.Path, ".") + 1)) & " File"
Next Ctr
If err Then err.Clear
End Sub
Private Function GetState(State As Long) As String
Select Case State
    Case 0: GetState = "UNKNOWN"
    Case 1: GetState = "CLOSED"
    Case 2: GetState = "LISTENING"
    Case 3: GetState = "SYN_SENT"
    Case 4: GetState = "SYN_RCVD"
    Case 5: GetState = "ESTABLISHED"
    Case 6: GetState = "FIN_WAIT1"
    Case 7: GetState = "FIN_WAIT2"
    Case 8: GetState = "CLOSE_WAIT"
    Case 9: GetState = "CLOSING"
    Case 10: GetState = "LAST_ACK"
    Case 11: GetState = "TIME_WAIT"
    Case 12: GetState = "DELETE_TCB"
End Select
End Function
Private Function GetIPAddress(dwAddr As Long) As String
    Dim arrIpParts(3) As Byte
    CopyMemory arrIpParts(0), dwAddr, 4
    GetIPAddress = CStr(arrIpParts(0)) & "." & _
    CStr(arrIpParts(1)) & "." & _
    CStr(arrIpParts(2)) & "." & _
    CStr(arrIpParts(3))
End Function
Private Function GetPort(ByVal dwPort As Long) As Long
    GetPort = htons(dwPort)
End Function
Public Function NoChange() As Long
On Error GoTo Failed
Dim cRet As Long, dRet As Long
cRet = AllocateAndGetTcpExTableFromStack(cTablePtr, 0, GetProcessHeap, 0, 2)
dRet = AllocateAndGetUdpExTableFromStack(dTablePtr, 0, GetProcessHeap, 0, 2)
If cRet = 0 And dRet = 0 Then
    CopyMemory cRows, ByVal cTablePtr, 4
    CopyMemory dRows, ByVal dTablePtr, 4
    NoChange = cRows + dRows
Else
    NoChange = 0
End If
Exit Function
Failed:
    NoChange = 0
    ErrorHandle (err.Number)
End Function
Private Function DelApplicationSFile(CellID As Integer) As String
Dim AppPath As String
    AppPath = Cells(CellID).FleData.Path
    If EndProcess(Cells(CellID).PID) = True Then
        Delay 10000
        Do While Remove_File(AppPath) = False
            DoEvents
        Loop
        If CStr(CBool(PathFileExists(AppPath))) = False Then
            DelApplicationSFile = "Application is terminated and related-path is successfully removed."
        Else
            DelApplicationSFile = "Unable to delete the the file path , may be the access to that file is denied from the system!" & vbCrLf & "If you are openning the related file,leave it and try again ."
        End If
    Else
        DelApplicationSFile = "Unable To Get Access To This Application."
    End If
End Function
Public Function KillCon(TheRow As Integer) As Boolean    'Local Port
Dim ATCPTableRow As MIB_TCPROW
ATCPTableRow.dwState = 12  'set the state as deleted
ATCPTableRow.dwLocalAddr = TCPRows(TheRow).dwLocalAddr
ATCPTableRow.dwLocalPort = TCPRows(TheRow).dwLocalPort
ATCPTableRow.dwRemoteAddr = TCPRows(TheRow).dwRemoteAddr
ATCPTableRow.dwRemotePort = TCPRows(TheRow).dwRemotePort
RetVal = SetTcpEntry(ATCPTableRow) 'renter the row with the new state
If RetVal = 0 Then KillCon = True: Exit Function
KillCon = False
End Function
Public Function SuspendProg(ProcID As Long) As Boolean
Dim Ctr As Long, hThread As Long
Call GetThreads(ProcID)
If ThrdCnt Then
    For Ctr = 0 To ThrdCnt
        If TheThreads(Ctr).th32OwnerProcessID = ProcID Then
            hThread = OpenThread(THREAD_SUSPEND_RESUME, 0, CLng(TheThreads(Ctr).th32ThreadID))
            SuspendThread (hThread)
        End If
    Next
    SuspendProg = True
Else
    SuspendProg = False
End If
End Function
Public Function ResumeProg(ProcID As Long) As Boolean
Dim Ctr As Long, hThread As Long
Call GetThreads(ProcID)
If ThrdCnt Then
    For Ctr = 0 To ThrdCnt
        If TheThreads(Ctr).th32OwnerProcessID = ProcID Then
            hThread = OpenThread(THREAD_SUSPEND_RESUME, 0, CLng(TheThreads(Ctr).th32ThreadID))
            ResumeThread (hThread)
        End If
    Next
    ResumeProg = True
Else
    ResumeProg = False
End If
End Function
Private Function GetAppPath(ProcID As Long) As String
Dim hProc As Long, Size As Long, SizeNeeded As Long, _
       RetVal As Long, hProcMod As Long
Dim ModName As String, RetStr As String
hProc = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_SET_INFORMATION Or PROCESS_VM_READ, 0, ProcID)
If hProc = Null Then GoTo ErrTrap
RetVal = EnumProcessModules(hProc, hProcMod, LenB(hProcMod), SizeNeeded)
If RetVal = 0 Then GoTo ErrTrap
ModName = Space$(260)
RetVal = GetModuleFileNameExA(hProc, hProcMod, ModName, 260)
If RetVal Then
    RetStr = Left$(ModName, RetVal)
Else
ErrTrap:
    RetStr = GetProcessTitleFromID(ProcID)
End If
    GetAppPath = RetStr
End Function
Private Sub GetThreads(TheID As Long)
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
Public Function GetProcessTitleFromID(ProcessID As Long) As String  'Best Optmized String Maniplation
On Error Resume Next
    Dim HSnapshot As Long, lRet As Long, P As PROCESSENTRY32
    Dim SName As String
    P.dwSize = Len(P) 'Size Of The Processes Structure
    HSnapshot = CreateToolhelp32Snapshot(TH32CS_SNAPALL, ByVal 0) 'Take The SnapShot Of The Processes System
    If HSnapshot Then
        lRet = Process32First(HSnapshot, P) 'Fetch First Process
        Do While lRet
            SName = Mid$(P.szExeFile, 1, InStr(1, P.szExeFile, Chr$(0)) - 1) 'Fit The Name Of The Process
            If P.th32ProcessID = ProcessID Then
                GetProcessTitleFromID = SName
                Exit Do
            End If
            lRet = Process32Next(HSnapshot, P)
        Loop
        lRet = CloseHandle(HSnapshot) 'Close The SnapShot
    End If
End Function
Public Function EndProcess(ProcessID) As Boolean
    Dim lProcessHandle As Long
         Dim EXCODE As Long, PROCESS As Long
        'Give All Access Levels To The Process
         PROCESS = OpenProcess(PROCESS_ALL_ACCESS, 0, ProcessID)
             If PROCESS > 0 Then
                'Access Succeffully Gained
                 GetExitCodeProcess PROCESS, EXCODE
                 TerminateProcess PROCESS, EXCODE
                 DoEvents
                 EndProcess = True
             End If
         CloseHandle PROCESS
         DoEvents
End Function
Private Sub Alert(Index As Integer)
    ActiveFireWall = False
   'Suspend The Application First
   If Cells(Index).FleData.Path = App.Path & "\" & App.EXEName & ".exe" Then Exit Sub
    SuspendProg (Cells(Index).PID)
    With FireWall
         .TxtEditServer(2) = "Application : [" & Cells(Index).FleData.Path & "] Tries To Access The Network From Port [" & Cells(Index).LocalPort & "] " & ",So What Can I Do For That ?"
         .FireWallButtons(1).Enabled = False
         .ShowAlert
          Select Case .AppSatet
                 Case 0 'Allowed
                        'Nothing Done
                             SetDiskState Cells(Index).FleData.Path, 0
                 Case 1 'Blocked
                             SetDiskState Cells(Index).FleData.Path, 1
                 Case 2 'Ask For it next time
                             SetDiskState Cells(Index).FleData.Path, 2
          End Select
    End With
    ResumeProg (Cells(Index).PID)
    ActiveFireWall = True
End Sub
Private Function GetDiskState(AppPath As String) As Integer
    On Error GoTo Failed
    FFile = FreeFile
    Dim Item As AppDiskRecord, Index As Integer
    Open AppDiskFilePath For Random As #FFile Len = Len(Item)
        Do While Not EOF(FFile)
            Index = Index + 1
            Get #FFile, Index, Item
            If Trim$(Item.FullPath) = AppPath Then
                GetDiskState = Item.State
                Close #FFile
                Exit Function
            End If
        Loop
Failed:
    Close #FFile
    GetDiskState = 2 'Ask For The Application
End Function
Private Sub SetDiskState(AppPath As String, State As Byte)
    On Error Resume Next
    FFile = FreeFile
    Dim Item As AppDiskRecord, Index As Integer
    Open AppDiskFilePath For Random As #FFile Len = Len(Item)
        Do While Not EOF(FFile)
            Index = Index + 1
            Get #FFile, Index, Item
            If Trim$(Item.FullPath) = AppPath Then
                Item.State = State
                Put #FFile, Index, Item
                Close #FFile
                Frm_Main.ApplicationList.ListItems(AppPath).SubItems(1) = AccessStateConversion(State)
                Exit Sub
            End If
        Loop
       'New Item Will Be Inserted
        Item.FullPath = AppPath
        Item.State = State
        Put #FFile, Index, Item
    Close #FFile
       'Add The New Application To The Applications List
        With Frm_Main.ApplicationList
            .ListItems.Add , AppPath, Mid$(AppPath, InStrRev(Item.FullPath, "\") + 1)
            .ListItems(AppPath).SubItems(2) = AppPath
            .ListItems(AppPath).SubItems(1) = AccessStateConversion(Item.State)
        End With
End Sub
Private Sub LoadApplicationList()
    'ApplicationList
    On Error Resume Next
    FFile = FreeFile
    Dim Item As AppDiskRecord, AppPath As String, Index As Integer
    Open AppDiskFilePath For Random As #FFile Len = Len(Item)
        Do While Not EOF(FFile)
            Index = Index + 1
            Get #FFile, Index, Item
            AppPath = Trim$(Item.FullPath)
            If Mid$(AppPath, 2, 1) = ":" Then 'Ensure Right Path
                With Frm_Main.ApplicationList
                    .ListItems.Add , AppPath, Mid$(AppPath, InStrRev(Item.FullPath, "\") + 1)
                    .ListItems(AppPath).SubItems(1) = AccessStateConversion(Item.State)
                    .ListItems(AppPath).SubItems(2) = AppPath
                End With
            End If
        Loop
    Close #FFile
End Sub
Private Function AccessStateConversion(State As Byte) As String
    Select Case State
           Case 0
                AccessStateConversion = "Allowed"
           Case 1
                AccessStateConversion = "Blocked"
           Case 2
                AccessStateConversion = "Ask For"
           Case 3
                AccessStateConversion = "Process Ended"
           Case 4
                AccessStateConversion = "File Deleted"
           Case 5
                AccessStateConversion = "Suspended"
           Case Else
                AccessStateConversion = "Handled!"
    End Select
End Function
Private Function ErrorHandle(ErrNum As Integer)
'This function Handle the firewall errors that comes from the functions above
Dim MsgStr As String
    Select Case ErrNum
        Case 0
                
        Case 1
        
    End Select
End Function
Public Property Get RunFirewall() As Boolean
    RunFirewall = FirewallRunning
End Property
Public Property Let RunFirewall(ByVal vNewValue As Boolean)
    If vNewValue And Not FirewallRunning Then
        'Enable
         SetTimer WHandle, 1, 1000, AddressOf Check
         FirewallRunning = True
         LDFlag = False
    ElseIf Not vNewValue And FirewallRunning Then
        'Disable
         KillTimer WHandle, 1
         Frm_Main.ConnectionsList.ListItems.Clear
         FirewallRunning = False
    End If
End Property
