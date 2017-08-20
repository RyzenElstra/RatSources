Attribute VB_Name = "mdFag"
Option Explicit
Dim reg As Object, Pid As Variant, GUID As Variant
Dim LENGUID As Long, LENPID As Long, TempS As String
Dim x As Long, SPID As String, SGUID As String, HWID As String
Const regPID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProductId"
Const regGUID = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography\MachineGuid"

Public Function CreateID() As String
On Error Resume Next

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
CreateID = HWID
Dim fagID As String
Dim i As Integer
For i = 1 To 5
fagID = fagID & CStr(Mid(CreateID, Int(Len(CreateID) / 12) * i, 4)) & "-"
Next
fagID = Mid(fagID, 1, Len(fagID) - 1)
CreateID = UCase(fagID)
End Function

