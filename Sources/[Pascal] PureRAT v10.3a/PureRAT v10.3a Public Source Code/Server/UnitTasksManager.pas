unit UnitTasksManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, UnitMain,
  Menus, SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, ImgList,
  UnitConstants, UnitManager;

type
  TFormTasksManager = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn5: TToolButton;
    pb1: TProgressBar;
    pnlProcess: TPanel;
    lvProcess: TListView;
    pnlWindows: TPanel;
    lvWindows: TListView;
    pnlServices: TPanel;
    lvServices: TListView;
    pnlPrograms: TPanel;
    lvPrograms: TListView;
    pnlConnections: TPanel;
    lvConnections: TListView;
    pm5: TPopupMenu;
    R15: TMenuItem;
    N9: TMenuItem;
    C4: TMenuItem;
    K2: TMenuItem;
    pm3: TPopupMenu;
    S7: TMenuItem;
    S3: TMenuItem;
    S4: TMenuItem;
    E1: TMenuItem;
    I1: TMenuItem;
    U2: TMenuItem;
    pm4: TPopupMenu;
    U1: TMenuItem;
    S5: TMenuItem;
    pm2: TPopupMenu;
    O1: TMenuItem;
    N3: TMenuItem;
    S2: TMenuItem;
    H1: TMenuItem;
    C1: TMenuItem;
    S6: TMenuItem;
    C2: TMenuItem;
    N4: TMenuItem;
    C6: TMenuItem;
    pm1: TPopupMenu;
    S1: TMenuItem;
    R3: TMenuItem;
    K1: TMenuItem;
    L1: TMenuItem;
    N2: TMenuItem;
    C5: TMenuItem;
    ilIcons: TImageList;
    R1: TMenuItem;
    N1: TMenuItem;
    btn8: TToolButton;
    R2: TMenuItem;
    R4: TMenuItem;
    N5: TMenuItem;
    R5: TMenuItem;
    N6: TMenuItem;
    R6: TMenuItem;
    W1: TMenuItem;
    ilThumbs: TImageList;
    S8: TMenuItem;
    S9: TMenuItem;
    N7: TMenuItem;
    I2: TMenuItem;
    A1: TMenuItem;
    R7: TMenuItem;
    C3: TMenuItem;
    N8: TMenuItem;
    C7: TMenuItem;
    N10: TMenuItem;
    C8: TMenuItem;
    M1: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure lvProcessCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure lvProcessContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R3Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure lvWindowsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvWindowsCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure R2Click(Sender: TObject);
    procedure O1Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure C6Click(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure lvServicesContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvServicesCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure S3Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure U2Click(Sender: TObject);
    procedure lvProgramsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R5Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure S5Click(Sender: TObject);
    procedure lvConnectionsContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure lvConnectionsCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure R6Click(Sender: TObject);
    procedure R15Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure K2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure S8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure I2Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure R7Click(Sender: TObject);
    procedure lvProcessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvWindowsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvConnectionsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure C3Click(Sender: TObject);
    procedure lvProcessColumnClick(Sender: TObject; Column: TListColumn);
    procedure C7Click(Sender: TObject);
    procedure C8Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;        
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;   
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  end;

var
  FormTasksManager: TFormTasksManager;

implementation

uses
  UnitProcessModules, UnitEditService;

{$R *.dfm}
    
var
  LastColumn: TListColumn;
  Ascending: Boolean;
      
constructor TFormTasksManager.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                             
procedure TFormTasksManager.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormTasksManager.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormTasksManager.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormTasksManager.btn1Click(Sender: TObject);
begin
  pnlProcess.BringToFront;
  if lvProcess.Items.Count = 0 then R1Click(Sender);
end;

procedure TFormTasksManager.btn2Click(Sender: TObject);
begin
  pnlWindows.BringToFront;
  if lvWindows.Items.Count = 0 then R2Click(Sender);
end;

procedure TFormTasksManager.btn3Click(Sender: TObject);
begin
  pnlServices.BringToFront;
  if lvServices.Items.Count = 0 then R4Click(Sender);
end;

procedure TFormTasksManager.btn4Click(Sender: TObject);
begin
  pnlPrograms.BringToFront;
  if lvPrograms.Items.Count = 0 then R5Click(Sender);
end;

procedure TFormTasksManager.btn5Click(Sender: TObject);
begin
  pnlConnections.BringToFront;
  if lvConnections.Items.Count = 0 then R6Click(Sender);
end;

function ParseDate(DateStr: string): string;
var
  Str, Year, Month: string;
begin
  Result := '-/-/-';
  if DateStr = '' then Exit;
  Str := DateStr;
  Year := Copy(Str, 1, 4);
  Delete(Str, 1, 4);
  Month := Copy(Str, 1, 2);
  Delete(Str, 1, 2);
  Result := Year + '/' + Month + '/' + Str;
end;

procedure TFormTasksManager.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpStr, TmpStr1: string;
  TmpInt, i: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpForm: TFormProcessModules;  
  Stream: TMemoryStream;   
  Jpg: TJPEGImage;
  Bmp: TBitmap;
begin
  inherited;

  if Msg.Msg = WM_SHOW_MODULESFORM then
  begin
    TmpStr := string(Msg.WParam);
    TmpForm := TFormProcessModules.Create(Self, TmpStr);
    TmpForm.Show;
  end;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas)-1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = PROCESS then
    begin
      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSLIST then
      begin
        Delete(Datas, 1, Pos('|', Datas));

        lvProcess.Clear;

        pb1.Max := StringCount(#13#10, Datas);
        pb1.Position := 0;                            
                          
        lvProcess.Items.BeginUpdate;
      
        while Datas <> '' do
        begin                         
          Self.Refresh;
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;
        
          TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
          Delete(Datas, 1, Pos(#13#10, Datas) + 1);

          TmpList := ParseString('|', TmpStr);

          TmpItem := lvProcess.Items.Add;
          if TmpList[0] = Client.Infos.PID then TmpItem.Data := TObject(clRed);
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.SubItems.Add(FileSizeToStr(StrToInt(FloatToStr(StrToFloat(TmpList[5])))));
          TmpItem.SubItems.Add(TmpList[6]);
          TmpItem.SubItems.Add(TmpList[7]);

          if FileExists(TmpItem.SubItems.Strings[6]) = True then
            TmpItem.ImageIndex := GetImageIndex(TmpItem.SubItems.Strings[6])
          else TmpItem.ImageIndex := GetImageIndex('*' + ExtractFileExt(TmpItem.SubItems.Strings[0]));
        end;            

        lvProcess.Items.EndUpdate;
        AddRecvLog(IntToStr(lvProcess.Items.Count) + ' running process found');
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSKILL then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to kill process ' + TmpStr, clRed)
        else
        begin
          lvProcess.Items.BeginUpdate;
          for i := 0 to lvProcess.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvProcess.Items.Item[i].Caption = TmpStr then
            begin
              lvProcess.Items.Item[i].Delete;
              Break;
            end;
          end;

          lvProcess.Items.EndUpdate;
          AddRecvLog('Process ' + TmpStr + ' killed successfully');
        end;
      end
      else
    
      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSLISTMODULES then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        for i := 0 to lvProcess.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvProcess.Items.Item[i].Caption = TmpStr then
          begin
            TmpStr1 := lvProcess.Items.Item[i].SubItems[0];
            Break;
          end;
        end;

        if Datas = '' then Exit;
        TmpStr := TmpStr1 + #13#10 + Datas;
        SendMessage(Handle, WM_SHOW_MODULESFORM, Integer(TmpStr), 0);
        AddRecvLog('Process ' + TmpStr1 + ' modules listed');
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSSUSPEND then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to suspend process ' + TmpStr, clRed)
        else
        begin
          lvProcess.Items.BeginUpdate;
          for i := 0 to lvProcess.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvProcess.Items.Item[i].Caption = TmpStr then
            begin
              lvProcess.Items.Item[i].Data := TObject(clGray);
              lvProcess.Items.Item[i].Cut := True;
            end;
          end;

          lvProcess.Items.EndUpdate;
          AddRecvLog('Process ' + TmpStr + ' suspended successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSRESUME then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to resume process ' + TmpStr, clRed)
        else
        begin
          lvProcess.Items.BeginUpdate;
          for i := 0 to lvProcess.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvProcess.Items.Item[i].Caption = TmpStr then
            begin
              lvProcess.Items.Item[i].Data := TObject(clBlack);
              lvProcess.Items.Item[i].Cut := False;
            end;
          end;

          lvProcess.Items.EndUpdate;
          AddRecvLog('Process ' + TmpStr + ' resumed successfully');
        end;
      end
      else
      
      if Copy(Datas, 1, Pos('|', Datas)-1) = PROCESSSETPRIORITY then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to set process ' + TmpStr + ' priority', clRed)
        else
        begin
          lvProcess.Items.BeginUpdate;
          for i := 0 to lvProcess.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvProcess.Items.Item[i].Caption = TmpStr then
            lvProcess.Items.Item[i].SubItems[4] := TmpStr1;
          end;

          lvProcess.Items.EndUpdate;
          AddRecvLog('Process ' + TmpStr + ' priority set to ' + TmpStr1);
        end;
      end;
    end
    else

    if MainCommand = UnitCommands.WINDOWS then
    begin
      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSLIST then
      begin
        Delete(Datas, 1, Pos('|', Datas));

        lvWindows.Clear;
        lvWindows.ViewStyle := vsReport;

        pb1.Max := StringCount(#13#10, Datas);
        pb1.Position := 0;

        lvWindows.Items.BeginUpdate;

        while Datas <> '' do
        begin                          
          Self.Refresh;
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;

          TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
          Delete(Datas, 1, Pos(#13#10, Datas) + 1);

          TmpList := ParseString('|', TmpStr);

          TmpItem := lvWindows.Items.Add;
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);

          if TmpList[2] = 'No' then
          begin
            TmpItem.Data := TObject(clGray);
            TmpItem.Cut := True;
          end;

          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);
          if TmpList[4] = Client.Infos.PID then TmpItem.Data := TObject(clRed);
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.SubItems.Add(TmpList[5]);

          if FileExists(TmpItem.SubItems.Strings[4]) = True then
            TmpItem.ImageIndex := GetImageIndex(TmpItem.SubItems.Strings[4])
          else TmpItem.ImageIndex := GetImageIndex('*' + ExtractFileExt(TmpItem.SubItems.Strings[4]));
        end;

        lvWindows.Items.EndUpdate;
        AddRecvLog(IntToStr(lvWindows.Items.Count) + ' windows found');
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSSHOW then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to show window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            begin
              lvWindows.Items.Item[i].SubItems[1] := 'Yes';
              lvWindows.Items.Item[i].Data := TObject(clBlack);
              lvWindows.Items.Item[i].Cut := False;
            end;
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' showed successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSHIDE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to hide window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            begin
              lvWindows.Items.Item[i].SubItems[1] := 'No';
              lvWindows.Items.Item[i].Data := TObject(clGray);
              lvWindows.Items.Item[i].Cut := True;
            end;
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' has been hidden successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSCLOSE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));
                 
        if Datas = 'N' then
          AddRecvLog('Failed to close window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            begin
              lvWindows.Items.Item[i].Delete;
              Break;
            end;
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' closed successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSTITLE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr1 := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));
                      
        if TmpStr1 = 'N' then
          AddRecvLog('Failed to change window ' + TmpStr + ' title by ' + Datas, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            lvWindows.Items.Item[i].Caption := Datas;
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' title changed by ' + Datas);
        end;
      end
      else
      
      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSMAXIMIZE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to maximize window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            lvWindows.Items.Item[i].SubItems[0] := 'Maximized';
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' maximized successfully');
        end;
      end
      else
      
      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSMINIMIZE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to minimize window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            lvWindows.Items.Item[i].SubItems[0] := 'Minimized';
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' minimized successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = WINDOWSRESTORE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to restore window ' + TmpStr, clRed)
        else
        begin
          lvWindows.Items.BeginUpdate;
          for i := 0 to lvWindows.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
            lvWindows.Items.Item[i].SubItems[0] := 'Normal';
          end;

          lvWindows.Items.EndUpdate;
          AddRecvLog('Window ' + TmpStr + ' restored successfully');
        end;
      end;
    end
    else

    if MainCommand = SERVICES then
    begin
      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESLIST then
      begin
        Delete(Datas, 1, Pos('|', Datas));

        lvServices.Clear;

        pb1.Max := StringCount(#13#10, Datas);
        pb1.Position := 0;

        lvServices.Items.BeginUpdate;

        while Datas <> '' do
        begin                   
          Self.Refresh;
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;
                          
          TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
          Delete(Datas, 1, Pos(#13#10, Datas) + 1);

          TmpList := ParseString('|', TmpStr);

          TmpItem := lvServices.Items.Add;
          TmpItem.Caption := TmpList[0];

          if TmpList[1] = 'Stopped' then
          begin
            TmpItem.Data := TObject(clGray);
            TmpItem.Cut := True;
          end;

          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.ImageIndex := 0;
        end;

        lvServices.Items.EndUpdate;
        AddRecvLog(IntToStr(lvServices.Items.Count) + ' running services found');
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESSTOP then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to stop service ' + TmpStr, clRed)
        else
        begin
          lvServices.Items.BeginUpdate;
          for i := 0 to lvServices.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvServices.Items.Item[i].Caption = TmpStr then
            begin
              lvServices.Items.Item[i].Data := TObject(clGray);
              lvServices.Items.Item[i].Cut := True;
              lvServices.Items.Item[i].SubItems[0] := 'Stopped';
            end;
          end;

          lvServices.Items.EndUpdate;
          AddRecvLog('Service ' + TmpStr + ' stopped successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESSTART then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to start service ' + TmpStr, clRed)
        else
        begin
          lvServices.Items.BeginUpdate;
          for i := 0 to lvServices.Items.Count-1 do
          begin
            Application.ProcessMessages;
            if lvServices.Items.Item[i].Caption = TmpStr then
            begin
              lvServices.Items.Item[i].Data := TObject(clBlack);
              lvServices.Items.Item[i].Cut := False;
              lvServices.Items.Item[i].SubItems[0] := 'Running';
            end;
          end;

          lvServices.Items.EndUpdate;     
          AddRecvLog('Service ' + TmpStr + ' started successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESINSTALL then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to install service ' + TmpStr, clRed)
        else
        begin
          AddRecvLog('Service ' + TmpStr + ' installed successfully');
          R4.Click;
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESUNINSTALL then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to uninstall service ' + TmpStr, clRed)
        else
        begin
          lvServices.Items.BeginUpdate;
          for i := 0 to lvServices.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvServices.Items.Item[i].Caption = TmpStr then
            begin
              lvServices.Items.Item[i].Delete;
              Break;
            end;
          end;

          lvServices.Items.EndUpdate;
          AddRecvLog('Service ' + TmpStr + ' uninstalled successfully');
        end;
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = SERVICESEDIT then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpList := ParseString('|', Datas);

        if TmpList[1] = 'N' then
          AddRecvLog('Failed to edit service ' + TmpList[0], clRed)
        else
        begin
          lvServices.Items.BeginUpdate;
          for i := 0 to lvServices.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvServices.Items.Item[i].Caption = TmpList[0] then
            begin
              lvServices.Items.Item[i].Caption := TmpList[2];
              lvServices.Items.Item[i].SubItems[1] := TmpList[3];
              lvServices.Items.Item[i].SubItems[2] := TmpList[4];
            end;
          end;

          lvServices.Items.EndUpdate;
          AddRecvLog('Service ' + TmpList[0] + ' edited successfully');
        end;
      end;
    end
    else

    if MainCommand = PROGRAMS then
    begin
      if Copy(Datas, 1, Pos('|', Datas)-1) = PROGRAMSLIST then
      begin
        Delete(Datas, 1, Pos('|', Datas));

        lvPrograms.Clear;

        pb1.Max := StringCount(#13#10, Datas);
        pb1.Position := 0;

        lvPrograms.Items.BeginUpdate;

        while Datas <> '' do
        begin                    
          Self.Refresh;
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;

          TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
          Delete(Datas, 1, Pos(#13#10, Datas) + 1);

          TmpList := ParseString('|', TmpStr);

          TmpItem := lvPrograms.Items.Add;
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(FileSizeToStr(StrToInt(TmpList[2])));
          TmpItem.SubItems.Add(ParseDate(TmpList[3]));
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.SubItems.Add(TmpList[5]);  
          TmpItem.SubItems.Add(TmpList[6]);
          TmpItem.ImageIndex := 1;
        end;

        lvPrograms.Items.EndUpdate;
        AddRecvLog(IntToStr(lvPrograms.Items.Count) + ' installed programs found');
      end;
    end
    else

    if MainCommand = ACTIVECONNECTIONS then
    begin
      if Copy(Datas, 1, Pos('|', Datas)-1) = ACTIVECONNECTIONSLIST then
      begin
        Delete(Datas, 1, Pos('|', Datas));

        lvConnections.Clear;

        pb1.Max := StringCount(#13#10, Datas);
        pb1.Position := 0;

        lvConnections.Items.BeginUpdate;
			
        while Datas <> '' do
        begin                    
          Self.Refresh;
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;
                                   
          TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
          Delete(Datas, 1, Pos(#13#10, Datas) + 1);

          TmpList := ParseString('|', TmpStr);

          TmpItem := lvConnections.Items.Add;
          if TmpList[0] = Client.Infos.PID then TmpItem.Data := TObject(clRed);
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.SubItems.Add(TmpList[5]);
          TmpItem.SubItems.Add(TmpList[6]);

          if FileExists(TmpItem.SubItems.Strings[5]) = True then
            TmpItem.ImageIndex := GetImageIndex(TmpItem.SubItems.Strings[5])
          else TmpItem.ImageIndex := GetImageIndex('*' + ExtractFileExt(TmpItem.SubItems.Strings[0]));
        end;

        lvConnections.Items.EndUpdate;
        AddRecvLog(IntToStr(lvConnections.Items.Count) + ' active connections found');
      end
      else

      if Copy(Datas, 1, Pos('|', Datas)-1) = ACTIVECONNECTIONSCLOSE then
      begin
        Delete(Datas, 1, Pos('|', Datas));
        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        if Datas = 'N' then
          AddRecvLog('Failed to close active connection ' + TmpStr, clRed)
        else
        begin
          lvConnections.Items.BeginUpdate;
          for i := 0 to lvConnections.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvConnections.Items.Item[i].Caption = TmpStr then
            lvConnections.Items.Item[i].SubItems[4] := 'CLOSING';
          end;

          lvConnections.Items.EndUpdate;
          AddRecvLog('Active connection ' + TmpStr + ' closed successfully');
        end;
      end;
    end
    else

    if MainCommand = WINDOWSTHUMBNAILS then
    begin
      if lvWindows.ViewStyle = vsReport then lvWindows.ViewStyle := vsIcon;
                                             
      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      AddRecvLog('Window image stream of size ' + FileSizeToStr(Stream.Size));

      try
        Jpg := TJPEGImage.Create;
        Jpg.LoadFromStream(Stream);
        Stream.Free;
        Bmp := TBitmap.Create;
        Bmp.Width := Jpg.Width;
        Bmp.Height := Jpg.Height;
        Bmp.Canvas.Draw(0, 0, Jpg);
        Jpg.Free;
      except
        Stream.Free;
        Jpg.Free;
        Bmp.Free;
        Exit;
      end;

      for i := 0 to lvWindows.Items.Count - 1 do
      begin
        if lvWindows.Items.Item[i].SubItems[2] = TmpStr then
        lvWindows.Items.Item[i].ImageIndex := ilThumbs.Add(Bmp, nil);
      end;

      Bmp.Free;
    end;
  end;
end;

procedure TFormTasksManager.lvProcessCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormTasksManager.FormCreate(Sender: TObject);
begin
  lvProcess.SmallImages := FormMain.ImagesList;
  lvWindows.SmallImages := FormMain.ImagesList;
  lvConnections.SmallImages := FormMain.ImagesList;
end;

procedure TFormTasksManager.lvProcessContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvProcess.Selected) then
  begin
    for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := False;
    pm1.Items[0].Enabled := True;
    pm1.Items[7].Enabled := True;
  end
  else
  begin
    for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := True;
    if lvProcess.Selected.Cut = True then
    begin
      pm1.Items[2].Enabled := False;
      pm1.Items[3].Enabled := True;
    end
    else
    begin
      pm1.Items[2].Enabled := True;
      pm1.Items[3].Enabled := False
    end;
  end;
end;

procedure TFormTasksManager.R1Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSLIST + '|');
  AddSentLog('Get running process list');
end;

procedure TFormTasksManager.S1Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSSUSPEND + '|' + lvProcess.Selected.Caption);
  AddSentLog('Suspend process ' + lvProcess.Selected.Caption);
end;

procedure TFormTasksManager.R3Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSRESUME + '|' + lvProcess.Selected.Caption);
  AddSentLog('Resume process ' + lvProcess.Selected.Caption);
end;

procedure TFormTasksManager.K1Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSKILL + '|' + lvProcess.Selected.Caption);
  AddSentLog('Kill process ' + lvProcess.Selected.Caption);
end;

procedure TFormTasksManager.L1Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSLISTMODULES + '|' + lvProcess.Selected.Caption);  
  AddSentLog('Get loaded modules list of process ' + lvProcess.Selected.Caption);
end;

procedure TFormTasksManager.C5Click(Sender: TObject);
begin
  SetClipboardText(lvProcess.Selected.SubItems[5]);
  AddLog('Process path ' + lvProcess.Selected.SubItems[5] + ' copied to clipboard');
end;

procedure TFormTasksManager.lvWindowsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvWindows.Selected) then
  begin
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := False;
    pm2.Items[0].Enabled := True;
    pm2.Items[1].Enabled := True;
    if O1.Checked then pm2.Items[9].Enabled := True;
  end
  else
  begin
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := True;

    if not O1.Checked then pm2.Items[9].Enabled := False;
    if lvWindows.Selected.Cut = True then pm2.Items[4].Enabled := False else
      pm2.Items[4].Enabled := True;
  end;
end;

procedure TFormTasksManager.lvWindowsCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormTasksManager.R2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if O1.Checked then TmpStr := WINDOWSLIST + '|Y' else TmpStr := WINDOWSLIST + '|N';
  Client.SendDatas(TmpStr);
  AddSentLog('Get windows list');
end;

procedure TFormTasksManager.O1Click(Sender: TObject);
begin
  O1.Checked := not O1.Checked;
end;

procedure TFormTasksManager.S2Click(Sender: TObject);
begin
  if lvWindows.Selected.SubItems[1] = 'No' then
  begin
    Client.SendDatas(WINDOWSSHOW + '|' + lvWindows.Selected.SubItems[2]);
    AddSentLog('Show window ' + lvWindows.Selected.SubItems[2]);
  end
  else
  begin
    if lvWindows.Selected.SubItems[0] = 'Minimized' then
    begin
      Client.SendDatas(WINDOWSRESTORE + '|' + lvWindows.Selected.SubItems[2]);
      AddSentLog('Restore window ' + lvWindows.Selected.SubItems[2]);
    end;
  end;
end;

procedure TFormTasksManager.H1Click(Sender: TObject);
begin
  Client.SendDatas(WINDOWSHIDE + '|' + lvWindows.Selected.SubItems[2]);
  AddSentLog('Hide window ' + lvWindows.Selected.SubItems[2]);
end;

procedure TFormTasksManager.C1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := InputBox('Change window title', 'New title', '');
  Client.SendDatas(WINDOWSTITLE + '|' + lvWindows.Selected.SubItems[2] + '|' + TmpStr);
  AddSentLog('Change window ' + lvWindows.Selected.SubItems[2] + ' title by ' + TmpStr);
end;

procedure TFormTasksManager.S6Click(Sender: TObject);
var
  Tmpstr: string;
  Shaketime: Integer;
begin
  if not InputQuery('Shake window', 'Shaking time (100 to 5000 ms)', Tmpstr) then Exit;
  if TryStrToInt(Tmpstr, Shaketime) = False then Exit;
  
  if (Shaketime >= 100) and (Shaketime <= 5000) then
  Client.SendDatas(WINDOWSSHAKE + '|' + lvWindows.Selected.SubItems[2] + '|' + IntToStr(Shaketime));
  AddSentLog('Shake window ' + lvWindows.Selected.SubItems[2] + ' for ' + IntToStr(Shaketime) + ' ms');
end;

procedure TFormTasksManager.C2Click(Sender: TObject);
begin
  Client.SendDatas(WINDOWSCLOSE + '|' + lvWindows.Selected.SubItems[2]);
  AddSentLog('Close window ' + lvWindows.Selected.SubItems[2]);
end;

procedure TFormTasksManager.C6Click(Sender: TObject);
begin
  SetClipboardText(lvWindows.Selected.SubItems[4]);
  AddLog('Windows process path ' + lvWindows.Selected.SubItems[4] + ' copied to clipoard');
end;
    
procedure TFormTasksManager.lvServicesContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvServices.Selected) then
  begin
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := False;
    pm3.Items[0].Enabled := True;
    pm3.Items[4].Enabled := True;
  end
  else
  begin
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := True;
    if lvServices.Selected.Cut = True then
    begin
      pm3.Items[2].Items[0].Enabled := True;
      pm3.Items[2].Items[1].Enabled := False;
    end
    else
    begin
      pm3.Items[2].Items[0].Enabled := False;
      pm3.Items[2].Items[1].Enabled := True;
    end;
  end;
end;
     
procedure TFormTasksManager.lvServicesCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormTasksManager.R4Click(Sender: TObject);
begin
  Client.SendDatas(SERVICESLIST + '|');
  AddSentLog('Get running services list');
end;

procedure TFormTasksManager.S3Click(Sender: TObject);
begin
  Client.SendDatas(SERVICESSTART + '|' + lvServices.Selected.Caption);
  AddSentLog('Start service ' + lvServices.Selected.Caption);
end;

procedure TFormTasksManager.S4Click(Sender: TObject);
begin
  Client.SendDatas(SERVICESSTOP + '|' + lvServices.Selected.Caption); 
  AddSentLog('Stop service ' + lvServices.Selected.Caption);
end;
            
function ServiceStartupCode(Startup: string): Integer;
begin
  if Startup = 'Automatic' then Result := 2 else
  if Startup = 'Manual' then Result := 3 else
  if Startup = 'Disable' then Result := 4 else Result := -1;
end;

procedure TFormTasksManager.E1Click(Sender: TObject);
var
  TmpForm: TFormEditService;
begin
  TmpForm := TFormEditService.Create(Application);
  TmpForm.edtName.Text := lvServices.Selected.Caption;
  TmpForm.edtFilename.Text := lvServices.Selected.SubItems[3];
  TmpForm.edtDescription.Text := lvServices.Selected.SubItems[2];
  TmpForm.cbbStartup.ItemIndex := ServiceStartupCode(lvServices.Selected.SubItems[1]) - 2;

  if TmpForm.ShowModal = mrOK then
  begin
    Client.SendDatas(SERVICESEDIT + '|' + TmpForm.edtName.Text + '|' + TmpForm.edtFilename.Text + '|' +
      TmpForm.edtDescription.Text + '|' + TmpForm.cbbStartup.Items.Text);
    AddSentLog('Edit service ' + lvServices.Selected.Caption);
  end;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormTasksManager.I1Click(Sender: TObject);
var
  TmpForm: TFormEditService;
begin
  TmpForm := TFormEditService.Create(Application);
  TmpForm.edtName.Text := 'PureRAT';
  TmpForm.edtFilename.Text := '_PureRAT.exe';
  TmpForm.edtDescription.Text := 'Pure Remote Administration Tool. Coded by wrh1d3';
  TmpForm.cbbStartup.ItemIndex := 0;

  if TmpForm.ShowModal = mrOK then
  begin
    Client.SendDatas(SERVICESINSTALL + '|' + TmpForm.edtName.Text + '|' + TmpForm.edtFilename.Text + '|' +
      TmpForm.edtDescription.Text + '|' + TmpForm.cbbStartup.Items.Text);  
    AddSentLog('Install service with name ' + lvServices.Selected.Caption);
  end;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormTasksManager.U2Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Are you sure you want to uninstall service "' +
    lvServices.Selected.Caption + '"?'), PROGRAMINFOS, MB_ICONWARNING + MB_YESNOCANCEL) <> IDYES
  then Exit;

  Client.SendDatas(SERVICESUNINSTALL + '|' + lvServices.Selected.Caption);    
    AddSentLog('Uninstall service ' + lvServices.Selected.Caption);
end;

procedure TFormTasksManager.lvProgramsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvPrograms.Selected) then
  begin
    for i := 0 to pm4.Items.Count - 1 do pm4.Items[i].Enabled := False;
    pm4.Items[0].Enabled := True;
  end
  else
  begin
    for i := 0 to pm4.Items.Count - 1 do pm4.Items[i].Enabled := True;
    if lvPrograms.Selected.SubItems[4] <> ''  then
      pm4.Items[3].Enabled := True
    else pm4.Items[3].Enabled := False;
  end;
end;
    
procedure TFormTasksManager.R5Click(Sender: TObject);
begin
  Client.SendDatas(PROGRAMSLIST + '|');
  AddSentLog('Get installed programs list');
end;

procedure TFormTasksManager.U1Click(Sender: TObject);
begin
  Client.SendDatas(PROGRAMSUNINSTALL + '|' + lvPrograms.Selected.SubItems[4]);
  AddSentLog('Uninstall program ' + lvPrograms.Selected.Caption + ' with command ' + lvPrograms.Selected.SubItems[4]);
end;

//From XtremeRAT
procedure ParseInstaller(Data: string; var path: string; var param: string);
var
  exe: string;
  p: integer;
begin
  if Copy(Data, 1, 1) <> '"' then
  begin
    Path := Data;
    Param := '';
    exit;
  end;

  Delete(Data, 1, 1);
  p := Pos('"', Data);
  Path := Copy(Data, 1, p - 1);
  Delete(Data, 1, p + 1);
  Param := Data;
end;

procedure TFormTasksManager.S5Click(Sender: TObject);
var
  Path, Params: string;
begin
  ParseInstaller(lvPrograms.Selected.SubItems[5], Path, Params);
  Client.SendDatas(PROGRAMSSILENTUNINSTALL + '|' + Path + '|' + Params);    
  AddSentLog('Uninstall program ' + lvPrograms.Selected.Caption + ' silently with command ' + lvPrograms.Selected.SubItems[5]);
end;

procedure TFormTasksManager.lvConnectionsContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvConnections.Selected) then
  begin
    for i := 0 to pm5.Items.Count - 1 do pm5.Items[i].Enabled := False;
    pm5.Items[0].Enabled := True;
    pm5.Items[1].Enabled := True;
  end
  else for i := 0 to pm5.Items.Count - 1 do pm5.Items[i].Enabled := True;
