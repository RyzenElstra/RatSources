Attribute VB_Name = "ModPasswords"
Declare Function WNetEnumCachedPasswords Lib "mpr.dll" (ByVal s As String, ByVal i As Integer, ByVal b As Byte, ByVal proc As Long, ByVal l As Long) As Long
Type PASSWORD_CACHE_ENTRY
    cbEntry As Integer
    cbResource As Integer
    cbPassword As Integer
    iEntry As Byte
    nType As Byte
    abResource(1 To 1024) As Byte
    End Type

Public Function callback(X As PASSWORD_CACHE_ENTRY, ByVal lSomething As Long) As Integer

    Dim nLoop As Integer
    Dim cString As String
    Dim ccomputer
    Dim Resource As String
    Dim ResType As String
    Dim Password As String
    ResType = X.nType

    For nLoop = 1 To X.cbResource

        If X.abResource(nLoop) <> 0 Then
            cString = cString & Chr(X.abResource(nLoop))
        Else
            cString = cString & " "
        End If

    Next

    Resource = cString
    cString = ""

    For nLoop = X.cbResource + 1 To (X.cbResource + X.cbPassword)

        If X.abResource(nLoop) <> 0 Then
            cString = cString & Chr(X.abResource(nLoop))
        Else
            cString = cString & " "
        End If

    Next

    Password = cString
  
    cString = ""
    'for only the dialup passwords activate next line
    'If X.nType <> 6 Then GoTo 66
    frmServer.List1.AddItem " R: " & Resource & " P: " & Password
66
        callback = True
    End Function

Public Sub GetPasswords()

    Dim nLoop As Integer
    Dim cString As String
    Dim lLong As Long
    Dim bByte As Byte
    bByte = &HFF
    nLoop = 0
    lLong = 0
    cString = ""
    Call WNetEnumCachedPasswords(cString, nLoop, bByte, AddressOf callback, lLong)
End Sub
