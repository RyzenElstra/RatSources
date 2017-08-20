unit UnitProcessManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg, DateUtils,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb;

type
  TProcessManager = class(TForm)
    ListView1: TListView;
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    End1: TMenuItem;
    EndAndDelete1: TMenuItem;
    N3: TMenuItem;
    Pause1: TMenuItem;
    Resume1: TMenuItem;
    ImageList1: TImageList;
    Timer1: TTimer;
    UpdateSpeed1: TMenuItem;
    High1: TMenuItem;
    Normal1: TMenuItem;
    Low1: TMenuItem;
    Paused1: TMenuItem;
    Timer2: TTimer;
    procedure Refresh1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure High1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Low1Click(Sender: TObject);
    procedure Paused1Click(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure End1Click(Sender: TObject);
    procedure EndAndDelete1Click(Sender: TObject);
    procedure Pause1Click(Sender: TObject);
    procedure Resume1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FirstRun: bool;
    function FindProcess(Pid: string): TListItem;
    procedure ClickTheColumn;
  public
    { Public declarations }
    MyPid: string;
    Group,Computer,User: string;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  ProcessManager: TProcessManager;
  LastSortedColumn: TListColumn;
  Ascending: boolean;
  FileSizeList: TStringList;

implementation

uses UnitModuleManager;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ProcessManager|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TProcessManager(SocketData.Form).NewSocket = nil then exit;
  TProcessManager(SocketData.Form).Timer2.Enabled := True;
  TProcessManager(SocketData.Form).NewSocket := nil;
  if ModuleManager.NewSocket = Socket then ModuleManager.NewSocket := nil;
  TProcessManager(SocketData.Form).Caption := TProcessManager(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TProcessManager.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer2.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  FirstRun := True;
  senddata(NewSocket,'ProcessList');
end;

function TProcessManager.FindProcess(Pid: string): TListItem;
var
  i: integer;
begin
  Result := nil;
  for i := Listview1.Items.Count -1 downto 0 do begin
    Application.ProcessMessages;
    if Listview1.Items[i].SubItems[0] = Pid then begin
      Result := Listview1.Items[i];
      Exit;
    end;
  end;
end;

procedure TProcessManager.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  p,i: integer;
  Strings: TStringList;
  StringList: TStringList;
  MemSize: int64;
  MemSizeStr: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'ProcessList' then begin
    MyPid := Split(Data,'|',1);
    Delete(Data,1,Length(MyPid)+1);

    Strings := TStringList.Create;
    StringList := TStringList.Create;
    Strings.Text := Data;
    Listview1.Items.BeginUpdate;
    for i := 0 to Strings.Count -1 do begin
      Application.ProcessMessages;
      Li := FindProcess(Split(Strings.Strings[i], '|', 2));

      if Li = nil then begin
        Li := Listview1.Items.Add;
        Li.Caption := extractfilename(Split(Strings.Strings[i], '|', 1));
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 2));
        Li.SubItems.Add(extractfilepath(Split(Strings.Strings[i], '|', 3)));
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 4));
        Li.SubItems.Add(split(Strings.Strings[i], '|', 5));

        MemSizeStr := Split(Strings.Strings[i],'|',6);
        if MemSizeStr = '' then begin
          Li.SubItems.Add('');
          Li.OverlayIndex := FileSizeList.Add('0');
        end else begin
          MemSize := StrToInt64(MemSizeStr);
          MemSizeStr := FileSizeToStr(MemSize);
          Li.SubItems.Add(MemSizeStr);
          Li.OverlayIndex := FileSizeList.Add(MemSizeStr);
        end;


        Li.SubItems.Add(Split(Strings.Strings[i], '|', 7));
        if FirstRun then Li.StateIndex := 0 else Li.StateIndex := 1;
      end else begin
        Application.ProcessMessages;
        Li.StateIndex := 0;

        MemSizeStr := Split(Strings.Strings[i],'|',6);
        if MemSizeStr = '' then begin
          FileSizeList.Strings[Li.OverlayIndex] := '0';
        end else begin
          MemSize := StrToInt64(MemSizeStr);
          MemSizeStr := FileSizeToStr(MemSize);
          FileSizeList.Strings[Li.OverlayIndex] := inttostr(MemSize);
        end;


        if Li.SubItems[3] <> split(Strings.Strings[i], '|', 5) then Li.SubItems[3] := split(Strings.Strings[i], '|', 5);
        if Li.SubItems[4] <> MemSizeStr then Li.SubItems[4] := MemSizeStr;//split(Strings.Strings[i], '|', 6) then Li.SubItems[4] := Split(Strings.Strings[i], '|', 6);
      end;

      StringList.Add(Li.SubItems[0]);
    end;
    //Listview1.Items.EndUpdate;
    Strings.Free;

    for i := Listview1.Items.Count -1 downto 0 do begin
      Application.ProcessMessages;
      if Listview1.Items[i].StateIndex = 2 then begin
        Listview1.Items[i].Delete;
        Continue;
      end;
      p := StringList.IndexOf(Listview1.Items[i].SubItems[0]);
      if p = -1 then  Listview1.Items[i].StateIndex := 2;
    end;
    StringList.Free;
    FirstRun := False;
    ClickTheColumn;
    Listview1.Items.EndUpdate;
    Timer1.Enabled := True;
  end;


  if Command = 'ModuleList' then begin
    Strings := TStringList.Create;
    StringList := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Application.ProcessMessages;
      if lowercase(ExtractFileName(Strings.Strings[i])) = ModuleManager.ExeName then Continue;
      Li := ModuleManager.ListView1.FindCaption(0,ExtractFileName(Strings.Strings[i]),False,True,False);
      if Li = nil then begin
        Li := ModuleManager.Listview1.Items.Add;
        Li.Caption := ExtractFileName(Strings.Strings[i]);
        Li.SubItems.Add(ExtractFilePath(Strings.Strings[i]));
        if ModuleManager.FirstRun then Li.StateIndex := 0 else Li.StateIndex := 1;
      end else begin
        Li.StateIndex := 0;
      end;
      StringList.Add(Li.Caption);
    end;
    Strings.Free;

    for i := ModuleManager.Listview1.Items.Count -1 downto 0 do begin
      Application.ProcessMessages;
      if ModuleManager.Listview1.Items[i].StateIndex = 2 then begin
        ModuleManager.Listview1.Items[i].Delete;
        Continue;
      end;
      p := StringList.IndexOf(ModuleManager.Listview1.Items[i].Caption);
      if p = -1 then  ModuleManager.Listview1.Items[i].StateIndex := 2;
    end;
    StringList.Free;
    ModuleManager.FirstRun := False;
    ModuleManager.Timer1.Enabled := True;
  end;



