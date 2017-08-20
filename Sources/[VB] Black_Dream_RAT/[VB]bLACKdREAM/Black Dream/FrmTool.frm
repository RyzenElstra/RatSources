VERSION 5.00
Begin VB.Form FrmTool 
   BorderStyle     =   3  'Fixed Dialog
   ClientHeight    =   1800
   ClientLeft      =   45
   ClientTop       =   45
   ClientWidth     =   960
   ClipControls    =   0   'False
   ControlBox      =   0   'False
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmTool.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1800
   ScaleWidth      =   960
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdExit 
      Caption         =   "E&xit program"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   3
      Top             =   1440
      Width           =   975
   End
   Begin VB.CommandButton CmdAboutBlackDream 
      Caption         =   "&About Black Dream"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   4
      Top             =   1080
      Width           =   975
   End
   Begin VB.Timer Timer 
      Interval        =   1
      Left            =   0
      Top             =   0
   End
   Begin VB.CommandButton CmdConnectionProperties 
      Caption         =   "Connection &properties"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   2
      Top             =   720
      Width           =   975
   End
   Begin VB.CommandButton CmdCloseConnection 
      Caption         =   "&Close connection"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   1
      Top             =   360
      Width           =   975
   End
   Begin VB.CommandButton CmdRestart 
      Caption         =   "&Restart server"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   6
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   975
   End
End
Attribute VB_Name = "FrmTool"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim SendData As String
Dim TempIP As String
Dim TempPort As Long

Private Sub CmdAboutBlackDream_Click()
    If FrmMain.WinSockCtl.State <> 7 Or FrmMain.Visible = False Then FrmAbout.Show: Exit Sub
    FrmMain.FrmOptions.Item(0).Visible = True
    For M = 1 To FrmMain.FrmOptions.UBound
        FrmMain.FrmOptions.Item(M).Visible = False
    Next M
End Sub

Private Sub CmdCloseConnection_Click()
    FrmMain.lblstate.Caption = "Disconnected"
    If FrmMain.WinSockCtl.State <> 7 Then
        FrmMain.FrmDialog.Item(0).Visible = True
        FrmMain.FrmDialog.Item(1).Visible = False
        UnloadFormsOpen
        MsgBox "You are not currently connected to any address.", vbInformation, "Connection"
        Exit Sub
    End If
    FrmMain.WinSockCtl.Close
    UnloadFormsOpen
    FrmMain.FrmDialog.Item(0).Visible = True
    FrmMain.FrmDialog.Item(1).Visible = False
    MsgBox "Success, Your connection to specified address has been closed.", vbInformation, "Success, connection closed"
End Sub

Private Sub CmdConnectionProperties_Click()
    On Error GoTo FinaliseError
    SendData = "TESTSERVER"
    FrmMain.WinSockCtl.SendData SendData
    
    FrmConnectionInfo.TagInfo.Item(0).Text = FrmMain.WinSockCtl.LocalHostName
    FrmConnectionInfo.TagInfo.Item(1).Text = FrmMain.WinSockCtl.LocalPort
    FrmConnectionInfo.TagInfo.Item(2).Text = FrmMain.WinSockCtl.LocalIP
    FrmConnectionInfo.TagInfo.Item(3).Text = FrmMain.WinSockCtl.RemoteHost
    FrmConnectionInfo.TagInfo.Item(4).Text = FrmMain.WinSockCtl.RemotePort
    FrmConnectionInfo.TagInfo.Item(5).Text = FrmMain.WinSockCtl.RemoteHostIP
    
    FrmConnectionInfo.Show
    Exit Sub
FinaliseError:
    UnloadFormsOpen
    FrmMain.FrmDialog.Item(0).Visible = True
    FrmMain.FrmDialog.Item(1).Visible = False
    FrmMain.lblstate.Caption = "Disconnected"
    MsgBox "Error, could not locate server. Please try again.", vbCritical, "Connection Error"
End Sub

Private Sub CmdExit_Click()
    End
End Sub

Private Sub CmdRestart_Click()

    Dim TempIP As String
    Dim TempPort As String
    If FrmMain.WinSockCtl.RemoteHostIP = "" Then
        FrmMain.FrmDialog.Item(0).Visible = True
        FrmMain.FrmDialog.Item(1).Visible = False
        FrmMain.lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        MsgBox "Could not restart server. Please make sure you are connected correctly and the address and Port are valid.", vbCritical, "Error"
        Exit Sub
    End If
    
    If FrmMain.WinSockCtl.State <> 7 Then
        FrmMain.FrmDialog.Item(0).Visible = True
        FrmMain.FrmDialog.Item(1).Visible = False
        FrmMain.lblstate.Caption = "Disconnected"
        UnloadFormsOpen
        MsgBox "Could not restart server. You are not connected to the current address.", vbInformation, "Connection states"
        Exit Sub
    End If
    
    TempIP = FrmMain.WinSockCtl.RemoteHostIP
    TempPort = FrmMain.WinSockCtl.RemotePort
    
    On Error GoTo FinaliseError

    FrmMain.WinSockCtl.Close
    FrmMain.WinSockCtl.Connect TempIP, TempPort
    
    FrmMain.FrmDialog.Item(0).Visible = False
    FrmMain.FrmDialog.Item(1).Visible = True
    
    Exit Sub
FinaliseError:
    FrmMain.lblstate.Caption = "Disconnected"
    FrmMain.FrmDialog.Item(0).Visible = True
    FrmMain.FrmDialog.Item(1).Visible = False
    UnloadFormsOpen
    MsgBox "Error, could not re-establish connection. Please check the specified address and connection Port.", vbCritical, "Error"
End Sub

Private Sub Timer_Timer()
    If Me.Left + Me.Width < Screen.Width Then
        If FrmMain.Left + Me.Width + FrmMain.Width < Screen.Width Then
            Me.Left = FrmMain.Left + FrmMain.Width
        End If
    Else
        If Me.Left > 0 Then
            Me.Left = FrmMain.Left - Me.Width
        End If
    End If
    If Me.Top < 0 Then
        Me.Top = 0
    Else
        If Me.Top + Me.Height > Screen.Height Then
            Me.Top = Screen.Height - Me.Height
        Else
            If FrmMain.Top + FrmMain.Height > Screen.Height Then
                If Me.Top + Me.Height > Screen.Height Then
                    Me.Top = Screen.Height - Me.Height
                Else
                    If FrmMain.Top + FrmMain.Height > Screen.Height And Me.Top + Me.Height = Screen.Height Then
                        'Do nothing
                    Else
                        Me.Top = FrmMain.Top
                    End If
                End If
            Else
                If FrmMain.Top + FrmMain.Height > Screen.Height And Me.Top + Me.Height = Screen.Height Then
                    'Do nothing
                    Me.Top = FrmMain.Height + FrmMain.Top
                Else
                    Me.Top = FrmMain.Top
                End If
            End If
        End If
    End If
End Sub
