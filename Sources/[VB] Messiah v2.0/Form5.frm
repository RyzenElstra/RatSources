VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form Form5 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "File Manager"
   ClientHeight    =   5070
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   6600
   LinkTopic       =   "Form5"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5070
   ScaleWidth      =   6600
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command6 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Delete File"
      Height          =   375
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   10
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton Command5 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Run File"
      Height          =   375
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   9
      Top             =   4680
      Width           =   1215
   End
   Begin MSComctlLib.ImageList imgtv 
      Left            =   4800
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   7
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":0000
            Key             =   "CD"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":059C
            Key             =   "FD"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":0B38
            Key             =   "ND"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":10D4
            Key             =   "CLOSED"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":1670
            Key             =   "OPEN"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":1C0C
            Key             =   "HD"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":21A8
            Key             =   "RC"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList imglist 
      Left            =   4080
      Top             =   1200
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   10
      ImageHeight     =   10
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "Form5.frx":2A84
            Key             =   "FILE"
         EndProperty
      EndProperty
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   0
      TabIndex        =   8
      Text            =   "c:\"
      Top             =   3720
      Width           =   6615
   End
   Begin VB.CommandButton Command4 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Set Wallpaper"
      Height          =   375
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   7
      Top             =   4680
      Width           =   1215
   End
   Begin VB.CommandButton Command3 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Play Wav"
      Height          =   375
      Left            =   5280
      Style           =   1  'Graphical
      TabIndex        =   6
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton Command2 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Delete DIR"
      Height          =   375
      Left            =   3960
      Style           =   1  'Graphical
      TabIndex        =   5
      Top             =   4200
      Width           =   1215
   End
   Begin MSComDlg.CommonDialog CD1 
      Left            =   5760
      Top             =   6000
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Make DIR"
      Height          =   375
      Left            =   2640
      Style           =   1  'Graphical
      TabIndex        =   4
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmdgetdrives 
      BackColor       =   &H00FFFFFF&
      Caption         =   "Get Drives"
      Height          =   375
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   1
      Top             =   4200
      Width           =   1215
   End
   Begin VB.CommandButton cmddownload 
      BackColor       =   &H00FFFFFF&
      Caption         =   "DownLoad"
      Height          =   375
      Left            =   1320
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   4200
      Width           =   1215
   End
   Begin MSWinsockLib.Winsock sockExplorer 
      Left            =   4080
      Top             =   600
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin MSComDlg.CommonDialog objcommondialog 
      Left            =   4200
      Top             =   2880
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ListView lvFiles 
      Height          =   3495
      Left            =   3600
      TabIndex        =   2
      Top             =   0
      Width           =   2895
      _ExtentX        =   5106
      _ExtentY        =   6165
      Arrange         =   2
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FlatScrollBar   =   -1  'True
      TextBackground  =   -1  'True
      _Version        =   393217
      Icons           =   "imglist"
      ForeColor       =   0
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   1
      NumItems        =   0
   End
   Begin MSComctlLib.TreeView TvTreeView 
      Height          =   3495
      Left            =   0
      TabIndex        =   3
      Top             =   0
      Width           =   3615
      _ExtentX        =   6376
      _ExtentY        =   6165
      _Version        =   393217
      Indentation     =   18
      LineStyle       =   1
      Style           =   7
      ImageList       =   "imgtv"
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
   End
   Begin VB.Line Line2 
      X1              =   0
      X2              =   6600
      Y1              =   4080
      Y2              =   4080
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   6600
      Y1              =   3600
      Y2              =   3600
   End
End
Attribute VB_Name = "Form5"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Dim mbMoving As Boolean
Const sglSplitLimit = 500

Dim RCommand As String
Dim FlagConnect As Integer
Dim ChatName As String
Dim cdflag As Integer
Dim lockflag


Private Sub cmddownload_Click()

    Dim iResult As Integer
    
With objcommondialog
                .DialogTitle = "Save remote file to:"
                .FileName = Me.lvFiles.SelectedItem.Text
                .ShowSave
            
                If Len(Dir(.FileName)) <> 0 Then
                    iResult = MsgBox(.FileName & " exists! Do you wish to overwrite this file?", vbQuestion + vbYesNoCancel, "Messiah")
                    If iResult = vbNo Then
                        Exit Sub
                    End If
                    
                End If

                Open .FileName For Binary As #1
            
            End With
            
            bFileTransfer = True
           sockExplorer.SendData "|GETFILE|" & lvFiles.SelectedItem.Key
            frmdownloading.lblFIleName = lvFiles.SelectedItem.Text
            frmdownloading.Show , Me
            
End Sub
Private Sub cmdgetdrives_Click()
With sockExplorer
        .RemotePort = 1216
        .RemoteHost = Form1.Text1.Text
        .Connect
    End With
End Sub


Private Sub Command1_Click()
On Error Resume Next
Dim X As String
X = InputBox("Where do you want to make the dir?", "make DIR", "c:\new Dir")
Form1.Winsock1.SendData "makedir|" & X
End Sub

