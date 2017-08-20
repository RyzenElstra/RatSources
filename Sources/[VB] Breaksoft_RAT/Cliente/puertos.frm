VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "mswinsck.ocx"
Begin VB.Form puertos 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Puertos"
   ClientHeight    =   4695
   ClientLeft      =   45
   ClientTop       =   345
   ClientWidth     =   9585
   Icon            =   "puertos.frx":0000
   LinkTopic       =   "Form4"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4695
   ScaleWidth      =   9585
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame2 
      Height          =   735
      Left            =   6120
      TabIndex        =   22
      Top             =   3840
      Width           =   3375
      Begin VB.TextBox Text4 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   9.75
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   120
         TabIndex        =   23
         Top             =   240
         Width           =   3135
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   6480
      Top             =   5400
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "puertos.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "puertos.frx":05E8
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "puertos.frx":0646
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "puertos.frx":06A4
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Frame FraOpcionesEnumeracion 
      Caption         =   "Options List"
      ForeColor       =   &H00000000&
      Height          =   1095
      Left            =   6120
      TabIndex        =   9
      Top             =   1320
      Width           =   3375
      Begin VB.CheckBox GrabaBannerActivo 
         Caption         =   "Método de Grabación"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   360
         Width           =   3135
      End
      Begin VB.CheckBox GrabaBannerPasivo 
         Caption         =   "Método de grabación pasivo"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   720
         Value           =   1  'Checked
         Width           =   3135
      End
   End
   Begin VB.Frame FraOpcionesEscaneoPuerto 
      Caption         =   "Sock Options"
      ForeColor       =   &H00000000&
      Height          =   1335
      Left            =   6120
      TabIndex        =   5
      Top             =   2520
      Width           =   3375
      Begin VB.TextBox Text3 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Left            =   120
         TabIndex        =   21
         Text            =   "Max Socks"
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton parar 
         Caption         =   "Parar"
         Enabled         =   0   'False
         Height          =   375
         Left            =   2280
         TabIndex        =   20
         Top             =   840
         Width           =   975
      End
      Begin VB.CommandButton Escanear 
         Caption         =   "Scan"
         Height          =   375
         Left            =   2280
         TabIndex        =   19
         Top             =   240
         Width           =   975
      End
      Begin VB.TextBox Text2 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Left            =   120
         TabIndex        =   15
         Text            =   "Puerto Final :"
         Top             =   960
         Width           =   975
      End
      Begin VB.TextBox Text1 
         BackColor       =   &H8000000F&
         BorderStyle     =   0  'None
         Height          =   285
         Left            =   120
         TabIndex        =   14
         Text            =   "Puerto Inicial :"
         Top             =   600
         Width           =   1335
      End
      Begin VB.TextBox PuertoFinal 
         BackColor       =   &H8000000B&
         ForeColor       =   &H00000000&
         Height          =   285
         Left            =   1560
         TabIndex        =   8
         Text            =   "1023"
         Top             =   960
         Width           =   615
      End
      Begin VB.TextBox PuertoInicial 
         BackColor       =   &H8000000B&
         ForeColor       =   &H00000000&
         Height          =   285
         Left            =   1560
         MaxLength       =   5
         TabIndex        =   7
         Text            =   "1"
         Top             =   600
         Width           =   615
      End
      Begin VB.TextBox txtMaxSockets 
         BackColor       =   &H00FFFFFF&
         ForeColor       =   &H00000000&
         Height          =   285
         Left            =   1560
         MaxLength       =   4
         TabIndex        =   6
         Text            =   "200"
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.Frame FraOpcionesMapeo 
      Caption         =   "Opciones de Mapeo"
      ForeColor       =   &H00000000&
      Height          =   1095
      Left            =   6120
      TabIndex        =   2
      Top             =   120
      Width           =   3375
      Begin VB.CheckBox EscaneaSiFallaPing 
         Caption         =   "Por si el  el Ping &Falla"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   720
         Width           =   2655
      End
      Begin VB.CheckBox MapeoICMP 
         Caption         =   "&Hacer Mapping "
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   120
         TabIndex        =   3
         Top             =   360
         Width           =   2895
      End
   End
   Begin VB.Frame FraResultado 
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   4455
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5895
      Begin VB.Frame Frame1 
         Caption         =   "Estado"
         Height          =   615
         Left            =   120
         TabIndex        =   16
         Top             =   3720
         Width           =   5655
         Begin MSComctlLib.ProgressBar pbrScanStatus 
            Height          =   255
            Left            =   120
            TabIndex        =   18
            Top             =   240
            Width           =   5295
            _ExtentX        =   9340
            _ExtentY        =   450
            _Version        =   393216
            Appearance      =   1
         End
         Begin VB.Label lblScanStatus 
            Caption         =   "Esperando por Entrada"
            BeginProperty Font 
               Name            =   "MS Sans Serif"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            ForeColor       =   &H00000000&
            Height          =   255
            Left            =   120
            TabIndex        =   17
            Top             =   240
            Width           =   2295
         End
      End
      Begin VB.Frame FraDestino 
         Caption         =   "Puerto de Scaneo"
         ForeColor       =   &H00000000&
         Height          =   615
         Left            =   120
         TabIndex        =   12
         Top             =   3000
         Width           =   5655
         Begin VB.TextBox TxtDestino 
            BackColor       =   &H8000000F&
            ForeColor       =   &H00000000&
            Height          =   285
            Left            =   120
            TabIndex        =   13
            Top             =   240
            Width           =   5415
         End
      End
      Begin MSComctlLib.ListView lsvResultado 
         Height          =   2775
         Left            =   120
         TabIndex        =   1
         Top             =   240
         Width           =   5655
         _ExtentX        =   9975
         _ExtentY        =   4895
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         AllowReorder    =   -1  'True
         FullRowSelect   =   -1  'True
         _Version        =   393217
         ForeColor       =   -2147483640
         BackColor       =   -2147483633
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   4
         BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            Text            =   "Tiempo"
            Object.Width           =   2294
         EndProperty
         BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   1
            Text            =   "Puerto"
            Object.Width           =   2647
         EndProperty
         BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   2
            Text            =   "Estado"
            Object.Width           =   2559
         EndProperty
         BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
            SubItemIndex    =   3
            Text            =   "Banner"
            Object.Width           =   2294
         EndProperty
      End
   End
   Begin MSWinsockLib.Winsock wskTCPWinsock 
      Index           =   0
      Left            =   6720
      Top             =   5160
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "puertos"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub Escanear_Click()
 Dim Socket As Variant
    Dim CurrentPort As Integer
    Dim i As Integer
    Dim MaxSockets As Integer

   
    On Error Resume Next
