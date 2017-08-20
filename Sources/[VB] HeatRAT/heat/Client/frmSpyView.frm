VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmSpyView 
   BackColor       =   &H00808000&
   BorderStyle     =   0  'None
   ClientHeight    =   4575
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5580
   LinkTopic       =   "Form1"
   ScaleHeight     =   4575
   ScaleWidth      =   5580
   StartUpPosition =   1  'CenterOwner
   Begin MSComDlg.CommonDialog cdSave 
      Left            =   120
      Top             =   720
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      Filter          =   "JPEG Image Files  (*.jpg, *.jpeg)|*.jpg;*.jpeg|GIF Image Files (*.gif)|*.gif|Bitmap Files (*.bmp)|*.bmp"
   End
   Begin VB.Frame fmeCustomImageSize 
      BackColor       =   &H00808000&
      BorderStyle     =   0  'None
      Enabled         =   0   'False
      Height          =   1215
      Left            =   480
      TabIndex        =   4
      Top             =   1680
      Visible         =   0   'False
      Width           =   3375
      Begin VB.TextBox txtHeight 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   2280
         TabIndex        =   8
         Top             =   360
         Width           =   735
      End
      Begin VB.TextBox txtWidth 
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         Height          =   285
         Left            =   600
         TabIndex        =   6
         Top             =   360
         Width           =   735
      End
      Begin VB.Label cmdCustomApply 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "APPLY"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   1200
         TabIndex        =   12
         Top             =   840
         Width           =   975
      End
      Begin VB.Label cmdCustomCancel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "CANCEL"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   2280
         TabIndex        =   11
         Top             =   840
         Width           =   975
      End
      Begin VB.Label cmdCustomOk 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "OK"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000009&
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   840
         Width           =   975
      End
      Begin VB.Label lblHeight 
         BackStyle       =   0  'Transparent
         Caption         =   "Height:"
         Height          =   255
         Left            =   1680
         TabIndex        =   9
         Top             =   360
         Width           =   615
      End
      Begin VB.Label lblWidth 
         BackStyle       =   0  'Transparent
         Caption         =   "Width:"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   360
         Width           =   495
      End
      Begin VB.Label CustomTitleBar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H8000000D&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Custom|Size"
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   5
         Top             =   0
         Width           =   3375
      End
      Begin VB.Line Line5 
         X1              =   0
         X2              =   3360
         Y1              =   1200
         Y2              =   1200
      End
      Begin VB.Line Line4 
         X1              =   3360
         X2              =   3360
         Y1              =   0
         Y2              =   1200
      End
      Begin VB.Line Line2 
         X1              =   0
         X2              =   0
         Y1              =   1200
         Y2              =   0
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   4200
      Top             =   600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   1
      ImageHeight     =   1
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmSpyView.frx":0000
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmSpyView.frx":0056
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label cmdSaveImg 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Save"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   255
      Left            =   3720
      TabIndex        =   13
      Top             =   360
      Width           =   1095
   End
   Begin VB.Label cmdExit 
      BackStyle       =   0  'Transparent
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   4680
      TabIndex        =   3
      Top             =   0
      Width           =   135
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Spy|View"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   0
      Width           =   4815
   End
   Begin VB.Label cmdCustom 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Custom"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   1455
   End
   Begin VB.Label cmdOriginal 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H8000000D&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Original"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   9
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000009&
      Height          =   255
      Left            =   1560
      TabIndex        =   0
      Top             =   360
      Width           =   975
   End
   Begin VB.Image SpyImage 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   3600
      Left            =   0
      Picture         =   "frmSpyView.frx":C9E8
      Stretch         =   -1  'True
      Top             =   600
      Width           =   4800
   End
End
Attribute VB_Name = "frmSpyView"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public PrevWidth As Long, PrevHeight As Long

Private Sub cmdOriginal_Click()
SpyImage.Width = PrevWidth * Screen.TwipsPerPixelX
SpyImage.Height = PrevHeight * Screen.TwipsPerPixelY
Form_Load
End Sub

Private Sub cmdCustom_Click()
fmeCustomImageSize.Visible = True
fmeCustomImageSize.Enabled = True
End Sub

Private Sub cmdCustom_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmSpyView.cmdCustom
End Sub

Private Sub cmdCustom_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmSpyView.cmdCustom
End Sub

Private Sub cmdCustomApply_Click()
SpyImage.Width = Val(txtWidth.Text) * Screen.TwipsPerPixelX
SpyImage.Height = Val(txtHeight.Text) * Screen.TwipsPerPixelY
Form_Load
End Sub

Private Sub cmdCustomApply_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmSpyView.cmdCustomApply
End Sub

Private Sub cmdCustomApply_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmSpyView.cmdCustomApply
End Sub

Private Sub cmdCustomCancel_Click()
fmeCustomImageSize.Visible = False
fmeCustomImageSize.Enabled = False
End Sub

Private Sub cmdCustomCancel_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmSpyView.cmdCustomCancel
End Sub

Private Sub cmdCustomCancel_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmSpyView.cmdCustomCancel
End Sub

Private Sub cmdCustomOk_Click()
SpyImage.Width = Val(txtWidth.Text) * Screen.TwipsPerPixelX
SpyImage.Height = Val(txtHeight.Text) * Screen.TwipsPerPixelY
Form_Load
fmeCustomImageSize.Visible = False
fmeCustomImageSize.Enabled = False
End Sub

Private Sub cmdCustomOk_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmSpyView.cmdCustomOk
End Sub

Private Sub cmdCustomOk_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmSpyView.cmdCustomOk
End Sub

Private Sub cmdExit_Click()
Me.Tag = ""
Unload Me
End Sub

Private Sub cmdSaveImg_Click()
On Error GoTo ErrorHandler
cdSave.ShowSave
SavePicture Me.SpyImage.Picture, cdSave.FileName
Exit Sub
ErrorHandler:
Select Case Err.Number
Case 52755
Exit Sub
Case Else
MsgBox Err.Description, vbCritical + vbOKOnly, "Spy|View Export Image"
End Select
End Sub

Private Sub cmdSaveImg_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 0, frmSpyView.cmdSaveImg
End Sub

Private Sub cmdSaveImg_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
frmMain.MouseClick 1, frmSpyView.cmdSaveImg
End Sub

Private Sub CustomTitleBar_Click()
fmeCustomImageSize.Visible = False
fmeCustomImageSize.Enabled = False
End Sub

Private Sub Form_Load()
Me.Width = SpyImage.Width
Me.Height = SpyImage.Height + SpyImage.Top
If Me.Width < cmdOriginal.Left + cmdOriginal.Width Then Me.Width = cmdOriginal.Left + cmdOriginal.Width
If Me.Height < cmdOriginal.Left + cmdOriginal.Width Then Me.Height = cmdOriginal.Left + cmdOriginal.Width
End Sub

Public Sub SpyPictureLoad(ImagePath As String)
SpyImage.Picture = ImageList1.ListImages.Item(2).Picture
End Sub

Private Sub Form_Resize()
cmdExit.Left = Me.Width - cmdExit.Width
TitleBar.Width = Me.Width
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
FormDrag frmSpyView
End Sub
