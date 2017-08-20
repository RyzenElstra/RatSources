Attribute VB_Name = "ModPriority"

Option Explicit

Public Declare Function GetCurrentProcess Lib "kernel32" _
    () As Long
Public Declare Function SetPriorityClass Lib "kernel32" _
    (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long

Const REALTIME_PRIORITY_CLASS = &H100

Sub SetPriority()
        
    Dim Ret As Long
    
    Ret = SetPriorityClass(GetCurrentProcess, REALTIME_PRIORITY_CLASS)

End Sub


