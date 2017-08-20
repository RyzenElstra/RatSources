VERSION 5.00
Object = "{6B7E6392-850A-101B-AFC0-4210102A8DA7}#1.3#0"; "COMCTL32.OCX"
Begin VB.Form frmInitialize 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Error 404"
   ClientHeight    =   2535
   ClientLeft      =   6405
   ClientTop       =   4140
   ClientWidth     =   5505
   Icon            =   "frmInitialize.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2535
   ScaleWidth      =   5505
   Begin ComctlLib.ProgressBar pbInitialize 
      Height          =   255
      Left            =   0
      TabIndex        =   3
      Top             =   2040
      Width           =   5535
      _ExtentX        =   9763
      _ExtentY        =   450
      _Version        =   327682
      Appearance      =   1
   End
   Begin VB.Timer tmtGeneral 
      Interval        =   600
      Left            =   4800
      Top             =   600
   End
   Begin VB.Timer tmrInitialize 
      Enabled         =   0   'False
      Interval        =   4000
      Left            =   4800
      Top             =   120
   End
   Begin VB.TextBox txtLog 
      Height          =   2055
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Top             =   0
      Width           =   5535
   End
   Begin VB.Label lblState 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   4680
      TabIndex        =   2
      Top             =   2280
      Width           =   855
   End
   Begin VB.Label lblInitialize 
      Alignment       =   2  'Center
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   2280
      Width           =   4695
   End
End
Attribute VB_Name = "frmInitialize"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim IDF As String
Dim fso As Object
Dim obj_FSO As Object
Dim File As Object
Private Declare Sub InitCommonControls Lib "comctl32" ()
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Sub Form_Initialize()
    If App.PrevInstance = True Then
        MsgBox "Error 404 ya esta abierto", vbExclamation, "Error 404"
    End
    End If
InitCommonControls
End Sub

Private Sub Form_Load()
IDF = ""
    If txtLog.Text = "" Then
        txtLog.Text = "Cargando Error 404..."
        lblInitialize.Caption = "Cargando Error 404"
        lblState.Caption = "CE404"
        pbInitialize.Value = 40
    End If
IDF = "CAM"
End Sub

Private Sub tmrInitialize_Timer()
frmInitialize.Show
tmrInitialize.Enabled = False
End Sub

Private Sub tmtGeneral_Timer()
Select Case IDF

Case "CAM"
'<//Archivo Manifest//>
  Set fso = CreateObject("Scripting.FileSystemObject")
    txtLog.Text = txtLog.Text & vbCrLf & "Comprobando archivo manifest..."
    lblInitialize.Caption = "Comprobando archivo manifest"
    lblState.Caption = "CAM"
    pbInitialize.Value = 100
        If fso.FileExists(App.Path & "\" & App.EXEName & ".exe.manifest") = False Then
            IDF = "CAM0"
            Exit Sub
        Else
            IDF = "Load"
            Exit Sub
        End If
  Set fso = Nothing
        IDF = ""
Case "CAM0"
    txtLog.Text = txtLog.Text & vbCrLf & "Creando " & App.EXEName & ".exe.manifest"
    lblInitialize.Caption = "Creando archivo manifest"
    lblState.Caption = "CAM0"
  Set obj_FSO = CreateObject("Scripting.FileSystemObject")
  Set File = obj_FSO.CreateTextFile(App.Path & "\" & App.EXEName & ".exe.manifest", True)
    File.Write "<?xml version=""1.0"" encoding=""UTF-8"" standalone=""yes""?>" & vbCrLf & "<assembly xmlns=""urn:schemas-microsoft-com:asm.v1""" & vbCrLf & "manifestVersion=""1.0"">" & vbCrLf & "<assemblyIdentity" & vbCrLf & "    name=""Woozle.PEResourceExplorer.XPManifest""" & vbCrLf & "    processorArchitecture=""x86""" & vbCrLf & "    version=""1.0.0.0""" & vbCrLf & "     type=""win32""/>" & vbCrLf & "<description>Windows Shell</description>" & vbCrLf & "<dependency>" & vbCrLf & "    <dependentAssembly>" & vbCrLf & "        <assemblyIdentity" & vbCrLf & "             type=""win32""" & vbCrLf & "             name=""Microsoft.Windows.Common-Controls""" & vbCrLf & "             version=""6.0.0.0""" & vbCrLf & "             processorArchitecture=""x86""" & vbCrLf & "             publicKeyToken=""6595b64144ccf1df""" & vbCrLf & "             language=""*""" & vbCrLf & "        />" & vbCrLf & "    </dependentAssembly>" & vbCrLf & "</dependency>" & vbCrLf & "</assembly>"
    File.Close
  Set obj_FSO = Nothing
  Set File = Nothing
    txtLog.Text = txtLog.Text & vbCrLf & "Reiniciando Error 404..."
    lblInitialize.Caption = "Reiniciando Error 404"
    lblState.Caption = "RE404"
        IDF = "Unload"
        Exit Sub
Case "Unload"
    Unload Me
    tmrInitialize.Enabled = True
Case "Load"
    txtLog.Text = txtLog.Text & vbCrLf & "Iniciando..."
    lblInitialize.Caption = "Iniciando"
    lblState.Caption = "Start"
    frmMain.Show
    Unload Me
End Select
End Sub
