// DlgFile.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "DlgFile.h"
#include "RunDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgFile dialog


CDlgFile::CDlgFile(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgFile::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgFile)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgFile::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgFile)
	DDX_Control(pDX, IDC_LIST_FILE, m_listfile);
	DDX_Control(pDX, IDC_LIST_DRIVER, m_listdrv);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgFile, CDialog)
	//{{AFX_MSG_MAP(CDlgFile)
	ON_BN_CLICKED(IDC_GetDriver, OnGetDriver)
	ON_NOTIFY(NM_RCLICK, IDC_LIST_FILE, OnRclickListFile)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST_DRIVER, OnDblclkListDriver)
	ON_NOTIFY(NM_DBLCLK, IDC_LIST_FILE, OnDblclkListFile)
	ON_COMMAND(ID_MENU_DEL, OnMenuDel)
	ON_COMMAND(ID_MENU_RUN, OnMenuRun)
	ON_COMMAND(ID_MENU_RE, OnMenuRe)
	ON_COMMAND(ID_MENU_UPFILE, OnMenuUpfile)
	ON_COMMAND(ID_MENU_DOWNFILE, OnMenuDownfile)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgFile message handlers

void CDlgFile::OnGetDriver() 
{
		char recvbuf[256];

		MyCommand mycommand;
		mycommand.CommandType = 1;

		send(sock,(char *)&mycommand,sizeof(mycommand),0);

		m_listdrv.DeleteAllItems();

		char sdriver[26][10];
		int  count=0;
		char iImage[26][2];
		recv(sock,recvbuf,256,0);

		for(UINT i=1;i<strlen(recvbuf)-1;i=i+3)
		{	
			sdriver[count][0]=recvbuf[i];
			sdriver[count][1]=':';
			sdriver[count][2]=0;
			iImage[count][0]=recvbuf[i+2];
			iImage[count][1]=0;			
			m_listdrv.InsertItem(count,sdriver[count],atoi(iImage[count]));
			count++;
		}	
}

void CDlgFile::Retrive()
{
	SetWindowText(path);
	m_listfile.DeleteAllItems();

	int					index=0;
	CString				nowpath;		//文件路径
	struct _MyFileInfo	fileinfo;
	int					imagecount;
	int					indeximage;
	MyCommand			mycommand;
	SHFILEINFO			shfi;

	nowpath=path+"\\*";			//当前文件路径
	imagecount=imagelists.GetImageCount();

	for(int j=1;j<imagecount;j++)
	{
		imagelists.Remove(j);
	}

	CImageList* pSmallImage;
	pSmallImage=m_listfile.GetImageList(LVSIL_SMALL);


	index=m_listfile.GetItemCount();
	m_listfile.InsertItem(index,".",0);
	m_listfile.SetItem(index,1,LVIF_TEXT,"DIR",0,0,0,NULL);
	index=m_listfile.GetItemCount();
	m_listfile.InsertItem(index,"..",0);
	m_listfile.SetItem(index,1,LVIF_TEXT,"DIR",0,0,0,NULL);
	
	
	mycommand.CommandType = 2;
	strcpy(mycommand.Parameter,(LPSTR)(LPCTSTR)nowpath);

	send(sock,(char *)&mycommand,sizeof(mycommand),0);

	char ret[2];
	recv(sock,ret,2,0);
	if(strcmp(ret,"q")==0)
	{
		MessageBox("打开文件夹出错");
		return;
	}

	//Sleep(200);
	do
	{
		memset(&fileinfo,0,sizeof(_MyFileInfo));
		recv(sock,(char*)&fileinfo,sizeof(_MyFileInfo),0);
		if(fileinfo.Next == 0)  //是否还有文件
			break;	
		
		memset(&shfi,0,sizeof(shfi));
		SHGetFileInfo(fileinfo.szFileName, 
			FILE_ATTRIBUTE_NORMAL, &shfi, sizeof(shfi),
			SHGFI_ICON|SHGFI_USEFILEATTRIBUTES|SHGFI_TYPENAME );

		index=m_listfile.GetItemCount();
		indeximage=pSmallImage->Add(shfi.hIcon);

		if(strcmp(fileinfo.type,"DIR")==0)
		{
			m_listfile.InsertItem(index,fileinfo.szFileName,0);
		}
		else
		{
			m_listfile.InsertItem(index,fileinfo.szFileName,indeximage);
		}
		m_listfile.SetItem(index,1,LVIF_TEXT,fileinfo.type,0,0,0,NULL);
		m_listfile.SetItem(index,2,LVIF_TEXT,fileinfo.size,0,0,0,NULL);
		m_listfile.SetItem(index,3,LVIF_TEXT,fileinfo.time,0,0,0,NULL);
		send(sock,"0",2,0);
	}while(fileinfo.Next!=0);
}

void CDlgFile::OnRclickListFile(NMHDR* pNMHDR, LRESULT* pResult) 
{
	POINT ptMouse;
	POINT ptClientMouse;

	GetCursorPos(&ptMouse);

	ptClientMouse=ptMouse;
	m_listfile.ScreenToClient(&ptClientMouse);
	int ListSel=m_listfile.HitTest(ptClientMouse,0);
	if(ListSel==-1)
		return;

	CMenu menu;
	VERIFY(menu.LoadMenu(IDR_MENU_FILEOPT));
	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);
	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, this);	
	*pResult = 0;
}

