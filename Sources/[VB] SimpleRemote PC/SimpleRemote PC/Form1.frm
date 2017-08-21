VERSION 5.00
Object = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}#1.1#0"; "TABCTL32.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmmain 
   BackColor       =   &H00FFFF00&
   Caption         =   "PC à distance (Client)"
   ClientHeight    =   6870
   ClientLeft      =   165
   ClientTop       =   450
   ClientWidth     =   10080
   FillColor       =   &H00C0C0C0&
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   6870
   ScaleWidth      =   10080
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.StatusBar StatusBar1 
      Align           =   2  'Align Bottom
      Height          =   375
      Left            =   0
      TabIndex        =   68
      Top             =   6495
      Width           =   10080
      _ExtentX        =   17780
      _ExtentY        =   661
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   12144
            Text            =   "Etat de connexion :Non connecté au serveur"
            TextSave        =   "Etat de connexion :Non connecté au serveur"
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   6
            Alignment       =   1
            TextSave        =   "23/02/03"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            Style           =   5
            Picture         =   "Form1.frx":08CA
            TextSave        =   "23:41"
         EndProperty
      EndProperty
   End
   Begin VB.Frame Frame1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "PC à distance info :"
      Height          =   735
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   10095
      Begin VB.CommandButton closeserver 
         BackColor       =   &H80000001&
         Caption         =   "Fermer serveur à distant"
         Enabled         =   0   'False
         Height          =   375
         Left            =   7080
         Style           =   1  'Graphical
         TabIndex        =   71
         Top             =   240
         Width           =   2055
      End
      Begin VB.CommandButton Disconnect 
         BackColor       =   &H80000001&
         Caption         =   "Se déconnecte"
         Enabled         =   0   'False
         Height          =   375
         Left            =   5040
         Style           =   1  'Graphical
         TabIndex        =   30
         Top             =   240
         Width           =   2055
      End
      Begin VB.CommandButton Connect 
         BackColor       =   &H80000001&
         Caption         =   "Se connecte"
         Height          =   375
         Left            =   3000
         Style           =   1  'Graphical
         TabIndex        =   29
         Top             =   240
         Width           =   2055
      End
      Begin VB.TextBox Text10 
         Alignment       =   2  'Center
         Height          =   375
         Left            =   1080
         TabIndex        =   2
         Text            =   "127.0.0.1"
         Top             =   240
         Width           =   1695
      End
      Begin VB.Shape State1 
         FillStyle       =   0  'Solid
         Height          =   375
         Left            =   9480
         Shape           =   3  'Circle
         Top             =   240
         Width           =   375
      End
      Begin VB.Label Label100 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Adresse IP :"
         Height          =   375
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   855
      End
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   10320
      Top             =   480
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin TabDlg.SSTab SSTab1 
      Height          =   5775
      Left            =   0
      TabIndex        =   3
      Top             =   720
      Width           =   10095
      _ExtentX        =   17806
      _ExtentY        =   10186
      _Version        =   393216
      TabHeight       =   520
      Enabled         =   0   'False
      BackColor       =   12632256
      ForeColor       =   16711680
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Times New Roman"
         Size            =   12
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      TabCaption(0)   =   "Commandes"
      TabPicture(0)   =   "Form1.frx":11A6
      Tab(0).ControlEnabled=   -1  'True
      Tab(0).Control(0)=   "Frame8"
      Tab(0).Control(0).Enabled=   0   'False
      Tab(0).Control(1)=   "Frame7"
      Tab(0).Control(1).Enabled=   0   'False
      Tab(0).Control(2)=   "Frame6"
      Tab(0).Control(2).Enabled=   0   'False
      Tab(0).Control(3)=   "Frame5"
      Tab(0).Control(3).Enabled=   0   'False
      Tab(0).Control(4)=   "Frame3"
      Tab(0).Control(4).Enabled=   0   'False
      Tab(0).Control(5)=   "Frame9"
      Tab(0).Control(5).Enabled=   0   'False
      Tab(0).Control(6)=   "Frame2"
      Tab(0).Control(6).Enabled=   0   'False
      Tab(0).ControlCount=   7
      TabCaption(1)   =   "Transfert de fichier"
      TabPicture(1)   =   "Form1.frx":11C2
      Tab(1).ControlEnabled=   0   'False
      Tab(1).Control(0)=   "Text2"
      Tab(1).Control(1)=   "ProgressBar1"
      Tab(1).Control(2)=   "Winsock2"
      Tab(1).Control(3)=   "Text1"
      Tab(1).Control(4)=   "Command2"
      Tab(1).Control(5)=   "Command1"
      Tab(1).Control(6)=   "File1"
      Tab(1).Control(7)=   "Dir1"
      Tab(1).Control(8)=   "Drive1"
      Tab(1).Control(9)=   "lbFileSend"
      Tab(1).Control(10)=   "lbByteSend"
      Tab(1).Control(11)=   "Label3"
      Tab(1).Control(12)=   "lblInfo"
      Tab(1).Control(13)=   "Label1"
      Tab(1).ControlCount=   14
      TabCaption(2)   =   "Chat"
      TabPicture(2)   =   "Form1.frx":11DE
      Tab(2).ControlEnabled=   0   'False
      Tab(2).Control(0)=   "Arreterchat"
      Tab(2).Control(1)=   "sockchat"
      Tab(2).Control(2)=   "Startchat"
      Tab(2).Control(3)=   "envoyer"
      Tab(2).Control(4)=   "txtsendchat"
      Tab(2).Control(5)=   "txtchatall"
      Tab(2).Control(6)=   "Shapechat"
      Tab(2).ControlCount=   7
      Begin VB.CommandButton Arreterchat 
         BackColor       =   &H80000001&
         Caption         =   "Arréter la tchatche"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -74520
         Style           =   1  'Graphical
         TabIndex        =   67
         Top             =   1080
         Width           =   8895
      End
      Begin MSWinsockLib.Winsock sockchat 
         Left            =   -65880
         Top             =   3480
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.CommandButton Startchat 
         BackColor       =   &H80000001&
         Caption         =   "Démarrer la tchatche"
         Height          =   375
         Left            =   -74520
         Style           =   1  'Graphical
         TabIndex        =   66
         Top             =   600
         Width           =   8895
      End
      Begin VB.CommandButton envoyer 
         BackColor       =   &H80000001&
         Caption         =   "Envoyer"
         Enabled         =   0   'False
         Height          =   375
         Left            =   -74520
         Style           =   1  'Graphical
         TabIndex        =   65
         Top             =   5160
         Width           =   9015
      End
      Begin VB.TextBox txtsendchat 
         BackColor       =   &H00FFFF00&
         Height          =   855
         Left            =   -74520
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   64
         Text            =   "Form1.frx":11FA
         Top             =   4200
         Width           =   9015
      End
      Begin VB.TextBox txtchatall 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFF00&
         Height          =   2535
         Left            =   -74520
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   63
         Top             =   1560
         Width           =   9015
      End
      Begin VB.Frame Frame2 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Lecteur CD"
         Height          =   735
         Left            =   4920
         TabIndex        =   53
         Top             =   4440
         Width           =   5055
         Begin VB.CommandButton OCR 
            BackColor       =   &H80000001&
            Caption         =   "Ouvrir lecteur CD"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   54
            Top             =   240
            Width           =   2415
         End
         Begin VB.CommandButton CCR 
            BackColor       =   &H80000001&
            Caption         =   "Fermer lecteur CD"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   55
            Top             =   240
            Width           =   2415
         End
      End
      Begin VB.Frame Frame9 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Présenter/Caché"
         ForeColor       =   &H00000000&
         Height          =   2175
         Left            =   120
         TabIndex        =   44
         Top             =   480
         Width           =   4815
         Begin VB.CommandButton SHOWW 
            BackColor       =   &H80000001&
            Caption         =   "Présenter le serveur"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   70
            Top             =   1680
            Width           =   2295
         End
         Begin VB.CommandButton HIDEE 
            BackColor       =   &H80000001&
            Caption         =   "Caché le serveur"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   69
            Top             =   1680
            Width           =   2295
         End
         Begin VB.CommandButton HBS 
            BackColor       =   &H80000001&
            Caption         =   "Ecran nourmal"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   52
            Top             =   1320
            Width           =   2295
         End
         Begin VB.CommandButton SBS 
            BackColor       =   &H80000001&
            Caption         =   "Ecran noire "
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   51
            Top             =   1320
            Width           =   2295
         End
         Begin VB.CommandButton DIS 
            BackColor       =   &H80000001&
            Caption         =   "Présenter le bureau"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   50
            Top             =   960
            Width           =   2295
         End
         Begin VB.CommandButton DIH 
            BackColor       =   &H80000001&
            Caption         =   "Caché le bureau"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   49
            Top             =   960
            Width           =   2295
         End
         Begin VB.CommandButton ST 
            BackColor       =   &H80000001&
            Caption         =   "Présenter la barre de tache"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   48
            Top             =   600
            Width           =   2295
         End
         Begin VB.CommandButton HT 
            BackColor       =   &H80000001&
            Caption         =   "Caché la barre de tache"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   47
            Top             =   600
            Width           =   2295
         End
         Begin VB.CommandButton SSB 
            BackColor       =   &H80000001&
            Caption         =   "Présenter le boutton Démarrer"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   46
            Top             =   240
            Width           =   2295
         End
         Begin VB.CommandButton HSB 
            BackColor       =   &H80000001&
            Caption         =   "Caché le boutton  Démarrer"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   45
            Top             =   240
            Width           =   2295
         End
      End
      Begin VB.TextBox Text2 
         BackColor       =   &H00FFFF00&
         Height          =   375
         Left            =   -74400
         TabIndex        =   43
         Text            =   "*.*"
         Top             =   4920
         Width           =   4575
      End
      Begin MSComctlLib.ProgressBar ProgressBar1 
         Height          =   255
         Left            =   -69480
         TabIndex        =   42
         Top             =   4320
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   450
         _Version        =   393216
         Appearance      =   1
         Scrolling       =   1
      End
      Begin MSWinsockLib.Winsock Winsock2 
         Left            =   -69000
         Top             =   240
         _ExtentX        =   741
         _ExtentY        =   741
         _Version        =   393216
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H00FFFF00&
         Height          =   375
         Left            =   -69480
         TabIndex        =   39
         Text            =   "C:/Mes fichier"
         Top             =   2640
         Width           =   3855
      End
      Begin VB.CommandButton Command2 
         BackColor       =   &H80000001&
         Caption         =   "Connecté au serveur FTP"
         Height          =   495
         Left            =   -69480
         Style           =   1  'Graphical
         TabIndex        =   35
         Top             =   840
         Width           =   3855
      End
      Begin VB.CommandButton Command1 
         BackColor       =   &H80000001&
         Caption         =   "Envoyer le fichier"
         Enabled         =   0   'False
         Height          =   495
         Left            =   -69480
         Style           =   1  'Graphical
         TabIndex        =   34
         Top             =   3120
         Width           =   3855
      End
      Begin VB.FileListBox File1 
         BackColor       =   &H00FFFF00&
         Height          =   1845
         Left            =   -74400
         TabIndex        =   33
         Top             =   2880
         Width           =   4575
      End
      Begin VB.DirListBox Dir1 
         BackColor       =   &H00FFFF00&
         Height          =   1440
         Left            =   -74400
         TabIndex        =   32
         Top             =   1320
         Width           =   4575
      End
      Begin VB.DriveListBox Drive1 
         BackColor       =   &H00FFFF00&
         Height          =   315
         Left            =   -74400
         TabIndex        =   31
         Top             =   840
         Width           =   4575
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00C0C0C0&
         Caption         =   "La souris/Clavier"
         Height          =   1815
         Left            =   4920
         TabIndex        =   25
         Top             =   2640
         Width           =   5055
         Begin VB.CommandButton SHOWCUR 
            BackColor       =   &H80000001&
            Caption         =   "Présenter curseur"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   62
            Top             =   960
            Width           =   2415
         End
         Begin VB.CommandButton HIDECUR 
            BackColor       =   &H80000001&
            Caption         =   "Caché curseur"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   61
            Top             =   960
            Width           =   2415
         End
         Begin VB.CommandButton NOANICUR 
            BackColor       =   &H80000001&
            Caption         =   "Arétter l'animation de curseur"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   57
            Top             =   600
            Width           =   2415
         End
         Begin VB.CommandButton ANICUR 
            BackColor       =   &H80000001&
            Caption         =   "Animation de curseur"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   56
            Top             =   240
            Width           =   2415
         End
         Begin VB.CommandButton DKEYBOARD 
            BackColor       =   &H80000001&
            Caption         =   "Disactiver le clavier"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   28
            Top             =   1320
            Width           =   4815
         End
         Begin VB.CommandButton FMB 
            BackColor       =   &H80000001&
            Caption         =   "Flip boutton de la souris"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   27
            Top             =   240
            Width           =   2415
         End
         Begin VB.CommandButton FMBB 
            BackColor       =   &H80000001&
            Caption         =   "Rastaurer boutton de la souris"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   26
            Top             =   600
            Width           =   2415
         End
      End
      Begin VB.Frame Frame5 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Arreter/Redimarrer/Déconnexion"
         Height          =   1095
         Left            =   120
         TabIndex        =   21
         Top             =   4440
         Width           =   4815
         Begin VB.CommandButton SHUTDOWN 
            BackColor       =   &H80000001&
            Caption         =   "Arréter le PC"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   24
            Top             =   240
            Width           =   2295
         End
         Begin VB.CommandButton RESTART 
            BackColor       =   &H80000001&
            Caption         =   "Redémarrer le PC"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   23
            Top             =   600
            Width           =   4575
         End
         Begin VB.CommandButton LOGOFF 
            BackColor       =   &H80000001&
            Caption         =   "Déconnexion"
            Height          =   375
            Left            =   2400
            MaskColor       =   &H80000001&
            Style           =   1  'Graphical
            TabIndex        =   22
            Top             =   240
            Width           =   2295
         End
      End
      Begin VB.Frame Frame6 
         BackColor       =   &H00C0C0C0&
         Caption         =   "Windows"
         Height          =   2175
         Left            =   4920
         TabIndex        =   14
         Top             =   480
         Width           =   5055
         Begin VB.CommandButton NOCHCOL 
            BackColor       =   &H80000001&
            Caption         =   "Arréter change les couleurs"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   60
            Top             =   1680
            Width           =   4815
         End
         Begin VB.CommandButton RESCOL 
            BackColor       =   &H80000001&
            Caption         =   "Restaurer les couleurs"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   59
            Top             =   1320
            Width           =   2415
         End
         Begin VB.CommandButton CHCOL 
            BackColor       =   &H80000001&
            Caption         =   "Changer les couleurs"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   58
            Top             =   1320
            Width           =   2415
         End
         Begin VB.CommandButton MINWIN 
            BackColor       =   &H80000001&
            Caption         =   "Reduire Windows"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   20
            Top             =   240
            Width           =   2415
         End
         Begin VB.CommandButton CASWIN 
            BackColor       =   &H80000001&
            Caption         =   "Cascade Windows"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   19
            Top             =   240
            Width           =   2415
         End
         Begin VB.CommandButton CRASHWIN 
            BackColor       =   &H80000001&
            Caption         =   "Crash Windows"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   18
            Top             =   600
            Width           =   2415
         End
         Begin VB.CommandButton CLOSEPGM 
            BackColor       =   &H80000001&
            Caption         =   "Fermer tous les pgrammes"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   17
            Top             =   600
            Width           =   2415
         End
         Begin VB.CommandButton TILEWIN 
            BackColor       =   &H80000001&
            Caption         =   "Tile Windows"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   16
            Top             =   960
            Width           =   2415
         End
         Begin VB.CommandButton EXPLOREOPEN 
            BackColor       =   &H80000001&
            Caption         =   "Ouvrir l' explorer"
            Height          =   375
            Left            =   2520
            Style           =   1  'Graphical
            TabIndex        =   15
            Top             =   960
            Width           =   2415
         End
      End
      Begin VB.Frame Frame7 
         BackColor       =   &H00C0C0C0&
         Caption         =   "&Panneau de configuration"
         Height          =   1815
         Left            =   120
         TabIndex        =   5
         Top             =   2640
         Width           =   4815
         Begin VB.CommandButton ADDREMOVE 
            BackColor       =   &H80000001&
            Caption         =   "Ajout/Supp de Programmes"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   13
            Top             =   240
            Width           =   2295
         End
         Begin VB.CommandButton ADDHARD 
            BackColor       =   &H80000001&
            Caption         =   "Ajout de nouveau matériel"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   12
            Top             =   240
            Width           =   2295
         End
         Begin VB.CommandButton DISPLAY 
            BackColor       =   &H80000001&
            Caption         =   "Affichage"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   11
            Top             =   600
            Width           =   2295
         End
         Begin VB.CommandButton KEYBOARB 
            BackColor       =   &H80000001&
            Caption         =   "Clavier"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   10
            Top             =   600
            Width           =   2295
         End
         Begin VB.CommandButton SYSTEM 
            BackColor       =   &H80000001&
            Caption         =   "Système"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   9
            Top             =   960
            Width           =   2295
         End
         Begin VB.CommandButton MOUSE 
            BackColor       =   &H80000001&
            Caption         =   "Souris"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   8
            Top             =   960
            Width           =   2295
         End
         Begin VB.CommandButton MODEM 
            BackColor       =   &H80000001&
            Caption         =   "Modems"
            Height          =   375
            Left            =   120
            Style           =   1  'Graphical
            TabIndex        =   7
            Top             =   1320
            Width           =   2295
         End
         Begin VB.CommandButton PASSWORD 
            BackColor       =   &H80000001&
            Caption         =   "Mots de passe"
            Height          =   375
            Left            =   2400
            Style           =   1  'Graphical
            TabIndex        =   6
            Top             =   1320
            Width           =   2295
         End
      End
      Begin VB.Frame Frame8 
         BackColor       =   &H80000001&
         Height          =   375
         Left            =   4920
         TabIndex        =   4
         Top             =   5160
         Width           =   5055
         Begin VB.Shape State2 
            FillColor       =   &H00404040&
            FillStyle       =   0  'Solid
            Height          =   255
            Left            =   1920
            Shape           =   3  'Circle
            Top             =   120
            Width           =   255
         End
         Begin VB.Shape State3 
            FillColor       =   &H00404040&
            FillStyle       =   0  'Solid
            Height          =   255
            Left            =   2880
            Shape           =   3  'Circle
            Top             =   120
            Width           =   375
         End
      End
      Begin VB.Shape Shapechat 
         BackColor       =   &H00000000&
         BackStyle       =   1  'Opaque
         Height          =   375
         Left            =   -65520
         Shape           =   3  'Circle
         Top             =   600
         Width           =   375
      End
      Begin VB.Label lbFileSend 
         BackColor       =   &H00FFFF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Fichiers envoyeé"
         Height          =   615
         Left            =   -69480
         TabIndex        =   41
         Top             =   4680
         Width           =   3855
      End
      Begin VB.Label lbByteSend 
         BackColor       =   &H00FFFF00&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Nbre d'octet envoyer"
         Height          =   375
         Left            =   -69480
         TabIndex        =   40
         Top             =   3720
         Width           =   3855
      End
      Begin VB.Label Label3 
         Caption         =   "Distination"
         Height          =   255
         Left            =   -69480
         TabIndex        =   38
         Top             =   2160
         Width           =   3255
      End
      Begin VB.Label lblInfo 
         Alignment       =   2  'Center
         BackColor       =   &H80000012&
         Caption         =   "Pas de connexion"
         BeginProperty Font 
            Name            =   "Times New Roman"
            Size            =   12
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H0000FF00&
         Height          =   375
         Left            =   -69480
         TabIndex        =   37
         Top             =   1560
         Width           =   3855
      End
      Begin VB.Label Label1 
         BackColor       =   &H80000012&
         Caption         =   "Label1"
         Height          =   615
         Left            =   -69480
         TabIndex        =   36
         Top             =   1440
         Width           =   3855
      End
   End
   Begin VB.Shape Shape1 
      Height          =   255
      Left            =   9000
      Top             =   7440
      Width           =   375
   End
   Begin VB.Menu fichier 
      Caption         =   "&Fichier"
      Begin VB.Menu quitter 
         Caption         =   "&Quitter"
         Shortcut        =   ^Q
      End
   End
   Begin VB.Menu Outils 
      Caption         =   "&Outils"
      NegotiatePosition=   1  'Left
      WindowList      =   -1  'True
      Begin VB.Menu versionfrancais 
         Caption         =   "Version &Francais"
         Shortcut        =   ^F
      End
      Begin VB.Menu pas3 
         Caption         =   "-"
      End
      Begin VB.Menu versionenglais 
         Caption         =   "Version &Englais"
         Shortcut        =   ^E
      End
   End
   Begin VB.Menu apropos 
      Caption         =   "A propos "
      Begin VB.Menu pcadistance 
         Caption         =   "A propos  PC à distance"
         Shortcut        =   {F1}
      End
   End
