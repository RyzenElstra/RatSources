Attribute VB_Name = "DIALOGS1"
DefInt A-Z
Public Const HKEY_CLASSES_ROOT = &H80000000
Public Const HKEY_CURRENT_USER = &H80000001
Public Const HKEY_USERS = &H80000003
Public Const SWP_NOMOVE = 2
Public Const SWP_NOSIZE = 1
Public Const HWND_TOPMOST = -1
Public Const HWND_NOTOPMOST = -2
Public Const FLOAT = 1, SINK = 0
Public Const EWX_FORCE = 4
Public Const KEY_ALL_ACCESS = &H3F
Public Const HEKY_USERS = &H80000003
Public Const HKEY_QUERY_VALUE = &H1
Public Const EWX_LOGOFF = 0
Public Const VK_MENU = &H12
Public Const KEYEVENTF_KEYUP = &H2
Public Const EWX_REBOOT = 2
Public Const EWX_SHUTDOWN = 1
Public Const ERROR_NO_MORE_ITEMS = 259&
Public Const REG_NONE = 0
Public Const REG_SZ = 1
Public Const SWP_SHOWWINDOW = &H40
Public Const SWP_HIDEWINDOW = &H80
Public Const REG_EXPAND_SZ = 2
Public Const REG_BINARY = 3
Public Const REG_DWORD = 4
Public Const ERROR_NONE = 0
Public Const HKEY_CURRENT_CONFIG = &H80000005
Public Const HKEY_DYN_DATA = &H80000006

Declare Function RegOpenKeyEx Lib "advapi32.dll" Alias "RegOpenKeyExA" (ByVal hKey As Long, ByVal lpSubKey As String, ByVal ulOptions As Long, ByVal samDesired As Long, phkResult As Long) As Long
Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long

Declare Function RegQueryValueExString Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As String, lpcbData As Long) As Long
Declare Function RegQueryValueExLong Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Long, lpcbData As Long) As Long
Declare Function RegQueryValueEx Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, lpData As Any, lpcbData As Long) As Long
Declare Function RegQueryValueExNULL Lib "advapi32.dll" Alias "RegQueryValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal lpReserved As Long, lpType As Long, ByVal lpData As Long, lpcbData As Long) As Long
Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpValue As String, ByVal cbData As Long) As Long
Declare Function RegSetValueExLong Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, lpValue As Long, ByVal cbData As Long) As Long



Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Declare Sub RtlMoveMemory Lib "kernel32" (dest As Any, src As Any, ByVal cb&)
Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long
Declare Function gethostname Lib "wsock32.dll" (ByVal hostname$, HostLen&) As Long
Declare Function gethostbyname& Lib "wsock32.dll" (ByVal hostname$)
Declare Function WSAGetLastError Lib "wsock32.dll" () As Long
Declare Function WSACleanup Lib "wsock32.dll" () As Long
Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Declare Function IcmpCreateFile Lib "icmp.dll" () As Long
Declare Function IcmpCloseHandle Lib "icmp.dll" (ByVal HANDLE As Long) As Boolean



#If Win32 Then
Type OPENFILENAME
        lStructSize As Long
        hwndOwner As Long
        hInstance As Long
        lpstrFilter As String
        lpstrCustomFilter As String
        nMaxCustFilter As Long
        nFilterIndex As Long
        lpstrFile As String
        nMaxFile As Long
        lpstrFileTitle As String
        nMaxFileTitle As Long
        lpstrInitialDir As String
        lpstrTitle As String
        Flags As Long
        nFileOffset As Integer
        nFileExtension As Integer
        lpstrDefExt As String
        lCustData As Long
        lpfnHook As Long
        lpTemplateName As String
End Type
#Else
Type OPENFILENAME
     lStructSize As Long
     hwndOwner As Integer
     hInstance As Integer
     lpstrFilter As Long
     lpstrCustomFilter As Long
     nMaxCustFilter As Long
     nFilterIndex As Long
     lpstrFile As Long
     nMaxFile As Long
     lpstrFileTitle As Long
     nMaxFileTitle As Long
     lpstrInitialDir As Long
     lpstrTitle As Long
     Flags As Long
     nFileOffset As Integer
     nFileExtension As Integer
     lpstrDefExt As Long
     lCustData As Long
     lpfnHook As Long
     lpTemplateName As Long
