VERSION 5.00
Begin VB.Form frmSysColor 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Change SysColor"
   ClientHeight    =   2970
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   6660
   Icon            =   "frmSysColor.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2970
   ScaleWidth      =   6660
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdChange 
      Caption         =   "&Change"
      Height          =   555
      Left            =   5040
      TabIndex        =   20
      Top             =   825
      Width           =   1275
   End
   Begin VB.CommandButton cmdRestore 
      Caption         =   "&Restore"
      Height          =   555
      Left            =   5040
      TabIndex        =   19
      Top             =   1440
      Width           =   1275
   End
   Begin VB.CommandButton cmdExit 
      Caption         =   "E&xit"
      Height          =   555
      Left            =   5040
      TabIndex        =   17
      Top             =   2040
      Width           =   1275
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   7
      Left            =   2190
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   16
      Top             =   1785
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   6
      Left            =   2190
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   15
      Top             =   1275
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   5
      Left            =   2190
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   14
      Top             =   795
      Width           =   255
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Button Face"
      Height          =   405
      Index           =   7
      Left            =   2520
      TabIndex        =   13
      Top             =   1695
      Width           =   2115
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Application Work Space"
      Height          =   405
      Index           =   6
      Left            =   2520
      TabIndex        =   12
      Top             =   1185
      Width           =   2115
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "In Active Border"
      Height          =   405
      Index           =   5
      Left            =   2520
      TabIndex        =   11
      Top             =   705
      Width           =   2115
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   4
      Left            =   2190
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   10
      Top             =   300
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   3
      Left            =   75
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   9
      Top             =   1785
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   2
      Left            =   75
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   8
      Top             =   1305
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   1
      Left            =   75
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   7
      Top             =   810
      Width           =   255
   End
   Begin VB.PictureBox picColor 
      Height          =   225
      Index           =   0
      Left            =   75
      ScaleHeight     =   165
      ScaleWidth      =   195
      TabIndex        =   6
      Top             =   315
      Width           =   255
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Active Border"
      Height          =   405
      Index           =   4
      Left            =   2520
      TabIndex        =   5
      Top             =   210
      Width           =   2115
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Window Frame"
      Height          =   405
      Index           =   3
      Left            =   420
      TabIndex        =   4
      Top             =   1680
      Width           =   1470
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Window"
      Height          =   405
      Index           =   2
      Left            =   420
      TabIndex        =   3
      Top             =   1200
      Width           =   1470
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Menu"
      Height          =   405
      Index           =   1
      Left            =   420
      TabIndex        =   2
      Top             =   705
      Width           =   1470
   End
   Begin VB.CheckBox ChkColor 
      Caption         =   "Back Ground"
      Height          =   405
      Index           =   0
      Left            =   420
      TabIndex        =   1
      Top             =   195
      Width           =   1470
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "&Apply"
      Height          =   555
      Left            =   5040
      TabIndex        =   0
      Top             =   210
      Width           =   1275
   End
   Begin VB.Label lblStatus 
      Alignment       =   2  'Center
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   0
      TabIndex        =   18
      Top             =   2640
      Width           =   6615
   End
End
Attribute VB_Name = "frmSysColor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
'u don't need CommonDialog ctrl.
Private Type CHOOSECOLOR
    lStructSize As Long
    hwndOwner As Long
    hInstance As Long
    rgbResult As Long
    lpCustColors As String
    flags As Long
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type
Private Declare Function CHOOSECOLOR Lib "comdlg32.dll" Alias "ChooseColorA" (pChoosecolor As CHOOSECOLOR) As Long
Dim CustomColors() As Byte
'for manipulating cursor
Private Declare Function LoadCursor Lib "user32" Alias "LoadCursorA" (ByVal hInstance As Long, ByVal lpCursorName As Long) As Long
Private Declare Function SetClassWord Lib "user32" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal wNewWord As Long) As Long
Private Declare Function DestroyCursor Lib "user32" (ByVal hCursor As Long) As Long
Const GCW_HCURSOR = (-12)
Const IDC_SIZEALL = 32646&
Const IDC_HAND = (32649)
Dim SysCursHandle As Long, WaitCursor As Long

