// ClientDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "ClientDlg.h"
#include "DlgConn.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

BOOL bStart;
USHORT	TallID;
ListCK *ListHead;

/////////////////////////////////////////////////////////////////////////////
// CAboutDlg dialog used for App About

class CAboutDlg : public CDialog
{
public:
	CAboutDlg();

// Dialog Data
	//{{AFX_DATA(CAboutDlg)
	enum { IDD = IDD_ABOUTBOX };
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CAboutDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	//{{AFX_MSG(CAboutDlg)
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialog(CAboutDlg::IDD)
{
	//{{AFX_DATA_INIT(CAboutDlg)
	//}}AFX_DATA_INIT
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CAboutDlg)
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialog)
	//{{AFX_MSG_MAP(CAboutDlg)
		// No message handlers
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CClientDlg dialog

CClientDlg::CClientDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CClientDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CClientDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CClientDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CClientDlg)
	DDX_Control(pDX, IDC_EDIT_PORT, m_CEditPort);
	DDX_Control(pDX, IDC_COMBO_IP, m_LocalIPList);
	DDX_Control(pDX, IDC_LIST_COMPUTER, m_List);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CClientDlg, CDialog)
	//{{AFX_MSG_MAP(CClientDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_BUTTON_START, OnButtonStart)
	ON_BN_CLICKED(IDC_BUTTON_STOP, OnButtonStop)
	ON_NOTIFY(NM_RCLICK, IDC_LIST_COMPUTER, OnRclickListComputer)
	ON_COMMAND(ID_MENU_CONNECT, OnMenuConnect)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CClientDlg message handlers

BOOL CClientDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Add "About..." menu item to system menu.

	// IDM_ABOUTBOX must be in the system command range.
	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		CString strAboutMenu;
		strAboutMenu.LoadString(IDS_ABOUTBOX);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon
	
	// TODO: Add extra initialization here
	CRect tRect;
	m_List.GetWindowRect( &tRect );
	m_List.InsertColumn(0,"ID",LVCFMT_LEFT,30);
	m_List.InsertColumn(1,"IP List",LVCFMT_LEFT,240);
	m_List.InsertColumn(2,"Compter name",LVCFMT_LEFT,150);
	m_List.SetExtendedStyle(LVS_EX_FULLROWSELECT);

	AddLocalIPToList();

	m_CEditPort.SetWindowText("80");

	CWnd *pBS = GetDlgItem(IDC_BUTTON_STOP);
	pBS->EnableWindow(FALSE);
