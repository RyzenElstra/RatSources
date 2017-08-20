unit untInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TfrmInfo = class(TForm)
    img1: TImage;
    tmr1: TTimer;
    lblIP: TLabel;
    lblUsername: TLabel;
    lblComputer: TLabel;
    lblServer: TLabel;
    procedure FormPaint(Sender: TObject);
    procedure tmr1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInfo: TfrmInfo;

implementation

{$R *.dfm}

procedure TfrmInfo.FormPaint(Sender: TObject);
begin
//frmInfo.Paint
end;

procedure TfrmInfo.tmr1Timer(Sender: TObject);
begin
frmInfo.Hide
end;

end.
