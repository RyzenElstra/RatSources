VERSION 5.00
Begin VB.Form Form2 
   BackColor       =   &H0000FF00&
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   2730
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   6270
   ControlBox      =   0   'False
   FillColor       =   &H00C0C000&
   ForeColor       =   &H00C0C000&
   Icon            =   "SplashScreenDerSpaeher3.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "SplashScreenDerSpaeher3.frx":030A
   ScaleHeight     =   2730
   ScaleWidth      =   6270
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.Timer Timer1 
      Interval        =   3000
      Left            =   1200
      Top             =   1800
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Timer1_Timer()
Load DerSpaeher
DerSpaeher.Show
Unload Form2
End Sub




