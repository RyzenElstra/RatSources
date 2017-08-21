// DlgConn.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "DlgConn.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgConn dialog


CDlgConn::CDlgConn(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgConn::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgConn)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgConn::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgConn)
	DDX_Control(pDX, IDC_TAB, m_sheet);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgConn, CDialog)
	//{{AFX_MSG_MAP(CDlgConn)
	ON_BN_CLICKED(IDC_BUTTON1, OnButton1)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgConn message handlers

BOOL CDlgConn::OnInitDialog()
{
	CDialog::OnInitDialog();
	SetWindowText(WindowTitle);
	Sleep(200);
	m_sheet.AddPage("FILE", &m_dlgfile, IDD_DIALOG_FILE);
	m_sheet.AddPage("PROCESS", &m_dlgproc, IDD_DIALOG_PROC);
	m_sheet.AddPage("CMD",&m_dlgcmd,IDD_DIALOG_CMD);
	m_sheet.Show();

	m_dlgfile.m_listfile.InsertColumn(0,"Name",LVCFMT_LEFT,80,0);
	m_dlgfile.m_listfile.InsertColumn(1,"Type",LVCFMT_LEFT,80,1);
	m_dlgfile.m_listfile.InsertColumn(2,"Size",LVCFMT_LEFT,45,2);
	m_dlgfile.m_listfile.InsertColumn(3,"Time",LVCFMT_LEFT,200,3);
	m_dlgfile.m_listdrv.InsertColumn(0,"Driver",LVCFMT_LEFT,100,0);

	m_dlgfile.imagelists.Create(16,16,ILC_MASK,16,1);
	m_dlgfile.imagelists.Add(AfxGetApp()->LoadIcon(IDI_DIR));
	m_dlgfile.m_listfile.SetImageList(&m_dlgfile.imagelists,LVSIL_SMALL);

	if(!m_dlgfile.image.Create(16,16,ILC_MASK,4,1))
		return FALSE;
	m_dlgfile.image.Add(AfxGetApp()->LoadIcon(IDI_DRIVER_A));
	m_dlgfile.image.Add(AfxGetApp()->LoadIcon(IDI_DRIVER_FIX));
	m_dlgfile.image.Add(AfxGetApp()->LoadIcon(IDI_DRIVER_CD));
	m_dlgfile.image.Add(AfxGetApp()->LoadIcon(IDI_DRIVER_NET));
	m_dlgfile.m_listdrv.SetImageList(&m_dlgfile.image,LVSIL_SMALL);     //…Ë÷√ImageList


	m_dlgproc.m_listproc.InsertColumn(0,"PROCESS NAME",LVCFMT_LEFT,340,0);
	m_dlgproc.m_listproc.InsertColumn(1,"PID",LVCFMT_LEFT,110,1);

	m_dlgfile.sock=sock;
	m_dlgproc.sock=sock;
	m_dlgcmd.sock=sock;
	return 1;
}

void CDlgConn::OnButton1() 
{

}
