// DlgProc.cpp : implementation file
//

#include "stdafx.h"
#include "Client.h"
#include "DlgProc.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#undef THIS_FILE
static char THIS_FILE[] = __FILE__;
#endif

/////////////////////////////////////////////////////////////////////////////
// CDlgProc dialog


CDlgProc::CDlgProc(CWnd* pParent /*=NULL*/)
	: CDialog(CDlgProc::IDD, pParent)
{
	//{{AFX_DATA_INIT(CDlgProc)
		// NOTE: the ClassWizard will add member initialization here
	//}}AFX_DATA_INIT
}


void CDlgProc::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	//{{AFX_DATA_MAP(CDlgProc)
	DDX_Control(pDX, IDC_LIST_PORC, m_listproc);
	//}}AFX_DATA_MAP
}


BEGIN_MESSAGE_MAP(CDlgProc, CDialog)
	//{{AFX_MSG_MAP(CDlgProc)
	ON_NOTIFY(NM_RCLICK, IDC_LIST_PORC, OnRclickListPorc)
	ON_COMMAND(ID_MENU_KILLPROC, OnMenuKillproc)
	ON_COMMAND(ID_MENU_REPROC, OnMenuReproc)
	//}}AFX_MSG_MAP
END_MESSAGE_MAP()

/////////////////////////////////////////////////////////////////////////////
// CDlgProc message handlers

void CDlgProc::OnRclickListPorc(NMHDR* pNMHDR, LRESULT* pResult) 
{
	POINT ptMouse;
	POINT ptClientMouse;

	GetCursorPos(&ptMouse);

	ptClientMouse=ptMouse;
	m_listproc.ScreenToClient(&ptClientMouse);
/*
	int ListSel=m_listproc.HitTest(ptClientMouse,0);
	if(ListSel==-1)
		return;
*/
	CMenu menu;
	VERIFY(menu.LoadMenu(IDR_MENU_PROCOPT));
	CMenu* pPopup = menu.GetSubMenu(0);
	ASSERT(pPopup != NULL);
	pPopup->TrackPopupMenu(TPM_LEFTALIGN | TPM_RIGHTBUTTON, ptMouse.x, ptMouse.y, this);	
	*pResult = 0;
}

void CDlgProc::ListProc()
{
	int	index=0;
	ProcessInfo procinfo;
	MyCommand listproc;
	
	m_listproc.DeleteAllItems();
	listproc.CommandType = 7;
	send(sock,(char *)&listproc,sizeof(listproc),0);
	char buf[64];
	do{
		recv(sock,(char *)&procinfo,sizeof(procinfo),0);
		if(procinfo.Next == 0)
			break;
		index = m_listproc.GetItemCount();
		m_listproc.InsertItem(index,procinfo.ProcName,0);
		sprintf(buf,"%d",procinfo.PID);
		m_listproc.SetItem(index,1,LVIF_TEXT,buf,0,0,0,NULL);
		send(sock,"0",2,0);
	}while(procinfo.Next != 0);
}

void CDlgProc::OnMenuKillproc() 
{
	MyCommand killproc;
	CString PID;
	char ret[2];

	killproc.CommandType = 8;

	int nItem = m_listproc.GetSelectionMark();
	PID = m_listproc.GetItemText(nItem,1);
	strcpy(killproc.Parameter,PID);
	send(sock,(char *)&killproc,sizeof(killproc),0);
	recv(sock,ret,2,0);
	if(atoi(ret)==0)
	{
		MessageBox("Kill Success");
		m_listproc.DeleteItem(nItem);
	}
	else
		MessageBox("Kill Failed");	
}

void CDlgProc::OnMenuReproc() 
{
	ListProc();		
}
