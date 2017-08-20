unit uProcess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ImgList, winsock;

type
  TForm5 = class(TForm)
    stat1: TStatusBar;
    pm1: TPopupMenu;
    Refresh1: TMenuItem;
    KillProcess1: TMenuItem;
    N1: TMenuItem;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lv1: TListView;
    lv2: TListView;
    lv3: TListView;
    pm2: TPopupMenu;
    Refresh2: TMenuItem;
    N2: TMenuItem;
    Start1: TMenuItem;
    Stop1: TMenuItem;
    pm3: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Close1: TMenuItem;
    procedure Refresh1Click(Sender: TObject);
    procedure KillProcess1Click(Sender: TObject);
    procedure Refresh2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure Start1Click(Sender: TObject);
    procedure Stop1Click(Sender: TObject);
    procedure lv3ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Close1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

procedure TForm5.Refresh1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  lv1.Clear;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '16|0'#10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.KillProcess1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if lv1.Selected = nil then exit;
Sock := StrToInt(Stat1.Panels[0].Text);
Data := '18|' + lv1.Selected.SubItems.Strings[1] + #10;
         Send(Sock, Data[1], Length(Data), 0);
         Sleep(200);
         Refresh1.Click;
end;

procedure TForm5.Refresh2Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  lv3.Clear;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '77|0'#10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.MenuItem1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  sleep(100);
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '95|0'#10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.Start1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  if lv3.Selected = nil then exit;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '113|' + lv3.Selected.caption + #10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.Stop1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
  if lv3.Selected = nil then exit;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '114|' + lv3.Selected.caption + #10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.lv3ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
if lv3.Selected = nil then exit;
if lv3.Selected.SubItems.Strings[1] = 'Stopped' then begin
  pm2.Items.Items[3].Enabled := false;
end else begin
  pm2.Items.Items[3].Enabled := true;
end;
if lv3.Selected.SubItems.Strings[1] = 'Running' then begin
  pm2.Items.Items[2].Enabled := false;
end else begin
  pm2.Items.Items[2].Enabled := true;
end;
end;

procedure TForm5.MenuItem3Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if lv2.Selected = nil then exit;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '112|' + lv2.Selected.SubItems.Strings[0] + #10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.MenuItem4Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if lv2.Selected = nil then exit;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '111|' + lv2.Selected.SubItems.Strings[0] + #10;
  Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm5.Close1Click(Sender: TObject);
var
  sock:Integer;
  Data:string;
begin
if lv2.Selected = nil then exit;
  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '110|' + lv2.Selected.SubItems.Strings[0] + #10;
  Send(Sock, Data[1], Length(Data), 0);
end;

end.