End Type
#End If
#If Win32 Then
Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Declare Function GetFileTitle Lib "comdlg32.dll" Alias "GetFileTitleA" (ByVal lpszFile As String, ByVal lpszTitle As String, ByVal cbBuf As Integer) As Integer
Declare Function GetSaveFileName Lib "comdlg32.dll" Alias "GetSaveFileNameA" (pOpenfilename As OPENFILENAME) As Long
#Else
Declare Function GetOpenFileName Lib "COMMDLG.DLL" (pOpenfilename As OPENFILENAME) As Integer
Declare Function GetSaveFileName Lib "COMMDLG.DLL" (pOpenfilename As OPENFILENAME) As Integer
Declare Function GetFileTitle Lib "COMMDLG.DLL" (ByVal FName As String, ByVal Title As String, Size As Integer)
#End If

Public Const OFN_ALLOWMULTISELECT = &H200
Public Const OFN_CREATEPROMPT = &H2000
Public Const OFN_ENABLEHOOK = &H20
Public Const OFN_ENABLETEMPLATE = &H40
Public Const OFN_ENABLETEMPLATEHANDLE = &H80
Public Const OFN_EXPLORER = &H80000
Public Const OFN_EXTENSIONDIFFERENT = &H400
Public Const OFN_FILEMUSTEXIST = &H1000
Public Const OFN_HIDEREADONLY = &H4
Public Const OFN_LONGNAMES = &H200000
Public Const OFN_NOCHANGEDIR = &H8
Public Const OFN_NODEREFERENCELINKS = &H100000
Public Const OFN_NOLONGNAMES = &H40000
Public Const OFN_NONETWORKBUTTON = &H20000
Public Const OFN_NOREADONLYRETURN = &H8000
Public Const OFN_NOTESTFILECREATE = &H10000
Public Const OFN_NOVALIDATE = &H100
Public Const OFN_OVERWRITEPROMPT = &H2
Public Const OFN_PATHMUSTEXIST = &H800
Public Const OFN_READONLY = &H1
Public Const OFN_SHAREAWARE = &H4000
Public Const OFN_SHAREFALLTHROUGH = 2
Public Const OFN_SHARENOWARN = 1
Public Const OFN_SHAREWARN = 0
Public Const OFN_SHOWHELP = &H10
#If Win32 Then
Type CHOOSECOLOR
        lStructSize As Long
        hwndOwner As Long
        hInstance As Long
        rgbResult As Long
        lpCustColors As Long
        Flags As Long
        lCustData As Long
        lpfnHook As Long
        lpTemplateName As String
End Type
#Else
Type CHOOSECOLOR
     lStructSize As Long
     hwndOwner As Integer
     hInstance  As Integer
     rgbResult As Long
     lpCustColors As Long
     Flags As Long
     lCustData As Long
     lpfnHook As Long
     lpTemplateName As Long
End Type
#End If

#If Win32 Then
Declare Function CHOOSECOLOR Lib "comdlg32.dll" Alias "ChooseColorA" (pChoosecolor As CHOOSECOLOR) As Long
#Else
Declare Function CHOOSECOLOR Lib "COMMDLG.DLL" Alias "ChooseColor" (pChoosecolor As CHOOSECOLOR) As Integer
#End If
Public Const CC_ENABLEHOOK = &H10
Public Const CC_ENABLETEMPLATE = &H20
Public Const CC_ENABLETEMPLATEHANDLE = &H40
Public Const CC_FULLOPEN = &H2
Public Const CC_PREVENTFULLOPEN = &H4
Public Const CC_RGBINIT = &H1
Public Const CC_SHOWHELP = &H8
Global Const LF_FACESIZE = 32
#If Win32 Then
Type LOGFONT
        lfHeight As Long
        lfWidth As Long
        lfEscapement As Long
        lfOrientation As Long
        lfWeight As Long
        lfItalic As Byte
        lfUnderline As Byte
        lfStrikeOut As Byte
        lfCharSet As Byte
        lfOutPrecision As Byte
        lfClipPrecision As Byte
        lfQuality As Byte
        lfPitchAndFamily As Byte
        lfFaceName(LF_FACESIZE) As Byte
