VERSION 5.00
Begin VB.Form frmWindowManager 
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   "Window Manager"
   ClientHeight    =   4215
   ClientLeft      =   4545
   ClientTop       =   3960
   ClientWidth     =   6375
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   6375
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CheckBox chkMustBeVisible 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Must Be Visible"
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      TabIndex        =   19
      Top             =   3480
      Value           =   1  'Checked
      Width           =   855
   End
   Begin VB.Frame fmeKeys 
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   0  'None
      Height          =   1575
      Left            =   1800
      TabIndex        =   13
      Top             =   1200
      Visible         =   0   'False
      Width           =   3135
      Begin VB.TextBox txtKeys 
         Appearance      =   0  'Flat
         Height          =   735
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   16
         Top             =   480
         Width           =   2895
      End
      Begin VB.Label cmdCancel 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Cancel"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   1560
         TabIndex        =   18
         Top             =   1260
         Width           =   1215
      End
      Begin VB.Label cmdAccept 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Accept"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   17
         Top             =   1260
         Width           =   1215
      End
      Begin VB.Label lblEnterString 
         BackStyle       =   0  'Transparent
         Caption         =   "Keys to send:"
         Height          =   255
         Left            =   0
         TabIndex        =   15
         Top             =   240
         Width           =   1095
      End
      Begin VB.Line lIbR 
         X1              =   3120
         X2              =   3120
         Y1              =   240
         Y2              =   1560
      End
      Begin VB.Line lIbB 
         X1              =   0
         X2              =   3120
         Y1              =   1560
         Y2              =   1560
      End
      Begin VB.Line lIbL 
         X1              =   0
         X2              =   0
         Y1              =   240
         Y2              =   1560
      End
      Begin VB.Label ibTitleBar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00800000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Input Box"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   0
         TabIndex        =   14
         Top             =   0
         Width           =   3135
      End
   End
   Begin VB.ListBox lstID 
      Appearance      =   0  'Flat
      Height          =   2955
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   855
   End
   Begin VB.ListBox lstMain 
      Appearance      =   0  'Flat
      Height          =   2955
      Left            =   1080
      TabIndex        =   0
      Top             =   480
      Width           =   5175
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
      Left            =   6240
      TabIndex        =   12
      Top             =   0
      Width           =   255
   End
   Begin VB.Line lBorderB 
      X1              =   0
      X2              =   6360
      Y1              =   4200
      Y2              =   4200
   End
   Begin VB.Label cmdRefresh 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Refresh"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5040
      TabIndex        =   11
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label cmdSendKeys 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "SendKeys"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3720
      TabIndex        =   10
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label cmdShow 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Show Window"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2400
      TabIndex        =   9
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label cmdHide 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Hide Window"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1080
      TabIndex        =   8
      Top             =   3840
      Width           =   1215
   End
   Begin VB.Label cmdSetFocus 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Set Focus"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   5040
      TabIndex        =   7
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label cmdNewTask 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "New Task"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   2400
      TabIndex        =   6
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label cmdChange 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Change Caption"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   3720
      TabIndex        =   5
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Label cmdClose 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Close Window"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1080
      TabIndex        =   4
      Top             =   3480
      Width           =   1215
   End
   Begin VB.Line lBorderR 
      X1              =   6360
      X2              =   6360
      Y1              =   240
      Y2              =   4200
   End
   Begin VB.Line lBorderL 
      X1              =   0
      X2              =   0
      Y1              =   240
      Y2              =   4200
   End
   Begin VB.Label TitleBar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00800000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Syndrome Window Manager"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   6375
   End
   Begin VB.Label lblWindows 
      BackStyle       =   0  'Transparent
      Caption         =   "Windows open:"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   240
      Width           =   1695
   End
End
Attribute VB_Name = "frmWindowManager"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CustomButton(Down As Boolean, Button As Label)
Select Case Down
Case True
    Button.BackColor = &HFFFFFF
Case False
    Button.BackColor = &HC0C0C0
End Select
End Sub

Private Sub cmdAccept_Click()
fmeKeys.Visible = False
Send "window;sendkeys;" & CorrectReservedChars(txtKeys.Text) & ";" & CorrectReservedChars(lstID.Text)
End Sub

Private Sub cmdAccept_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdAccept
End Sub

Private Sub cmdAccept_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdAccept
End Sub

Private Sub cmdCancel_Click()
fmeKeys.Visible = False
End Sub

Private Sub cmdCancel_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdCancel
End Sub

Private Sub cmdCancel_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdCancel
End Sub

Private Sub cmdChange_Click()
Dim OldCaption As String, NewCaption As String, Index As Single
If Mid(lstMain.Text, 1, 3) = "(i)" Or Mid(lstMain.Text, 1, 3) = "(v)" Then
    OldCaption = Mid(lstMain.Text, 4)
Else
    OldCaption = lstMain.Text
End If

NewCaption = InputBox("New Caption: ", "Window Manager", OldCaption)
If NewCaption = "" Then Exit Sub
Send "window;change;" & CorrectReservedChars(NewCaption) & ";" & CorrectReservedChars(lstID.Text)
Index = lstID.ListIndex
lstMain.RemoveItem Index
lstMain.AddItem NewCaption, Index
End Sub

Private Sub cmdChange_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdChange
End Sub

Private Sub cmdChange_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdChange
End Sub


Private Sub cmdClose_Click()
On Error Resume Next
Send "window;close;" & lstID.Text
lstID.RemoveItem lstID.ListIndex
lstMain.RemoveItem lstMain.ListIndex
End Sub

Private Sub cmdClose_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdClose
End Sub

Private Sub cmdClose_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdClose
End Sub

Private Sub cmdExit_Click()
Me.Hide
End Sub

Private Sub cmdMaximise_Click()
Send "window;maximise;" & lstID.Text
End Sub


Private Sub cmdHide_Click()
Send "window;hide;" & lstID.Text
End Sub

Private Sub cmdHide_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdHide
End Sub

Private Sub cmdHide_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdHide
End Sub


Private Sub cmdNewTask_Click()
frmNewTask.Show vbModal, Me
End Sub

Private Sub cmdNewTask_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdNewTask
End Sub

Private Sub cmdNewTask_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdNewTask
End Sub


Private Sub cmdRefresh_Click()
Send "request;windows;windows." & chkMustBeVisible.Value
End Sub

Private Sub cmdRefresh_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdRefresh
End Sub

Private Sub cmdRefresh_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdRefresh
End Sub


Private Sub cmdSendKeys_Click()
Dim keys As String
fmeKeys.Visible = True
End Sub

Private Sub cmdSendKeys_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdSendKeys
End Sub

Private Sub cmdSendKeys_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdSendKeys
End Sub


Private Sub cmdSetFocus_Click()
Send "window;setfocus;" & lstID.Text
End Sub

Private Sub cmdSetFocus_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdSetFocus
End Sub

Private Sub cmdSetFocus_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdSetFocus
End Sub

Private Sub cmdShow_Click()
Send "window;show;" & lstID.Text
End Sub

Private Sub cmdShow_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton True, cmdShow
End Sub

Private Sub cmdShow_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
CustomButton False, cmdShow
End Sub

Private Sub Form_Load()
Send "request;windows;windows.1"
End Sub

Private Sub lstID_Click()
On Error Resume Next
lstMain.ListIndex = lstID.ListIndex
txtKeys.Text = lstMain.Text
End Sub

Private Sub lstMain_Click()
On Error Resume Next
lstID.ListIndex = lstMain.ListIndex
End Sub

Private Sub TitleBar_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
FormDrag Me
End Sub
