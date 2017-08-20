unit UnitTasksManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, UnitConnection, UnitUtils, UnitCommands;

type
  TFormTasksManager = class(TForm)
    stat1: TStatusBar;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lvProcess: TListView;
    pm1: TPopupMenu;
    il1: TImageList;
    R1: TMenuItem;
    N1: TMenuItem;
    K1: TMenuItem;
    lvWindows: TListView;
    pm2: TPopupMenu;
    R2: TMenuItem;
    N2: TMenuItem;
    S1: TMenuItem;
    C1: TMenuItem;
    C2: TMenuItem;
    S2: TMenuItem;
    lvServices: TListView;
    pm3: TPopupMenu;
    R3: TMenuItem;
    N3: TMenuItem;
    S3: TMenuItem;
    S4: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
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
  FormTasksManager: TFormTasksManager;

implementation

{$R *.dfm}
           
constructor TFormTasksManager.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormTasksManager.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormTasksManager.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); 
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_TASKSMANAGER_PROCESS:
    begin
      lvProcess.Clear;
      lvProcess.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvProcess.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);
        TmpItem.ImageIndex := 0;
      end;

      lvProcess.Items.EndUpdate;
      
      if lvProcess.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Running process listed successfully!'
      else stat1.Panels.Items[0].Text := 'Running process not found.';
    end;

    CMD_TASKSMANAGER_PROCESS_KILL:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to kill process.' else
      begin
        lvProcess.Items.BeginUpdate;
        for i := lvProcess.Items.Count - 1 downto 0 do
        begin
          if lvProcess.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvProcess.Items.Item[i].Delete;
        end;
                      
        lvProcess.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Process killed successfully!';
      end;
    end;

    CMD_TASKSMANAGER_SERVICES:
    begin
      lvServices.Clear;
      lvServices.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvServices.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);
        TmpItem.ImageIndex := 2;
      end;

      lvServices.Items.EndUpdate;
      
      if lvServices.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Running services listed successfully!'
      else stat1.Panels.Items[0].Text := 'Running services not found.';
    end;

    CMD_TASKSMANAGER_SERVICES_START:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to start service.' else
      begin
        lvServices.Items.BeginUpdate;

        for i := 0 to lvServices.Items.Count - 1 do
        begin
          if lvServices.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvServices.Items.Item[i].SubItems[0] := 'Running';
        end;

        lvServices.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Service started successfully!';
      end;
    end;
             
    CMD_TASKSMANAGER_SERVICES_STOP:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to stop service.' else
      begin
        lvServices.Items.BeginUpdate;

        for i := 0 to lvServices.Items.Count - 1 do
        begin
          if lvServices.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvServices.Items.Item[i].SubItems[0] := 'Stopped';
        end;

        lvServices.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Service stopped successfully!';
      end;
    end;

    CMD_TASKSMANAGER_WINDOWS:
    begin
      lvWindows.Clear;
      lvWindows.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvWindows.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);   
        TmpItem.SubItems.Add(TmpList[3]);
        TmpItem.ImageIndex := 1;
      end;

      lvWindows.Items.EndUpdate;

      if lvWindows.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Applications windows listed successfully!'
      else stat1.Panels.Items[0].Text := 'Applications windows list not found.';
    end;

    CMD_TASKSMANAGER_WINDOWS_CLOSE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to close window.' else
      begin
        lvWindows.Items.BeginUpdate;
        for i := lvWindows.Items.Count - 1 downto 0 do
        begin
          if lvWindows.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvWindows.Items.Item[i].Delete;
        end;

        lvWindows.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Window closed successfully!';
      end;
    end;

    CMD_TASKSMANAGER_WINDOWS_HIDE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to hide window.' else
      begin
        lvWindows.Items.BeginUpdate;

        for i := 0 to lvWindows.Items.Count - 1 do
        begin
          if lvWindows.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvWindows.Items.Item[i].SubItems[1] := 'No';
        end;

        lvWindows.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Window has been hidden successfully!';
      end;
    end;

    CMD_TASKSMANAGER_WINDOWS_SHOW:
    begin
       TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to show window.' else
      begin
        lvWindows.Items.BeginUpdate;

        for i := 0 to lvWindows.Items.Count - 1 do
        begin
          if lvWindows.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvWindows.Items.Item[i].SubItems[1] := 'Yes';
        end;

        lvWindows.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Window showed successfully!';
      end;
    end;

    CMD_TASKSMANAGER_WINDOWS_TITLE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[2] = 'N' then stat1.Panels.Items[0].Text := 'Failed to change window title.' else
      begin
        lvWindows.Items.BeginUpdate;

        for i := 0 to lvWindows.Items.Count - 1 do
        begin
          if lvWindows.Items.Item[i].Caption <> TmpList[0] then Continue;
          lvWindows.Items.Item[i].SubItems[0] := TmpList[1];
        end;

        lvWindows.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Window title changed successfully!';
      end;
    end;
  end;
end;

procedure TFormTasksManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormTasksManager.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormTasksManager.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
  R1.Click; //list running process on when showing window
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormTasksManager.R1Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_PROCESS) + '|');
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.K1Click(Sender: TObject);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_PROCESS_KILL) + '|' + lvProcess.Selected.Caption);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.S1Click(Sender: TObject);
begin
  S1.Checked := not S1.Checked;
end;

procedure TFormTasksManager.R2Click(Sender: TObject);
begin
  if S1.Checked then
    ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS) + '|Y')
  else ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS) + '|N');

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.S2Click(Sender: TObject);
begin
  if not Assigned(lvWindows.Selected) then Exit;
  if lvWindows.Selected.SubItems[1] = 'No' then
    ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS_SHOW) + '|' + lvWindows.Selected.Caption)
  else ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS_HIDE) + '|' + lvWindows.Selected.Caption);

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.C1Click(Sender: TObject);
begin
  if not Assigned(lvWindows.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS_CLOSE) + '|' + lvWindows.Selected.Caption);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.C2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvWindows.Selected) then Exit;
  if not InputQuery('Change title', 'New title', TmpStr) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_WINDOWS_TITLE) + '|' +
    lvWindows.Selected.Caption + '|' + TmpStr + '|');
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.R3Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_SERVICES) + '|');  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.S3Click(Sender: TObject);
begin
  if not Assigned(lvServices.Selected) then Exit;
  if lvServices.Selected.SubItems[0] = 'Running' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_SERVICES_START) + '|' + lvServices.Selected.Caption);  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormTasksManager.S4Click(Sender: TObject);
begin
  if not Assigned(lvServices.Selected) then Exit;    
  if lvServices.Selected.SubItems[0] = 'Stopped' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_TASKSMANAGER_SERVICES_STOP) + '|' + lvServices.Selected.Caption); 
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

end.
