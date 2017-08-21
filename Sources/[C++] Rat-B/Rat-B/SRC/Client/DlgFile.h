#if !defined(AFX_DLGFILE_H__F85B866C_4404_4D73_8F87_B586D7E03624__INCLUDED_)
#define AFX_DLGFILE_H__F85B866C_4404_4D73_8F87_B586D7E03624__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000
// DlgFile.h : header file
//

/////////////////////////////////////////////////////////////////////////////
// CDlgFile dialog

class CDlgFile : public CDialog
{
// Construction
public:
	void Retrive();
	SOCKET sock;
	CImageList imagelists,image;
	CString path;
	CDlgFile(CWnd* pParent = NULL);   // standard constructor

// Dialog Data
	//{{AFX_DATA(CDlgFile)
	enum { IDD = IDD_DIALOG_FILE };
	CListCtrl	m_listfile;
	CListCtrl	m_listdrv;
	//}}AFX_DATA


// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CDlgFile)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:

	// Generated message map functions
	//{{AFX_MSG(CDlgFile)
	afx_msg void OnGetDriver();
	afx_msg void OnRclickListFile(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDblclkListDriver(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnDblclkListFile(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnMenuDel();
	afx_msg void OnMenuRun();
	afx_msg void OnMenuRe();
	afx_msg void OnMenuUpfile();
	afx_msg void OnMenuDownfile();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_DLGFILE_H__F85B866C_4404_4D73_8F87_B586D7E03624__INCLUDED_)
