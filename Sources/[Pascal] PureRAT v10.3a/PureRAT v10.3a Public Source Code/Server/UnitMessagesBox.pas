unit UnitMessagesBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, StdCtrls, sEdit,
  Buttons, sSpeedButton, UnitMain, SocketUnitEx, UnitCommands, UnitFunctions,
  UnitVariables, UnitConstants, Spin, ExtCtrlsX, UnitManager;

type
  TFormMessagesBox = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn4: TToolButton;
    grpIcon: TGroupBox;
    img8: TImage;
    img7: TImage;
    img6: TImage;
    img5: TImage;
    sSpeedButton1: TsSpeedButton;
    rb1: TRadioButton;
    rb2: TRadioButton;
    rb3: TRadioButton;
    rb4: TRadioButton;
    rb5: TRadioButton;
    rg1: TRadioGroup;
    grp2: TGroupBox;
    lv1: TListView;
    grp1: TGroupBox;
    mmo1: TMemo;
    edt1: TEdit;
    pb1: TProgressBar;
    grp3: TGroupBox;
    img2: TImage;
    img3: TImage;
    img4: TImage;
    btn3: TsSpeedButton;
    rb6: TRadioButton;
    rb7: TRadioButton;
    rb9: TRadioButton;
    rb10: TRadioButton;
    grp4: TGroupBox;
    mmo2: TMemo;
    edt2: TEdit;
    grp5: TGroupBox;
    se1: TSpinEdit;
    lbl1: TLabel;
    pnlMsg: TPanel;
    pnlBalloon: TPanel;
    btn5: TButton;
    btn6: TButton;
    btn7: TButton;
    btn8: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;       
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormMessagesBox: TFormMessagesBox;

implementation

{$R *.dfm}
          
constructor TFormMessagesBox.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormMessagesBox.FormShow(Sender: TObject);
begin
  if lv1.Items.Count = 0 then btn1.Click;
end;
           
procedure TFormMessagesBox.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormMessagesBox.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormMessagesBox.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
begin                                  
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);

    lv1.Clear;

    pb1.Max := StringCount(#13#10, Datas);
    pb1.Position := 0;

    lv1.Items.BeginUpdate;

    while Datas <> '' do
    begin                               
      Self.Refresh;
      Application.ProcessMessages;
      pb1.Position := pb1.Position + 1;

      TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
      Delete(Datas, 1, Pos(#13#10, Datas) + 1);

      TmpList := ParseString('|', TmpStr);

      TmpItem := lv1.Items.Add;
      TmpItem.Caption := TmpList[3];
      TmpItem.SubItems.Add(TmpList[0]);
      TmpItem.ImageIndex := 0;
    end;

    lv1.Items.EndUpdate;
    AddRecvLog(IntToStr(pb1.Max) + ' windows hosts found');
  end;
end;

procedure TFormMessagesBox.btn1Click(Sender: TObject);
begin
  pnlMsg.BringToFront;
  if lv1.Items.Count > 0 then Exit;
  Client.SendDatas(MESSAGESBOXHOSTSLIST + '|');
  AddSentLog('Get windows hosts');
end;

procedure TFormMessagesBox.btn2Click(Sender: TObject);
begin
  pnlBalloon.BringToFront;
end;

procedure TFormMessagesBox.btn6Click(Sender: TObject);
begin
  if rb1.Checked then
  begin
    case rg1.ItemIndex of
      0: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR);
      1: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR + MB_OKCANCEL);
      2: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR + MB_YESNO);
      3: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR + MB_YESNOCANCEL);
      4: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR + MB_RETRYCANCEL);
      5: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONERROR + MB_ABORTRETRYIGNORE);
    end;
  end;

  if rb2.Checked then
  begin
    case rg1.ItemIndex of
      0: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONWARNING);
      1: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONWARNING + MB_OKCANCEL);
      2: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICOnWARNING + MB_YESNO);
      3: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONWARNING + MB_YESNOCANCEL);
      4: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICOnWARNING + MB_RETRYCANCEL);
      5: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONWARNING + MB_ABORTRETRYIGNORE);
    end;
  end;

  if rb3.Checked then
  begin
    case rg1.ItemIndex of
      0: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_OK);
      1: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_OKCANCEL);
      2: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_YESNO);
      3: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_YESNOCANCEL);
      4: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_RETRYCANCEL);
      5: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONQUESTION + MB_ABORTRETRYIGNORE);
    end;
  end;

  if rb4.Checked then
  begin
    case rg1.ItemIndex of
      0: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION);
      1: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION + MB_OKCANCEL);
      2: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION + MB_YESNO);
      3: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION + MB_YESNOCANCEL);
      4: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION + MB_RETRYCANCEL);
      5: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ICONINFORMATION + MB_ABORTRETRYIGNORE);
    end;
  end;

  if rb5.Checked then
  begin
    case rg1.ItemIndex of
      0: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_OK);
      1: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_OKCANCEL);
      2: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_YESNO);
      3: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_YESNOCANCEL);
      4: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_RETRYCANCEL);
      5: MessageBox(Handle, PChar(mmo1.Text), PChar(edt1.Text), MB_ABORTRETRYIGNORE);
    end;
  end;
