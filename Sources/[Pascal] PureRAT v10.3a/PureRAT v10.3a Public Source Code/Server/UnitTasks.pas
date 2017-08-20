unit UnitTasks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Menus, UnitMain, UnitVariables,
  SocketUnitEx, UnitFunctions;

type
  TFormTasks = class(TForm)
    pgc1: TPageControl;
    btn1: TButton;
    btn2: TButton;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lst1: TListBox;
    grp1: TGroupBox;
    pnlWeb: TPanel;
    lbl1: TLabel;
    edtWeb: TEdit;
    pnlShell: TPanel;
    lbl2: TLabel;
    edtShell: TEdit;
    pnlUpf: TPanel;
    lbl3: TLabel;
    edtUpf: TEdit;
    btn3: TSpeedButton;
    pnlUpl: TPanel;
    lbl4: TLabel;
    edtUpl: TEdit;
    pnlDwf: TPanel;
    lbl5: TLabel;
    btn4: TSpeedButton;
    edtDwf: TEdit;
    chk1: TCheckBox;
    pnlDwl: TPanel;
    lbl6: TLabel;
    edtDwl: TEdit;
    chk2: TCheckBox;
    pnlAdmin: TPanel;
    pnlUninstall: TPanel;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    ts4: TTabSheet;
    chk3: TCheckBox;
    lv1: TListView;
    lv2: TListView;
    pm1: TPopupMenu;
    S1: TMenuItem;
    pnl1: TPanel;
    U1: TMenuItem;
    dlgOpen1: TOpenDialog;
    rb4: TRadioButton;
    rb5: TRadioButton;
    pnlUpc: TPanel;
    lbl7: TLabel;
    btn5: TSpeedButton;
    edtUpc: TEdit;
    chk4: TCheckBox;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure lst1Click(Sender: TObject);
    procedure rb3Click(Sender: TObject);
    procedure rb2Click(Sender: TObject);
    procedure rb1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure rb4Click(Sender: TObject);
    procedure rb5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTasks: TFormTasks;

implementation

{$R *.dfm}

procedure TFormTasks.btn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormTasks.btn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormTasks.lst1Click(Sender: TObject);
begin
  if lst1.ItemIndex = -1 then
    pnl1.BringToFront
  else
  case lst1.ItemIndex of
    0: pnlWeb.BringToFront;
    1: pnlShell.BringToFront;
    2: pnlUpf.BringToFront;
    3: pnlUpl.BringToFront;
    4: pnlDwf.BringToFront;
    5: pnlDwl.BringToFront;
    6: pnlAdmin.BringToFront;
    7: pnlUpc.BringToFront;
    8: pnlUninstall.BringToFront;
  end;
end;

procedure TFormTasks.rb3Click(Sender: TObject);
begin
  dtp1.Visible := rb3.Checked;
  dtp2.Visible := rb3.Checked;
end;

procedure TFormTasks.rb2Click(Sender: TObject);
begin
  dtp1.Visible := not rb2.Checked;
  dtp2.Visible := not rb2.Checked;
end;

procedure TFormTasks.rb1Click(Sender: TObject);
begin
  dtp1.Visible := not rb1.Checked;
  dtp2.Visible := not rb1.Checked;
end;

procedure TFormTasks.S1Click(Sender: TObject);
var
  i: Integer;
begin
  if rb4.Checked then
  begin
    for i := 0 to lv1.Items.Count - 1 do
    if lv1.Items.Item[i].Checked = False then lv1.Items.Item[i].Checked := True;
  end
  else

  if rb5.Checked then
  begin
    for i := 0 to lv2.Items.Count - 1 do
    if lv2.Items.Item[i].Checked = False then lv2.Items.Item[i].Checked := True;
  end;
end;

procedure TFormTasks.U1Click(Sender: TObject);
var
  i: Integer;
begin
  if rb4.Checked then
  begin
    for i := 0 to lv1.Items.Count - 1 do
    if lv1.Items.Item[i].Checked = True then lv1.Items.Item[i].Checked := False;
  end
  else

  if rb5.Checked then
  begin
    for i := 0 to lv2.Items.Count - 1 do
    if lv2.Items.Item[i].Checked = True then lv2.Items.Item[i].Checked := False;
  end;
end;

procedure TFormTasks.btn3Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Client file (*.exe)|*.exe';
  dlgOpen1.DefaultExt := 'exe';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  edtUpf.Text := dlgOpen1.FileName;
end;

procedure TFormTasks.btn4Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := '(*.*)|*.*';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  edtDwf.Text := dlgOpen1.FileName;
end;
    
procedure TFormTasks.btn5Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Configuration file (*.config)|*.config';   
  dlgOpen1.DefaultExt := 'config';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  edtUpc.Text := dlgOpen1.FileName;
end;

procedure TFormTasks.rb4Click(Sender: TObject);
begin
  lv1.BringToFront;
end;

procedure TFormTasks.rb5Click(Sender: TObject);
begin
  lv2.BringToFront;
end;

procedure TFormTasks.FormShow(Sender: TObject);
var
  ClientDatas: TClientDatas;
  TmpItem: TListItem;
  TmpBool: Boolean;
  i, j: Integer;
begin
  if ClientsList.Count = 0 then Exit;
  for i := 0 to ClientsList.Count - 1 do
  begin
    Application.ProcessMessages;
    ClientDatas := TClientDatas(ClientsList[i]);
    if (ClientDatas = nil) or (ClientDatas.Node.ChildCount > 0) then Continue;

    TmpItem := lv2.Items.Add;
    TmpItem.Caption := ClientDatas.UserId;
    TmpItem.ImageIndex := ClientDatas.ImageIndex;

    TmpBool := False;

    if lv1.Items.Count > 0 then
    for j := 0 to lv1.Items.Count - 1 do
    begin
      if lv1.Items.Item[j].Caption = ClientDatas.Infos.GroupId then
      begin
        TmpBool := True;
        Break;
      end;
    end;

    if TmpBool then Exit;
    TmpItem := lv1.Items.Add;
    TmpItem.Caption := ClientDatas.Infos.GroupId;
    TmpItem.ImageIndex := StrToInt(ClientDatas.Infos.GroupIcon);
  end;
end;

procedure TFormTasks.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

end.
