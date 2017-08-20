{------------------------------------------------------------------------------
  WinSvcEx v1.0 beta
 ------------------------------------------------------------------------------
  Copyright 2002 by GSC.
 ------------------------------------------------------------------------------
  With this unit you may use the new function introduced in Windows 2000 for
  service handling.

  The unit loads the requied functions dynamic so you get a nil pointer
  if the running system is not NT or older than Windows 2000.
  Look at the end of this file for code.

  Prototypes converted from WinSvc.h of "Microsoft Platform SDK, 2000 June".
  Module load code from ZeosLib.

  Please send me feedback or buginfo to info@gsc.hu. Subject to type: WinSvcEx
 ------------------------------------------------------------------------------
  Date last modified: Jun 03, 2002
 ------------------------------------------------------------------------------
}
unit WinSvcEx;

interface

uses Windows, WinSvc;

const
//
// Service config info levels
//
  SERVICE_CONFIG_DESCRIPTION     = 1;
  SERVICE_CONFIG_FAILURE_ACTIONS = 2;

//
// DLL name of imported functions
//
  AdvApiDLL = 'advapi32.dll';
type
//
// Service description string
//
  PServiceDescriptionA = ^TServiceDescriptionA;
  PServiceDescriptionW = ^TServiceDescriptionW;
  PServiceDescription = PServiceDescriptionA;
  {$EXTERNALSYM _SERVICE_DESCRIPTIONA}
  _SERVICE_DESCRIPTIONA = record
    lpDescription : PAnsiChar;
  end;
  {$EXTERNALSYM _SERVICE_DESCRIPTIONW}
  _SERVICE_DESCRIPTIONW = record
    lpDescription : PWideChar;
  end;
  {$EXTERNALSYM _SERVICE_DESCRIPTION}
  _SERVICE_DESCRIPTION = _SERVICE_DESCRIPTIONA;
  {$EXTERNALSYM SERVICE_DESCRIPTIONA}
  SERVICE_DESCRIPTIONA = _SERVICE_DESCRIPTIONA;
  {$EXTERNALSYM SERVICE_DESCRIPTIONW}
  SERVICE_DESCRIPTIONW = _SERVICE_DESCRIPTIONW;
  {$EXTERNALSYM SERVICE_DESCRIPTION}
  SERVICE_DESCRIPTION = _SERVICE_DESCRIPTIONA;
  TServiceDescriptionA = _SERVICE_DESCRIPTIONA;
  TServiceDescriptionW = _SERVICE_DESCRIPTIONW;
  TServiceDescription = TServiceDescriptionA;

//
// Actions to take on service failure
//
  {$EXTERNALSYM _SC_ACTION_TYPE}
  _SC_ACTION_TYPE = (SC_ACTION_NONE, SC_ACTION_RESTART, SC_ACTION_REBOOT, SC_ACTION_RUN_COMMAND);
  {$EXTERNALSYM SC_ACTION_TYPE}
  SC_ACTION_TYPE = _SC_ACTION_TYPE;

  PServiceAction = ^TServiceAction;
  {$EXTERNALSYM _SC_ACTION}
  _SC_ACTION = record
    aType : SC_ACTION_TYPE;
    Delay : DWORD;
  end;
  {$EXTERNALSYM SC_ACTION}
  SC_ACTION = _SC_ACTION;
  TServiceAction = _SC_ACTION;

  PServiceFailureActionsA = ^TServiceFailureActionsA;
  PServiceFailureActionsW = ^TServiceFailureActionsW;
  PServiceFailureActions = PServiceFailureActionsA;
  {$EXTERNALSYM _SERVICE_FAILURE_ACTIONSA}
  _SERVICE_FAILURE_ACTIONSA = record
    dwResetPeriod : DWORD;
    lpRebootMsg : LPSTR;
    lpCommand : LPSTR;
    cActions : DWORD;
    lpsaActions : ^SC_ACTION;
  end;
  {$EXTERNALSYM _SERVICE_FAILURE_ACTIONSW}
  _SERVICE_FAILURE_ACTIONSW = record
    dwResetPeriod : DWORD;
    lpRebootMsg : LPWSTR;
    lpCommand : LPWSTR;
    cActions : DWORD;
    lpsaActions : ^SC_ACTION;
  end;
  {$EXTERNALSYM _SERVICE_FAILURE_ACTIONS}
  _SERVICE_FAILURE_ACTIONS = _SERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONSA}
  SERVICE_FAILURE_ACTIONSA = _SERVICE_FAILURE_ACTIONSA;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONSW}
  SERVICE_FAILURE_ACTIONSW = _SERVICE_FAILURE_ACTIONSW;
  {$EXTERNALSYM SERVICE_FAILURE_ACTIONS}
  SERVICE_FAILURE_ACTIONS = _SERVICE_FAILURE_ACTIONSA;
  TServiceFailureActionsA = _SERVICE_FAILURE_ACTIONSA;
  TServiceFailureActionsW = _SERVICE_FAILURE_ACTIONSW;
  TServiceFailureActions = TServiceFailureActionsA;

