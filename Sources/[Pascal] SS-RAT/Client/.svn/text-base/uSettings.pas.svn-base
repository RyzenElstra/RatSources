unit uSettings;

interface

uses
  Windows, Messages, SysUtils, inifiles,Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,  MainU;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    edt2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure PngBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Function IsNum(S: String): Bool;
Var
  I: Word;
Begin
  If S = '' Then
  Begin
    Result := False;
    Exit;
  End;
  
  Result := True;
  For I := 1 To Length(S) Do
    If (Pos(S[I], ' 0123456789') = 0) Then
    Begin
      Result := False;
      Break;
    End;
End;

procedure TForm1.PngBitBtn1Click(Sender: TObject);
var
  Ini: TIniFile;
begin
if IsNum(edt1.Text) then begin
  StartListening(strtoint(edt1.Text));
  try
    Ini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Settings.ini');
    Ini.WriteString('Options', 'Port', edt1.Text);
    Ini.WriteString('Options', 'Password', edt2.Text);
    Ini.WriteBool('Options', 'Notify', checkbox1.Checked);
  finally
    Ini.Free;
  end;
  close;
end else begin
  ShowMessage('Please set a valid Port');
end;
end;

end.