End Type
#Else
Type LOGFONT
    lfHeight As Integer
    lfWidth As Integer
    lfEscapement As Integer
    lfOrientation As Integer
    lfWeight As Integer
    lfItalic As String * 1
    lfUnderline As String * 1
    lfStrikeOut As String * 1
    lfCharSet As String * 1
    lfOutPrecision As String * 1
    lfClipPrecision As String * 1
    lfQuality As String * 1
    lfPitchAndFamily As String * 1
    lfFaceName As String * LF_FACESIZE
End Type
#End If
Global Const LOGPIXELSY = 90
Public Const CCHDEVICENAME = 32
Public Const CCHFORMNAME = 32

#If Win32 Then
Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long
#Else
Declare Function GetDeviceCaps Lib "GDI" (ByVal hdc As Integer, ByVal nIndex As Integer) As Integer
#End If
#If Win32 Then
Type ChooseFont
        lStructSize As Long
        hwndOwner As Long
        hdc As Long
        lpLogFont As Long
        iPointSize As Long
        Flags As Long
        rgbColors As Long
        lCustData As Long
        lpfnHook As Long
        lpTemplateName As String
        hInstance As Long
        lpszStyle As String
        nFontType As Integer
        MISSING_ALIGNMENT As Integer
        nSizeMin As Long
        nSizeMax As Long
End Type
#Else
Type ChooseFont
    lStructSize As Long
    hwndOwner As Integer
    hdc As Integer
    lpLogFont As Long
    iPointSize As Integer
    Flags As Long
    rgbColors As Long
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As Long
    hInstance  As Integer
    lpszStyle As Long
    nFontType As Integer
    nSizeMin As Integer
    nSizeMax As Integer
End Type
#End If
#If Win32 Then
Declare Function ChooseFont Lib "comdlg32.dll" Alias "ChooseFontA" (pChoosefont As ChooseFont) As Long
Declare Function VarPtr Lib "VB40032" (lpVoid As Any) As Long
#Else
Declare Function ChooseFont Lib "COMMDLG.DLL" (pChoosefont As ChooseFont) As Integer
#End If
Public Const CF_ANSIONLY = &H400&
Public Const CF_APPLY = &H200&
Public Const CF_EFFECTS = &H100&
Public Const CF_ENABLEHOOK = &H8&
Public Const CF_ENABLETEMPLATE = &H10&
Public Const CF_ENABLETEMPLATEHANDLE = &H20&
Public Const CF_FIXEDPITCHONLY = &H4000&
Public Const CF_FORCEFONTEXIST = &H10000
Public Const CF_INITTOLOGFONTSTRUCT = &H40&
Public Const CF_LIMITSIZE = &H2000&
Public Const CF_NOFACESEL = &H80000
Public Const CF_NOSCRIPTSEL = &H800000
Public Const CF_NOSIMULATIONS = &H1000&
Public Const CF_NOSIZESEL = &H200000
Public Const CF_NOSTYLESEL = &H100000
Public Const CF_NOVECTORFONTS = &H800&
Public Const CF_NOVERTFONTS = &H1000000
Public Const CF_OWNERDISPLAY = &H80
Public Const CF_PRINTERFONTS = &H2
Public Const CF_SCALABLEONLY = &H20000
Public Const CF_SCREENFONTS = &H1
Public Const CF_SCRIPTSONLY = CF_ANSIONLY
Public Const CF_SELECTSCRIPT = &H400000
Public Const CF_SHOWHELP = &H4&
Public Const CF_TTONLY = &H40000
Public Const CF_USESTYLE = &H80&
Public Const CF_WYSIWYG = &H8000
Public Const CF_BOTH = (CF_SCREENFONTS Or CF_PRINTERFONTS)
Public Const CF_NOOEMFONTS = CF_NOVECTORFONTS
Global Const SIMULATED_FONTTYPE = &H8000
Global Const PRINTER_FONTTYPE = &H4000
Global Const SCREEN_FONTTYPE = &H2000
Global Const BOLD_FONTTYPE = &H100
Global Const ITALIC_FONTTYPE = &H200
Global Const REGULAR_FONTTYPE = &H400
Global Const WM_CHOOSEFONT_GETLOGFONT = (&H400 + 1)
Global Const LBSELCHSTRING = "commdlg_LBSelChangedNotify"
Global Const SHAREVISTRING = "commdlg_ShareViolation"
Global Const FILEOKSTRING = "commdlg_FileNameOK"
Global Const COLOROKSTRING = "commdlg_ColorOK"
Global Const SETRGBSTRING = "commdlg_SetRGBColor"
Global Const FINDMSGSTRING = "commdlg_FindReplace"
Global Const HELPMSGSTRING = "commdlg_help"
Global Const CD_LBSELNOITEMS = -1
Global Const CD_LBSELCHANGE = 0
Global Const CD_LBSELSUB = 1
Global Const CD_LBSELADD = 2
#If Win32 Then
Type PRINTDLG
        lStructSize As Long
        hwndOwner As Long
        hDevMode As Long
        hDevNames As Long
        hdc As Long
        Flags As Long
        nFromPage As Integer
        nToPage As Integer
        nMinPage As Integer
        nMaxPage As Integer
        nCopies As Integer
        hInstance As Long
        lCustData As Long
        lpfnPrintHook As Long
        lpfnSetupHook As Long
        lpPrintTemplateName As String
        lpSetupTemplateName As String
        hPrintTemplate As Long
        hSetupTemplate As Long