end;

procedure TFormTasksManager.lvConnectionsCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormTasksManager.R6Click(Sender: TObject);
var
  TmpStr: string;
begin
  if R15.Checked then TmpStr := ACTIVECONNECTIONSLIST + '|Y' else
    TmpStr := ACTIVECONNECTIONSLIST + '|N';
  Client.SendDatas(TmpStr);
  AddSentLog('Get active connections list');
end;

procedure TFormTasksManager.R15Click(Sender: TObject);
begin
  R15.Checked := not R15.Checked;
end;

procedure TFormTasksManager.C4Click(Sender: TObject);
begin
  Client.SendDatas(ACTIVECONNECTIONSCLOSE + '|' + lvConnections.Selected.Caption + '|' +
    lvConnections.Selected.SubItems[2] + '|' + lvConnections.Selected.SubItems[3] + '|');
  AddSentLog('Close active connection with PID ' + lvConnections.Selected.Caption);
end;

procedure TFormTasksManager.K2Click(Sender: TObject);
begin
  Client.SendDatas(PROCESSKILL + '|' + lvConnections.Selected.Caption);
  AddSentLog('Kill process ' + lvConnections.Selected.Caption);
end;

procedure TFormTasksManager.FormShow(Sender: TObject);
begin
  btn1.Click;
