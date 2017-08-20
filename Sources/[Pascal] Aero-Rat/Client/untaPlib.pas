{
  untaPlib by ErazerZ
  25. Juni 2006

  Example:
    CompressFile('c:\Data.dat', 'c:\Compressed.dat');
    DecompressFile('c:\Compressed.dat', 'c:\Data_ok.dat');
}

unit untaPlib;

interface

uses Windows;

function CompressMemory(lpBuffer: Pointer; var Size: Cardinal): Pointer;
function DecompressMemory(lpBuffer: Pointer; var Size: Cardinal): Pointer;
function CompressFile(lpFilename, lpOutputfile: String): Boolean;
function DecompressFile(lpFilename, lpOutputfile: String): Boolean;

{
  Taken out from aPlibu
}
type
  TaPack_Status = function(w0, w1, w2 : DWORD; cbparam : Pointer) : DWORD;cdecl;
  function _aP_pack(var Source; var Destination; Length : DWORD; var WorkMem; Callback: TaPack_Status; cbparam : Pointer): DWORD; cdecl;
  function _aP_workmem_size(InputSize : DWORD): DWORD; cdecl;
  function _aPsafe_pack(var Source; var Destination; Length : DWORD; var WorkMem; Callback : TaPack_Status; cbparam : Pointer): DWORD; cdecl;
  function _aPsafe_get_orig_size(var Source): DWORD; cdecl;
  function _aPsafe_depack(var Source; SrcLen: DWORD; var Destination; DstLen :DWORD): DWORD; cdecl;
  function _aP_depack_asm(var Source, Destination) : DWORD; cdecl;
  function _aP_crc32(var Source; Length : DWORD): DWORD; cdecl;
  function _aP_depack_asm_safe(var Source; SrcLen : DWORD; var Destination; DstLen :DWORD) : DWORD; cdecl;

implementation

{$L lib_aplib\aplib.obj}
{$L lib_aplib\depack.obj}
{$L lib_aplib\depacks.obj}
{$L lib_aplib\crc32.obj}
{$L lib_aplib\spack.obj}
{$L lib_aplib\sgetsize.obj}
{$L lib_aplib\sdepack.obj}

function _aP_pack(var Source; var Destination; Length : DWORD; var WorkMem; Callback : TaPack_Status; cbparam : Pointer) : DWORD; external;
function _aP_workmem_size(InputSize : DWORD) : DWORD; external;
function _aPsafe_pack(var Source; var Destination; Length : DWORD; var WorkMem; Callback : TaPack_Status; cbparam : Pointer) : DWORD; external;
function _aPsafe_get_orig_size(var Source) : DWORD; external;
function _aPsafe_depack(var Source; SrcLen : DWORD; var Destination; DstLen :DWORD) : DWORD; external;
function _aP_depack_asm(var Source, Destination) : DWORD; external;
function _aP_crc32(var Source; Length : DWORD): DWORD; external;
function _aP_depack_asm_safe(var Source; SrcLen : DWORD; var Destination; DstLen :DWORD) : DWORD; external;

function GetPointerSize(lpBuffer: Pointer): Cardinal;
begin
  if lpBuffer = nil then
    Result := Cardinal(-1)
  else
    Result := Cardinal(Pointer(Cardinal(lpBuffer) -4)^) and $7FFFFFFC -4;
end;

{
  Result: Pointer of the Compressed Buffer.
  lpBuffer: Buffer that should be compressed.
  var Size: Length of how much should be compressed, later the compressed size.
  Safe: Should be True
}
function CompressMemory(lpBuffer: Pointer; var Size: Cardinal): Pointer;
var
  lpOutput, lpWorkspace: Pointer;
begin
  Result := nil;
  if lpBuffer = nil then
    Exit;
  if Size = INVALID_HANDLE_VALUE then
    Size := GetPointerSize(lpBuffer);
  lpWorkspace := VirtualAlloc(nil, _aP_workmem_size(Size), MEM_COMMIT, PAGE_READWRITE);
  lpOutput := VirtualAlloc(nil, Size, MEM_COMMIT, PAGE_READWRITE);
  Size := _aPsafe_pack(lpBuffer^, lpOutput^, Size, lpWorkspace^, nil, nil);
  Result := lpOutput;
  VirtualFree(lpWorkspace, 0, MEM_RELEASE);
