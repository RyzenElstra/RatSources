unit ACMConvertor;

interface

uses
  Windows, Classes, Messages, MSACM, MMSystem;

type
  TNotifyEvent = procedure(Sender: TObject) of object;

  TACMWaveFormat = packed record
    case integer of
      0: (Format: TWaveFormatEx);
      1: (RawData: Array[0..128] of byte);
  end;

  TACMConvertor = Class(TObject)
  private
    FChooseData: TACMFORMATCHOOSEA;
    FActive: Boolean;
    FBufferIn: Pointer;
    FBufferOut: Pointer;
    FInputBufferSize: DWord;
    FOutputBufferSize: DWord;
    FStartOfStream: Boolean;
    FStreamHandle: HACMStream;
    FStreamHeader: TACMStreamHeader;
    procedure SetActive(const Value: Boolean);
    procedure SetInputBufferSize(const Value: DWord);
  protected
    procedure CloseStream;
    procedure OpenStream;
    procedure ReadFormat(var Format: TACMWaveFormat; Stream: TStream);
    procedure WriteFormat(var Format: TACMWaveFormat; Stream: TStream);
  public
    FormatIn, FormatOut: TACMWaveFormat;
    constructor Create;
    destructor Destroy; override;
    function  ChooseFormat(var Format: TACMWaveFormat; const UseDefault: Boolean): Boolean;
    function  ChooseFormatIn(const UseDefault: Boolean): Boolean;
    function  ChooseFormatOut(const UseDefault: Boolean): Boolean;
    function  Convert: DWord;
    function  SuggestFormat(Format: TACMWaveFormat): TACMWaveFormat;
    property Active: Boolean read FActive write SetActive;
    property BufferIn: Pointer read FBufferIn;
    property BufferOut: Pointer read FBufferOut;
    property OutputBufferSize: DWord read FOutputBufferSize;
  published
    property InputBufferSize: DWord read FInputBufferSize write SetInputBufferSize;
  end;

implementation

{TACMConvertor}

function TACMConvertor.ChooseFormat(var Format: TACMWaveFormat; const UseDefault: Boolean): Boolean;
var
  OriginalFormat: PWaveFormatEX;
  FormatSelection: Longint;
begin
  Result := False;
  GetMem(OriginalFormat, Sizeof(TACMWaveFormat));
  try
    if UseDefault then
    begin
      Move(Format, OriginalFormat^, SizeOf(TACMWaveFormat))
    end
    else
    begin
      with OriginalFormat^ do
      begin
        wFormatTag := 49;
        nChannels := 1;
        nSamplesPerSec := 8000;
        nAvgBytesPerSec:= 8000;
        nBlockAlign:=1;
        wbitspersample := 8;
        cbSize := SizeOf(TACMWaveFormat);
      end;
    end;
    with FChooseData do begin
      pwfx := OriginalFormat;
      cbStruct := SizeOf(FChooseData);
      cbwfx := SizeOf(TACMWaveFormat);
      fdwStyle := ACMFORMATCHOOSE_STYLEF_INITTOWFXSTRUCT
    end;
    FormatSelection := ACMFormatChoose(FChooseData);
    if FormatSelection = MMSYSERR_NOERROR then
    begin
      Move(FChooseData.pwfx^, Format, SizeOf(TACMWaveFormat));
      Result := True;
    end;
  finally
    FreeMem(OriginalFormat);
  end;
end;

function TACMConvertor.ChooseFormatIn(const UseDefault: Boolean): Boolean;
begin
  Result := ChooseFormat(FormatIn, UseDefault);
end;

function TACMConvertor.ChooseFormatOut(const UseDefault: Boolean): Boolean;
begin
  Result := ChooseFormat(FormatOut, UseDefault);
end;

procedure TACMConvertor.CloseStream;
begin
  ACMStreamUnPrepareHeader(FStreamHandle, FStreamHeader, 0);
  ACMStreamClose(FStreamHandle, 0);
  FreeMem(FBufferIn);
  FreeMem(FBufferOut);
  FActive := False;
  FStartOfStream := False;
