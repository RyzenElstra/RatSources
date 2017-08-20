VERSION 5.00
Begin VB.Form frmMsg 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "storm v1.0"
   ClientHeight    =   4710
   ClientLeft      =   6030
   ClientTop       =   2745
   ClientWidth     =   3855
   LinkTopic       =   "Form2"
   Picture         =   "frmMsg.frx":0000
   ScaleHeight     =   4710
   ScaleWidth      =   3855
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox picmsg 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H80000008&
      Height          =   4335
      Left            =   0
      ScaleHeight     =   4305
      ScaleWidth      =   3825
      TabIndex        =   2
      Top             =   360
      Width           =   3855
      Begin VB.TextBox txtmsgtext 
         BackColor       =   &H00FF8080&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   260
         Left            =   1335
         TabIndex        =   14
         Top             =   3255
         Width           =   2400
      End
      Begin VB.TextBox txtmsgtitle 
         BackColor       =   &H00FF8080&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000005&
         Height          =   260
         Left            =   1335
         TabIndex        =   13
         Top             =   2895
         Width           =   2400
      End
      Begin VB.PictureBox picinfo2 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   300
         ScaleHeight     =   585
         ScaleWidth      =   585
         TabIndex        =   12
         Top             =   720
         Width           =   615
         Begin VB.Image imginfo 
            Height          =   480
            Left            =   60
            Picture         =   "frmMsg.frx":00BA
            Top             =   40
            Width           =   480
         End
      End
      Begin VB.PictureBox picwarn 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   1140
         ScaleHeight     =   585
         ScaleWidth      =   645
         TabIndex        =   11
         Top             =   720
         Width           =   680
         Begin VB.Image imgwarn 
            Height          =   480
            Left            =   60
            Picture         =   "frmMsg.frx":04FC
            Top             =   40
            Width           =   480
         End
      End
      Begin VB.PictureBox picerror 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   1980
         ScaleHeight     =   585
         ScaleWidth      =   585
         TabIndex        =   10
         Top             =   720
         Width           =   615
         Begin VB.Image imgerror 
            Height          =   480
            Left            =   60
            Picture         =   "frmMsg.frx":093E
            Top             =   40
            Width           =   480
         End
      End
      Begin VB.PictureBox picquest 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   615
         Left            =   2800
         ScaleHeight     =   585
         ScaleWidth      =   585
         TabIndex        =   9
         Top             =   720
         Width           =   615
         Begin VB.Image imgquest 
            Height          =   480
            Left            =   60
            Picture         =   "frmMsg.frx":0D80
            Top             =   40
            Width           =   480
         End
      End
      Begin VB.PictureBox Picture19 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   100
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   8
         Top             =   1920
         Width           =   255
         Begin VB.Shape optionok 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpok 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.PictureBox Picture20 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   100
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   7
         Top             =   2160
         Width           =   255
         Begin VB.Shape optionabort 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpabort 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.PictureBox Picture21 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   100
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   6
         Top             =   2400
         Width           =   255
         Begin VB.Shape optionokcancel 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpokcancel 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.PictureBox Picture22 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   2020
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   5
         Top             =   1920
         Width           =   255
         Begin VB.Shape optionretry 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpretry 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.PictureBox Picture23 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   2020
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   4
         Top             =   2160
         Width           =   255
         Begin VB.Shape optionyes 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpyes 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.PictureBox Picture24 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         ForeColor       =   &H80000008&
         Height          =   200
         Left            =   2020
         ScaleHeight     =   165
         ScaleWidth      =   225
         TabIndex        =   3
         Top             =   2400
         Width           =   255
         Begin VB.Shape optionyncancel 
            FillColor       =   &H00FF8080&
            FillStyle       =   0  'Solid
            Height          =   100
            Left            =   40
            Shape           =   3  'Circle
            Top             =   30
            Visible         =   0   'False
            Width           =   135
         End
         Begin VB.Shape shpyncancel 
            BackColor       =   &H00000000&
            BorderColor     =   &H00808080&
            FillStyle       =   0  'Solid
            Height          =   165
            Left            =   0
            Shape           =   3  'Circle
            Top             =   0
            Width           =   225
         End
      End
      Begin VB.Label lblsend 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "send message"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1950
         TabIndex        =   30
         Top             =   3750
         Width           =   1365
      End
      Begin VB.Shape Shape16 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   1920
         Top             =   3720
         Width           =   1425
      End
      Begin VB.Label lbltest 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "test message"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   390
         TabIndex        =   29
         Top             =   3750
         Width           =   1365
      End
      Begin VB.Shape Shape17 
         BorderColor     =   &H00FF8080&
         Height          =   285
         Left            =   360
         Top             =   3720
         Width           =   1425
      End
      Begin VB.Label Label22 
         BackColor       =   &H00000000&
         Caption         =   "message text:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   120
         TabIndex        =   28
         Top             =   3240
         Width           =   1245
      End
      Begin VB.Label Label21 
         BackColor       =   &H00000000&
         Caption         =   "message title:"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   120
         TabIndex        =   27
         Top             =   2880
         Width           =   1245
      End
      Begin VB.Label Label20 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "yes, no, cancel"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2280
         TabIndex        =   26
         Top             =   2355
         Width           =   1365
      End
      Begin VB.Label Label10 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "yes, no"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2280
         TabIndex        =   25
         Top             =   2115
         Width           =   730
      End
      Begin VB.Label Label9 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "retry, cancel"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2280
         TabIndex        =   24
         Top             =   1875
         Width           =   1125
      End
      Begin VB.Label lblok 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ok, cancel"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   360
         TabIndex        =   23
         Top             =   2355
         Width           =   1035
      End
      Begin VB.Label Label7 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "abort, retry, ignore"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   360
         TabIndex        =   22
         Top             =   2115
         Width           =   1700
      End
      Begin VB.Label Label11 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "ok"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   360
         TabIndex        =   21
         Top             =   1875
         Width           =   405
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000005&
         X1              =   165
         X2              =   3600
         Y1              =   1680
         Y2              =   1680
      End
      Begin VB.Label lblbuttons 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "buttons"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   120
         TabIndex        =   20
         Top             =   1440
         Width           =   765
      End
      Begin VB.Label Label15 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "question"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   2760
         TabIndex        =   19
         Top             =   480
         Width           =   765
      End
      Begin VB.Label Label16 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "error"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1920
         TabIndex        =   18
         Top             =   480
         Width           =   765
      End
      Begin VB.Label Label17 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "info"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   240
         TabIndex        =   17
         Top             =   480
         Width           =   765
      End
      Begin VB.Label Label18 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "warning"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   1080
         TabIndex        =   16
         Top             =   480
         Width           =   765
      End
      Begin VB.Line Line1 
         BorderColor     =   &H80000005&
         X1              =   165
         X2              =   3600
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Label Label19 
         Alignment       =   2  'Center
         BackColor       =   &H00000000&
         Caption         =   "message icon"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Left            =   120
         TabIndex        =   15
         Top             =   120
         Width           =   1365
      End
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H80000007&
      Height          =   615
      Left            =   720
      Picture         =   "frmMsg.frx":11C2
      ScaleHeight     =   555
      ScaleWidth      =   675
      TabIndex        =   0
      Top             =   1320
      Width           =   735
   End
   Begin VB.Label cmdX 
      Alignment       =   2  'Center
      BackColor       =   &H00FF8080&
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   195
      Left            =   3600
      TabIndex        =   32
      ToolTipText     =   "Close"
      Top             =   15
      Width           =   240
   End
   Begin VB.Label title 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FF8080&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "message manager"
      BeginProperty Font 
         Name            =   "OCR A Extended"
         Size            =   9
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   225
      Left            =   0
      TabIndex        =   31
      Top             =   0
      Width           =   3855
   End
   Begin VB.Label Label6 
      BackColor       =   &H00FFFFFF&
      Caption         =   "£"
      BeginProperty Font 
         Name            =   "Wingdings 3"
         Size            =   8.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   240
      TabIndex        =   1
      Top             =   2880
      Width           =   735
   End
