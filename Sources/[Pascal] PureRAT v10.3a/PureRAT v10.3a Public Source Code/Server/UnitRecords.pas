unit UnitRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ExtCtrls, StdCtrls, UnitMain, UnitEncryption,
  UnitVariables, UnitFunctions, MPlayer, UnitConstants, MMSystem, ACMConvertor,
  ACMOut, jpeg, UnitDB, uJSONConfig;

type
  TFormRecords = class(TForm)
    spl1: TSplitter;
    tv1: TTreeView;
    dlgSave1: TSaveDialog;
    stat1: TStatusBar;
    pm2: TPopupMenu;
    R1: TMenuItem;
    N1: TMenuItem;
    R2: TMenuItem;
    E1: TMenuItem;
    mmo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure tv1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }          
    ACMO: TACMOut;
    ACMC: TACMConvertor;
    DBDatas: TDBDatas;
    UserFolder: string;
    procedure LoadFolders(Root: Boolean);
    procedure LoadFiles(Root: Boolean);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _DBDatas: TDBDatas);
  end;

var
  FormRecords: TFormRecords;
                                          
implementation

{$R *.dfm}

procedure TFormRecords.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

constructor TFormRecords.Create(aOwner: TComponent; _DBDatas: TDBDatas);
begin
  inherited Create(aOwner);
  DBDatas := _DBDatas;
end;

procedure TFormRecords.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Records width');
  if i <= 0 then Width := 717 else Width := i;
  i := JSONConfig.ReadInteger('Records height');
  if i <= 0 then Height := 360 else Height := i;
  i := JSONConfig.ReadInteger('Records left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Records top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  tv1.Images := FormMain.ImagesList;
  ACMO := TACMOut.Create(nil);
  ACMC := TACMConvertor.Create;
  ACMO.NumBuffers := 0;
  ACMO.Open(ACMC.FormatIn);
end;

procedure TFormRecords.LoadFolders(Root: Boolean);
var
  SR: TSearchRec;
  TmpNode: TTreeNode;
begin
  if FindFirst(UserFolder + '*.*', faAnyFile, SR) <> 0 then Exit;
  repeat
    if ((SR.Attr And faDirectory) <> faDirectory) then Continue;
    if (SR.Name = '..') or (SR.Name = '.') then Continue;

    if Root then TmpNode := tv1.Items.Add(nil, SR.Name) else
      TmpNode := tv1.Items.AddChild(tv1.Selected, SR.Name);
    TmpNode.ImageIndex := 3;
    TmpNode.SelectedIndex := 3;
    if not Root then tv1.Selected.Expand(False);
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure TFormRecords.LoadFiles(Root: Boolean);
var
  SR: TSearchRec;
  TmpNode: TTreeNode;
begin
  if FindFirst(UserFolder + '*.*', faAnyFile, SR) <> 0 then Exit;
  repeat
    if ((SR.Attr And faDirectory) = faDirectory) then Continue;
    if (SR.Name = '..') or (SR.Name = '.') then Continue;
    
    if (ExtractFileExt(SR.Name) = '.audio') or (ExtractFileExt(SR.Name) = '.data') then
    begin
      if Root then TmpNode := tv1.Items.Add(nil, SR.Name) else
        TmpNode := tv1.Items.AddChild(tv1.Selected, SR.Name);
      TmpNode.ImageIndex := GetImageIndex(UserFolder + SR.Name);
      TmpNode.SelectedIndex := TmpNode.ImageIndex;
    end;
  until FindNext(SR) <> 0;
  FindClose(SR);
end;

procedure TFormRecords.tv1DblClick(Sender: TObject);
begin                                     
  if not Assigned(tv1.Selected) then Exit;                 
  if tv1.Selected.ImageIndex <> 3 then R2Click(Sender) else
  begin
    UserFolder := ExtractFilePath(ParamStr(0)) + 'Users\' + GetNodeRoot(tv1.Selected);
    stat1.Panels.Items[0].Text := GetNodeRoot(tv1.Selected);
    tv1.Selected.DeleteChildren;
    LoadFolders(False);
    LoadFiles(False);
  end;
end;

procedure TFormRecords.FormShow(Sender: TObject);
begin
  R1Click(Sender);
end;

procedure TFormRecords.R1Click(Sender: TObject);
begin
  UserFolder := ExtractFilePath(ParamStr(0)) + 'Users\' + Trim(DBDatas.DBClientId);
  tv1.Items.Clear;
  LoadFolders(True);
  LoadFiles(True);
end;

procedure TFormRecords.R2Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TmpStr: string;
begin
  if not Assigned(tv1.Selected) then Exit;

  if ExtractFileExt(tv1.Selected.Text) = '.data' then
  begin
    TmpStr := FileToStr(UserFolder + '\' + tv1.Selected.Text);
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    mmo1.Text := TmpStr;
  end
  else

  if ExtractFileExt(tv1.Selected.Text) = '.audio' then
  begin
    TmpStr := FileToStr(UserFolder + '\' + tv1.Selected.Text);
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    Stream := TMemoryStream.Create;
    Stream.Write(Pointer(TmpStr)^, Length(TmpStr));
    Stream.Position := 0;
    ACMO.Play(Stream.Memory^, Stream.Size);
    Stream.Free;
  end;
end;

procedure TFormRecords.E1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TmpStr: string;
begin
  if not Assigned(tv1.Selected) then Exit;

  if ExtractFileExt(tv1.Selected.Text) = '.data' then
  begin
    dlgSave1.InitialDir := ExtractFilePath(ParamStr(0));
    dlgSave1.Filter := 'Text file (*.txt)|*.txt';
    dlgSave1.DefaultExt := 'txt';
    if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;
    TmpStr := FileToStr(UserFolder + '\' + tv1.Selected.Text);
    TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
    MyCreateFile(dlgSave1.FileName, TmpStr, Length(TmpStr));
  end
  else

  if ExtractFileExt(tv1.Selected.Text) = '.audio' then
    MessageBox(Handle, 'Audio file can not be exported.', PROGRAMINFOS, MB_ICONERROR);
end;

procedure TFormRecords.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Records width', Width);
  JSONConfig.WriteInteger('Records height', Height);
  JSONConfig.WriteInteger('Records left', Left);
  JSONConfig.WriteInteger('Records top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
