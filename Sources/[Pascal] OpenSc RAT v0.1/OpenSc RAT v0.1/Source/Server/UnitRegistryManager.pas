unit UnitRegistryManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, ComCtrls, ExtCtrls, UnitConnection, UnitUtils,
  UnitCommands, StdCtrls;

type
  TFormRegistryManager = class(TForm)
    tvKeys: TTreeView;
    spl1: TSplitter;
    stat1: TStatusBar;
    lvValues: TListView;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    N1: TMenuItem;
    D1: TMenuItem;
    R1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    D2: TMenuItem;
    il1: TImageList;
    pnl1: TPanel;
    edtPath: TEdit;
    R2: TMenuItem;
    R3: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvKeysDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure tvKeysChange(Sender: TObject; Node: TTreeNode);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure OnClientRead(Datas: string);
  end;

var
  FormRegistryManager: TFormRegistryManager;

implementation

{$R *.dfm}
           
constructor TFormRegistryManager.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormRegistryManager.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

//From Aero RAT source code
function FindNode(Text: string; tv: TTreeView; Node: TTreeNode): TTreeNode;
var
  i: Integer;
begin
  Result := nil;
  
  if Node = nil then
  begin
    for i := 0 to tv.Items.Count - 1 do
    if UpperCase(tv.Items[i].Text) = UpperCase(Text) then
    Result := tv.Items[i];
  end
  else
  begin
    for i := 0 to Node.Count - 1 do
    if UpperCase(Node.Item[i].Text) = UpperCase(Text) then
    Result := Node.Item[i];
  end;
end;

procedure TFormRegistryManager.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr, TmpStr1: string;
  TmpNode, TmpNode1: TTreeNode;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); 
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_REGISTRYMANAGER_ADD:
    begin
      TmpList := ParseString('|', Datas);
      i := Length(TmpList);

      if i = 3 then
      begin
        if TmpList[2] = 'N' then stat1.Panels.Items[0].Text := 'Failed to add key.' else
        begin
          tvKeys.Items.BeginUpdate;
          TmpStr := TmpList[0] + TmpList[1] + '\'; //set full registry path
          TmpNode := nil;

          while Pos('\', TmpStr) > 0 do //split path until get key name
          begin
            TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
            Delete(TmpStr, 1, Pos('\', TmpStr));

            TmpNode1 := FindNode(TmpStr1, tvKeys, TmpNode);

            if TmpNode1 <> nil then TmpNode1.Expand(False) else
            begin  //key name does not exist, create it
              if TmpStr1 = '' then Continue;
              TmpNode1 := tvKeys.Items.AddChild(TmpNode, TmpStr1);
              TmpNode1.ImageIndex := 0;
              TmpNode1.SelectedIndex := 0;
              TmpNode1.Expand(False);
            end;

            if TmpNode1.Parent <> nil then TmpNode1.Parent.Expand(False);
            TmpNode := TmpNode1;
            TmpNode.Expand(False);
          end;

          tvKeys.Items.EndUpdate;
          stat1.Panels.Items[0].Text := 'Key added successfully!';
        end;
      end
      else
      begin
        if TmpList[4] = 'N' then stat1.Panels.Items[0].Text := 'Failed to add value.' else
        begin
          lvValues.Items.BeginUpdate;
          
          TmpItem := lvValues.Items.Add;
          TmpItem.Caption := TmpList[1];
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);

          if (TmpList[2] = 'REG_DWORD') or (TmpList[0] = 'REG_BINARY') then
            TmpItem.ImageIndex := 2
          else TmpItem.ImageIndex := 1;

          lvValues.Items.EndUpdate;
          stat1.Panels.Items[0].Text := 'Value added successfully!';
        end;
      end;
    end;

    CMD_REGISTRYMANAGER_DELETE:
    begin
      TmpList := ParseString('|', Datas);
      i := Length(TmpList);

      if i = 2 then
      begin
        if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to delete value.' else
        begin
          lvValues.Items.BeginUpdate;
          for i := lvValues.Items.Count - 1 downto 0 do
          begin
            if lvValues.Items.Item[i].Caption <> TmpList[0] then Continue;
            lvValues.Items.Item[i].Delete;
          end;

          lvValues.Items.EndUpdate;
          stat1.Panels.Items[0].Text := 'Value deleted successfully!';
        end;
      end
      else
      begin
        if TmpList[2] = 'N' then stat1.Panels.Items[0].Text := 'Failed to delete key.' else
        begin
          tvKeys.Items.BeginUpdate;
          TmpStr := TmpList[0] + TmpList[1] + '\'; //set full registry path
          TmpNode := nil;

          while Pos('\', TmpStr) > 0 do //split path until get key name
          begin
            TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
            Delete(TmpStr, 1, Pos('\', TmpStr));
            TmpNode1 := FindNode(TmpStr1, tvKeys, TmpNode);
            if TmpStr1 = '' then Continue;
            TmpNode := TmpNode1;
          end;

          TmpNode.Delete;
          lvValues.Clear;
          tvKeys.Items.EndUpdate;
          stat1.Panels.Items[0].Text := 'Key deleted successfully!';
        end;
      end;
    end;

    CMD_REGISTRYMANAGER_KEYS:
    begin
      tvKeys.Selected.DeleteChildren;
      tvKeys.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
        Delete(Datas, 1, Pos('|', Datas));

        TmpNode := tvKeys.Items.AddChild(tvKeys.Selected, TmpStr);
        TmpNode.ImageIndex := 0;
        TmpNode.SelectedIndex := 0;
      end;

      tvKeys.Items.EndUpdate;
      tvKeys.Selected.Expanded := True;

      if tvKeys.Selected.Count > 0 then
        stat1.Panels.Items[0].Text := 'Registry keys listed successfully!'
      else stat1.Panels.Items[0].Text := 'Registry keys not found.';
    end;

    CMD_REGISTRYMANAGER_VALUES:
    begin
      lvValues.Clear;
      lvValues.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvValues.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);

        if (TmpList[0] = 'REG_DWORD') or (TmpList[0] = 'REG_BINARY') then
          TmpItem.ImageIndex := 2
        else TmpItem.ImageIndex := 1;
      end;

      lvValues.Items.EndUpdate;

      if lvValues.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Registry values listed successfully!'
      else stat1.Panels.Items[0].Text := 'Registry values not found.';
    end;
  end;
end;

procedure TFormRegistryManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormRegistryManager.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormRegistryManager.FormShow(Sender: TObject);
begin
  tvKeysChange(Sender, nil);
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;
        
//From Coolvibes RAT
function GetNodeRoot(Node: TTreeNode): string;
begin
  repeat
    Result := Node.Text + '\' + Result;
    Node := Node.Parent;
  until not Assigned(Node)
end;

procedure TFormRegistryManager.tvKeysChange(Sender: TObject;
  Node: TTreeNode);
begin
  if not Assigned(tvKeys.Selected) then Exit;
  edtPath.Text := GetNodeRoot(tvKeys.Selected);
  if edtPath.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_VALUES) + '|' + edtPath.Text);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.tvKeysDblClick(Sender: TObject);
begin
  if not Assigned(tvKeys.Selected) then Exit;     
  if edtPath.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_KEYS) + '|' + edtPath.Text);   
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.N1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tvKeys.Selected) then Exit;
  if edtPath.Text = '' then Exit;
  if not InputQuery('New key', 'Key name', TmpStr) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_ADD) + '|' + edtPath.Text + '|' + TmpStr + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.D1Click(Sender: TObject);  
