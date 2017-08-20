Attribute VB_Name = "mdSubClass"
Option Explicit

Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

'API Declarations used for subclassing.
Public Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSrc As Any, ByVal ByteLen As Long)

'Constants for GetWindowLong() and SetWindowLong() APIs.
Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long) As Long

Public Const GWL_WNDPROC = (-4)
Public Const GWL_USERDATA = (-21)

'Used to hold a reference to the control to call its procedure.
'NOTE: "UserControl1" is the UserControl.Name Property at
'      design-time of the .CTL file.
'      ('As Object' or 'As Control' does not work)
Dim objShadowObject As clsSocket

'Used as a pointer to the UserData section of a window.
Dim ptrObject As Long

'The address of this function is used for subclassing.
'Messages will be sent here and then forwarded to the
'UserControl's WindowProc function. The HWND determines
'to which control the message is sent.
Public Function SubWndProc(ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long

   On Error Resume Next

   'Get pointer to the control's VTable from the
   'window's UserData section. The VTable is an internal
   'structure that contains pointers to the methods and
   'properties of the control.
   ptrObject = GetWindowLong(hwnd, GWL_USERDATA)

   'Copy the memory that points to the VTable of our original
   'control to the shadow copy of the control you use to
   'call the original control's WindowProc Function.
   'This way, when you call the method of the shadow control,
   'you are actually calling the original controls' method.
   CopyMemory objShadowObject, ptrObject, 4

   'Call the WindowProc function in the instance of the UserControl.
   SubWndProc = objShadowObject.WindowProc(hwnd, Msg, wParam, lParam)

   'Destroy the Shadow Control Copy
   CopyMemory objShadowObject, 0&, 4
   
   Set objShadowObject = Nothing

End Function
