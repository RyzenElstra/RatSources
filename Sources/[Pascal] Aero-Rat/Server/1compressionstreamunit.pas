{
  ZLIB Compression Streams for Delphi by Aphex
  http://www.iamaphex.cjb.net
  unremote@knology.net

  Originally based on delphi fast zlib
  http://www.dellapasqua.com/delphizlib
}

unit CompressionStreamUnit;

interface

{$WARNINGS OFF}

uses
  Windows;

const
  ZLIB_VERSION = '1.1.4';
  WM_USER = $0400;
  MaxListSize = Maxint div 16;
  soFromBeginning = 0;
  soFromCurrent = 1;
  soFromEnd = 2;

type
  TNotifyEvent = procedure(Sender: TObject) of object;

  TSeekOrigin = (soBeginning, soCurrent, soEnd);

  TStream = class(TObject)
  private
    function GetPosition: Int64;
    procedure SetPosition(const Pos: Int64);
    function GetSize: Int64;
    procedure SetSize64(const NewSize: Int64);
  protected
    procedure SetSize(NewSize: Longint); overload; virtual;
    procedure SetSize(const NewSize: Int64); overload; virtual;
  public
    function Read(var Buffer; Count: Longint): Longint; virtual; abstract;
    function Write(const Buffer; Count: Longint): Longint; virtual; abstract;
    function Seek(Offset: Longint; Origin: Word): Longint; overload; virtual;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; overload; virtual;
    procedure ReadBuffer(var Buffer; Count: Longint);
    procedure WriteBuffer(const Buffer; Count: Longint);
    function CopyFrom(Source: TStream; Count: Int64): Int64;
    property Position: Int64 read GetPosition write SetPosition;
    property Size: Int64 read GetSize write SetSize64;
  end;

  TCustomMemoryStream = class(TStream)
  private
    FMemory: Pointer;
    FData: Pointer;
    FSize, FPosition: Longint;
  protected
    procedure SetPointer(Ptr: Pointer; Size: Longint);
  public
    function Read(var Buffer; Count: Longint): Longint; override;
    function Seek(Offset: Longint; Origin: Word): Longint; override;
    procedure SaveToStream(Stream: TStream);
    procedure SaveToFile(const FileName: string);
    property Memory: Pointer read FMemory;
    property Data: Pointer read FData write FData;
  end;

  TMemoryStream = class(TCustomMemoryStream)
  private
    FCapacity: Longint;
    procedure SetCapacity(NewCapacity: Longint);
  protected
    function Realloc(var NewCapacity: Longint): Pointer; virtual;
    property Capacity: Longint read FCapacity write SetCapacity;
  public
    destructor Destroy; override;
    procedure Clear;
    procedure LoadFromStream(Stream: TStream);
    procedure LoadFromFile(const FileName: string);
    procedure SetSize(NewSize: Longint); override;
    function Write(const Buffer; Count: Longint): Longint; override;
  end;

  THandleStream = class(TStream)
  protected
    FHandle: Integer;
    procedure SetSize(NewSize: Longint); override;
    procedure SetSize(const NewSize: Int64); override;
  public
    constructor Create(AHandle: Integer);
    function Read(var Buffer; Count: Longint): Longint; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64; override;
    property Handle: Integer read FHandle;
  end;

  TFileStream = class(THandleStream)
  public
    constructor Create(const FileName: string; Mode: Word); overload;
    constructor Create(const FileName: string; Mode: Word; Rights: Cardinal); overload;
    destructor Destroy; override;
  end;
  TAlloc = function(Opaque: Pointer; Items, Size: Integer): Pointer;
  TFree = procedure(Opaque, Block: Pointer);

  TCompressionLevel = (zcNone, zcFastest, zcDefault, zcMax);

  TCompressionStreamRecord = packed record
    NextIn: PChar;
    AvailableIn: dword;
    TotalIn: dword;
    NextOut: PChar;
    AvailableOut: dword;
    TotalOut: dword;
    Msg: PChar;
    State: Pointer;
    AllocProc: TAlloc;
    FreeProc: TFree;
    Opaque: Pointer;
    DataType: dword;
    Adler: dword;
    Reserved: dword;
  end;

  TCustomCompressionStream = class(TStream)
  private
    FStream: TStream;
    FStreamPos: Integer;
    FOnProgress: TNotifyEvent;
    FStreamRecord: TCompressionStreamRecord;
    FBuffer: array [Word] of Char;
  protected
    constructor Create(stream: TStream);
    procedure DoProgress; dynamic;
    property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
  end;

  TCompressionStream = class(TCustomCompressionStream)
  private
    function GetCompressionRate: Single;
  public
    constructor Create(dest: TStream; CompressionLevel: TCompressionLevel = zcDefault);
    destructor Destroy; override;
    function Read(var Buffer; Count: longint): longint; override;
    function Write(const Buffer; Count: longint): longint; override;
    function Seek(Offset: longint; Origin: Word): longint; override;
    property CompressionRate: Single read GetCompressionRate;
    property OnProgress;
  end;

  TDecompressionStream = class(TCustomCompressionStream)
  public
    constructor Create(source: TStream);
    destructor Destroy; override;
    function Read(var Buffer; Count: longint): longint; override;
    function Write(const Buffer; Count: longint): longint; override;
    function Seek(Offset: longint; Origin: Word): longint; override;
    property OnProgress;
  end;

