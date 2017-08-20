#ifndef _PROCESS_H_
  #define _PROCESS_H_

typedef NTSTATUS (*ZWQUERYSYSTEMINFORMATION)(
     ULONG SystemInformationCLass,
     PVOID SystemInformation,
     ULONG SystemInformationLength,
     PULONG ReturnLength
);

// this is in process struct 
typedef struct _SYSTEM_THREAD_INFORMATION
{
        LARGE_INTEGER           KernelTime;
        LARGE_INTEGER           UserTime;
        LARGE_INTEGER           CreateTime;
        ULONG                   WaitTime;
        PVOID                   StartAddress;
        CLIENT_ID               ClientIs;
        KPRIORITY               Priority;
        KPRIORITY               BasePriority;
        ULONG                   ContextSwitchCount;
        ULONG                   ThreadState;
        KWAIT_REASON            WaitReason;
} SYSTEM_THREAD_INFORMATION, *PSYSTEM_THREAD_INFORMATION;

typedef struct _SYSTEM_PROCESS_INFORMATION {
    ULONG           NextEntryDelta;         // next process offset
    ULONG           ThreadCount;            // thread number
    ULONG           Reserved1[6];           // reserved
    LARGE_INTEGER   CreateTime;             // process creation time
    LARGE_INTEGER   UserTime;               // user mode time of the process
    LARGE_INTEGER   KernelTime;             // kernel mode time
    UNICODE_STRING  ProcessName;            // process name
    KPRIORITY       BasePriority;           // priority
    ULONG           ProcessId;              // pid
    ULONG           InheritedFromProcessId; // ppid
    ULONG           HandleCount;            // handles number
    ULONG           Reserved2[2];           // reserved
    VM_COUNTERS     VmCounters;             // virtual memory counter
#if _WIN32_WINNT >= 0x500                   
    IO_COUNTERS     IoCounters;             // I/O counter (win2k)
#endif
    SYSTEM_THREAD_INFORMATION Threads[1];   // process thread
} SYSTEM_PROCESS_INFORMATION, *PSYSTEM_PROCESS_INFORMATION;

NTSYSAPI
NTSTATUS
NTAPI ZwQuerySystemInformation(
            IN ULONG SystemInformationClass,
                        IN PVOID SystemInformation,
                        IN ULONG SystemInformationLength,
                        OUT PULONG ReturnLength);

NTSTATUS ZwQuerySystemInformationHook(
            IN ULONG SystemInformationClass,
            IN PVOID SystemInformation,
            IN ULONG SystemInformationLength,
            OUT PULONG ReturnLength);         

#endif