end;

function TACMConvertor.Convert: dword;
var
  Start: dword;
begin
  if FStartOfStream then
  begin
    Start := ACM_STREAMCONVERTF_BLOCKALIGN
  end
  else
  begin
    Start := 0;
  end;
  ZeroMemory(BufferOut, OutputBufferSize);
  ACMStreamConvert(FStreamHandle, FStreamHeader, ACM_STREAMCONVERTF_BLOCKALIGN or Start);
  ACMStreamReset(FStreamHandle,0);
  Result := FStreamHeader.cbDstLengthUsed;
  FStartOfStream := False;
end;

constructor TACMConvertor.Create;
begin
  inherited;
  FStreamHandle := nil;
  InputBufferSize := 2048;
  with FormatIn.Format do begin
    wFormatTag := 1;
    nChannels := 1;
    nSamplesPerSec := 22050;
    nAvgBytesPerSec:= 22050;
    nBlockAlign:=1;
    wbitspersample := 8;
    cbSize := SizeOf(TACMWaveFormat);
  end;
  with FormatOut.Format do begin
    wFormatTag := 1;
    nChannels := 1;
    nSamplesPerSec := 22050;
    nAvgBytesPerSec:= 22050;
    nBlockAlign:=1;
    wbitspersample := 8;
    cbSize := SizeOf(TACMWaveFormat);
  end;
end;

destructor TACMConvertor.Destroy;
begin
  Active := False;
  inherited;
end;

procedure TACMConvertor.OpenStream;
  procedure BuildHeader;
  begin
    with FStreamHeader do begin
      cbStruct := SizeOf(TACMStreamHeader);
      fdwStatus := 0;
      dwUser := 0;
      pbSrc := FBufferIn;
      cbSrcLength := InputBufferSize;
      cbSrcLengthUsed := 0;
      dwSrcUser := 0;
      pbDst := FBufferOut;
      cbDstLength := OutputBufferSize;
      cbDstLengthUsed := 0;
      dwDstUser := 0;
    end;
  end;
begin
  FStartOfStream := True;
  ACMStreamOpen(FStreamhandle, nil, FormatIn.Format, FormatOut.Format, nil, 0, 0, 0);
  ACMStreamSize(FStreamHandle, InputBufferSize, FOutputBufferSize, ACM_STREAMSIZEF_SOURCE);
  GetMem(FBufferIn, InputBufferSize);
  Getmem(FBufferOut, OutputBufferSize);
  try
    BuildHeader;
    ACMStreamPrepareHeader(FStreamHandle, FStreamHeader, 0);
  except
    Freemem(FBufferIn);
    Freemem(FBufferOut);
    Exit;
  end;
  FActive := True;
end;

procedure TACMConvertor.ReadFormat(var Format: TACMWaveFormat; Stream: TStream);
var
  Size: integer;
begin
  Stream.Read(Size, SizeOf(integer));
  Stream.Read(Format, Size);
end;

procedure TACMConvertor.SetActive(const Value: Boolean);
begin
  if Value = FActive then Exit;
  if Value then
  begin
    OpenStream
  end
  else
  begin
    CloseStream;
  end;
end;

procedure TACMConvertor.SetInputBufferSize(const Value: DWord);
begin
  if Active then Exit;
  FInputBufferSize := Value;
end;

function TACMConvertor.SuggestFormat(Format: TACMWaveFormat): TACMWaveFormat;
var
  WaveFormatEx: TWaveFormatEx;
  ValidItems: dword;
begin
  ValidItems := 0;
  if ACMFormatSuggest(nil, Format.Format, WaveFormatEx, SizeOf(TACMWaveFormat), ValidItems) = 0 then Exit;
  Move(WaveFormatEx, Result, SizeOf(TACMWaveFormat));
end;

procedure TACMConvertor.WriteFormat(var Format: TACMWaveFormat; Stream: TStream);
var
  Size: integer;
begin
  Size := SizeOf(Format);
  Stream.Write(Size, SizeOf(integer));
  Stream.Write(Format, Size);
end;

end.
