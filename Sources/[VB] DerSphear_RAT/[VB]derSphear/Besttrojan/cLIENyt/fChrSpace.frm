VERSION 5.00
Begin VB.Form frmTextEffect 
   AutoRedraw      =   -1  'True
   BackColor       =   &H8000000A&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "DerSpaeher3 - Info"
   ClientHeight    =   4545
   ClientLeft      =   5115
   ClientTop       =   2700
   ClientWidth     =   6840
   BeginProperty Font 
      Name            =   "Courier New"
      Size            =   18
      Charset         =   0
      Weight          =   700
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "fChrSpace.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4545
   ScaleWidth      =   6840
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picContainer 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Courier New"
         Size            =   18
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   4575
      Index           =   31
      Left            =   0
      ScaleHeight     =   4545
      ScaleWidth      =   6945
      TabIndex        =   0
      Top             =   0
      Width           =   6975
   End
End
Attribute VB_Name = "frmTextEffect"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Const HKEY_USERS = &H80000003
Const SWP_NOMOVE = 2
Const SWP_NOSIZE = 1
Const HWND_TOPMOST = -1
Const HWND_NOTOPMOST = -2
Const FLOAT = 1, SINK = 0

Dim X, Y As Long
Dim MoveTo As Integer
Private m_bDoEffect As Boolean
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function timeGetTime Lib "winmm.dll" () As Long
Private Declare Function SetTextCharacterExtra Lib "gdi32" (ByVal hdc As Long, ByVal nCharExtra As Long) As Long
Private Type RECT
    left As Long
    tOp As Long
    Right As Long
    Bottom As Long
End Type
Private Declare Function OffsetRect Lib "user32" (lpRect As RECT, ByVal X As Long, ByVal Y As Long) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hdc As Long, ByVal crColor As Long) As Long
Private Declare Function FillRect Lib "user32" (ByVal hdc As Long, lpRect As RECT, ByVal hBrush As Long) As Long
Private Declare Function CreateSolidBrush Lib "gdi32" (ByVal crColor As Long) As Long
Private Declare Function DeleteObject Lib "gdi32" (ByVal hObject As Long) As Long
Private Declare Function GetSysColor Lib "user32" (ByVal nIndex As Long) As Long
Private Const COLOR_BTNFACE = 6
Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal lpString As String, ByVal nCount As Long) As Long
Private Declare Function DrawText Lib "user32" Alias "DrawTextA" (ByVal hdc As Long, ByVal lpStr As String, ByVal nCount As Long, lpRect As RECT, ByVal wFormat As Long) As Long
Private Const DT_BOTTOM = &H8
Private Const DT_CALCRECT = &H400
Private Const DT_CENTER = &H1
Private Const DT_CHARSTREAM = 4
Private Const DT_DISPFILE = 6
Private Const DT_EXPANDTABS = &H40
Private Const DT_EXTERNALLEADING = &H200
Private Const DT_INTERNAL = &H1000
Private Const DT_LEFT = &H0
Private Const DT_METAFILE = 5
Private Const DT_NOCLIP = &H100
Private Const DT_NOPREFIX = &H800
Private Const DT_PLOTTER = 0
Private Const DT_RASCAMERA = 3
Private Const DT_RASDISPLAY = 1
Private Const DT_RASPRINTER = 2
Private Const DT_RIGHT = &H2
Private Const DT_SINGLELINE = &H20
Private Const DT_TABSTOP = &H80
Private Const DT_TOP = &H0
Private Const DT_VCENTER = &H4
Private Const DT_WORDBREAK = &H10
Private Declare Function OleTranslateColor Lib "OLEPRO32.DLL" (ByVal OLE_COLOR As Long, ByVal HPALETTE As Long, pccolorref As Long) As Long
Private Const CLR_INVALID = -1
Private Sub TextEffect( _
        ByVal sText As String, _
        ByVal lX As Long, ByVal lY As Long, _
        Optional ByVal bLoop As Boolean = False, _
        Optional ByVal lStartSpacing As Long = 128, _
        Optional ByVal lEndSpacing As Long = -1, _
        Optional ByVal oColor As OLE_COLOR = vbWindowText _
        )