function adler32(adler: LongInt; const buf: PChar; len: Integer): LongInt;
function crc32(crc: LongInt; const buf: PChar; len: Integer): LongInt;
function compressBound(sourceLen: LongInt): LongInt;

implementation

{$L adler32.obj}
{$L compress.obj}
{$L crc32.obj}
{$L deflate.obj}
{$L infback.obj}
{$L inffast.obj}
{$L inflate.obj}
{$L inftrees.obj}
{$L trees.obj}
{$L uncompr.obj}

const
  Levels: array[TCompressionLevel] of Shortint = (0, 1, (-1), 9);
  _z_errmsg: array[0..9] of PChar = ('', '', '', '', '', '', '', '', '', '');
  fmCreate = $FFFF;
  fmOpenRead = $0000;
  fmOpenWrite = $0001;
  fmOpenReadWrite = $0002;
  fmShareCompat = $0000;
  fmShareExclusive = $0010;
  fmShareDenyWrite = $0020;
  fmShareDenyRead = $0030;
  fmShareDenyNone = $0040;


function deflateInit_(var strm: TCompressionStreamRecord; level: Integer; version: PChar; recsize: Integer): Integer; external;
function DeflateInit2_(var strm: TCompressionStreamRecord; level: integer; method: integer; windowBits: integer; memLevel: integer; strategy: integer; version: PChar; recsize: integer): integer; external;
function deflate(var strm: TCompressionStreamRecord; flush: Integer): Integer; external;
function deflateEnd(var strm: TCompressionStreamRecord): Integer; external;
function inflateInit_(var strm: TCompressionStreamRecord; version: PChar; recsize: Integer): Integer; external;
function inflateInit2_(var strm: TCompressionStreamRecord; windowBits: integer; version: PChar; recsize: integer): integer; external;
function inflate(var strm: TCompressionStreamRecord; flush: Integer): Integer; external;
function inflateEnd(var strm: TCompressionStreamRecord): Integer; external;
function inflateReset(var strm: TCompressionStreamRecord): Integer; external;
function adler32; external;
function crc32; external;
function compressBound; external;

function FileOpen(const FileName: string; Mode: LongWord): Integer;
const
  AccessMode: array[0..2] of LongWord = (
    GENERIC_READ,
    GENERIC_WRITE,
    GENERIC_READ or GENERIC_WRITE);
  ShareMode: array[0..4] of LongWord = (
    0,
    0,
    FILE_SHARE_READ,
    FILE_SHARE_WRITE,
    FILE_SHARE_READ or FILE_SHARE_WRITE);
