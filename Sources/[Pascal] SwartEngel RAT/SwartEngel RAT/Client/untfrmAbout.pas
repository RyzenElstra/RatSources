unit untfrmAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI, ExtCtrls;

type
  TfrmAbout = class(TForm)
    grp1: TGroupBox;
    imgProgramIcon: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    cmdOKButton: TButton;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    procedure cmdOKClick(Sender: TObject);
    procedure cmdHackHoundClick(Sender: TObject);
    procedure cmdOKButtonClick(Sender: TObject);
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

procedure TfrmAbout.cmdOKButtonClick(Sender: TObject);
begin
frmAbout.Close 
end;

end.
