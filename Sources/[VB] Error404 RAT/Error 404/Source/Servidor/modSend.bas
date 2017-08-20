Attribute VB_Name = "modSend"
Option Explicit

Public Sub Send(datos As String)
On Error Resume Next
frmMain.WS.SendData datos
End Sub