Dim i As Long
Dim X As Long
Dim lLen As Long
Dim lHDC As Long
Dim hBrush As Long
Static tR As RECT
Dim iDir As Long
Dim bNotFirstTime As Boolean
Dim lTime As Long
Dim lIter As Long
Dim bSlowDown As Boolean
Dim lCOlor As Long
Dim bDoIt As Boolean


    iDir = -1
    i = lStartSpacing
    tR.left = lX: tR.tOp = lY: tR.Right = lX: tR.Bottom = lY
    OleTranslateColor oColor, 0, lCOlor

    hBrush = CreateSolidBrush(GetSysColor(COLOR_BTNFACE))
    lLen = Len(sText)
    lHDC = picContainer(31).hdc
    SetTextColor lHDC, lCOlor
    bDoIt = True
    
    Do While m_bDoEffect And bDoIt
        lTime = timeGetTime
        If (i < -3) And Not (bLoop) And Not (bSlowDown) Then
            bSlowDown = True
            iDir = 1
            lIter = (i + 4)
        End If
        If (i > 128) Then iDir = -1
        If Not (bLoop) And iDir = 1 Then
            If (i = lEndSpacing) Then
               
                bDoIt = False
            Else
                lIter = lIter - 1
                If (lIter <= 0) Then
                    i = i + iDir
                    lIter = (i + 4)
                End If
            End If
        Else
            i = i + iDir
        End If
        FillRect lHDC, tR, hBrush
        X = 32 - (i * lLen)
        SetTextCharacterExtra lHDC, i
        DrawText lHDC, sText, lLen, tR, DT_CALCRECT
        tR.Right = tR.Right + 4
        If (tR.Right > picContainer(31).ScaleWidth \ 1) Then tR.Right = picContainer(31).ScaleWidth \ 1
        DrawText lHDC, sText, lLen, tR, DT_LEFT


        Do
            DoEvents
        Loop While (timeGetTime - lTime) < 20
    Loop
    DeleteObject hBrush

End Sub

