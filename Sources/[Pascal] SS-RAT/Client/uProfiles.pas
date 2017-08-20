unit uProfiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList,  ComCtrls, inifiles, StdCtrls, Buttons,uMini;

type
  TForm16 = class(TForm)
    lv1: TListView;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses uBuild, uFilemanager;

{$R *.dfm}

Function GetProfilepath: String;
Begin
  Result := ExtractFilePath(ParamStr(0)) + 'Profiles\';
  If (Not DirectoryExists(Result)) Then
    CreateDirectory(pChar(Result), NIL);
End;
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
procedure FileList;
var
  FindData: TWIN32FindData;
  hFind: THandle;
  li: tlistitem;
begin
  hFind := FindFirstFile(pchar(GetProfilepath + '*'), FindData);
  if hFind = INVALID_HANDLE_VALUE then exit;

  if GetAttrib(FindData) <> 'File Folder' then begin
    li := form16.LV1.Items.Add;
    li.Caption := FindData.cFileName;
    li.ImageIndex := 0;
  end;

  while FindNextFile(hFind, FindData) do begin

    if GetAttrib(FindData) <> 'File Folder' then begin
      li := form16.LV1.Items.Add;
      li.Caption := FindData.cFileName;
      li.ImageIndex := 0;
    end;

  end;
  Windows.FindClose(hFind);
end;
procedure TForm16.BitBtn1Click(Sender: TObject);
begin
form21.show;
close;
end;

procedure TForm16.btn1Click(Sender: TObject);
var
  sUsername:string;
  sYesClicked:boolean;
  i:integer;
  Ini: TIniFile;
begin
sYesClicked := InputQuery('New Profile','Please Type in your Profilename!',sUsername);
if sYesclicked = false then exit;
if sUsername = '' then begin
  showmessage('Cant create User! Name is invalid!');
  exit;
end;
for i := 0 to lv1.Items.Count - 1 do begin
  if sUsername = lv1.Items.Item[i].Caption then begin
    showmessage('Profile already exists! Please use another name!');
    exit;
  end;
end;
try
    Ini := TIniFile.Create(GetProfilepath + sUsername);
    Ini.WriteString('Builder', 'IP', '127.0.0.1');
    Ini.WriteString('Builder', 'Port', '1005');
    Ini.WriteString('Builder', 'Password', 'password');
    Ini.WriteString('Builder', 'Filename', 'server.exe');
    Ini.WriteString('Builder', 'Startupname', 'Server');
    Ini.WriteString('Builder', 'Mutex', 'Slayer616');
    Ini.WriteString('Builder', 'ID', 'Remote-PC');
    Ini.WriteBool('Builder', 'Install?', False);
    Ini.WriteBool('Builder', 'Startup?', False);
    Ini.WriteBool('Builder', 'ActiveX?', False);
    Ini.WriteBool('Builder', 'HKCU?', False);
    Ini.WriteBool('Builder', 'Unhook?', False);
    Ini.WriteBool('Builder', 'HideFile?', False);
    Ini.WriteBool('Builder', 'Keylogger?', False);
    Ini.WriteBool('Builder', 'Melt?', False);
  finally
    Ini.Free;
  end;
lv1.Clear;
FileList;
end;

procedure TForm16.FormShow(Sender: TObject);
begin
lv1.Clear;
FileList;
end;

procedure TForm16.btn3Click(Sender: TObject);
begin
if lv1.Selected = nil then exit;
deletefile(getprofilepath + lv1.Selected.Caption);
lv1.Clear;
FileList;
end;
procedure AddIPsToList(APIlist:string);
var
  tempstr:string;
  s:Tlistitem;
begin
form9.lv1.Items.Clear;
repeat
tempstr := copy(apilist,1,pos('****',apilist) - 1) ;
if tempstr <> '' then begin
  s := form9.lv1.Items.Add;
  s.caption := tempstr;
end;
delete(apilist,1,length(tempstr) + 4);
until APIlist = '';
end;
procedure TForm16.btn2Click(Sender: TObject);
var
  Ini: TIniFile;
begin
  if lv1.Selected = nil then exit;
  try
    Ini := TIniFile.Create(getprofilepath + lv1.Selected.caption);
    with form9 do
    begin
      AddIPsToList(Ini.ReadString('Builder', 'IP', ''));
      edt2.Text := Ini.ReadString('Builder', 'Port', '1005');
      edt3.Text := Ini.ReadString('Builder', 'Password', 'password');
      edt4.Text := Ini.ReadString('Builder', 'Filename', 'server.exe');
      edt5.Text := Ini.ReadString('Builder', 'Startupname', 'server.exe');
      edt6.Text := Ini.ReadString('Builder', 'Mutex', 'Slayer616');
      edt7.Text := Ini.ReadString('Builder', 'ID', 'Default');
      chk1.Checked := Ini.ReadBool('Builder', 'Install?', False);
      chk2.Checked := Ini.ReadBool('Builder', 'Startup?', False);
      chk3.Checked := Ini.ReadBool('Builder', 'ActiveX?', False);
      chk4.Checked := Ini.ReadBool('Builder', 'HKCU?', False);
      chk5.Checked := Ini.ReadBool('Builder', 'Unhook?', False);
      chk6.Checked := Ini.ReadBool('Builder', 'Keylogger?', False);
      chk7.Checked := Ini.ReadBool('Builder', 'Melt?', False);
      chk8.Checked := Ini.ReadBool('Builder', 'HideFile?', False);
      checkbox1.Checked := Ini.ReadBool('Builder', 'Persistance?', False);
      checkbox2.Checked := Ini.ReadBool('Builder', 'Manifest?', False);
      close;
    end;
  finally
    Ini.Free;
  end;
form9.lbl10.Caption := lv1.Selected.Caption;
form9.show;
end;

end.
