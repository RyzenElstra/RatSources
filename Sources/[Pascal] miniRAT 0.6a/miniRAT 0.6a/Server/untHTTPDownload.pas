unit untHTTPDownload;

interface

Uses
  Windows, Winsock, ShellApi;

  Function ExecuteFileFromURL(dHost: String; dTo: String): String;
  Function ResolveIP(HostName: String): String;

implementation

Function CreateGet(Host, SubHost, Referer: String; Mozilla: Bool): String; 
Begin
  If (Not Mozilla) Then
    Result := 'GET /'+SubHost+' HTTP/1.1'#13#10+
              'Accept: image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, */*'#13#10+
              'Referer: '+Referer+#13#10+
              'Accept-Language: en-us'#13#10+
              'Accept-Encoding: gzip, deflate'#13#10+
              'User-Agent: Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)'#13#10+
              'Connection: Keep-Alive'#13#10+
              'Host: '+Host+#13#10#13#10;
  If (Mozilla) Then
    Result := 'GET /'+SubHost+' HTTP/1.1'#13#10+
              'Host: '+Host+#13#10+
              'User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.0; en-US; rv:1.7.6) Gecko/20050317 Firefox/1.0.2'#13#10+
              'Accept: text/xml, application/xml, application/xhtml+xml, text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5'#13#10+
              'Accept-Language: en-us,en;q=0.5'#13#10+
              'Accept-Encoding: gzip,deflate'#13#10+
              'Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7'#13#10+
              'Keep-Alive: 300'#13#10+
              'Connection: Keep-Alive'#13#10+
              'Referer: '+Referer+#13#10#13#10;
End;

Function StrToInt(Const S: String): Integer;
Var E: Integer; Begin Val(S, Result, E); End;

Function IntToStr(Const Value: Integer): String;
Var S: String[11]; Begin Str(Value, S); Result := S; End;

Function ResolveIP(HostName: String): String;
Type
  tAddr = Array[0..100] Of PInAddr;
  pAddr = ^tAddr;
Var
  I             :Integer;
  WSA           :TWSAData;
  PHE           :PHostEnt;
  P             :pAddr;
Begin
  Result := '';

  WSAStartUp($101, WSA);
    Try
      PHE := GetHostByName(pChar(HostName));
      If (PHE <> NIL) Then
      Begin
        P := pAddr(PHE^.h_addr_list);
        I := 0;
        While (P^[I] <> NIL) Do
        Begin
          Result := (inet_nToa(P^[I]^));
          Inc(I);
        End;
      End;
    Except
    End;
  WSACleanUp;
End;

Function GetKBS(dByte: Integer): String;
Var
  dB    :Integer;
  dKB   :Integer;
  dMB   :Integer;
  dGB   :Integer;
  dT    :Integer;
Begin
  dB := dByte;
  dKB := 0;
  dMB := 0;
  dGB := 0;
  dT  := 1;

  While (dB > 1024) Do
  Begin
    Inc(dKB, 1);
    Dec(dB , 1024);
    dT := 1;
  End;

  While (dKB > 1024) Do
  Begin
    Inc(dMB, 1);
    Dec(dKB, 1024);
    dT := 2;
  End;

  While (dMB > 1024) Do
  Begin
    Inc(dGB, 1);
    Dec(dKB, 1024);
    dT := 3;
  End;

  Case dT Of
    1: Result := IntToStr(dKB) + '.' + Copy(IntToStr(dB ),1,2) + ' kb';
    2: Result := IntToStr(dMB) + '.' + Copy(IntToStr(dKB),1,2) + ' mb';
    3: Result := IntToStr(dGB) + '.' + Copy(IntToStr(dMB),1,2) + ' gb';
  End;
End;

Function LowerCase(Const S: String): String;
Var
  Ch    :Char;
  L     :Integer;
  Source:pChar;
  Dest  :pChar;