end;

procedure TProcessManager.Refresh1Click(Sender: TObject);
begin
  senddata(NewSocket,'ProcessList');
end;

procedure TProcessManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  //Listview1.Canvas.Brush.Color :=  $F7F7F7;
  if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := $F7F7F7;
  if Item.StateIndex = 1 then Listview1.Canvas.Brush.Color := clGreen;
  if Item.StateIndex = 2 then Listview1.Canvas.Brush.Color := ClRed;

  if Item.SubItems.Count = 0 then exit;

  if Item.SubItems[0] = MyPid then Listview1.Canvas.Font.Color := clRed
  else Listview1.Canvas.Font.Color := clBlack;

end;

procedure TProcessManager.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := clWhite;
  if Item.StateIndex = 1 then Listview1.Canvas.Brush.Color := clGreen;
  if Item.StateIndex = 2 then Listview1.Canvas.Brush.Color := ClRed;

  if Item.SubItems[0] = MyPid then Listview1.Canvas.Font.Color := clRed
  else Listview1.Canvas.Font.Color := clBlack;
end;

procedure TProcessManager.Timer1Timer(Sender: TObject);
begin
  if NewSocket = nil then exit;
  if Paused1.Checked then exit;
  Refresh1.Click;
  Timer1.Enabled := False;
end;

procedure TProcessManager.High1Click(Sender: TObject);
begin
  High1.Checked := True;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 500;
end;

procedure TProcessManager.Normal1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := True;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 2000;
end;

procedure TProcessManager.Low1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := True;
  Paused1.Checked := False;
  Timer1.Interval := 4000;
end;

