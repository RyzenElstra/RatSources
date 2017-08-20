VERSION 5.00
Begin VB.Form frmVIRUSs 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   90
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   120
   LinkTopic       =   "Form3"
   ScaleHeight     =   90
   ScaleWidth      =   120
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   -360
      Top             =   0
   End
End
Attribute VB_Name = "frmVIRUSs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Const FLOAT = 1, SINK = 0
Dim x, Y As Long
Dim MoveTo As Integer


Private Sub Form_Load()
Dim f As Integer
f = Me.hwnd
Call FloatWindow(f, FLOAT)
x = Screen.Width / 2
Y = Screen.Height / 2
frmVIRUSs.Left = x
frmVIRUSs.Top = Y
Randomize
MoveTo = Int((4) * Rnd + 1)
End Sub


Private Sub Timer1_Timer()

Select Case MoveTo
Case 1
If x < 0 Then MoveTo = 2: Exit Sub
If Y < 0 Then MoveTo = 4: Exit Sub
Y = Y - 320
x = x - 320

Case 2
If x > Screen.Width - frmVIRUSs.Width Then MoveTo = 1: Exit Sub
If Y < 0 Then MoveTo = 3: Exit Sub
Y = Y - 320
x = x + 320

Case 3
If x > Screen.Width - frmVIRUSs.Width Then MoveTo = 4: Exit Sub
If Y > Screen.Height - frmVIRUSs.Height Then MoveTo = 2: Exit Sub
Y = Y + 320
x = x + 320

Case 4
If x < 0 Then MoveTo = 3: Exit Sub
If Y > Screen.Height - frmVIRUSs.Height Then MoveTo = 1: Exit Sub
Y = Y + 320
x = x - 320

End Select
frmVIRUSs.Move x, Y
End Sub