Private Sub form_load()
Dim f As Integer
f = Me.hWnd
Call FloatWindow(f, FLOAT)
    Me.Show
    Me.Refresh

    If Not (m_bDoEffect) Then
        picContainer(31).Cls
        picContainer(31).Font.Size = 24
        picContainer(31).FontBold = True
        m_bDoEffect = True


        TextEffect "DerSpaeher 3", 140, 1, , 50, -2, RGB(13, 114, 100)

        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "programmed by:                              Mario Parzer", 1, 80, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        If m_bDoEffect Then
            picContainer(31).Font.Size = 10
            TextEffect "codename:                                   PhilippP", 1, 120, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
            picContainer(31).Font.Size = 10
            TextEffect "language:                                   Visual Basic 5.0", 1, 160, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
       If m_bDoEffect Then
            picContainer(31).Font.Size = 10
            TextEffect "reason:                                     destroying", 1, 200, , 60, , RGB(13, 114, 100)
            
        Else: m_bDoEffect = False: Exit Sub: End If
        If m_bDoEffect Then
            picContainer(31).Font.Size = 10
            TextEffect "                                            nuclear bombs", 1, 220, , 20, , RGB(13, 114, 100)
            
        Else: m_bDoEffect = False: Exit Sub: End If
        If m_bDoEffect Then
            picContainer(31).Font.Size = 14
            TextEffect "      W.A.I.T.I.N.G. WHILE INTIALISING...", 1, 280, , 60, , RGB(13, 114, 100)
            
        Else: m_bDoEffect = False: Exit Sub: End If
        Sleep 1500

                picContainer(31).BackColor = vbBlack
            If m_bDoEffect Then
            picContainer(31).Font.Size = 14
            picContainer(31).FontBold = False
            TextEffect "                INTIALISING Ok...", 1, 130, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If

            Sleep 1000
            picContainer(31).BackColor = vbBlack
            If m_bDoEffect Then
            picContainer(31).Cls
        picContainer(31).Font.Size = 24
        picContainer(31).FontBold = True
        m_bDoEffect = True

        TextEffect "Thanks to...", 140, 1, , 50, -2, RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "tester:                   Club|2k|", 1, 60, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          [www.trojanforces.com]", 1, 80, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                If m_bDoEffect Then
                
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "co-tester:                Das-Dominion", 1, 100, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          [www.uds.notrix.de]", 1, 120, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "co-tester:                Cobalt 60 WT", 1, 140, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          [http://cobalt60.fragtown.de/Xrated/]", 1, 160, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "tips:                     Senna Spy", 1, 180, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          [http://sennaspy.cjb.net]", 1, 200, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "big greetz to:            G.H.O.S.T", 1, 220, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          [http://gamecopypalace.mysite.de]", 1, 240, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
                        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "and all others:           |_int_13h_|, Snake, -=HeLLfiReZ=-...", 1, 260, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        Sleep 2000

        picContainer(31).BackColor = vbBlack
                                If m_bDoEffect Then
        picContainer(31).FontBold = True
            picContainer(31).Font.Size = 24
            TextEffect "       Questions...", 1, 1, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                       If you have questions", 1, 60, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                         or something else,", 1, 80, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                If m_bDoEffect Then
                
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          please contact...", 1, 100, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                        If m_bDoEffect Then
                
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          Ghostmann1@gmx.at", 1, 140, , 60, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
        If m_bDoEffect Then
                
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                    or ICQ under my UIN number:", 1, 180, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
        If m_bDoEffect Then
                
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                               40500859", 1, 220, , 60, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
If m_bDoEffect Then
            picContainer(31).Font.Size = 14
            TextEffect "      W.A.I.T.I.N.G. WHILE INTIALISING...", 1, 280, , 60, , RGB(13, 114, 100)
            
        Else: m_bDoEffect = False: Exit Sub: End If
        Sleep 2500

                picContainer(31).BackColor = vbBlack
            If m_bDoEffect Then
            picContainer(31).Font.Size = 14
            picContainer(31).FontBold = False
            TextEffect "                INTIALISING Ok...", 1, 130, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        Sleep 1000
                picContainer(31).BackColor = vbBlack
        If m_bDoEffect Then
            picContainer(31).Cls
        picContainer(31).Font.Size = 24
        picContainer(31).FontBold = True
        m_bDoEffect = True

        TextEffect "        have fun...", 1, 1, , 50, -2, RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                          That´s all", 1, 60, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "               Have a lot of fun with DerSpaeher3", 1, 80, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                       Don't mess with it ", 1, 110, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "                  Here once more the homepages:", 1, 130, , 60, , RGB(13, 114, 100)
        Else: m_bDoEffect = False: Exit Sub: End If
        
                       If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "Club|2k|                  [www.trojanforces.com]", 1, 160, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        

                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "Das-Dominion              [http://sebtan.ch.to]", 1, 180, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        

              If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "Cobalt 60 WT              [http://cobalt60.fragtown.de/Xrated/]", 1, 200, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        

                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "Senna Spy                 [http://sennaspy.cjb.net]", 1, 220, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
                
                If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "G.H.O.S.T                 [http://gamecopypalace.mysite.de]", 1, 240, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        
        If m_bDoEffect Then
        picContainer(31).FontBold = False
            picContainer(31).Font.Size = 10
            TextEffect "DerSpaeher3               [http://derspaeher.cjb.net]", 1, 280, , 40, , RGB(255, 255, 255)
        Else: m_bDoEffect = False: Exit Sub: End If
        Exit Sub
        
    Else
        m_bDoEffect = False
    End If

End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    m_bDoEffect = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    m_bDoEffect = False
Set frmTextEffect = Nothing
Set frmTextEffect = Nothing
End Sub

