// ConfigBDlg.h : header file
//

#if !defined(AFX_CONFIGBDLG_H__8035A9D4_CD65_4D34_8782_74168953D090__INCLUDED_)
#define AFX_CONFIGBDLG_H__8035A9D4_CD65_4D34_8782_74168953D090__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CConfigBDlg dialog

class CConfigBDlg : public CDialog
{
// Construction
public:
	bool m_enactivex;
	void jiami(char *a, int len);
	CConfigBDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CConfigBDlg)
	enum { IDD = IDD_CONFIGB_DIALOG };
	CEdit	m_exetrojan;
	CButton	m_regmach;
	CEdit	m_regkey;
	BOOL	m_regrun;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CConfigBDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CConfigBDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnConfig();
	afx_msg void OnRegEnable();
	afx_msg void OnActivex();
	afx_msg void OnCancel();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CONFIGBDLG_H__8035A9D4_CD65_4D34_8782_74168953D090__INCLUDED_)
