Attribute VB_Name = "Module2"
Option Explicit
Dim reg As Object, Pid As Variant, GUID As Variant
Dim LENGUID As Long, LENPID As Long, TempS As String
Dim x As Long, SPID As String, SGUID As String, HWID As String
Const regPID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductId"
Const regGUID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\MachineGuid"
Const hardID = ""

Public Function IsID(HardIDc As String) As Boolean
On Error Resume Next
App.Title = "Leak Protection"
Set reg = CreateObject("wscript.shell")
Pid = Replace(reg.regread(regPID), "-", "")
GUID = Replace(reg.regread(regGUID), "-", "")
LENPID = Len(Pid)
LENGUID = Len(GUID)
For x = 1 To LENPID
TempS = Hex((Asc(Mid$(Pid, x, 1)) Xor 23) Xor 14)
SPID = SPID & TempS
Next x
SPID = StrReverse(SPID)

For x = 1 To LENGUID
TempS = Hex((Asc(Mid$(GUID, x, 1)) Xor 23) Xor 14)
SGUID = SGUID & TempS
Next x
SGUID = StrReverse(SGUID)
HWID = StrReverse(SGUID & SPID)
If HWID = HardIDc Then IsID = True Else IsID = False
End Function
