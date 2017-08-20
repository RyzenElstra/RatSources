unit UnitShareServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Spin, Buttons, ComCtrls, ExtCtrls, Menus, ImgList;

type
  TShareServer = class(TForm)
    ListView1: TListView;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Add1: TMenuItem;
    Remove1: TMenuItem;
    Button2: TButton;
    Button1: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Add1Click(Sender: TObject);
    procedure Remove1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ShareServer: TShareServer;

implementation

{$R *.dfm}

procedure TShareServer.Button2Click(Sender: TObject);
begin
  modalresult := mrcancel;
end;

procedure TShareServer.Button1Click(Sender: TObject);
begin
  modalresult := mrok;
end;

procedure TShareServer.Add1Click(Sender: TObject);
var
  Li: TListItem;
  a,p: string;
begin
  a := InputBox('Share Server','Enter Remote Address','');
  if a = '' then exit;

  p := InputBox('Share Server','Enter Port','81');
  if p = '' then exit;

  Li := Listview1.Items.Add;
  Li.Caption := a;
  Li.SubItems.Add(p);
  Li.ImageIndex := -1;
end;

procedure TShareServer.Remove1Click(Sender: TObject);
begin
  listview1.Selected.Delete;
end;

end.