Text4.Text = "Escaneando puertos..."

    Escanear.Enabled = False
    parar.Enabled = True

    If parar.Enabled = True Then
    
     
        lsvResultado.ListItems.Clear
    
   
        pbrScanStatus.value = 0
        
        TxtDestino.Enabled = False
        txtMaxSockets.Enabled = False
        PuertoInicial.Enabled = False
        PuertoFinal.Enabled = False
        
        MaxSockets = txtMaxSockets.Text
        
        
        For i = 1 To MaxSockets
            Load wskTCPWinsock(i)
        Next i
        
        CurrentPort = PuertoInicial.Text
        
        While parar.Enabled = True
            For Each Socket In wskTCPWinsock
                DoEvents
                If Socket.State <> sckClosed Then
                    GoTo continue
                End If
                Socket.Close
               
                If CurrentPort = Val(PuertoFinal.Text) + 1 Then
                    lblScanStatus.Caption = "Escaneo Finalizado"
 
                    TxtDestino.Enabled = True
                    txtMaxSockets.Enabled = True
                    PuertoInicial.Enabled = True
                    PuertoFinal.Enabled = True
                    Escanear.Enabled = True
                    parar.Enabled = False
                    Exit For
                End If
           
                Socket.RemoteHost = TxtDestino.Text
             
                Socket.RemotePort = CurrentPort
                
                lblScanStatus.Caption = "Escaneando Puerto " & CurrentPort
                pbrScanStatus.value = pbrScanStatus.value + _
                    ((PuertoFinal.Text - PuertoInicial.Text) / 100)
                
            
                Socket.Connect
 
                CurrentPort = CurrentPort + 1
  
