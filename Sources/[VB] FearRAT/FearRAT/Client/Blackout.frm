VERSION 5.00
Begin VB.Form frmBO 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Screen Blackout"
   ClientHeight    =   3720
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   4200
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3720
   ScaleWidth      =   4200
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.CommandButton cmdUnBalckout 
      Caption         =   "&UnBlackout"
      Height          =   300
      Left            =   1380
      TabIndex        =   4
      Top             =   3405
      Width           =   1050
   End
   Begin VB.CommandButton cmdBlackout 
      Caption         =   "&Blackout"
      Height          =   300
      Left            =   2445
      TabIndex        =   2
      Top             =   3405
      Width           =   855
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "&Close"
      Height          =   300
      Left            =   3330
      TabIndex        =   1
      Top             =   3405
      Width           =   855
   End
   Begin VB.TextBox txtBO 
      Alignment       =   2  'Center
      BackColor       =   &H00000000&
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   9.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   2760
      Left            =   0
      MaxLength       =   200
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Blackout.frx":0000
      Top             =   615
      Width           =   4200
   End
   Begin VB.Label lblBO 
      BackStyle       =   0  'Transparent
      Caption         =   "This will make the server's screen go black with a message. The cannot exit the screen until you click UnBlackout."
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   600
      Left            =   15
      TabIndex        =   3
      Top             =   0
      Width           =   4200
   End
End
Attribute VB_Name = "frmBO"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdBlackout_Click()
SD "blackout " & txtBO
End Sub

Private Sub cmdCancel_Click()
Unload Me
End Sub

Private Sub cmdUnBalckout_Click()
SD "blackoutoff"
End Sub