end;

procedure TFormTasksManager.W1Click(Sender: TObject);
var
  TmpStr: string;
  i: Integer;
begin
  for i := lvWindows.Items.Count - 1 downto 0 do
  begin
    Application.Processmessages;
    if (lvWindows.Items.Item[i].Cut = True) or (lvWindows.Items.Item[i].SubItems[0] = 'Minimized')
    then lvWindows.Items[i].Delete;
  end;

  for i := 0 to lvWindows.Items.Count - 1 do
  TmpStr := TmpStr + lvWindows.Items.Item[i].SubItems[2] + '|';
  if TmpStr <> '' then Client.SendDatas(WINDOWSTHUMBNAILS + '|' + TmpStr);

  ilThumbs.Clear;
  ilThumbs.Width := 680;
  ilThumbs.Height := 350;
  lvWindows.ViewStyle := vsIcon;   

  AddSentLog('Get images preview of visible windows');
end;

procedure TFormTasksManager.S8Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := InputBox('Send keys', 'Type keys', '');
  Client.SendDatas(WINDOWSKEYS + '|' + lvWindows.Selected.Caption + '|' + TmpStr);
  AddSentLog('Set windows ' + lvWindows.Selected.SubItems[2] + ' keys to ' + TmpStr);
end;

procedure TFormTasksManager.N7Click(Sender: TObject);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  if lvProcess.Selected.SubItems[4] = N7.Caption then Exit;
  Client.SendDatas(PROCESSSETPRIORITY + '|' + lvProcess.Selected.Caption + '|' + N7.Caption);
  AddSentLog('Set process ' + lvProcess.Selected.Caption + ' priority to ' + N7.Caption);
