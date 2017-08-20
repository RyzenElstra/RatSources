Attribute VB_Name = "modEncryption"
'Coded by Tim Cinel, 15 Oct 2003
'This module is an example of some low-level encryption.

'Remember, when encrypting, we need a way to get our original message back
'so do not ever use Rnd (Random Function). I suggest using a Calculated
'Random Number generater that requires an input.

Function Encrypt(ByVal strPassword As String, ByRef ByteArray() As Byte) As Byte()
    Dim PasswordVal As Long, PasswordVal2 As Long, CurrentChar As Long, CurrentMod As Long
    Dim TempArray() As Byte
    
    ReDim TempArray(LBound(ByteArray) To UBound(ByteArray))
    'Lets turn our password into a number! Yippee!
    PasswordVal = GetPasswordValue(strPassword)
    PasswordVal2 = GetPasswordValue2(strPassword)
    
    'CurrentMod will makes it difficult to recognise when we use the same character more than once.
    'CurrentMod = WrapNumber(CalculateSeed(WrapNumber(PasswordVal, 0, 360)), 0, 360)
    
    For i = LBound(ByteArray) To UBound(ByteArray)
        CurrentChar = ByteArray(i)
        'Set currentchar as the ASCII value of the the character being encrypted
        CurrentChar = CurrentChar - PasswordVal
        CurrentChar = CurrentChar + PasswordVal2
        CurrentChar = CurrentChar - CalculateSeed(WrapNumber(CLng(i), 1, 360), PasswordVal2)
        'CurrentMod is passed into CalculateSeed - See that function for more details.
        'CurrentChar = CurrentChar - CalculateSeed(CLng(CurrentMod))
                
        CurrentChar = WrapNumber(CurrentChar, 0, 255)
        
        TempArray(i) = CurrentChar
        
        CurrentMod = CurrentMod + 1
        If CurrentMod > 30 Then CurrentMod = 2
    Next i
    
    Encrypt = TempArray()
    
End Function

Function Decrypt(strPassword As String, strInput() As Byte) As Byte()
    Dim PasswordVal As Long, PasswordVal2 As Long, CurrentChar As Long
    Dim TempArray() As Byte
    
    'Lets turn our password into a number! Yippee!
    PasswordVal = GetPasswordValue(strPassword)
    PasswordVal2 = GetPasswordValue2(strPassword)
    
    ReDim TempArray(LBound(strInput) To UBound(strInput))
    
    For i = LBound(strInput) To UBound(strInput)
        CurrentChar = strInput(i)
        'Set currentchar as the ASCII value of the the character being encrypted
        CurrentChar = CurrentChar + CalculateSeed(WrapNumber(CLng(i), 1, 360), PasswordVal2)
        CurrentChar = CurrentChar - PasswordVal2
        CurrentChar = CurrentChar + PasswordVal
       
        'CurrentMod is passed into CalculateSeed - See that function for more details.
        'CurrentChar = CurrentChar + CalculateSeed(CLng(CurrentMod))
        
        'We need to make sure that CurrentChar ends up being between 0 and 255, so we wrap it!
        CurrentChar = WrapNumber(CurrentChar, 0, 255)
        
        TempArray(i) = CurrentChar
        
        'Add 1 to CurrentMod (For calculated randomization)
    Next i
    
    Decrypt = TempArray()
End Function

Private Function GetPasswordValue(strPassword As String) As Long
    Dim ASCII_Vals As Long
    
    For i = 1 To Len(strPassword)
        'We need to add up all the ASCII values from all the characters
        ASCII_Vals = ASCII_Vals + Asc(Mid(strPassword, i, 1))
    Next i
    
    GetPasswordValue = Int(CalculateSeed(ASCII_Vals, Len(strPassword) + 1))

End Function

Private Function GetPasswordValue2(strPassword As String) As Long
    Dim ASCII_Vals As Long
    
    For i = 1 To Len(strPassword)
        'We need to add up all the ASCII values from all the characters
        ASCII_Vals = ASCII_Vals + Asc(Mid(strPassword, i, 1))
    Next i
    
    GetPasswordValue2 = ASCII_Vals * Len(strPassword)
    
    GetPasswordValue2 = WrapNumber(GetPasswordValue2, 0, 255)
    
End Function

Private Function CalculateSeed(InputNumber As Long, Multiplier As Long) As Long
    'This functions pretty much makes the InputNumber appear to become a totally random
    'number, but unke using rnd (Random Function) this will always return the same number
    'as long as you enter the same number.
    
    'Log and Cos are just Maths functions
    CalculateSeed = Int(Sin(InputNumber) * Cos(InputNumber) * Multiplier)

End Function

Private Function WrapNumber(lngNumber As Long, lngMinimum As Long, lngMaximum As Long) As Long
    Dim Range As Long
    
    Range = lngMaximum - lngMinimum + 1
    
    WrapNumber = lngNumber - (Int((lngNumber - lngMinimum) / Range) * Range)
End Function