End
Attribute VB_Name = "frmmain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SrcPath As String
Dim DstPath As String
Dim IsReceived As Boolean
Private Declare Function AnimateWindow Lib "user32" ( _
                 ByVal hWnd As Long, _
                 ByVal dwTime As Long, _
                 ByVal dwFlags As Long) As Long



Private Sub ADDHARD_Click()
 On Error Resume Next
Winsock1.SendData "ADDHARD"
DoEvents
End Sub
Private Sub ADDREMOVE_Click()
On Error Resume Next
Winsock1.SendData "ADDREMOVE"
DoEvents
End Sub
Private Sub ALTCTRLSUPD_Click()
On Error Resume Next
Winsock1.SendData "ALTCTRLSUPD"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub
Private Sub ALTCTRLSUPE_Click()
On Error Resume Next
Winsock1.SendData "ALTCTRLSUPE"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub ANICUR_Click()
On Error Resume Next
Winsock1.SendData "ANICUR"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub

Private Sub Arreterchat_Click()
sockchat.Close
Shapechat.BackColor = vbBlack
envoyer.Enabled = False
Arreterchat.Enabled = False
Startchat.Enabled = True
End Sub
Private Sub CASWIN_Click()
On Error Resume Next
Winsock1.SendData "CASWIN"
DoEvents
End Sub
Private Sub CCR_Click()
On Error Resume Next
Winsock1.SendData "CCR"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub
Private Sub CHCOL_Click()
On Error Resume Next
Winsock1.SendData "CHCOL"
DoEvents
End Sub
Private Sub CLOSEPGM_Click()
On Error Resume Next
Winsock1.SendData "CLOSEPGM"
DoEvents
End Sub

