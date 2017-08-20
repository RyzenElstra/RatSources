unit UnitNotification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, acImage, StdCtrls, UnitMain;

type
  TFormNotification = class(TForm)
    img1: TsImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    tmr1: TTimer;
    img2: TsImage;
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }  
    Active: Boolean;
    PosY: Integer;
    constructor Create(aOwner: TComponent; Infos: string);
  end;

var
  FormNotification: TFormNotification;

implementation

{$R *.dfm}
       
constructor TFormNotification.Create(aOwner: TComponent; Infos: string);
var
  TmpInt: Integer;
begin
  inherited Create(aOwner);
  
  while Infos <> '' do
  begin
    lbl1.Caption := Copy(Infos, 1, Pos('|', Infos)-1);
    Delete(Infos, 1, Pos('|', Infos));

    lbl2.Caption := 'Address / Port: ' + Copy(Infos, 1, Pos('|', Infos)-1);
    Delete(Infos, 1, Pos('|', Infos));
                                                 
    lbl3.Caption := 'Country: ' + Copy(Infos, 1, Pos('|', Infos)-1);
    Delete(Infos, 1, Pos('|', Infos));

    lbl4.Caption := 'Username: ' + Copy(Infos, 1, Pos('|', Infos)-1);
    Delete(Infos, 1, Pos('|', Infos));

    lbl5.Caption := 'Windows: ' + Copy(Infos, 1, Pos('|', Infos)-1);
    Delete(Infos, 1, Pos('|', Infos));

    TmpInt := StrToInt(Copy(Infos, 1, Pos('|', Infos)-1));
    Delete(Infos, 1, Pos('|', Infos));
  end;

  FormMain.ilFlags.GetBitmap(TmpInt, img2.Picture.Bitmap);
end;

procedure TFormNotification.tmr1Timer(Sender: TObject);
begin
  if Active = True then
  begin
    if Top > PosY + 1 then Top := Top - 8 else
    begin
      Active := False;
      tmr1.Interval := 4000;
    end;
  end
  else
  begin
    tmr1.Interval := 1;
    if Top < (PosY + 105) then Top := Top + 8 else Free;
  end;
end;

end.