begin
  Result := -1;
  if ((Mode and 3) <= $0002) and
    (((Mode and $F0) shr 4) <= $0040) then
    Result := Integer(CreateFile(PChar(FileName), AccessMode[Mode and 3],
      ShareMode[(Mode and $F0) shr 4], nil, OPEN_EXISTING,
      FILE_ATTRIBUTE_NORMAL, 0));
end;

procedure FileClose(Handle: Integer);
begin
  CloseHandle(THandle(Handle));
end;

function FileCreate(const FileName: string): Integer;
begin
  Result := Integer(CreateFile(PChar(FileName), GENERIC_READ or GENERIC_WRITE,
    0, nil, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0));
end;

function FileRead(Handle: Integer; var Buffer; Count: LongWord): Integer;
begin
  if not ReadFile(THandle(Handle), Buffer, Count, LongWord(Result), nil) then
    Result := -1;
end;

function FileWrite(Handle: Integer; const Buffer; Count: LongWord): Integer;
begin
  if not WriteFile(THandle(Handle), Buffer, Count, LongWord(Result), nil) then
    Result := -1;
end;

function FileSeek(Handle, Offset, Origin: Integer): Integer;
begin
  Result := SetFilePointer(THandle(Handle), Offset, nil, Origin);
end;

function zcalloc(opaque: Pointer; items, size: Integer): Pointer;
begin
  GetMem(Result, items * size);
end;

procedure zcfree(opaque, block: Pointer);
begin
  FreeMem(block);
end;

procedure _memset(p: Pointer; b: Byte; Count: Integer); cdecl;
begin
  FillChar(p^, Count, b);
end;

procedure _memcpy(dest, source: Pointer; Count: Integer); cdecl;
begin
  move(source^, dest^, Count);
end;

function DeflateInit(var stream: TCompressionStreamRecord; level: Integer): Integer;
begin
  Result := DeflateInit_(stream, level, ZLIB_VERSION, SizeOf(TCompressionStreamRecord));
end;

function DeflateInit2(var stream: TCompressionStreamRecord; level, method, windowBits,
  memLevel, strategy: Integer): Integer;
begin
  Result := DeflateInit2_(stream, level, method, windowBits, memLevel, strategy, ZLIB_VERSION, SizeOf(TCompressionStreamRecord));
end;

function InflateInit(var stream: TCompressionStreamRecord): Integer;
begin
  Result := InflateInit_(stream, ZLIB_VERSION, SizeOf(TCompressionStreamRecord));
end;

function InflateInit2(var stream: TCompressionStreamRecord; windowBits: Integer): Integer;
begin
  Result := InflateInit2_(stream, windowBits, ZLIB_VERSION, SizeOf(TCompressionStreamRecord));
end;

function TStream.GetPosition: Int64;
begin
  Result := Seek(0, soCurrent);
end;

procedure TStream.SetPosition(const Pos: Int64);
begin
  Seek(Pos, soBeginning);
end;

function TStream.GetSize: Int64;
var
  Pos: Int64;
begin
  Pos := Seek(0, soCurrent);
  Result := Seek(0, soEnd);
  Seek(Pos, soBeginning);
end;

procedure TStream.SetSize(NewSize: Longint);
begin
  SetSize(NewSize);
end;

procedure TStream.SetSize64(const NewSize: Int64);
begin
  SetSize(NewSize);
end;

procedure TStream.SetSize(const NewSize: Int64);
begin
  if (NewSize < Low(Longint)) or (NewSize > High(Longint)) then
    Exit;
  SetSize(Longint(NewSize));
end;

function TStream.Seek(Offset: Longint; Origin: Word): Longint;
type
  TSeek64 = function (const Offset: Int64; Origin: TSeekOrigin): Int64 of object;
var
  Impl: TSeek64;
  Base: TSeek64;
  ClassTStream: TClass;
begin
  Impl := Seek;
  ClassTStream := Self.ClassType;
  while (ClassTStream <> nil) and (ClassTStream <> TStream) do
    ClassTStream := ClassTStream.ClassParent;
  Base := TStream(@ClassTStream).Seek;
  Result := Seek(Int64(Offset), TSeekOrigin(Origin));
