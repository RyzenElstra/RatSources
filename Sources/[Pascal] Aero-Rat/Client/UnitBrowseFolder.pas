unit UnitBrowseFolder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, Buttons;

type
  TBrowseFolder = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    TreeView1: TTreeView;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    LastNode: TTreeNode;
    NewSocket: TCustomWinSocket;
    LastPath: string;
  end;

var
  BrowseFolder: TBrowseFolder;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'FileSearch|' + Data);
end;

procedure TBrowseFolder.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TBrowseFolder.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

function GetParentNode(Node: TTreenode): string;
var
  s: string;
begin
  s := Node.Text;
  while Node.Parent <> nil do begin
    result := includetrailingbackslash(Node.Parent.Text) + result;
    Node := Node.Parent;
  end;
  result := result + includetrailingbackslash(s);
end;

procedure TBrowseFolder.TreeView1DblClick(Sender: TObject);
var
  Path: string;
begin
  if not assigned(Treeview1.Selected) then exit;
  LastNode := Treeview1.Selected;
  Path := GetParentNode(LastNode);
  Delete(Path,1,12);
  LastPath := Path;
  Treeview1.Selected.DeleteChildren;
  if LastNode.Parent = nil then begin
    if LastNode.Text = 'My Computer' then SendData(NewSocket,'DriveList');
    if LastNode.Text = 'Desktop' then SendData(NewSocket,'FileList|%DESKTOP%');
    if LastNode.Text = 'My Documents' then SendData(NewSocket,'FileList|%MYDOCUMENTS%');
  end else begin
    SendData(NewSocket,'FileList|' + LastPath);
  end;
end;

end.