end;

procedure TFormTasksManager.I2Click(Sender: TObject);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  if lvProcess.Selected.SubItems[4] = I2.Caption then Exit;
  Client.SendDatas(PROCESSSETPRIORITY + '|' + lvProcess.Selected.Caption + '|' + I2.Caption); 
  AddSentLog('Set process ' + lvProcess.Selected.Caption + ' priority to ' + I2.Caption);
end;

procedure TFormTasksManager.A1Click(Sender: TObject);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  if lvProcess.Selected.SubItems[4] = A1.Caption then Exit;
  Client.SendDatas(PROCESSSETPRIORITY + '|' + lvProcess.Selected.Caption + '|' + A1.Caption);  
  AddSentLog('Set process ' + lvProcess.Selected.Caption + ' priority to ' + A1.Caption);
end;

procedure TFormTasksManager.R7Click(Sender: TObject);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  if lvProcess.Selected.SubItems[4] = R7.Caption then Exit;
  Client.SendDatas(PROCESSSETPRIORITY + '|' + lvProcess.Selected.Caption + '|' + R7.Caption); 
  AddSentLog('Set process ' + lvProcess.Selected.Caption + ' priority to ' + R7.Caption);
end;

procedure TFormTasksManager.lvProcessKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not Assigned(lvProcess.Selected) then Exit;
  if Key = VK_DELETE then K1Click(K1);