Private Sub Command2_Click()
Form1.Winsock1.SendData "removedir|" & Text1.Text
End Sub

Private Sub Command3_Click()
Form1.Winsock1.SendData "playmusic|" & Text1.Text
End Sub

Private Sub Command4_Click()
Form1.Winsock1.SendData "setwallpaper|" & Text1.Text
End Sub

Private Sub Command5_Click()
Form1.Winsock1.SendData "runfile|" & Text1.Text
End Sub

Private Sub Command6_Click()
Form1.Winsock1.SendData "deletefile|" & Text1.Text
End Sub

Private Sub Form_Load()
Improve_Listview Me.lvFiles
End Sub

Private Sub Form_Unload(Cancel As Integer)
TvTreeView.Nodes.Clear
lvFiles.ListItems.Clear
End Sub

Private Sub lvFiles_Click()
Text1.Text = lvFiles.SelectedItem.Key
End Sub

Private Sub lvFiles_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
Select Case ColumnHeader.Index
Case 1
msSortListview Me.lvFiles, ColumnHeader.Index, gcnText
Case 2
msSortListview Me.lvFiles, ColumnHeader.Index, gcnNumber
End Select
End Sub

Private Sub sockExplorer_Connect()
TvTreeView.Nodes.Add , , "xxxROOTxxx", Form1.Text1.Text, "RC", "RC"

sockExplorer.SendData "|ENUMDRVS|"
End Sub

Private Sub sockExplorer_DataArrival(ByVal bytesTotal As Long)

Dim Strdata As String
   
   sockExplorer.GetData Strdata, vbString

    If InStr(1, Strdata, "|COMPLETE|") <> 0 Then
        frmdownloading.objprog.Value = frmdownloading.objprog.Max
        MsgBox "File Received!", vbInformation, "Download Complete!"
        bFileTransfer = False
        Put #1, , Strdata
        Close #1
        Unload frmdownloading
        Set frmdownloading = Nothing
        DoEvents
        
        If bGettingDesktop = True Then
            bGettingDesktop = False
            Shell "C:\Windows\mspaint.exe" & App.Path & "\desktop.bmp", vbMaximizedFocus
        End If
        
        
        Exit Sub
    End If
        
    If InStr(1, Strdata, "|DRVS|") <> 0 Then
        Populate_Tree_With_Drives Strdata, TvTreeView
        Exit Sub
    End If
    
    If InStr(1, Strdata, "|FOLDERS|") <> 0 Then
        Populate_Folders Strdata, TvTreeView
        Exit Sub
    End If
        
    If InStr(1, Strdata, "|FILES|") <> 0 Then
        Populate_Files Strdata, lvFiles
        Me.MousePointer = vbDefault
        Exit Sub
    End If
        
    If bFileTransfer = True Then
        
        If InStr(1, Strdata, "|FILESIZE|") <> 0 Then
            frmdownloading.lblBytes.Caption = CLng(Mid$(Strdata, 11, Len(Strdata)))
            frmdownloading.objprog.Max = CLng(Mid$(Strdata, 11, Len(Strdata)))
            Exit Sub
        End If
        
        Put #1, , Strdata
        
        With frmdownloading.objprog
            If (.Value + Len(Strdata)) <= .Max Then
                .Value = .Value + Len(Strdata)
            Else
                .Value = .Max
                DoEvents
            End If
        End With
        
    End If
    
sockExplorer_DataArrival_Exit:
    Exit Sub

sockExplorer_DataArrival_Error:
    bGettingDesktop = False
    MsgBox Err.Description, vbCritical, "Messiah Downloader"
    Exit Sub
    
    

       End Sub

Private Sub TvTreeView_Click()
Text1.Text = TvTreeView.SelectedItem.Key
End Sub

Private Sub TvTreeView_Collapse(ByVal Node As MSComctlLib.Node)
On Error GoTo tvTreeView_Collapse_Error

    If Node.Key = "xxxROOTxxx" Then
        Exit Sub
    End If
    
    Delete_Child_Nodes Me.TvTreeView, Node
    
tvTreeView_Collapse_Exit:
    Exit Sub

tvTreeView_Collapse_Error:
    MsgBox Err.Description, vbCritical, "Error"
    Exit Sub
End Sub

Private Sub TvTreeView_NodeClick(ByVal Node As MSComctlLib.Node)
On Error GoTo tvTreeView_NodeClick_Error
 
Dim sData As String
 
    Me.MousePointer = vbHourglass
    sData = "|FOLDERS|" & Node.Key
   sockExplorer.SendData (sData)
 
tvTreeView_NodeClick_Exit:
    Exit Sub

tvTreeView_NodeClick_Error:
     Me.MousePointer = vbDefault
    If Err.Number = 40006 Then
        MsgBox "Remote connection lost!", vbExclamation, "Explorer Click"
        Exit Sub
        
    End If
    
    MsgBox Err.Description, vbCritical, "Explorer Click"
    Exit Sub

End Sub