//	BOOL bStart = FALSE;
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CClientDlg::OnSysCommand(UINT nID, LPARAM lParam)
{
	if ((nID & 0xFFF0) == IDM_ABOUTBOX)
	{
		CAboutDlg dlgAbout;
		dlgAbout.DoModal();
	}
	else
	{
		CDialog::OnSysCommand(nID, lParam);
	}
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CClientDlg::OnPaint() 
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, (WPARAM) dc.GetSafeHdc(), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CClientDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CClientDlg::AddLocalIPToList()
{
	WSADATA WSAData; 
    if (WSAStartup(MAKEWORD(2,2), &WSAData)!=0)
    { 
        AfxMessageBox("WSAStartup Error!");
        exit(-1);
    }
	DWORD dwIP=0;
    int i=0;
    struct hostent* lp = NULL;
    char HostName[255] = {0};
    gethostname(HostName,255);
    lp = gethostbyname (HostName);
    while ( lp->h_addr_list[i] != NULL )
	{
		dwIP = *(DWORD*)lp->h_addr_list[i++];
		struct in_addr A = {0};
		A.S_un.S_addr = dwIP;
		char *p = inet_ntoa(A);
		m_LocalIPList.InsertString(0,p);
	}
	m_LocalIPList.SetCurSel(0);
}

void  AddToCKList ( ListCK* lp )
{
	if ( ListHead == NULL )
		ListHead = lp;
	else
	{
		ListCK* temp = ListHead;
		ListHead = lp;
		lp->Next = temp;
	}
}

void AddStrToListCtrl(CListCtrl* lpList,CString str,CString str1)
{
	int tail = lpList->GetItemCount();
	lpList->InsertItem(tail,"");
	CString num;
	num.Format("%d",TallID);
	lpList->SetItemText(tail,0,num);
	lpList->SetItemText(tail,1,str);
	lpList->SetItemText(tail,2,str1);
}

DWORD WINAPI AcceptFunc ( LPVOID lpParameter )
{
	// INIT
	ListCK* lp = (ListCK*) lpParameter;
	DWORD LocalIP = lp->dwIP;
	USHORT LocalPort = lp->uPort;
	CListCtrl* lpList = (CListCtrl*)lp->Next;
	/////////////////////

	SOCKET	sock = NULL;
	sock = socket(AF_INET, SOCK_STREAM , IPPROTO_TCP);
	if ( sock == INVALID_SOCKET )
	{
		AfxMessageBox("socket init error");
		return -1;
	}
	SOCKADDR_IN addr_in = {0};
	addr_in.sin_addr.S_un.S_addr = LocalIP;
	addr_in.sin_family = AF_INET;
	addr_in.sin_port = htons(LocalPort);

	Sleep(100);
	int ret = 0;
	ret = bind (sock, (struct sockaddr*)&addr_in,sizeof(addr_in) );
	if ( ret == SOCKET_ERROR )
	{
		AfxMessageBox("bind error");
		return -1;
	}
	listen(sock,1);
	ULONG L=0;
	ret = ioctlsocket(sock,FIONBIO,&L);

	while ( TRUE )
	{
		if ( bStart == TRUE )
		{

			fd_set  fdR;
			struct  timeval timeout;
			timeout.tv_sec = 2;
			timeout.tv_usec = 0;
			FD_ZERO(&fdR);  
			FD_SET(sock, &fdR);
			
			switch (select(sock + 1, &fdR, NULL,NULL, &timeout))
			{  
                case SOCKET_ERROR:
					break;
                        
                case 0:  
					break;
                        
                default:  
                        if ( FD_ISSET(sock,&fdR) )
						{  
							SOCKADDR_IN A = {0};
							int len = sizeof(A);

							SOCKET  s = accept(sock,(struct sockaddr *)&A,&len);
							if ( s != INVALID_SOCKET )
							{
								int oldopt = 0;
								int ret;
								int len = sizeof(int);
								ret = getsockopt (s,SOL_SOCKET, SO_RCVTIMEO,(char*)&oldopt,&len);
								int newopt = 3000;
								ret = setsockopt (s,SOL_SOCKET, SO_RCVTIMEO,(char*)&newopt,len);

								char cFlag[8];

								recv(s,cFlag,8,0);//接收标志 确认是 本软件的 client 端

								//AfxMessageBox(cFlag);
								if(strncmp(cFlag,"fxftest",7))
								{
									return 0;
								}
								AfxMessageBox("online");
								send(s,cFlag,8,0); // 发送server端标志
						
								MyComputerinfo mycomputerinfo;
								recv(s,(char *)&mycomputerinfo,sizeof(mycomputerinfo),0);

								char *p = inet_ntoa(A.sin_addr);   //获取被控机ip

								//Add to CKList
								ListCK *tp =(ListCK *)calloc(1,sizeof(ListCK));
								tp->dwIP = A.sin_addr.S_un.S_addr;
								tp->sock = s;
								tp->Next = NULL;
								tp->uID = TallID;
								AddToCKList(tp);
								//add to m_List
								strcat(p,"/");
								strcat(p,mycomputerinfo.Myip);
								AddStrToListCtrl(lpList,p,mycomputerinfo.Myname);												
								TallID++;
								ret = setsockopt (s,SOL_SOCKET, SO_RCVTIMEO,(char*)&oldopt,len);

							}
						}
			}
			FD_CLR(sock, &fdR);
		}
		else
		{
			closesocket(sock);
			return 1;
		}
	}

	return 1;
}


void CClientDlg::OnButtonStart() 
{
	CString Temp;
	m_CEditPort.GetWindowText(Temp);

	ULONG port=0;
	port = atoi(Temp);

	if ( port <=0 || port >65535 )
	{
		AfxMessageBox("Port Number Error");
		return;
	}
	/////////////////////////////////////////
	int index = m_LocalIPList.GetCurSel();
	m_LocalIPList.GetLBText(index,Temp);
	DWORD	dwIP = inet_addr(Temp);
	CurLocalIP = dwIP;
	/////////////////////////////////////////

	ListCK TempData = {0};
	TempData.dwIP = dwIP;
	TempData.uPort = (USHORT)port;
	TempData.Next = (ListCK*)&m_List;

	DWORD ThreadId;
	HANDLE h = CreateThread(NULL,NULL, AcceptFunc,&TempData,0,&ThreadId);
	if ( h == NULL )
	{
		AfxMessageBox("CreateThread False!");
		return;
	}
	bStart = TRUE;
	CWnd *pBS = GetDlgItem(IDC_BUTTON_START);
	pBS->EnableWindow(FALSE);
	Sleep(250);
	pBS = GetDlgItem(IDC_BUTTON_STOP);
	pBS->EnableWindow(TRUE);
	
}

void CClientDlg::OnButtonStop() 
{
	bStart = FALSE;
	CWnd *pBS = GetDlgItem(IDC_BUTTON_STOP);
	pBS->EnableWindow(FALSE);
	Sleep(500);
	pBS = GetDlgItem(IDC_BUTTON_START);
	pBS->EnableWindow(TRUE);	
}

void CClientDlg::OnRclickListComputer(NMHDR* pNMHDR, LRESULT* pResult) 
{
	POINT ptMouse;
	POINT ptClientMouse;

	GetCursorPos(&ptMouse);

	ptClientMouse=ptMouse;
	m_List.ScreenToClient(&ptClientMouse);
	int ListSel=m_List.HitTest(ptClientMouse,0);
	if(ListSel==-1)
		return;

	CMenu menu;
	VERIFY(menu.LoadMenu(IDR_MENU_CONNECT));
	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);
	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, this);	
	*pResult = 0;
}

