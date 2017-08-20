Attribute VB_Name = "Module1"
Option Explicit

Public Sub enviar(datos As String)
On Error Resume Next
Form1.WS(Form1.TotalIndex - 1).SendData datos
End Sub





