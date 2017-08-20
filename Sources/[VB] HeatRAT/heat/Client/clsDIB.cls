VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "clsDIB"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const BITMAPTYPE As Integer = &H4D42
Private Type BITMAPFILEHEADER
   bfType As Integer '- type  ="BM" i.e &H4D42 - 2
   bfSize As Long ' - size in bytes of file - 6
   bfReserved1 As Integer ' - reserved, must be 0 - 8
   bfReserved2 As Integer ' - reserved, must be 0 - 10
   bfOffBits As Long ' offset from this structure to the bitmap bits - 14
End Type
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Const INVALID_HANDLE_VALUE = -1
Private Const CREATE_ALWAYS = 2
Private Const GENERIC_READ = &H80000000
Private Const GENERIC_WRITE = &H40000000
Private Const FILE_ATTRIBUTE_ARCHIVE = &H20
Private Const FILE_ATTRIBUTE_COMPRESSED = &H800
Private Const FILE_ATTRIBUTE_DIRECTORY = &H10
Private Const FILE_ATTRIBUTE_HIDDEN = &H2
Private Const FILE_ATTRIBUTE_NORMAL = &H80
Private Const FILE_ATTRIBUTE_READONLY = &H1
Private Const FILE_ATTRIBUTE_SYSTEM = &H4
Private Const FILE_ATTRIBUTE_TEMPORARY = &H100
Private Const FILE_BEGIN = 0
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Const GMEM_FIXED = &H0
Private Const GMEM_ZEROINIT = &H40
Private Const GPTR = (GMEM_FIXED Or GMEM_ZEROINIT)
Private Const FORMAT_MESSAGE_ALLOCATE_BUFFER = &H100
Private Const FORMAT_MESSAGE_ARGUMENT_ARRAY = &H2000
Private Const FORMAT_MESSAGE_FROM_HMODULE = &H800
Private Const FORMAT_MESSAGE_FROM_STRING = &H400
Private Const FORMAT_MESSAGE_FROM_SYSTEM = &H1000
Private Const FORMAT_MESSAGE_IGNORE_INSERTS = &H200
Private Const FORMAT_MESSAGE_MAX_WIDTH_MASK = &HFF
Private Declare Function FormatMessage Lib "kernel32" Alias "FormatMessageA" (ByVal dwFlags As Long, lpSource As Any, ByVal dwMessageId As Long, ByVal dwLanguageId As Long, ByVal lpBuffer As String, ByVal nSize As Long, Arguments As Long) As Long

Private Const MAX_LONG = 2147483647

Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, ByVal crColor As Long) As Long
Private Declare Function OleTranslateColor Lib "OLEPRO32.DLL" (ByVal OLE_COLOR As Long, ByVal HPALETTE As Long, pccolorref As Long) As Long
Private Const CLR_INVALID = -1

Private Const SRCAND = &H8800C6
Private Const SRCCOPY = &HCC0020
Private Const SRCERASE = &H440328
Private Const SRCINVERT = &H660046
Private Const SRCPAINT = &HEE0086
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private m_Colors As Long

Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long

Private Type POINTAPI
  x As Long
  y As Long
End Type
Private Type RECT
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function LineTo Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long) As Long
Private Declare Function MoveToEx Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal y As Long, lpPoint As POINTAPI) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Sub CopyMem Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)

'Private Const SRCAND = &H8800C6  ' (DWORD) dest = source AND dest
'Private Const SRCERASE = &H440328        ' (DWORD) dest = source AND (NOT dest )
'Private Const SRCINVERT = &H660046       ' (DWORD) dest = source XOR dest

Private Type SAFEARRAYBOUND
  cElements As Long
  lLbound As Long
End Type

Private Type SAFEARRAY2D
  cDims As Integer
  fFeatures As Integer
  cbElements As Long
  cLocks As Long
  pvData As Long
  Bounds(0 To 1) As SAFEARRAYBOUND
End Type
Private Declare Function VarPtrArray Lib "msvbvm60.dll" Alias "VarPtr" (Ptr() As Any) As Long

Private Type RGBQUAD
  RGBBlue As Byte
  RGBGreen As Byte
  RGBRed As Byte
  RGBReserved As Byte
End Type

Private Type BITMAPINFOHEADER '40 bytes
  biSize As Long
  biWidth As Long
  biHeight As Long
  biPlanes As Integer
  biBitCount As Integer
  biCompression As Long
  biSizeImage As Long
  biXPelsPerMeter As Long
  biYPelsPerMeter As Long
  biClrUsed As Long
  biClrImportant As Long
End Type

Private Type BITMAPINFO
  bmiHeader As BITMAPINFOHEADER
  bmiColors() As RGBQUAD
End Type

Private Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function GetDesktopWindow Lib "user32" () As Long

' Note - this is not the declare in the API viewer - modify lplpVoid to be
' Byref so we get the pointer back:
Private Declare Function CreateDIBSection Lib "gdi32" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long
Private Const BI_RGB = 0&
Private Const BI_RLE4 = 2&
Private Const BI_RLE8 = 1&
Private Const DIB_RGB_COLORS = 0 '  color table in RGBs

Private Type BITMAP
  bmType As Long
  bmWidth As Long
  bmHeight As Long
  bmWidthBytes As Long
  bmPlanes As Integer
  bmBitsPixel As Integer
  bmBits As Long
End Type
Private Declare Function GetObjectAPI Lib "gdi32" Alias "GetObjectA" (ByVal hObject As Long, ByVal nCount As Long, lpObject As Any) As Long
Private Declare Function timeGetTime Lib "winmm.dll" () As Long
Private Declare Function CreateCompatibleBitmap Lib "gdi32" (ByVal hdc As Long, ByVal nWidth As Long, ByVal nHeight As Long) As Long

' Clipboard functions:
Private Declare Function OpenClipboard Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function CloseClipboard Lib "user32" () As Long
Private Declare Function SetClipboardData Lib "user32" (ByVal wFormat As Long, ByVal hMem As Long) As Long
Private Declare Function EmptyClipboard Lib "user32" () As Long
Private Const CF_BITMAP = 2
Private Const CF_DIB = 8

'Handle to the current DIBSection
Private m_hDIb As Long

'Handle to the old bitmap in the DC, for clear up
Private m_hBmpOld As Long

'Handle to the Device context holding the DIBSection
Private m_HDC As Long

'Address of memory pointing to the DIBSection's bits
Private m_lPtr As Long

'Type containing the Bitmap information
Private m_TBI As BITMAPINFO

Private Type BITMAPINFO2
    bmiHeader As BITMAPINFOHEADER
    bmiColors(0 To 1) As RGBQUAD