Begin
  L := Length(S);
  SetLength(Result, L);
  Source := Pointer(S);
  Dest   := Pointer(Result);
  While (L <> 0) Do
  Begin
    Ch := Source^;
    If (Ch >= 'A') And (Ch <= 'Z') Then
      Inc(Ch, 32);
    Dest^ := Ch;
    Inc(Source);
    Inc(Dest);
    Dec(L);
  End;
End;

Function HTTPReceive(Sock: TSocket): Integer;
Var
  TimeOut       :TimeVal;
  FD_Struct     :TFDSet;
Begin
  TimeOut.tv_sec := 120;
  TimeOut.tv_usec :=  0;

  FD_ZERO(FD_STRUCT);
  FD_SET (Sock, FD_STRUCT);

  IF (Select(0, @FD_STRUCT, NIL, NIL, @TIMEOUT) <= 0) Then
  Begin
    CloseSocket(Sock);
    Result := -1;
    Exit;
  End;
  Result := 0;
End;

Function DownloadFile(Host, dTo: String; VAR dTotal, dSpeed: String): Bool;
Var
  Web           :TSocket;
  WSA           :TWSAdata;
  Add           :TSockAddrIn;

  Buffer        :Array[0..15036] Of Char;
  SubHost       :String;
  Buf           :String;

  Size          :Integer;
  rSize         :Integer;

  F             :File Of Char;

  Start         :Integer;
  Total         :Integer;
  Speed         :Integer;
Begin
  Result := False;
  If (Host = '') Then Exit;
  If (Host[Length(Host)] = '/') Then Delete(Host, Length(Host), 1);
  If (LowerCase(Copy(Host, 1, 4)) = 'http') Then Delete(Host, 1, 7);
  If (Pos('/', Host) > 0) Then
  Begin
    SubHost := Copy(Host, Pos('/', Host)+1, Length(Host));
    Host := Copy(Host, 1, Pos('/', Host)-1);
  End Else
    SubHost := '';

  WSAStartUP(MakeWord(2,1), WSA);
    Web := Socket(AF_INET, SOCK_STREAM, 0);
    If (Web > INVALID_SOCKET) Then
    Begin
      Add.sin_family := AF_INET;
      Add.sin_port := hTons(80);
      Add.sin_addr.S_addr := inet_addr(pChar(ResolveIP(Host)));

      If (Connect(Web, Add, SizeOf(Add)) = ERROR_SUCCESS) Then
      Begin
        Buf := CreateGet(Host, SubHost, '', FALSE);
        Send(Web, Buf[1], Length(Buf), 0);

        Recv(Web, Buffer, 5012, 0);
        Buf := String(Buffer);
        Delete(Buf, 1, Pos('Content-Length', Buf)+15);
        Delete(Buf, Pos(#13, Buf), Length(Buf));

        Size := StrToInt(Buf);

        Total := 1;
        Start := GetTickCount;

        AssignFile(F, dTo);
        ReWrite(F);
        Repeat
          If (HTTPReceive(WEB) = 0) Then
          Begin
            rSize := Recv(Web, Buffer, SizeOf(Buffer), 0);
            Total := Total + rSize;
            If (rSize > 0) Then
              BlockWrite(F, Buffer, rSize);
            Dec(Size, rSize);
          End Else
            Break;
        Until Size = 0;
        CloseFile(F);

        Speed := Total DIV (((GetTickCount - Start) DIV 1000) + 1);

        dTotal := GetKBS(Total);
        dSpeed := GetKBS(Speed);

        If (Size <= 0) Then
          Result := True
        Else
          Result := False;
      End;

    End;
    CloseSocket(Web);
  WSACleanUP();
End;

Function ExecuteFileFromURL(dHost: String; dTo: String): String;
Var
  Total :String;
  Speed :String;
Begin
  If (DownloadFile(dHost, dTo, Total, Speed)) Then
  Begin
    ShellExecute(0, 'open', pChar(dTo), nil, nil, 1);
    Result := 'Downloaded '+Total+' to '+dTo+' in '+Speed+'/s'#10;
  End Else
    Result := 'Download Failed'#10;
End;

end.

