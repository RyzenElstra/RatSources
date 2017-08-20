unit untfrmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI;

type
  TfrmAbout = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    memAbout: TMemo;
    cmdOK: TButton;
    cmdHackHound: TButton;
    procedure cmdOKClick(Sender: TObject);
    procedure cmdHackHoundClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

procedure TfrmAbout.cmdOKClick(Sender: TObject);
begin
  frmAbout.Close;
end;

procedure TfrmAbout.cmdHackHoundClick(Sender: TObject);
begin
//ShellExecute(0,'open','http:\\HackHound.org',nil,nil,SW_SHOW);
  ShellExecute(0, 'open', 'http:\\hackhound.org', Nil, Nil, SW_SHOW);
end;

end.
