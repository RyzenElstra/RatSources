unit UnitImagePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ComCtrls, StdCtrls, ExtCtrls, UnitCommands, UnitVariables,
  Menus;

type
  TFormImagePreview = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    btn1: TButton;
    trckbr1: TTrackBar;
    lvImage: TListView;
    ilThumbs1: TImageList;
    pm1: TPopupMenu;
    D1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure trckbr1Change(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
  private
    { Private declarations }
    Hwnd: HWND;
  public
    { Public declarations }    
    ThumbSize: Integer;                               
    constructor Create(aOwner: TComponent);
    procedure SetParameters(_Hwnd: HWND; TmpStr: string);
    procedure AddThumb(Bmp: TBitmap; ImageId: string);
  end;

var
  FormImagePreview: TFormImagePreview;

implementation

{$R *.dfm}

constructor TFormImagePreview.Create(aOwner: TComponent);
begin
  inherited Create(aOwner);
end;

procedure TFormImagePreview.AddThumb(Bmp: TBitmap; ImageId: string);
var
  i: Integer;
begin
  for i := 0 to lvImage.Items.Count -1 do
  begin
    if lvImage.Items[i].Caption = ImageId then
    begin
      try
        if lvImage.Items[i].ImageIndex = -1 then
          lvImage.Items[i].ImageIndex := ilThumbs1.Add(Bmp, nil)
        else ilThumbs1.Replace(lvImage.Items[i].ImageIndex, Bmp, nil);
      except
      end;
    end;

    Application.ProcessMessages;
  end;
end;
       
procedure TFormImagePreview.SetParameters(_Hwnd: HWND; TmpStr: string);
begin
  Hwnd := _Hwnd;
  Caption := TmpStr;
end;

procedure TFormImagePreview.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  
  ThumbSize := 100;
  ilThumbs1.Width := ThumbSize;
  ilThumbs1.Height := ThumbSize;
end;

procedure TFormImagePreview.trckbr1Change(Sender: TObject);
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

  ilThumbs1.Width := ThumbSize;
  ilThumbs1.Height := ThumbSize;
end;

procedure TFormImagePreview.btn1Click(Sender: TObject);
var
  ToSend: string;
  i: Integer;
begin
  if lvImage.Items.Count = 0 then Exit;

  ilThumbs1.Clear;
  ilThumbs1.Width := ThumbSize;
  ilThumbs1.Height := ThumbSize;

  for i := 0 to lvImage.Items.Count - 1 do
  begin
    lvImage.Items.Item[i].ImageIndex := -1;
    ToSend := ToSend + Caption + lvImage.Items.Item[i].Caption + '|';
  end;

  ToSend := FILESIMAGEPREVIEW + '|' + IntToStr(ThumbSize) + '|' + ToSend;
  SendMessage(Hwnd, WM_SEND_DATAS, Integer(ToSend), 0);
end;

procedure TFormImagePreview.D1Click(Sender: TObject);
var
  ToSend: string;
  i: Integer;
begin
  for i := 0 to lvImage.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if not lvImage.Items.Item[i].Selected then Continue;
    ToSend := FILESDOWNLOADFILE + '|' + Caption + lvImage.Items.Item[i].Caption;
    SendMessage(Hwnd, WM_SEND_DATAS, Integer(ToSend), 0);
  end;
end;

end.
