VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsZLib"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'Property Variables
Private m_CompressedSize As Long
Private m_OriginalSize As Long
Private m_CRC As Long

'Declares
Private Declare Function ShellAbout Lib "shell32.dll" Alias "ShellAboutA" (ByVal hwnd As Long, ByVal szApp As String, ByVal szOtherStuff As String, ByVal hIcon As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function compress Lib "zlib.dll" (dest As Any, destLen As Any, src As Any, ByVal srcLen As Long) As Long
Private Declare Function uncompress Lib "zlib.dll" (dest As Any, destLen As Any, src As Any, ByVal srcLen As Long) As Long
Private Declare Function crc32 Lib "zlib.dll" (ByVal CRC As Long, buf As Byte, ByVal buf_len As Long) As Long
Private Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

Public Function CompressByte(ByteArray() As Byte) As Boolean

  Dim BufferSize As Long
  Dim TempBuffer() As Byte
  
  'Create a buffer to hold the compressed data
  BufferSize = UBound(ByteArray) + 1
  BufferSize = BufferSize + (BufferSize * 0.01) + 12
  ReDim TempBuffer(BufferSize)

  'Compress byte array (data)
  CompressByte = (compress(TempBuffer(0), BufferSize, ByteArray(0), UBound(ByteArray) + 1) = 0)

  'Add the size of the original data
  Call CopyMem(ByteArray(0), CLng(UBound(ByteArray) + 1), 4)
  
  'Remove redundant data
  ReDim Preserve ByteArray(0 To BufferSize + 4 - 1)
  Call CopyMem(ByteArray(4), TempBuffer(0), BufferSize)
  
End Function
Public Sub CompressFile(SourceFilename As String, DestFilename As String)

  Dim Filenr As Integer
  Dim ByteArray() As Byte
  
  'Read the data in the sourcefile
  Filenr = FreeFile
  Open SourceFilename For Binary As #Filenr
  ReDim ByteArray(0 To LOF(Filenr) - 1)
  Get #Filenr, , ByteArray()
  Close #Filenr
  
  'Compress the bytearray
  Call CompressByte(ByteArray())
  
  'Store the data in the destfile
  Filenr = FreeFile
  Open DestFilename For Output As #Filenr: Close #Filenr
  Open DestFilename For Binary As #Filenr
  Put #Filenr, , ByteArray()
  Close #Filenr
  
End Sub

Public Property Get CompressedSize() As Long
    
  CompressedSize = m_CompressedSize

End Property
Public Function CompressString(Text As String) As String

  Dim CmpSize As Long
  Dim CmpByte() As Byte
  Dim ByteArray() As Byte
  
  'Convert the string into a byte array
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Create a buffer to contain the compressed data
  '(worst case scenario is 1% added and 12 bytes)
  CmpSize = 4 + Len(Text) + (Len(Text) * 0.01) + 12
  ReDim CmpByte(0 To CmpSize)
  
  'Compress the source string into the temp buffer
  Call compress(CmpByte(4), CmpSize, ByteArray(0), Len(Text))

  'Add the size of the original text
  Call CopyMem(CmpByte(0), CLng(Len(Text)), 4)
  
  'Remove any redundant data
  ReDim Preserve CmpByte(0 To CmpSize + 4 - 1)
  
  'Convert the byte array into a string
  CompressString = StrConv(CmpByte(), vbUnicode)

End Function
Public Property Let CRC(New_Value As Long)

  m_CRC = New_Value
  
End Property

Public Property Get CRC() As Long

  CRC = m_CRC
  
End Property

Public Function CRCArray(ByteArray() As Byte, Size As Long, Optional CRC As Variant) As Long

  If Not IsMissing(CRC) Then m_CRC = CRC
  m_CRC = crc32(m_CRC, ByteArray(0), Size)
  CRCArray = m_CRC

End Function
Public Function CRCString(Value As String, Size As Long, Optional CRC As Variant) As Long

  Dim ByteArray() As Byte
  
  ReDim ByteArray(Size - 1)
  Call CopyMem(ByteArray(0), ByVal Value, Size)
  
  If Not IsMissing(CRC) Then m_CRC = CRC
  m_CRC = crc32(m_CRC, ByteArray(0), Size)
  CRCString = m_CRC

End Function
Public Function CRCFile(Filename As String, Optional BufferSize As Long = 100000) As Long

  Dim Buffer() As Byte
  Dim FileSize As Long
  Dim Filenr As Integer
  Dim BytesRead As Long
  Dim lngActualBytesRead As Long
  
  m_CRC = 0
  Filenr = FreeFile
  Open Filename For Binary Access Read As #Filenr
  FileSize = LOF(Filenr)
  
  'While there is still data in the file
  Do Until (FileSize = BytesRead)
    If (BytesRead + 1 + BufferSize < FileSize) Then
      lngActualBytesRead = BufferSize
    ElseIf (FileSize - BytesRead > 0) Then
      ' If we are attempting to read more data than is left in the file,
      ' calculate how much data we should read
      lngActualBytesRead = FileSize - BytesRead
    End If
    
    'Read the data
    ReDim Buffer(lngActualBytesRead - 1)
    Get #Filenr, , Buffer
    
    m_CRC = crc32(m_CRC, Buffer(0), lngActualBytesRead)
    
    'Get the total amount of the file that has been processed
    BytesRead = BytesRead + lngActualBytesRead
    
    'Raise the progress
    'RaiseEvent Progress(lngBytesRead / lngFileLength)
    'DoEvents
  Loop

  CRCFile = m_CRC
  
End Function
Public Sub DecompressByte(TheData() As Byte)

  Dim OrigLen As Long
  Dim BufferSize As Long
  Dim TempBuffer() As Byte

  'Get the original size
  Call CopyMem(OrigLen, TheData(0), 4)
  
  'Create a buffer to hold the uncompressed data
  BufferSize = OrigLen
  BufferSize = BufferSize + (BufferSize * 0.01) + 12
  ReDim TempBuffer(BufferSize)

  'Decompress data
  Call uncompress(TempBuffer(0), BufferSize, TheData(4), UBound(TheData) - 4 + 1)

  'Remove redundant data
  ReDim Preserve TheData(0 To BufferSize - 1)
  CopyMemory TheData(0), TempBuffer(0), BufferSize

End Sub
Public Function DecompressString(Text As String) As String

  Dim OrigLen As Long
  Dim OrigByte() As Byte
  Dim BufferSize As Long
  Dim ByteArray() As Byte
  
  'Convert the string into a bytearray
  ByteArray() = StrConv(Text, vbFromUnicode)
  
  'Extract the OrigLen value from the data
  Call CopyMem(OrigLen, ByteArray(0), 4)
  BufferSize = OrigLen + (OrigLen * 0.01) + 12
  ReDim OrigByte(0 To BufferSize)
  
  'Decompress the data
  Call uncompress(OrigByte(0), BufferSize, ByteArray(4), UBound(ByteArray) - 3)
  If (BufferSize <> OrigLen) Then Stop
  
  'Remove redundant information
  ReDim Preserve OrigByte(0 To OrigLen - 1)
  
  'Return the decompressed data in string format
  DecompressString = StrConv(OrigByte(), vbUnicode)

'  'Allocate string space
'  Dim CmpSize As Long
'  Dim TBuff As String
'
'  TBuff = String(OriginalSize + (OriginalSize * 0.01) + 12, 0)
'  CmpSize = Len(TBuff)
'
'  'Decompress
'  DecompressString = (uncompress(ByVal TBuff, CmpSize, ByVal TheString, Len(TheString)) = 0)
'
'  'Make string the size of the uncompressed string
'  TheString = Left$(TBuff, CmpSize)
'
'  'Reset properties
'  If DecompressString Then
'    m_CompressedSize = 0
'    m_OriginalSize = 0
'  End If

End Function
Public Property Get OriginalSize() As Long
 
  OriginalSize = m_OriginalSize

End Property

Private Sub Class_Initialize()

  Dim ByteArray() As Byte
  Dim Filenr As Integer
  
'  If (Len(Dir$(WinSysDir & "Zlib.dll", vbSystem + vbHidden)) = 0) Then
'    Call MsgBox("ZLib DLL will be added to the " & WinSysDir & " directory.", vbOKOnly + vbInformation)
'    ByteArray = LoadResData(101, "DLL")
'    Filenr = FreeFile
'    Open WinSysDir & "Zlib.dll" For Binary As #Filenr
'    Put #Filenr, , ByteArray
'    Close #Filenr
'  End If
  
End Sub

Private Function WinSysDir() As String

  Dim t As String * 500
  
  WinSysDir = Left$(t, GetSystemDirectory(t, Len(t)))
  WinSysDir = WinSysDir & IIf(Right$(WinSysDir, 1) <> "\", "\", "")
  
End Function

