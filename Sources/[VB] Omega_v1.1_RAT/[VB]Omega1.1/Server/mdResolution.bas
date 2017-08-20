Attribute VB_Name = "mdResolution"
Private Declare Function ChangeDisplaySettings Lib "user32" Alias "ChangeDisplaySettingsA" (lpInitData As DEVMODE, ByVal dwFlags As Long) As Long
Private Declare Function EnumDisplaySettings Lib "user32" Alias "EnumDisplaySettingsA" (lpszDeviceName As Any, ByVal iModeNum As Long, lpDevMode As Any) As Boolean
Private Declare Function ExitWindowsEx Lib "user32" (ByVal uFlags As Long, ByVal dwReserved As Long) As Long
Private Declare Function GetDeviceCaps Lib "gdi32" (ByVal hdc As Long, ByVal nIndex As Long) As Long

Const CCHDEVICENAME = 32
Const CCHFORMNAME = 32

Private Type DEVMODE
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

Const DM_BITSPERPEL = &H40000
Const DM_PELSWIDTH = &H80000
Const DM_PELSHEIGHT = &H100000
Const DM_DISPLAYFLAGS = &H200000
Const DM_DISPLAYFREQUENCY = &H400000

Const BITSPIXEL = 12

' /* Flags for ChangeDisplaySettings */
Const CDS_UPDATEREGISTRY = &H1
Const CDS_TEST = &H2
Const CDS_FULLSCREEN = &H4
Const CDS_GLOBAL = &H8
Const CDS_SET_PRIMARY = &H10
Const CDS_RESET = &H40000000
Const CDS_SETRECT = &H20000000
Const CDS_NORESET = &H10000000

' /* Return values for ChangeDisplaySettings */
Const DISP_CHANGE_SUCCESSFUL = 0
Const DISP_CHANGE_RESTART = 1
Const DISP_CHANGE_FAILED = -1
Const DISP_CHANGE_BADMODE = -2
Const DISP_CHANGE_NOTUPDATED = -3
Const DISP_CHANGE_BADFLAGS = -4
Const DISP_CHANGE_BADPARAM = -5

Const EWX_LOGOFF = 0
Const EWX_SHUTDOWN = 1
Const EWX_REBOOT = 2
Const EWX_FORCE = 4

Dim d() As DEVMODE, lNumModes As Long

Public Sub RefreshResolution()
Dim L As Long, lMaxModes As Long
Dim lBits As Long, lWidth As Long, lHeight As Long

    frmServer.List1.Clear
    lBits = GetDeviceCaps(hdc, BITSPIXEL)
    lWidth = Screen.Width \ Screen.TwipsPerPixelX
    lHeight = Screen.Height \ Screen.TwipsPerPixelY
    lMaxModes = 8
    ReDim d(0 To lMaxModes) As DEVMODE
    lNumModes = 0
    L = EnumDisplaySettings(ByVal 0, lNumModes, d(lNumModes))
    Do While L
        frmServer.List1.AddItem d(lNumModes).dmPelsWidth & " x " & d(lNumModes).dmPelsHeight & " " & d(lNumModes).dmBitsPerPel & "Bit Color"
        If lBits = d(lNumModes).dmBitsPerPel And _
           lWidth = d(lNumModes).dmPelsWidth And _
           lHeight = d(lNumModes).dmPelsHeight Then
            Form1.List1.ListIndex = List1.NewIndex
        End If
        lNumModes = lNumModes + 1
        If lNumModes > lMaxModes Then
            lMaxModes = lMaxModes + 8
            ReDim Preserve d(0 To lMaxModes) As DEVMODE
        End If
        L = EnumDisplaySettings(ByVal 0, lNumModes, d(lNumModes))
    Loop
    lNumModes = lNumModes - 1
End Sub

Public Sub ChangeResolution(X As Long)
Dim L As Long, flags As Long

    d(X).dmFields = DM_BITSPERPEL Or DM_PELSWIDTH Or DM_PELSHEIGHT
    flags = CDS_UPDATEREGISTRY
    L = ChangeDisplaySettings(d(X), flags)
    Select Case L
        Case DISP_CHANGE_RESTART
             flags = 0
             L = ExitWindowsEx(EWX_REBOOT, flags)
        Case DISP_CHANGE_SUCCESSFUL
    End Select
End Sub