var
  TmpStr, TmpStr1: string;
begin
  if not Assigned(tvKeys.Selected) then Exit;

  //avoid deleting root path by mistake
  if (edtPath.Text = 'HKEY_CLASSES_ROOT\') or (edtPath.Text = 'HKEY_CURRENT_USER\') or
    (edtPath.Text = 'HKEY_LOCAL_MACHINE\') or (edtPath.Text = 'HKEY_USERS\') or
    (edtPath.Text = 'HKEY_CURRENT_CONFIG\') or (edtPath.Text = '')
  then Exit;

  //get registry path and key name separately
  TmpStr := edtPath.Text;
  TmpStr1 := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
  Delete(TmpStr1, 1, LastDelimiter('\', TmpStr1));
  Delete(TmpStr, Pos(TmpStr1, TmpStr), Length(TmpStr));

  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_DELETE) + '|' + TmpStr + '|' + TmpStr1 + '|Y|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.R1Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_VALUES) + '|' + edtPath.Text);    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.R2Click(Sender: TObject); 
var
  TmpStr, TmpStr1: string;
begin
  if edtPath.Text = '' then Exit;
  if not InputQuery('New item', 'Item name', TmpStr) then Exit;
  if not InputQuery('New item', 'Item value', TmpStr1) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_ADD) + '|' +
    edtPath.Text + '|' + TmpStr + '|REG_SZ|' + TmpStr1 + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormRegistryManager.R3Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if edtPath.Text = '' then Exit;
  if not InputQuery('New item', 'Item name', TmpStr) then Exit;
  if not InputQuery('New item', 'Item value (in decimal)', TmpStr1) then Exit;
  TmpStr1 := IntToStr(StrToInt('$' + TmpStr1)); //from RegUtilsExemple by ErazerZ
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_ADD) + '|' +
    edtPath.Text + '|' + TmpStr + '|REG_DWORD|' + TmpStr1 + '|');
end;

procedure TFormRegistryManager.D2Click(Sender: TObject);
begin
  if not Assigned(lvValues.Selected) then Exit;
  if edtPath.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_REGISTRYMANAGER_DELETE) + '|' + edtPath.Text + '|' +
    lvValues.Selected.Caption + '|N|');
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

end.
