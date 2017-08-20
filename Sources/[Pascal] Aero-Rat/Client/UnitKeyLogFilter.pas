unit UnitKeyLogFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ComCtrls, Menus, ImgList;

type
  TKeyLogFilter = class(TForm)
    ListView1: TListView;
    BitBtn2: TBitBtn;
    Edit1: TEdit;
    ColorBox1: TColorBox;
    Label1: TLabel;
    Label2: TLabel;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Remove1: TMenuItem;
    procedure BitBtn2Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Remove1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  KeyLogFilter: TKeyLogFilter;

implementation

{$R *.dfm}

procedure TKeyLogFilter.BitBtn2Click(Sender: TObject);
var
  Li: TListItem;
begin
  Li := Listview1.Items.Add;
  Li.Caption := lowercase(Edit1.Text);
  Li.SubItems.Add(inttostr(ColorBox1.Selected));
end;

procedure TKeyLogFilter.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  Listview1.Canvas.Font.Color := TColor(StrToInt(Item.SubItems[0]));
end;

procedure TKeyLogFilter.Remove1Click(Sender: TObject);
var
  i: integer;
begin
  for i := listview1.Items.Count -1 downto 0 do begin
    if listview1.Items[i].Selected then listview1.Items[i].Delete;
  end;
end;

end.
