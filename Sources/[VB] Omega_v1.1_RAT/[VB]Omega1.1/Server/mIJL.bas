Attribute VB_Name = "mIntelJPEGLibrary"
Option Explicit

' ==================================================================================
' Filename:    mIntelJPEGLibrary.bas
' Author:      Steve McMahon
' Date:        15 March 1999
' Requires:    cDIBSection.cls (vbAccelerator)
'              IJL11.DLL (Intel)
'
' An interface to Intel's IJL (Intel JPG Library) for use in VB.
'
' Copyright © 1999 Steve McMahon for vbAccelerator
' http://vbaccelerator.com/
'
' Modifications
' 16 Jan 2000  SPM
' * Modified to declares to access v1.1. of Intel's IJL DLL
' * SaveJPG - if you were overwriting an existing JPG, the file could never be
'   reduced in size, only increased.  Old bytes were simply left trailing as
'   an unnecessary payload at the JPG.  The JPG could be loaded, but this was
'   not ideal.  The new version ensures the file size is always set.
' * LoadJPGFromPtr - new function, allows you to read a JPG from a memory
'   address (e.g. resource etc)
'
'
' Copyright.
' IJL.DLL is a copyright © Intel, which is a registered trade mark of the Intel
' Corporation.
'
'
' Note.
' Intel are not responsible for any errors in this code and should not be
' mentioned in any Help, About or support in any product using the Intel library.
'
'
'
' ==================================================================================

' IJL Declares:
Private Enum IJLERR
  '// The following "error" values indicate an "OK" condition.
  IJL_OK = 0
  IJL_INTERRUPT_OK = 1
  IJL_ROI_OK = 2

  '// The following "error" values indicate an error has occurred.
  IJL_EXCEPTION_DETECTED = -1
  IJL_INVALID_ENCODER = -2
  IJL_UNSUPPORTED_SUBSAMPLING = -3
  IJL_UNSUPPORTED_BYTES_PER_PIXEL = -4
  IJL_MEMORY_ERROR = -5
  IJL_BAD_HUFFMAN_TABLE = -6
  IJL_BAD_QUANT_TABLE = -7
  IJL_INVALID_JPEG_PROPERTIES = -8
  IJL_ERR_FILECLOSE = -9
  IJL_INVALID_FILENAME = -10
  IJL_ERROR_EOF = -11
  IJL_PROG_NOT_SUPPORTED = -12
  IJL_ERR_NOT_JPEG = -13
  IJL_ERR_COMP = -14
  IJL_ERR_SOF = -15
  IJL_ERR_DNL = -16
  IJL_ERR_NO_HUF = -17
  IJL_ERR_NO_QUAN = -18
  IJL_ERR_NO_FRAME = -19
  IJL_ERR_MULT_FRAME = -20
  IJL_ERR_DATA = -21
  IJL_ERR_NO_IMAGE = -22
  IJL_FILE_ERROR = -23
  IJL_INTERNAL_ERROR = -24
  IJL_BAD_RST_MARKER = -25
  IJL_THUMBNAIL_DIB_TOO_SMALL = -26
  IJL_THUMBNAIL_DIB_WRONG_COLOR = -27
  IJL_RESERVED = -99

End Enum

Private Enum IJLIOTYPE
  IJL_SETUP = -1&
  ''// Read JPEG parameters (i.e., height, width, channels,
  ''// sampling, etc.) from a JPEG bit stream.
  IJL_JFILE_READPARAMS = 0&
  IJL_JBUFF_READPARAMS = 1&
  ''// Read a JPEG Interchange Format image.
  IJL_JFILE_READWHOLEIMAGE = 2&
  IJL_JBUFF_READWHOLEIMAGE = 3&
  ''// Read JPEG tables from a JPEG Abbreviated Format bit stream.
  IJL_JFILE_READHEADER = 4&
  IJL_JBUFF_READHEADER = 5&
  ''// Read image info from a JPEG Abbreviated Format bit stream.
  IJL_JFILE_READENTROPY = 6&
  IJL_JBUFF_READENTROPY = 7&
  ''// Write an entire JFIF bit stream.
  IJL_JFILE_WRITEWHOLEIMAGE = 8&
  IJL_JBUFF_WRITEWHOLEIMAGE = 9&
  ''// Write a JPEG Abbreviated Format bit stream.
  IJL_JFILE_WRITEHEADER = 10&
  IJL_JBUFF_WRITEHEADER = 11&
  ''// Write image info to a JPEG Abbreviated Format bit stream.
  IJL_JFILE_WRITEENTROPY = 12&
  IJL_JBUFF_WRITEENTROPY = 13&
  ''// Scaled Decoding Options:
  ''// Reads a JPEG image scaled to 1/2 size.
  IJL_JFILE_READONEHALF = 14&
  IJL_JBUFF_READONEHALF = 15&
  ''// Reads a JPEG image scaled to 1/4 size.
  IJL_JFILE_READONEQUARTER = 16&
  IJL_JBUFF_READONEQUARTER = 17&
  ''// Reads a JPEG image scaled to 1/8 size.
  IJL_JFILE_READONEEIGHTH = 18&
  IJL_JBUFF_READONEEIGHTH = 19&
  ''// Reads an embedded thumbnail from a JFIF bit stream.
  IJL_JFILE_READTHUMBNAIL = 20&
  IJL_JBUFF_READTHUMBNAIL = 21&

