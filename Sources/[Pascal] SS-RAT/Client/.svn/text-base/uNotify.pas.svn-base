unit uNotify;
//Taken by Coolvibes, modified by Slayer616
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm90 = class(TForm)
    Timer: TTimer;
    lv1: TListView;
    img1: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    Image1: TImage;
    Label1: TLabel;
    procedure TimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PosY:     integer;
    Subiendo: boolean;
    constructor Create(aOwner: TComponent; tItem: TListItem);
  end;

var
  Form90: TForm90;
const
  FixedHeigth = 161;
implementation
uses mainu;
{$R *.dfm}
constructor TForm90.Create(aOwner: TComponent; tItem: TListItem);
begin
  inherited Create(aOwner);
  Lbl5.Caption := 'IP: ' + tItem.Caption;
  lbl2.caption := 'PC: ' + titem.subitems.strings[2];
  lbl4.caption := 'Window: ' + titem.SubItems.Strings[8];
  lbl3.Caption := 'OS: ' + titem.SubItems.Strings[4];
  Label1.caption := 'Country: ' + titem.SubItems.Strings[3];
  mainform.il1.GetBitmap(titem.ImageIndex,image1.Picture.Bitmap);
end;
procedure TForm90.TimerTimer(Sender: TObject);
begin
if Subiendo = True then
  begin
    if Top > PosY + 1 then
    begin
      Top    := Top - 8;
      sleep(5);
    end
    else
    begin
      Subiendo := False;
      Timer.Interval := 3000;
    end;
  end   
  else
  begin
    Timer.Interval := 10;
    if Top < (PosY + FixedHeigth) then
    begin
      Top    := Top + 8;
      sleep(5);
    end
    else
      Free;
  end;
end;
procedure TForm90.FormCreate(Sender: TObject);
var
  Zona: TRect;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @Zona, 0);
  Left     := Zona.Right - Width ;
  Top      := Zona.Bottom;
  PosY     := Top - Height;
  Subiendo := True;
end;



end.
