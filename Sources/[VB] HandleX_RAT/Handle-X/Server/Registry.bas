Attribute VB_Name = "Registry"
'-------- <Used Constants
Private Const ERROR_NO_MORE_ITEMS = 259&

Private Const HKEY_CLASSES_ROOT = &H80000000
Private Const HKEY_CURRENT_USER = &H80000001
Private Const HKEY_LOCAL_MACHINE = &H80000002
Private Const HKEY_USERS = &H80000003
Private Const HKEY_PERFORMANCE_DATA = &H80000004
Private Const HKEY_CURRENT_CONFIG = &H80000005
Private Const HKEY_DYN_DATA = &H80000006

Public Const REG_BINARY = 3                     ' Free form binary
Public Const REG_DWORD = 4                      ' 32-bit number
Public Const REG_SZ = 1                         ' Unicode nul terminated string

Const REG_OPTION_VOLATILE = 1           ' Key is not preserved when system is rebooted
Const REG_OPTION_NON_VOLATILE = 0       ' Key is preserved when system is rebooted
Const STANDARD_RIGHTS_ALL = &H1F0000
Const SYNCHRONIZE = &H100000
Const READ_CONTROL = &H20000
Const STANDARD_RIGHTS_READ = (READ_CONTROL)
Const STANDARD_RIGHTS_WRITE = (READ_CONTROL)
Const KEY_CREATE_LINK = &H20
Const KEY_CREATE_SUB_KEY = &H4
Const KEY_ENUMERATE_SUB_KEYS = &H8
Const KEY_NOTIFY = &H10
Const KEY_QUERY_VALUE = &H1
Const KEY_SET_VALUE = &H2
Const KEY_READ = ((STANDARD_RIGHTS_READ Or KEY_QUERY_VALUE Or KEY_ENUMERATE_SUB_KEYS Or KEY_NOTIFY) And (Not SYNCHRONIZE))
Const KEY_WRITE = ((STANDARD_RIGHTS_WRITE Or KEY_SET_VALUE Or KEY_CREATE_SUB_KEY) And (Not SYNCHRONIZE))
Const KEY_EXECUTE = (KEY_READ)

'-------- <Used Variables
    
'-------- <Used Types & Enums
Enum RunAction
       Delete
       RunOnce
       RunEveryStartUp
