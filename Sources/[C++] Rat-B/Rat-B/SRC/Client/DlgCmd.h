#if !defined(AFX_DLGCMD_H__6FDEB915_A092_46AE_BCE3_DB5F228E7391__INCLUDED_)
#define AFX_DLGCMD_H__6FDEB915_A092_46AE_BCE3_DB5F228E7391__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgCmd.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgCmd dialog

class CDlgCmd : public CDialog
{
// Construction
public:
	void SendCmd();
	BOOL CmdStart;
	SOCKET sock;
	CDlgCmd(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgCmd)
	enum { IDD = IDD_DIALOG_CMD };
	CRichEditCtrl	m_editout;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgCmd)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgCmd)
	afx_msg void OnButtonStart();
	afx_msg void OnButtonStop();
	afx_msg void OnVscrollEditCmd();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGCMD_H__6FDEB915_A092_46AE_BCE3_DB5F228E7391__INCLUDED_)