///////////////////////////////////////////////////////////////////////////
// API Function Prototypes
///////////////////////////////////////////////////////////////////////////
  TQueryServiceConfig2 = function (hService : SC_HANDLE; dwInfoLevel : DWORD; lpBuffer : pointer;
    cbBufSize : DWORD; var pcbBytesNeeded) : BOOL; stdcall;
  TChangeServiceConfig2 = function (hService : SC_HANDLE; dwInfoLevel : DWORD; lpInfo : pointer) : BOOL; stdcall;

var
  hDLL : THandle ;
  LibLoaded : boolean ;

var
  OSVersionInfo : TOSVersionInfo;

  {$EXTERNALSYM QueryServiceConfig2A}
  QueryServiceConfig2A : TQueryServiceConfig2;
  {$EXTERNALSYM QueryServiceConfig2W}
  QueryServiceConfig2W : TQueryServiceConfig2;
  {$EXTERNALSYM QueryServiceConfig2}
  QueryServiceConfig2 : TQueryServiceConfig2;

  {$EXTERNALSYM ChangeServiceConfig2A}
  ChangeServiceConfig2A : TChangeServiceConfig2;
  {$EXTERNALSYM ChangeServiceConfig2W}
  ChangeServiceConfig2W : TChangeServiceConfig2;
  {$EXTERNALSYM ChangeServiceConfig2}
  ChangeServiceConfig2 : TChangeServiceConfig2;

implementation

initialization
  OSVersionInfo.dwOSVersionInfoSize := SizeOf(OSVersionInfo);
  GetVersionEx(OSVersionInfo);
  if (OSVersionInfo.dwPlatformId = VER_PLATFORM_WIN32_NT) and (OSVersionInfo.dwMajorVersion >= 5) then
    begin
      if hDLL = 0 then
        begin
          hDLL:=GetModuleHandle(AdvApiDLL);
          LibLoaded := False;
          if hDLL = 0 then
            begin
              hDLL := LoadLibrary(AdvApiDLL);
              LibLoaded := True;
            end;
        end;

      if hDLL <> 0 then
        begin
          @QueryServiceConfig2A  := GetProcAddress(hDLL, 'QueryServiceConfig2A');
          @QueryServiceConfig2W  := GetProcAddress(hDLL, 'QueryServiceConfig2W');
          @QueryServiceConfig2   := @QueryServiceConfig2A;
          @ChangeServiceConfig2A := GetProcAddress(hDLL, 'ChangeServiceConfig2A');
          @ChangeServiceConfig2W := GetProcAddress(hDLL, 'ChangeServiceConfig2W');
          @ChangeServiceConfig2  := @ChangeServiceConfig2A;
        end;
    end
    else
    begin
      @QueryServiceConfig2A := nil;
      @QueryServiceConfig2W := nil;
      @QueryServiceConfig2 := nil;
      @ChangeServiceConfig2A := nil;
      @ChangeServiceConfig2W := nil;
      @ChangeServiceConfig2  := nil;
    end;

finalization
  if (hDLL <> 0) and LibLoaded then
    FreeLibrary(hDLL);

end.
