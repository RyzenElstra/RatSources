{*****************************************************************************
*  ZLibEx.pas (zlib 1.2.3)                                                   *
*                                                                            *
*  copyright (c) 2002-2005 Roberto Della Pasqua (www.dellapasqua.com)        *
*  copyright (c) 2000-2002 base2 technologies (www.base2ti.com)              *
*  copyright (c) 1997 Borland International (www.borland.com)                *
*                                                                            *
*  acknowledgements                                                          *
*    erik turner    Z*Stream routines                                        *
*    david bennion  finding the nastly little endless loop quirk with the    *
*                     TZDecompressionStream.Read method                      *
*    burak kalayci  informing me about the zlib 1.1.4 update                 *
*****************************************************************************}

unit ZLibEx;

interface

uses
  Windows, Classes;

const
  ZLIB_VERSION = '1.2.3';

type
  TZAlloc = function(opaque: Pointer; items, size: Integer): Pointer;
  TZFree = procedure(opaque, block: Pointer);
  TZCompressionLevel = (zcNone, zcFastest, zcDefault, zcMax);

  TZStreamRec = packed record
    next_in: pWideChar; // next input byte
    avail_in: Longint; // number of bytes available at next_in
    total_in: Longint; // total nb of input bytes read so far
    next_out: pWideChar; // next output byte should be put here
    avail_out: Longint; // remaining free space at next_out
    total_out: Longint; // total nb of bytes output so far
    msg: pWideChar; // last error message, NULL if no error
    state: Pointer; // not visible by applications
    zalloc: TZAlloc; // used to allocate the internal state
    zfree: TZFree; // used to free the internal state
    opaque: Pointer; // private data object passed to zalloc and zfree
    data_type: Integer; // best guess about the data type: ascii or binary
    adler: Longint; // adler32 value of the uncompressed data
    reserved: Longint; // reserved for future use
  end;

  TCustomZStream = class(TStream)
  private
    FStream: TStream;
    FStreamPos: Integer;
    FOnProgress: TNotifyEvent;
    FZStream: TZStreamRec;
    FBuffer: array[Word] of WideChar;
  protected
    constructor Create(stream: TStream);
    procedure DoProgress; dynamic;
    property OnProgress: TNotifyEvent read FOnProgress write FOnProgress;
  end;

  TZCompressionStream = class(TCustomZStream)
  private
    function GetCompressionRate: Single;
  public
    constructor Create(dest: TStream; compressionLevel: TZCompressionLevel = zcDefault);
    destructor Destroy; override;
    function Read(var buffer; count: Longint): Longint; override;
    function Write(const buffer; count: Longint): Longint; override;
    function Seek(offset: Longint; origin: Word): Longint; override;
    property CompressionRate: Single read GetCompressionRate;
    property OnProgress;
  end;

  TZDecompressionStream = class(TCustomZStream)
  public
    constructor Create(source: TStream);
    destructor Destroy; override;
    function Read(var buffer; count: Longint): Longint; override;
    function Write(const buffer; count: Longint): Longint; override;
    function Seek(offset: Longint; origin: Word): Longint; override;
    property OnProgress;
  end;

procedure ZCompressStream(inStream, outStream: TStream; level: TZCompressionLevel = zcDefault);
procedure ZDecompressStream(inStream, outStream: TStream);

function adler32(adler: LongInt; const buf: pWideChar; len: Integer): LongInt;
procedure MoveI32(const Source; var Dest; Count: Integer);
function deflateInit_(var strm: TZStreamRec; level: Integer; version: pWideChar; recsize: Integer): Integer;
function DeflateInit2_(var strm: TZStreamRec; level: integer; method: integer; windowBits: integer; memLevel: integer; strategy: integer; version: pWideChar; recsize: integer): integer;
function deflate(var strm: TZStreamRec; flush: Integer): Integer;
function deflateEnd(var strm: TZStreamRec): Integer;
function inflateInit_(var strm: TZStreamRec; version: pWideChar; recsize: Integer): Integer;
function inflateInit2_(var strm: TZStreamRec; windowBits: integer;  version: pWideChar; recsize: integer): integer;
function inflate(var strm: TZStreamRec; flush: Integer): Integer;
function inflateEnd(var strm: TZStreamRec): Integer;
function inflateReset(var strm: TZStreamRec): Integer; 

implementation

{$L adler32.obj}
{$L deflate.obj}
{$L infback.obj}
{$L inffast.obj}
{$L inflate.obj}
{$L inftrees.obj}
{$L trees.obj}
{$L compress.obj}
{$L crc32.obj}