End Enum

Private Type JPEG_CORE_PROPERTIES_VB ' Sadly, due to a limitation in VB (UDT variable count)
                                     ' we can't encode the full JPEG_CORE_PROPERTIES structure
  UseJPEGPROPERTIES As Long                      '// default = 0

  '// DIB specific I/O data specifiers.
  DIBBytes As Long ';                  '// default = NULL 4
  DIBWidth As Long ';                  '// default = 0 8
  DIBHeight As Long ';                 '// default = 0 12
  DIBPadBytes As Long ';               '// default = 0 16
  DIBChannels As Long ';               '// default = 3 20
  DIBColor As Long ';                  '// default = IJL_BGR 24
  DIBSubsampling As Long  ';            '// default = IJL_NONE 28

  '// JPEG specific I/O data specifiers.
  JPGFile As Long 'LPTSTR              JPGFile;                32   '// default = NULL
  JPGBytes As Long ';                  '// default = NULL 36
  JPGSizeBytes As Long ';              '// default = 0 40
  JPGWidth As Long ';                  '// default = 0 44
  JPGHeight As Long ';                 '// default = 0 48
  JPGChannels As Long ';               '// default = 3
  JPGColor As Long           ';                  '// default = IJL_YCBCR
  JPGSubsampling As Long  ';            '// default = IJL_411
  JPGThumbWidth As Long ' ;             '// default = 0
  JPGThumbHeight As Long ';            '// default = 0

  '// JPEG conversion properties.
  cconversion_reqd As Long ';          '// default = TRUE
  upsampling_reqd As Long ';           '// default = TRUE
  jquality As Long ';                  '// default = 75.  100 is my preferred quality setting.

  '// Low-level properties - 20,000 bytes.  If the whole structure
  ' is written out then VB fails with an obscure error message
  ' "Too Many Local Variables" !
  '
  ' These all default if they are not otherwise specified so there
  ' is no trouble to just assign a sufficient buffer in memory:
  jprops(0 To 19999) As Byte

End Type


Private Declare Function ijlInit Lib "ijl11.dll" (jcprops As Any) As Long
Private Declare Function ijlFree Lib "ijl11.dll" (jcprops As Any) As Long
Private Declare Function ijlRead Lib "ijl11.dll" (jcprops As Any, ByVal ioType As Long) As Long
Private Declare Function ijlWrite Lib "ijl11.dll" (jcprops As Any, ByVal ioType As Long) As Long
Private Declare Function ijlGetLibVersion Lib "ijl11.dll" () As Long
Private Declare Function ijlGetErrorString Lib "ijl11.dll" (ByVal code As Long) As Long

' Win32 Declares
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" ( _
    lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
Private Const GMEM_DDESHARE = &H2000
Private Const GMEM_DISCARDABLE = &H100
Private Const GMEM_DISCARDED = &H4000
Private Const GMEM_FIXED = &H0
Private Const GMEM_INVALID_HANDLE = &H8000
Private Const GMEM_LOCKCOUNT = &HFF
Private Const GMEM_MODIFY = &H80
Private Const GMEM_MOVEABLE = &H2
Private Const GMEM_NOCOMPACT = &H10
Private Const GMEM_NODISCARD = &H20
Private Const GMEM_NOT_BANKED = &H1000
Private Const GMEM_NOTIFY = &H4000
Private Const GMEM_SHARE = &H2000
Private Const GMEM_VALID_FLAGS = &H7F72
Private Const GMEM_ZEROINIT = &H40
Private Const GPTR = (GMEM_FIXED Or GMEM_ZEROINIT)

