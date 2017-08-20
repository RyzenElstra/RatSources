unit UnitScripts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, UnitMain,
  AdvMemo, AdvmWS, SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables,
  UnitManager;

type
  TFormScripts = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    advm1: TAdvMemo;
    btn5: TToolButton;
    chk1: TCheckBox;
    btn2: TToolButton;
    cbb1: TComboBox;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;  
    procedure AddSentLog(Log: string);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
  end;

var
  FormScripts: TFormScripts;

implementation

{$R *.dfm}
                     
constructor TFormScripts.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                
procedure TFormScripts.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormScripts.btn1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := cbb1.Text;
  if TmpStr = '' then Exit;
  if Copy(TmpStr, 1, 1) <> '.' then TmpStr := '.' + TmpStr;
  Client.SendDatas(SCRIPTEXECUTE + '|' + TmpStr + '|' + advm1.Lines.Text + '|' + MyBoolToStr(chk1.Checked));
  AddSentLog('Execute script ' + Copy(advm1.Lines.Text, 1, 50) + '...');
end;

end.
