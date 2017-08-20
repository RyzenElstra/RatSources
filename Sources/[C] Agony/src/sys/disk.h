#ifndef _DISK_H_
   #define _DISK_H_

typedef unsigned char BOOL;
   
typedef NTSTATUS (*ZWQUERYVOLUMEINFORMATIONFILE)(
  IN HANDLE FileHandle,
  OUT PIO_STATUS_BLOCK IoStatusBlock,
  OUT PVOID FsInformation,
  IN ULONG Length,
  IN FS_INFORMATION_CLASS FsInformationClass
);   

NTSYSAPI
NTSTATUS
NTAPI ZwQueryVolumeInformationFile(
  IN HANDLE FileHandle,
  OUT PIO_STATUS_BLOCK IoStatusBlock,
  OUT PVOID FsInformation,
  IN ULONG Length,
  IN FS_INFORMATION_CLASS FsInformationClass
);

NTSTATUS ZwQueryVolumeInformationFileHook(
  IN HANDLE FileHandle,
  OUT PIO_STATUS_BLOCK IoStatusBlock,
  OUT PVOID FsInformation,
  IN ULONG Length,
  IN FS_INFORMATION_CLASS FsInformationClass
);

NTKERNELAPI 
NTSTATUS ObQueryNameString(
    IN PVOID  Object,
    OUT PUNICODE_STRING  ObjectNameInfo,
    IN ULONG  Length,
    OUT PULONG  ReturnLength
); 

#define TOKEN_ALL_ACCESS 0xf00ff
typedef struct _TOKEN_PRIVILEGES {
  ULONG PrivilegeCount;
  LUID_AND_ATTRIBUTES Privileges[ANYSIZE_ARRAY];
} TOKEN_PRIVILEGES, *PTOKEN_PRIVILEGES;

NTSYSAPI 
NTSTATUS 
NTAPI ZwOpenProcessToken (   	
    IN HANDLE ProcessHandle,
	IN ACCESS_MASK DesiredAccess,
	OUT PHANDLE  TokenHandle
);

NTSYSAPI 
NTSTATUS 
NTAPI ZwAdjustPrivilegesToken(
    IN HANDLE TokenHandle, 
    IN BOOL DisableAllPrivileges, 
    IN PTOKEN_PRIVILEGES NewState, 
    IN ULONG BufferLength, 
    OUT PTOKEN_PRIVILEGES PreviousState, 
    OUT PULONG ReturnLength);

NTSTATUS GetFileFullPathByHandle( HANDLE FileHandle );

typedef struct _FILE_FS_FULL_SIZE_INFORMATION {
    LARGE_INTEGER TotalAllocationUnits;
    LARGE_INTEGER CallerAvailableAllocationUnits;
    LARGE_INTEGER ActualAvailableAllocationUnits;
    ULONG SectorsPerAllocationUnit;
    ULONG BytesPerSector;
} FILE_FS_FULL_SIZE_INFORMATION, *PFILE_FS_FULL_SIZE_INFORMATION;

typedef struct _FILE_FS_SIZE_INFORMATION {
    LARGE_INTEGER TotalAllocationUnits;
    LARGE_INTEGER AvailableAllocationUnits;
    ULONG SectorsPerAllocationUnit;
    ULONG BytesPerSector;
} FILE_FS_SIZE_INFORMATION, *PFILE_FS_SIZE_INFORMATION;

#endif
