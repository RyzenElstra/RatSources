#ifndef _PORT_H_
   #define _PORT_H_
   
typedef NTSTATUS (*ZWDEVICEIOCONTROLFILE)(
    IN HANDLE FileHandle,
    IN HANDLE Event OPTIONAL,
    IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
    IN PVOID ApcContext OPTIONAL,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN ULONG IoControlCode,
    IN PVOID InputBuffer OPTIONAL,
    IN ULONG InputBufferLength,
    OUT PVOID OutputBuffer OPTIONAL,
    IN ULONG OutputBufferLength
);      
   
   
NTSYSAPI
NTSTATUS
NTAPI ZwDeviceIoControlFile(
    IN HANDLE FileHandle,
    IN HANDLE Event OPTIONAL,
    IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
    IN PVOID ApcContext OPTIONAL,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN ULONG IoControlCode,
    IN PVOID InputBuffer OPTIONAL,
    IN ULONG InputBufferLength,
    OUT PVOID OutputBuffer OPTIONAL,
    IN ULONG OutputBufferLength
);

NTSTATUS ZwDeviceIoControlFileHook(
    IN HANDLE FileHandle,
    IN HANDLE Event OPTIONAL,
    IN PIO_APC_ROUTINE ApcRoutine OPTIONAL,
    IN PVOID ApcContext OPTIONAL,
    OUT PIO_STATUS_BLOCK IoStatusBlock,
    IN ULONG IoControlCode,
    IN PVOID InputBuffer OPTIONAL,
    IN ULONG InputBufferLength,
    OUT PVOID OutputBuffer OPTIONAL,
    IN ULONG OutputBufferLength
);


#define TCP_MIB_STATS_ID 1
#define TCP_MIB_ADDRTABLE_ENTRY_ID 0x101
#define TCP_MIB_ADDRTABLE_ENTRY_EX_ID 0x102
#define UDP_MIB_ADDRTABLE_ENTRY_ID 0x101
#define UDP_MIB_ADDRTABLE_ENTRY_EX_ID 0x102
// 0001 0000 0001

#define	CO_TL_ENTITY				0x400
#define	INFO_CLASS_PROTOCOL			0x200
#define	INFO_TYPE_PROVIDER			0x100

#define IOCTL_TCP_QUERY_INFORMATION_EX 0x00120003

typedef struct TCPAddrEntry {
    ULONG state;
    ULONG localAddr;
    ULONG localPort;
    ULONG remoteAddr;
    ULONG remotePort;
} TCPAddrEntry, *PTCPAddrEntry;

typedef struct TCPAddrExEntry {
    ULONG state;
    ULONG localAddr;
    ULONG localPort;
    ULONG remoteAddr;
    ULONG remotePort;
    ULONG processId;
} TCPAddrExEntry, *PTCPAddrExEntry;

typedef struct UDPAddrEntry {
    ULONG localAddr;
    ULONG localPort;
} UDPAddrEntry, *PUDPAddrEntry;

typedef struct UDPAddrExEntry {
    ULONG localAddr;
    ULONG localPort;
    ULONG pid;
} UDPAddrExEntry, *PUDPAddrExEntry;

typedef struct TDIEntityID {
	ULONG		tei_entity;
	ULONG		tei_instance;
} TDIEntityID, *PTDIEntityID;

typedef struct TDIObjectID {
	TDIEntityID	toi_entity;
	ULONG		toi_class;
	ULONG		toi_type;
	ULONG		toi_id;
} TDIObjectID, *PTDIObjectID;

// 0x1234 -> 0x2323 
#define ntohs(s)                            \
            ( ( ((s) >> 8) & 0x00FF ) |     \
              ( ((s) << 8) & 0xFF00 ) )

#endif
