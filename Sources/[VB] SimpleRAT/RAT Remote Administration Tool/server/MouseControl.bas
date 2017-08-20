Attribute VB_Name = "MouseControl"
'show cursor
Public Declare Function ShowCursor Lib "user32" (ByVal bShow As Long) As Long
'swap mouse button
Public Declare Function SwapMouseButton Lib "user32.dll" (ByVal bSwap As Long) As Long
'Set Cursor Position
Public Declare Function SetCursorPos Lib "user32" (ByVal X As Long, ByVal Y As Long) As Long
'Set Double Click Time
Public Declare Function SetDoubleClickTime Lib "user32.dll" (ByVal wCount As Long) As Long




