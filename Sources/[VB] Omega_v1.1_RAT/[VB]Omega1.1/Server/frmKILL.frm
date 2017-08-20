VERSION 5.00
Begin VB.Form frmKILL 
   BorderStyle     =   4  'Fixed ToolWindow
   ClientHeight    =   585
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   1695
   Icon            =   "frmKILL.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   585
   ScaleWidth      =   1695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Visible         =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   1000
      Left            =   0
      Top             =   0
   End
   Begin VB.Label lblTemp 
      Height          =   195
      Left            =   360
      TabIndex        =   0
      Top             =   180
      Visible         =   0   'False
      Width           =   945
   End
End
Attribute VB_Name = "frmKILL"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Const ServKey As String = "WIN32" 'server keyname
Private Const ServName As String = "WIN32.EXE" 'server filename
Dim killPath As String, ServPath As String
Dim StrShortPath As String, MyCommand As String
Private hProg1 As Long 'process handle
Private idProg1 As Long 'process ID
Private iExit1 As Long 'exit code

Function cPath() As String
If Right(App.Path, 1) <> "\" Then
   cPath = App.Path & "\"
End If
End Function

Private Sub CloseServer()
Dim uProcess As PROCESSENTRY32
Dim lprocesshandle As Long
Dim hSnapShot, r As Long

hSnapShot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0&)
'on error
If hSnapShot = 0 Then Exit Sub
'prepare for API call
uProcess.dwSize = Len(uProcess)
'get first program
r = Process32First(hSnapShot, uProcess)
'loop while progs are still being found
Do While r
 lblTemp.Caption = Trim(LCase(uProcess.szExeFile))
 If lblTemp.Caption = LCase(ServPath) Then
  lprocesshandle = OpenProcess(&H1F0FFF, 0, uProcess.th32ProcessID)
  idProg1 = uProcess.th32ProcessID
  'on error exit
  If lprocesshandle = 0 Then Exit Sub
  'terminate program
  TerminateProcess lprocesshandle, 0
  'disconnect link
  CloseHandle lprocesshandle
 End If
 'get next program
 r = Process32Next(hSnapShot, uProcess)
Loop
'close handle to free resource
CloseHandle hSnapShot
lblTemp.Caption = ""
End Sub

Private Sub Form_Initialize()
On Error Resume Next
Dim i As Integer

   ServPath = Get_SysPath & ServName

   killPath = Get_WinPath & "kill.bat"
   If FileExists(killPath) Then Kill killPath

   StrShortPath = GetShortPath(cPath & App.EXEName & ".EXE")
   
   MyCommand = "@echo off" & vbCrLf & "del " & StrShortPath & vbCrLf
   MyCommand = MyCommand & "del " & killPath & Chr(26)

   Open killPath For Append As #1
   Print #1, MyCommand
   Close #1
   DoEvents
   
   If FileExists(Get_WinPath & "KEYLOG.TXT") Then Kill Get_WinPath & "KEYLOG.TXT"
   If FileExists(Get_WinPath & "WIN32.DLL") Then Kill Get_WinPath & "WIN32.DLL"
   
   Call CloseServer
   DoEvents
   hProg1 = OpenProcess(PROCESS_ALL_ACCESS, False, idProg1)
   GetExitCodeProcess hProg1, iExit1

End Sub

Private Sub Timer1_Timer()
If iExit1 = STILL_ACTIVE Then 'if haven't close
   GetExitCodeProcess hProg1, iExit1
   Call CloseServer
   DoEvents
Else 'is closed
   If FileExists(ServPath) Then Kill ServPath
   Unload Me
   Shell killPath, vbHide
End If
End Sub