end;

function TStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := 0;
  if (Offset < Low(Longint)) or (Offset > High(Longint)) then
    Exit;
  Result := Seek(Longint(Offset), Ord(Origin));
end;

procedure TStream.ReadBuffer(var Buffer; Count: Longint);
begin
  if (Count <> 0) and (Read(Buffer, Count) <> Count) then
    Exit;
end;

procedure TStream.WriteBuffer(const Buffer; Count: Longint);
begin
  if (Count <> 0) and (Write(Buffer, Count) <> Count) then
    Exit;
end;

function TStream.CopyFrom(Source: TStream; Count: Int64): Int64;
const
  MaxBufSize = $F000;
var
  BufSize, N: Integer;
  Buffer: PChar;
begin
  if Count = 0 then
  begin
    Source.Position := 0;
    Count := Source.Size;
  end;
  Result := Count;
  if Count > MaxBufSize then BufSize := MaxBufSize else BufSize := Count;
  GetMem(Buffer, BufSize);
  try
    while Count <> 0 do
    begin
      if Count > BufSize then N := BufSize else N := Count;
      Source.ReadBuffer(Buffer^, N);
      WriteBuffer(Buffer^, N);
      Dec(Count, N);
    end;
  finally
    FreeMem(Buffer, BufSize);
  end;
end;

constructor THandleStream.Create(AHandle: Integer);
begin
  inherited Create;
  FHandle := AHandle;
end;

function THandleStream.Read(var Buffer; Count: Longint): Longint;
begin
  Result := FileRead(FHandle, Buffer, Count);
  if Result = -1 then Result := 0;
end;

function THandleStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := FileWrite(FHandle, Buffer, Count);
  if Result = -1 then Result := 0;
end;

function THandleStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
  Result := FileSeek(FHandle, Offset, Ord(Origin));
end;

procedure THandleStream.SetSize(NewSize: Longint);
begin
  SetSize(Int64(NewSize));
end;

procedure THandleStream.SetSize(const NewSize: Int64);
begin
  Seek(NewSize, soBeginning);
end;

constructor TFileStream.Create(const FileName: string; Mode: Word);
begin
  Create(Filename, Mode, 0);
end;

constructor TFileStream.Create(const FileName: string; Mode: Word; Rights: Cardinal);
begin
  if Mode = $FFFF then
  begin
    inherited Create(FileCreate(FileName));
  end
  else
  begin
    inherited Create(FileOpen(FileName, Mode));
  end;
end;

destructor TFileStream.Destroy;
begin
  if FHandle >= 0 then FileClose(FHandle);
  inherited Destroy;
end;

constructor TCustomCompressionStream.Create(Stream: TStream);
begin
  inherited Create;
  FStream := Stream;
  FStreamPos := Stream.Position;
end;

procedure TCustomCompressionStream.DoProgress;
begin
  if Assigned(FOnProgress) then FOnProgress(Self);
end;

constructor TCompressionStream.Create(Dest: TStream; CompressionLevel: TCompressionLevel);
begin
  inherited Create(dest);
  FStreamRecord.NextOut := FBuffer;
  FStreamRecord.AvailableOut := SizeOf(FBuffer);
  DeflateInit(FStreamRecord, Levels[CompressionLevel]);
end;

destructor TCompressionStream.Destroy;
begin
  FStreamRecord.NextIn := nil;
  FStreamRecord.AvailableIn := 0;
  try
    if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
    while deflate(FStreamRecord, 4) <> 1 do
    begin
      FStream.WriteBuffer(FBuffer, SizeOf(FBuffer) - FStreamRecord.AvailableOut);
      FStreamRecord.NextOut := FBuffer;
      FStreamRecord.AvailableOut := SizeOf(FBuffer);
    end;
    if FStreamRecord.AvailableOut < SizeOf(FBuffer) then
    begin
      FStream.WriteBuffer(FBuffer, SizeOf(FBuffer) - FStreamRecord.AvailableOut);
    end;
  finally
    deflateEnd(FStreamRecord);
  end;
  inherited Destroy;