End Type
#Else
Type PRINTDLG
    lStructSize As Long
    hwndOwner As Integer
    hDevMode As Integer
    hDevNames As Integer
    hdc As Integer
    Flags As Long
    nFromPage As Integer
    nToPage As Integer
    nMinPage As Integer
    nMaxPage As Integer
    nCopies As Integer
    hInstance As Integer
    lCustData As Long
    lpfnPrintHook As Long
    lpfnSetupHook As Long
    lpPrintTemplateName As Long
    lpSetupTemplateName As Long
    hPrintTemplate As Integer
    hSetupTemplate As Integer
End Type
#End If

#If Win32 Then
Declare Function PRINTDLG Lib "comdlg32.dll" Alias "PrintDlgA" (pPrintdlg As PRINTDLG) As Long
#Else
Declare Function PRINTDLG Lib "COMMDLG.DLL" Alias "PrintDlg" (pPrintdlg As PRINTDLG) As Integer
#End If

Global Const PD_ALLPAGES = &H0
Global Const PD_SELECTION = &H1
Global Const PD_PAGENUMS = &H2
Global Const PD_NOSELECTION = &H4
Global Const PD_NOPAGENUMS = &H8
Global Const PD_COLLATE = &H10
Global Const PD_PRINTTOFILE = &H20
Global Const PD_PRINTSETUP = &H40
Global Const PD_NOWARNING = &H80
Global Const PD_RETURNDC = &H100
Global Const PD_RETURNIC = &H200
Global Const PD_RETURNDEFAULT = &H400
Global Const PD_SHOWHELP = &H800
Global Const PD_ENABLEPRINTHOOK = &H1000
Global Const PD_ENABLESETUPHOOK = &H2000
Global Const PD_ENABLEPRINTTEMPLATE = &H4000
Global Const PD_ENABLESETUPTEMPLATE = &H8000
Global Const PD_ENABLEPRINTTEMPLATEHANDLE = &H10000
Global Const PD_ENABLESETUPTEMPLATEHANDLE = &H20000
Global Const PD_USEDEVMODECOPIES = &H40000
Global Const PD_DISABLEPRINTTOFILE = &H80000
Global Const PD_HIDEPRINTTOFILE = &H100000

Type DEVNAMES
    wDriverOffset As Integer
    wDeviceOffset As Integer
    wOutputOffset As Integer
    wDefault As Integer
End Type

Global Const DN_DEFAULTPRN = &H1

#If Win32 Then
Declare Function CommDlgExtendedError Lib "comdlg32.dll" () As Long
#Else
Declare Function CommDlgExtendedError Lib "COMMDLG.DLL" () As Long
#End If


#If Win32 Then
Declare Function GlobalAlloc Lib "kernel32" (ByVal wFlags As Long, ByVal dwBytes As Long) As Long
Declare Function GlobalFree Lib "kernel32" (ByVal hMem As Long) As Long
Declare Function GlobalLock Lib "kernel32" (ByVal hMem As Long) As Long
Declare Function GlobalUnlock Lib "kernel32" (ByVal hMem As Long) As Long
#Else
Declare Function GlobalAlloc Lib "Kernel" (ByVal wFlags As Integer, ByVal dwBytes As Long) As Integer
Declare Function GlobalFree Lib "Kernel" (ByVal hMem As Integer) As Integer
Declare Function GlobalLock Lib "Kernel" (ByVal hMem As Integer) As Long
Declare Function GlobalUnlock Lib "Kernel" (ByVal hMem As Integer) As Integer
#End If


