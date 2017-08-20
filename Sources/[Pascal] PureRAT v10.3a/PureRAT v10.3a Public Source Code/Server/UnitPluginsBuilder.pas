unit UnitPluginsBuilder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, UnitFunctions, ImgList, UnitConstants,
  BTMemoryModule, UnitVariables, UnitEncryption, StdCtrls, ExtCtrls, jpeg,
  SocketUnitEx, Buttons, uJSONConfig, acImage;

type
  TFormPluginsBuilder = class(TForm)
    dlgOpen1: TOpenDialog;
    grp1: TGroupBox;
    grp2: TGroupBox;
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edt2: TEdit;
    lbl3: TLabel;
    edt3: TEdit;
    lbl4: TLabel;
    mmo1: TMemo;
    btn1: TButton;
    btn5: TButton;
    btn2: TButton;
    lbl5: TLabel;
    edt4: TEdit;
    btn3: TSpeedButton;
    img1: TsImage;
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPluginsBuilder: TFormPluginsBuilder;

implementation

{$R *.dfm}

var
  PluginSource, PluginCompiled,
  ThumbFile, ThumbBuffer: string;
      
procedure TFormPluginsBuilder.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormPluginsBuilder.btn5Click(Sender: TObject);
var
  Buffer, TmpStr, TmpStr1,
  TmpStr2: string;
