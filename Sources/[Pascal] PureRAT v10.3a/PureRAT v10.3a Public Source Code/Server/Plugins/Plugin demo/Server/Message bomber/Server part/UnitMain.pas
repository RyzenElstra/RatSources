unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WinSkinData, XPMan, StdCtrls, Spin, UnitRC4, SocketUnitEx;

type
  TFormMain = class(TForm)
    lbl1: TLabel;
    edt1: TEdit;
    lbl2: TLabel;
    mmo1: TMemo;
    lbl3: TLabel;
    se1: TSpinEdit;
    btn1: TButton;
    btn2: TButton;
    xpmnfst1: TXPManifest;
    skndt1: TSkinData;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ClientSocket: TClientSocket;
    Password: string;
  public
    { Public declarations }
    procedure SetInfos(_Socket: Integer; _Password: string);
    procedure GetFeedBack(FeedBack: string);
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.SetInfos(_Socket: Integer; _Password: string);
begin
  Password := _Password;
  ClientSocket := TClientSocket.Create;
  ClientSocket.Socket := _Socket;
  ClientSocket.SetConnection;
  if not ClientSocket.Connected then
  MessageBox(0, 'Failed to initialize socket.', 'Message bomber', MB_ICONERROR);
end;

procedure TFormMain.GetFeedBack(FeedBack: string);
begin
  //Display client part feedback
  MessageBox(0, PChar(FeedBack), 'Message bomber', MB_ICONINFORMATION);
end;

procedure TFormMain.btn1Click(Sender: TObject);
var
  Datas: string;
begin
  if (edt1.Text = '') or (mmo1.Text = '') or (se1.Text = '') then
  begin
    MessageBox(0, 'One or more entries are empty.', 'Message bomber', MB_ICONERROR);
    Exit;
  end;

  Datas := edt1.Text + '|' + mmo1.Text + '|' + se1.Text;
  Datas := EnDecryptText(Datas, Password);  //You can encrypt datas or not, depending to you!
  ClientSocket.SendText(Datas); //send datas directly to client plugin part not to PureRAT client
end;

procedure TFormMain.btn2Click(Sender: TObject);
var
  TmpStr: string;
begin
  MessageBox(Handle, 'Display a given number of fake messages.' + #13#10 +
    'Copyright (c) 2016-2017 J3kill Soft. by wrh1d3', 'Message bomber', MB_ICONINFORMATION);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  //Close connection with client
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;

end.
