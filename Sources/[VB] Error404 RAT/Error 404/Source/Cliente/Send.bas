Attribute VB_Name = "modSend"
Option Explicit

Public Sub Send(datos As String)
On Error Resume Next
frmMain.sckMain(frmMain.TotalIndex - 1).SendData datos
End Sub
