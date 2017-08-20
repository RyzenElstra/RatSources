unit UnitAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, jpeg, ExtCtrls, UnitVariables, UnitFunctions,
  UnitMain;

type
  TFormAbout = class(TForm)
    pnl1: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts3: TTabSheet;
    mmo1: TMemo;
    mmo3: TMemo;
    ts4: TTabSheet;
    mmo4: TMemo;
    img1: TImage;
    ts5: TTabSheet;
    mmo5: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAbout: TFormAbout;

implementation

{$R *.dfm}

procedure TFormAbout.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormAbout.FormShow(Sender: TObject);
var
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
  TmpStr: string;
begin
  TmpStr := GetImageFromBMP(MyBmp, 100, img1.Width, img1.Height);
  if TmpStr = '' then Exit;
  Stream := TMemoryStream.Create;
  Stream.Write(Pointer(TmpStr)^, Length(TmpStr));
  Stream.Position := 0;
  Jpg := TJPEGImage.Create;
  Jpg.LoadFromStream(Stream);
  Stream.Free;
  Bmp := TBitmap.Create;
  Bmp.Assign(Jpg);
  Jpg.Free;
  img1.Picture.Bitmap.Assign(Bmp);       
  Bmp.Free;
end;

end.
