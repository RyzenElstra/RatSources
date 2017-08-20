unit uInformation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList, Menus, winsock;

type
  TForm6 = class(TForm)
    ListView1: TListView;
    StatusBar1: TStatusBar;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    MainMenu1: TMainMenu;
    procedure Refresh1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Refresh1Click(Sender: TObject);
var
sock:tSocket;
Data:string;
begin
Data := '300|'+ #10;
Sock := StrToInt(Statusbar1.Panels[0].Text);
Send(Sock, Data[1], Length(Data), 0);
end;

end.
