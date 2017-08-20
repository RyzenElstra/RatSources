unit UnitVariables;

interface

uses
  Classes, Graphics;

const
  WM_USER = $0400;
  WM_POPUP_CONNECTION = WM_USER + 1; 
  WM_POPUP_DISCONNECTION = WM_USER + 2;
  WM_SHOW_EDITFILEFORM = WM_USER + 3;
  WM_SHOW_MODULESFORM = WM_USER + 4;
  WM_PROCESS_DATAS = WM_USER + 5;
  WM_REMOVE_CLIENT = WM_USER + 6;
  WM_TRANSFER_OK = WM_USER + 7;
  WM_TRANSFER_ERROR = WM_USER + 8;
  WM_SEND_DATAS = WM_USER + 9;
  WM_WELCOME_MSG = WM_USER + 10;
  WM_ERROR_MSG = WM_USER + 11;
  WM_ADD_EVENTLOG = WM_USER + 12;
                                                         
var
  //Main and settings variables            
  ClientsList: TList;
  MyBmp: TBitmap;   
  DBDatasList: TStringList;
  ConnectionPassword, ActivePortList,
  SettingsFile, GeoIpFile, PluginFile,
  DBFile, DBStatsFile, PortsSettings,
  DNSSettings, FTPSettings,
  PluginsPath, WindowsSettings: string;
  StartupListening, GeoIpLocalisation,
  SoundNotification, VisualNotification,
  MinimizeToTray, CloseToTray: Boolean;
  ThumbWidth, ThumbHeight, TimeOut,
  MaxConnections, SkinId: Integer;
  AutostartDesk, AutostartMic, SkinForm,
  SaveLogs, UpdateInfos, KeepAlive: Boolean;
  StartTime: Cardinal; //Variable used to get server uptime

  //FTP variables
  FtpHost, FtpUser, FtpPass, FtpDir, FtpFilename: string;
  FtpPort: Word;
                
  //DNS updater variables
  DNSHost, DNSUser, DNSPassword: string;
  DNSProvider: Integer;

implementation

end.

