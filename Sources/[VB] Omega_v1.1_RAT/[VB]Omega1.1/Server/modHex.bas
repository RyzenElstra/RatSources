Attribute VB_Name = "modHEX"
Option Explicit

Private m_InitHex As Boolean
Private m_ByteToHex(0 To 255, 0 To 1) As Byte
Private m_HexToByte(48 To 70, 48 To 70) As Byte

Private Declare Sub FillMemory Lib "kernel32.dll" Alias "RtlFillMemory" (Destination As Any, ByVal Length As Long, ByVal Fill As Byte)

Function HexToStr(HexText As String, Optional ByVal Separators As Long = 1) As String

  Dim a As Long
  Dim Pos As Long
  Dim PosAdd As Long
  Dim ByteSize As Long
  Dim HexByte() As Byte
  Dim ByteArray() As Byte
  
  'Initialize the hex routine
  If (Not m_InitHex) Then Call InitHex
  
  'The destination string is half
  'the size of the source string
  'when the separators are removed
  If (Len(HexText) = 2) Then
    ByteSize = 1
  Else
    ByteSize = ((Len(HexText) + 1) \ (2 + Separators))
  End If
  ReDim ByteArray(0 To ByteSize - 1)
  
  'Convert every HEX code to the
  'equivalent ASCII character
  PosAdd = 2 + Separators
  HexByte() = StrConv(HexText, vbFromUnicode)
  For a = 0 To (ByteSize - 1)
    ByteArray(a) = m_HexToByte(HexByte(Pos), HexByte(Pos + 1))
    Pos = Pos + PosAdd
  Next
  
  'Now finally convert the byte
  'array to the return string
  HexToStr = StrConv(ByteArray, vbUnicode)

End Function
Private Sub InitHex()

  Dim a As Long
  Dim b As Long
  Dim HexBytes() As Byte
  Dim HexString As String
  
  'The routine is initialized
  m_InitHex = True
  
  'Create a string with all hex values
  HexString = String$(512, "0")
  For a = 1 To 255
    Mid$(HexString, 1 + a * 2 + -(a < 16)) = Hex(a)
  Next
  HexBytes = StrConv(HexString, vbFromUnicode)
  
  'Create the Str->Hex array
  For a = 0 To 255
    m_ByteToHex(a, 0) = HexBytes(a * 2)
    m_ByteToHex(a, 1) = HexBytes(a * 2 + 1)
  Next
  
  'Create the Str->Hex array
  For a = 0 To 255
    m_HexToByte(m_ByteToHex(a, 0), m_ByteToHex(a, 1)) = a
  Next

End Sub
Function StrToHex(Text As String, Optional Separator As String = " ") As String

  Dim a As Long
  Dim Pos As Long
  Dim Char As Byte
  Dim PosAdd As Long
  Dim ByteSize As Long
  Dim ByteArray() As Byte
  Dim ByteReturn() As Byte
  Dim SeparatorLen As Long
  Dim SeparatorChar As Byte
  
  'Initialize the hex routine
  If (Not m_InitHex) Then Call InitHex
  
  'Initialize variables
  SeparatorLen = Len(Separator)
  
  'Create the destination bytearray, this
  'will be converted to a string later
  ByteSize = (Len(Text) * 2 + (Len(Text) - 1) * SeparatorLen)
  ReDim ByteReturn(ByteSize - 1)
  Call FillMemory(ByteReturn(0), ByteSize, Asc(Separator))
  
  'We convert the source string into a
  'byte array to speed this up a tad
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Now convert every character to
  'it's equivalent HEX code
  PosAdd = 2 + SeparatorLen
  For a = 0 To (Len(Text) - 1)
    ByteReturn(Pos) = m_ByteToHex(ByteArray(a), 0)
    ByteReturn(Pos + 1) = m_ByteToHex(ByteArray(a), 1)
    Pos = Pos + PosAdd
  Next
  
  'Convert the bytearray to a string
  StrToHex = StrConv(ByteReturn(), vbUnicode)

End Function