void CClientDlg::OnMenuConnect() 
{
	CString CurID;
	CString WindowTitle,Titleip,Titlename;
	int curnum = m_List.GetNextItem(-1,LVNI_SELECTED);
	CurID = m_List.GetItemText(curnum,0);
	Titleip=m_List.GetItemText(curnum,1);
	Titlename=m_List.GetItemText(curnum,2);
	WindowTitle = "ID:" + CurID + " " + Titleip + " " +Titlename;
	SOCKET sock = FindSocket(CurID);
	if ( sock == INVALID_SOCKET )
	{

		int  index = m_List.GetNextItem(-1,LVNI_SELECTED);
		m_List.DeleteItem(index);
		AfxMessageBox("Connect Error");
		return;
	}

	if(StartService(sock))
	{
		CDlgConn *dlgConnect = new CDlgConn;
		dlgConnect->sock = sock;
		dlgConnect->WindowTitle = WindowTitle;
		dlgConnect ->Create(IDD_DIALOG_CONNECT,this);
		dlgConnect->ShowWindow(SW_SHOW);
		//AddToActiveList(CurID,dlgConnect);
	}
	else
	{
		int  index = m_List.GetNextItem(-1,LVNI_SELECTED);
		m_List.DeleteItem(index);
		AfxMessageBox("Connect Error");
	}
}

SOCKET CClientDlg::FindSocket(CString CurID)
{
	int curNum = atoi(CurID);
	if ( ListHead == NULL )
		return INVALID_SOCKET;

	ListCK* Th = ListHead;
	while ( Th )
	{
		if ( Th -> uID == curNum )
		{
			DWORD	dwIP = Th->dwIP;
			//CString ip;
			//ip = inet_ntoa(*(struct in_addr*)&dwIP);
			//MessageBox(ip);
			return Th->sock;
		}
		else	Th = Th->Next;
	}
	return	INVALID_SOCKET;
}

BOOL CClientDlg::StartService(SOCKET sock)
{
	MyCommand testconn;
	testconn.CommandType = 12;
	char testconnbuf[8] = "fxftest";
	int oldopt = 0;
	int len = sizeof(int);
	int ret = getsockopt (sock,SOL_SOCKET, SO_RCVTIMEO,(char*)&oldopt,&len);
	if ( ret == -1 )
		return	FALSE;

	int newopt = 3000;
	ret = setsockopt (sock,SOL_SOCKET, SO_RCVTIMEO,(char*)&newopt,len);
	if ( ret == -1 )
		return	FALSE;


	ret = send(sock,(char *)&testconn,sizeof(testconn),0);
	if( ret != sizeof(testconn))
		return FALSE;

	ret = send(sock,testconnbuf,strlen(testconnbuf),0);
	if ( ret != 7 )
		return	FALSE;

	char buf[64]={0};
	ret = recv(sock,buf,64,0);

	if ( ret != 7 )
		return	FALSE;

	ret = strcmp(buf,"fxftest");
	if ( ret != 0 )
		return	FALSE;

	ret = setsockopt (sock,SOL_SOCKET, SO_RCVTIMEO,(char*)&oldopt,len);
	if ( ret == -1 )
		return	FALSE;

	return	TRUE;

}