const
  Z_NO_FLUSH = 0;
  Z_PARTIAL_FLUSH = 1;
  Z_SYNC_FLUSH = 2;
  Z_FULL_FLUSH = 3;
  Z_FINISH = 4;
  Z_OK = 0;
  Z_STREAM_END = 1;
  Z_NEED_DICT = 2;
  Z_ERRNO = (-1);
  Z_STREAM_ERROR = (-2);
  Z_DATA_ERROR = (-3);
  Z_MEM_ERROR = (-4);
  Z_BUF_ERROR = (-5);
  Z_VERSION_ERROR = (-6);
  Z_NO_COMPRESSION = 0;
  Z_BEST_SPEED = 1;
  Z_BEST_COMPRESSION = 9;
  Z_DEFAULT_COMPRESSION = (-1);
  Z_FILTERED = 1;
  Z_HUFFMAN_ONLY = 2;
  Z_DEFAULT_STRATEGY = 0;
  Z_BINARY = 0;
  Z_ASCII = 1;
  Z_UNKNOWN = 2;
  Z_DEFLATED = 8;

  _z_errmsg: array[0..9] of pWideChar = (
    'need dictionary', // Z_NEED_DICT      (2)
    'stream end', // Z_STREAM_END     (1)
    '', // Z_OK             (0)
    'file error', // Z_ERRNO          (-1)
    'stream error', // Z_STREAM_ERROR   (-2)
    'data error', // Z_DATA_ERROR     (-3)
    'insufficient memory', // Z_MEM_ERROR      (-4)
    'buffer error', // Z_BUF_ERROR      (-5)
    'incompatible version', // Z_VERSION_ERROR  (-6)
    ''
    );

  ZLevels: array[TZCompressionLevel] of Shortint = (
    Z_NO_COMPRESSION,
    Z_BEST_SPEED,
    Z_DEFAULT_COMPRESSION,
    Z_BEST_COMPRESSION
    );

  SZInvalid = 'Invalid ZStream operation!';

procedure MoveI32(const Source; var Dest; Count: Integer); register;
asm
        cmp   ECX,0
        Je    @JustQuit
        push  ESI
        push  EDI
        mov   ESI, EAX
        mov   EDI, EDX
    @Loop:
	Mov   AL, [ESI]
        Inc   ESI
        mov   [EDI], AL
        Inc   EDI
        Dec   ECX
        Jnz   @Loop
        pop   EDI
        pop   ESI
    @JustQuit:
end;

function deflateInit_(var strm: TZStreamRec; level: Integer; version: pWideChar;
  recsize: Integer): Integer; external;
function DeflateInit2_(var strm: TZStreamRec; level: integer; method: integer; windowBits: integer;
  memLevel: integer; strategy: integer; version: pWideChar; recsize: integer): integer; external;
function deflate(var strm: TZStreamRec; flush: Integer): Integer;external;
function deflateEnd(var strm: TZStreamRec): Integer; external;
function inflateInit_(var strm: TZStreamRec; version: pWideChar;
  recsize: Integer): Integer; external;
function inflateInit2_(var strm: TZStreamRec; windowBits: integer;
  version: pWideChar; recsize: integer): integer; external;
function inflate(var strm: TZStreamRec; flush: Integer): Integer; external;
function inflateEnd(var strm: TZStreamRec): Integer; external;
function inflateReset(var strm: TZStreamRec): Integer; external;
function adler32; external;

function zcalloc(opaque: Pointer; items, size: Integer): Pointer;
begin GetMem(result, items * size); end;

procedure zcfree(opaque, block: Pointer);
begin FreeMem(block); end;

procedure _memset(p: Pointer; b: Byte; count: Integer); cdecl;
begin FillChar(p^, count, b); end;

procedure _memcpy(dest, source: Pointer; count: Integer); cdecl;
begin Move(source^, dest^, count); end;

function _malloc(Size: Integer): Pointer; cdecl;
begin GetMem(Result, Size); end;

procedure _free(Block: Pointer); cdecl;
begin FreeMem(Block); end;

function DeflateInit(var stream: TZStreamRec; level: Integer): Integer;
begin result := DeflateInit_(stream, level, ZLIB_VERSION, SizeOf(TZStreamRec)); end;

function DeflateInit2(var stream: TZStreamRec; level, method, windowBits,
  memLevel, strategy: Integer): Integer;
begin result := DeflateInit2_(stream, level, method, windowBits, memLevel, strategy, ZLIB_VERSION, SizeOf(TZStreamRec)); end;