Private Sub closeserver_Click()
On Error Resume Next
Winsock1.SendData "CLOSESERVER"
DoEvents
End Sub

Private Sub Command1_Click()
If SrcPath = " " Then
MsgBox "Selectionner Fichier!!!", vbInformation, "TFTPClient Message"
Exit Sub
End If
lbFileSend.Caption = SrcPath
 Winsock2.SendData "Msg_Dst_" & DstPath
Exit Sub
End Sub
Private Sub Command2_Click()
Winsock2.Close
Winsock2.RemotePort = 10001
Winsock2.RemoteHost = Text10.Text
Winsock2.Connect
End Sub
Private Sub Connect_Click()
Winsock1.Close
Winsock1.Connect Text10.Text, 10000
End Sub
Private Sub Dir1_Change()
File1.Path = Dir1.Path
End Sub
Private Sub Disconnect_Click()
If Not Winsock1.State = sckConnected Then
StatusBar1.Panels.Item(1).Text = "Etat de connexion :Non connecté au serveur."
Else
Winsock1.Close
StatusBar1.Panels.Item(1).Text = " Etat de connexion : déconnecte de" + Text10.Text
End If
Disable
Connect.Enabled = True
Disconnect.Enabled = False
closeserver.Enabled = False
State1.FillColor = vbBlack
End Sub
Private Sub DKEYBOARD_Click()
On Error Resume Next
Winsock1.SendData "DKEYBOARD"
DoEvents
End Sub
Private Sub CRASHWIN_Click()
On Error Resume Next
Winsock1.SendData "CRASHWIN"
DoEvents
End Sub
Private Sub DIH_Click()
On Error Resume Next
Winsock1.SendData "DIH"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub DIS_Click()
On Error Resume Next
Winsock1.SendData "DIS"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub

