Attribute VB_Name = "mdFlipScreen"
Declare Function GetDesktopWindow Lib "USER32" () As Long 'declare API
Declare Function GetDC Lib "USER32" (ByVal hwnd As Long) As Long
Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal x As Long, ByVal y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Declare Function StretchBlt% Lib "gdi32" (ByVal hdc%, ByVal x%, ByVal y%, ByVal nWidth%, ByVal nHeight%, ByVal hSrcDC%, ByVal xSrc%, ByVal ySrc%, ByVal nSrcWidth%, ByVal nSrcHeight%, ByVal dwRop&)

Public Const SRCCOPY = &HCC0020
Public Const SRCAND = &H8800C6
Public Const SRCINVERT = &H660046

Public Sub DumpToWindow(TargetBox As Control, change, fliph As Boolean, flipv As Boolean)
Dim Desktop As Long 'this will be set the hDc of the desktop

Desktop = GetDC(GetDesktopWindow) 'get the hDc of the desktop and put it in the variable 'desktop'
ww = Screen.Width / Screen.TwipsPerPixelX 'get screen size in pixels
hh = Screen.Height / Screen.TwipsPerPixelY
BitBlt TargetBox.hdc, 0, 0, ww, hh, Desktop, 0, 0, change 'copy to frmSCR.picture1
If fliph = True Then Call FlipPictureHorizontal(frmSCR.Picture1, frmSCR.Picture1) 'if requested, flip
If flipv = True Then Call FlipPictureVertical(frmSCR.Picture1, frmSCR.Picture1) 'if requested, flip
End Sub

Sub FlipPictureHorizontal(pic1 As PictureBox, pic2 As PictureBox)
On Error Resume Next

pic1.ScaleMode = 3
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim retVal%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
retVal% = StretchBlt(pic2.hdc, px%, 0, -px%, py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

Sub FlipPictureVertical(pic1 As PictureBox, pic2 As PictureBox)
On Error Resume Next

pic1.ScaleMode = 3
pic2.ScaleMode = 3
Dim px%
Dim py%
Dim retVal%
px% = pic1.ScaleWidth
py% = pic1.ScaleHeight
retVal% = StretchBlt(pic2.hdc, 0, py%, px%, -py%, pic1.hdc, 0, 0, px%, py%, SRCCOPY)
End Sub

