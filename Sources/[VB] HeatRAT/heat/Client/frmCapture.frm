VERSION 5.00
Begin VB.Form frmCapture 
   BorderStyle     =   0  'None
   Caption         =   "RemoteAxs Capture Window"
   ClientHeight    =   4005
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5865
   LinkTopic       =   "Form1"
   ScaleHeight     =   267
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   391
   Begin VB.PictureBox picCapture 
      BackColor       =   &H00000000&
      BorderStyle     =   0  'None
      Height          =   3135
      Left            =   0
      ScaleHeight     =   209
      ScaleMode       =   3  'Pixel
      ScaleWidth      =   305
      TabIndex        =   0
      Top             =   0
      Width           =   4575
      Begin VB.Timer tmrAutoRedraw 
         Interval        =   2000
         Left            =   480
         Top             =   0
      End
      Begin VB.Timer tmrMouse 
         Interval        =   50
         Left            =   0
         Top             =   0
      End
   End
End
Attribute VB_Name = "frmCapture"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Private Declare Function SetStretchBltMode Lib "gdi32" (ByVal hdc As Long, ByVal hStretchMode As Long) As Long
Private Const STRETCHMODE = vbPaletteModeNone   'You can find other modes in the "PaletteModeConstants" section of your Object Browser

Public SendMouse As Boolean, SendKeys As Boolean, AutoScale As Boolean

Public ClientScale As Long
Public Capture_Width As Long, Capture_Height As Long
Public Block_Left As Long, Block_Top As Long, Block_Width As Long, Block_Height As Long, Scaled_Width As Long, Scaled_Height As Long, xBlocks As Long, yBlocks As Long, ColorDepth As Long

Public BackBuffer As New clsDIB
Public ZLib As New clsZLib
Public DIB As New clsDIB
Private Scaled As New clsDIB
Private MouseX As Long, MouseY As Long, OldX As Long, OldY As Long

Public Sub DrawBlock(ByteArray() As Byte)
    
    If DIB.Colors <> ColorDepth Or DIB.Width <> Block_Width Or DIB.Height <> Block_Height Then
        Set DIB = Nothing
        Set DIB = New clsDIB
        DIB.Colors = ColorDepth
        DIB.Create Block_Width, Block_Height
    End If
      
    ZLib.DecompressByte ByteArray()
        
    DIB.ParseByte ByteArray()
    
    If Scaled_Width <> Block_Width Or Scaled_Height <> Block_Height Then
        SetStretchBltMode DIB.hdc, STRETCHMODE
        StretchBlt DIB.hdc, 0, 0, Block_Width, Block_Height, DIB.hdc, 0, 0, Scaled_Width, Scaled_Height, vbSrcCopy
    End If
    
    If ClientScale = 100 Then
        BitBlt picCapture.hdc, Block_Left, Block_Top, Block_Width, Block_Height, DIB.hdc, 0, 0, vbSrcCopy
    Else
        SetStretchBltMode picCapture.hdc, STRETCHMODE
        StretchBlt picCapture.hdc, ToScale(Block_Left), ToScale(Block_Top), ToScale(Block_Width), ToScale(Block_Height), DIB.hdc, 0, 0, Block_Width, Block_Height, vbSrcCopy
    End If
    
    BitBlt BackBuffer.hdc, Block_Left, Block_Top, Block_Width, Block_Height, DIB.hdc, 0, 0, vbSrcCopy
    
    Send "rc;" & Chr(3) & ";" & Chr(4)
    'picCapture.Refresh
End Sub



Public Function CheckScale()
    'Fit Capture to screen
    Dim Screen_Width As Long, Screen_Height As Long, Percentage As Long
    
    If AutoScale = False Then
        Me.Move 0, 0, ToScale(Capture_Width) * Screen.TwipsPerPixelX, ToScale(Capture_Height) * Screen.TwipsPerPixelY
        
        Exit Function
    End If
    
    Screen_Width = Screen.Width / Screen.TwipsPerPixelX
    Screen_Height = Screen.Height / Screen.TwipsPerPixelY
    
    If MakePositive(Screen_Width - Capture_Width) > MakePositive(Screen_Height - Capture_Height) Then
        Percentage = (Screen_Width / Capture_Width) * 100
    Else
        Percentage = (Screen_Height / Capture_Height) * 100
    End If
    
    If Percentage <> 100 Then
        If MsgBox("Do you want to scale the capture to fit on your screen?", vbQuestion + vbYesNo) = vbYes Then
            ClientScale = Percentage
            frmCapture.Move 0, 0, ToScale(Capture_Width) * Screen.TwipsPerPixelX, ToScale(Capture_Height) * Screen.TwipsPerPixelY
        Else
            GoTo MaintainScale
        End If
    Else