void CDlgFile::OnDblclkListDriver(NMHDR* pNMHDR, LRESULT* pResult) 
{
	if(m_listdrv.GetItemCount()<=0)
		return;
	LPNMLISTVIEW lpnmlv = (LPNMLISTVIEW)pNMHDR;
	if(lpnmlv->iItem>=0)
	{
		path=m_listdrv.GetItemText(lpnmlv->iItem ,0);
	}
	else
		return;
	Retrive();	
	*pResult = 0;
}

void CDlgFile::OnDblclkListFile(NMHDR* pNMHDR, LRESULT* pResult) 
{
	if(m_listfile.GetItemCount()<=0)
		return;
	LPNMLISTVIEW lpnmlv = (LPNMLISTVIEW)pNMHDR;
	if(lpnmlv->iItem>=0)
	{
		CString filename,type;
		filename=m_listfile.GetItemText(lpnmlv->iItem,0);
		type=m_listfile.GetItemText(lpnmlv->iItem,1);
		if(type=="DIR")
		{
			if(filename==".")
				goto there;
			else if(filename=="..")
			{
				int findc=path.ReverseFind('\\');
				if(findc==-1)
					goto there;
				path=path.Left(findc);
			}
			else
			{
				path=path+"\\"+filename;
			}
			AfxGetApp()->DoWaitCursor(1);
			Retrive();
			AfxGetApp()->DoWaitCursor(0);
		}
	}
there:
	*pResult = 0;
}

void CDlgFile::OnMenuDel() 
{
	if(MessageBox( "确定要删除吗?","提示",MB_YESNO)!=IDYES)
		return;
	CString filename,delpath;
	int nItem = m_listfile.GetSelectionMark();
	filename = m_listfile.GetItemText(nItem,0);
	delpath = path + "\\" + filename;
	MyCommand delcommand;
	char ret[2];
	delcommand.CommandType = 4;
	strcpy(delcommand.Parameter,(LPSTR)(LPCTSTR)delpath);
	send(sock,(char *)&delcommand,sizeof(delcommand),0);
	recv(sock,ret,2,0);
	if(atoi(ret)==0)
	{
		AfxMessageBox("删除成功");
		m_listfile.DeleteItem(nItem);
	}
	else
		AfxMessageBox("删除失败");
	
}

void CDlgFile::OnMenuRun() 
{
	CRunDlg dlgRun;
	CString filename;
	int nItem = m_listfile.GetSelectionMark();
	filename = m_listfile.GetItemText(nItem,0);
	dlgRun.bufpath = path + "\\" + filename;
	dlgRun.sock = sock;
	dlgRun.DoModal();	
}

void CDlgFile::OnMenuRe() 
{
	Retrive();
	
}

void CDlgFile::OnMenuUpfile() 
{
	CString LocalFilePath,RemoteFilePath;
	FILEINFO fi;
	MyCommand upfile;
	HANDLE hFile, hMapping;
	char* basepointer =NULL;

	upfile.CommandType = 5;

    CFileDialog fileDialog(TRUE,NULL,NULL,NULL,"所有文件(*.*)|*.*||");

	if (fileDialog.DoModal() == IDOK) 
	{
		LocalFilePath = fileDialog.GetPathName(); 
		UpdateData(FALSE);
	}	

	RemoteFilePath = path + "\\" + fileDialog.GetFileName();
	strcpy(fi.filename,RemoteFilePath);

	if ((hFile = CreateFile(LocalFilePath, GENERIC_READ, FILE_SHARE_READ, 0, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, 0)) == INVALID_HANDLE_VALUE)
	{
		MessageBox("打开本地文件出错");
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

	send(sock,(char *)&upfile,sizeof(upfile),0);
	send(sock,(char *)&fi,sizeof(fi),0);

	int i = send(sock,basepointer,fi.filesize,0);

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

	char ret[9];
	recv(sock,ret,9,0);
	if(strcmp(ret,"upfileok")==0)
	{
		MessageBox("上传成功");
		Retrive();
	}
	else
		MessageBox("上传失败");	
}

void CDlgFile::OnMenuDownfile() 
{
	CString filename,RemoteFilePath;
	int nItem = m_listfile.GetSelectionMark();
	filename = m_listfile.GetItemText(nItem,0);
	RemoteFilePath = path + "\\" + filename;

	CString LocalFilePath;
	FILEINFO fi;
	int ret;

	MyCommand Downfile;
	Downfile.CommandType = 6;///////////////////////////////
	strcpy(Downfile.Parameter,RemoteFilePath); 
	send(sock,(char *)&Downfile,sizeof(Downfile),0);
	recv(sock,(char *)&fi,sizeof(fi),0);

	CFileDialog fileDialog( FALSE,"*.*",filename,NULL,"All Files(*.*)|*.*||");
	if (fileDialog.DoModal() == IDOK) 
	{
		LocalFilePath = fileDialog.GetPathName();
		UpdateData(FALSE);
	}
	//CFileDialog Save( FALSE,"*.*",
	
	HANDLE  hf = CreateFile(LocalFilePath,GENERIC_WRITE,FILE_SHARE_WRITE,NULL,CREATE_ALWAYS,FILE_ATTRIBUTE_NORMAL,NULL);
	if ( hf <= 0 )
	{
		return;
	}
	DWORD   Size = fi.filesize;

	while ( Size > 0 )
	{
		char fbuf[1024] = {0};
		ret = recv(sock,fbuf,1024,0);

		if ( ret == -1 )
		{
			CloseHandle(hf);
			return;
		}
		else
		{
			Size-=ret;
			DWORD	A;
			if ( !WriteFile(hf,fbuf,ret,&A,NULL) )
			{
				return;
			}
		}			
	}
	CloseHandle(hf);
	MessageBox("下载成功");	
}
