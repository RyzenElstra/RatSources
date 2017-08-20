unit UnitSplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls, ToolWin, UnitVariables,
  UnitFunctions;

type
  TFormSplash = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSplash: TFormSplash;

implementation

{$R *.dfm}

procedure TFormSplash.FormCreate(Sender: TObject);
var
  TmpRes: TResourceStream;
  Stream: TMemoryStream;
  jpg: TJPEGImage;
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;

  TmpRes := TResourceStream.Create(HInstance, 'PRLOGO', 'prlogofile');
  Stream := TMemoryStream.Create;
  Stream.LoadFromStream(TmpRes);
  Stream.Position := 0;
  TmpRes.Free;

  jpg := TJPEGImage.Create;
  jpg.LoadFromStream(Stream);
  Stream.Free;
  MyBmp := TBitmap.Create;
  MyBmp.PixelFormat := pf32bit;
  MyBmp.Assign(jpg);
  jpg.Free;
end;

procedure TFormSplash.FormPaint(Sender: TObject);
var
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
  TmpStr: string;
begin
  TmpStr := GetImageFromBMP(MyBmp, 100, FormSplash.Width + 1, FormSplash.Height);
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
  FormSplash.Canvas.Draw(0, 0, Bmp);
  Bmp.Free;
end;

end.