MaintainScale:
        frmCapture.Move 0, 0, Capture_Width * Screen.TwipsPerPixelX, Capture_Height * Screen.TwipsPerPixelY
        ClientScale = 100
    End If
End Function

Private Sub Form_Resize()
    picCapture.Move 0, 0, Me.Width, Me.Height
End Sub

Private Sub picCapture_DblClick()
    If SendMouse = False Then Exit Sub
    Send "rc;" & Chr(1) & ";" & Chr(6) & Chr(0) & MouseX & Chr(0) & MouseY
End Sub

Private Sub picCapture_KeyDown(KeyCode As Integer, Shift As Integer)
    If SendKeys = False Then Exit Sub
    Send "rc;" & Chr(2) & ";" & Chr(1) & Chr(0) & KeyCode
End Sub

Private Sub picCapture_KeyUp(KeyCode As Integer, Shift As Integer)
    If SendKeys = False Then Exit Sub
    Send "rc;" & Chr(2) & ";" & Chr(2) & Chr(0) & KeyCode
End Sub

Private Sub picCapture_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    If SendMouse = False Then Exit Sub
    
    MouseX = FromScale(X)
    MouseY = FromScale(Y)
    
    Select Case Button
    Case 1
        Send "rc;" & Chr(1) & ";" & Chr(2) & Chr(0) & MouseX & Chr(0) & MouseY
    Case 2
        Send "rc;" & Chr(1) & ";" & Chr(4) & Chr(0) & MouseX & Chr(0) & MouseY
    End Select
    
End Sub

Private Sub picCapture_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If X = MouseX And Y = MouseY Then Exit Sub
    MouseX = FromScale(X)
    MouseY = FromScale(Y)
End Sub

Private Sub picCapture_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If SendMouse = False Then Exit Sub
    
    Select Case Button
    Case 1
        Send "rc;" & Chr(1) & ";" & Chr(3) & Chr(0) & CStr(FromScale(X / Screen.TwipsPerPixelX)) & Chr(0) & CStr(ToScale(Y / Screen.TwipsPerPixelX))
    Case 2
        Send "rc;" & Chr(1) & Chr(5) & Chr(0) & CStr(FromScale(X / Screen.TwipsPerPixelX)) & Chr(0) & CStr(ToScale(Y / Screen.TwipsPerPixelX))
    End Select
End Sub

Private Sub tmrAutoRedraw_Timer()
    On Error Resume Next
    If ClientScale = 100 Then
        BitBlt picCapture.hdc, 0, 0, BackBuffer.Width, BackBuffer.Height, BackBuffer.hdc, 0, 0, vbSrcCopy
    Else
        SetStretchBltMode picCapture.hdc, STRETCHMODE
        StretchBlt picCapture.hdc, 0, 0, ToScale(BackBuffer.Width), ToScale(BackBuffer.Height), BackBuffer.hdc, 0, 0, BackBuffer.Width, BackBuffer.Height, vbSrcCopy
    End If
End Sub

Private Sub tmrMouse_Timer()
    On Error Resume Next
    
    If SendMouse = False Then Exit Sub
    
    If MouseX = OldX And MouseY = OldY Then Exit Sub
    
    Send "rc;" & Chr(1) & ";" & Chr(1) & Chr(0) & MouseX & Chr(0) & MouseY
    OldX = MouseX
    OldY = MouseY
End Sub

Public Function ToScale(Value) As Long
    ToScale = (Value / 100) * ClientScale
End Function

Public Function FromScale(Value) As Long
    FromScale = (Value / ClientScale) * 100
End Function

Function MakePositive(Value)
    If Value < 0 Then
        MakePositive = Value + Value + Value
    Else
        MakePositive = Value
    End If
End Function
