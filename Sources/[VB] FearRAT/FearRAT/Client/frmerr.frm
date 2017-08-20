VERSION 5.00
Begin VB.Form frmerr 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Error"
   ClientHeight    =   1500
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   2790
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1500
   ScaleWidth      =   2790
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdOK 
      Caption         =   "&OK"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   1950
      TabIndex        =   1
      Top             =   1170
      Width           =   825
   End
   Begin VB.TextBox txterr 
      BackColor       =   &H80000000&
      Height          =   1125
      Left            =   0
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   15
      Width           =   2775
   End
End
Attribute VB_Name = "frmerr"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public err As String

Private Sub cmdOK_Click()
Unload Me
End Sub

Private Sub Form_Load()
txterr = err
End Sub

