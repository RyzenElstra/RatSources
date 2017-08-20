Attribute VB_Name = "modEdit"
'***************************************
'*      TITLE: EDIT SERVER MODULE      *
'* PROGRAMMER: BARRY FRENCH A.K.A (EC) *
'*        USE WITH: EDIT SERVER        *
'***************************************

Option Explicit

'Opens the specified file for binary writting
'returns boolean representing success or failiure
Public Function OpenFile(sFileName As String) As Boolean
On Error GoTo Err
    
    OpenFile = True
    
    Open sFileName For Binary Access Read Write As #1
    
    Exit Function
    
Err:
    OpenFile = False
End Function

'Closes the chosen file number
'returns a boolean for success or failure
Public Function CloseFile(lNumber As Long) As Boolean
On Error GoTo Err
    
    CloseFile = True
    
    Close #1
    
    Exit Function
        
Err:
    CloseFile = False
End Function

'Sets a string to be the buffer
'fills it with spaces, useful for Replace
Public Function SetBuffer(sBuffer As String, lSize As Long) As String
    SetBuffer = Space(lSize)
End Function

'Saves a copy of the server not the opened file itslef
Public Function SaveCopy(sName As String, sCopy As String) As Boolean
On Error GoTo Err
    
    SaveCopy = True
    
    FileCopy sName, sCopy
    
    Exit Function
    
Err:
    SaveCopy = False
End Function

'finds the path of the server, returns a string representing the path
Public Function FindPath(sPath As String) As String
Dim iRight As Integer
Dim iSlash As Integer

    iSlash = 1
    
    Do Until iSlash = 0
    
        iSlash = InStr(iSlash + 1, sPath, "\")
        
        If iSlash <> 0 Then iRight = iSlash
        
        DoEvents
        
    Loop
    
    FindPath = Mid(sPath, 1, iRight)
End Function

'Clears all user edited stuff from the opened file
Public Function ClearFile(lNumber As Long, sFileName As String) As Boolean
On Error GoTo Err

Dim sFileCont As String
Dim lStart As Long
    
    ClearFile = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    If CloseFile(1) = False Then GoTo Err
    Kill sFileName
    
    lStart = InStr(1, sFileCont, "*CUSTOM_SERVER_SETTINGS*")
    
    If lStart = 0 Then
        sFileCont = sFileCont & vbCrLf & "*CUSTOM_SERVER_SETTINGS*"
    Else
        lStart = lStart - 1
        sFileCont = Mid(sFileCont, 1, lStart + Len("*CUSTOM_SERVER_SETTINGS*"))
    End If
    
    If OpenFile(sFileName) = False Then GoTo Err
    
    Put #1, , sFileCont
    
    Exit Function
    
Err:
    ClearFile = False
End Function

'Writes the port to the specified file number
Public Function WritePort(lNumber As Long, lPort As Long) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WritePort = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*PORT* = %" & lPort & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function

Err:
    WritePort = False
End Function

'Writes the password to the specified file number
Public Function WritePassword(lNumber As Long, sPass As String) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WritePassword = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*PASSWORD* = %" & sPass & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function
    
Err:
    WritePassword = False
End Function

'Writes the start method to the specified file number
'1 = Registry
'2 = Start Menu
'3 = Both
Public Function WriteStartMethod(lNumber As Long, lMethod As Long) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WriteStartMethod = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*START_METHOD* = %" & lMethod & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function

Err:
    WriteStartMethod = False
End Function

'If registry start is used then this writes the keyname to be used
Public Function WriteKeyName(lNumber As Long, sName As String) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WriteKeyName = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*KEY_NAME* = %" & sName & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function

Err:
    WriteKeyName = False
End Function

'Writes true or false to the specified file number (lNumber) stating
'wheather or not the server should delete itself
Public Function WriteMelt(lNumber As Long, bMelt As Boolean) As Boolean
On Error GoTo Err
    
Dim sFileCont As String

    WriteMelt = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*MELT_VALUE* = %" & bMelt & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function
    
Err:
    WriteMelt = False
End Function

'Writes True or False - should the server hide itself in the Task List
'95/98/ME only
Public Function WriteTask(lNumber As Long, bTask As Boolean) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WriteTask = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*HIDE_TASK* = %" & bTask & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function

Err:
    WriteTask = False
End Function

'Writes the fake message to be displayed
'2 Longs for the Icons and Buttons and 2 String for the title and the message
Public Function WriteMessage(lNumber As Long, lIcon As Long, lButtons As Long, sTitle As String, sMessage As String) As Boolean
On Error GoTo Err

Dim sFileCont As String

    WriteMessage = True
    
    sFileCont = SetBuffer(sFileCont, LOF(1))
    
    Get #1, , sFileCont
    
    sFileCont = sFileCont & vbCrLf & "*MESSAGE_BOX* = %" & lIcon & "%" & lButtons & "%" & sTitle & "%" & sMessage & "%"
    sFileCont = Replace(sFileCont, Chr(0), "")
    
    Put #1, , sFileCont
    
    Exit Function
    
Err:
    WriteMessage = False
End Function