End Type
Private Type BITMAPINFO16
    bmiHeader As BITMAPINFOHEADER
    bmiColors(0 To 15) As RGBQUAD
End Type
Private Type BITMAPINFO256
    bmiHeader As BITMAPINFOHEADER
    bmiColors(0 To 255) As RGBQUAD
End Type
Private Declare Function CreateDIBSection2 Lib "gdi32" Alias "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO2, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function CreateDIBSection16 Lib "gdi32" Alias "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO16, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long
Private Declare Function CreateDIBSection256 Lib "gdi32" Alias "CreateDIBSection" (ByVal hdc As Long, pBitmapInfo As BITMAPINFO256, ByVal un As Long, lplpVoid As Long, ByVal Handle As Long, ByVal dw As Long) As Long

Private Function BitCount() As Long

  Select Case m_Colors
  Case 2
    BitCount = 1
  Case 16
    BitCount = 4
  Case 256
    BitCount = 8
  Case 2 ^ 24
    BitCount = 24
  End Select
  
End Function

Public Function GetDiff(NewDIB As clsDIB, Optional MaxDiff As Long) As String

  Dim a As Long
  Dim x As Long
  Dim y As Long
  Dim Diff() As Byte
  Dim DiffLen As Long
  Dim DiffData As Byte
  Dim DiffSize As Long
  Dim bDibNew() As Byte
  Dim bDibOrig() As Byte
  Dim DiffCounter As Long
  Dim DiffEqual As Boolean
  Dim tSANew As SAFEARRAY2D
  Dim tSAOrig As SAFEARRAY2D
  
  'Get the bits in the from DIB section
  tSAOrig = SafeArray()
  Call CopyMemory(ByVal VarPtrArray(bDibOrig()), VarPtr(tSAOrig), 4)

  'Get the bits in the from DIB section
  tSANew = NewDIB.SafeArray()
  Call CopyMemory(ByVal VarPtrArray(bDibNew()), VarPtr(tSANew), 4)

  'Create a buffer to hold the differences
  DiffSize = 10000
  ReDim Diff(0 To DiffSize)
  
  DiffLen = 0
  DiffCounter = 0
  DiffEqual = False
  For y = LBound(bDibOrig, 2) To UBound(bDibOrig, 2)
    For x = LBound(bDibOrig, 1) To UBound(bDibOrig, 1)
      If (DiffLen + 20 > DiffSize) Then
        If (MaxDiff > 0) Then
          If (DiffSize >= MaxDiff) Then GoTo TooMuchDifference
        End If
        DiffSize = DiffSize + 10000
        ReDim Preserve Diff(0 To DiffSize)
      End If
      If (DiffEqual <> (bDibOrig(x, y) = bDibNew(x, y))) Then
        If (DiffEqual) Then
          If (DiffCounter >= 255) Then
            Diff(DiffLen) = 255
            Call CopyMem(Diff(DiffLen + 1), DiffCounter, 4)
            DiffLen = DiffLen + 4
          Else
            Diff(DiffLen) = DiffCounter
          End If
        ElseIf (DiffCounter >= 255) Then
          Call CopyMem(Diff(DiffLen - DiffCounter + 4), Diff(DiffLen - DiffCounter), DiffCounter)
          Diff(DiffLen - DiffCounter) = 255
          Call CopyMem(Diff(DiffLen - DiffCounter + 1), DiffCounter, 4)
          DiffLen = DiffLen + 4
        Else
          Diff(DiffLen - DiffCounter) = DiffCounter
        End If
        DiffEqual = Not DiffEqual
        DiffLen = DiffLen + 1
        DiffCounter = 0
      End If
      DiffCounter = DiffCounter + 1
      If (Not DiffEqual) Then
        Diff(DiffLen + 1) = bDibNew(x, y)
        DiffLen = DiffLen + 1
      End If
    Next
  Next
  
  'Add the last block of data too
  If (DiffEqual) Then
    If (DiffCounter >= 255) Then
      Diff(DiffLen) = 255
      Call CopyMem(Diff(DiffLen + 1), DiffCounter, 4)
      DiffLen = DiffLen + 4
    Else
      Diff(DiffLen) = DiffCounter
    End If
  ElseIf (DiffCounter >= 255) Then
    Call CopyMem(Diff(DiffLen - DiffCounter + 4), Diff(DiffLen - DiffCounter), DiffCounter)
    Diff(DiffLen - DiffCounter) = 255
    Call CopyMem(Diff(DiffLen - DiffCounter + 1), DiffCounter, 4)
    DiffLen = DiffLen + 4
  Else
    Diff(DiffLen - DiffCounter) = DiffCounter
  End If
  DiffLen = DiffLen + 1
  
  'Remove any redundant data
  ReDim Preserve Diff(0 To DiffLen - 1)
  
  'Convert the diffdata into a string value
  'to be able to return the data in VB5
  GetDiff = StrConv(Diff, vbUnicode)
  
  'Clear the temporary array descriptors
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibOrig), 0&, 4
  
  Exit Function
  
TooMuchDifference:

  'Return a dummy string with MAXDIFF of data
  GetDiff = Space$(MaxDiff)
  
  'Clear the temporary array descriptors
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibOrig), 0&, 4

End Function
Friend Function SafeArray() As SAFEARRAY2D

  'Get the bits in the from DIB section
  With SafeArray
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With

End Function
Public Function SavePicture(ByVal sFileName As String) As Boolean

