; CLW file contains information for the MFC ClassWizard

[General Info]
Version=1
LastClass=CClientDlg
LastTemplate=CDialog
NewFileInclude1=#include "stdafx.h"
NewFileInclude2=#include "Client.h"

ClassCount=8
Class1=CClientApp
Class2=CClientDlg
Class3=CAboutDlg

ResourceCount=13
Resource1=IDD_ABOUTBOX
Resource2=IDR_MAINFRAME
Resource3=IDD_CLIENT_DIALOG
Resource4=IDD_DIALOG_PROC
Resource5=IDR_MENU_FILEOPT
Resource6=IDD_ABOUTBOX (English (U.S.))
Class4=CDlgConn
Resource7=IDD_DIALOG_FILE
Class5=CDlgFile
Resource8=IDR_MENU_CONNECT
Class6=CDlgCmd
Resource9=IDD_DIALOG_RUN
Class7=CDlgProc
Resource10=IDD_DIALOG_CONNECT
Resource11=IDD_CLIENT_DIALOG (English (U.S.))
Class8=CRunDlg
Resource12=IDD_DIALOG_CMD
Resource13=IDR_MENU_PROCOPT

[CLS:CClientApp]
Type=0
HeaderFile=Client.h
ImplementationFile=Client.cpp
Filter=N

[CLS:CClientDlg]
Type=0
HeaderFile=ClientDlg.h
ImplementationFile=ClientDlg.cpp
Filter=D
BaseClass=CDialog
VirtualFilter=dWC
LastObject=ID_MENU_CONNECT

[CLS:CAboutDlg]
Type=0
HeaderFile=ClientDlg.h
ImplementationFile=ClientDlg.cpp
Filter=D

[DLG:IDD_ABOUTBOX]
Type=1
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308352
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889
Class=CAboutDlg


[DLG:IDD_CLIENT_DIALOG]
Type=1
ControlCount=3
Control1=IDOK,button,1342242817
Control2=IDCANCEL,button,1342242816
Control3=IDC_STATIC,static,1342308352
Class=CClientDlg

[DLG:IDD_CLIENT_DIALOG (English (U.S.))]
Type=1
Class=CClientDlg
ControlCount=7
Control1=IDC_LIST_COMPUTER,SysListView32,1350633473
Control2=IDC_COMBO_IP,combobox,1344340226
Control3=IDC_STATIC,static,1342308352
Control4=IDC_STATIC,static,1342308352
Control5=IDC_EDIT_PORT,edit,1350631552
Control6=IDC_BUTTON_START,button,1342275584
Control7=IDC_BUTTON_STOP,button,1342275584

[DLG:IDD_ABOUTBOX (English (U.S.))]
Type=1
Class=CAboutDlg
ControlCount=4
Control1=IDC_STATIC,static,1342177283
Control2=IDC_STATIC,static,1342308480
Control3=IDC_STATIC,static,1342308352
Control4=IDOK,button,1342373889

[MNU:IDR_MENU_CONNECT]
Type=1
Class=?
Command1=ID_MENU_CONNECT
CommandCount=1

[CLS:CDlgConn]
Type=0
HeaderFile=DlgConn.h
ImplementationFile=DlgConn.cpp
BaseClass=CDialog
Filter=D
LastObject=ID_MENU_CONNECT
VirtualFilter=dWC

[DLG:IDD_DIALOG_CONNECT]
Type=1
Class=CDlgConn
ControlCount=1
Control1=IDC_TAB,SysTabControl32,1342177280

[DLG:IDD_DIALOG_FILE]
Type=1
Class=CDlgFile
ControlCount=3
Control1=IDC_LIST_DRIVER,SysListView32,1350641681
Control2=IDC_LIST_FILE,SysListView32,1350633473
Control3=IDC_GetDriver,button,1342275584

[CLS:CDlgFile]
Type=0
HeaderFile=DlgFile.h
ImplementationFile=DlgFile.cpp
BaseClass=CDialog
Filter=D
LastObject=CDlgFile
VirtualFilter=dWC

[DLG:IDD_DIALOG_CMD]
Type=1
Class=CDlgCmd
ControlCount=4
Control1=IDC_RICHEDIT_OUT,RICHEDIT,1353789636
Control2=IDC_EDIT_CMD,edit,1350635716
Control3=IDC_BUTTON_START,button,1342242816
Control4=IDC_BUTTON_STOP,button,1342242816

[CLS:CDlgCmd]
Type=0
HeaderFile=DlgCmd.h
ImplementationFile=DlgCmd.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=IDC_EDIT_CMD

[DLG:IDD_DIALOG_PROC]
Type=1
Class=CDlgProc
ControlCount=1
Control1=IDC_LIST_PORC,SysListView32,1350633473

[CLS:CDlgProc]
Type=0
HeaderFile=DlgProc.h
ImplementationFile=DlgProc.cpp
BaseClass=CDialog
Filter=D
VirtualFilter=dWC
LastObject=ID_MENU_REPROC

[MNU:IDR_MENU_FILEOPT]
Type=1
Class=?
Command1=ID_MENU_RUN
Command2=ID_MENU_DEL
Command3=ID_MENU_RE
Command4=ID_MENU_UPFILE
Command5=ID_MENU_DOWNFILE
CommandCount=5

[DLG:IDD_DIALOG_RUN]
Type=1
Class=CRunDlg
ControlCount=4
Control1=IDC_STATIC,static,1342308352
Control2=IDC_EDIT_PAR,edit,1350631552
Control3=IDC_BUTTON_RUN,button,1342242816
Control4=IDC_BUTTON_CANCEL,button,1342242816

[CLS:CRunDlg]
Type=0
HeaderFile=RunDlg.h
ImplementationFile=RunDlg.cpp
BaseClass=CDialog
Filter=D
LastObject=CRunDlg
VirtualFilter=dWC

[MNU:IDR_MENU_PROCOPT]
Type=1
Class=?
Command1=ID_MENU_KILLPROC
Command2=ID_MENU_REPROC
CommandCount=2

