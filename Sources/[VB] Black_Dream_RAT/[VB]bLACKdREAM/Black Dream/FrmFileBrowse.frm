VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FrmFileBrowse 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Black Dream file browser"
   ClientHeight    =   6315
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   10140
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmFileBrowse.frx":0000
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6315
   ScaleWidth      =   10140
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdRemoveDir 
      Caption         =   "Re&move Dir"
      Height          =   375
      Left            =   8760
      TabIndex        =   14
      Top             =   2760
      Width           =   1215
   End
   Begin MSComctlLib.ImageList ImageList 
      Left            =   2760
      Top             =   240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmFileBrowse.frx":08CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmFileBrowse.frx":15A6
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmFileBrowse.frx":2282
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListDrives 
      Height          =   1575
      Left            =   120
      TabIndex        =   13
      ToolTipText     =   "Double Click to browse"
      Top             =   120
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   2778
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList"
      SmallIcons      =   "ImageList"
      ColHdrIcons     =   "ImageList"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin MSComctlLib.ListView ListFolders 
      Height          =   3375
      Left            =   120
      TabIndex        =   12
      Top             =   1800
      Width           =   2415
      _ExtentX        =   4260
      _ExtentY        =   5953
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList"
      SmallIcons      =   "ImageList"
      ColHdrIcons     =   "ImageList"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin VB.CommandButton CmdSetWallpaper 
      Caption         =   "&Set Wallpaper"
      Height          =   375
      Left            =   8760
      TabIndex        =   10
      Top             =   120
      Width           =   1215
   End
   Begin VB.CommandButton CmdPlayWav 
      Caption         =   "&Play wav"
      Height          =   375
      Left            =   8760
      TabIndex        =   9
      Top             =   600
      Width           =   1215
   End
   Begin VB.CommandButton CmdUpload 
      Caption         =   "&Upload"
      Height          =   375
      Left            =   8760
      TabIndex        =   8
      Top             =   3360
      Width           =   1215
   End
   Begin VB.CommandButton CmdRun 
      Caption         =   "&Run on server"
      Height          =   375
      Left            =   8760
      TabIndex        =   7
      Top             =   1080
      Width           =   1215
   End
   Begin VB.CommandButton CmdDelete 
      Caption         =   "D&elete"
      Height          =   375
      Left            =   8760
      TabIndex        =   6
      Top             =   1680
      Width           =   1215
   End
   Begin VB.CommandButton CmdCreateDir 
      Caption         =   "&Create Dir"
      Height          =   375
      Left            =   8760
      TabIndex        =   5
      Top             =   2280
      Width           =   1215
   End
   Begin VB.CommandButton CmdDownload 
      Caption         =   "&Download"
      Height          =   375
      Left            =   8760
      TabIndex        =   4
      Top             =   3840
      Width           =   1215
   End
   Begin VB.CommandButton CmdBrowse 
      Caption         =   "&Browse"
      Default         =   -1  'True
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   8760
      TabIndex        =   3
      Top             =   5280
      Width           =   1215
   End
   Begin VB.TextBox TextDirectory 
      Height          =   285
      Left            =   960
      TabIndex        =   2
      Text            =   "C:"
      ToolTipText     =   "Specify a directory here and click on the Browse button"
      Top             =   5280
      Width           =   7695
   End
   Begin MSComctlLib.ListView ListFiles 
      Height          =   5055
      Left            =   2640
      TabIndex        =   0
      ToolTipText     =   "Listed files in specified directory"
      Top             =   120
      Width           =   6015
      _ExtentX        =   10610
      _ExtentY        =   8916
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      OLEDropMode     =   1
      AllowReorder    =   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      OLEDropMode     =   1
      NumItems        =   0
   End
   Begin VB.Image Image1 
      Height          =   480
      Left            =   9480
      Picture         =   "FrmFileBrowse.frx":2F5E
      Top             =   4440
      Width           =   480
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "All file types are loaded from the local registry to speed up the folder/drive information download"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   120
      TabIndex        =   15
      Top             =   6000
      Width           =   8235
   End
   Begin VB.Line Line4 
      X1              =   8760
      X2              =   9960
      Y1              =   3240
      Y2              =   3240
   End
   Begin VB.Line Line3 
      X1              =   8760
      X2              =   9960
      Y1              =   2160
      Y2              =   2160
   End
   Begin VB.Line Line2 
      X1              =   8760
      X2              =   9960
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "File types and file sizes are only loaded if the data string (Folder Information) is the length less than 4000 chracters."
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   195
      Left            =   120
      TabIndex        =   11
      Top             =   5760
      Width           =   9855
      WordWrap        =   -1  'True
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Directory:"
      Height          =   195
      Left            =   120
      TabIndex        =   1
      Top             =   5280
      Width           =   720
   End
