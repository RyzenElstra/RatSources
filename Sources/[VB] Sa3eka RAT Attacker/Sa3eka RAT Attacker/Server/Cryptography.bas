Attribute VB_Name = "Module1"
Option Explicit
Function Hash(ByVal Inc As String)
    On Error Resume Next
    Dim tmp As String
    tmp = Inc
    Dim tmp2 As String
    Dim ii As Long
    For ii = 1 To Len(tmp)
        tmp2 = tmp2 & Chr(Asc(Mid(tmp, ii, 1)) + ii)
    Next ii
    tmp = tmp2
    tmp2 = ""
    For ii = 1 To Len(tmp)
        tmp2 = tmp2 & Chr(Asc(Mid(tmp, ii, 1)) + ii)
    Next ii
    tmp = tmp2
    tmp2 = ""
    For ii = 1 To Len(tmp)
        tmp2 = tmp2 & Chr(Asc(Mid(tmp, ii, 1)) + ii - Len(tmp))
    Next ii
   Hash = tmp2
End Function

Public Function SimpleDeCrypt(x As String)
    Dim i As Long
    Dim a1 As Byte
    Dim a2 As Byte
    Dim a3 As Byte
    Dim tmp As Long
    
    SimpleDeCrypt = Space(Len(x))
    
    For i = 1 To Len(x)
        tmp = a1 + 231
        If tmp > 255 Then tmp = tmp - 255
        a1 = tmp
        tmp = Asc(Mid(x, i, 1)) - a1
        If tmp > 255 Then tmp = tmp - 255
        If tmp < 0 Then tmp = tmp + 255
        
        Mid(SimpleDeCrypt, i, 1) = Chr(tmp)
    Next i
End Function

' PLATZ SPAREN

Public Function SimpleEnCrypt(x As String)
    Dim i As Long
    Dim a1 As Byte
    Dim tmp As Long

    SimpleEnCrypt = Space(Len(x))

    For i = 1 To Len(x)
        tmp = a1 + 231
        If tmp > 255 Then tmp = tmp - 255
        a1 = tmp
        tmp = Asc(Mid(x, i, 1)) + a1
        If tmp > 255 Then tmp = tmp - 255
        If tmp < 0 Then tmp = tmp + 255

        Mid(SimpleEnCrypt, i, 1) = Chr(tmp)
    Next i
End Function

Public Function RC4(ByVal str As String, ByVal Pwd As String) As String
On Error Resume Next
Dim Sbox(0 To 255) As Integer
Dim A
Dim b
Dim C
Dim Key() As Byte
Dim byteArray() As Byte
Dim tmp As Byte
If Len(Pwd) = 0 Or Len(str) = 0 Then Exit Function

If Len(Pwd) > 256 Then
    Key() = StrConv(Left$(Pwd, 256), vbFromUnicode)
Else
    Key() = StrConv(Pwd, vbFromUnicode)
End If

For A = 0 To 255
    Sbox(A) = A
Next A
A = 0
b = 0
C = 0
For A = 0 To 255
    b = (b + Sbox(A) + Key(A Mod Len(Pwd))) Mod 256
    tmp = Sbox(A)
    Sbox(A) = Sbox(b)
    Sbox(b) = tmp
Next A
A = 0
b = 0
C = 0
byteArray() = StrConv(str, vbFromUnicode)
For A = 0 To Len(str)
    b = (b + 1) Mod 256
    C = (C + Sbox(b)) Mod 256
    tmp = Sbox(b)
    Sbox(b) = Sbox(C)
    Sbox(C) = tmp
    byteArray(A) = byteArray(A) Xor (Sbox((Sbox(b) + Sbox(C)) Mod 256))
Next A
RC4 = StrConv(byteArray, vbUnicode)
End Function

