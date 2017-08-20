unit UnitEncryption;

interface

uses
  Windows, Classes, ZLibEx, UnitConstants;

function EncryptDatas(Datas, Password: string): string;
function DecryptDatas(Datas, Password: string): string;
function EnDecryptText(Str, Password:string): string;

implementation
       
type
  TByteArray = array of Byte;

procedure Move(Destination, Source: Pointer; dLength:Cardinal);
begin
  CopyMemory(Destination, Source, dLength);
end;
                                       
//RC4 encryption method, moded by Slayer616 from SS RAT 2.0 source code
function EnDecryptText(Str, Password: string): string;
var
  RB: array[0..255] of Integer;
  X, Y, Z: LongInt;
  Key: TByteArray;
  ByteArray: TByteArray;
  Temp: Byte;
begin
  Result := Str;
  if Length(Password) = 0 then Exit;
  if Length(Str) = 0 then Exit;

  if Length(Password) > 256 then
  begin
    SetLength(Key, 256);
    Move(@Key[0], @Password[1], 256)
  end
  else
  begin
    SetLength(Key, Length(Password));
    Move(@Key[0], @Password[1], Length(Password));
  end;

  for X := 0 to 255 do RB[X] := X;
  X := 0;
  Y := 0;
  Z := 0;

  for X := 0 to 255 do
  begin
    Y := (Y + RB[X] + Key[X mod Length(Password)]) mod 256;
    Temp := RB[X];
    RB[X] := RB[Y];
    RB[Y] := Temp;
  end;

  X := 0;
  Y := 0;
  Z := 0;
  SetLength(ByteArray, Length(Str));
  Move(@ByteArray[0], @Str[1], Length(Str));

  for X := 0 to Length(Str) - 1 do
  begin
    Y := (Y + 1) mod 256;
    Z := (Z + RB[Y]) mod 256;
    Temp := RB[Y];
    RB[Y] := RB[Z];
    RB[Z] := Temp;
    ByteArray[X] := ByteArray[X] xor (RB[(RB[Y] + RB[Z]) mod 256]);
  end;

  SetLength(Result, Length(Str));
  Move(@Result[1], @ByteArray[0], Length(Str));
end;

//Unknown author, modified by wrh1d3
//-----
function CompressString(Str: string): string;
var
  zCompression: TZCompressionStream;
  inStream, outStream: TMemoryStream;
begin
  Result := '';
  inStream := TMemoryStream.Create;
  outStream := TMemoryStream.Create;

  inStream.Write(Pointer(Str)^, Length(Str));
  inStream.Position := 0;

  zCompression := TZCompressionStream.Create(outStream, zcFastest);
  zCompression.CopyFrom(inStream, inStream.Size);
  zCompression.Free;

  outStream.Position := 0;
  SetLength(Result, outStream.Size);
  outStream.Read(Pointer(Result)^, Length(Result));
  inStream.Free;
  outStream.Free;
end;

function DecompressString(Str: string): string;
var
  zDecompression: TZDecompressionStream;
  inStream, outStream: TMemoryStream;
  Buffer: array[0..32767] of Byte;
  Count: Integer;
begin
  Result := '';
  inStream := TMemoryStream.Create;
  outStream := TMemoryStream.Create;

  inStream.Write(Pointer(Str)^, Length(Str));
  inStream.Position := 0;

  zDecompression := TZDecompressionStream.Create(inStream);
  while True do
  begin
    Count := zDecompression.Read(Buffer, SizeOf(Buffer));
    if Count <> 0 then outStream.Write(Buffer, Count) else Break;
  end;

  zDecompression.Free;
  outStream.Position := 0;
  SetLength(Result, outStream.Size);
  outStream.Read(Pointer(Result)^, Length(Result));
  inStream.Free;
  outStream.Free;
end;
//-----

function EncryptDatas(Datas, Password: string): string;
begin
  Result := CompressString(Datas);
  if Password <> '' then Result := EnDecryptText(Result, Password);
end;

function DecryptDatas(Datas, Password: string): string;
begin                               
  if Password <> '' then Result := EnDecryptText(Datas, Password);
  Result := DecompressString(Result);
end;

end.