end;

{
  Result: Pointer of the Decompressed Buffer.
  lpBuffer: Buffer that should be decompressed.
  var Size: Length of how much should be decompressed (FileSize), later the decompressed size.
  Safe: Should be True
}
function DecompressMemory(lpBuffer: Pointer; var Size: Cardinal): Pointer;
var
  lpOutput: Pointer;
  dwOrginalSize: Cardinal;
begin
  Result := nil;
  if lpBuffer = nil then
    Exit;
  if Size = INVALID_HANDLE_VALUE then
    Size := GetPointerSize(lpBuffer);
  dwOrginalSize := _aPsafe_get_orig_size(lpBuffer^);
  if (dwOrginalSize <> INVALID_HANDLE_VALUE) or (dwOrginalSize <> 0) then
  begin
    lpOutput := VirtualAlloc(nil, dwOrginalSize, MEM_COMMIT, PAGE_READWRITE);
    Size := _aPsafe_depack(lpBuffer^, Size, lpOutput^, dwOrginalSize) ;
    Result := lpOutput;
  end;
end;

function CompressFile(lpFilename, lpOutputfile: String): Boolean;
var
  hFileIn, hFileMappingObjectIn,
  hFileOut: THandle;
  dwFileSize, lpNumberOfBytesWritten: DWORD;
  lpBaseAddressIn, lpBuffer: Pointer;
begin
  Result := False;
  hFileIn := CreateFile(PChar(lpFilename), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_ALWAYS, 0, 0);
  if hFileIn = INVALID_HANDLE_VALUE then
    Exit;
  dwFileSize := Windows.GetFileSize(hFileIn, nil);
  hFileMappingObjectIn := CreateFileMapping(hFileIn, nil, PAGE_READWRITE, 0, 0, nil);
  lpBaseAddressIn := MapViewOfFile(hFileMappingObjectIn, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);
  lpBuffer := CompressMemory(lpBaseAddressIn, dwFileSize);
  hFileOut := CreateFile(PChar(lpOutputfile), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
  if hFileOut <> INVALID_HANDLE_VALUE then
  begin
    WriteFile(hFileOut, lpBuffer^, dwFileSize, lpNumberOfBytesWritten, nil);
    CloseHandle(hFileOut);
  end;
  UnmapViewOfFile(lpBaseAddressIn);
  CloseHandle(hFileMappingObjectIn);
  CloseHandle(hFileIn);
end;

function DecompressFile(lpFilename, lpOutputfile: String): Boolean;
var
  hFileIn, hFileMappingObjectIn,
  hFileOut: THandle;
  dwFileSize, lpNumberOfBytesWritten: DWORD;
  lpBaseAddressIn, lpBuffer: Pointer;
begin
  Result := False;
  hFileIn := CreateFile(PChar(lpFilename), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, OPEN_ALWAYS, 0, 0);
  if hFileIn = INVALID_HANDLE_VALUE then
    Exit;
  dwFileSize := Windows.GetFileSize(hFileIn, nil);
  hFileMappingObjectIn := CreateFileMapping(hFileIn, nil, PAGE_READWRITE, 0, 0, nil);
  lpBaseAddressIn := MapViewOfFile(hFileMappingObjectIn, FILE_MAP_READ or FILE_MAP_WRITE, 0, 0, 0);
  lpBuffer := DecompressMemory(lpBaseAddressIn, dwFileSize);

  hFileOut := CreateFile(PChar(lpOutputfile), GENERIC_READ or GENERIC_WRITE, FILE_SHARE_READ or FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
  if hFileOut <> INVALID_HANDLE_VALUE then
  begin
    WriteFile(hFileOut, lpBuffer^, dwFileSize, lpNumberOfBytesWritten, nil);
    CloseHandle(hFileOut);
  end;
  VirtualFree(lpBuffer, 0, MEM_RELEASE);
  UnmapViewOfFile(lpBaseAddressIn);
  CloseHandle(hFileMappingObjectIn);
  CloseHandle(hFileIn);
end;

end.










