#ifndef _FILE_H_
  #define _FILE_H_


typedef NTSTATUS (*ZWQUERYDIRECTORYFILE)(
		IN HANDLE FileHandle,
		IN HANDLE Event OPTIONAL,
		IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
		IN PVOID ApcContext OPTIONAL,
		OUT PIO_STATUS_BLOCK IoStatusBlock,
		OUT PVOID FileInformation,
		IN ULONG FileInformationLength,
		IN FILE_INFORMATION_CLASS FileInformationClass,
		IN BOOLEAN ReturnSingleEntry,
		IN PUNICODE_STRING FileName OPTIONAL,
		IN BOOLEAN RestartScan
);

NTSYSAPI
NTSTATUS
NTAPI ZwQueryDirectoryFile(
		IN HANDLE FileHandle,
		IN HANDLE Event OPTIONAL,
		IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
		IN PVOID ApcContext OPTIONAL,
		OUT PIO_STATUS_BLOCK IoStatusBlock,
		OUT PVOID FileInformation,
		IN ULONG FileInformationLength,
		IN FILE_INFORMATION_CLASS FileInformationClass,
		IN BOOLEAN ReturnSingleEntry,
		IN PUNICODE_STRING FileName OPTIONAL,
		IN BOOLEAN RestartScan
);

NTSTATUS ZwQueryDirectoryFileHook(
		IN HANDLE FileHandle,
		IN HANDLE Event OPTIONAL,
		IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
		IN PVOID ApcContext OPTIONAL,
		OUT PIO_STATUS_BLOCK IoStatusBlock,
		OUT PVOID FileInformation,
		IN ULONG FileInformationLength,
		IN FILE_INFORMATION_CLASS FileInformationClass,
		IN BOOLEAN ReturnSingleEntry,
		IN PUNICODE_STRING FileName OPTIONAL,
		IN BOOLEAN RestartScan
);


typedef struct   // FileInformationClass == FileBothDirectoryInformation 	
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      LARGE_INTEGER   CreationTime;
      LARGE_INTEGER   LastAccessTime;
      LARGE_INTEGER   LastWriteTime;
      LARGE_INTEGER   ChangeTime;
      LARGE_INTEGER   EndOfFile;
      LARGE_INTEGER   AllocationSize;
      ULONG         FileAttributes;
      ULONG         FileNameLength;
      ULONG         EaSize;
      CCHAR         ShortNameLength;
      WCHAR         ShortName[12];
      WCHAR         FileName[1];
} FILE_BOTH_DIR_INFORMATION, *PFILE_BOTH_DIR_INFORMATION;


typedef struct   // FileInformationClass == FileDirectoryInformation
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      LARGE_INTEGER   CreationTime;
      LARGE_INTEGER   LastAccessTime;
      LARGE_INTEGER   LastWriteTime;
      LARGE_INTEGER   ChangeTime;
      LARGE_INTEGER   EndOfFile;
      LARGE_INTEGER   AllocationSize;
      ULONG         FileAttributes;
      ULONG         FileNameLength;
      WCHAR         FileName[1];
} FILE_DIRECTORY_INFORMATION, *PFILE_DIRECTORY_INFORMATION;

typedef struct   // FileInformationClass == FileIdBothDirectoryInformation
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      LARGE_INTEGER   CreationTime;
      LARGE_INTEGER   LastAccessTime;
      LARGE_INTEGER   LastWriteTime;
      LARGE_INTEGER   ChangeTime;
      LARGE_INTEGER   EndOfFile;
      LARGE_INTEGER   AllocationSize;
      ULONG         FileAttributes;
      ULONG         FileNameLength;
      ULONG         EaSize;
      CCHAR         ShortNameLength;
      WCHAR         ShortName[12];
      LARGE_INTEGER   File_Id;
      WCHAR         FileName[1];
} FILE_ID_BOTH_DIR_INFORMATION, *PFILE_ID_BOTH_DIR_INFORMATION;

typedef struct   // FileInformationClass ==FileIdFullDirectoryInformation 
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      LARGE_INTEGER   CreationTime;
      LARGE_INTEGER   LastAccessTime;
      LARGE_INTEGER   LastWriteTime;
      LARGE_INTEGER   ChangeTime;
      LARGE_INTEGER   EndOfFile;
      LARGE_INTEGER   AllocationSize;
      ULONG         FileAttributes;
      ULONG         FileNameLength;
      ULONG         EaSize;
      LARGE_INTEGER   File_Id;
      WCHAR         FileName[1];
} FILE_ID_FULL_DIR_INFORMATION, *PFILE_ID_FULL_DIR_INFORMATION;

typedef struct  // FileInformationClass == FileFullDirectoryInformation
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      LARGE_INTEGER   CreationTime;
      LARGE_INTEGER   LastAccessTime;
      LARGE_INTEGER   LastWriteTime;
      LARGE_INTEGER   ChangeTime;
      LARGE_INTEGER   EndOfFile;
      LARGE_INTEGER   AllocationSize;
      ULONG         FileAttributes;
      ULONG         FileNameLength;
      ULONG         EaSize;
      WCHAR         FileName[1];
} FILE_FULL_DIR_INFORMATION, *PFILE_FULL_DIR_INFORMATION;


typedef struct   // FileInformationClass == FileNamesInformation
{
      ULONG         NextEntryOffset;
      ULONG         FileIndex;
      ULONG         FileNameLength;
      WCHAR         FileName[1];
} FILE_NAMES_INFORMATION, *PFILE_NAMES_INFORMATION;


#endif
