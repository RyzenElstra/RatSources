Attribute VB_Name = "mdCompression"
Option Explicit

'the following are for compression/decompression
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Private Declare Function compress Lib "zlib.dll" (dest As Any, destLen As Any, src As Any, ByVal srcLen As Long) As Long
Private Declare Function compress2 Lib "zlib.dll" (dest As Any, destLen As Any, src As Any, ByVal srcLen As Long, ByVal level As Long) As Long
Private Declare Function uncompress Lib "zlib.dll" (dest As Any, destLen As Any, src As Any, ByVal srcLen As Long) As Long

'the following are for compression/decompression
Dim lngCompressedSize As Long
Dim lngDecompressedSize As Long

Enum CZErrors 'for compression/decompression
     Z_OK = 0
     Z_STREAM_END = 1
     Z_NEED_DICT = 2
     Z_ERRNO = -1
     Z_STREAM_ERROR = -2
     Z_DATA_ERROR = -3
     Z_MEM_ERROR = -4
     Z_BUF_ERROR = -5
     Z_VERSION_ERROR = -6
End Enum

Enum CompressionLevels 'for compression/decompression
     Z_NO_COMPRESSION = 0
     Z_BEST_SPEED = 1
     'note that levels 2-8 exist, too
     Z_BEST_COMPRESSION = 9
     Z_DEFAULT_COMPRESSION = -1
End Enum

Public Function CompressByteArray(TheData() As Byte, CompressionLevel As Integer) As Long
    'compress a byte array
    Dim lngResult As Long
    Dim lngBufferSize As Long
    Dim arrByteArray() As Byte
    
    lngDecompressedSize = UBound(TheData) + 1
    
    'Allocate memory for byte array
    lngBufferSize = UBound(TheData) + 1
    lngBufferSize = lngBufferSize + (lngBufferSize * 0.01) + 12
    ReDim arrByteArray(lngBufferSize)
    
    'Compress byte array (data)
    lngResult = compress2(arrByteArray(0), lngBufferSize, TheData(0), UBound(TheData) + 1, CompressionLevel)
    
    'Truncate to compressed size
    ReDim Preserve TheData(lngBufferSize - 1)
    CopyMemory TheData(0), arrByteArray(0), lngBufferSize
    
    'Set property
    lngCompressedSize = UBound(TheData) + 1
    
    'return error code (if any)
    CompressByteArray = lngResult
    
End Function

Public Function DecompressByteArray(TheData() As Byte, OriginalSize As Long) As Long
    'decompress a byte array
    Dim lngResult As Long
    Dim lngBufferSize As Long
    Dim arrByteArray() As Byte
    
    lngDecompressedSize = OriginalSize
    lngCompressedSize = UBound(TheData) + 1
    
    'Allocate memory for byte array
    lngBufferSize = OriginalSize
    lngBufferSize = lngBufferSize + (lngBufferSize * 0.01) + 12
    ReDim arrByteArray(lngBufferSize)
    
    'Decompress data
    lngResult = uncompress(arrByteArray(0), lngBufferSize, TheData(0), UBound(TheData) + 1)
    
    'Truncate buffer to compressed size
    ReDim Preserve TheData(lngBufferSize - 1)
    CopyMemory TheData(0), arrByteArray(0), lngBufferSize
    
    'return error code (if any)
    DecompressByteArray = lngResult
    
End Function

Public Function CompressFile(FilePathIn As String, FilePathOut As String, CompressionLevel As Integer) As Long
    'compress a file
    Dim intNextFreeFile As Integer
    Dim TheBytes() As Byte
    Dim lngResult As Long
    Dim lngFileLen As Long
    
    lngFileLen = FileLen(FilePathIn)
    
    'allocate byte array
    ReDim TheBytes(lngFileLen - 1)
    
    'read byte array from file
    Close #10
    intNextFreeFile = FreeFile '10 'FreeFile
    Open FilePathIn For Binary Access Read As #intNextFreeFile
        Get #intNextFreeFile, , TheBytes()
    Close #intNextFreeFile
    
    'compress byte array
    lngResult = CompressByteArray(TheBytes(), CompressionLevel)
    
    'kill any file in place
    On Error Resume Next
    Kill FilePathOut
    On Error GoTo 0
    
    'Write it out
    intNextFreeFile = FreeFile
    Open FilePathOut For Binary Access Write As #intNextFreeFile
        Put #intNextFreeFile, , lngFileLen 'must store the length of the original file
        Put #intNextFreeFile, , TheBytes()
    Close #intNextFreeFile
    
    Erase TheBytes
    CompressFile = lngResult
    
End Function

Public Function DecompressFile(FilePathIn As String, FilePathOut As String) As Long
    'decompress a file
    Dim intNextFreeFile As Integer
    Dim TheBytes() As Byte
    Dim lngResult As Long
    Dim lngFileLen As Long
    
    'allocate byte array
    ReDim TheBytes(FileLen(FilePathIn) - 1)
    
    'read byte array from file
    intNextFreeFile = FreeFile
    Open FilePathIn For Binary Access Read As #intNextFreeFile
        Get #intNextFreeFile, , lngFileLen 'the original (uncompressed) file's length
        Get #intNextFreeFile, , TheBytes()
    Close #intNextFreeFile
    
    'decompress
    lngResult = DecompressByteArray(TheBytes(), lngFileLen)
    'kill any file already there
    On Error Resume Next
    Kill FilePathOut
    On Error GoTo 0
    
    'Write it out
    intNextFreeFile = FreeFile
    Open FilePathOut For Binary Access Write As #intNextFreeFile
        Put #intNextFreeFile, , TheBytes()
    Close #intNextFreeFile
    
    Erase TheBytes
    
    On Error Resume Next
    Kill FilePathIn
    
    DecompressFile = lngResult

End Function

