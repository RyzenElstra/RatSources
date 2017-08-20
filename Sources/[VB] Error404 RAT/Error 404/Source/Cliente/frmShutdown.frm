VERSION 5.00
Begin VB.Form frmShutdown 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 - Menu Apagar"
   ClientHeight    =   735
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   5055
   Icon            =   "frmShutdown.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   735
   ScaleWidth      =   5055
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame fraShutdown 
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   4815
      Begin VB.CommandButton cmdSuspend 
         Caption         =   "Suspender"
         Height          =   255
         Left            =   1680
         TabIndex        =   3
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdRestart 
         Caption         =   "Reiniciar"
         Height          =   255
         Left            =   3240
         TabIndex        =   2
         Top             =   240
         Width           =   1455
      End
      Begin VB.CommandButton cmdShutdown 
         Caption         =   "Apagar"
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1455
      End
   End
End
Attribute VB_Name = "frmShutdown"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdRestart_Click()
Send "RestartPC"
End Sub

Private Sub cmdShutdown_Click()
Send "ShutdownPC"
End Sub

Private Sub cmdSuspend_Click()
Send "SuspendPC"
End Sub