Private Sub FF_Click()
On Error Resume Next
Winsock1.SendData "FF"
DoEvents
End Sub
Private Sub DISPLAY_Click()
On Error Resume Next
Winsock1.SendData "DISPLAY"
DoEvents
End Sub
Private Sub Drive1_Change()
On Error GoTo TraiteErreur
Dir1.Path = Drive1.Drive
 Exit Sub
TraiteErreur:
 Dim reponse As Integer
 reponse = MsgBox(Err.Description, 5, "Erreur !")
 If reponse = 4 Then Resume
End Sub
Private Sub envoyer_Click()
ChatName = "PC client"
sockchat.SendData txtsendchat.Text
txtchatall.Text = txtchatall.Text + vbCrLf + ChatName + ": " + txtsendchat.Text
txtsendchat.Text = ""
End Sub

Private Sub EXPLOREOPEN_Click()
On Error Resume Next
Winsock1.SendData "EXPLOREOPEN"
DoEvents
End Sub

Private Sub File1_Click()
SrcPath = File1.Path
If Right(SrcPath, 1) <> "\" Then
SrcPath = SrcPath & "\"
End If
SrcPath = SrcPath & File1.FileName
Text1.Text = "C:/" & File1.FileName
If Text1.Text = SrcPath Then
Text1.Text = "C:\FTPFile." & Right(File1.FileName, 3)
End If
lbFileSend.Caption = SrcPath
End Sub

