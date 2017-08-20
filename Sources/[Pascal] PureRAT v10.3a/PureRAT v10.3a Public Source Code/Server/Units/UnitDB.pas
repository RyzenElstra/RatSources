unit UnitDB;

interface

uses
  Windows, SysUtils, Classes, UnitMain, UnitConstants, UnitEncryption, SocketUnitEx,
  UnitVariables, UnitFunctions, VirtualTrees, Forms, ComCtrls;

type
  TDBInfos = record
    CountryName, ImageIndex, OnConnectIdle, OnDisconnectIdle,
    User_Computer_Windows, Version, Uptime: string;
  end;

  PDBDatas = ^TDBDatas;
	TDBDatas = class
    DBClientId: string;
    DBInfos: TDBInfos;
    DBNode: PVirtualNode;
    DBRecords: TForm;
  end;

procedure LoadDBFile;
procedure LoadDBStatsFile;
procedure SaveDBDatas(Datas: string);
procedure SaveDBStats(ClientDatas: TClientDatas);
procedure SaveDBFile;
procedure SaveDBStatsFile;

implementation

var
  DBDatas: TDBDatas;
  DBGrid: TVirtualStringTree;    
           
function AddDBGroup(DBDatas: TDBDatas): PVirtualNode;
var
  TmpNode: PVirtualNode;
  DBDatasNew: TDBDatas;
begin
  Result := nil;
  TmpNode := DBGrid.GetFirst;

  while Assigned(TmpNode) do
  begin
    if (PDBDatas(DBGrid.GetNodeData(TmpNode))^.DBClientId = DBDatas.DBClientId) and
      (DBGrid.GetNodeLevel(TmpNode) = 0)
    then
    begin
      Result := TmpNode;
      Break;
    end
    else TmpNode := DBGrid.GetNext(TmpNode);
  end;

  if Result = nil then
  begin
    DBDatasNew := TDBDatas.Create;
    DBDatasNew.DBClientId := DBDatas.DBClientId;
    DBDatasNew.DBInfos.ImageIndex := DBDatas.DBInfos.ImageIndex;
    Result := DBGrid.AddChild(nil, DBDatasNew);
    DBGrid.Expanded[Result] := True;
    DBGrid.Refresh;
  end;
end;

procedure LoadDBFile;
var                
  DBDatas: TDBDatas; 
  TmpNode: PVirtualNode;
  TmpStr, TmpStr1: string;                       
  TmpList: TStringArray;
