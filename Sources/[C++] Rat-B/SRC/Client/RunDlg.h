#if !defined(AFX_RUNDLG_H__F85FE555_4861_4EF7_AD14_16D88EFD47FC__INCLUDED_)
#define AFX_RUNDLG_H__F85FE555_4861_4EF7_AD14_16D88EFD47FC__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// RunDlg.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CRunDlg dialog

class CRunDlg : public CDialog
{
// Construction
public:
	CString bufpath;
	SOCKET sock;
	CRunDlg(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CRunDlg)
	enum { IDD = IDD_DIALOG_RUN };
		// NOTE: the ClassWizard will add data members here
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CRunDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CRunDlg)
	afx_msg void OnButtonRun();
	afx_msg void OnButtonCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_RUNDLG_H__F85FE555_4861_4EF7_AD14_16D88EFD47FC__INCLUDED_)
