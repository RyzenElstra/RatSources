VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmdownloading 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Download Status"
   ClientHeight    =   2490
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   5220
   LinkTopic       =   "Form6"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2490
   ScaleWidth      =   5220
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame a 
      Height          =   2475
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5220
      Begin MSComctlLib.ProgressBar objprog 
         Height          =   255
         Left            =   120
         TabIndex        =   1
         Top             =   2040
         Width           =   4935
         _ExtentX        =   8705
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
      End
      Begin VB.Label Label1 
         Caption         =   "Filename:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   120
         TabIndex        =   5
         Top             =   240
         Width           =   1140
      End
      Begin VB.Label Label2 
         Caption         =   "Bytes:"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   300
         Left            =   165
         TabIndex        =   4
         Top             =   720
         Width           =   1305
      End
      Begin VB.Label lblBytes 
         Height          =   285
         Left            =   1320
         TabIndex        =   3
         Top             =   705
         Width           =   3225
      End
      Begin VB.Label lblFIleName 
         Height          =   285
         Left            =   1770
         TabIndex        =   2
         Top             =   240
         Width           =   3225
      End
   End
End
Attribute VB_Name = "frmdownloading"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
