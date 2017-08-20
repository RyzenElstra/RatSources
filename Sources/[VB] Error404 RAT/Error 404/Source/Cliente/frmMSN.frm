VERSION 5.00
Begin VB.Form frmMSN 
   BackColor       =   &H00FFFFFF&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404 -MSN Manager"
   ClientHeight    =   7890
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   8310
   Icon            =   "frmMSN.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7890
   ScaleWidth      =   8310
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame1 
      BackColor       =   &H00FFFFFF&
      Height          =   6495
      Left            =   4320
      TabIndex        =   6
      Top             =   720
      Width           =   3735
      Begin VB.CheckBox chkAlphabetic 
         BackColor       =   &H00FFFFFF&
         Caption         =   "Ordenar contactos alfabeticamente"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   720
         Width           =   2775
      End
      Begin VB.ComboBox cboContacts 
         Height          =   315
         ItemData        =   "frmMSN.frx":48FA
         Left            =   120
         List            =   "frmMSN.frx":4904
         Style           =   2  'Dropdown List
         TabIndex        =   8
         Top             =   360
         Width           =   3495
      End
      Begin VB.Label lblMSN 
         Alignment       =   2  'Center
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Contactos"
         Height          =   195
         Index           =   2
         Left            =   1500
         TabIndex        =   7
         Top             =   120
         Width           =   720
      End
   End
   Begin VB.PictureBox picStatus 
      Height          =   375
      Left            =   2520
      ScaleHeight     =   315
      ScaleWidth      =   315
      TabIndex        =   5
      Top             =   720
      Width           =   375
   End
   Begin VB.ComboBox cboStatus 
      Height          =   315
      ItemData        =   "frmMSN.frx":494E
      Left            =   960
      List            =   "frmMSN.frx":496A
      Style           =   2  'Dropdown List
      TabIndex        =   4
      Top             =   720
      Width           =   1455
   End
   Begin VB.Frame fraMSN 
      BackColor       =   &H00FFFFFF&
      Height          =   615
      Left            =   120
      TabIndex        =   0
      Top             =   0
      Width           =   8055
      Begin VB.Label lblCE 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Height          =   195
         Left            =   1560
         TabIndex        =   2
         Top             =   240
         Width           =   45
      End
      Begin VB.Label lblMSN 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Correo Electronico:"
         Height          =   195
         Index           =   0
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   1350
      End
   End
   Begin VB.Label lblMSN 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Estado:"
      Height          =   195
      Index           =   1
      Left            =   240
      TabIndex        =   3
      Top             =   750
      Width           =   540
   End
   Begin VB.Menu mnu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu mnuOpenConversation 
         Caption         =   "Abrir Conversacion"
      End
      Begin VB.Menu mnuCloseConversation 
         Caption         =   "Cerrar Conversacion"
      End
      Begin VB.Menu mnuSendMail 
         Caption         =   "Enviar Correo Electronico"
      End
      Begin VB.Menu mnuSendRemoteMSG 
         Caption         =   "Enviar Mensaje Remoto"
      End
      Begin VB.Menu mnuSendNudge 
         Caption         =   "Enviar Zumbido"
      End
      Begin VB.Menu mnuNoAdmit 
         Caption         =   "No Admitir"
      End
      Begin VB.Menu mnuDeleteContact 
         Caption         =   "Eliminar Contacto"
      End
   End
End
Attribute VB_Name = "frmMSN"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


Private Sub Form_Load()
On Error Resume Next
Me.Caption = "Error 404 - MSN Manager [" & Form1.LV.SelectedItem & "]"
Send "LoadMSN"
'------>
        cboContacts.Text = cboContacts.List(0)
'<------
End Sub

Private Sub LV_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
    If Not LV.ListItems.Count = 0 Then
        If Button = 2 Then PopupMenu mnu
    End If
End Sub