end;

procedure TFormTasksManager.lvWindowsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not Assigned(lvWindows.Selected) then Exit;
  if Key = VK_DELETE then C2Click(C2);
end;

procedure TFormTasksManager.lvConnectionsKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not Assigned(lvConnections.Selected) then Exit;
  if Key = VK_DELETE then C4Click(C4);
end;

procedure TFormTasksManager.C3Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := InputBox('Create new process', 'Process name', '');
  Client.SendDatas(EXECUTESHELLCOMMAND + '|start ' + TmpStr);
  AddSentLog('Create new process with name ' + TmpStr);
end;
         
function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
begin
  if (LastColumn.Index = 0) or (LastColumn.Index = 3) or
    (LastColumn.Index = 5) or (LastColumn.Index = 6)
  then
  begin
    if LastColumn.Index = 0 then
    begin
      i1 := StrToIntDef(Item1.Caption, 0);
      i2 := StrToIntDef(Item2.Caption, 0);
    end
    else

    if LastColumn.Index = 3 then
    begin
      i1 := StrToIntDef(Item1.SubItems[2], 0);
      i2 := StrToIntDef(Item2.SubItems[2], 0);
    end
    else

    if LastColumn.Index = 5 then
    begin
      i1 := FileSizeToBytes(Item1.SubItems[4]);
      i2 := FileSizeToBytes(Item2.SubItems[4]);
    end;

    if (i1 = i2) then Result := 0 else
    if (i1 > i2) then Result := 1 else Result := -1;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