procedure TProcessManager.Paused1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := True;
  Timer1.Interval := 1000;
end;

procedure TProcessManager.ListView1DblClick(Sender: TObject);
begin
  if not assigned(listview1.Selected) then exit;
  ModuleManager.FirstRun := True;
  ModuleManager.Pid := Listview1.Selected.SubItems[0];
  ModuleManager.ExeName := lowercase(Listview1.Selected.Caption);
  ModuleManager.NewSocket := NewSocket;
  ModuleManager.StatusBar1.SimpleText := 'Process: ' + ModuleManager.ExeName + ' Pid:' + ModuleManager.Pid;
  SendData(NewSocket,'ModuleList|' + Listview1.Selected.SubItems[0]);
  ModuleManager.Show;
end;

procedure TProcessManager.End1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'End|' + Listview1.Items[i].SubItems[0]);
  end;
end;

procedure TProcessManager.EndAndDelete1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'EndDelete|' + Listview1.Items[i].SubItems[0]);
  end;
end;

procedure TProcessManager.Pause1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Suspend|' + Listview1.Items[i].SubItems[0]);
  end;
end;

procedure TProcessManager.Resume1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Resume|' + Listview1.Items[i].SubItems[0]);
  end;
end;

procedure TProcessManager.Timer2Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|ProcessManagerSocket|' + inttostr(Self.Handle));
end;

procedure TProcessManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
begin
  Action := caFree;
  if FileSizeList <> nil then FreeAndNil(FileSizeList);

  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

function SortByColumn(Item1, Item2: TListItem; Data: integer): integer; stdcall;
var
  n1,n2: int64;
  s1,s2: string;
  ex1,ex2: extended;
  num: integer;
  Date1,Date2: TDateTime;
begin
  if (LastSortedColumn.Caption = 'Pid') or
     (LastSortedColumn.Caption = 'Threads') or
     (LastSortedColumn.Caption = 'Memory') or
     (LastSortedColumn.Caption = 'Created') then begin

      if LastSortedColumn.Caption = 'Pid' then begin
        n1 := StrToIntDef(Item1.SubItems[0],0);
        n2 := StrToIntDef(Item2.SubItems[0],0);
      end;

      if LastSortedColumn.Caption = 'Threads' then begin
        n1 := StrToIntDef(Item1.SubItems[3],0);
        n2 := StrToIntDef(Item2.SubItems[3],0);
      end;

       if LastSortedColumn.Caption = 'Memory' then begin
        n1 := StrToIntDef(FileSizeList.Strings[Item1.OverlayIndex],0);//StrToIntDef(Item1.SubItems[4],0);
        n2 := StrToIntDef(FileSizeList.Strings[Item2.OverlayIndex],0);//StrToIntDef(Item2.SubItems[4],0);
      end;

      if LastSortedColumn.Caption = 'Created' then begin
        try
          Date1 := StrToDateTime(Item1.SubItems[5]);
        except
        end;
        try
          Date2 := StrToDateTime(Item2.SubItems[5]);
        except
        end;
        Result := CompareDateTime(Date1,Date2);
        if not Ascending then Result := - Result;
        exit;
      end;

      if (n1 = n2) then Result := 0 else if (n1 > n2) then Result := 1 else Result := -1;

  end else begin
    Result := 0;
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption)
    else Result := AnsiCompareText(Item1.SubItems[Data-1],Item2.SubItems[Data-1]);
  end;

  if not Ascending then Result := -Result;
end;

procedure TProcessManager.ListView1ColumnClick(Sender: TObject; Column: TListColumn);
var
  i: integer;
begin
  Ascending := not Ascending;
  if Column <> LastSortedColumn then Ascending := not Ascending;
  for i := 0 to Listview1.Columns.Count -1 do Listview1.Column[i].ImageIndex := -1;
  if Ascending then Column.ImageIndex := 6 else Column.ImageIndex := 5;
  LastSortedColumn := Column;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TProcessManager.ClickTheColumn;
begin
  if LastSortedColumn = nil then exit;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TProcessManager.FormCreate(Sender: TObject);
begin
  Ascending := True;
  LastSortedColumn := nil;
  Listview1.DoubleBuffered := True;
  FileSizeList := TStringList.Create;
end;

end.