function InflateInit(var stream: TZStreamRec): Integer;
begin result := InflateInit_(stream, ZLIB_VERSION, SizeOf(TZStreamRec)); end;

function InflateInit2(var stream: TZStreamRec; windowBits: Integer): Integer;
begin result := InflateInit2_(stream, windowBits, ZLIB_VERSION, SizeOf(TZStreamRec)); end;

function ZCompressCheck(code: Integer): Integer;
begin
  result := code;
  if code < 0 then begin end;
end;

function ZDecompressCheck(code: Integer): Integer;
begin
  Result := code;
  if code < 0 then begin end;
end;

procedure ZCompressStream(inStream, outStream: TStream; level: TZCompressionLevel);
const bufferSize = 32768;
var
  zstream: TZStreamRec;
  zresult: Integer;
  inBuffer: array[0..bufferSize - 1] of WideChar;
  outBuffer: array[0..bufferSize - 1] of WideChar;
  inSize: Integer;
  outSize: Integer;
begin
  FillChar(zstream, SizeOf(TZStreamRec), 0);
  ZCompressCheck(DeflateInit(zstream, ZLevels[level]));
  inSize := inStream.Read(inBuffer, bufferSize);
  while inSize > 0 do
  begin
    zstream.next_in := inBuffer;
    zstream.avail_in := inSize;
    repeat
      zstream.next_out := outBuffer;
      zstream.avail_out := bufferSize;
      ZCompressCheck(deflate(zstream, Z_NO_FLUSH));
      outSize := bufferSize - zstream.avail_out;
      outStream.Write(outBuffer, outSize);
    until (zstream.avail_in = 0) and (zstream.avail_out > 0);
    inSize := inStream.Read(inBuffer, bufferSize);
  end;

  repeat
    zstream.next_out := outBuffer;
    zstream.avail_out := bufferSize;
    zresult := ZCompressCheck(deflate(zstream, Z_FINISH));
    outSize := bufferSize - zstream.avail_out;
    outStream.Write(outBuffer, outSize);
  until (zresult = Z_STREAM_END) and (zstream.avail_out > 0);
  ZCompressCheck(deflateEnd(zstream));
end;

procedure ZDecompressStream(inStream, outStream: TStream);
const bufferSize = 32768;
var
  zstream: TZStreamRec;
  zresult: Integer;
  inBuffer: array[0..bufferSize - 1] of WideChar;
  outBuffer: array[0..bufferSize - 1] of WideChar;
  inSize: Integer;
  outSize: Integer;
begin
  FillChar(zstream, SizeOf(TZStreamRec), 0);
  ZCompressCheck(InflateInit(zstream));
  inSize := inStream.Read(inBuffer, bufferSize);
  while inSize > 0 do
  begin
    zstream.next_in := inBuffer;
    zstream.avail_in := inSize;
    repeat
      zstream.next_out := outBuffer;
      zstream.avail_out := bufferSize;
      ZCompressCheck(inflate(zstream, Z_NO_FLUSH));
      outSize := bufferSize - zstream.avail_out;
      outStream.Write(outBuffer, outSize);
    until (zstream.avail_in = 0) and (zstream.avail_out > 0);
    inSize := inStream.Read(inBuffer, bufferSize);
  end;

  repeat
    zstream.next_out := outBuffer;
    zstream.avail_out := bufferSize;
    zresult := ZCompressCheck(inflate(zstream, Z_FINISH));
    outSize := bufferSize - zstream.avail_out;
    outStream.Write(outBuffer, outSize);
  until (zresult = Z_STREAM_END) and (zstream.avail_out > 0);
  ZCompressCheck(inflateEnd(zstream));
end;

constructor TCustomZStream.Create(stream: TStream);
begin
  inherited Create;
  FStream := stream;
  FStreamPos := stream.Position;
end;

procedure TCustomZStream.DoProgress;
begin if Assigned(FOnProgress) then FOnProgress(Self); end;

constructor TZCompressionStream.Create(dest: TStream; compressionLevel: TZCompressionLevel);
begin
  inherited Create(dest);
  FZStream.next_out := FBuffer;
  FZStream.avail_out := SizeOf(FBuffer);
  ZCompressCheck(DeflateInit(FZStream, ZLevels[compressionLevel]));
end;

