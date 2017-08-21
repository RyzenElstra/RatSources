// RunDlg.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "RunDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CRunDlg dialog


CRunDlg::CRunDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CRunDlg::IDD, pParent)
{
	//{{AFX_DATA_INIT(CRunDlg)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CRunDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CRunDlg)
		// NOTE: the ClassWizard will add DDX and DDV calls here
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CRunDlg, CDialog)
	//{{AFX_MSG_MAP(CRunDlg)
	ON_BN_CLICKED(IDC_BUTTON_RUN, OnButtonRun)
	ON_BN_CLICKED(IDC_BUTTON_CANCEL, OnButtonCancel)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CRunDlg message handlers

void CRunDlg::OnButtonRun() 
{
	CString RunPath,RunPathbuf;
	MyCommand runcommand;
	char ret[2];

	GetDlgItemText(IDC_EDIT_PAR,RunPathbuf);
	RunPath = bufpath + " " + RunPathbuf;

	runcommand.CommandType = 3;
	strcpy(runcommand.Parameter, (LPSTR)(LPCTSTR)RunPath);

	send(sock,(char *)&runcommand,sizeof(runcommand),0);
	recv(sock,ret,2,0);
	if(atoi(ret)==0)
	{
		AfxMessageBox("运行成功");
	}
	else
		AfxMessageBox("运行失败");
	CDialog::OnOK();	
}

void CRunDlg::OnButtonCancel() 
{
	CDialog::OnOK();	
}
