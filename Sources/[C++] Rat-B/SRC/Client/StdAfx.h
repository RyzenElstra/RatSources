// stdafx.h : include file for standard system include files,
//  or project specific include files that are used frequently, but
//      are changed infrequently
//

#if !defined(AFX_STDAFX_H__FDE7628D_7F68_43DE_B909_C2B85EDFC9BB__INCLUDED_)
#define AFX_STDAFX_H__FDE7628D_7F68_43DE_B909_C2B85EDFC9BB__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#define VC_EXTRALEAN		// Exclude rarely-used stuff from Windows headers

#include <afxwin.h>         // MFC core and standard components
#include <afxext.h>         // MFC extensions
#include <afxdisp.h>        // MFC Automation classes
#include <afxdtctl.h>		// MFC support for Internet Explorer 4 Common Controls
#ifndef _AFX_NO_AFXCMN_SUPPORT
#include <afxcmn.h>			// MFC support for Windows Common Controls
#endif // _AFX_NO_AFXCMN_SUPPORT

#include <winsock2.h>

typedef	struct	ListCK
{
	SOCKET	sock;
	DWORD	dwIP;
	USHORT	uPort;
	USHORT	uID;
	struct	ListCK* Next;
}ListCK;

//////机器信息
typedef struct _MyComputerinfo {
	TCHAR		Myip[256];
	TCHAR		Myname[256];
} MyComputerinfo, * PMyComputerinfo;


//////////////////文件
typedef struct _MyFileInfo {
	TCHAR       szFileName[256];                //文件名
	TCHAR		type[64];						//类型
	TCHAR		size[64];						//大小
	TCHAR		time[128];						//日期/时间
	BOOL		Next;							//还有下一个?
} MyFileInfo, * PMyFileInfo;

typedef struct _MyCommand {
	UINT		CommandType;
	TCHAR		Parameter[256];
} MyCommand, * PMyCommand;

typedef struct tagFileInfo
{
	char filename[512];
	DWORD filesize;
}FILEINFO;

///////////////////进程
typedef struct _ProcessInfo {
	TCHAR		ProcName[256];
	UINT		PID;
	BOOL		Next;
} ProcessInfo, * PProcessInfo;

///////////////////CMD
typedef struct _CmdResult {
	TCHAR		Buff[4096];
	UINT		Next;
} CmdResult, * PCmdResult;


//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_STDAFX_H__FDE7628D_7F68_43DE_B909_C2B85EDFC9BB__INCLUDED_)
