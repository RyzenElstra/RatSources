// ClientDlg.h : header file
//

#if !defined(AFX_CLIENTDLG_H__9C7C41D0_88FB_40F2_A02C_2CD3856FC860__INCLUDED_)
#define AFX_CLIENTDLG_H__9C7C41D0_88FB_40F2_A02C_2CD3856FC860__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

/////////////////////////////////////////////////////////////////////////////
// CClientDlg dialog

class CClientDlg : public CDialog
{
// Construction
public:
	BOOL StartService(SOCKET sock);
	SOCKET FindSocket(CString CurID);
	void AddLocalIPToList();
	DWORD	CurLocalIP;
	CClientDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	//{{AFX_DATA(CClientDlg)
	enum { IDD = IDD_CLIENT_DIALOG };
	CEdit	m_CEditPort;
	CComboBox	m_LocalIPList;
	CListCtrl	m_List;
	//}}AFX_DATA

	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CClientDlg)
	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support
	//}}AFX_VIRTUAL

// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	//{{AFX_MSG(CClientDlg)
	virtual BOOL OnInitDialog();
	afx_msg void OnSysCommand(UINT nID, LPARAM lParam);
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	afx_msg void OnButtonStart();
	afx_msg void OnButtonStop();
	afx_msg void OnRclickListComputer(NMHDR* pNMHDR, LRESULT* pResult);
	afx_msg void OnMenuConnect();
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CLIENTDLG_H__9C7C41D0_88FB_40F2_A02C_2CD3856FC860__INCLUDED_)