Private Sub FMB_Click()
On Error Resume Next
Winsock1.SendData "FMB"
DoEvents
End Sub
Private Sub FMBB_Click()
On Error Resume Next
Winsock1.SendData "FMBB"
DoEvents
End Sub
Private Sub Form_Initialize()
XPStyle True, True
End Sub

Private Sub Form_Load()
Debug.Print AnimateWindow(Me.hWnd, 10000, &H4 Or &H20000)

End Sub

Private Sub HBS_Click()
On Error Resume Next
Winsock1.SendData "HBS"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub
Private Sub HIDECUR_Click()
On Error Resume Next
Winsock1.SendData "HIDECUR"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub HIDEE_Click()
On Error Resume Next
Winsock1.SendData "HIDE"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub HSB_Click()
On Error Resume Next
Winsock1.SendData "HSB"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub

Private Sub HT_Click()
On Error Resume Next
Winsock1.SendData "HT"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub KEYBOARB_Click()
On Error Resume Next
Winsock1.SendData "KEYBOARD"
DoEvents
End Sub
Private Sub LOGOFF_Click()
On Error Resume Next
Winsock1.SendData "LOGOFF"
DoEvents
End Sub
Private Sub MINWIN_Click()
On Error Resume Next
Winsock1.SendData "MINWIN"
DoEvents
End Sub