Function GetRGB(RGBval As Long, Num As Integer) As Integer
   ' Check if Num, RGBval are valid.
   If Num > 0 And Num < 4 And RGBval > -1 And RGBval < 16777216 Then
     GetRGB = RGBval \ 256 ^ (Num - 1) And 255
   Else
     ' Return True (-1) if Num or RGBval are invalid.
     GetRGB = True
   End If
End Function
      
Private Function ShowColor(hwnd As Long, hInstance As Long) As Long
    Dim cc As CHOOSECOLOR
    Dim Custcolor(16) As Long
    Dim lReturn As Long

    'set the structure size
    cc.lStructSize = Len(cc)
    'Set the owner
    cc.hwndOwner = hwnd
    'set the application's instance
    cc.hInstance = hInstance
    'set the custom colors (converted to Unicode)
    cc.lpCustColors = StrConv(CustomColors, vbUnicode)
    'no extra flags
    cc.flags = 0

    'Show the 'Select Color'-dialog
    If CHOOSECOLOR(cc) <> 0 Then
        ShowColor = cc.rgbResult
        CustomColors = StrConv(cc.lpCustColors, vbFromUnicode)
    Else
        ShowColor = -1
    End If
End Function


Private Sub ChkColor_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblStatus.Caption = Status(Index)
lblStatus.Refresh
End Sub

Private Sub cmdAbout_Click(Index As Integer)
frmAbout.Top = Me.Top + 1000
frmAbout.Left = Me.Left + 1000
frmAbout.Show vbModal
End Sub

Private Sub cmdAbout_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
lblStatus.Caption = "About Me"
lblStatus.Refresh
End Sub



Private Sub cmdApply_Click()
Dim i As Long
Dim rtn As Long
Dim strSysColor As String
For i = 0 To 7
    If ChkColor(i).Value = 1 Then
        'Change the new value
        Select Case i
            Case COLOR_BACKGROUND
                strSysColor = "Colour of the background with no wallpaper"
            Case COLOR_MENU
                strSysColor = "Menu"
            Case COLOR_WINDOW
                strSysColor = "Windows background"
            Case COLOR_WINDOWFRAME
                strSysColor = "Window frame"
            Case COLOR_ACTIVEBORDER
                strSysColor = "Border of active window"
            Case COLOR_INACTIVEBORDER
                strSysColor = "Border of inactive window"
            Case COLOR_APPWORKSPACE
                strSysColor = "Background of MDI desktop"
            Case COLOR_BTNFACE
                strSysColor = "Button"
        End Select
        rtn& = SetSysColors(1, i, NewSysCol.COLOR_SYSTEM(i))
        If rtn Then
            lblStatus.Caption = "The " & strSysColor & " color was " + Str$(NewSysCol.COLOR_SYSTEM(i)) + " and is now " + Str$(OldSysCol.COLOR_SYSTEM(i))
        Else
        
        End If
    End If
Next
End Sub

Private Sub cmdApply_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblStatus.Caption = "To Change with New Color (will not effect on restats system)"
lblStatus.Refresh
End Sub

Private Sub cmdExit_Click()
Unload Me
End Sub

Private Sub cmdExit_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblStatus.Caption = "To Exit"
lblStatus.Refresh
End Sub

Private Sub cmdRestore_Click()
Dim rtn As Long
Dim i As Long
Dim strSysColor As String
For i = 0 To 7
    If ChkColor(i).Value = 1 Then
        'Change the new value
        Select Case i
            Case COLOR_BACKGROUND
                strSysColor = "Colour of the background with no wallpaper"
            Case COLOR_MENU
                strSysColor = "Menu"
            Case COLOR_WINDOW
                strSysColor = "Windows background"
            Case COLOR_WINDOWFRAME
                strSysColor = "Window frame"
            Case COLOR_ACTIVEBORDER
                strSysColor = "Border of active window"
            Case COLOR_INACTIVEBORDER
                strSysColor = "Border of inactive window"
            Case COLOR_APPWORKSPACE
                strSysColor = "Background of MDI desktop"
            Case COLOR_BTNFACE
                strSysColor = "Button"
            Case COLOR_BTNSHADOW
                strSysColor = "3D shading of button"
            Case COLOR_GRAYTEXT
                strSysColor = " Grey text, of zero if dithering is used."
            Case COLOR_BTNTEXT
                strSysColor = "Button text"
            Case COLOR_INACTIVECAPTIONTEXT
                strSysColor = "Text of inactive window"
            Case COLOR_BTNHIGHLIGHT
                strSysColor = "3D highlight of button"
        End Select
        picColor(i).BackColor = OldSysCol.COLOR_SYSTEM(i)
        rtn& = SetSysColors(1, i, OldSysCol.COLOR_SYSTEM(i))
        If rtn Then
            lblStatus.Caption = "The " & strSysColor & " color was " + Str$(NewSysCol.COLOR_SYSTEM(i)) + " and is now " + Str$(OldSysCol.COLOR_SYSTEM(i))
        End If
        NewSysCol.COLOR_SYSTEM(i) = OldSysCol.COLOR_SYSTEM(i)
    End If