' Stuff for replacing a file when you have to Kill the original:
Private Const MAX_PATH = 260
Private Type FILETIME
   dwLowDateTime As Long
   dwHighDateTime As Long
End Type
Private Type WIN32_FIND_DATA
   dwFileAttributes As Long
   ftCreationTime As FILETIME
   ftLastAccessTime As FILETIME
   ftLastWriteTime As FILETIME
   nFileSizeHigh As Long
   nFileSizeLow As Long
   dwReserved0 As Long
   dwReserved1 As Long
   cFileName As String * MAX_PATH
   cAlternate As String * 14
End Type
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function lopen Lib "kernel32" Alias "_lopen" (ByVal lpPathName As String, ByVal iReadWrite As Long) As Long
Private Declare Function lclose Lib "kernel32" Alias "_lclose" (ByVal hFile As Long) As Long
Private Declare Function SetFileTime Lib "kernel32" (ByVal hFile As Long, lpCreationTime As FILETIME, lpLastAccessTime As FILETIME, lpLastWriteTime As FILETIME) As Long
Private Declare Function SetFileAttributes Lib "kernel32" Alias "SetFileAttributesA" (ByVal lpFileName As String, ByVal dwFileAttributes As Long) As Long
Private Const OF_WRITE = &H1
Private Const OF_SHARE_DENY_WRITE = &H20
Private Const GENERIC_WRITE = &H40000000
Private Const GENERIC_READ = &H80000000
Private Const FILE_SHARE_WRITE = &H2
Private Const CREATE_ALWAYS = 2
Private Const FILE_BEGIN = 0
Private Const SECTION_MAP_WRITE = &H2

Public Function LoadJPG( _
      ByRef cDib As cDIBSection, _
      ByVal sFile As String _
   ) As Boolean
Dim tJ As JPEG_CORE_PROPERTIES_VB
Dim bFile() As Byte
Dim lR As Long
Dim lPtr As Long
Dim lJPGWidth As Long, lJPGHeight As Long

   lR = ijlInit(tJ)
   If lR = IJL_OK Then
      
      ' Write the filename to the jcprops.JPGFile member:
      bFile = StrConv(sFile, vbFromUnicode)
      ReDim Preserve bFile(0 To UBound(bFile) + 1) As Byte
      bFile(UBound(bFile)) = 0
      lPtr = VarPtr(bFile(0))
      CopyMemory tJ.JPGFile, lPtr, 4
      
      ' Read the JPEG file parameters:
      lR = ijlRead(tJ, IJL_JFILE_READPARAMS)
      If lR <> IJL_OK Then
         ' Throw error
         MsgBox "Failed to read JPG", vbExclamation
      Else
        ' set JPG color
         If tJ.JPGChannels = 1 Then
            tJ.JPGColor = 4& ' IJL_G
         Else
            tJ.JPGColor = 3& ' IJL_YCBCR
         End If
            
         ' Get the JPGWidth ...
         lJPGWidth = tJ.JPGWidth
         ' .. & JPGHeight member values:
         lJPGHeight = tJ.JPGHeight
      
         ' Create a buffer of sufficient size to hold the image:
         If cDib.Create(lJPGWidth, lJPGHeight) Then
            ' Store DIBWidth:
            tJ.DIBWidth = lJPGWidth
            ' Very important: tell IJL how many bytes extra there
            ' are on each DIB scan line to pad to 32 bit boundaries:
            tJ.DIBPadBytes = cDib.BytesPerScanLine - lJPGWidth * 3
            ' Store DIBHeight:
            tJ.DIBHeight = -lJPGHeight
            ' Store Channels:
            tJ.DIBChannels = 3&
            ' Store DIBBytes (pointer to uncompressed JPG data):
            tJ.DIBBytes = cDib.DIBSectionBitsPtr
            
            ' Now decompress the JPG into the DIBSection:
            lR = ijlRead(tJ, IJL_JFILE_READWHOLEIMAGE)
            If lR = IJL_OK Then
               ' That's it!  cDib now contains the uncompressed JPG.
               LoadJPG = True
            Else
               ' Throw error:
               MsgBox "Cannot read Image Data from file.", vbExclamation
            End If
         Else
            ' failed to create the DIB...
         End If
      End If
                        
      ' Ensure we have freed memory:
      ijlFree tJ
   Else
      ' Throw error:
      MsgBox "Failed to initialise the IJL library: " & lR, vbExclamation
   End If
   
   
