Attribute VB_Name = "mdMIME"
Private Const base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

Private Function base64_encode(DecryptedText As String) As String
Dim c1, c2, c3 As Integer
Dim w1 As Integer
Dim w2 As Integer
Dim w3 As Integer
Dim w4 As Integer
Dim n As Integer
Dim retry As String

   For n = 1 To Len(DecryptedText) Step 3
      c1 = Asc(Mid$(DecryptedText, n, 1))
      c2 = Asc(Mid$(DecryptedText, n + 1, 1) + Chr$(0))
      c3 = Asc(Mid$(DecryptedText, n + 2, 1) + Chr$(0))
      w1 = Int(c1 / 4)
      w2 = (c1 And 3) * 16 + Int(c2 / 16)
      If Len(DecryptedText) >= n + 1 Then w3 = (c2 And 15) * 4 + Int(c3 / 64) Else w3 = -1
      If Len(DecryptedText) >= n + 2 Then w4 = c3 And 63 Else w4 = -1
      retry = retry + mimeencode(w1) + mimeencode(w2) + mimeencode(w3) + mimeencode(w4)
   Next
   base64_encode = retry
   
End Function

Private Function base64_decode(a As String) As String
Dim w1 As Integer
Dim w2 As Integer
Dim w3 As Integer
Dim w4 As Integer
Dim n As Integer
Dim retry As String

   For n = 1 To Len(a) Step 4
      w1 = mimedecode(Mid$(a, n, 1))
      w2 = mimedecode(Mid$(a, n + 1, 1))
      w3 = mimedecode(Mid$(a, n + 2, 1))
      w4 = mimedecode(Mid$(a, n + 3, 1))
      If w2 >= 0 Then retry = retry + Chr$(((w1 * 4 + Int(w2 / 16)) And 255))
      If w3 >= 0 Then retry = retry + Chr$(((w2 * 16 + Int(w3 / 4)) And 255))
      If w4 >= 0 Then retry = retry + Chr$(((w3 * 64 + w4) And 255))
   Next
   base64_decode = retry
   
End Function

Private Function mimeencode(w As Integer) As String
   If w >= 0 Then mimeencode = Mid$(base64, w + 1, 1) Else mimeencode = ""
End Function

Private Function mimedecode(a As String) As Integer
   If Len(a) = 0 Then mimedecode = -1: Exit Function
   mimedecode = InStr(base64, a) - 1
End Function


Function Encrypt(Text As String, Password As String) As String
Dim b As String, S As String, i As Long, j As Long
Dim A1 As Long, A2 As Long, A3 As Long, P As String
     
   j = 1
   For i = 1 To Len(Password)
     P = P & Asc(Mid$(Password, i, 1))
   Next
    
   For i = 1 To Len(Text)
     A1 = Asc(Mid$(P, j, 1))
     j = j + 1: If j > Len(P) Then j = 1
     A2 = Asc(Mid$(Text, i, 1))
     A3 = A1 Xor A2
     b = Hex$(A3)
     If Len(b) < 2 Then b = "0" + b
     S = S + b
   Next
   Encrypt = base64_encode(S)
   
End Function

Function Decrypt(Text As String, Password As String) As String
Dim b As String, S As String, i As Long, j As Long
Dim A1 As Long, A2 As Long, A3 As Long, P As String
   
   Text = base64_decode(Text)
   j = 1
   For i = 1 To Len(Password)
     P = P & Asc(Mid$(Password, i, 1))
   Next
   
   For i = 1 To Len(Text) Step 2
     A1 = Asc(Mid$(P, j, 1))
     j = j + 1: If j > Len(P) Then j = 1
     b = Mid$(Text, i, 2)
     A3 = Val("&H" + b)
     A2 = A1 Xor A3
     S = S + Chr$(A2)
   Next
   Decrypt = S
   
End Function
