VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Omega Server Remover"
   ClientHeight    =   1170
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   3810
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1170
   ScaleWidth      =   3810
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdRemove 
      Caption         =   "Remove"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   930
      TabIndex        =   0
      Top             =   330
      Width           =   2000
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Copyright © 2001 By TSH"
      Height          =   195
      Left            =   1860
      TabIndex        =   2
      Top             =   870
      Width           =   1845
   End
   Begin VB.Label lblTemp 
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   1590
      Visible         =   0   'False
      Width           =   675
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   150
      Picture         =   "Form1.frx":0442
      Top             =   240
      Width           =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Copyright © 2001 By TSH
Option Explicit
Dim ServPath As String
Private Const ServSetting As String = "WIN32.DLL" 'server setting filename
Private Const ServName As String = "WIN32.EXE" 'server filename
Private Const ServKey As String = "WIN32" 'server keyname

Private Sub cmdRemove_Click()
On Error GoTo errHandle

ServPath = Get_SysPath & ServName

If FileExists(ServPath) Then
   SaveProfile "windows", "run", " ", "win.ini"
   If GetWindows Then
      DeleteStringKey HKEY_LOCAL_MACHINE, WinInfo & "\Run", ServKey
      DeleteStringKey HKEY_LOCAL_MACHINE, WinInfo & "\RunServices", ServKey
   Else
      DeleteStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\Run", ServKey
      DeleteStringKey HKEY_LOCAL_MACHINE, WinInfoNT & "\RunServices", ServKey
   End If

   Call CloseServer
   DoEvents
   Sleep 200
   If FileExists(ServPath) Then
      Kill ServPath
   End If
   If FileExists(Get_WinPath & ServSetting) Then
      Kill Get_WinPath & ServSetting
   End If
   If FileExists(Get_SysPath & "KEYLOG.TXT") Then
      Kill Get_SysPath & "KEYLOG.TXT"
   End If
   If FileExists(Get_WinPath & "desktop.jpg") Then
      Kill Get_WinPath & "desktop.jpg"
   End If
   If FileExists(Get_WinPath & "preview.jpg") Then
      Kill Get_WinPath & "preview.jpg"
   End If
   MsgBox "Remove Server successfully.", vbInformation, "Remove Server"
Else
  MsgBox "Server not found.", vbInformation, "Remove Server"
End If

Exit Sub
errHandle:
MsgBox Err.Description, vbExclamation, "Remove Server"
End Sub

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
