Attribute VB_Name = "modBase64"
Option Explicit

Public Function sBase64Decode(BASE64TEXT_IN As String) As String
    'return the original data in a string, from a given Base64 encoded text
    
    Dim i As Long, sText As String, rc As Integer
    Dim sFour As String, sThree As String
    Dim sOut As String
    
    sText = sRemoveWhitespace(BASE64TEXT_IN)    'get working copy of base64 text
    
    For i = 1 To Len(sText) Step 4 'for the entire base64 text line
        sFour = Mid$(sText, i, 4)  '  get the next group of four bytes
        While Len(sFour) < 4: sFour = sFour & "=": Wend 'pad to four bytes if necessary
        sThree = sDecode4(sFour)  'convert the group of four bytes
        If Len(sThree) = 3 Then
            sOut = sOut & sThree
        Else
            rc = MsgBox("Illegal Characters <" & sFour & "> found", vbOKCancel, "PROGRAM ERROR")
            If rc = vbCancel Then Exit For 'if user cancels, quit
            'keep trying, maybe some data can be decoded
            sOut = sOut & "???"
        End If
    Next i

    sBase64Decode = sOut    'return the text

End Function


Private Function nBase64Digit(VALUE_IN As Integer) As Byte
    'returns a base64 value (A-Z,a-z,0-9,+,/) for a value 0-63
    
    Dim Digit64 As Byte, n As Integer
    
    Debug.Assert VALUE_IN >= 0 And VALUE_IN <= 63 'check the input
    
    n = VALUE_IN    'get working copy of digit value
    
    Select Case n
    Case Is <= 25:  Digit64 = Asc("A") + n          ' A-Z
    Case Is <= 51:  Digit64 = Asc("a") + (n - 26)   ' a-z
    Case Is <= 61:  Digit64 = Asc("0") + (n - 52)   ' 0-9
    Case 62:        Digit64 = Asc("+")              ' +
    Case 63:        Digit64 = Asc("/")              ' /
    Case Else
                    Digit64 = "?"   'illegal input, return error code
                    Debug.Assert False  'what happened?
    End Select
    
    nBase64Digit = Digit64
    
End Function

Private Function nBase64Value(ONEBYTE_IN As String) As Integer
    'return base64 char value for the only or leftmost byte
    '   of the given string, 0-63 (or 255 for an error)
    
    Dim n As Integer
    
    Select Case ONEBYTE_IN
    Case "A" To "Z":    n = Asc(ONEBYTE_IN) - Asc("A")
    Case "a" To "z":    n = 26 + Asc(ONEBYTE_IN) - Asc("a")
    Case "0" To "9":    n = 52 + Asc(ONEBYTE_IN) - Asc("0")
    Case "+":           n = 62
    Case "/":           n = 63
    Case "=":           n = 0
    
    Case Else         'if not in the list
        n = 255       'return error code
    End Select
    
    nBase64Value = n    'return the value of the byte
    
End Function

Private Function sDecode4(BASE64TEXT_IN As String) As String
    'convert four base64 bytes to three text bytes
    'this is a bit manipulation and never 'fails' unless input is bad
    
    Dim nBits As Long       '32 bits, using 24 of them for bit work
    Dim s1 As String, s2 As String, s3 As String, s4 As String 'each byte
    Dim t1 As String, t2 As String, t3 As String
    Dim n1 As Byte, n2 As Byte, n3 As Byte, n4 As Byte 'each byte's value
    
    'check the input string:
    If Len(BASE64TEXT_IN) <> 4 Or Not IsBase64(BASE64TEXT_IN) Then
        Debug.Assert False 'hunh?
        sDecode4 = ""   'return error code
        Exit Function   'quit
    End If
    
    s1 = Mid$(BASE64TEXT_IN, 1, 1)      'get all four bytes
    s2 = Mid$(BASE64TEXT_IN, 2, 1)
    s3 = Mid$(BASE64TEXT_IN, 3, 1)
    s4 = Mid$(BASE64TEXT_IN, 4, 1)
    
    n1 = nBase64Value(s1)               'get all four byte's values
    n2 = nBase64Value(s2)
    n3 = nBase64Value(s3)
    n4 = nBase64Value(s4)
    
    If n1 = 255 Or n2 = 255 Or n3 = 255 Or n4 = 255 Then 'if any bad characters given
        sDecode4 = ""   'return error code
        Exit Function   'quit
    End If
    
    nBits = nBits Or n4                 'merge the values into 24 bits
    nBits = nBits Or (n3 * 64&)
    nBits = nBits Or (n2 * 64& * 64&)
    nBits = nBits Or (n1 * 64& * 64& * 64&)
    
    t3 = Chr$(nBits And 255)                  'get the three output bytes
    t2 = Chr$((nBits \ 256) And 255)
    t1 = Chr$((nBits \ 256 \ 256))
    
    sDecode4 = t1 & t2 & t3             'return the decoded bytes

End Function


Public Function IsBase64(TEXT_IN As String, Optional MSGBOX_IN As Boolean = False) As Boolean
    'decide if a string is legal base64 code ready for decoding
    'Base64, CR, and LF characters (only) are allowed
    
    Dim i As Long, sText As String
    
    If TEXT_IN = "" Then    'if no input
        IsBase64 = False    '  return bad return code
        Exit Function       '  quit
    End If
    
    sText = sRemoveWhitespace(TEXT_IN)    'get working copy of text
    
    For i = 1 To Len(sText)   'for each byte of the input text
        Select Case Mid$(sText, i, 1) 'get next byte
        Case "A" To "Z", "a" To "z", "0" To "9", "+", "/", vbCr, vbLf 'if good
            'do nothing
        Case "="
            If i = Len(sText) - 1 Then    'if next to last byte
                If Mid$(sText, i + 1, 1) = "=" Then 'if last byte is "=" too
                    'do nothing
                End If
            ElseIf i = Len(sText) Then     'if last byte
                'do nothing
            Else      'then the "=" is not at the end, so reject it
                If MSGBOX_IN Then MsgBox "Text Error: Equal Sign not at end of text", , "TRIM END OF TEXT"
                IsBase64 = False    '  fails base64 character content test
                Exit Function       '  quit
            End If
        Case Else               'if not in the character list
            If MSGBOX_IN Then MsgBox "Non-base64 character <" _
                & Mid$(TEXT_IN, i, 1) & "> found in base64" _
                & " text", , "ILLEGAL BASE64 BYTE"
            IsBase64 = False    '  fails base64 character content test
            Exit Function       '  quit
        End Select
    Next i
    
    IsBase64 = True             'if it passed all the tests return YES
    
End Function

Private Function sRemoveWhitespace(TEXT_IN As String) As String
    
    Dim sText As String
    
    sText = TEXT_IN
    
    sText = Replace(sText, vbCr, "") 'remove all line break characters
    sText = Replace(sText, vbLf, "")
    sText = Replace(sText, vbTab, "")
    sText = Replace(sText, " ", "")
    
    sRemoveWhitespace = sText
    
End Function








