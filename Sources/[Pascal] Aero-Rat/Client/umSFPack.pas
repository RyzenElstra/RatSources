{*************************************************************}
{            SFPack Unit for Delphi32                         }
{ Version:   3.1                                              }
{ Author:    Aleksey Kuznetsov                                }
{ E-Mail:    info@utilmind.com                                }
{ Homepages: http://www.utilmind.com                          }
{            http://www.appcontrols.com                       }
{ Created:   July, 1994                                       }
{ Modified:  October, 25, 2002                                }
{ Legal:     Copyright (c) 1994-2002, UtilMind Solutions      }
{*************************************************************}
{    Super Fast Pack (English):                               }
{ Unit for packing/unpacking of memory or files by using      }
{ modified RLE-alorithm. Amazing speed of tiny assembler code.}
{*************************************************************}
{   Super Fast Pack (Russian):                                }
{ Модуль для упаковки/распаковки памяти или файлов по         }
{ модифицированному алгоритму RLE. Потрясающая скорость       }
{ маленького ассемблерного кода.                              }
{*************************************************************}

unit umSFPack;

interface

uses Windows, Classes;

function SFPack(Source, Target: Pointer; SourceSize: DWord): DWord; external; // returns size of compressed data
function SFUnpack(Source, Target: Pointer; SourceSize: DWord): DWord; external; // returns size of decomressed data
function SFCalcTargetSz(SourceSize: DWord): DWord; external; // calculates size of target buffer for packing

function SFPackStr(const Str: String): String;
function SFUnpackStr(const Str: String): String;

function SFPackFile(const SourceFileName, TargetFileName: String): Boolean; // return True if successful
function SFUnpackFile(const SourceFileName, TargetFileName: String): Boolean; // return True if successful

procedure SFPackStream(SourceStream: TMemoryStream; TargetStream: TStream);
function SFUnpackStream(SourceStream: TStream): TMemoryStream; // NOTE: Caller should destroy return value after dealing with it  

implementation

{$L sfpack32.obj}

function SFPackStr(const Str: String): String;
var
  TargetBuf: PChar;
  SourceSize, TargetSize: DWord;
begin
  SourceSize := Length(Str);
  TargetSize := SFCalcTargetSz(SourceSize);
  GetMem(TargetBuf, TargetSize);
  try
    TargetSize := SFPack(@Str[1], TargetBuf, SourceSize);
    SetLength(Result, TargetSize);
    Move(TargetBuf^, Result[1], TargetSize);
  finally
    FreeMem(TargetBuf);
  end;
end;

function SFUnpackStr(const Str: String): String;
var
  TargetSize: Integer;
begin
  Move(Str[1], TargetSize, 4);
  SetLength(Result, TargetSize);
  SFUnPack(@Str[5], @Result[1], Length(Str) - 4);
end;

function SFPackFile(const SourceFileName, TargetFileName: String): Boolean; { Return FALSE if IOError }
var
  FileHandle: hFile;
  FileSize, ReqMemSize, TargetFileSize: DWord;
  Source, Target: Pointer;
begin
  Result := False;
  FileHandle := CreateFile(PChar(SourceFileName), GENERIC_READ, FILE_SHARE_READ, nil,
                           OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if FileHandle <> INVALID_HANDLE_VALUE then
   begin
    FileSize := GetFileSize(FileHandle, @ReqMemSize);
    ReqMemSize := SFCalcTargetSz(FileSize);

    GetMem(Source, FileSize);
    GetMem(Target, ReqMemSize);
    try
      // read source data
      ReadFile(FileHandle, Source^, FileSize, ReqMemSize, nil);
      CloseHandle(FileHandle);
      FileHandle := INVALID_HANDLE_VALUE;

      // compress
      TargetFileSize := SFPack(Source, Target, FileSize);

      // create output file and write packed data
      FileHandle := CreateFile(PChar(TargetFileName), GENERIC_WRITE, FILE_SHARE_READ, nil,
                               CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
      if FileHandle <> INVALID_HANDLE_VALUE then
       begin
        // write compressed data
        WriteFile(FileHandle, Target^, TargetFileSize, ReqMemSize, nil);
        Result := True;
       end;
    finally
      if FileHandle <> INVALID_HANDLE_VALUE then
        CloseHandle(FileHandle);

      FreeMem(Target);
      FreeMem(Source);
    end;
   end;
end;

function SFUnpackFile(const SourceFileName, TargetFileName: String): Boolean; { Return FALSE if IOError }
var
  FileHandle: hFile;
  FileSize, TargetFileSize, Dummy: DWord;
  Source, Target: Pointer;
begin
  Result := False;
  FileHandle := CreateFile(PChar(SourceFileName), GENERIC_READ, FILE_SHARE_READ, nil,
                           OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if FileHandle <> INVALID_HANDLE_VALUE then
   begin
    FileSize := GetFileSize(FileHandle, @Dummy) - 4;

    GetMem(Source, FileSize);
    try
      // read header to know which amount of memory required for unpacking
      ReadFile(FileHandle, TargetFileSize, 4, Dummy, nil);
      GetMem(Target, TargetFileSize);
      try
        // read source data
        ReadFile(FileHandle, Source^, FileSize, Dummy, nil);
        CloseHandle(FileHandle);
        FileHandle := INVALID_HANDLE_VALUE;

        // decompress
        SFUnPack(Source, Target, FileSize);

        // create output file and write unpacked data
        FileHandle := CreateFile(PChar(TargetFileName), GENERIC_WRITE, FILE_SHARE_READ, nil,
                                 CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
        if FileHandle <> INVALID_HANDLE_VALUE then
         begin
          // write decompressed data
          WriteFile(FileHandle, Target^, TargetFileSize, Dummy, nil);
          Result := True;
         end;
      finally
        if FileHandle <> INVALID_HANDLE_VALUE then
          CloseHandle(FileHandle);

        FreeMem(Target);
      end;
    finally
      FreeMem(Source);
    end;
   end;
end;

procedure SFPackStream(SourceStream: TMemoryStream; TargetStream: TStream);
var
  TargetSize: DWord;
  TargetData: Pointer;
begin
  TargetSize := SFCalcTargetSz(SourceStream.Size); // calculate required size for taget buffer
  GetMem(TargetData, TargetSize);
  try
    TargetSize := SFPack(SourceStream.Memory, TargetData, SourceStream.Size); // compress it!
    TargetStream.Write(TargetSize, 4); // store compressed size
    TargetStream.Write(TargetData^, TargetSize); // store original size and compressed data
  finally
    FreeMem(TargetData);
  end;
end;

function SFUnpackStream(SourceStream: TStream): TMemoryStream; // NOTE: Caller should destroy return value after dealing with it
var
  OriginalSize, PackedSize: DWord;
  SourceData: Pointer;
begin
  SourceStream.Read(PackedSize, 4);
  dec(PackedSize, 4);
  SourceStream.Read(OriginalSize, 4);

  Result := TMemoryStream.Create;
  Result.SetSize(OriginalSize);

  if SourceStream is TMemoryStream then
    SourceData := Pointer(Integer((SourceStream as TMemoryStream).Memory) + SourceStream.Position)
  else
   begin
    GetMem(SourceData, PackedSize);
    SourceStream.Read(SourceData^, PackedSize);
   end;

  SFUnpack(SourceData, Result.Memory, PackedSize);

  if SourceStream is TMemoryStream then
    SourceStream.Position := SourceStream.Position + LongInt(OriginalSize)
  else
    FreeMem(SourceData);
end;

end.