VERSION 5.00
Begin VB.Form Frm_loading 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "RAT"
   ClientHeight    =   585
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1860
   Icon            =   "load.frx":0000
   LinkTopic       =   "Form1"
   MouseIcon       =   "load.frx":000C
   MousePointer    =   99  'Custom
   ScaleHeight     =   585
   ScaleWidth      =   1860
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox image2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   585
      Left            =   0
      Picture         =   "load.frx":015E
      ScaleHeight     =   585
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   -5
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   555
      Left            =   0
      Picture         =   "load.frx":0845
      Top             =   0
      Width           =   1845
   End
End
Attribute VB_Name = "Frm_loading"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Activate()
On Error Resume Next
Const Tasks = 9  '10 task loadded
Dim Current_Progress As Double
Dim Max_Progress As Integer
Dim Progress_Step As Double

Progress_Step = Image1.Width / Tasks
Max_Progress = Image1.Width
image2.Width = 0
image2.Visible = True
Current_Progress = 0


For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step

For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Loading Finished '''''''
Unload Me
Frm_Main.Show

Exit Sub
End Sub
Private Sub Form_Load()
    Width = Image1.Width
    Height = Image1.Height
End Sub