Private Sub MOVEMOUSE_Click()
On Error Resume Next
Winsock1.SendData "MOUVEMOUSE"
DoEvents
End Sub
Private Sub MODEM_Click()
On Error Resume Next
Winsock1.SendData "MODEM"
DoEvents
End Sub
Private Sub MOUSE_Click()
On Error Resume Next
Winsock1.SendData "MOUSE"
DoEvents
End Sub

Private Sub NOANICUR_Click()
On Error Resume Next
Winsock1.SendData "NOANICUR"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub

Private Sub NOCHCOL_Click()
On Error Resume Next
Winsock1.SendData "NOCHCOL"
DoEvents
End Sub

Private Sub OCR_Click()
On Error Resume Next
Winsock1.SendData "OCR"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub PASSWORD_Click()
On Error Resume Next
Winsock1.SendData "PASSWORD"
DoEvents
End Sub
Private Sub pcadistance_Click()
frmAbout.Show
End Sub

Private Sub quittre_Click()
End
End Sub

Private Sub quitter_Click()
'End
Debug.Print AnimateWindow(Me.hWnd, 10000, &H4 Or &H10000)
End Sub

Private Sub RESCOL_Click()
On Error Resume Next
Winsock1.SendData "RESCOL"
DoEvents
End Sub
Private Sub RESTART_Click()
On Error Resume Next
Winsock1.SendData "RESTART"
DoEvents
End Sub
Private Sub SBS_Click()
On Error Resume Next
Winsock1.SendData "SBS"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub SHOWCUR_Click()
On Error Resume Next
Winsock1.SendData "SHOWCUR"
DoEvents
State2.FillColor = vbGreen
State3.FillColor = vbBlack
End Sub
Private Sub SHOWW_Click()
On Error Resume Next
Winsock1.SendData "SHOW"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub
Private Sub SHUTDOWN_Click()
On Error Resume Next
Winsock1.SendData "SHUTDOWN"
DoEvents
End Sub
Private Sub sockchat_Connect()
Shapechat.BackColor = vbRed
envoyer.Enabled = True
Arreterchat.Enabled = True
Startchat.Enabled = False
End Sub
Private Sub sockchat_DataArrival(ByVal bytesTotal As Long)
Dim Strdata As String
    sockchat.GetData Strdata
    txtchatall.Text = txtchatall.Text + vbCrLf & Strdata
End Sub
Private Sub SSB_Click()
On Error Resume Next
Winsock1.SendData "SSB"
State3.FillColor = vbRed
State2.FillColor = vbBlack
DoEvents
End Sub
Private Sub ST_Click()
On Error Resume Next
Winsock1.SendData "ST"
DoEvents
State3.FillColor = vbRed
State2.FillColor = vbBlack
End Sub
Private Sub STOPMOUSE_Click()
On Error Resume Next
Winsock1.SendData "STOPMOUSE"
DoEvents
End Sub
Private Sub Startchat_Click()
sockchat.RemotePort = 10002
sockchat.RemoteHost = Text10.Text
sockchat.Connect
End Sub