Dim tBH As BITMAPFILEHEADER
Dim tRGBQ As RGBQUAD
Dim hFile As Long
Dim lBytesWritten As Long
Dim lSize As Long
Dim lR As Long
Dim bErr As Boolean
Dim hMem As Long, lptr As Long
Dim lErr As Long

   ' Prepare the BITMAPFILEHEADER
   With tBH
      .bfType = BITMAPTYPE
      .bfOffBits = 14 + Len(m_TBI.bmiHeader)
      .bfSize = .bfOffBits + m_TBI.bmiHeader.biSizeImage
   End With
   hFile = CreateFile(sFileName, _
                 GENERIC_READ Or GENERIC_WRITE, _
                  ByVal 0&, _
                  ByVal 0&, _
                  CREATE_ALWAYS, _
                  FILE_ATTRIBUTE_NORMAL, _
                  0)
   lErr = Err.LastDllError
   If (hFile = INVALID_HANDLE_VALUE) Then
      ' error
      Err.Raise 17, App.EXEName & ".clsDIB256", ApiError(lErr)
   Else
      
      ' Writing the BITMAPFILEINFOHEADER is somewhat painful
      ' due to non-byte alignment of structure...
      hMem = GlobalAlloc(GPTR, 14)
      lptr = GlobalLock(hMem)
      CopyMemory ByVal lptr, tBH.bfType, 2
      CopyMemory ByVal lptr + 2, tBH.bfSize, 4
      CopyMemory ByVal lptr + 6, 0&, 4
      CopyMemory ByVal lptr + 10, tBH.bfOffBits, 4
      lSize = 14
      lR = WriteFile(hFile, ByVal lptr, lSize, lBytesWritten, ByVal 0&)
      GlobalUnlock hMem
      GlobalFree hMem
      
      ' Add the BITMAPINFOHEADER:
      bErr = FileErrHandler(lR, lSize, lBytesWritten)
      If Not bErr Then
         lSize = Len(m_TBI.bmiHeader)
         lR = WriteFile(hFile, m_TBI.bmiHeader, lSize, lBytesWritten, ByVal 0&)
         bErr = FileErrHandler(lR, lSize, lBytesWritten)
      End If
      ' There is no palette for a truecolour DIB
      
      If Not bErr Then
         ' Its easy to write the bitmap data, though...
         lSize = m_TBI.bmiHeader.biSizeImage
         lR = WriteFile(hFile, ByVal m_lPtr, lSize, lBytesWritten, ByVal 0&)
         bErr = FileErrHandler(lR, lSize, lBytesWritten)
      End If
      
      
      CloseHandle hFile
      'SavePicture = Not (bErr)
   End If

End Function

Private Function FileErrHandler(ByVal lR As Long, ByVal lSize As Long, ByVal lBytes As Long) As Boolean
   If (lR = 0) Or Not (lSize = lBytes) Then
      'Err.Raise
      FileErrHandler = True
   End If
End Function


Function ApiError(ByVal e As Long) As String
    Dim s As String, c As Long
    s = String(256, 0)
    c = FormatMessage(FORMAT_MESSAGE_FROM_SYSTEM Or _
                      FORMAT_MESSAGE_IGNORE_INSERTS, _
                      0, e, 0&, s, Len(s), ByVal 0)
    If c Then ApiError = Left$(s, c)
End Function

Public Sub SetDiff(DiffValue As String)

  Dim a As Long
  Dim x As Long
  Dim y As Long
  Dim Diff() As Byte
  Dim DiffLen As Long
  Dim DiffData As Byte
  Dim DiffSize As Long
  Dim DiffNext As Long
  Dim bDibOrig() As Byte
  Dim DiffCounter As Long
  Dim DiffEqual As Boolean
  Dim tSAOrig As SAFEARRAY2D
  
  'Get the bits in the DIB section
  tSAOrig = SafeArray()
  Call CopyMemory(ByVal VarPtrArray(bDibOrig()), VarPtr(tSAOrig), 4)

  'Convert the diff to a byte array
  Diff() = StrConv(DiffValue, vbFromUnicode)
  
  DiffLen = 0
  DiffCounter = 0
  DiffEqual = False
  DiffSize = Len(DiffValue)
  DiffNext = Diff(DiffLen)
  DiffLen = 1
  If (DiffNext = 255) Then
    Call CopyMem(DiffNext, Diff(DiffLen), 4)
    DiffLen = DiffLen + 4
  End If
  
  For y = LBound(bDibOrig, 2) To UBound(bDibOrig, 2)
    For x = LBound(bDibOrig, 1) To UBound(bDibOrig, 1)
      If (DiffCounter = DiffNext) Then
        DiffEqual = Not DiffEqual
        DiffNext = Diff(DiffLen)
        DiffLen = DiffLen + 1
        DiffCounter = 0
        If (DiffNext = 255) Then
          Call CopyMem(DiffNext, Diff(DiffLen), 4)
          If (DiffNext <= 0) Then Stop
          DiffLen = DiffLen + 4
        End If
        If (DiffLen >= DiffSize) Then GoTo Done
      End If
      DiffCounter = DiffCounter + 1
      If (Not DiffEqual) Then
        bDibOrig(x, y) = Diff(DiffLen)
        DiffLen = DiffLen + 1
      End If
    Next
  Next
Done:

  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibOrig), 0&, 4
  
End Sub

Public Sub Clear()

  Dim x As Long
  Dim y As Long
  Dim Size As Long
  Dim bDibOrig() As Byte
  Dim tSAOrig As SAFEARRAY2D
  
  'Get the bits in the DIB section
  tSAOrig = SafeArray()
  Call CopyMemory(ByVal VarPtrArray(bDibOrig()), VarPtr(tSAOrig), 4)

  Size = tSAOrig.Bounds(0).cElements * tSAOrig.Bounds(1).cElements
  Call CopyMem(bDibOrig(0, 0), ByVal String$(Size, 0), Size)

  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibOrig), 0&, 4
  
End Sub

Public Function TranslateColor(ByVal oClr As OLE_COLOR, Optional hPal As Long = 0) As Long

  'Convert Automation color to Windows color
  If OleTranslateColor(oClr, hPal, TranslateColor) Then
    TranslateColor = CLR_INVALID
  End If

End Function
Public Property Get Point(x As Long, y As Long) As Long

  Point = GetPixel(hdc, x, y)
  
End Property
Public Property Let Point(x As Long, y As Long, New_Value As Long)

  Call SetPixel(hdc, x, y, New_Value)
  
End Property

Function RGBParts(ByVal Color As Long, Red As Byte, Green As Byte, Blue As Byte)

  If CBool(Color And &H80000000) Then
    'This is a system color, we need to
    'convert it to RGB color first
    Color = GetSysColor(Color And &HFF&)
  End If
  
  Red = Color Mod &H100
  Green = (Color \ &H100) Mod &H100
  Blue = (Color \ &H10000) Mod &H100
  
End Function
Public Sub Rotate90()
Dim bDib() As Byte
Dim tSA As SAFEARRAY2D
Dim bDibWork() As Byte
Dim tSAWork As SAFEARRAY2D

