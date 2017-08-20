unit uRegistryeditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, StdCtrls,winsock;

type
  TForm11 = class(TForm)
    pmPoppupRegistry2: TPopupMenu;
    New1: TMenuItem;
    Key1: TMenuItem;
    MenuItem20: TMenuItem;
    BinaryValue1: TMenuItem;
    REGSZValue1: TMenuItem;
    DWORDValue1: TMenuItem;
    MenuItem21: TMenuItem;
    DeleteRegValue: TMenuItem;
    RegRename: TMenuItem;
    tv1: TTreeView;
    lvwRegedit: TListView;
    stat1: TStatusBar;
    edt1: TEdit;
    pmPoppupRegistry1: TPopupMenu;
    MenuRegDeleteKey1: TMenuItem;
    ImageList1: TImageList;
    function GetPath(Node: TTreeNode):string;
    procedure tv1DblClick(Sender: TObject);
    procedure MenuRegDeleteKey1Click(Sender: TObject);
    procedure DeleteRegValueClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}
function TForm11.GetPath(Node: TTreeNode):string;
begin
  repeat
    Result := Node.Text + '\' + Result;
    Node   := Node.Parent;
  until not Assigned(Node);
end;
procedure TForm11.tv1DblClick(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if tv1.Selected <> nil then
  begin
    lvwRegedit.Clear;
    Edt1.Text := getpath(tv1.Selected);
    Sock := StrToInt(Stat1.Panels[0].Text);
    Data := '35|' + edt1.Text + #10;
    Send(Sock, Data[1], Length(Data), 0);
    //Servidor.Connection.Writeln('listvalues|' + EditPathRegistro.Text);
  end;
end;

procedure TForm11.MenuRegDeleteKey1Click(Sender: TObject);
var
  sock:integer;
  data:string;
begin
if tv1.Selected <> nil then
  begin
    lvwRegedit.Clear;
    Sock := StrToInt(Stat1.Panels[0].Text);
    Data := '58|' + getpath(tv1.Selected)+ #10;
    Send(Sock, Data[1], Length(Data), 0);
  end;
end;

procedure TForm11.DeleteRegValueClick(Sender: TObject);
var
  sock:integer;
  data:string;
begin
if lvwRegedit.Selected <> nil then
  begin
    Sock := StrToInt(Stat1.Panels[0].Text);
    Data := '58|' + edt1.Text + lvwRegedit.Selected.Caption + #10;
    lvwRegedit.Selected.Delete;
    Send(Sock, Data[1], Length(Data), 0);
  end;
end;

end.
