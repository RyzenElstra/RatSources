Unit Unit1;
Interface
Uses
  untfrmMain,
  Windows,
  SysUtils,
  Dialogs,
  Variants,
  Classes,
  ComCtrls;

Procedure StartListening(sPort: String);
Function Explode(sDelimiter: String; sSource: String): TStringList;
Procedure RecountConnections;
Procedure SendData(sData: String; sIP: String);
Procedure Broadcast(sData: String);

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

End.

