unit UnitSendKeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg, strutils,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb, Buttons,UnitWindowManager;

type
  TSendKeys = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Memo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Memo1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    WindowManager: TWindowManager;
    NewSocket: TCustomWinSocket;
  end;

var
  SendKeys: TSendKeys;

implementation

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'WindowManager|' + Data);
end;

procedure TSendKeys.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TSendKeys.Button2Click(Sender: TObject);
var
  i: integer;
  a: string;
begin
  a := ansireplacestr(Memo1.Text,#13#10,'~');

  if RadioButton1.Checked then begin
    SendData(NewSocket,'SendKeys|GetForeGroundWindow|' + a);
    exit;
  end;

  for i := 0 to WindowManager.Listview1.Items.Count -1 do begin
    if not WindowManager.listview1.Items[i].Selected then continue;
    SendData(NewSocket,'SendKeys|' + WindowManager.Listview1.Items[i].Caption + '|' + a);
  end;

end;

procedure TSendKeys.Memo1KeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
var
  i: integer;
begin
  if not checkbox1.Checked then exit;

  if RadioButton1.Checked then begin
    SendData(NewSocket,'KeyDown|GetForeGroundWindow|' + inttostr(Key));
    exit;
  end;

  for i := 0 to WindowManager.Listview1.Items.Count -1 do begin
    if not WindowManager.listview1.Items[i].Selected then continue;
    SendData(NewSocket,'KeyDown|' + WindowManager.Listview1.Items[i].Caption + '|' + inttostr(Key));
  end;

end;

procedure TSendKeys.Memo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  if not checkbox1.Checked then exit;

  if RadioButton1.Checked then begin
    SendData(NewSocket,'KeyUp|GetForeGroundWindow|' + inttostr(Key));
    exit;
  end;

  for i := 0 to WindowManager.Listview1.Items.Count -1 do begin
    if not WindowManager.listview1.Items[i].Selected then continue;
    SendData(NewSocket,'KeyUp|' + WindowManager.Listview1.Items[i].Caption + '|' + inttostr(Key));
  end;

end;

end.
