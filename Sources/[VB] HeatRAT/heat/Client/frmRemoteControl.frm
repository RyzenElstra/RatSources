VERSION 5.00
Begin VB.Form frmRemoteControl 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   ClientHeight    =   5265
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6690
   ControlBox      =   0   'False
   LinkTopic       =   "ControlWindow"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5265
   ScaleWidth      =   6690
   ShowInTaskbar   =   0   'False
   WindowState     =   2  'Maximized
   Begin VB.Timer tmrMouse 
      Interval        =   100
      Left            =   0
      Top             =   0
   End
End
Attribute VB_Name = "frmRemoteControl"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim CurrentMX As Single, CurrentMY As Single
Dim LastMX As Single, LastMY As Single

Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)
Send "key;down;" & KeyCode
End Sub

Private Sub Form_KeyUp(KeyCode As Integer, Shift As Integer)
Send "key;up;" & KeyCode
End Sub

Private Sub Form_Load()
frmRemoteControlToolbox.Show , Me
Me.BackColor = vbBlack
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Send "mouse;down;" & Button
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
CurrentMX = X
CurrentMY = Y
End Sub

Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Send "mouse;up;" & Button
End Sub

Private Sub tmrMouse_Timer()
On Error Resume Next

If CurrentMX = LastMX And CurrentMY = LastMY Then Exit Sub

Send "mouse;move;" & (CurrentMX / Screen.TwipsPerPixelX) & ";" & (CurrentMY / Screen.TwipsPerPixelY)

LastMX = CurrentMX
LastMY = CurrentMY

End Sub
