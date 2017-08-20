VERSION 5.00
Begin VB.Form frmPassword 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Authorisation Request"
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4575
   ControlBox      =   0   'False
   DrawMode        =   14  'Copy Pen
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   4575
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdSubmit 
      Caption         =   "Submit"
      Height          =   255
      Left            =   3120
      TabIndex        =   1
      Top             =   360
      Width           =   1335
   End
   Begin VB.TextBox txtPassword 
      BeginProperty Font 
         Name            =   "Symbol"
         Size            =   8.25
         Charset         =   2
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   285
      IMEMode         =   3  'DISABLE
      Left            =   120
      PasswordChar    =   "·"
      TabIndex        =   0
      Top             =   360
      Width           =   2895
   End
   Begin VB.Label lblPassword 
      Caption         =   "Enter authorisation password:"
      Height          =   255
      Left            =   120
      TabIndex        =   2
      Top             =   0
      Width           =   2295
   End
End
Attribute VB_Name = "frmPassword"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Sub cmdSubmit_Click()
    If txtPassword.Text <> "" Then Me.Hide Else Beep
End Sub


Public Function DescrableAuthorisation(ScrabledCode As String) As String
    Me.Show vbModal, frmMain
    
    ScrabledCode = BasMain.RetrieveReservedChars(ScrabledCode)
    
    DescrableAuthorisation = StrConv(modEncryption.Decrypt(txtPassword.Text, StrConv(ScrabledCode, vbFromUnicode)), vbUnicode)
    
    Unload Me
    
End Function