End Enum
'-------- <API Functions
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Private Declare Function RegEnumKeyEx Lib "advapi32.dll" Alias "RegEnumKeyExA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpName As String, lpcbName As Long, ByVal lpReserved As Long, ByVal lpClass As String, lpcbClass As Long, lpftLastWriteTime As Any) As Long
Private Declare Function RegEnumValue Lib "advapi32.dll" Alias "RegEnumValueA" (ByVal hKey As Long, ByVal dwIndex As Long, ByVal lpValueName As String, lpcbValueName As Long, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
Private Declare Function RegCreateKeyEx Lib "advapi32.dll" Alias "RegCreateKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal Reserved As Long, ByVal lpClass As String, ByVal dwOptions As Long, ByVal samDesired As Long, lpSecurityAttributes As Any, phkResult As Long, lpdwDisposition As Long) As Long
Private Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Private Declare Function RegSetValueEx Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpData As Any, ByVal cbData As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long
Public Function ReadMainKeyClasses() As String
On Error GoTo Failed
'This function returns the classes of main key in the regidtry system in current windows system
 Dim hKey As Long, IRet As Long
    ReadMainKeyClasses = "T"
    For i = 0 To 6
        hKey = i Or &H80000000
            IRet = RegOpenKey(hKey, vbNullString, hKey)
            If IRet = 0 Then
               ReadMainKeyClasses = ReadMainKeyClasses & i & Chr$(0)
               RegCloseKey hKey
            End If
    Next
    Exit Function
Failed:
    ReadMainKeyClasses = "F" & Err.Description
End Function
Public Function Reg_ReaDKeys(hKey As Long, Path As String) As String
On Error GoTo Failed
  Dim SName As String, SData As String, Values As String
  Dim Nkey As Long, Cnt As Long, Ret As Long, RetData As Long, RetClass As Long
  Const BUFFER_SIZE As Long = 255
  Reg_ReaDKeys = hKey & "\" & Path & Chr$(0)
  hKey = hKey Or &H80000000
   'Open a registry key
    If RegOpenKey(hKey, Path, Nkey) = 0 Then
       'Create a buffer
        SName = Space(BUFFER_SIZE)
        Ret = BUFFER_SIZE
       'Enumerate the keys
Start:
        Retur = RegEnumKeyEx(Nkey, Cnt, SName, Ret, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&)
        If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
           GoTo Endloop
        End If
            'Insert The Found Key
             Reg_ReaDKeys = Reg_ReaDKeys & Left$(SName, Ret) & Chr$(0)
             DoEvents
            'prepare for the next key
             Cnt = Cnt + 1
             SName = Space(BUFFER_SIZE)
             Ret = BUFFER_SIZE
             GoTo Start
Endloop:
       'Initialize The Values
        SData = Space(BUFFER_SIZE)
        RetData = BUFFER_SIZE
        Cnt = 0
       'Enumerate the values
Start1:
        Retur = RegEnumValue(Nkey, Cnt, SName, Ret, 0, RetClass, ByVal SData, RetData)
        If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
            GoTo Endloop1
        End If
           'Insert The Value Information
            If RetData > 0 Then
             If RetClass > 2 And RetClass < 5 Then   'Binary Values
                Values = Values & Left$(SName, Ret) & Chr$(0) & RetClass & Chr$(0) & Binary(Left(SData, RetData)) & vbCrLf
             Else
                Values = Values & Left$(SName, Ret) & Chr$(0) & RetClass & Chr$(0) & Left(SData, RetData) & vbCrLf
             End If
            End If
            DoEvents
           'Prepare for next value
            Cnt = Cnt + 1
            SName = Space(BUFFER_SIZE)
            SData = Space(BUFFER_SIZE)
            Ret = BUFFER_SIZE
            RetData = BUFFER_SIZE
            GoTo Start1
Endloop1:
        Reg_ReaDKeys = Reg_ReaDKeys & Chr$(0) & Values
       'Close the registry key
        RegCloseKey hKey
    Else
        Err.Raise 112, , "Unable To Open This Key"
    End If
    Exit Function
Failed:
    Reg_ReaDKeys = "F" & Reg_ReaDKeys & Chr$(0) & Err.Description
End Function
Public Function Reg_CreateKey(hKey As Long, Named_Path As String)
On Error GoTo Failed
Dim Nkey As Long
Dim Ret As Long
  Reg_CreateKey = hKey & "\" & Named_Path
  hKey = hKey Or &H80000000
    'Check if the specified key exists
     RegOpenKey hKey, Named_Path, Nkey
    'If the key doesn't exist, we create it
     If Nkey <> 0 Then
        Err.Raise 110, , "Key Is Already Existed"
     End If
    'Create a new key
     RegCreateKeyEx hKey, Named_Path, 0, "REG_DWORD", REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, ByVal 0&, Nkey, Ret
       If Nkey = 0 Then
            Err.Raise 111, "Unable To Creat This NewKey"
        End If
     RegCloseKey result
     Reg_CreateKey = "T" & Reg_CreateKey
     Exit Function
Failed:
    Reg_CreateKey = "F" & Reg_CreateKey & Chr$(0) & Err.Description
End Function
Public Function Reg_DeleteKey(hKey As Long, Path As String)
On Error GoTo Failed
Dim SName As String
Dim Nkey As Long, Cnt As Long, Ret As Long, Retur As Long
  Reg_DeleteKey = hKey & "\" & Path
  hKey = hKey Or &H80000000
  Const BUFFER_SIZE As Long = 255
    If RegOpenKey(hKey, Path, Nkey) = 0 Then
        SName = Space(BUFFER_SIZE)
        Ret = BUFFER_SIZE
        Cnt = 0
Start:
           Retur = RegEnumKeyEx(Nkey, Cnt, SName, Ret, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&)
           If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
               GoTo Endloop
           End If
           DoEvents
           If Path <> vbNullString Then
                Reg_DeleteKey hKey, Path & "\" & Left$(SName, Ret)
           Else
                Reg_DeleteKey hKey, Left$(SName, Ret)
           End If
           SName = Space(BUFFER_SIZE)
           Ret = BUFFER_SIZE
           GoTo Start
Endloop:
        RegDeleteKey hKey, Path
        RegCloseKey Nkey
    Else
        Err.Raise 112, , "Unable To Access This Key"
    End If
    Reg_DeleteKey = "T" & Reg_DeleteKey
    Exit Function
Failed:
    Reg_DeleteKey = "F" & Reg_DeleteKey & Chr$(0) & Err.Description
End Function
Public Function Reg_FindKey(hKey As Long, Path As String, Pattern As String) As String
On Error Resume Next
Dim SName As String, Val As String
Dim Nkey As Long, Cnt As Long, Ret As Long, Retur As Long
  Const BUFFER_SIZE As Long = 255
  hKey = hKey Or &H80000000
    If RegOpenKey(hKey, Path, Nkey) = 0 Then
       SName = Space(BUFFER_SIZE)
       Ret = BUFFER_SIZE
       Cnt = 0
Start:
      Retur = RegEnumKeyEx(Nkey, Cnt, SName, Ret, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&)
       If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
         GoTo Endloop
       End If
       If LCase(Left$(SName, Ret)) Like LCase(Pattern) Then
            Reg_FindKey = Reg_FindKey & vbCrLf & Path & "\" & Left$(SName, Ret)
       End If
       DoEvents
       If Path <> vbNullString Then
            Val = Reg_FindKey(hKey, Path & "\" & Left$(SName, Ret), Pattern)
       Else
            Val = Reg_FindKey(hKey, Left$(SName, Ret), Pattern)
       End If
       Cnt = Cnt + 1
       If Len(Val) > 0 Then
            Reg_FindKey = Reg_FindKey & Val
       End If
       SName = Space(BUFFER_SIZE)
       Ret = BUFFER_SIZE
       GoTo Start
Endloop:
        RegCloseKey Nkey
    End If
End Function
Public Function Reg_FindValues(hKey As Long, Path As String, Pattern As String) As String
On Error Resume Next
Dim SName As String, Val As String, SData As String, SValue As String
Dim Nkey As Long, Cnt As Long, Ret As Long, RetData As Long, RetClass As Long, retVal As Long, Retur As Long
Const BUFFER_SIZE As Long = 255
hKey = hKey Or &H80000000
    If RegOpenKey(hKey, Path, Nkey) = 0 Then
        SValue = Space(BUFFER_SIZE)
        retVal = BUFFER_SIZE
        SData = Space(BUFFER_SIZE)
        RetData = BUFFER_SIZE
        Cnt = 0
Start:
        Retur = RegEnumValue(Nkey, Cnt, SValue, retVal, 0, RetClass, ByVal SData, RetData)
        If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
            GoTo Endloop
        End If
       'Insert Item
         If LCase(Left$(SValue, retVal)) Like LCase(Pattern) Then
            If RetData > 0 Then
                If Reg_FindValues = "" Then
                        Reg_FindValues = Path & "\" & Left$(SValue, retVal) & " = " & Left(SData, RetData - 1)
                Else
                        Reg_FindValues = Values & Path & "\" & Left$(SValue, retVal) & " = " & Left(SData, RetData - 1)
                End If
            End If
         End If
         DoEvents
        'Prepare for next value
         Cnt = Cnt + 1
         SValue = Space(BUFFER_SIZE)
         SData = Space(BUFFER_SIZE)
         retVal = BUFFER_SIZE
         RetData = BUFFER_SIZE
         GoTo Start
Endloop:
        Cnt = 0
        SName = Space(BUFFER_SIZE)
        Ret = BUFFER_SIZE
Start1:
        Retur = RegEnumKeyEx(Nkey, Cnt, SName, Ret, ByVal 0&, vbNullString, ByVal 0&, ByVal 0&)
        If Retur = ERROR_NO_MORE_ITEMS Or Retur <> 0 Then
             GoTo Endloop1
        End If
        DoEvents
        If Path <> vbNullString Then
            Val = Reg_FindValues(hKey, Path & "\" & Left$(SName, Ret), Pattern)
        Else
            Val = Reg_FindValues(hKey, Left$(SName, Ret), Pattern)
        End If
        Cnt = Cnt + 1
        If Val <> "" Then
            If Reg_FindValues = "" Then
                Reg_FindValues = Val
            Else
                Reg_FindValues = Reg_FindValues & vbCrLf & Val
            End If
        End If
        SName = Space(BUFFER_SIZE)
        Ret = BUFFER_SIZE
        GoTo Start1
Endloop1:
        RegCloseKey Nkey
    End If
End Function
Public Function Reg_CreateValue(ByVal hKey As Long, ByVal Path As String, ByVal ValueName As String, Value As Variant) As String
   On Error GoTo Failed
   Dim handle As Long
   Dim lngValue As Long
   Dim strValue As String
   Dim binValue() As Byte
   Dim length As Long
   Dim retVal As Long
  'Open the key, exit if not found
   If RegOpenKey(hKey, Path, handle) Then
       Err.Raise 114, , "Unable To Get Access To This Key Class"
   End If
  'Three cases, according to the data type in Value
   Select Case VarType(Value)
       Case vbInteger, vbLong
           lngValue = Value
           retVal = RegSetValueEx(handle, ValueName, 0, REG_DWORD, lngValue, 4)
       Case vbString
           strValue = Value
           retVal = RegSetValueEx(handle, ValueName, 0, REG_SZ, ByVal strValue, Len(strValue))
       Case vbArray + vbByte
           binValue = Value
           length = UBound(binValue) - LBound(binValue) + 1
           retVal = RegSetValueEx(handle, ValueName, 0, REG_BINARY, binValue(LBound(binValue)), length)
       Case Else
           RegCloseKey handle
           Err.Raise 1001, , "Unsupported value type"
   End Select
  'Close the key and signal success
   RegCloseKey handle
  'Signal success if the value was written correctly
   If retVal = 0 Then 'Success
        Reg_CreateValue = "T" & ValueName & Chr$(0) & Value
   Else
        Err.Raise 123, , "Unable To Creat This Value"
   End If
   Exit Function
Failed:
   Reg_CreateValue = "F" & Chr$(0) & ValueName
End Function
Public Function Reg_RenameValue(hKey As Long, Path As String, VName As String, NName As String) As String
On erorr GoTo Failed
Dim Nkey As Long, Ret As Long, Reg_Type As Long, Int_Buf As Integer, Lng_Buf As Long, Str_Buf As String, Data_Size As Long
    RegOpenKey hKey, Path, Nkey
    Ret = RegQueryValueEx(Nkey, VName, 0, Reg_Type, ByVal 0, Data_Size)
    If Reg_Type = REG_SZ Then
       Dim Data() As Byte
        Str_Buf = String(Data_Size, Chr$(0))
        Ret = RegQueryValueEx(Nkey, VName, 0, Reg_Type, ByVal Str_Buf, Data_Size)
        RegDeleteValue Nkey, VName
        Data = StrConv(Left$(Str_Buf, InStr(1, Str_Buf, Chr$(0))), vbFromUnicode)
        RegSetValueEx Nkey, NName, 0, Reg_Type, Data(0), Data_Size
    ElseIf Reg_Type = REG_BINARY Then
        Ret = RegQueryValueEx(Nkey, VName, 0, Reg_Type, Int_Buf, Data_Size)
        RegDeleteValue Nkey, VName
        RegSetValueEx Nkey, NName, 0, Reg_Type, Int_Buf, Data_Size
    ElseIf Reg_Type = REG_DWORD Then
        Ret = RegQueryValueEx(Nkey, VName, 0, Reg_Type, Lng_Buf, Data_Size)
        RegDeleteValue Nkey, VName
        RegSetValueEx Nkey, NName, 0, Reg_Type, Lng_Buf, Data_Size
    End If
    RegCloseKey Nkey
    If Ret = 0 Then 'Success
         Reg_RenameValue = "T" & VName & Chr$(0) & NName
    Else
         Err.Raise 124, , "Unable To Rename This Value"
    End If
    Exit Function
Failed:
    Reg_RenameValue = "F" & VName & Chr$(0) & Err.Description
End Function
Public Function Reg_ModifyValue(hKey As Long, Path As String, VName As String, Nvalue As String) As String
On Error GoTo Failed
Dim Nkey As Long, Ret As Long
Dim Data() As Byte
  'Open the Key
    RegOpenKey hKey, Path, Nkey
    If Nvalue = "" Then
        ReDim Data(0)
        Data(0) = 0
    Else
        Data = StrConv(Nvalue, vbFromUnicode)
    End If
    Ret = RegSetValueEx(Nkey, VName, 0, REG_SZ, Data(0), UBound(Data) + 1)
    RegCloseKey Nkey
    If Ret = 0 Then 'Success
         Reg_ModifyValue = "T" & VName & Chr$(0) & Nvalue
    Else
         Err.Raise 125, , "Unable To Modify This Value"
    End If
    Exit Function
Failed:
    Reg_ModifyValue = "F" & VName & Chr$(0) & Err.Description
End Function
Public Function Reg_DeleteValue(hKey As Long, Path As String, VName As String) As String
On Error GoTo Failed
Dim Nkey As Long, Ret As Long
  'Open the Key
    RegOpenKey hKey, Path, Nkey
    Ret = RegDeleteValue(Nkey, VName)
    RegCloseKey Nkey
    If Ret = 0 Then 'Success
         Reg_DeleteValue = "T" & VName & Chr$(0)
    Else
         Err.Raise 125, , "Unable To Modify This Value"
    End If
    Exit Function
Failed:
    Reg_DeleteValue = "F" & VName & Chr$(0) & Err.Description
End Function
Private Function Binary(Str As String) As String
    Dim Real As Currency, i As Integer
   'Calc The Real Val First
    For i = 1 To Len(Str)
        Real = Real + (Asc(Mid$(Str, i, 1)) * 256 ^ (i - 1))
    Next
    Binary = Real
End Function
Public Function SwitchRegClasses(HkeyLong As String) As String
    'On Error Resume Next
        'Convert To long to String
         Select Case HkeyLong
                Case 0
                    SwitchRegClasses = "HKEY_CLASSES_ROOT"
                Case 1
                    SwitchRegClasses = "HKEY_CURRENT_USER"
                Case 2
                    SwitchRegClasses = "HKEY_LOCAL_MACHINE"
                Case 3
                    SwitchRegClasses = "HKEY_USERS"
                Case 4
                    SwitchRegClasses = "HKEY_PERFORMANCE_DATA"
                Case 5
                    SwitchRegClasses = "HKEY_CURRENT_CONFIG"
                Case 6
                    SwitchRegClasses = "HKEY_DYN_DATA"
                Case Else
                    SwitchRegClasses = "Unknown Class!"
         End Select
End Function