function SortByColumn1(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
begin
  if (LastColumn.Index = 3) or (LastColumn.Index = 4) then
  begin
    if LastColumn.Index = 3 then
    begin
      i1 := StrToInt(Item1.SubItems[2]);
      i2 := StrToInt(Item2.SubItems[2]);
    end
    else
    begin
      i1 := StrToInt(Item1.SubItems[3]);
      i2 := StrToInt(Item2.SubItems[3]);
    end;

    if (i1 = i2) then Result := 0 else
    if (i1 > i2) then Result := 1 else Result := -1;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

function SortByColumn2(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
begin
  if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
    Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  if not Ascending then Result := -Result;
end;

function SortByColumn3(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
  f1, f2: Double;
begin
  if (LastColumn.Index = 1) or (LastColumn.Index = 2) then
  begin
    if LastColumn.Index = 2 then
    begin
      i1 := FileSizeToBytes(Item1.SubItems[1]);
      i2 := FileSizeToBytes(Item2.SubItems[1]);
      if (i1 = i2) then Result := 0 else
      if (i1 > i2) then Result := 1 else Result := -1;
    end
    else
    begin
      f1 := StrToFloatDef(Item1.SubItems[0], 0.0);
      f2 := StrToFloatDef(Item2.SubItems[0], 0.0);
      if (f1 = f2) then Result := 0 else
      if (f1 > f2) then Result := 1 else Result := -1;
    end;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

function SortByColumn4(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
var
  i1, i2: Int64;
begin
  if LastColumn.Index = 0 then
  begin
    i1 := StrToInt(Item1.Caption);
    i2 := StrToInt(Item2.Caption);
    if (i1 = i2) then Result := 0 else
    if (i1 > i2) then Result := 1 else Result := -1;
  end
  else
  begin
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
      Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  end;

  if not Ascending then Result := -Result;
end;

procedure TFormTasksManager.lvProcessColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;

  if TListView(Sender) = lvProcess then lvProcess.CustomSort(@SortByColumn, LastColumn.Index) else
  if TListView(Sender) = lvWindows then lvWindows.CustomSort(@SortByColumn1, LastColumn.Index) else
  if TListView(Sender) = lvServices then lvServices.CustomSort(@SortByColumn2, LastColumn.Index) else
  if TListView(Sender) = lvPrograms then lvPrograms.CustomSort(@SortByColumn3, LastColumn.Index) else
  if TListView(Sender) = lvConnections then lvConnections.CustomSort(@SortByColumn4, LastColumn.Index);
end;

procedure TFormTasksManager.C7Click(Sender: TObject);
begin
  SetClipboardText(lvConnections.Selected.SubItems[5]);
  AddLog('Connections path ' + lvConnections.Selected.SubItems[5] + ' copied to clipboard');
end;

procedure TFormTasksManager.C8Click(Sender: TObject);
begin
  SetClipboardText(lvPrograms.Selected.SubItems[4]);
  AddLog('Program uninstall path ' + lvPrograms.Selected.SubItems[4] + ' copied to clipboard');
end;

procedure TFormTasksManager.M1Click(Sender: TObject);
begin
  if lvWindows.Selected.SubItems[0] = 'Minimized' then
  begin
    Client.SendDatas(WINDOWSMAXIMIZE + '|' + lvWindows.Selected.SubItems[2]);
    AddSentLog('Maximized window ' + lvWindows.Selected.SubItems[2]);
  end
  else
  begin
    Client.SendDatas(WINDOWSMINIMIZE + '|' + lvWindows.Selected.SubItems[2]); 
    AddSentLog('Minimized window ' + lvWindows.Selected.SubItems[2]);
  end;
end;

end.
