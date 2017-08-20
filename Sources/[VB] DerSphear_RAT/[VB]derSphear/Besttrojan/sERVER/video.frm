VERSION 5.00
Begin VB.Form Video 
   BorderStyle     =   0  'None
   ClientHeight    =   4785
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5475
   ForeColor       =   &H00C0C0C0&
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4785
   ScaleWidth      =   5475
   ShowInTaskbar   =   0   'False
   Begin VB.PictureBox Picture1 
      AutoSize        =   -1  'True
      BorderStyle     =   0  'None
      Height          =   1770
      Left            =   0
      ScaleHeight     =   1770
      ScaleWidth      =   1860
      TabIndex        =   0
      Top             =   0
      Width           =   1860
   End
End
Attribute VB_Name = "Video"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal crColor As Long) As Long
Private Declare Function GetPixel Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long) As Long
Private Declare Function StretchBlt Lib "gdi32" (ByVal hdc As Long, ByVal x As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal nSrcWidth As Long, ByVal nSrcHeight As Long, ByVal dwRop As Long) As Long
Const SRCCOPY = &HCC0020
Const Pi = 3.14159265359
Const FLOAT = 1, SINK = 0

Private Sub Form_Load()
Picture1.ScaleMode = 3
Video.Top = 0
Video.Left = 0
Dim f As Integer
f = Me.hwnd
Call FloatWindow(f, FLOAT)
End Sub


Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, x As Single, Y As Single)
If Button = vbRightButton Then
Unload Video
Else
End If
End Sub
Private Sub bmp_rotate(pic1 As PictureBox, pic2 As PictureBox, ByVal theta!)
Dim c1x As Integer, c1y As Integer
Dim c2x As Integer, c2y As Integer
Dim a As Single
Dim p1x As Integer, p1y As Integer
Dim p2x As Integer, p2y As Integer
Dim n As Integer, r As Integer

c1x = pic1.ScaleWidth \ 2
c1y = pic1.ScaleHeight \ 2
c2x = pic2.ScaleWidth \ 2
c2y = pic2.ScaleHeight \ 2

If c2x < c2y Then n = c2y Else n = c2x
n = n - 1
pic1hDC% = pic1.hdc
pic2hDC% = pic2.hdc
For p2x = 0 To n
For p2y = 0 To n

If p2x = 0 Then a = Pi / 2 Else a = Atn(p2y / p2x)
r = Sqr(1& * p2x * p2x + 1& * p2y * p2y)
p1x = r * Cos(a + theta!)
p1y = r * Sin(a + theta!)
c0& = GetPixel(pic1hDC%, c1x + p1x, c1y + p1y)
c1& = GetPixel(pic1hDC%, c1x - p1x, c1y - p1y)
c2& = GetPixel(pic1hDC%, c1x + p1y, c1y - p1x)
c3& = GetPixel(pic1hDC%, c1x - p1y, c1y + p1x)

If c0& <> -1 Then xret& = SetPixel(pic2hDC%, c2x + p2x, c2y + p2y, c0&)
If c1& <> -1 Then xret& = SetPixel(pic2hDC%, c2x - p2x, c2y - p2y, c1&)
If c2& <> -1 Then xret& = SetPixel(pic2hDC%, c2x + p2y, c2y - p2x, c2&)
If c3& <> -1 Then xret& = SetPixel(pic2hDC%, c2x - p2y, c2y + p2x, c3&)

Next
T% = DoEvents()
Next
End Sub
 Sub ZickZack()
Picture1.Cls
px% = Picture1.ScaleWidth
py% = Picture1.ScaleHeight
RetVal% = StretchBlt(Picture1.hdc, px%, 0, -px%, py%, Picture1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

 Sub Verdikal()

Picture1.Cls
px% = Picture1.ScaleWidth
py% = Picture1.ScaleHeight
RetVal% = StretchBlt(Picture1.hdc, 0, py%, px%, -py%, Picture1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

 Sub DrehenUm(ByVal Wert As Integer)

Picture1.Cls
Call bmp_rotate(Picture1, Picture1, 3.14 / Wert)
End Sub
