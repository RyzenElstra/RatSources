VERSION 5.00
Begin VB.Form Menus 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Menus"
   ClientHeight    =   705
   ClientLeft      =   150
   ClientTop       =   420
   ClientWidth     =   8280
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   705
   ScaleWidth      =   8280
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Menu FBPeriority 
      Caption         =   "FBPeriority"
      Visible         =   0   'False
      Begin VB.Menu Per 
         Caption         =   "Pause"
         Index           =   0
      End
      Begin VB.Menu Per 
         Caption         =   "Waitting"
         Index           =   1
      End
      Begin VB.Menu Per 
         Caption         =   "Low"
         Checked         =   -1  'True
         Index           =   2
      End
      Begin VB.Menu Per 
         Caption         =   "Normal"
         Index           =   3
      End
      Begin VB.Menu Per 
         Caption         =   "High"
         Index           =   4
      End
      Begin VB.Menu Per 
         Caption         =   "Highest"
         Index           =   5
      End
   End
   Begin VB.Menu FBDwnManger 
      Caption         =   "FBDwnManger"
      Visible         =   0   'False
      Begin VB.Menu Button 
         Caption         =   "Refresh"
         Index           =   0
      End
      Begin VB.Menu Button 
         Caption         =   "New Therat..."
         Index           =   1
      End
      Begin VB.Menu Button 
         Caption         =   "Start"
         Index           =   2
      End
      Begin VB.Menu Button 
         Caption         =   "Pause Therat"
         Index           =   3
      End
      Begin VB.Menu Button 
         Caption         =   "Cancel/Delete Therat"
         Index           =   4
      End
      Begin VB.Menu Button 
         Caption         =   "Edit Comment..."
         Index           =   6
      End
      Begin VB.Menu Button 
         Caption         =   "Sugggestions"
         Index           =   7
      End
      Begin VB.Menu Button 
         Caption         =   "Properties"
         Index           =   8
      End
      Begin VB.Menu Button 
         Caption         =   "Options"
         Index           =   9
      End
      Begin VB.Menu Button 
         Caption         =   "Treat A Damaged File..."
         Index           =   10
      End
      Begin VB.Menu Button 
         Caption         =   "View Log"
         Index           =   11
      End
      Begin VB.Menu Button 
         Caption         =   "Save Log"
         Index           =   12
      End
      Begin VB.Menu Button 
         Caption         =   "Open Download Folder"
         Index           =   13
      End
      Begin VB.Menu Button 
         Caption         =   "About X-Downloader"
         Index           =   14
      End
      Begin VB.Menu Button 
         Caption         =   "Hide X-Downloader"
         Index           =   15
      End
   End
   Begin VB.Menu TMPriority 
      Caption         =   "TMPriority"
      Visible         =   0   'False
      Begin VB.Menu PrVal 
         Caption         =   "IDLE_PRIORITY_CLASS"
         Index           =   0
      End
      Begin VB.Menu PrVal 
         Caption         =   "BELOW_NORMAL_PRIORITY_CLASS"
         Index           =   1
      End
      Begin VB.Menu PrVal 
         Caption         =   "NORMAL_PRIORITY_CLASS"
         Index           =   2
      End
      Begin VB.Menu PrVal 
         Caption         =   "ABOVE_NORMAL_PRIORITY_CLASS"
         Index           =   3
      End
      Begin VB.Menu PrVal 
         Caption         =   "HIGH_PRIORITY_CLASS"
         Index           =   4
      End
      Begin VB.Menu PrVal 
         Caption         =   "REALTIME_PRIORITY_CLASS"
         Index           =   5
      End
   End
   Begin VB.Menu WBSizes 
      Caption         =   "WBSizes"
      Visible         =   0   'False
      Begin VB.Menu WBSize 
         Caption         =   "Size 1"
         Index           =   1
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 2"
         Index           =   2
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 3"
         Index           =   3
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 4"
         Index           =   4
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 5"
         Index           =   5
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 6"
         Index           =   6
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 7"
         Index           =   7
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 8"
         Index           =   8
      End
      Begin VB.Menu WBSize 
         Caption         =   "Size 9"
         Index           =   9
      End
   End
   Begin VB.Menu EditorFileTypes 
      Caption         =   "EditorFileTypes"
      Visible         =   0   'False
      Begin VB.Menu FileType 
         Caption         =   "Text File (*.txt)"
         Index           =   0
      End
      Begin VB.Menu FileType 
         Caption         =   "Data File (*.dat)"
         Index           =   1
      End
      Begin VB.Menu FileType 
         Caption         =   "Batch Files (*.bat)"
         Index           =   2
      End
      Begin VB.Menu FileType 
         Caption         =   "JS Files (*.js)"
         Index           =   3
      End
      Begin VB.Menu FileType 
         Caption         =   "VBS Files (*.vbs)"
         Index           =   4
      End
      Begin VB.Menu FileType 
         Caption         =   "HTML Files (*.html)"
         Index           =   5
      End
      Begin VB.Menu FileType 
         Caption         =   "Registry Files (*.reg)"
         Index           =   6
      End
      Begin VB.Menu FileType 
         Caption         =   "Handle-X Script (*.hxs)"
         Index           =   7
      End
   End
   Begin VB.Menu IPtools 
      Caption         =   "IPtools"
      Visible         =   0   'False
      Begin VB.Menu IPTool 
         Caption         =   "X-Router (Where This IP?)"
         Index           =   0
      End
      Begin VB.Menu IPTool 
         Caption         =   "X-Ping (Ping this IP and resolve it's Host Name)"
         Index           =   1
      End
      Begin VB.Menu IPTool 
         Caption         =   "X-Whois (Whois This IP , ISP information and Region Informations)"
         Index           =   2
      End
      Begin VB.Menu IPTool 
         Caption         =   "X-Tracert (Trace this IP from your pc to it and show the path)"
         Index           =   3
      End
      Begin VB.Menu IPTool 
         Caption         =   "X-Scanner (Scan open ports at this IP machine)"
         Index           =   4
      End
   End
End
Attribute VB_Name = "Menus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Button_Click(Index As Integer)
    'Redirect The Event To The Buttons There in the download manager
     DownloadManager.Buttons_Click (Index)
End Sub
Private Sub FileType_Click(Index As Integer)
    'Redirect the menu-items_click event to the Editor Form Code
     Editor.FileTypesMenu Index
End Sub
Private Sub Form_Resize()
    Me.Hide
End Sub
Private Sub IPTool_Click(Index As Integer)
    'Redirect the tool click to the IPtools navigator function
     Call Kernel.IPtools(Index)
End Sub

Private Sub Per_Click(Index As Integer)
DownloadManager.Set_Periority (Index)
End Sub
Public Function ClearFBperiorityMenu()
    Dim i As Integer
    For i = Pause To Highest
        Per(i).Checked = False
    Next i
End Function
Public Function ClearWBsizesMenu()
    Dim i As Integer
    For i = 1 To WBSize.UBound
        WBSize(i).Checked = False
        WBSize(i).Enabled = True
    Next i
End Function
Private Sub PrVal_Click(Index As Integer)
    SetPriorityMenuItems , Index
End Sub
Private Sub WBSize_Click(Index As Integer)
    WhiteBoardButtonsClick (Index + 6) 'Shift The Sizes as a White Board Buttons
End Sub
