unit UnitSplashScreen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg, StdCtrls, ComCtrls,RichEdit,SHellAPi;

type
  TSplashScreen = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Label1: TLabel;
    RichEdit1: TRichEdit;
    ProgressBar1: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  SplashScreen: TSplashScreen;

implementation

{$R *.dfm}

uses
  UnitSharedData;
  
procedure TSplashScreen.WndProc(var Msg: TMessage);
var
  p: TENLink;
  sURL: string;
  CE : TRichEdit;
begin
 if (Msg.Msg = WM_NOTIFY) then
 begin
  if (PNMHDR(Msg.lParam).code = EN_LINK) then
  begin
   p := TENLink(Pointer(TWMNotify(Msg).NMHdr)^);
   if (p.Msg = WM_LBUTTONDOWN) then
   begin
    try
     CE := TRichEdit(ActiveControl);
     SendMessage(CE.Handle, EM_EXSETSEL, 0, Longint(@(p.chrg)));
     sURL := CE.SelText;
     ShellExecute(Handle, 'open', PChar(sURL), 0, 0, SW_SHOWNORMAL);
    except
    end;
   end;
  end;
 end;

 inherited;
end; (* TForm1.WndProc *)

procedure InitRichEditURLDetection(RE: TRichEdit);
var
  mask: Word;
begin
  mask := SendMessage(RE.Handle, EM_GETEVENTMASK, 0, 0);
  SendMessage(RE.Handle, EM_SETEVENTMASK, 0, mask or ENM_LINK);
  SendMessage(RE.Handle, EM_AUTOURLDETECT, Integer(True), 0);
end;


procedure TSplashScreen.FormShow(Sender: TObject);
begin
  InitRichEditURLDetection(RichEdit1);
end;

procedure TSplashScreen.FormCreate(Sender: TObject);
var
  t: string;
begin
  if FormLoaded then begin
    //RichEdit1.ScrollBars := ssVertical;
    Height := Height + 160;
  end;

  InitRichEditURLDetection(RichEdit1);

  t := 'Version 0.3 - Coded By Gareth' + #13#10#13#10 + 'www.aero-rat.com' + #13#10 +
  'www.wl-group.net' + #13#10#13#10 +
  'Contact: slhcoder@hotmail.co.uk' + #13#10;

  if FormLoaded then begin
    t := t + #13#10 + 'A big thanks to the beta testers for there hard work'
    + #13#10 + 'They are: ' + #13#10
    + 'Heike' + #13#10
    + 'TrD' + #13#10
    + 'crazyboris' + #13#10
    + 'tr4st' + #13#10
    + 'sat-iva' + #13#10
    + 'enone' + #13#10#13#10
    + 'Also big thanks to these people:' + #13#10
    +  'blizma (aka zetra)' + #13#10
    + 'spikey';
  end else begin
    t := t + #13#10 + 'Greetings' + #13#10;
  end;

  
  RichEdit1.SelStart := RichEdit1.GetTextLen;
  RichEdit1.SelAttributes.Color := clBlack;
  RichEdit1.SelAttributes.Size := 10;
  RichEdit1.SelText := t;



end;

end.