End
Attribute VB_Name = "FrmFileBrowse"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdBrowse_Click()
    On Error Resume Next
    ListFolders.ListItems.Clear
    If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
    FrmMain.WinSockCtl.SendData "[LOAD FOLDER NAME]" & TextDirectory.Text
    
    WaitTime = 0
    Do Until WaitTime = 10000
        WaitTime = WaitTime + 1: DoEvents
        Loop
    
    ListFiles.ListItems.Clear
    FrmMain.WinSockCtl.SendData "[LOAD FOLDER DATA]" & TextDirectory.Text
    
    WaitTime = 0
    Do Until WaitTime = 10000
        WaitTime = WaitTime + 1: DoEvents
        Loop
    
    FrmMain.WinSockCtl.SendData "[FILE SIZE DATA]" & TextDirectory.Text
End Sub

Private Sub CmdCreateDir_Click()
    On Error Resume Next
    FrmCreateDir.Show 1, Me
End Sub

Private Sub CmdDelete_Click()
    On Error Resume Next
    If ListFiles.SelectedItem.Text <> "" Then
        If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
        Value& = MsgBox("Are you sure you want to delete the selected file?", vbYesNo + vbQuestion, "Deleting files")
        If Value& = vbYes Then
            FrmMain.WinSockCtl.SendData "078" & TextDirectory & ListFiles.SelectedItem.Text
        Else
            MsgBox "The file selected to be deleted has not been removed.", vbInformation, "Deleting files"
        End If
    End If
End Sub

Private Sub CmdDownload_Click()
'    On Error Resume Next
    FrmDownload.Show
End Sub

Private Sub CmdPlayWav_Click()
    On Error Resume Next
    If ListFiles.SelectedItem.Text <> "" Then
        If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
        FrmMain.WinSockCtl.SendData "022" & TextDirectory & ListFiles.SelectedItem.Text
    End If
End Sub

Private Sub CmdRemoveDir_Click()
    On Error Resume Next
    FrmRemoveDir.Show 1, Me
End Sub

Private Sub CmdRun_Click()
    On Error Resume Next
    If ListFiles.SelectedItem.Text <> "" Then
        If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
        FrmMain.WinSockCtl.SendData "083" & TextDirectory & ListFiles.SelectedItem.Text
    End If
End Sub

Private Sub CmdSetWallpaper_Click()
    On Error Resume Next
    If ListFiles.SelectedItem.Text <> "" Then
        If Right(TextDirectory.Text, 1) <> "\" And Right(TextDirectory.Text, 1) <> "/" Then TextDirectory.Text = TextDirectory.Text & "\"
        FrmMain.WinSockCtl.SendData "101" & TextDirectory & ListFiles.SelectedItem.Text
    End If
End Sub

Private Sub CmdUpload_Click()
    FrmUpload.Show
End Sub

Private Sub Form_Load()
    On Error Resume Next
    FrmMain.Hide
    Me.Caption = "Black Dream file browser (Browsing " & FrmMain.WinSockCtl.RemoteHostIP & ")"
    ListFiles.ColumnHeaders.Add , , "File Name", 2500
    ListFiles.ColumnHeaders.Add , , "File type", 2500
    ListFiles.ColumnHeaders.Add , , "Size", 2500
    ListDrives.ColumnHeaders.Add , , "Drive List", 2500, , 3
    ListFolders.ColumnHeaders.Add , , "Folder List", 2500, , 2
    FrmMain.WinSockCtl.SendData "[LOAD DRIVE DATA]"
    ListFiles.ListItems.Clear
    ListDrives.ListItems.Clear
    ListFolders.ListItems.Clear
        
    WaitTime = 0
    Do Until WaitTime = 10000
        WaitTime = WaitTime + 1: DoEvents
        Loop

    FrmMain.WinSockCtl.SendData "[LOAD FOLDER DATA]" & TextDirectory.Text
    
    WaitTime = 0
    Do Until WaitTime = 10000
        WaitTime = WaitTime + 1: DoEvents
        Loop
    
    FrmMain.WinSockCtl.SendData "[LOAD FOLDER NAME]" & TextDirectory.Text
    
    WaitTime = 0
    Do Until WaitTime = 10000
        WaitTime = WaitTime + 1: DoEvents
        Loop
    
    FrmMain.WinSockCtl.SendData "[FILE SIZE DATA]" & TextDirectory.Text
End Sub

Private Sub Form_Unload(Cancel As Integer)
    FrmMain.Show
End Sub

Private Sub ListDrives_DblClick()
    On Error Resume Next
    If ListDrives.SelectedItem.Text <> "" Then
        TextDirectory.Text = Left(ListDrives.SelectedItem.Text, 2) & "\"
        CmdBrowse_Click
    End If
End Sub

Private Sub ListFolders_Click()
    On Error Resume Next
    If ListFolders.SelectedItem.Text <> "" Then
        TextDirectory.Text = ListFolders.SelectedItem.Text & "\"
        ListFolders.SelectedItem.SmallIcon = ImageList.ListImages.Item(2).Picture
        ListFolders.Refresh
        CmdBrowse_Click
    End If
End Sub

Private Sub TextDirectory_Change()
    If TextDirectory = "" Then
        CmdCreateDir.Enabled = False
        CmdBrowse.Enabled = False
    Else
        CmdCreateDir.Enabled = True
        CmdBrowse.Enabled = True
    End If
End Sub

Private Sub TextDirectory_KeyPress(KeyAscii As Integer)
    If KeyAscii = 13 Then CmdBrowse_Click
End Sub
