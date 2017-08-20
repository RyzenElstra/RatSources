// DlgCmd.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "DlgCmd.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgCmd dialog


CDlgCmd::CDlgCmd(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgCmd::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgCmd)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgCmd::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgCmd)
	DDX_Control(pDX, IDC_RICHEDIT_OUT, m_editout);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgCmd, CDialog)
	//{{AFX_MSG_MAP(CDlgCmd)
	ON_BN_CLICKED(IDC_BUTTON_START, OnButtonStart)
	ON_BN_CLICKED(IDC_BUTTON_STOP, OnButtonStop)
	ON_EN_VSCROLL(IDC_EDIT_CMD, OnVscrollEditCmd)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgCmd message handlers

void CDlgCmd::SendCmd()
{
	CString Cmd;
	int j;
	char exitret[2];
	MyCommand runcmd;
	CmdResult cmdresult;
	runcmd.CommandType = 10;
	GetDlgItemText(IDC_EDIT_CMD,Cmd);
	strcpy(runcmd.Parameter, Cmd);
sendexit:
	send(sock,(char *)&runcmd,sizeof(runcmd),0);
	if(Cmd == "exit")
	{
		recv(sock,exitret,2,0);
		if(strcmp(exitret,"q")==0)
		{
			int j=m_editout.GetWindowTextLength();
			m_editout.SetSel(j,j);
			m_editout.ReplaceSel("\n\n=====Remote Shell Closed=====");
			CmdStart = FALSE;
			SetDlgItemText(IDC_EDIT_CMD,"");
			return;
		}
		else
			goto sendexit;
	}
	do{
		recv(sock,(char *)&cmdresult,sizeof(cmdresult),0);
		if(cmdresult.Next == 0)
		{
			break;
		}
		j=m_editout.GetWindowTextLength();
		m_editout.SetSel(j,j);
		m_editout.ReplaceSel(cmdresult.Buff);
		send(sock,"o",2,0);
	}while(cmdresult.Next != 0);
}

void CDlgCmd::OnButtonStart() 
{
	MyCommand opencmd;
	CmdResult cmdresult;
	opencmd.CommandType = 9;
	send(sock,(char *)&opencmd,sizeof(opencmd),0);

	do{
		int ret = recv(sock,(char *)&cmdresult,sizeof(cmdresult),0);
		if(ret == -1)
		{
			MessageBox("recv err");
			return;
		}
		if(cmdresult.Next==0)
		{;
			break;
		}
		SetDlgItemText(IDC_RICHEDIT_OUT,cmdresult.Buff);
	}while(cmdresult.Next != 0);
	CmdStart = TRUE;	
}

void CDlgCmd::OnButtonStop() 
{
	char closeret[2];
	MyCommand closecmd;
	closecmd.CommandType = 11;
sendclose:
	send(sock,(char *)&closecmd,sizeof(closecmd),0);
	recv(sock,closeret,2,0);
	if(strcmp(closeret,"q")==0)
	{
		int j=m_editout.GetWindowTextLength();
		m_editout.SetSel(j,j);
		m_editout.ReplaceSel("\n\n=====Remote Shell Closed=====");
		CmdStart = FALSE;
		return;
	}
	else
		goto sendclose;	
}

void CDlgCmd::OnVscrollEditCmd() 
{
 	if(CmdStart)
	{
		SendCmd();
	}
	else
		MessageBox("cmd not open");
	SetDlgItemText(IDC_EDIT_CMD,"");	
}