begin
  DBGrid := FormMain.vrtlstrngtr2;
  DBGrid.Clear;

  if FileExists(DBFile) = False then Exit;
  TmpStr := FileToStr(DBFile);
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);

  while Pos(#13#10, TmpStr) > 0 do
  begin
    Application.ProcessMessages;

    TmpStr1 := Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1);
    Delete(TmpStr, 1, Pos(#13#10, TmpStr));
    TmpList := ParseString('|', Trim(TmpStr1));

    DBDatas := TDBDatas.Create;
    DBDatas.DBRecords := nil;      
    DBDatas.DBClientId := TmpList[0];
    DBDatas.DBInfos.CountryName := TmpList[1];
    DBDatas.DBInfos.ImageIndex := TmpList[2];
    DBDatas.DBInfos.OnConnectIdle := TmpList[3];
    DBDatas.DBInfos.OnDisconnectIdle := TmpList[4];
    DBDatas.DBInfos.User_Computer_Windows := TmpList[5];
    DBDatas.DBInfos.Version := TmpList[6];
    DBDatas.DBInfos.Uptime := TmpList[7];

    TmpNode := AddDBGroup(DBDatas);
    DBDatas.DBNode := DBGrid.InsertNode(TmpNode, amAddChildFirst, DBDatas);
    if TmpNode.ChildCount > 0 then DBGrid.IsVisible[TmpNode] := True;
    if TmpNode.ChildCount = 1 then DBGrid.Expanded[TmpNode] := True;
  end;

  DBGrid.Refresh;
end;

procedure SaveDBDatas(Datas: string);
begin
  DBDatasList.Append(Datas);
end;                             

procedure SaveDBFile;
var
  DBBuffer: string;
begin
  try
    if DBDatasList.Text <> '' then
    begin
      if FileExists(DBFile) then
      begin
        DBBuffer := FileToStr(DBFile);
        DeleteFile(DBFile);
        DBBuffer := EnDecryptText(DBBuffer, PROGRAMPASSWORD);
      end;

      DBBuffer := DBBuffer + DBDatasList.Text;
      DBBuffer := EnDecryptText(DBBuffer, PROGRAMPASSWORD);
      MyCreateFile(DBFile, DBBuffer, Length(DBBuffer));
    end;
  finally
    DBDatasList.Free;
  end;
end;

procedure SaveDBStats(ClientDatas: TClientDatas);
var
  TmpItem: TListItem;
  TmpBool: Boolean;
  i, j: Integer;
begin
  TmpBool := False;

  if FormMain.lv2.Items.Count > 0 then
  for i := 0 to FormMain.lv2.Items.Count - 1 do
  begin
    if FormMain.lv2.Items.Item[i].Caption = ClientDatas.Infos.Windows then
    begin
      j := StrToInt(FormMain.lv2.Items.Item[i].SubItems[0]);
      FormMain.lv2.Items.Item[i].SubItems[0] := IntToStr(j + 1);
      TmpBool := True;
      Break;
    end;
  end;

  if not TmpBool then
  begin
    TmpItem := FormMain.lv2.Items.Add;
    TmpItem.Caption := ClientDatas.Infos.Windows;
    TmpItem.SubItems.Add('1');
    TmpItem.ImageIndex := -1;
  end;

  TmpBool := False;

  if FormMain.lv3.Items.Count > 0 then
  for i := 0 to FormMain.lv3.Items.Count - 1 do
  begin
    if FormMain.lv3.Items.Item[i].Caption = ClientDatas.CountryName then
    begin
      j := StrToInt(FormMain.lv3.Items.Item[i].SubItems[0]);
      FormMain.lv3.Items.Item[i].SubItems[0] := IntToStr(j + 1);
      TmpBool := True;
      Break;
    end;
  end;

  if not TmpBool then
  begin
    TmpItem := FormMain.lv3.Items.Add;
    TmpItem.Caption := ClientDatas.CountryName;
    TmpItem.SubItems.Add('1');
    TmpItem.ImageIndex := ClientDatas.ImageIndex;
  end;

  j := 0;
  for i := 0 to FormMain.lv2.Items.Count - 1 do
  j := j + StrToInt(FormMain.lv2.Items.Item[i].SubItems[0]);

  FormMain.lbl2.Caption := 'Total clients connected: ' + IntToStr(j);
end;

procedure SaveDBStatsFile;
var
  DBBuffer,
  TmpStr, TmpStr1: string;
  i: Integer;
begin
  if FormMain.lv2.Items.Count > 0 then
  for i := 0 to FormMain.lv2.Items.Count - 1 do
  begin
    TmpStr := TmpStr + FormMain.lv2.Items.Item[i].Caption + ':' +
      FormMain.lv2.Items.Item[i].SubItems[0] + ':|';
  end;

  if TmpStr = '' then Exit;
  TmpStr := TmpStr + #13#10;

  if FormMain.lv3.Items.Count > 0 then
  for i := 0 to FormMain.lv3.Items.Count - 1 do
  begin
    TmpStr1 := TmpStr1 + FormMain.lv3.Items.Item[i].Caption + ':' +
      FormMain.lv3.Items.Item[i].SubItems[0] + ':' +
      IntToStr(FormMain.lv3.Items.Item[i].ImageIndex) + ':|';
  end;

  if TmpStr1 = '' then Exit;
  TmpStr1 := TmpStr + TmpStr1;

  if FileExists(DBStatsFile) then
  begin
    DBBuffer := FileToStr(DBStatsFile);
    DeleteFile(DBStatsFile);
    DBBuffer := EnDecryptText(DBBuffer, PROGRAMPASSWORD);
  end;
  
  DBBuffer := DBBuffer + TmpStr1 + '_';
  DBBuffer := EnDecryptText(DBBuffer, PROGRAMPASSWORD);
  MyCreateFile(DBStatsFile, DBBuffer, Length(DBBuffer));
end;

procedure LoadDBStatsFile;
var
  TmpStr, TmpStr1,
  TmpStr2, TmpStr3: string;
  TmpList: TStringArray;
  TmpBool: Boolean;
  TmpItem: TListItem;
  i, j: Integer;
begin
  FormMain.lv4.Clear;
  FormMain.lv5.Clear;
  FormMain.lbl8.Caption := 'Total clients connected: 0';
  FormMain.cht1.Series[0].Clear;                              
  FormMain.cht2.Series[0].Clear;

  if FileExists(DBStatsFile) = False then Exit;
  
  TmpStr := FileToStr(DBStatsFile);
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);

  while Pos('_', TmpStr) > 0 do
  begin
    Application.ProcessMessages;

    TmpStr1 := Copy(TmpStr, 1, Pos('_', TmpStr) - 1);
    Delete(TmpStr, 1, Pos('_', TmpStr));

    TmpStr2 := Copy(TmpStr1, 1, Pos(#13#10, TmpStr1) - 1);
    Delete(TmpStr1, 1, Pos(#13#10, TmpStr1));

    while TmpStr2 <> '' do
    begin
      Application.ProcessMessages;

      TmpStr3 := Copy(TmpStr2, 1, Pos('|', TmpStr2) - 1);
      Delete(TmpStr2, 1, Pos('|', TmpStr2));
      TmpList := ParseString(':', TmpStr3);

      TmpBool := False;

      if FormMain.lv5.Items.Count > 0 then
      for i := 0 to FormMain.lv5.Items.Count - 1 do
      begin
        if FormMain.lv5.Items.Item[i].Caption = TmpList[0] then
        begin
          j := StrToInt(FormMain.lv5.Items.Item[i].SubItems[0]);
          FormMain.lv5.Items.Item[i].SubItems[0] := IntToStr(j + 1);
          TmpBool := True;
          Break;
        end;
      end;

      if not TmpBool then
      begin
        TmpItem := FormMain.lv5.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.ImageIndex := -1;
      end;
    end;

    while TmpStr1 <> '' do
    begin  
      Application.ProcessMessages;

      TmpStr2 := Copy(TmpStr1, 1, Pos('|', TmpStr1) - 1);
      Delete(TmpStr1, 1, Pos('|', TmpStr1));
      TmpList := ParseString(':', TmpStr2);

      TmpBool := False;

      if FormMain.lv4.Items.Count > 0 then
      for i := 0 to FormMain.lv4.Items.Count - 1 do
      begin
        if FormMain.lv4.Items.Item[i].Caption = TmpList[0] then
        begin
          j := StrToInt(FormMain.lv4.Items.Item[i].SubItems[0]);
          FormMain.lv4.Items.Item[i].SubItems[0] := IntToStr(j + 1);
          TmpBool := True;
          Break;
        end;
      end;

      if not TmpBool then
      begin
        TmpItem := FormMain.lv4.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.ImageIndex := StrToInt(TmpList[2]);
      end;
    end;
  end;

  j := 0;
  for i := 0 to FormMain.lv5.Items.Count - 1 do
  j := j + StrToInt(FormMain.lv5.Items.Item[i].SubItems[0]);

  FormMain.lbl8.Caption := 'Total clients connected: ' + IntToStr(j);
end;

end.