continue:
            
          
            Next Socket
        Wend
    Else
        lblScanStatus.Caption = "Escaneo Parado"
        

        TxtDestino.Enabled = True
        txtMaxSockets.Enabled = True
        PuertoInicial.Enabled = True
        PuertoFinal.Enabled = True
    End If

   
    For i = 1 To MaxSockets
        Unload wskTCPWinsock(i)
    Next i
    pbrScanStatus.value = 100
Text4.Text = "Terminado..."
End Sub

Private Sub Form_Load()
On Error Resume Next
TxtDestino.Text = Form1.LV.SelectedItem.SubItems(1)
Me.Caption = "Escaneando Puertos a " & Form1.LV.SelectedItem
End Sub

Private Sub Form_Unload(Cancel As Integer)
Form1.Show
Unload Me
End Sub

Private Sub GrabaBannerActivo_Click()
    If GrabaBannerPasivo.value = 1 Then
        GrabaBannerPasivo.value = 0
    End If
End Sub

Private Sub GrabaBannerPasivo_Click()
    If GrabaBannerActivo.value = 1 Then
        GrabaBannerActivo.value = 0
    End If
End Sub




Private Function AddPortToList(Port As Integer, Optional Banner As String)


Dim List As ListItem

Set List = lsvResultado.ListItems.Add(, , Time)
    List.SubItems(1) = Port
    List.SubItems(2) = "Abierto"
    List.SubItems(3) = Banner

 

End Function






Private Sub parar_Click()
Escanear.Enabled = True
parar.Enabled = False
TxtDestino.Enabled = True
End Sub

Private Sub wskTCPWinsock_Connect(Index As Integer)
   
    AddPortToList wskTCPWinsock(Index).RemotePort
    

    If GrabaBannerPasivo.value = 0 Then
        wskTCPWinsock(Index).Close
    ElseIf GrabaBannerActivo.value = 0 Then
        wskTCPWinsock(Index).Close
    End If
End Sub

Private Sub wskTCPWinsock_DataArrival(Index As Integer, ByVal bytesTotal As Long)
    Dim DataStr As String
    Dim i As Integer
    
    If GrabaBannerPasivo.value = 1 Then
       
        Call wskTCPWinsock(Index).GetData(DataStr$, vbString)
            
      
        For i = 1 To lsvResultado.ListItems.Count
            If lsvResultado.ListItems.Item(i).SubItems(1) = _
                wskTCPWinsock(Index).RemotePort Then
                                               
                lsvResultado.ListItems.Remove (lsvResultado.ListItems(i).Index)
                
            End If
        Next i
        
        AddPortToList wskTCPWinsock(Index).RemotePort, DataStr
    ElseIf GrabaBannerActivo.value = 1 Then
        wskTCPWinsock(Index).SendData (vbCrLf & vbCrLf)
        
      
        Call wskTCPWinsock(Index).GetData(DataStr$, vbString)
            
  
        For i = 1 To lsvResultado.ListItems.Count
            If lsvResultado.ListItems.Item(i).SubItems(1) = _
                wskTCPWinsock(Index).RemotePort Then
                                               
                lsvResultado.ListItems.Remove (lsvResultado.ListItems(i).Index)
                
            End If
        Next i
        
        AddPortToList wskTCPWinsock(Index).RemotePort, DataStr
    Else
        
        wskTCPWinsock(Index).Close
    End If
End Sub

Private Sub wskTCPWinsock_Error(Index As Integer, ByVal Number As Integer, _
    Description As String, ByVal Scode As Long, ByVal Source As String, _
    ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    
    wskTCPWinsock(Index).Close
End Sub