Global Const GMEM_MOVEABLE = &H2
Global Const GMEM_ZEROINIT = &H40
Global Const GHND = (GMEM_MOVEABLE Or GMEM_ZEROINIT)

#If Win32 Then
Declare Sub MemoryCopy Lib "kernel32" Alias "RtlMoveMemory" (lpDest As Any, lpSource As Any, ByVal dwBytes As Long)
#Else
Declare Sub MemoryCopy Lib "Kernel" Alias "hmemcpy" (lpDest As Any, lpSource As Any, ByVal dwBytes As Long)
#End If

#If Win32 Then
Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
#Else
Declare Function DeleteDC Lib "GDI" (ByVal hdc As Integer) As Integer
#End If

#If Win32 Then
Type DEVMODE
        dmDeviceName As String * CCHDEVICENAME
        dmSpecVersion As Integer
        dmDriverVersion As Integer
        dmSize As Integer
        dmDriverExtra As Integer
        dmFields As Long
        dmOrientation As Integer
        dmPaperSize As Integer
        dmPaperLength As Integer
        dmPaperWidth As Integer
        dmScale As Integer
        dmCopies As Integer
        dmDefaultSource As Integer
        dmPrintQuality As Integer
        dmColor As Integer
        dmDuplex As Integer
        dmYResolution As Integer
        dmTTOption As Integer
        dmCollate As Integer
        dmFormName As String * CCHFORMNAME
        dmUnusedPadding As Integer
        dmBitsPerPel As Integer
        dmPelsWidth As Long
        dmPelsHeight As Long
        dmDisplayFlags As Long
        dmDisplayFrequency As Long
End Type
#Else
Type DEVMODE
          dmDeviceName As String * 32
          dmSpecVersion As Integer
          dmDriverVersion As Integer
          dmSize As Integer
          dmDriverExtra As Integer
          dmFields As Long
          dmOrientation As Integer
          dmPaperSize As Integer
          dmPaperLength As Integer
          dmPaperWidth As Integer
          dmScale As Integer
          dmCopies As Integer
          dmDefaultSource As Integer
          dmPrintQuality As Integer
          dmColor As Integer
          dmDuplex As Integer
          dmYResolution As Integer
          dmTTOption As Integer
End Type
#End If
Public Declare Function CreateDCAsNull Lib "gdi32" Alias "CreateDCA" (ByVal lpDriverName As String, lpDeviceName As Any, lpOutput As Any, lpInitData As Any) As Long

Public Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Public Declare Function GetTextColor Lib "gdi32" (ByVal hdc As Long) As Long
Public Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long

Public Type RECT
   left As Long
   tOp As Long
   Right As Long
   Bottom As Long
End Type

Public Sub TextAmDesktop()
On Error GoTo X
DesktopInfo "Text", 12, "", 12
Exit Sub
X:
End Sub
Public Sub DesktopInfo(zeile1 As String, vfarbe1 As Integer, zeile2 As String, vfarbe2 As Integer)

Dim hdc As Long
Dim tR As RECT
Dim lCol As Long
If vfarbe1 < 0 Or vfarbe1 > 16 Then vfarbe1 = 12
If vfarbe2 < 0 Or vfarbe2 > 16 Then vfarbe2 = 0

hdc = CreateDCAsNull("DISPLAY", ByVal 0&, ByVal 0&, ByVal 0&)

tR.left = 0
tR.tOp = 0
tR.Right = 640
tR.Bottom = 32


lCol = GetTextColor(hdc)


SetTextColor hdc, QBColor(vfarbe1)


DrawText hdc, zeile1, Len(zeile1), tR, 0

tR.tOp = 15
SetTextColor hdc, QBColor(vfarbe2)

DrawText hdc, zeile2, Len(zeile2), tR, 0


SetTextColor hdc, lCol

DeleteDC hdc
End Sub


Sub FloatWindow(X As Integer, Action As Integer)
On Error GoTo o
Dim wFlags As Integer, result As Integer
wFlags = SWP_NOMOVE Or SWP_NOSIZE
If Action <> 0 Then
Call SetWindowPos(X, HWND_TOPMOST, 0, 0, 0, 0, wFlags)

Else

Call SetWindowPos(X, HWND_NOTOPMOST, 0, 0, 0, 0, wFlags)

End If
Exit Sub
o:

End Sub

