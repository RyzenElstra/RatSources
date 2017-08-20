VERSION 5.00
Begin VB.Form Loading 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   0  'None
   Caption         =   "KoKo Martial 23-U"
   ClientHeight    =   510
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1830
   Icon            =   "Loading.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MouseIcon       =   "Loading.frx":000C
   MousePointer    =   99  'Custom
   ScaleHeight     =   510
   ScaleWidth      =   1830
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox image2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   585
      Left            =   0
      Picture         =   "Loading.frx":015E
      ScaleHeight     =   585
      ScaleWidth      =   255
      TabIndex        =   0
      Top             =   -5
      Visible         =   0   'False
      Width           =   255
   End
   Begin VB.Image Image1 
      Appearance      =   0  'Flat
      Height          =   585
      Left            =   0
      Picture         =   "Loading.frx":0A53
      Top             =   0
      Width           =   1860
   End
End
Attribute VB_Name = "Loading"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Activate()
Const Tasks = 13   '10 task loadded
Dim Current_Progress As Double
Dim Max_Progress As Integer
Dim Progress_Step As Double

Progress_Step = Image1.Width / Tasks
Max_Progress = Image1.Width
image2.Width = 0
image2.Visible = True
Current_Progress = 0

''''''' Start Loading componants '''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 1 '''''''
'TODO
'Ensure Active-X Componants present in this system
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 2 '''''''
  'Check Folders And Paths
   On Error GoTo FailedToInstall
   Dim CurrentPath As String
   CurrentPath = App.Path & "\Downloads"
   If CBool(PathFileExists(CurrentPath)) = False Then MkDir CurrentPath
   CurrentPath = App.Path & "\InI"
   If CBool(PathFileExists(CurrentPath)) = False Then MkDir CurrentPath
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 3 '''''''
Load Frm_Main
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 4 '''''''
'TODO
App.HelpFile = Mid$(AppPath, 1, InStrRev(AppPath, "\")) & "Help\Handle-X.hlp"
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 5 '''''''
Load Editor
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 6 '''''''
'Disable All Startup Features and remove all Configurations Checkboxs
 Dim Cnt As Integer
 For Cnt = 0 To Frm_Main.Checks.UBound
    Frm_Main.Checks(Cnt).Value = 0
 Next Cnt
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 7 '''''''
'TODO
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 8 '''''''
'TODO
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 9 '''''''
'TODO
''''''''''''''''''''''
For i = Current_Progress To Current_Progress + Progress_Step
   DoEvents
   image2.Visible = False
   image2.Width = i
   image2.Visible = True
Next
Current_Progress = Current_Progress + Progress_Step
''''''' Task 10 '''''''
'TODO
''''''''''''''''''''''
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
FailedToInstall:
    MsgBox "There is an error happen in loadding Handle-X." & vbCrLf & _
    "The Following points may be occured:-" & vbCrLf & vbCrLf & _
    "[The disk which Handle-X is located is read only mode]" & vbCrLf & _
    "[There is no enough memory to load Handle-X componants]" & vbCrLf & _
    "[One of the dll's and ocx's of Handle-X is missed or cann't be loaded]" & vbCrLf & _
    "[Some functions used in Handle-X is not compatable with your system!]", vbCritical, AppName
    
    End 'Close Handle-X
End Sub
Private Sub Form_Load()
    Width = Image1.Width
    Height = Image1.Height
End Sub

