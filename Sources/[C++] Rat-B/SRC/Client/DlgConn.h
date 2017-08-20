#if !defined(AFX_DLGCONN_H__74E2984A_48BF_4D0C_BC23_70D9024DB992__INCLUDED_)
#define AFX_DLGCONN_H__74E2984A_48BF_4D0C_BC23_70D9024DB992__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgConn.h : header file
//

#include "TabSheet.h"
#include "DlgFile.h"	// Added by ClassView
#include "DlgProc.h"
#include "DlgCmd.h"


/////////////////////////////////////////////////////////////////////////////
// CDlgConn dialog

class CDlgConn : public CDialog
{
// Construction
public:
	CDlgFile m_dlgfile;
	CDlgProc m_dlgproc;
	CDlgCmd  m_dlgcmd;
	CString WindowTitle;
	SOCKET sock;
	CDlgConn(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgConn)
	enum { IDD = IDD_DIALOG_CONNECT };
	CTabSheet	m_sheet;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgConn)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgConn)
	afx_msg void OnButton1();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
private:
	BOOL OnInitDialog();
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGCONN_H__74E2984A_48BF_4D0C_BC23_70D9024DB992__INCLUDED_)