destructor TZCompressionStream.Destroy;
begin
  FZStream.next_in := nil;
  FZStream.avail_in := 0;
  try
    if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
    while ZCompressCheck(deflate(FZStream, Z_FINISH)) <> Z_STREAM_END do
    begin
      FStream.WriteBuffer(FBuffer, SizeOf(FBuffer) - FZStream.avail_out);
      FZStream.next_out := FBuffer;
      FZStream.avail_out := SizeOf(FBuffer);
    end;
    if FZStream.avail_out < SizeOf(FBuffer) then FStream.WriteBuffer(FBuffer, SizeOf(FBuffer) - FZStream.avail_out);
  finally
    deflateEnd(FZStream);
  end;
  inherited Destroy;
end;

function TZCompressionStream.Read(var buffer; count: Longint): Longint;
begin
  //raise EZCompressionError.Create(SZInvalid);
end;

function TZCompressionStream.Write(const buffer; count: Longint): Longint;
begin
  FZStream.next_in := @buffer;
  FZStream.avail_in := count;
  if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
  while FZStream.avail_in > 0 do
  begin
    ZCompressCheck(deflate(FZStream, Z_NO_FLUSH));
    if FZStream.avail_out = 0 then
    begin
      FStream.WriteBuffer(FBuffer, SizeOf(FBuffer));
      FZStream.next_out := FBuffer;
      FZStream.avail_out := SizeOf(FBuffer);
      FStreamPos := FStream.Position;
      DoProgress;
    end;
  end;
  result := Count;
end;

function TZCompressionStream.Seek(offset: Longint; origin: Word): Longint;
begin
  if (offset = 0) and (origin = soFromCurrent) then result := FZStream.total_in;
end;

function TZCompressionStream.GetCompressionRate: Single;
begin
  if FZStream.total_in = 0 then result := 0
  else result := (1.0 - (FZStream.total_out / FZStream.total_in)) * 100.0;
end;

constructor TZDecompressionStream.Create(source: TStream);
begin
  inherited Create(source);
  FZStream.next_in := FBuffer;
  FZStream.avail_in := 0;
  ZDecompressCheck(InflateInit(FZStream));
end;

destructor TZDecompressionStream.Destroy;
begin
  inflateEnd(FZStream);
  inherited Destroy;
end;

function TZDecompressionStream.Read(var buffer; count: Longint): Longint; var zresult: Integer;
begin
  FZStream.next_out := @buffer;
  FZStream.avail_out := count;
  if FStream.Position <> FStreamPos then FStream.Position := FStreamPos;
  zresult := Z_OK;
  while (FZStream.avail_out > 0) and (zresult <> Z_STREAM_END) do
  begin
    if FZStream.avail_in = 0 then
    begin
      FZStream.avail_in := FStream.Read(FBuffer, SizeOf(FBuffer));
      if FZStream.avail_in = 0 then
      begin
        result := count - FZStream.avail_out;
        Exit;
      end;
      FZStream.next_in := FBuffer;
      FStreamPos := FStream.Position;
      DoProgress;
    end;
    zresult := ZDecompressCheck(inflate(FZStream, Z_NO_FLUSH));
  end;

  if (zresult = Z_STREAM_END) and (FZStream.avail_in > 0) then
  begin
    FStream.Position := FStream.Position - FZStream.avail_in;
    FStreamPos := FStream.Position;
    FZStream.avail_in := 0;
  end;
  result := count - FZStream.avail_out;
end;

function TZDecompressionStream.Write(const Buffer; Count: Longint): Longint;
begin
  //raise EZDecompressionError.Create(SZInvalid);
end;

function TZDecompressionStream.Seek(Offset: Longint; Origin: Word): Longint;
var
  buf: array[0..8191] of WideChar;
  i: Integer;
begin
  if (offset = 0) and (origin = soFromBeginning) then
  begin
    ZDecompressCheck(inflateReset(FZStream));
    FZStream.next_in := FBuffer;
    FZStream.avail_in := 0;
    FStream.Position := 0;
    FStreamPos := 0;
  end
  else
  if ((offset >= 0) and (origin = soFromCurrent)) or
    (((offset - FZStream.total_out) > 0) and (origin = soFromBeginning))
  then
  begin
    if origin = soFromBeginning then Dec(offset, FZStream.total_out);
    if offset > 0 then
    begin
      for i := 1 to offset div SizeOf(buf) do ReadBuffer(buf, SizeOf(buf));
      ReadBuffer(buf, offset mod SizeOf(buf));
    end;
  end
  else if (offset = 0) and (origin = soFromEnd) then while Read(buf, SizeOf(buf)) > 0 do ;
  result := FZStream.total_out;
end;

end.