end;

function TCompressionStream.Read(var Buffer; Count: longint): longint;
begin
end;

function TCompressionStream.Write(const Buffer; Count: longint): longint;
begin
  FStreamRecord.NextIn := @Buffer;
  FStreamRecord.AvailableIn := Count;
  if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
  while FStreamRecord.AvailableIn > 0 do
  begin
    deflate(FStreamRecord, 0);
    if FStreamRecord.AvailableOut = 0 then
    begin
      FStream.WriteBuffer(FBuffer, SizeOf(FBuffer));
      FStreamRecord.NextOut := FBuffer;
      FStreamRecord.AvailableOut := SizeOf(FBuffer);
      FStreamPos := FStream.Position;
      DoProgress;
    end;
  end;
  Result := Count;
end;

function TCompressionStream.Seek(offset: Longint; origin: Word): Longint;
begin
  if (offset = 0) and (origin = soFromCurrent) then
  begin
    Result := FStreamRecord.TotalIn;
  end;
end;

function TCompressionStream.GetCompressionRate: Single;
begin
  if FStreamRecord.TotalIn = 0 then Result := 0
  else Result := (1.0 - (FStreamRecord.TotalOut / FStreamRecord.TotalIn)) * 100.0;
end;

constructor TDecompressionStream.Create(source: TStream);
begin
  inherited Create(source);
  FStreamRecord.NextIn := FBuffer;
  FStreamRecord.AvailableIn := 0;
  InflateInit(FStreamRecord);
end;

destructor TDecompressionStream.Destroy;
begin
  inflateEnd(FStreamRecord);
  inherited Destroy;
end;

function TDecompressionStream.Read(var Buffer; Count: longint): longint;
var
  ReturnValue: longint;
begin
  FStreamRecord.NextOut := @Buffer;
  FStreamRecord.AvailableOut := Count;
  if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
  ReturnValue := 0;
  while ((FStreamRecord.AvailableOut > 0) and (ReturnValue <> 1)) do
  begin
    if FStreamRecord.AvailableIn = 0 then
    begin
      FStreamRecord.AvailableIn := FStream.Read(FBuffer, SizeOf(FBuffer));
      if FStreamRecord.AvailableIn = 0 then
      begin
        Result := Count - FStreamRecord.AvailableOut;
        Exit;
      end;
      FStreamRecord.NextIn := FBuffer;
      FStreamPos := FStream.Position;
      DoProgress;
    end;
    ReturnValue := inflate(FStreamRecord, 0);
  end;
  if ((ReturnValue = 1) and (FStreamRecord.AvailableIn > 0)) then
  begin
    FStream.Position := FStream.Position - FStreamRecord.AvailableIn;
    FStreamPos := FStream.Position;
    FStreamRecord.AvailableIn := 0;
  end;
  Result := Count - FStreamRecord.AvailableOut;
end;

function TDecompressionStream.Write(const Buffer; Count: longint): longint;
begin
end;

function TDecompressionStream.Seek(Offset: longint; Origin: Word): longint;
var
  Buffer: array [0..8191] of Char;
  Count: Integer;
begin
  if ((Offset = 0) and (Origin = soFromBeginning)) then
  begin
    inflateReset(FStreamRecord);
    FStreamRecord.NextIn := FBuffer;
    FStreamRecord.AvailableIn := 0;
    FStream.Position := 0;
    FStreamPos := 0;
  end
  else if ((Offset >= 0) and (Origin = soFromCurrent)) or (((Offset - FStreamRecord.TotalOut) > 0) and (Origin = soFromBeginning)) then
  begin
    if Origin = soFromBeginning then Dec(Offset, FStreamRecord.TotalOut);
    if Offset > 0 then
    begin
      for Count := 1 to Offset div SizeOf(Buffer) do ReadBuffer(Buffer, SizeOf(Buffer));
      ReadBuffer(Buffer, Offset mod SizeOf(Buffer));
    end;
  end
  else if (Offset = 0) and (Origin = soFromEnd) then
  begin
    while Read(Buffer, SizeOf(Buffer)) > 0 do;
  end;
  Result := FStreamRecord.TotalOut;
