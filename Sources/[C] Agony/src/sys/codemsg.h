#ifndef _DEFINE_H_
   #define _DEFINE_H_

// _number:    0 -> 2047 : reserved for Microsoft
//    2047 -> 4095 : reserved for OEMs       
#define CODEMSG(_number) CTL_CODE(FILE_DEVICE_UNKNOWN,_number , METHOD_BUFFERED,\
                                FILE_READ_DATA | FILE_WRITE_DATA)       

#define NO_MSG 2048
#define SERVICE_CODE 4086
#define DISK_SPACE_CODE 4087
#define TCP_PORT_CODE 4088
#define UDP_PORT_CODE 4089
#define PROCESS_CODE 4090
#define FILE_CODE 4091
#define REGKEY_CODE 4092
#define REGVALUE_CODE 4093 
#define START_CODE 4094
#define STOP_CODE 4095

#endif
