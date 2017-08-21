#if !defined(AFX_DLGPROC_H__3FFB6855_8749_486E_93CC_5FEAD1E67A30__INCLUDED_)
#define AFX_DLGPROC_H__3FFB6855_8749_486E_93CC_5FEAD1E67A30__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgProc.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgProc dialog

class CDlgProc : public CDialog
{
// Construction
public:
	void ListProc();
	SOCKET sock;
	CDlgProc(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgProc)
	enum { IDD = IDD_DIALOG_PROC };
	CListCtrl	m_listproc;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgProc)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgProc)
	afx_msg void OnRclickListPorc(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnMenuKillproc();
	afx_msg void OnMenuReproc();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGPROC_H__3FFB6855_8749_486E_93CC_5FEAD1E67A30__INCLUDED_)
