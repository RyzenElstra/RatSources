VERSION 5.00
Begin VB.Form Status 
   BackColor       =   &H00000000&
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "DerSpaeher 3 eXpert window"
   ClientHeight    =   4260
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4695
   BeginProperty Font 
      Name            =   "Courier New"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4260
   ScaleWidth      =   4695
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      ForeColor       =   &H00FFFFFF&
      Height          =   3855
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   4695
   End
   Begin VB.CommandButton Command2 
      Caption         =   "close"
      Height          =   210
      Left            =   3120
      TabIndex        =   2
      Top             =   3960
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "clean"
      Height          =   210
      Left            =   120
      TabIndex        =   1
      Top             =   3960
      Width           =   1455
   End
End
Attribute VB_Name = "Status"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Text1.Text = ""
End Sub

Private Sub Command2_Click()
Unload Status
DerSpaeher.Show
End Sub
Sub InStatus(Data As Variant, Income As Boolean)
On Error GoTo z
If Income = True Then
Text1.Text = Text1.Text & vbCrLf & "[In]" & Data
Else
Text1.Text = Text1.Text & vbCrLf & "[Out]" & Data
End If
Exit Sub
z:
End Sub

Private Sub Text1_Change()
Text1.SelStart = Len(Text1.Text)
End Sub

