VERSION 5.00
Begin VB.Form Form7 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Upload"
   ClientHeight    =   4215
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   8040
   LinkTopic       =   "Form7"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4215
   ScaleWidth      =   8040
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.FileListBox File1 
      Height          =   3600
      Left            =   3840
      TabIndex        =   4
      Top             =   480
      Width           =   4095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Cancel"
      Height          =   375
      Left            =   1680
      TabIndex        =   3
      Top             =   2640
      Width           =   1455
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Upload"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   2640
      Width           =   1455
   End
   Begin VB.DirListBox Dir1 
      Height          =   2115
      Left            =   120
      TabIndex        =   1
      Top             =   480
      Width           =   3615
   End
   Begin VB.DriveListBox Drive1 
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   1575
   End
   Begin VB.Label Label1 
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   3240
      Width           =   3135
   End
End
Attribute VB_Name = "Form7"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  If Form1.Winsock1.State = sckConnected Then
    If File1.FileName = "" Then
        MsgBox "Chose file to upload"
    Else
        Form1.List1.AddItem "Upload file: " & File1.FileName & ". Confirm?", 0
        Form1.Command20.Caption = "Confirm"
        Form1.Command20.FontBold = True
        Form7.Hide
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Dir1_Change()
  File1.Path = Dir1.Path
End Sub

Private Sub Drive1_Change()
  Dir1.Path = Drive1.Drive
  File1.Path = Dir1.Path
End Sub

Private Sub File1_Click()

Dim file_data As WIN32_FIND_DATA
Dim intero As Integer

  File1.Path = Dir1.Path
  FindFirstFile Dir1.Path & "\" & File1.FileName, file_data
  intero = file_data.nFileSizeLow / 1024
  Label1.Caption = "File size: " & intero & " Kb"
End Sub

