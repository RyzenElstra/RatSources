VERSION 5.00
Begin VB.Form frmFindFiles 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Find Files"
   ClientHeight    =   4005
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4995
   Icon            =   "frmFindFiles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4005
   ScaleWidth      =   4995
   StartUpPosition =   2  'CenterScreen
   Begin VB.ListBox List1 
      Height          =   2985
      ItemData        =   "frmFindFiles.frx":030A
      Left            =   90
      List            =   "frmFindFiles.frx":030C
      TabIndex        =   3
      Top             =   300
      Width           =   4815
   End
   Begin VB.CommandButton cmdMoveList 
      Caption         =   "Move List To File Manager"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   120
      Style           =   1  'Graphical
      TabIndex        =   1
      ToolTipText     =   "Move list to File Manager"
      Top             =   3510
      Width           =   2500
   End
   Begin VB.CommandButton cmdClose 
      Caption         =   "Close"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   330
      Left            =   4140
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Close"
      Top             =   3510
      Width           =   800
   End
   Begin VB.Label lblFound 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Found 0 File(s)."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   120
      TabIndex        =   2
      Top             =   30
      Width           =   1125
   End
End
Attribute VB_Name = "frmFindFiles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdMoveList_Click()
Dim i As Integer

If List1.ListCount <> -1 Then
   Call frmFileGM.ClearList
   Call frmFileGM.setIndex(1)
   frmFileGM.ListView1.ColumnHeaders.Add , , "Directory", 4000
   For i = 0 To List1.ListCount - 1
       Call frmFileGM.ReceiveData(List1.List(i), i + 1)
   Next i
End If
End Sub

Private Sub cmdClose_Click()
    Unload Me
End Sub

Public Sub ReceivedFindFiles(DATA As String)
    List1.AddItem DATA
End Sub

Private Sub Form_Load()
    List1.Clear
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    Me.Tag = "Hide"
End Sub
