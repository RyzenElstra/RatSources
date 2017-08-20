unit uTransferView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus;

type
  TForm3 = class(TForm)
    lv1: TListView;
    PopupMenu1: TPopupMenu;
    PauseTransfer1: TMenuItem;
    StopDeleteTransfer1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure PauseTransfer1Click(Sender: TObject);
    procedure StopDeleteTransfer1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses MainU;

{$R *.dfm}

procedure TForm3.FormShow(Sender: TObject);
begin
form3.Top := mainform.Top + mainform.Height;
form3.Left := mainform.Left;
end;

procedure TForm3.PauseTransfer1Click(Sender: TObject);
var
tempThread:TThread;
begin
if lv1.Selected = nil then exit;
if lv1.Selected.SubItems.Strings[3] <> 'Paused' then begin
tempThread := TThread(lv1.Selected.SubItems.Objects[0]);
tempthread.Suspend;
lv1.Selected.SubItems.Strings[3] := 'Paused';
end else begin
  tempThread := TThread(lv1.Selected.SubItems.Objects[0]);
  tempthread.Resume;
  lv1.Selected.SubItems.Strings[3] := 'Downloading';
end;
end;

procedure TForm3.StopDeleteTransfer1Click(Sender: TObject);
var
tempThread:TThread;
begin
if lv1.Selected = nil then exit;
tempThread := TThread(lv1.Selected.SubItems.Objects[0]);
tempthread.Terminate;
lv1.Selected.Delete;
end;

end.
