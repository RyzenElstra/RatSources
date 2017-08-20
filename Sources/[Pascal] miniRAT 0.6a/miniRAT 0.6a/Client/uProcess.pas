unit uProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, PngImageList,winsock;

type
  TForm5 = class(TForm)
    lv1: TListView;
    stat1: TStatusBar;
    pm1: TPopupMenu;
    Refresh1: TMenuItem;
    KillProcess1: TMenuItem;
    N1: TMenuItem;
    PngImageList1: TPngImageList;
    procedure Refresh1Click(Sender: TObject);
    procedure KillProcess1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Refresh1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  lv1.Clear;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '16 0'#10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.KillProcess1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if lv1.Selected = nil then exit;
Sock := StrToInt(Stat1.Panels[0].Text);
Data := '18 ' + lv1.Selected.SubItems.Strings[1] + #10;
         Send(Sock, Data[1], Length(Data), 0);
         Sleep(200);
         Refresh1.Click;
end;

end.