begin
  if PluginSource = '' then 
  begin
    MessageBox(Handle, 'No Dll file loaded.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if (edt1.Text = '') or (edt2.Text = '') or (edt3.Text = '') or (mmo1.Text = '') then
  begin
    MessageBox(Handle, 'Invalid plugin datas.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if ThumbBuffer = '' then
  begin
    MessageBox(Handle, 'Invalid thumbnail image.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  TmpStr := ExtractFileName(PluginSource);
  TmpStr := Copy(TmpStr, 1, Pos('.', TmpStr) - 1);
  ThumbFile := ExtractFilePath(PluginSource) + TmpStr + '.bmp';
  if FileExists(ThumbFile) then DeleteFile(ThumbFile);
  MyCreateFile(ThumbFile, ThumbBuffer, Length(ThumbBuffer));

  Buffer := FileToStr(PluginSource);
  Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
  Buffer := IntToStr(MyGetFileSize(ThumbFile)) + '|' + FileToStr(ThumbFile) + Buffer;
  PluginCompiled := PluginsPath + '\' + TmpStr + '.plugin';
  if FileExists(PluginCompiled) then DeleteFile(PluginCompiled);
  MyCreateFile(PluginCompiled, Buffer, Length(Buffer));
  if FileExists(ThumbFile) then DeleteFile(ThumbFile);

  MessageBox(Handle, 'Done!', PROGRAMINFOS, MB_ICONINFORMATION);
end;

procedure TFormPluginsBuilder.btn1Click(Sender: TObject);
var
  Module: PBTMemoryModule;
  TmpList: TStringArray;
  Buffer, TmpStr: string;
  p: Pointer;
  PluginInfos: function(): PChar;
  TmpBool: Boolean;
  i: Integer;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Dynamic library (*.dll)|*.dll';
  dlgOpen1.DefaultExt := 'dll';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  PluginSource := dlgOpen1.FileName;
  
  Buffer := FileToStr(PluginSource);
  if Buffer = '' then
  begin
    MessageBox(Handle, 'Invalid dll datas.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  p := @Buffer[1];

  try
    Module := BTMemoryLoadLibary(p, Length(Buffer));
    if Module = nil then
    begin
      MessageBox(Handle, 'Failed to load dll buffer.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
    if Assigned(PluginInfos) then
    begin
      TmpStr := PluginInfos();
      if (TmpStr = '') or (Pos('|', TmpStr) <= 0) then
      begin
        MessageBox(Handle, 'This dll file is not compatible.', PROGRAMINFOS, MB_ICONERROR);
        Exit;
      end;

      TmpList := ParseString('|', TmpStr);

      TmpBool := True;
      for i := 0 to 4 do if TmpList[i] = '' then TmpBool := False;
      if TmpBool = False then
      begin
        MessageBox(Handle, 'Informations not set correctly in dll file.', PROGRAMINFOS, MB_ICONERROR);
        Exit;
      end;

      edt4.Text := TmpList[4];
      edt1.Text := TmpList[0];
      edt2.Text := TmpList[1];
      edt3.Text := TmpList[3];
      mmo1.Text := TmpList[2];
    end
    else
    begin
      MessageBox(Handle, 'This dll file is not compatible.',
        PROGRAMINFOS, MB_ICONERROR);
    end;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormPluginsBuilder.btn2Click(Sender: TObject);
var
  Module: PBTMemoryModule;
  Buffer: string;
  p: Pointer;
  PluginFunction: procedure();
  PluginOptions: procedure(_Host: PChar; _Port: Word; _PluginCode, _ClientId, _CmdId,
    _Password: PChar); stdcall;
  PluginOptions1: procedure(_Socket: Integer);  stdcall;
  PluginOptions2: procedure(_ClientPath: PChar); stdcall;
  BufferSize: Int64;
begin
  if (PluginCompiled = '') or (ExtractFileExt(PluginCompiled) <> '.plugin') then
  begin
    MessageBox(Handle, 'No Dll file compiled.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  Buffer := FileToStr(PluginCompiled);
  BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
  Delete(Buffer, 1, Pos('|', Buffer));
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

    if edt4.Text = 'Client' then
    begin
      @PluginOptions := BTMemoryGetProcAddress(Module, 'PluginOptions');
      if Assigned(PluginOptions) then PluginOptions(nil, 0, nil, nil, nil, nil);
    end
    else
       
    if edt4.Text = 'Server' then
    begin
      @PluginOptions1 := BTMemoryGetProcAddress(Module, 'PluginOptions');
      if Assigned(PluginOptions1) then PluginOptions1(-1);
    end
    else

    if edt4.Text = 'Builder' then
    begin
      dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
      dlgOpen1.Filter := 'Executable file (*.exe)|*.exe';
      dlgOpen1.DefaultExt := 'exe';
      if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

      @PluginOptions2 := BTMemoryGetProcAddress(Module, 'PluginOptions');
      if Assigned(PluginOptions2) then PluginOptions2(PChar(dlgOpen1.FileName));
    end;

    @PluginFunction := BTMemoryGetProcAddress(Module, 'PluginFunction');
    if Assigned(PluginFunction) then PluginFunction;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormPluginsBuilder.img1Click(Sender: TObject);
var
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Image file (*.jpg); (*.jpeg); (*.bmp); (*.png)|*.jpg; *.jpeg; *.bmp; *.png';
  if (not dlgOpen1.Execute) or (not FileExists(dlgOpen1.FileName)) then Exit;

  ThumbBuffer := GetAnyImageToStream(dlgOpen1.FileName, 100, 150, 80);
  if ThumbBuffer = '' then Exit;
  Stream := TMemoryStream.Create;
  Stream.Write(Pointer(ThumbBuffer)^, Length(ThumbBuffer));
  Stream.Position := 0;
  Jpg := TJPEGImage.Create;
  Jpg.LoadFromStream(Stream);
  Stream.Free;
  Bmp := TBitmap.Create;
  Bmp.Assign(Jpg);
  Jpg.Free;
  img1.Picture.Bitmap.Assign(Bmp);
  Bmp.Free;
end;

procedure TFormPluginsBuilder.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('pBuilder left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('pBuilder top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  ThumbBuffer := GetImageFromBMP(MyBmp, 100, 150, 80);
  if ThumbBuffer = '' then Exit;
  Stream := TMemoryStream.Create;
  Stream.Write(Pointer(ThumbBuffer)^, Length(ThumbBuffer));
  Stream.Position := 0;
  Jpg := TJPEGImage.Create;
  Jpg.LoadFromStream(Stream);
  Stream.Free;
  Bmp := TBitmap.Create;
  Bmp.Assign(Jpg);
  Jpg.Free;
  img1.Picture.Bitmap.Assign(Bmp);
  Bmp.Free;
end;

procedure TFormPluginsBuilder.btn3Click(Sender: TObject);
const
  MsgInfo =
    '- Thumbnail: ' + #13#10 +
    'You can choose your own thumbnail, the3 choosen image will be resized automatically.' + #13#10 +
    'Dark backdround is highly recommended!' + #13#10#13#10 +
    '- Plugins test: ' + #13#10 +
    'Only plugin of type Builder can be initialized with options, others types are initialized with options ' +
    'set to null.';
begin
  MessageBox(Handle, MsgInfo, PROGRAMINFOS, MB_ICONINFORMATION);
end;

procedure TFormPluginsBuilder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('pBuilder left', Left);
  JSONConfig.WriteInteger('pBuilder top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;

end;

end.
