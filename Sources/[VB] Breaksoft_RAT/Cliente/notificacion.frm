VERSION 5.00
Begin VB.Form notificacion 
   BorderStyle     =   0  'None
   Caption         =   "Form4"
   ClientHeight    =   3195
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2835
   Enabled         =   0   'False
   LinkTopic       =   "Form4"
   ScaleHeight     =   3195
   ScaleWidth      =   2835
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   240
      TabIndex        =   1
      Text            =   "alert.wav"
      Top             =   1920
      Width           =   2175
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1200
      Left            =   2280
      Top             =   0
   End
   Begin VB.PictureBox Picture1 
      Height          =   1575
      Left            =   0
      Picture         =   "notificacion.frx":0000
      ScaleHeight     =   1515
      ScaleWidth      =   2835
      TabIndex        =   0
      Top             =   0
      Width           =   2895
   End
End
Attribute VB_Name = "notificacion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private Const SND_APPLICATION = &H80
Private Const SND_ALIAS = &H10000
Private Const SND_ALIAS_ID = &H110000
Private Const SND_ASYNC = &H1
Private Const SND_SYNC = &H0
Private Const SND_FILENAME = &H20000
Private Const SND_LOOP = &H8
Private Const SND_MEMORY = &H4
Private Const SND_NODEFAULT = &H2
Private Const SND_NOSTOP = &H10
Private Const SND_NOWAIT = &H2000
Private Const SND_PURGE = &H40
Private Const SND_RESOURCE = &H40004
Private Declare Function PlaySound Lib "winmm.dll" Alias "PlaySoundA" ( _
    ByVal lpszName As String, _
    ByVal hModule As Long, _
    ByVal dwFlags As Long) As Long

Dim contador As Integer, cuenta As Integer
Private Sub Form_Load()
Call msn(notificacion, Mostrar, 200, 5)
    Call Reproducir_WAV(Text1.Text, SND_FILENAME Or SND_ASYNC Or SND_NODEFAULT)
End Sub

Private Sub Timer1_Timer()
contador = contador + 1
If contador >= 4 Then
Call msn(notificacion, Ocultar, 200, 5)
End If

End Sub


Sub Reproducir_WAV(Archivo As String, Flags As Long)
    
    Dim ret As Long
 
    ret = PlaySound(Archivo, ByVal 0&, Flags)
End Sub






