unit UnitDnsUpdater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, jpeg, SocketUnitEx, Base64,
  UnitFunctions, UnitVariables, UnitConstants, uJSONConfig;

type
  TFormDnsUpdater = class(TForm)
    img1: TImage;
    pnl1: TPanel;
    img2: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    cbb1: TComboBoxEx;
    edtWan: TEdit;
    edtHost: TEdit;
    edtUser: TEdit;
    edtPass: TEdit;
    btn1: TSpeedButton;
    chk1: TCheckBox;
    btn2: TButton;
    btn3: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateDNS;
  end;

var
  FormDnsUpdater: TFormDnsUpdater;

implementation

{$R *.dfm}

procedure TFormDnsUpdater.btn2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormDnsUpdater.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormDnsUpdater.btn1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := WanAddress;
  if TmpStr = '127.0.0.1' then
  MessageBox(Handle, 'Failed to retrieve WAN ip address.', PROGRAMINFOS, MB_ICONERROR);

  edtWan.Text := TmpStr;
end;

procedure TFormDnsUpdater.cbb1Change(Sender: TObject);
begin
  if cbb1.ItemIndex = 0 then img1.BringToFront else img2.BringToFront;
  DNSProvider := cbb1.ItemIndex;
end;

procedure TFormDnsUpdater.chk1Click(Sender: TObject);
begin
  if chk1.Checked then edtPass.PasswordChar := #0 else edtPass.PasswordChar := '*';
end;

procedure UpdateNoIp(DNS, User, Password, Ip: string);
var
  ClientSocket: TClientSocket;
  TmpStr: string;
  i: Integer;
begin
  ClientSocket := TClientSocket.Create;
  
  i := 0;
  while (not ClientSocket.Connected) and (i < 5) do
	begin
    Sleep(500);
	  ClientSocket.Connect('dynupdate.no-ip.com', 8245);
    Inc(i);
  end;

  TmpStr := 'GET /ducupdate.php?username=' + User + '&pass=' + Password + '&h[]=' +
    DNS + '&ip=' + iP + ' HTTP/1.0'+#13#10 + 'Accept: */*' + #13#10 +
    'User-Agent: DUC v2.2.1' + #13#10 + 'Host: ' + 'dynupdate.no-ip.com' +
    #13#10 + 'Pragma: no-cache' + #13#10#13#10;
            
  ClientSocket.SendText(TmpStr);
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;
   
procedure UpdateDynDNS(DNS, User, Password, Ip: string);
var
  ClientSocket: TClientSocket;
  TmpStr: string;
  i: Integer;
begin
  ClientSocket := TClientSocket.Create;
  
  i := 0;
  while (not ClientSocket.Connected) and (i < 5) do
	begin
    Sleep(500);
	  ClientSocket.Connect('members.dyndns.org', 80);
    Inc(i);
  end;

  TmpStr := 'GET /nic/update?hostname=' + DNS + '&myip=' + Ip +
    '&wildcard=NOCHG&mx=NOCHG&backmx=NOCHG HTTP/1.0' + #13#10 +
    'Host: members.dyndns.org' + #13#10 +
    'Authorization: Basic ' + Base64Encode(User + ':' + Password) + #13#10 +
    'User-Agent: XtremeRAT' + #13#10#13#10;
            
  ClientSocket.SendText(TmpStr);
  ClientSocket.Disconnect;
  ClientSocket.Free;
  ClientSocket := nil;
end;

procedure TFormDnsUpdater.UpdateDNS;
begin
  if cbb1.ItemIndex = 0 then
    UpdateNoIp(edtHost.Text, edtUser.Text, edtPass.Text, edtWan.Text)
  else UpdateDynDNS(edtHost.Text, edtUser.Text, edtPass.Text, edtWan.Text);
end;

procedure TFormDnsUpdater.FormShow(Sender: TObject);
begin
  case DNSProvider of
    0: img1.BringToFront;
    1: img2.BringToFront;
  end;

  cbb1.ItemIndex := DNSProvider;
end;

procedure TFormDnsUpdater.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('DNS left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('DNS top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormDnsUpdater.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('DNS left', Left);
  JSONConfig.WriteInteger('DNS top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