Dim x As Long, y As Long
Dim xOut As Long, yOut As Long
Dim xEnd As Long, yEnd As Long
Dim bB As Byte, bG As Byte, bR As Byte

   Dim cDIBWork As New clsDIB
   If cDIBWork.Create(Width, Height) Then
      cDIBWork.LoadPictureBlt hdc
    
      ' Get the bits in the from DIB section:
      With tSA
         .cbElements = 1
         .cDims = 2
         .Bounds(0).lLbound = 0
         .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
         .Bounds(1).lLbound = 0
         .Bounds(1).cElements = BytesPerScanLine()
         .pvData = m_lPtr
      End With
      CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4
      
      ' Get the bits in the from DIB section:
      With tSAWork
         .cbElements = 1
         .cDims = 2
         .Bounds(0).lLbound = 0
         .Bounds(0).cElements = cDIBWork.Height
         .Bounds(1).lLbound = 0
         .Bounds(1).cElements = cDIBWork.BytesPerScanLine()
         .pvData = cDIBWork.DIBSectionBitsPtr
      End With
      CopyMemory ByVal VarPtrArray(bDibWork()), VarPtr(tSAWork), 4

      xEnd = (Width - 1) * 3
      yEnd = m_TBI.bmiHeader.biHeight - 1
      
      yOut = 0
      For x = 0 To xEnd Step 3
         xOut = xEnd
         For y = 0 To yEnd
            ' Swap:
            bDib(x, y) = bDibWork(xOut, yOut)
            bDib(x + 1, y) = bDibWork(xOut + 1, yOut)
            bDib(x + 2, y) = bDibWork(xOut + 2, yOut)
            xOut = xOut - 3
         Next y
         yOut = yOut + 1
      Next x
    
      ' Clear the temporary array descriptor
      ' This is necessary under NT/2000
      CopyMemory ByVal VarPtrArray(bDib), 0&, 4
      CopyMemory ByVal VarPtrArray(bDibWork), 0&, 4
   End If
   
End Sub
Public Sub Flip()
Dim bDib() As Byte
Dim x As Long, y As Long
Dim yOut As Long
Dim tSA As SAFEARRAY2D
Dim xEnd As Long, yEnd As Long
Dim bB As Byte, bG As Byte, bR As Byte
    
    ' Get the bits in the from DIB section:
    With tSA
        .cbElements = 1
        .cDims = 2
        .Bounds(0).lLbound = 0
        .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
        .Bounds(1).lLbound = 0
        .Bounds(1).cElements = BytesPerScanLine()
        .pvData = m_lPtr
    End With
    CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4

   xEnd = (Width - 1) * 3
   yEnd = m_TBI.bmiHeader.biHeight - 1
   For x = 0 To xEnd Step 3
      yOut = yEnd
      For y = 0 To yEnd
         bB = bDib(x, y)
         bG = bDib(x + 1, y)
         bR = bDib(x + 2, y)
         ' Swap:
         bDib(x, y) = bDib(x, yOut)
         bDib(x + 1, y) = bDib(x + 1, yOut)
         bDib(x + 2, y) = bDib(x + 2, yOut)
         bDib(x, yOut) = bB
         bDib(x + 1, yOut) = bG
         bDib(x + 2, yOut) = bR
         yOut = yOut - 1
         ' don't forget to do this; the results
         ' are somewhat dull otherwise :)
         If yOut <= y Then
            Exit For
         End If
      Next y
   Next x
    
   ' Clear the temporary array descriptor
   ' This is necessary under NT4.
   CopyMemory ByVal VarPtrArray(bDib), 0&, 4
      
End Sub
Public Sub Mirror()
Dim bDib() As Byte
Dim x As Long, y As Long
Dim xOut As Long
Dim tSA As SAFEARRAY2D
Dim xEnd As Long
Dim bB As Byte, bG As Byte, bR As Byte
    
    ' Get the bits in the from DIB section:
    With tSA
        .cbElements = 1
        .cDims = 2
        .Bounds(0).lLbound = 0
        .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
        .Bounds(1).lLbound = 0
        .Bounds(1).cElements = BytesPerScanLine()
        .pvData = m_lPtr
    End With
    CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4

   xEnd = (Width - 1) * 3
   xOut = xEnd
   For x = 0 To xEnd Step 3
      For y = 0 To m_TBI.bmiHeader.biHeight - 1
         bB = bDib(x, y)
         bG = bDib(x + 1, y)
         bR = bDib(x + 2, y)
         ' Swap:
         bDib(x, y) = bDib(xOut, y)
         bDib(x + 1, y) = bDib(xOut + 1, y)
         bDib(x + 2, y) = bDib(xOut + 2, y)
         bDib(xOut, y) = bB
         bDib(xOut + 1, y) = bG
         bDib(xOut + 2, y) = bR
      Next y
      xOut = xOut - 3
      ' don't forget to do this; the results
      ' are somewhat dull otherwise :)
      If xOut <= x Then
         Exit For
      End If
   Next x
    
   ' Clear the temporary array descriptor
   ' This is necessary under NT4.
   CopyMemory ByVal VarPtrArray(bDib), 0&, 4
    
End Sub
Public Sub Invert( _
      Optional ByVal oColorIgnore As OLE_COLOR = -1 _
   )
Dim bDib() As Byte
Dim x As Long, y As Long
Dim tSA As SAFEARRAY2D
Dim xEnd As Long, yEnd As Long
Dim bB As Byte, bG As Byte, bR As Byte
Dim lC As Long
Dim bBI As Integer, bGI As Integer, bRI As Integer

   ' Get the bits in the from DIB section:
   With tSA
      .cbElements = 1
      .cDims = 2
      .Bounds(0).lLbound = 0
      .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
      .Bounds(1).lLbound = 0
      .Bounds(1).cElements = BytesPerScanLine()
      .pvData = m_lPtr
   End With
   CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4

   If oColorIgnore = -1 Then
      bBI = -1: bGI = -1: bRI = -1
   Else
      lC = TranslateColor(oColorIgnore)
      bBI = (lC And &HFF0000) \ &H10000
      bGI = (lC And &HFF00&) \ &H100&
      bRI = (lC And &HFF)
   End If

   xEnd = (Width - 1) * 3
   yEnd = m_TBI.bmiHeader.biHeight - 1
   For x = 0 To xEnd Step 3
      For y = 0 To yEnd
         If Not (bDib(x, y) = bBI And bDib(x + 1, y) = bGI And bDib(x + 2, y) = bRI) Then
            bDib(x, y) = Abs(255 - bDib(x, y))
            bDib(x + 1, y) = Abs(255 - bDib(x + 1, y))
            bDib(x + 2, y) = Abs(255 - bDib(x + 2, y))
         End If
      Next y
   Next x
   
'   Call BitBlt(hdc, 0, 0, Width, Height, hdc, 0, 0, &H660046)
   
   ' Clear the temporary array descriptor
   ' This is necessary under NT4.
   CopyMemory ByVal VarPtrArray(bDib), 0&, 4
   
   
End Sub
Public Sub ChangeColor( _
      ByVal oColorFrom As OLE_COLOR, _
      ByVal oColorTo As OLE_COLOR _
   )
