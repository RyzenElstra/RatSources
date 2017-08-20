VERSION 5.00
Begin VB.Form frmScreen 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Configuracion de Pantalla"
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   4335
   Icon            =   "frmScreen.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   4335
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraScreen 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4095
      Begin VB.CommandButton cmdScreenOn 
         Caption         =   "Encender Pantalla"
         Height          =   255
         Left            =   2160
         TabIndex        =   2
         Top             =   240
         Width           =   1575
      End
      Begin VB.CommandButton cmdScreenOff 
         Caption         =   "Apagar Pantalla"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1575
      End
   End
End
Attribute VB_Name = "frmScreen"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdScreenOff_Click()
Send "ScreenOff"
End Sub

Private Sub cmdScreenOn_Click()
Send "ScreenOn"
End Sub

Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - Configuracion de Pantalla [" & frmMain.LV.SelectedItem & "]"
End Sub