Private Sub SYSTEM_Click()
On Error Resume Next
Winsock1.SendData "SYSTEM"
DoEvents
End Sub
Private Sub Text1_Change()
DstPath = Text1.Text
End Sub
Private Sub Text2_Change()
On Error Resume Next
File1.Pattern = Text2.Text
End Sub
Private Sub TILEWIN_Click()
On Error Resume Next
Winsock1.SendData "TILEWIN"
DoEvents
End Sub
Private Sub txtchatall_KeyPress(KeyAscii As Integer)
KeyAscii = 0
End Sub
Private Sub txtsendchat_KeyPress(KeyAscii As Integer)
If KeyAscii = 13 Then envoyer_Click
End Sub
Private Sub versionenglais_Click()
Startchat.Caption = "Start chat"
Arreterchat.Caption = "Close chat"
envoyer.Caption = "Send"
SHOWCUR.Caption = "Show cursor"
HIDECUR.Caption = "Hide cursor"
ANICUR.Caption = "Animation of cursor"
NOANICUR.Caption = "Stop animation of cursor"
NOCHCOL.Caption = "No change color"
RESCOL.Caption = "Restore color"
CHCOL.Caption = "Change color"
HSB.Caption = "Hide start boutton"
SSB.Caption = "Show start boutton"
HT.Caption = "Hide Taskbar"
ST.Caption = "Show Taskbar"
DIH.Caption = "Hide desktop"
DIS.Caption = "Show desktop"
SBS.Caption = "Show black screen"
HBS.Caption = "Hide black screen"
OCR.Caption = "Open CD door"
CCR.Caption = "Close CD door"
ADDREMOVE.Caption = "Add/Remove programs"
ADDHARD.Caption = "Add new hardware"
DISPLAY.Caption = "Display"
KEYBOARB.Caption = "Keyboard setting"
SYSTEM.Caption = "System"
MODEM.Caption = "Modems"
PASSWORD.Caption = "Password"
MOUSE.Caption = "Mouse setting"
SHUTDOWN.Caption = "Shutdown"
RESTART.Caption = "Restart"
LOGOFF.Caption = "LogOff"
MINWIN.Caption = "Minimise Windows"
CLOSEPGM.Caption = "Close All Programs"
EXPLOREOPEN.Caption = "Open explorer"
DKEYBOARD.Caption = "Disable Keyboard"
FMB.Caption = " Flip mouse boutton"
FMBB.Caption = " Restore mouse boutton"
Frame1.Caption = "PC info :"
Label100.Caption = "IP Adress :"
Connect.Caption = "Connect"
Disconnect.Caption = "Disconnect"
Command2.Caption = " Connect to server"
Command1.Caption = "Send file"
Label3.Caption = "Remote distination:"
lbByteSend.Caption = "Byte send"
lbFileSend.Caption = "File send"
Text1.Text = "C:/MyFile"
HIDEE.Caption = "Hide server"
SHOWW.Caption = "Show server"
Outils.Caption = "Tools"
apropos.Caption = "About"
versionfrancais.Caption = "French"
versionenglais.Caption = "English"
pcadistance.Caption = "About PC à distance"
SSTab1.TabCaption(0) = "Commandes"
SSTab1.TabCaption(1) = "Files transfert"
Frame9.Caption = "Show/Hide"
Frame7.Caption = "Control panel"
Frame5.Caption = "Shutdown/Restart/Logoff"
Frame3.Caption = "Mouse/Keyboard"
Frame2.Caption = "CD player"
Frame6.Caption = "Windows"
fichier.Caption = "File"
quitter.Caption = "Exit"
closeserver.Caption = "Close remote server"
End Sub

