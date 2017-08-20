Attribute VB_Name = "Keyboard"
'keyboard control
Public Declare Function MapVirtualKey Lib "user32" Alias "MapVirtualKeyA" (ByVal wCode As Long, ByVal wMapType As Long) As Long
'Show Key State
Public Declare Function GetKeyState% Lib "user32" (ByVal nVirtKey%)

Public Sub ToggleKeyCaps() 'Set Caps Lock
On Error Resume Next
    Call keybd_event(vbKeyCapital, MapVirtualKey(vbKeyCapital, 0), 1 Or 0, 0)
    Call keybd_event(vbKeyCapital, MapVirtualKey(vbKeyCapital, 0), 1 Or 2, 0)
End Sub

Public Sub ToggleKeyScroll() 'Set Scroll Lock
On Error Resume Next
    Call keybd_event(145, MapVirtualKey(145, 0), 1 Or 0, 0)
    Call keybd_event(145, MapVirtualKey(145, 0), 1 Or 2, 0)
End Sub

Public Sub ToggleKeyNumlock() 'Set Num Lock (NT)
On Error Resume Next
    Call keybd_event(vbKeyNumlock, MapVirtualKey(vbKeyNumlock, 0), 1 Or 0, 0)
    Call keybd_event(vbKeyNumlock, MapVirtualKey(vbKeyNumlock, 0), 1 Or 2, 0)
End Sub

