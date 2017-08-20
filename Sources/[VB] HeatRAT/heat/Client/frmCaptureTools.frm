VERSION 5.00
Begin VB.Form frmCaptureTools 
   BorderStyle     =   0  'None
   Caption         =   "Capture Toolbar"
   ClientHeight    =   1020
   ClientLeft      =   1110
   ClientTop       =   1305
   ClientWidth     =   2310
   ControlBox      =   0   'False
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1020
   ScaleWidth      =   2310
   ShowInTaskbar   =   0   'False
   Begin VB.CommandButton cmdScaleCancel 
      Caption         =   "Cancel"
      Height          =   255
      Left            =   1440
      TabIndex        =   7
      Top             =   720
      Width           =   855
   End
   Begin VB.CommandButton cmdChangeScale 
      Caption         =   "OK"
      Height          =   255
      Left            =   720
      TabIndex        =   6
      Top             =   720
      Width           =   735
   End
   Begin VB.CommandButton cmdResize 
      Caption         =   "<<"
      Height          =   255
      Left            =   1920
      TabIndex        =   3
      Top             =   0
      Width           =   375
   End
   Begin VB.CommandButton cmdSave 
      Caption         =   "Save"
      Height          =   255
      Left            =   1320
      TabIndex        =   2
      Top             =   0
      Width           =   615
   End
   Begin VB.CommandButton cmdScale 
      Caption         =   "Scale"
      Height          =   255
      Left            =   720
      TabIndex        =   1
      Top             =   0
      Width           =   615
   End
   Begin VB.CommandButton cmdEnd 
      Caption         =   "End"
      Height          =   255
      Left            =   240
      TabIndex        =   0
      Top             =   0
      Width           =   495
   End
   Begin VB.HScrollBar hScale 
      Height          =   255
      Left            =   0
      Max             =   200
      Min             =   10
      TabIndex        =   4
      Top             =   480
      Value           =   100
      Width           =   2295
   End
   Begin VB.CheckBox chkKeyboard 
      Caption         =   "Keyboard"
      Height          =   195
      Left            =   240
      TabIndex        =   8
      Top             =   270
      Width           =   975
   End
   Begin VB.CheckBox chkMouse 
      Caption         =   "Mouse"
      Height          =   255
      Left            =   1320
      TabIndex        =   9
      Top             =   240
      Width           =   975
   End
   Begin VB.Label lblScale 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "100%"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   5
      Top             =   720
      Width           =   720
   End
End
Attribute VB_Name = "frmCaptureTools"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

Private Sub chkKeyboard_Click()
    Select Case chkKeyboard.Value
    Case 0
        frmCapture.SendKeys = False
    Case 1
        frmCapture.SendKeys = True
    End Select
End Sub

Private Sub chkMouse_Click()
    Select Case chkMouse.Value
    Case 0
        frmCapture.SendMouse = False
    Case 1
        frmCapture.SendMouse = True
    End Select
End Sub

Private Sub cmdChangeScale_Click()
    With frmCapture
        .ClientScale = hScale.Value
        .Move 0, 0, (.ToScale(.Capture_Width)) * Screen.TwipsPerPixelX, (.ToScale(.Capture_Height)) * Screen.TwipsPerPixelY
    End With
    
    'Refresh
    Send Chr(3) & Chr(6)
    
    Me.Height = chkKeyboard.Top + chkKeyboard.Height
End Sub

Private Sub cmdEnd_Click()
                            'Capture 'End Capture
    On Error Resume Next
    Unload frmCapture
    Unload Me
    
    Send "rc;" & Chr(3) & ";" & Chr(5)
End Sub

Private Sub cmdResize_Click()
    Select Case cmdResize.Caption
    Case "<<"
        cmdResize.Left = cmdEnd.Left
        cmdResize.Caption = ">>"
        frmCaptureTools.Width = cmdResize.Left + cmdResize.Width
        frmCaptureTools.Height = cmdEnd.Height
    Case ">>"
        cmdResize.Left = cmdSave.Left + cmdSave.Width
        cmdResize.Caption = "<<"
        frmCaptureTools.Width = cmdResize.Left + cmdResize.Width
        frmCaptureTools.Height = chkKeyboard.Top + chkKeyboard.Height
    End Select
End Sub


Private Sub FormDrag(hwnd As Long)
    ReleaseCapture
    Call SendMessage(hwnd, &HA1, 2, 0&)
End Sub

Private Sub cmdSave_Click()
    On Error GoTo ErrorHandler
    Dim FileName As String, ShotNumber As Long, DIB As New clsDIB
    
    cmdSave.Caption = "Wait"
    
    FileName = Dir(App.Path & "\" & Trunicate(CStr(ShotNumber), 4, "0", 1) & ".bmp")
    
    Do Until FileName = ""
        ShotNumber = ShotNumber + 1
        FileName = Dir(App.Path & "\" & Trunicate(CStr(ShotNumber), 4, "0", 1) & ".bmp")
    Loop
    
    DIB.Create frmCapture.Width / Screen.TwipsPerPixelX, frmCapture.Height / Screen.TwipsPerPixelY
    
    BitBlt DIB.hdc, 0, 0, DIB.Width, DIB.Height, frmCapture.hdc, 0, 0, vbSrcCopy
    
    DIB.SavePicture App.Path & "\" & Trunicate(CStr(ShotNumber), 4, "0", 1) & ".bmp"
    
    cmdSave.Caption = "Done"
    
    Sleep 500
    
    cmdSave.Caption = "Save"
    
    Exit Sub
ErrorHandler:
    MsgBox "Unable to save capture, Error #" & Err.Number & ":" & vbbcrlf & Err.Description
    cmdSave.Caption = "Save"
End Sub

Private Function Trunicate(Original As String, MinLength As Long, Filler As String, Side As Long)
    
    Trunicate = Original
    
    Select Case Side
    Case 0
        Do Until Len(Trunicate) >= MinLength
            Trunicate = Trunicate & Filler
        Loop
    Case Else
        Do Until Len(Trunicate) >= MinLength
            Trunicate = Filler & Trunicate
        Loop
    End Select
End Function

Private Sub cmdScale_Click()
    Me.Height = lblScale.Top + lblScale.Height
End Sub

Private Sub cmdScaleCancel_Click()
    hScale.Value = ClientScale
    hScale_Change
    Me.Height = chkKeyboard.Top + chkKeyboard.Height
End Sub

Private Sub Form_DblClick()
    Send Chr(3) & Chr(6)
End Sub

Private Sub Form_Load()
    Me.Height = chkKeyboard.Top + chkKeyboard.Height
    Me.Left = Val(GetSetting("RemoteAxs", "Settings", "CT_Left", Me.Left))
    Me.Top = Val(GetSetting("RemoteAxs", "Settings", "CT_Top", Me.Top))
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    FormDrag Me.hwnd
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    SaveSetting "RemoteAxs", "Settings", "CT_Left", CStr(Me.Left)
    SaveSetting "RemoteAxs", "Settings", "CT_Top", CStr(Me.Top)
End Sub

Private Sub Form_Resize()
    Beep
End Sub

Private Sub hScale_Change()
    lblScale.Caption = hScale.Value & "%"
End Sub

Private Sub hScale_Scroll()
    lblScale.Caption = hScale.Value & "%"
End Sub
