Attribute VB_Name = "Module6"
Public Declare Function EnumProcessModules Lib "psapi.dll" (ByVal hProcess As Long, ByRef lphModule As Long, ByVal cb As Long, ByRef cbNeeded As Long) As Long
Public Declare Function GetModuleFileNameExA Lib "psapi.dll" (ByVal hProcess As Long, ByVal hModule As Long, ByVal ModuleName As String, ByVal nSize As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function OpenProcess Lib "Kernel32.dll" (ByVal dwDesiredAccessas As Long, ByVal bInheritHandle As Long, ByVal dwProcId As Long) As Long

Public Const MAX_PATH As Integer = 260
Public Const PROCESS_VM_READ = &H10
Public Const PROCESS_QUERY_INFORMATION = &H400

Public Function Sandboxed()
Dim PID As Long, lFileName As Long, hModules As Long, lOpen As Long, sModules(1 To 1000) As Long, sName As String, cbNeeded As Long
Dim sNameVars() As String, iNameCnt As Integer
PID = GetCurrentProcessId
lOpen = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_VM_READ, 0, PID)
hModules = EnumProcessModules(lOpen, sModules(1), 1024 * 4, cbNeeded)
hModules = cbNeeded
For i = 1 To hModules - 1
    sName = Space(MAX_PATH)
        lFileName = GetModuleFileNameExA(lOpen, sModules(i), sName, MAX_PATH)
        sNameVars = Split(sName, "\")
        iNameCnt = UBound(sNameVars())
       
    If Left(sNameVars(iNameCnt), 7) = "SbieDll" Then
    MsgBox "                No Sandbox" & vbCrLf & "This Program Will Not Work Under Sandboxie", vbCritical, "Sandbox"
    End
        End If
Next i
End Function
Public Function sandboxDetecT()
Sandboxed
End Function