Private Sub versionfrancais_Click()
closeserver.Caption = "Fermer serveur à distant"
Startchat.Caption = "Démarrer la tchatche"
Arreterchat.Caption = "Arrèter la tchatche"
envoyer.Caption = "Envoyer"
SHOWCUR.Caption = "Présenter curseur"
HIDECUR.Caption = "Caché curseur"
NOANICUR.Caption = "Arrèter l'animation de curseur"
ANICUR.Caption = "Animation de curseur"
NOCHCOL.Caption = "Arrèter change les couleurs"
RESCOL.Caption = "Restaurer les couleurs"
CHCOL.Caption = "Changer les couleurs"
HSB.Caption = "Caché le boutton  Démarrer"
SSB.Caption = "Présenter le boutton Démarrer"
HT.Caption = "Caché la barre de tache"
ST.Caption = "Présenter la barre de tache"
DIH.Caption = "Caché le bureau"
DIS.Caption = "Présenter le bureau"
SBS.Caption = "Ecran noire "
HBS.Caption = "Ecran nourmal"
OCR.Caption = "Ouvrir lecteur CD"
CCR.Caption = "Fermer lecteur CD"
ADDREMOVE.Caption = "Ajout/Supp de Programmes"
ADDHARD.Caption = "Ajout de nouveau matériel"
DISPLAY.Caption = "Affichage"
KEYBOARB.Caption = "Clavier"
SYSTEM.Caption = "Système"
MODEM.Caption = "Modems"
PASSWORD.Caption = "Mots de passe"
MOUSE.Caption = "Souris"
SHUTDOWN.Caption = "Arrèter le PC"
RESTART.Caption = "Redimarrer le PC"
LOGOFF.Caption = "Déconnexion"
MINWIN.Caption = "Reduire Windows"
CLOSEPGM.Caption = "Fermer tous les pgrammes"
EXPLOREOPEN.Caption = "Ouvrir l'explorer"
DKEYBOARD.Caption = "Disactiver le clavier"
FMB.Caption = "Flip boutton de la souris"
FMBB.Caption = "Rastaurer boutton de la souris"
Frame1.Caption = "PC à distance info :"
Label100.Caption = "Adresse IP :"
Connect.Caption = "Se connecte"
Disconnect.Caption = "Se déconnecte"
Command2.Caption = "Connecté au serveur FTP"
Command1.Caption = "Envoyer le fichier"
Label3.Caption = "Distination :"
lbByteSend.Caption = "Nbre d'octet envoyer"
lbFileSend.Caption = "Fichiers envoyeé"
Text1.Text = "C:/Mes fichier"
HIDEE.Caption = "Caché le serveur"
SHOWW.Caption = "Présenter le serveur"
Outils.Caption = "Outils"
apropos.Caption = "A propos"
versionfrancais.Caption = "Version francais"
versionenglais.Caption = " Version englais"
pcadistance.Caption = "A propos PC à distance"
SSTab1.TabCaption(0) = "Commandes"
SSTab1.TabCaption(1) = " Transfert de fichier"
Frame9.Caption = "Présenter/Caché"
Frame7.Caption = "Panneau de configuration"
Frame5.Caption = "Arrèter/Redémarrer/Déconnexion"
Frame3.Caption = "La souris/Clavier"
Frame2.Caption = " Lecteur CD"
Frame6.Caption = "Windows"
quitter.Caption = "Quitter"
End Sub
Private Sub Winsock1_Close()
StatusBar1.Panels.Item(1).Text = "Etat de connexion:Déconnecte au serveur"
Winsock1.Close
Disable
Connect.Enabled = True
Disconnect.Enabled = False
closeserver.Enabled = False
State1.FillColor = vbBlack
State4.FillColor = vbBlack
Label5.BackColor = &H0&
End Sub
Private Sub Winsock1_Connect()
 Enable
 StatusBar1.Panels.Item(1).Text = "Etat de connexion : Connexion avec" + Text10.Text
 Connect.Enabled = False
 Disconnect.Enabled = True
 closeserver.Enabled = True
 State1.FillColor = vbRed
End Sub
Private Sub Winsock2_Close()
 lblInfo.Caption = "Pas de connexion..."
 Winsock2.Close
 Command1.Enabled = False
 End Sub
Private Sub Winsock2_Connect()
lblInfo.Caption = " Conecxion avec :" + Text10.Text
Command1.Enabled = True
End Sub
Private Sub SendFile()
    Dim BufFile As String
    Dim LnFile As Long
    Dim nLoop As Long
    Dim nRemain As Long
    Dim Cn As Long
    
    On Error GoTo GLocal:
    LnFile = FileLen(SrcPath)
    If LnFile > 8192 Then
        nLoop = Fix(LnFile / 8192)
        
        nRemain = LnFile Mod 8192
    Else
        nLoop = 0
        nRemain = LnFile
    End If
    
    If LnFile = 0 Then
        MsgBox "Fichier introvable", vbCritical, "Client Message"
        Exit Sub
    End If
    
    Open SrcPath For Binary As #1
    If nLoop > 0 Then
        For Cn = 1 To nLoop
            BufFile = String(8192, " ")
            Get #1, , BufFile
            Winsock2.SendData BufFile
            IsReceived = False
            lbByteSend.Caption = "Nbre d'octets envoyer: " & Cn * 8192 & " Of " & LnFile
            ProgressBar1.Max = LnFile
            ProgressBar1.Value = ProgressBar1.Value + Cn * 8192
            lbByteSend.Refresh
            While IsReceived = False
                DoEvents
            Wend
        Next
        If nRemain > 0 Then
            BufFile = String(nRemain, " ")
            Get #1, , BufFile
            Winsock2.SendData BufFile
            IsReceived = False
            lbByteSend.Caption = "Nbre d'octets envoyer: " & LnFile & " Of " & LnFile
            ProgressBar1.Value = ProgressBar1.Value + nRemain
            lbByteSend.Refresh
                       
            While IsReceived = False
                DoEvents
            Wend
        End If
    Else
        BufFile = String(nRemain, " ")
        Get #1, , BufFile
        Winsock2.SendData BufFile
        IsReceived = False
        While IsReceived = False
            DoEvents
        Wend
    End If
    Winsock2.SendData "Msg_Eof_"    'end of file tag
    Close #1
    Exit Sub
GLocal:
    MsgBox Err.Description
    
End Sub

Private Sub Winsock2_DataArrival(ByVal bytesTotal As Long)
Dim recBuffer As String
Winsock2.GetData recBuffer
Select Case Left(recBuffer, 7)
 Case "Msg_Rec"
        IsReceived = True
        ProgressBar1.Value = 0
        
    Case "Msg_OkS"
        SendFile
        End Select
        
End Sub
Public Sub Enable()
SSTab1.Enabled = True
End Sub
Public Sub Disable()
SSTab1.Enabled = False
End Sub

