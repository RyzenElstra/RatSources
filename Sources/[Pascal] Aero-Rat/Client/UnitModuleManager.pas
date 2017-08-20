unit UnitModuleManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitProcessManager;

type
  TModuleManager = class(TForm)
    Timer1: TTimer;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    Refresh1: TMenuItem;
    UpdateSpeed1: TMenuItem;
    High1: TMenuItem;
    Normal1: TMenuItem;
    Low1: TMenuItem;
    Paused1: TMenuItem;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    N1: TMenuItem;
    LoadModule1: TMenuItem;
    UnloadModule1: TMenuItem;
    procedure ListView1CustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure ListView1CustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure Refresh1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure High1Click(Sender: TObject);
    procedure Normal1Click(Sender: TObject);
    procedure Low1Click(Sender: TObject);
    procedure Paused1Click(Sender: TObject);
    procedure LoadModule1Click(Sender: TObject);
    procedure UnloadModule1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FirstRun: bool;
    NewSocket: TCustomWinSocket;
    Pid: string;
    ExeName: string;
    ProcessManager: TProcessManager;
  end;

var
  ModuleManager: TModuleManager;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'ProcessManager|' + Data);
end;

procedure TModuleManager.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := $F7F7F7;
  if Item.StateIndex = 1 then Listview1.Canvas.Brush.Color := clGreen;
  if Item.StateIndex = 2 then Listview1.Canvas.Brush.Color := ClRed;
end;

procedure TModuleManager.ListView1CustomDrawSubItem(
  Sender: TCustomListView; Item: TListItem; SubItem: Integer;
  State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   if Item.StateIndex = 0 then Listview1.Canvas.Brush.Color := clWhite;
end;

procedure TModuleManager.Refresh1Click(Sender: TObject);
begin
  SendData(NewSocket,'ModuleList|' + Pid);
end;

procedure TModuleManager.Timer1Timer(Sender: TObject);
begin
  if NewSocket = nil then exit;
  if Paused1.Checked then exit;
  Timer1.Enabled := False;
  Refresh1.Click
end;

procedure TModuleManager.High1Click(Sender: TObject);
begin
  High1.Checked := True;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 500;
end;

procedure TModuleManager.Normal1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := True;
  Low1.Checked := False;
  Paused1.Checked := False;
  Timer1.Interval := 2000;
end;

procedure TModuleManager.Low1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := True;
  Paused1.Checked := False;
  Timer1.Interval := 4000;
end;

procedure TModuleManager.Paused1Click(Sender: TObject);
begin
  High1.Checked := False;
  Normal1.Checked := False;
  Low1.Checked := False;
  Paused1.Checked := True;
  Timer1.Interval := 1000;
end;

procedure TModuleManager.LoadModule1Click(Sender: TObject);
var
  a: string;
begin
  a := InputBox('Load Module','Enter Full Path To Module','');
  if a = '' then exit;
  SendData(NewSocket,'LoadModule|' + pid + '|' + a);
end;

procedure TModuleManager.UnloadModule1Click(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to listview1.Items.Count -1 do begin
    if not listview1.Items[i].Selected then continue;
    SendData(NewSocket,'UnloadModule|' + pid + '|' + Listview1.Items[i].SubItems[0] +  Listview1.Items[i].Caption);
  end;
end;

end.