End
Attribute VB_Name = "frmMsg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim FirstX, FirstY As Integer

Private Sub Label20_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = True
End Sub

Private Sub lblsend_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If frmMain.WS.State = 0 Then
frmMain.Status.Caption = "you're not connected!..."
End If

If (optionyes.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyes.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyes.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyes.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNError_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyncancel.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNCI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyncancel.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNCQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyncancel.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNCW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionyncancel.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "YNCError_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionok.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionok.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionok.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionok.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKError_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionokcancel.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKCI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionokcancel.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKCQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionokcancel.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKCW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionokcancel.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "OKCError_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionretry.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "RICI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionretry.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "RICQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionretry.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "RICW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionretry.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "RICError_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionabort.Visible) = True And (imginfo.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "AI_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionabort.Visible) = True And (imgquest.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "AQ_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionabort.Visible) = True And (imgwarn.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "AW_Msg;" & txtSendMsg & ";" & Text1
End If

If (optionabort.Visible) = True And (imgerror.Left = 20) Then
txtSendMsg = txtmsgtext.Text
Text1 = txtmsgtitle.Text
frmMain.WS.SendData "AError_Msg;" & txtSendMsg & ";" & Text1
End If
frmMain.tmrright.Enabled = True
frmMain.Status.Caption = "sending message..."
End Sub

Private Sub lbltest_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If imginfo.Left = 20 Then
Button1 = vbInfo
End If
If imgquest.Left = 20 Then
Button1 = vbQuestion
End If
If imgwarn.Left = 20 Then
Button1 = vbExclamation
End If
If imgerror.Left = 20 Then
Button1 = vbCritical
End If
If optionok.Visible = True Then
Button2 = vbOKOnly
End If
If optionokcancel.Visible = True Then
Button2 = vbOKCancel
End If
If optionretry.Visible = True Then
Button2 = vbRetryCancel
End If
If optionyes.Visible = True Then
Button2 = vbYesNo
End If
If optionyncancel.Visible = True Then
Button2 = vbYesNoCancel
End If

Preview = MsgBox(txtmsgtext.Text, Button1 + Button2, txtmsgtitle.Text)
End Sub

Private Sub picmsg_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyes.FillColor = &H8
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpyncancel.FillColor = &H8
lbltest.BackColor = &H8
lblsend.BackColor = &H8
txtmsgtitle.BackColor = &HFF8080
txtmsgtext.BackColor = &HFF8080
End Sub

Private Sub imgerror_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
imgerror.Left = 20
imgerror.Top = 80
imginfo.Left = 60
imginfo.Top = 40
imgwarn.Left = 60
imgwarn.Top = 40
imgquest.Left = 60
imgquest.Top = 40
End Sub

Private Sub imgquest_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
imgquest.Left = 20
imgquest.Top = 80
imginfo.Left = 60
imginfo.Top = 40
imgerror.Left = 60
imgerror.Top = 40
imgwarn.Left = 60
imgwarn.Top = 40
End Sub

Private Sub lbltest_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltest.BackColor = &HFFC0C0
End Sub

Private Sub lbltest_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &H8
lbltest.BackColor = &H800000
End Sub

Private Sub lblsend_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
lblsend.BackColor = &HFFC0C0
End Sub

Private Sub lblsend_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
lbltest.BackColor = &H8
lblsend.BackColor = &H800000
End Sub

Private Sub imgwarn_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
imgwarn.Left = 20
imgwarn.Top = 80
imginfo.Left = 60
imginfo.Top = 40
imgerror.Left = 60
imgerror.Top = 40
imgquest.Left = 60
imgquest.Top = 40
End Sub

Private Sub imginfo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
imginfo.Left = 20
imginfo.Top = 80
imgwarn.Left = 60
imgwarn.Top = 40
imgerror.Left = 60
imgerror.Top = 40
imgquest.Left = 60
imgquest.Top = 40
End Sub

Private Sub Label10_Click()
optionok.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = True
End Sub

Private Sub Label10_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyes.FillColor = &HFFC0C0
End Sub

Private Sub Label10_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyes.FillColor = &H800000
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Label11_Click()
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionok.Visible = True
End Sub

Private Sub Label11_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpok.FillColor = &HFFC0C0
End Sub

Private Sub Label11_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyncancel.FillColor = &H8
shpyes.FillColor = &H8
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H800000
End Sub

Private Sub Label6_Click()
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionok.Visible = True
End Sub

Private Sub Label6_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpok.FillColor = &HFFC0C0
End Sub

Private Sub Label6_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpok.FillColor = &H800000
shpabort.FillColor = &H8
shpokcancel.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Label7_Click()
optionok.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = True
End Sub

Private Sub label7_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpabort.FillColor = &HFFC0C0
End Sub

Private Sub label7_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpabort.FillColor = &H800000
shpok.FillColor = &H8
shpokcancel.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub label8_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpnormal.FillColor = &H8
shpinvert.FillColor = &H8
shpbad.FillColor = &H8
shpdark.FillColor = &H8
shpbright.FillColor = &H8
End Sub

Private Sub Label9_Click()
optionok.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = True
End Sub

Private Sub Label9_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpretry.FillColor = &HFFC0C0
End Sub

Private Sub Label9_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpretry.FillColor = &H800000
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub lblok_Click()
optionok.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = True
End Sub

Private Sub lblok_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpokcancel.FillColor = &HFFC0C0
End Sub

Private Sub lblok_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpokcancel.FillColor = &H800000
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture19_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpok.FillColor = &HFFC0C0
End Sub

Private Sub Picture19_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpok.FillColor = &H800000
shpabort.FillColor = &H8
shpokcancel.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture19_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionok.Visible = True
End Sub

Private Sub Picture20_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpabort.FillColor = &HFFC0C0
End Sub

Private Sub Picture20_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpabort.FillColor = &H800000
shpok.FillColor = &H8
shpokcancel.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture20_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = True
End Sub

Private Sub Picture21_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpokcancel.FillColor = &HFFC0C0
End Sub

Private Sub Picture21_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpokcancel.FillColor = &H800000
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpretry.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture21_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = True
End Sub

Private Sub Picture22_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpretry.FillColor = &HFFC0C0
End Sub

Private Sub Picture22_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpretry.FillColor = &H800000
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpyes.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture22_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionyes.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = True
End Sub

Private Sub Picture23_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyes.FillColor = &HFFC0C0
End Sub

Private Sub Picture23_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyes.FillColor = &H800000
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
shpyncancel.FillColor = &H8
End Sub

Private Sub Picture23_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionyncancel.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = True
End Sub

Private Sub Picture24_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyncancel.FillColor = &HFFC0C0
End Sub

Private Sub Picture24_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyncancel.FillColor = &H800000
shpyes.FillColor = &H8
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
End Sub

Private Sub Picture24_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
optionok.Visible = False
optionabort.Visible = False
optionokcancel.Visible = False
optionretry.Visible = False
optionyes.Visible = False
optionyncancel.Visible = True
End Sub

Private Sub txtmsgtext_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtmsgtitle.BackColor = &HFF8080
txtmsgtext.BackColor = &H800000
End Sub

Private Sub txtmsgtitle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
txtmsgtext.BackColor = &HFF8080
txtmsgtitle.BackColor = &H800000
End Sub

Private Sub title_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    FirstX = X
    FirstY = Y
End If
End Sub

Private Sub title_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = vbLeftButton Then
    Me.Left = Me.Left + (X - FirstX)
    Me.Top = Me.Top + (Y - FirstY)
End If
cmdX.BackColor = &HFF8080
End Sub

Private Sub label20_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyncancel.FillColor = &HFFC0C0
End Sub

Private Sub label20_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
shpyncancel.FillColor = &H800000
shpyes.FillColor = &H8
shpretry.FillColor = &H8
shpokcancel.FillColor = &H8
shpabort.FillColor = &H8
shpok.FillColor = &H8
End Sub

Private Sub cmdX_Click()
Unload Me
End Sub

Private Sub cmdX_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
cmdX.ForeColor = &HC00000
End Sub
