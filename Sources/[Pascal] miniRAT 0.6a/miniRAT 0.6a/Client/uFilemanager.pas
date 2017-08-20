unit uFilemanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,WinSock, ImgList, PngImageList, Menus;

type
  TForm2 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    edt1: TEdit;
    lv1: TListView;
    stat1: TStatusBar;
    PngImageList1: TPngImageList;
    pm1: TPopupMenu;
    Download1: TMenuItem;
    Execute1: TMenuItem;
    Visible1: TMenuItem;
    Hidden1: TMenuItem;
    Delete1: TMenuItem;
    Upload1: TMenuItem;
    N1: TMenuItem;
    Refresh1: TMenuItem;
    procedure cbb1Change(Sender: TObject);
    procedure lv1DblClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure Hidden1Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.cbb1Change(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Lv1.Clear;
  Data := '11 '+Cbb1.Text+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
  edt1.Text := Cbb1.Text;
end;

procedure TForm2.lv1DblClick(Sender: TObject);
var
Data:string;
sock:integer;
begin
Sock := StrToInt(Stat1.Panels[0].Text);
  if lv1.Selected = nil then Exit;
    If (lv1.selected.SubItems[0] = 'DIR') Then
    Begin
      Data := '11 '+Edt1.Text+Lv1.selected.Caption+#10;
      edt1.Text := edt1.Text + Lv1.selected.Caption + '\';
      Lv1.Clear;
      Sock := StrToInt(Stat1.Panels[0].Text);
      If (Sock > 0) Then
        Send(Sock, Data[1], Length(Data), 0);
    End Else begin
      If (Lv1.ItemFocused.Caption = '..') And
       (Lv1.ItemFocused.SubItems[0] = 'Go Back') Then
      Begin
      Lv1.Clear;
      Data := ExtractFilePath(Copy(Edt1.Text, 1, Length(Edt1.Text)-1));
      edt1.Text := Data;
      Data := '11 '+Data+#10;
      Sock := StrToInt(Stat1.Panels[0].Text);
      If (Sock > 0) Then
        Send(Sock, Data[1], Length(Data), 0);
      end;
    end;
end;

procedure TForm2.Refresh1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Lv1.Clear;
  Data := '11 '+Edt1.Text+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm2.Delete1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
If lv1.Selected = nil then Exit;
  If (Lv1.selected.SubItems[1] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant delete whole directories.', 'Error', mb_ok or mb_iconhand);
    Exit;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '15 ' + Edt1.Text + Lv1.selected.Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);

  Refresh1.Click;
end;

procedure TForm2.Visible1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
If lv1.Selected = nil then Exit;
  If (Lv1.selected.SubItems[1] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant execute whole directories.', 'Error', mb_ok or mb_iconhand);
    Exit;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '14 1 ' + Edt1.Text + Lv1.selected.Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm2.Hidden1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
If lv1.Selected = nil then Exit;
  If (Lv1.selected.SubItems[1] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant execute whole directories.', 'Error', mb_ok or mb_iconhand);
    Exit;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '14 0 ' + Edt1.Text + Lv1.selected.Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm2.Download1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
if lv1.Selected = nil then exit;
If (Lv1.Selected .SubItems[1] = 'DIR') Then
Begin
  MessageBox(0, 'You cant download whole directories.', 'Error', mb_ok or mb_iconhand);
  Exit;
End;

Sock := StrToInt(Stat1.Panels[0].Text);
Data := '25 ' + Edt1.Text + Lv1.selected.Caption +#10;
If (Sock > 0) Then
  Send(Sock, Data[1], Length(Data), 0);

end;

end.
