Attribute VB_Name = "ModGetSysColors"
'Declarations for system colors for when you test the colors on yourself

Public Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Public Declare Function SetSysColors Lib "user32" (ByVal nChanges As Long, lpSysColor As Long, lpColorValues As Long) As Long


Const COLOR_SCROLLBAR = 0
Const COLOR_BACKGROUND = 1
Const COLOR_ACTIVECAPTION = 2
Const COLOR_INACTIVECAPTION = 3
Const COLOR_MENU = 4
Const COLOR_WINDOW = 5
Const COLOR_WINDOWFRAME = 6
Const COLOR_MENUTEXT = 7
Const COLOR_WINDOWTEXT = 8
Const COLOR_CAPTIONTEXT = 9
Const COLOR_ACTIVEBORDER = 10
Const COLOR_INACTIVEBORDER = 11
Const COLOR_APPWORKSPACE = 12
Const COLOR_HIGHLIGHT = 13
Const COLOR_HIGHLIGHTTEXT = 14
Const COLOR_BTNFACE = 15
Const COLOR_BTNSHADOW = 16
Const COLOR_GRAYTEXT = 17
Const COLOR_BTNTEXT = 18
Const COLOR_INACTIVECAPTIONTEXT = 19
Const COLOR_BTNHIGHLIGHT = 20