End Function
Public Function LoadJPGFromPtr( _
      ByRef cDib As cDIBSection, _
      ByVal lPtr As Long, _
      ByVal lSize As Long _
   ) As Boolean
Dim tJ As JPEG_CORE_PROPERTIES_VB
Dim bFile() As Byte
Dim lR As Long
Dim lJPGWidth As Long, lJPGHeight As Long

   lR = ijlInit(tJ)
   If lR = IJL_OK Then
            
      ' set JPEG buffer
      tJ.JPGBytes = lPtr
      tJ.JPGSizeBytes = lSize
            
      ' Read the JPEG parameters:
      lR = ijlRead(tJ, IJL_JBUFF_READPARAMS)
      If lR <> IJL_OK Then
         ' Throw error
         MsgBox "Failed to read JPG", vbExclamation
      Else
        ' set JPG color
         If tJ.JPGChannels = 1 Then
            tJ.JPGColor = 4& ' IJL_G
         Else
            tJ.JPGColor = 3& ' IJL_YCBCR
         End If
      
         ' Get the JPGWidth ...
         lJPGWidth = tJ.JPGWidth
         ' .. & JPGHeight member values:
         lJPGHeight = tJ.JPGHeight
      
         ' Create a buffer of sufficient size to hold the image:
         If cDib.Create(lJPGWidth, lJPGHeight) Then
            ' Store DIBWidth:
            tJ.DIBWidth = lJPGWidth
            ' Very important: tell IJL how many bytes extra there
            ' are on each DIB scan line to pad to 32 bit boundaries:
            tJ.DIBPadBytes = cDib.BytesPerScanLine - lJPGWidth * 3
            ' Store DIBHeight:
            tJ.DIBHeight = -lJPGHeight
            ' Store Channels:
            tJ.DIBChannels = 3&
            ' Store DIBBytes (pointer to uncompressed JPG data):
            tJ.DIBBytes = cDib.DIBSectionBitsPtr
            
            ' Now decompress the JPG into the DIBSection:
            lR = ijlRead(tJ, IJL_JBUFF_READWHOLEIMAGE)
            If lR = IJL_OK Then
               ' That's it!  cDib now contains the uncompressed JPG.
               LoadJPGFromPtr = True
            Else
               ' Throw error:
               MsgBox "Cannot read Image Data from file.", vbExclamation
            End If
         Else
            ' failed to create the DIB...
         End If
      End If
                        
      ' Ensure we have freed memory:
      ijlFree tJ
   Else
      ' Throw error:
      MsgBox "Failed to initialise the IJL library: " & lR, vbExclamation
   End If
   
End Function

Public Function SaveJPG( _
      ByRef cDib As cDIBSection, _
      ByVal sFile As String, _
      Optional ByVal lQuality As Long = 90 _
   ) As Boolean