Next
End Sub

Private Sub cmdRestore_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblStatus.Caption = "Change the Colors to Old One"
lblStatus.Refresh
End Sub

Private Sub Form_Load()
Dim lngColor As Long
Dim i As Integer
ReDim CustomColors(0 To 16 * 4 - 1) As Byte
'if the cursor is Hand then u will understand something behind it
'this cussor for all pic
WaitCursor = LoadCursor(ByVal 0&, IDC_HAND)
SysCursHandle = SetClassWord(picColor(0).hwnd, GCW_HCURSOR, WaitCursor)
For i = 0 To 7
    lngColor = GetSysColor(i)
    picColor(i).BackColor = lngColor
    OldSysCol.COLOR_SYSTEM(i) = lngColor
Next


   
End Sub

Private Sub Form_Unload(Cancel As Integer)
    DestroyCursor WaitCursor
End Sub

Private Sub picColor_Click(Index As Integer)
Dim lngColor As Long
lngColor = ShowColor(Me.hwnd, App.hInstance)
If lngColor >= 0 Then
    picColor(Index).BackColor = lngColor
    NewSysCol.COLOR_SYSTEM(Index) = lngColor
End If
End Sub

Private Sub picColor_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
Dim RComp As Integer, GComp As Integer, BComp As Integer
Dim lngColor As Long
lngColor = picColor(Index).BackColor
RComp = lngColor Mod 256
GComp = lngColor \ 256 Mod 256
BComp = lngColor \ 65536 Mod 256
lblStatus.Caption = "RGB :" & RComp & "," & GComp & "," & BComp
lblStatus.Refresh
End Sub
Private Function Status(idx As Integer) As String
Dim strSysColor As String
Select Case idx
    Case COLOR_SCROLLBAR
        strSysColor = "The Scrollbar colour"
    Case COLOR_BACKGROUND
        strSysColor = "Colour of the background with no wallpaper"
    Case COLOR_ACTIVECAPTION
        strSysColor = "Caption of Active Window"
    Case COLOR_INACTIVECAPTION
        strSysColor = "Caption of Inactive window"
    Case COLOR_MENU
        strSysColor = "Menu"
    Case COLOR_WINDOW
        strSysColor = "Windows background"
    Case COLOR_WINDOWFRAME
        strSysColor = "Window frame"
    Case COLOR_MENUTEXT
        strSysColor = "Menu Text"
    Case COLOR_WINDOWTEXT
        strSysColor = "Window Text"
    Case COLOR_CAPTIONTEXT
        strSysColor = "Text in window caption"
    Case COLOR_ACTIVEBORDER
        strSysColor = "Border of active window"
    Case COLOR_INACTIVEBORDER
        strSysColor = "Border of inactive window"
    Case COLOR_APPWORKSPACE
        strSysColor = "Background of MDI desktop"
    Case COLOR_HIGHLIGHT
        strSysColor = "Selected item background"
    Case COLOR_HIGHLIGHTTEXT
        strSysColor = "Selected menu item"
    Case COLOR_BTNFACE
        strSysColor = "Button"
    Case COLOR_BTNSHADOW
        strSysColor = "3D shading of button"
    Case COLOR_GRAYTEXT
        strSysColor = " Grey text, of zero if dithering is used."
    Case COLOR_BTNTEXT
        strSysColor = "Button text"
    Case COLOR_INACTIVECAPTIONTEXT
        strSysColor = "Text of inactive window"
    Case COLOR_BTNHIGHLIGHT
        strSysColor = "3D highlight of button"
End Select
   Status = "Change the " & strSysColor
End Function

