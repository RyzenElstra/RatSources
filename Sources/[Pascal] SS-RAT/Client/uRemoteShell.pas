unit uRemoteShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Menus,winsock;

type
  TForm18 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Activate1: TMenuItem;
    Close1: TMenuItem;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Activate1Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

procedure TForm18.Activate1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
Data := '200|'+ #10;
Sock := StrToInt(Statusbar1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm18.Close1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
Data := '202|a'+ #10;
Sock := StrToInt(Statusbar1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm18.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
sock:tSocket;
Data:string;
begin
if key = 13 then begin
Data := '201|' + edit1.Text + #10;
Sock := StrToInt(Statusbar1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
edit1.Clear;
end;
end;

end.
