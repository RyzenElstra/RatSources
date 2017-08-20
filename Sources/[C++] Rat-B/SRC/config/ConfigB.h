// ConfigB.h : main header file for the CONFIGB application
//

#if !defined(AFX_CONFIGB_H__6CC3D6BA_EE29_42A5_8F6F_61CB94FA1E65__INCLUDED_)
#define AFX_CONFIGB_H__6CC3D6BA_EE29_42A5_8F6F_61CB94FA1E65__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

#ifndef __AFXWIN_H__
	#error include 'stdafx.h' before including this file for PCH
#endif

#include "resource.h"		// main symbols

/////////////////////////////////////////////////////////////////////////////
// CConfigBApp:
// See ConfigB.cpp for the implementation of this class
//

class CConfigBApp : public CWinApp
{
public:
	CConfigBApp();

// Overrides
	// ClassWizard generated virtual function overrides
	//{{AFX_VIRTUAL(CConfigBApp)
	public:
	virtual BOOL InitInstance();
	//}}AFX_VIRTUAL

// Implementation

	//{{AFX_MSG(CConfigBApp)
		// NOTE - the ClassWizard will add and remove member functions here.
		//    DO NOT EDIT what you see in these blocks of generated code !
	//}}AFX_MSG
	DECLARE_MESSAGE_MAP()
};


/////////////////////////////////////////////////////////////////////////////

//{{AFX_INSERT_LOCATION}}
// Microsoft Visual C++ will insert additional declarations immediately before the previous line.

#endif // !defined(AFX_CONFIGB_H__6CC3D6BA_EE29_42A5_8F6F_61CB94FA1E65__INCLUDED_)