Dim bDib() As Byte
Dim x As Long, y As Long
Dim tSA As SAFEARRAY2D
Dim xEnd As Long
Dim lFrom As Long
Dim bBFrom As Byte, bGFrom As Byte, bRFrom As Byte
Dim lTo As Long
Dim bBTo As Byte, bGTo As Byte, bRTo As Byte
    
    ' Get the bits in the from DIB section:
    With tSA
        .cbElements = 1
        .cDims = 2
        .Bounds(0).lLbound = 0
        .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
        .Bounds(1).lLbound = 0
        .Bounds(1).cElements = BytesPerScanLine()
        .pvData = m_lPtr
    End With
    CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSA), 4

   lFrom = TranslateColor(oColorFrom)
   bBFrom = (lFrom And &HFF0000) \ &H10000
   bGFrom = (lFrom And &HFF00&) \ &H100&
   bRFrom = (lFrom And &HFF&)
   lTo = TranslateColor(oColorTo)
   bBTo = (lTo And &HFF0000) \ &H10000
   bGTo = (lTo And &HFF00&) \ &H100&
   bRTo = (lTo And &HFF&)
   xEnd = (Width - 1) * 3
   For x = 0 To xEnd Step 3
      For y = 0 To m_TBI.bmiHeader.biHeight - 1
         If bDib(x, y) = bBFrom And bDib(x + 1, y) = bGFrom And bDib(x + 2, y) = bRFrom Then
            bDib(x, y) = bBTo: bDib(x + 1, y) = bGTo: bDib(x + 2, y) = bRTo
         End If
      Next y
   Next x
    
   ' Clear the temporary array descriptor
   ' This is necessary under NT4.
   CopyMemory ByVal VarPtrArray(bDib), 0&, 4
   
End Sub

Public Property Get Colors() As Long

  Colors = m_Colors
  
End Property

Public Property Let Colors(New_Value As Long)

  m_Colors = New_Value
  
End Property
Public Function ParseBoolean(BoolArray() As Boolean, Width As Integer, Height As Integer) As clsDIB

  Dim x As Integer
  Dim y As Integer
  Dim bDibTo() As Byte
  Dim cDIB As clsDIB
  Dim ByteIndex As Integer
  Dim tSATo As SAFEARRAY2D
  
  'Recreate the DIB object if the size
  'was changed since before
  'If (Me.Width <> Width) Or (Me.Height <> Height) Then
    Call Create(Width, Height)
  'End If
  
  'Get the bits in the to DIB section
  With tSATo
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibTo()), VarPtr(tSATo), 4
  
  For x = 0 To (Width - 1)
    For y = 0 To (Height - 1)
      If (BoolArray(ByteIndex)) Then
        bDibTo(x * 3, y) = 0
        bDibTo(x * 3 + 1, y) = 0
        bDibTo(x * 3 + 2, y) = 0
      Else
        bDibTo(x * 3, y) = 255
        bDibTo(x * 3 + 1, y) = 255
        bDibTo(x * 3 + 2, y) = 255
      End If
      ByteIndex = ByteIndex + 1
    Next
  Next
  
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibTo), 0&, 4
  
End Function
Public Function CopyToClipboard(Optional ByVal bAsDIB As Boolean = True) As Boolean

  Dim lhDCDesktop As Long
  Dim lHDC As Long
  Dim lhBmpOld As Long
  Dim hObj As Long
  Dim lFmt As Long
  Dim b() As Byte
  Dim tBI As BITMAPINFO
  Dim lptr As Long
  Dim hDibCopy As Long

  lhDCDesktop = GetDC(GetDesktopWindow())
  
  If (lhDCDesktop <> 0) Then
    lHDC = CreateCompatibleDC(lhDCDesktop)
    If (lHDC <> 0) Then
      If (bAsDIB) Then
        Call MsgBox("I don't know how to put a DIB on the clipboard! Copy as bitmap instead!!!")
      Else
        'Create a compatible bitmap and copy to
        'the clipboard
        hObj = CreateCompatibleBitmap(lhDCDesktop, Width, Height)
        If (hObj <> 0) Then
          lhBmpOld = SelectObject(lHDC, hObj)
          PaintPicture lHDC
          SelectObject lHDC, lhBmpOld
          lFmt = CF_BITMAP
                    
          'Now set the clipboard to the bitmap
          If (OpenClipboard(0) <> 0) Then
            EmptyClipboard
            If (SetClipboardData(lFmt, hObj) <> 0) Then
              CopyToClipboard = True
            End If
            CloseClipboard
          End If
        End If
      End If
      DeleteDC lHDC
    End If
    DeleteDC lhDCDesktop
  End If

End Function
Public Function CreateDIB(ByVal lHDC As Long, ByVal lWidth As Long, ByVal lHeight As Long, ByRef hDib As Long) As Boolean

  Dim i As Long
  Dim cP As clsPalette
  Dim tBI2 As BITMAPINFO2
  Dim tBI16 As BITMAPINFO16
  Dim tBI256 As BITMAPINFO256
  
  'Set up the header structure
  With m_TBI.bmiHeader
    .biSize = Len(m_TBI.bmiHeader)
    .biWidth = lWidth
    .biHeight = lHeight
    .biPlanes = 1
    .biBitCount = BitCount()
    .biCompression = BI_RGB
    .biSizeImage = BytesPerScanLine() * .biHeight
  End With
  
  'Create the color palette with the colordepth,
  'unless we use a TrueColor (2^24) where no
  'color palette is needed
  If (m_Colors <> 2 ^ 24) Then
    Set cP = New clsPalette
    Call cP.CreateStatic(m_Colors)
  End If
    
  Select Case m_Colors
  Case 2
    'Set up the bitmap header
    LSet tBI2.bmiHeader = m_TBI.bmiHeader
    
    'Populate bitmap color table
    For i = 0 To 1
      With tBI2.bmiColors(i)
        .RGBBlue = cP.Blue(i + 1)
        .RGBGreen = cP.Green(i + 1)
        .RGBRed = cP.Red(i + 1)
      End With
    Next
    
    'Create the DIB
    hDib = CreateDIBSection2(lHDC, tBI2, DIB_RGB_COLORS, m_lPtr, 0, 0)
  Case 16
    'Set up the bmiHeader size
    LSet tBI16.bmiHeader = m_TBI.bmiHeader
    
    'Populate bitmap color table
    For i = 0 To 15
      With tBI16.bmiColors(i)
        .RGBBlue = cP.Blue(i + 1)
        .RGBGreen = cP.Green(i + 1)
        .RGBRed = cP.Red(i + 1)
      End With
    Next
    
    'Create the DIB
    hDib = CreateDIBSection16(lHDC, tBI16, DIB_RGB_COLORS, m_lPtr, 0, 0)
  Case 256
    'Copy the bitmap header
    LSet tBI256.bmiHeader = m_TBI.bmiHeader
    
    'Populate bitmap color table
    For i = 0 To 255
      With tBI256.bmiColors(i)
        .RGBBlue = cP.Blue(i + 1)
        .RGBGreen = cP.Green(i + 1)
        .RGBRed = cP.Red(i + 1)
      End With
    Next
    
    'Create the DIB
    hDib = CreateDIBSection256(lHDC, tBI256, DIB_RGB_COLORS, m_lPtr, 0, 0)
  Case Else
    'Create a DIB with TrueColor
    hDib = CreateDIBSection(lHDC, m_TBI, DIB_RGB_COLORS, m_lPtr, 0, 0)
  End Select
  
  'Return TRUE if the DIB was created
  CreateDIB = (hDib <> 0)

