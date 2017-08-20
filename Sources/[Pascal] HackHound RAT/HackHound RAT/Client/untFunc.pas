Unit untFunc;
Interface
Uses
  untfrmMain,
  Windows,
  SysUtils,
  Dialogs,
  Variants,
  Classes,
  ComCtrls,
  INIFiles;

Procedure StartListening(sPort: String);
Function Explode(sDelimiter: String; sSource: String): TStringList;
Procedure RecountConnections;
Procedure SendData(sData: String; sIP: String);
Procedure Broadcast(sData: String);
Procedure SendDataManage(sData: String);
Procedure SaveSettings(FilePath: String);
Procedure ReadSettings(FilePath: String);

Var
  iSent: Integer;

Implementation

Procedure StartListening(sPort: String);
Begin
  With frmMain.sckServer Do
  Begin
    Active := False;
    Port := StrToInt(sPort);
    Active := True;
  End;

  frmMain.SBMain.Panels[1].Text := 'Port: ' + sPort;
End;

Function Explode(sDelimiter: String; sSource: String): TStringList;
Var
  c: Word;
Begin
  Result := TStringList.Create;
  C := 0;

  While sSource <> '' Do
  Begin
    If Pos(sDelimiter, sSource) > 0 Then
    Begin
      Result.Add(Copy(sSource, 1, Pos(sDelimiter, sSource) - 1 ));
      Delete(sSource, 1, Length(Result[c]) + Length(sDelimiter));
    End
    Else
    Begin
      Result.Add(sSource);
      sSource := ''
    End;

    Inc(c);
  End;
End;

Procedure RecountConnections;
begin
  frmMain.SBMain.Panels[2].Text := 'Connections: ' + IntToStr(frmMain.lvConnections.Items.Count);
end;

Procedure SendData(sData: String; sIP: String);
var
  i: Integer;
begin
  For i := 0 To frmMain.lvConnections.Items.Count - 1 Do
  Begin
    If frmMain.lvConnections.Items.Item[i].SubItems.Strings[2] = sIP Then
    Begin
      frmMain.sckServer.Socket.Connections[i].SendText(sData + '|');
    end;
  end;

  iSent := iSent + Length(sData);
  frmMain.lblTotalSentData.Caption := 'Total Sent Data: ' + IntToStr(iSent) + ' Bytes';

end;

Procedure Broadcast(sData: String);
var
  i: Integer;
begin
  For i := 0 To frmMain.lvConnections.Items.Count - 1 Do
  Begin
    frmMain.sckServer.Socket.Connections[i].SendText(sData + '|');
  end;

  iSent := iSent + Length(sData);
  frmMain.lblTotalSentData.Caption := 'Total Sent Data: ' + IntToStr(iSent) + ' Bytes';
end;

Procedure SendDataManage(sData: String);
begin
  frmMain.sckServer.Socket.Connections[iSelectedConnection].SendText(sData + '|');

  iSent := iSent + Length(sData);
  frmMain.lblTotalSentData.Caption := 'Total Sent Data: ' + IntToStr(iSent) + ' Bytes';
end;

Procedure SaveSettings(FilePath: String);
var
  mIni: TINIFile;
begin
  mIni := TINIFile.Create(FilePath);
  mIni.WriteString('Settings', 'Port', frmMain.txtReverseConnectionPort.Text);
  mIni.WriteString('Settings', 'Password', frmMain.txtPassword.Text);

  If frmMain.chkHidePassword.Checked Then
  Begin
    mIni.WriteString('Settings', 'HidePassword', 'True');
  End Else Begin
    mIni.WriteString('Settings', 'HidePassword', 'False');
  End;

  If frmMain.chkNotifyOnNewConnection.Checked Then
  Begin
    mIni.WriteString('Settings', 'NotifyNewConnection', 'True');
  End Else Begin
    mIni.WriteString('Settings', 'NotifyNewConnection', 'False');
  End;

  If frmMain.chkNotifyOnDisconnection.Checked Then
  Begin
    mIni.WriteString('Settings', 'NotifyDisconnection', 'True');
  End Else Begin
    mIni.WriteString('Settings', 'NotifyDisconnection', 'False');
  End;
End;

Procedure ReadSettings(FilePath: String);
Var
  mIni: TINIFile;
Begin
  mIni := TINIFile.Create(FilePath);
  frmMain.txtReverseConnectionPort.Text := mIni.ReadString('Settings', 'Port', '4180');
  frmMain.txtPassword.Text := mIni.ReadString('Settings', 'Password', 'admin');

  If mIni.ReadString('Settings', 'HidePassword', 'False') = 'True' Then
  Begin
    frmMain.chkHidePassword.Checked := True;
  End Else Begin
    frmMain.chkHidePassword.Checked := False;
  End;

  If mIni.ReadString('Settings', 'NotifyNewConnection', 'True') = 'True' Then
  Begin
    frmmain.chkNotifyOnNewConnection.Checked := True;
  End Else Begin
    frmMain.chkNotifyOnNewConnection.Checked := False;
  End;

  If mIni.ReadString('Settings', 'NotifyDisconnection', 'True') = 'True' Then
  Begin
    frmMain.chkNotifyOnDisconnection.Checked := True;
  End Else Begin
    frmMain.chkNotifyOnDisconnection.Checked := False;
  End;
End;
End.

