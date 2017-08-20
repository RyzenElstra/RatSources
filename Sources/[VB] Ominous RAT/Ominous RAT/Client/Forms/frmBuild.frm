VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmBuild 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Build Server"
   ClientHeight    =   1290
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   3600
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1290
   ScaleWidth      =   3600
   StartUpPosition =   3  'Windows Default
   Begin MSComDlg.CommonDialog cmdlg 
      Left            =   1560
      Top             =   600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Build"
      Height          =   375
      Left            =   1800
      TabIndex        =   4
      Top             =   840
      Width           =   1695
   End
   Begin VB.TextBox txtServerID 
      Height          =   285
      Left            =   960
      TabIndex        =   3
      Top             =   480
      Width           =   2535
   End
   Begin VB.TextBox txtHost 
      Height          =   285
      Left            =   960
      TabIndex        =   0
      Top             =   120
      Width           =   2535
   End
   Begin VB.Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "Server ID:"
      Height          =   255
      Index           =   2
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   735
   End
   Begin VB.Label lbl 
      BackStyle       =   0  'Transparent
      Caption         =   "DNS:"
      Height          =   255
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   735
   End
End
Attribute VB_Name = "frmBuild"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const sSplit = "#^#"

Private Sub cmdBuild_Click()
DropStub

Dim sStub As String
Open App.Path & "\stub.exe" For Binary As #1
    sStub = Space(LOF(1))
    Get #1, , sStub
Close #1

With cmdlg
    .DialogTitle = "Save"
    .ShowSave
End With

Open cmdlg.FileName For Binary As #1
    Put #1, , sStub
    Put #1, , sSplit & txtHost.Text & sSplit & txtServerID.Text & sSplit
Close #1

MsgBox "Server Built", vbInformation, "Success!"
Unload Me
End Sub

Private Sub DropStub()
Dim sBytz() As Byte
sBytz() = LoadResData(101, "CUSTOM")

Open App.Path & "\stub.exe" For Binary As #1
    Put #1, , sBytz()
Close #1
End Sub