Dim tJ As JPEG_CORE_PROPERTIES_VB
Dim bFile() As Byte
Dim lPtr As Long
Dim lR As Long
Dim tFnd As WIN32_FIND_DATA
Dim hFile As Long
Dim bFileExisted As Boolean
Dim lFileSize As Long
   
   hFile = -1
   
   lR = ijlInit(tJ)
   If lR = IJL_OK Then
      
      ' Check if we're attempting to overwrite an existing file.
      ' If so hFile <> INVALID_FILE_HANDLE:
      bFileExisted = (FindFirstFile(sFile, tFnd) <> -1)
      If bFileExisted Then
         Kill sFile
      End If
      
      ' Set up the DIB information:
      ' Store DIBWidth:
      tJ.DIBWidth = cDib.Width
      ' Store DIBHeight:
      tJ.DIBHeight = -cDib.Height
      ' Store DIBBytes (pointer to uncompressed JPG data):
      tJ.DIBBytes = cDib.DIBSectionBitsPtr
      ' Very important: tell IJL how many bytes extra there
      ' are on each DIB scan line to pad to 32 bit boundaries:
      tJ.DIBPadBytes = cDib.BytesPerScanLine - cDib.Width * 3
      
      ' Set up the JPEG information:
      
      ' Store JPGFile:
      bFile = StrConv(sFile, vbFromUnicode)
      ReDim Preserve bFile(0 To UBound(bFile) + 1) As Byte
      bFile(UBound(bFile)) = 0
      lPtr = VarPtr(bFile(0))
      CopyMemory tJ.JPGFile, lPtr, 4
      ' Store JPGWidth:
      tJ.JPGWidth = cDib.Width
      ' .. & JPGHeight member values:
      tJ.JPGHeight = cDib.Height
      ' Set the quality/compression to save:
      tJ.jquality = lQuality
            
      ' Write the image:
      lR = ijlWrite(tJ, IJL_JFILE_WRITEWHOLEIMAGE)
      
      ' Check for success:
      If lR = IJL_OK Then
      
         ' Now if we are replacing an existing file, then we want to
         ' put the file creation and archive information back again:
         If bFileExisted Then
            
            hFile = lopen(sFile, OF_WRITE Or OF_SHARE_DENY_WRITE)
            If hFile = 0 Then
               ' problem
            Else
               SetFileTime hFile, tFnd.ftCreationTime, tFnd.ftLastAccessTime, tFnd.ftLastWriteTime
               lclose hFile
               SetFileAttributes sFile, tFnd.dwFileAttributes
            End If
            
         End If
         
         lFileSize = tJ.JPGSizeBytes - tJ.JPGBytes
         
         ' Success:
         SaveJPG = True
         
      Else
         ' Throw error
         Err.Raise 26001, App.EXEName & ".mIntelJPEGLibrary", "Failed to save to JPG " & lR, vbExclamation
      End If
      
      ' Ensure we have freed memory:
      ijlFree tJ
   Else
      ' Throw error:
      Err.Raise 26001, App.EXEName & ".mIntelJPEGLibrary", "Failed to initialise the IJL library: " & lR
   End If
   

End Function

Public Function SaveJPGToPtr( _
      ByRef cDib As cDIBSection, _
      ByVal lPtr As Long, _
      ByRef lBufSize As Long, _
      Optional ByVal lQuality As Long = 90 _
   ) As Boolean
Dim tJ As JPEG_CORE_PROPERTIES_VB
Dim bFile() As Byte
Dim lR As Long
Dim tFnd As WIN32_FIND_DATA
Dim hFile As Long
Dim bFileExisted As Boolean
Dim b As Boolean
   
   hFile = -1
   
   lR = ijlInit(tJ)
   If lR = IJL_OK Then
      
      ' Set up the DIB information:
      ' Store DIBWidth:
      tJ.DIBWidth = cDib.Width
      ' Store DIBHeight:
      tJ.DIBHeight = -cDib.Height
      ' Store DIBBytes (pointer to uncompressed JPG data):
      tJ.DIBBytes = cDib.DIBSectionBitsPtr
      ' Very important: tell IJL how many bytes extra there
      ' are on each DIB scan line to pad to 32 bit boundaries:
      tJ.DIBPadBytes = cDib.BytesPerScanLine - cDib.Width * 3
      
      ' Set up the JPEG information:
      ' Store JPGWidth:
      tJ.JPGWidth = cDib.Width
      ' .. & JPGHeight member values:
      tJ.JPGHeight = cDib.Height
      ' Set the quality/compression to save:
      tJ.jquality = lQuality
      ' set JPEG buffer
      tJ.JPGBytes = lPtr
      tJ.JPGSizeBytes = lBufSize
            
      ' Write the image:
      lR = ijlWrite(tJ, IJL_JBUFF_WRITEWHOLEIMAGE)
            
      ' Check for success:
      If lR = IJL_OK Then
         
         lBufSize = tJ.JPGSizeBytes
         
         ' Success:
         SaveJPGToPtr = True
         
      Else
         ' Throw error
         Err.Raise 26001, App.EXEName & ".mIntelJPEGLibrary", "Failed to save to JPG " & lR, vbExclamation
      End If
      
      ' Ensure we have freed memory:
      ijlFree tJ
   Else
      ' Throw error:
      Err.Raise 26001, App.EXEName & ".mIntelJPEGLibrary", "Failed to initialise the IJL library: " & lR
   End If
   

End Function