end;

procedure TCustomMemoryStream.SetPointer(Ptr: Pointer; Size: Longint);
begin
  FMemory := Ptr;
  FSize := Size;
end;

function TCustomMemoryStream.Read(var Buffer; Count: Longint): Longint;
begin
  if (FPosition >= 0) and (Count >= 0) then
  begin
    Result := FSize - FPosition;
    if Result > 0 then
    begin
      if Result > Count then Result := Count;
      Move(Pointer(Longint(FMemory) + FPosition)^, Buffer, Result);
      Inc(FPosition, Result);
      Exit;
    end;
  end;
  Result := 0;
end;

function TCustomMemoryStream.Seek(Offset: Longint; Origin: Word): Longint;
begin
  case Origin of
    soFromBeginning: FPosition := Offset;
    soFromCurrent: Inc(FPosition, Offset);
    soFromEnd: FPosition := FSize + Offset;
  end;
  Result := FPosition;
end;

procedure TCustomMemoryStream.SaveToStream(Stream: TStream);
begin
  if FSize <> 0 then Stream.WriteBuffer(FMemory^, FSize);
end;

procedure TCustomMemoryStream.SaveToFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
    SaveToStream(Stream);
  finally
    Stream.Free;
  end;
end;

const
  MemoryDelta = $2000;

destructor TMemoryStream.Destroy;
begin
  Clear;
  inherited Destroy;
end;

procedure TMemoryStream.Clear;
begin
  SetCapacity(0);
  FSize := 0;
  FPosition := 0;
end;

procedure TMemoryStream.LoadFromStream(Stream: TStream);
var
  Count: Longint;
begin
  Stream.Position := 0;
  Count := Stream.Size;
  SetSize(Count);
  if Count <> 0 then Stream.ReadBuffer(FMemory^, Count);
end;

procedure TMemoryStream.LoadFromFile(const FileName: string);
var
  Stream: TStream;
begin
  Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    LoadFromStream(Stream);
  finally
    Stream.Free;
  end;
end;

procedure TMemoryStream.SetCapacity(NewCapacity: Longint);
begin
  SetPointer(Realloc(NewCapacity), FSize);
  FCapacity := NewCapacity;
end;

procedure TMemoryStream.SetSize(NewSize: Longint);
var
  OldPosition: Longint;
begin
  OldPosition := FPosition;
  SetCapacity(NewSize);
  FSize := NewSize;
  if OldPosition > NewSize then Seek(0, soFromEnd);
end;

function TMemoryStream.Realloc(var NewCapacity: Longint): Pointer;
begin
  if (NewCapacity > 0) and (NewCapacity <> FSize) then
    NewCapacity := (NewCapacity + (MemoryDelta - 1)) and not (MemoryDelta - 1);
  Result := Memory;
  if NewCapacity <> FCapacity then
  begin
    if NewCapacity = 0 then
    begin
      GlobalFreePtr(Memory);
      Result := nil;
    end else
    begin
      if Capacity = 0 then
        Result := GlobalAllocPtr(HeapAllocFlags, NewCapacity)
      else
        Result := GlobalReallocPtr(Memory, NewCapacity, HeapAllocFlags);
    end;
  end;
end;

function TMemoryStream.Write(const Buffer; Count: Longint): Longint;
var
  Pos: Longint;
begin
  if (FPosition >= 0) and (Count >= 0) then
  begin
    Pos := FPosition + Count;
    if Pos > 0 then
    begin
      if Pos > FSize then
      begin
        if Pos > FCapacity then
          SetCapacity(Pos);
        FSize := Pos;
      end;
      System.Move(Buffer, Pointer(Longint(FMemory) + FPosition)^, Count);
      FPosition := Pos;
      Result := Count;
      Exit;
    end;
  end;
  Result := 0;
end;

end.


