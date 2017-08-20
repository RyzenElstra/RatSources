unit UnitNotes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, AdvMemo, SocketUnitEx, UnitCommands, UnitFunctions,
  UnitVariables, UnitManager, UnitRepository, UnitConstants, UnitEncryption;

type
  TFormNotes = class(TForm)
    advm1: TAdvMemo;
    tlb1: TToolBar;
    btn1: TToolButton;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;
    procedure AddLog(Log: string);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
  end;

var
  FormNotes: TFormNotes;

implementation

{$R *.dfm}
                        
constructor TFormNotes.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
                
procedure TFormNotes.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormNotes.btn1Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if advm1.Lines.Text = '' then Exit;
  TmpStr := GetNotesFolder(Client.UserId) + '\' + MyGetDate('-') + '.data';
  TmpStr1 := advm1.Lines.Text;
  TmpStr1 := EnDecryptText(TmpStr1, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Note datas saved');
end;

end.