End Function
Public Function CreateFromPicture(ByRef picThis As StdPicture)

  Dim lHDC As Long
  Dim lhDCDesktop As Long
  Dim lhBmpOld As Long
  Dim tBMP As BITMAP
    
  GetObjectAPI picThis.Handle, Len(tBMP), tBMP
  If (Create(tBMP.bmWidth, tBMP.bmHeight)) Then
    lhDCDesktop = GetDC(GetDesktopWindow())
    If (lhDCDesktop <> 0) Then
      lHDC = CreateCompatibleDC(lhDCDesktop)
      DeleteDC lhDCDesktop
      If (lHDC <> 0) Then
        lhBmpOld = SelectObject(lHDC, picThis.Handle)
        LoadPictureBlt lHDC
        SelectObject lHDC, lhBmpOld
        DeleteObject lHDC
      End If
    End If
  End If

End Function
Public Function Create(ByVal lWidth As Long, ByVal lHeight As Long) As Boolean
    
  Call ClearUp
  m_HDC = CreateCompatibleDC(0)
  If (m_HDC <> 0) Then
    If (CreateDIB(m_HDC, lWidth, lHeight, m_hDIb)) Then
      m_hBmpOld = SelectObject(m_HDC, m_hDIb)
      Create = True
    Else
      DeleteObject m_HDC
      m_HDC = 0
    End If
  End If

End Function
Public Property Get BytesPerScanLine() As Long
  
  BytesPerScanLine = (Width * BitCount)
  If (BytesPerScanLine Mod 32 > 0) Then
    BytesPerScanLine = BytesPerScanLine + 32 - (BytesPerScanLine Mod 32)
  End If
  BytesPerScanLine = BytesPerScanLine \ 8
  
'  'Scans must align on dword boundaries
'  Select Case m_Colors
'  Case 2
'    BytesPerScanLine = (Width + 7) \ 8
'  Case 16
'    BytesPerScanLine = (Width + 1) \ 2
'  Case 256
'    BytesPerScanLine = Width
'  Case Else
'    BytesPerScanLine = Width * 3
'  End Select
'
'  'The value must be dword-aligned
'  If (BytesPerScanLine Mod 4 > 0) Then
'    BytesPerScanLine = BytesPerScanLine + (4 - (BytesPerScanLine Mod 4))
'  End If

End Property
Public Sub Line(Optional X1 As Long = MAX_LONG, Optional Y1 As Long = MAX_LONG, Optional X2 As Long, Optional Y2 As Long)

  Dim lpPoint As POINTAPI
  
  If (X1 <> MAX_LONG) Or (Y1 <> MAX_LONG) Then
    Call MoveToEx(m_HDC, X1, Y1, lpPoint)
  End If
  Call LineTo(m_HDC, X2, Y2)

End Sub
Public Sub LineEx(Optional X1 As Long = MAX_LONG, Optional Y1 As Long = MAX_LONG, Optional X2 As Long, Optional Y2 As Long)

  Dim lpPoint As POINTAPI
  
  If (X1 <> MAX_LONG) Or (Y1 <> MAX_LONG) Then
    Call MoveToEx(m_HDC, X1, Y1, lpPoint)
  End If
  Call LineTo(m_HDC, X2, Y2)

End Sub

Public Sub ParseString(Value As String)

  Dim ByteArray() As Byte
  
  'Convert the string into a byte array
  ByteArray() = StrConv(Value, vbFromUnicode)
  
  'Interprete the byte array
  Call ParseByte(ByteArray())
  
End Sub
Sub Rectangle(X1 As Long, Y1 As Long, X2 As Long, Y2 As Long, Color As OLE_COLOR)

  Dim lpRect As RECT
  Dim hBrush As Long
  
  lpRect.Top = Y1
  lpRect.Left = X1
  lpRect.Bottom = Y2
  lpRect.Right = X2
  hBrush = CreateSolidBrush(Color)
  Call FillRect(hdc, lpRect, hBrush)
  Call DeleteObject(hBrush)
  
End Sub

Public Function Size() As Long

  Size = m_TBI.bmiHeader.biSizeImage
  
End Function
Public Function ToByte(Value() As Byte)

  Dim y As Integer
  Dim bDibFrom() As Byte
  Dim tSAFrom As SAFEARRAY2D
  
  'Store the data (width - height - data)
  ReDim Value(Size - 1 + 8)
  Call CopyMem(Value(0), Width, 4)
  Call CopyMem(Value(4), Height, 4)
  If (Size > 0) Then
  'Get the bits in the DIB section
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4
  
    Call CopyMem(Value(8), bDibFrom(0, 0), Size)
  
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4
  End If

End Function
Public Sub ToString(Value As String)

  Dim ByteArray() As Byte
  
  'Convert the DIB into a byte array
  Call ToByte(ByteArray())
  
  'Convert the byte array into a string
  'Value = Space$(UBound(ByteArray) - LBound(ByteArray) + 1)
  'Call CopyMem(ByVal Value, ByteArray(0), Len(Value))
  Value = StrConv(ByteArray(), vbUnicode)
  
End Sub
Public Sub ParseByte(Value() As Byte)

  Dim y As Integer
  Dim NewWidth As Long
  Dim NewHeight As Long
  Dim bDibFrom() As Byte
  Dim tSAFrom As SAFEARRAY2D
  
  'Interpret the width and height, then
  'create a DIB with the given size
  Call CopyMem(NewWidth, Value(0), 4)
  Call CopyMem(NewHeight, Value(4), 4)
  
  If (Width <> NewWidth) Or (Height <> NewHeight) Then
    Call Create(NewWidth, NewHeight)
  End If
  
  'Call Rectangle(0, 0, Width, Height, vbBlack)
  
  If (Size > 0) Then
  'Get the bits in the DIB section
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4
  
    Call CopyMem(bDibFrom(0, 0), Value(8), Size)
  'Copy the bit array into the DIB array
  'For Y = 0 To (Height - 1)
  '  Call CopyMem(bDibFrom(0, Y), Value(8 + Y * Width * 3), Width * 3)
  'Next
  
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4
  End If
  