end;

procedure TFormMessagesBox.btn5Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lv1.Selected) then TmpStr := '0' else TmpStr := lv1.Selected.Caption;

  if rb1.Checked then
  begin
    case rg1.ItemIndex of
      0: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '0');
      1: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '1');
      2: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '2');
      3: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '3');
      4: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '4');
      5: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|0|' + '5');
    end;
  end;

  if rb2.Checked then
  begin
    case rg1.ItemIndex of
      0: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '0');
      1: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '1');
      2: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '2');
      3: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '3');
      4: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '4');
      5: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|1|' + '5');
    end;
  end;

  if rb3.Checked then
  begin
    case rg1.ItemIndex of
      0: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '0');
      1: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '1');
      2: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '2');
      3: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '3');
      4: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '4');
      5: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|2|' + '5');
    end;
  end;

  if rb4.Checked then
  begin
    case rg1.ItemIndex of
      0: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '0');
      1: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '1');
      2: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '2');
      3: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '3');
      4: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '4');
      5: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|3|' + '5');
    end;
  end;

  if rb5.Checked then
  begin
    case rg1.ItemIndex of
      0: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '0');
      1: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '1');
      2: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '2');
      3: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '3');
      4: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '4');
      5: Client.SendDatas(MESSAGESBOX + '|' + TmpStr + '|' + PChar(mmo1.Text) + '|' + PChar(edt1.Text) + '|4|' + '5');
    end;
  end;

  AddSentLog('Show message box with title ' + edt1.Text + ' and body ' + mmo1.Text);
end;

procedure TFormMessagesBox.btn7Click(Sender: TObject);
begin
  if rb6.Checked then Client.SendDatas(MESSAGESBALLOON + '|' + mmo2.Text + '|' + edt2.Text + '|0|' + se1.Text + '|');
  if rb7.Checked then Client.SendDatas(MESSAGESBALLOON + '|' + mmo2.Text + '|' + edt2.Text + '|1|' + se1.Text + '|');
  if rb9.Checked then Client.SendDatas(MESSAGESBALLOON + '|' + mmo2.Text + '|' + edt2.Text + '|3|' + se1.Text + '|');
  if rb10.Checked then Client.SendDatas(MESSAGESBALLOON + '|' + mmo2.Text + '|' + edt2.Text + '|4|' + se1.Text + '|');

  AddSentLog('Show balloon message with title ' + edt2.Text + ' and body ' + mmo2.Text);
end;

procedure TFormMessagesBox.btn8Click(Sender: TObject);
begin
  if rb6.Checked then
  begin
    FormMain.trycn1.BalloonFlags := bfError;
    FormMain.trycn1.BalloonTitle := edt2.Text;
    FormMain.trycn1.BalloonHint := mmo2.Text;
    FormMain.trycn1.ShowBalloonHint;
  end;

  if rb7.Checked then
  begin
    FormMain.trycn1.BalloonFlags := bfWarning;
    FormMain.trycn1.BalloonTitle := edt2.Text;
    FormMain.trycn1.BalloonHint := mmo2.Text;
    FormMain.trycn1.ShowBalloonHint;
  end;

  if rb9.Checked then
  begin
    FormMain.trycn1.BalloonFlags := bfInfo;
    FormMain.trycn1.BalloonTitle := edt2.Text;
    FormMain.trycn1.BalloonHint := mmo2.Text;
    FormMain.trycn1.ShowBalloonHint;
  end;

  if rb10.Checked then
  begin
    FormMain.trycn1.BalloonFlags := bfNone;
    FormMain.trycn1.BalloonTitle := edt2.Text;
    FormMain.trycn1.BalloonHint := mmo2.Text;
    FormMain.trycn1.ShowBalloonHint;
  end;
end;

end.