End Sub
Public Function TrimRight() As clsDIB

  Dim x As Integer
  Dim y As Integer
  Dim bDibFrom() As Byte
  Dim DIB As clsDIB
  Dim StopSearch As Boolean
  Dim tSAFrom As SAFEARRAY2D
  
  'Get the bits in the from DIB section
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4
  
  'Loop thru all points starting at the right-most
  'position and end the search when a black pixel
  'has been found
  For x = (Width - 1) To 0 Step -1
    For y = (Height - 1) To 0 Step -1
      If (bDibFrom(x * 3, y) = 0) Then
        StopSearch = True
        Exit For
      End If
    Next
    If (StopSearch) Then Exit For
  Next

  If (x > -1) Then
    'Copy to the new DIB
    Set DIB = New clsDIB
    Call DIB.Create(x + 1, Height)
    Call DIB.LoadPictureBlt(hdc)
    Set TrimRight = DIB
  End If
  
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4
  
End Function
Public Property Get Width() As Long

  Width = m_TBI.bmiHeader.biWidth

End Property
Public Property Get Height() As Long
    
  Height = m_TBI.bmiHeader.biHeight

End Property

Public Sub LoadPictureBlt(ByVal lHDC As Long, Optional ByVal lSrcLeft As Long = 0, Optional ByVal lSrcTop As Long = 0, Optional ByVal lSrcWidth As Long = -1, Optional ByVal lSrcHeight As Long = -1, Optional ByVal eRop As RasterOpConstants = vbSrcCopy)
    
  If (lSrcWidth < 0) Then lSrcWidth = m_TBI.bmiHeader.biWidth
  If (lSrcHeight < 0) Then lSrcHeight = m_TBI.bmiHeader.biHeight
  Call BitBlt(m_HDC, 0, 0, lSrcWidth, lSrcHeight, lHDC, lSrcLeft, lSrcTop, eRop)

End Sub
Public Sub PaintPicture(ByVal lHDC As Long, Optional ByVal lDestLeft As Long = 0, Optional ByVal lDestTop As Long = 0, Optional ByVal lDestWidth As Long = -1, Optional ByVal lDestHeight As Long = -1, Optional ByVal lSrcLeft As Long = 0, Optional ByVal lSrcTop As Long = 0, Optional ByVal eRop As RasterOpConstants = vbSrcCopy)
    
  If (lDestWidth < 0) Then lDestWidth = m_TBI.bmiHeader.biWidth
  If (lDestHeight < 0) Then lDestHeight = m_TBI.bmiHeader.biHeight
  Call BitBlt(lHDC, lDestLeft, lDestTop, lDestWidth, lDestHeight, m_HDC, lSrcLeft, lSrcTop, eRop)

End Sub
Public Property Get hdc() As Long
    
  hdc = m_HDC

End Property
Public Property Get hDib() As Long
    
  hDib = m_hDIb

End Property
Public Property Get DIBSectionBitsPtr() As Long

  DIBSectionBitsPtr = m_lPtr

End Property
Public Sub ClearUp()
    
  If (m_HDC <> 0) Then
    If (m_hDIb <> 0) Then
      SelectObject m_HDC, m_hBmpOld
      DeleteObject m_hDIb
    End If
    DeleteObject m_HDC
  End If
  m_HDC = 0
  m_hDIb = 0
  m_hBmpOld = 0
  m_lPtr = 0

End Sub
Public Function Resample(ByVal lNewHeight As Long, ByVal lNewWidth As Long) As clsDIB

  Dim cDIB As clsDIB
  
  Set cDIB = New clsDIB
  If cDIB.Create(lNewWidth, lNewHeight) Then
    If (lNewWidth <> m_TBI.bmiHeader.biWidth) Or (lNewHeight <> m_TBI.bmiHeader.biHeight) Then
      'Change in size, do resample
      ResampleDib cDIB
    Else
      'No size change so just return a copy
      cDIB.LoadPictureBlt m_HDC
    End If
    Set Resample = cDIB
  End If

End Function
Public Function Resize(ByVal lNewWidth As Long, ByVal lNewHeight As Long) As clsDIB

  Dim cDIB As clsDIB
  
  Set cDIB = New clsDIB
  cDIB.Colors = m_Colors
  If cDIB.Create(lNewWidth, lNewHeight) Then
    If (lNewWidth <> m_TBI.bmiHeader.biWidth) Or (lNewHeight <> m_TBI.bmiHeader.biHeight) Then
      'Change in size, do resize using the StretchBlt API
      Call StretchBlt(cDIB.hdc, 0, 0, lNewWidth, lNewHeight, hdc, 0, 0, Width, Height, SRCCOPY)
    Else
      'No size change so just return a copy
      cDIB.LoadPictureBlt m_HDC
    End If
    Set Resize = cDIB
  End If

End Function

Private Function ResampleDib(ByRef cDibTo As clsDIB) As Boolean

  Dim bDibTo() As Byte
  Dim bDibFrom() As Byte
  Dim tSATo As SAFEARRAY2D
  Dim tSAFrom As SAFEARRAY2D
  
  'Get the bits in the from DIB section:
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4

  'Get the bits in the to DIB section:
  With tSATo
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = cDibTo.Height
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = cDibTo.BytesPerScanLine()
    .pvData = cDibTo.DIBSectionBitsPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibTo()), VarPtr(tSATo), 4

  Dim xScale As Single
  Dim yScale As Single
  Dim x As Long, y As Long, xOut As Long
  Dim fX As Single, fY As Single
  Dim ifY As Long, ifX As Long
  Dim dx As Single, dy As Single
  Dim r As Long, r1 As Single, r2 As Single, r3 As Single, r4 As Single
  Dim g As Long, g1 As Single, g2 As Single, g3 As Single, g4 As Single
  Dim b As Long, b1 As Single, b2 As Single, b3 As Single, b4 As Single
  Dim ir1 As Long, ig1 As Long, ib1 As Long
  Dim ir2 As Long, ig2 As Long, ib2 As Long

  xScale = (Width - 1) / cDibTo.Width
  yScale = (Height - 1) / cDibTo.Height
  
  For y = 0 To (cDibTo.Height - 1)
        
    fY = y * yScale
    ifY = Int(fY)
    dy = fY - ifY
        
    For x = 0 To (cDibTo.Width - 1)
      
      fX = x * xScale
      ifX = Int(fX)
      dx = fX - ifX
            
      ifX = ifX * 3
      
      'Interpolate using the four nearest pixels in the source
      b1 = bDibFrom(ifX, ifY): g1 = bDibFrom(ifX + 1, ifY): r1 = bDibFrom(ifX + 2, ifY)
      b2 = bDibFrom(ifX + 3, ifY): g2 = bDibFrom(ifX + 4, ifY): r2 = bDibFrom(ifX + 5, ifY)
      b3 = bDibFrom(ifX, ifY + 1): g3 = bDibFrom(ifX + 1, ifY + 1): r3 = bDibFrom(ifX + 2, ifY + 1)
      b4 = bDibFrom(ifX + 3, ifY + 1): g4 = bDibFrom(ifX + 4, ifY + 1): r4 = bDibFrom(ifX + 5, ifY + 1)
      
      'Interplate in x direction:
      ir1 = r1 * (1 - dy) + r3 * dy: ig1 = g1 * (1 - dy) + g3 * dy: ib1 = b1 * (1 - dy) + b3 * dy
      ir2 = r2 * (1 - dy) + r4 * dy: ig2 = g2 * (1 - dy) + g4 * dy: ib2 = b2 * (1 - dy) + b4 * dy
      
      'Interpolate in y
      r = ir1 * (1 - dx) + ir2 * dx: g = ig1 * (1 - dx) + ig2 * dx: b = ib1 * (1 - dx) + ib2 * dx
      
      'Set output
      If (r > 200) Or (g > 200) Or (b > 200) Then
        r = 255
        g = 255
        b = 255
      Else
        r = 0
        g = 0
        b = 0
      End If
      'If (r < 0) Then r = 0 Else If (r > 255) Then r = 255
      'If (g < 0) Then g = 0 Else If (g > 255) Then g = 255
      'If (b < 0) Then b = 0 Else If (b > 255) Then b = 255
      
      xOut = x * 3
      bDibTo(xOut, y) = b
      bDibTo(xOut + 1, y) = g
      bDibTo(xOut + 2, y) = r
            
    Next
        
  Next

  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4
  CopyMemory ByVal VarPtrArray(bDibTo), 0&, 4

End Function
Public Function IsEmpty(BackColor As OLE_COLOR) As Boolean

  Dim x As Long
  Dim y As Long
  Dim bDibFrom() As Byte
  Dim tSAFrom As SAFEARRAY2D

  'Get the bits in the from DIB section:
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4

  For y = 0 To Height - 1
    For x = 0 To Width - 1
      If (RGB(bDibFrom(x * 3, y), bDibFrom(x * 3 + 1, y), bDibFrom(x * 3 + 2, y)) <> 12566463) Then
        IsEmpty = False
        GoTo Done
      End If
    Next
  Next
  IsEmpty = True
  
Done:
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4

End Function
Public Sub SetColor(Optional ForeColor As Long = vbBlack, Optional BackColor As Long = vbWhite)

  Dim x As Integer
  Dim y As Integer
  Dim bDib() As Byte
  Dim ForeRed As Byte
  Dim BackRed As Byte
  Dim ForeBlue As Byte
  Dim BackBlue As Byte
  Dim ForeGreen As Byte
  Dim BackGreen As Byte
  Dim tSAFrom As SAFEARRAY2D

  'Get background and foreground colors
  Call RGBParts(BackColor, BackRed, BackGreen, BackBlue)
  Call RGBParts(ForeColor, ForeRed, ForeGreen, ForeBlue)
  
  'Get the bits in the from DIB section
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDib()), VarPtr(tSAFrom), 4

  If (ForeColor <> vbBlack) And (BackColor <> vbWhite) Then
    'Change both forecolor and backcolor
    For y = 0 To (Height - 1)
      For x = 0 To (Width - 1)
        If (bDib(x * 3, y) = 255) Then
          'Set background color
          bDib(x * 3, y) = BackBlue
          bDib(x * 3 + 1, y) = BackGreen
          bDib(x * 3 + 2, y) = BackRed
        Else
          'Set foreground color
          bDib(x * 3, y) = ForeBlue
          bDib(x * 3 + 1, y) = ForeGreen
          bDib(x * 3 + 2, y) = ForeRed
        End If
      Next
    Next
  ElseIf (ForeColor <> vbBlack) Then
    For y = 0 To (Height - 1)
      For x = 0 To (Width - 1)
        If (bDib(x * 3, y) = 0) Then
          'Set foreground color
          bDib(x * 3, y) = ForeBlue
          bDib(x * 3 + 1, y) = ForeGreen
          bDib(x * 3 + 2, y) = ForeRed
        End If
      Next
    Next
  ElseIf (BackColor <> vbWhite) Then
    For y = 0 To (Height - 1)
      For x = 0 To (Width - 1)
        If (bDib(x * 3, y) = 255) Then
          'Set background color
          bDib(x * 3, y) = BackBlue
          bDib(x * 3 + 1, y) = BackGreen
          bDib(x * 3 + 2, y) = BackRed
        End If
      Next
    Next
  End If
  
  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDib), 0&, 4

End Sub
Public Function ToBoolean(BoolArray() As Boolean) As Boolean

  Dim x As Integer
  Dim y As Integer
  Dim bDibFrom() As Byte
  Dim ByteIndex As Integer
  Dim tSAFrom As SAFEARRAY2D
  
  'Get the bits in the from DIB section
  With tSAFrom
    .cbElements = 1
    .cDims = 2
    .Bounds(0).lLbound = 0
    .Bounds(0).cElements = m_TBI.bmiHeader.biHeight
    .Bounds(1).lLbound = 0
    .Bounds(1).cElements = BytesPerScanLine()
    .pvData = m_lPtr
  End With
  CopyMemory ByVal VarPtrArray(bDibFrom()), VarPtr(tSAFrom), 4

  ReDim BoolArray(Width * Height - 1)
  For x = 0 To (Width * 3 - 1) Step 3
    For y = 0 To (Height - 1)
      BoolArray(ByteIndex) = (bDibFrom(x, y) = 0)
      ByteIndex = ByteIndex + 1
    Next
  Next

  'Clear the temporary array descriptor
  'This is necessary under NT4.
  CopyMemory ByVal VarPtrArray(bDibFrom), 0&, 4

End Function

Private Sub Class_Initialize()

  m_Colors = 2 ^ 24
  
End Sub

Private Sub Class_Terminate()

  ClearUp

End Sub


