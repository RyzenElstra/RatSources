VERSION 5.00
Begin VB.Form Editor 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   BorderStyle     =   0  'None
   Caption         =   "X-Editor"
   ClientHeight    =   6045
   ClientLeft      =   30
   ClientTop       =   -15
   ClientWidth     =   10485
   ControlBox      =   0   'False
   Icon            =   "Editor.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Moveable        =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   10485
   StartUpPosition =   2  'CenterScreen
   Begin VB.PictureBox Frame 
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      ForeColor       =   &H80000008&
      Height          =   330
      Index           =   0
      Left            =   7720
      ScaleHeight     =   300
      ScaleWidth      =   2700
      TabIndex        =   8
      Tag             =   "Options"
      ToolTipText     =   "Options"
      Top             =   340
      Width           =   2730
      Begin VB.Image Buttons 
         Appearance      =   0  'Flat
         Height          =   285
         Index           =   13
         Left            =   1750
         Picture         =   "Editor.frx":1272
         Stretch         =   -1  'True
         ToolTipText     =   "Font"
         Top             =   10
         Width           =   285
      End
      Begin VB.Label SCRFontName 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   6.75
            Charset         =   178
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FFFFFF&
         Height          =   210
         Left            =   40
         TabIndex        =   11
         Top             =   40
         Width           =   1695
      End
      Begin VB.Label FColor 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFFF&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H00FFFFFF&
         Height          =   255
         Left            =   2400
         TabIndex        =   10
         ToolTipText     =   "Fore Color"
         Top             =   30
         Width           =   255
      End
      Begin VB.Label BColor 
         Appearance      =   0  'Flat
         BackColor       =   &H00404040&
         BorderStyle     =   1  'Fixed Single
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   2090
         TabIndex        =   9
         ToolTipText     =   "Back Color"
         Top             =   30
         Width           =   255
      End
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   10200
      MousePointer    =   8  'Size NW SE
      ScaleHeight     =   255
      ScaleWidth      =   255
      TabIndex        =   5
      Top             =   5760
      Width           =   255
   End
   Begin VB.TextBox Txt_Screen 
      Appearance      =   0  'Flat
      BackColor       =   &H00404040&
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   5310
      Left            =   10
      MultiLine       =   -1  'True
      ScrollBars      =   3  'Both
      TabIndex        =   4
      Top             =   700
      Width           =   10440
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "M"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   3
      Left            =   9850
      MouseIcon       =   "Editor.frx":17FC
      MousePointer    =   99  'Custom
      TabIndex        =   7
      Tag             =   "ãÓÇÚÏå"
      ToolTipText     =   "Muximize"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label Indicator 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Ready !"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00000000&
      Height          =   255
      Left            =   5800
      TabIndex        =   6
      Top             =   385
      Width           =   1875
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   0
      X1              =   10470
      X2              =   10470
      Y1              =   0
      Y2              =   6020
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   10
      X1              =   1708
      X2              =   1708
      Y1              =   690
      Y2              =   330
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   4
      X1              =   5744
      X2              =   5744
      Y1              =   690
      Y2              =   330
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   12
      Left            =   5352
      Picture         =   "Editor.frx":1B06
      Stretch         =   -1  'True
      ToolTipText     =   "Hide"
      Top             =   375
      Width           =   285
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   11
      Left            =   4960
      Picture         =   "Editor.frx":3B78
      Stretch         =   -1  'True
      ToolTipText     =   "About X-Editor"
      Top             =   375
      Width           =   285
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   9
      X1              =   4838
      X2              =   4838
      Y1              =   690
      Y2              =   330
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   10
      Left            =   4440
      Picture         =   "Editor.frx":4842
      Stretch         =   -1  'True
      ToolTipText     =   "Execute"
      Top             =   360
      Width           =   285
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   6
      X1              =   4324
      X2              =   4324
      Y1              =   690
      Y2              =   330
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   5
      X1              =   3418
      X2              =   3418
      Y1              =   690
      Y2              =   330
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   4
      Left            =   1830
      Picture         =   "Editor.frx":510C
      Stretch         =   -1  'True
      ToolTipText     =   "Cut"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   1
      Left            =   517
      Picture         =   "Editor.frx":520E
      Stretch         =   -1  'True
      ToolTipText     =   "Open"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   0
      Left            =   120
      Picture         =   "Editor.frx":5310
      Stretch         =   -1  'True
      ToolTipText     =   "New"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   2
      Left            =   914
      Picture         =   "Editor.frx":5412
      Stretch         =   -1  'True
      ToolTipText     =   "Save To"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   3
      Left            =   1311
      Picture         =   "Editor.frx":5514
      Stretch         =   -1  'True
      ToolTipText     =   "Print"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   5
      Left            =   2227
      Picture         =   "Editor.frx":5616
      Stretch         =   -1  'True
      ToolTipText     =   "Copy"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   6
      Left            =   2624
      Picture         =   "Editor.frx":5718
      Stretch         =   -1  'True
      ToolTipText     =   "Paste"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   290
      Index           =   7
      Left            =   3021
      Picture         =   "Editor.frx":581A
      Stretch         =   -1  'True
      ToolTipText     =   "Find"
      Top             =   380
      Width           =   290
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   8
      Left            =   3540
      Picture         =   "Editor.frx":591C
      Stretch         =   -1  'True
      ToolTipText     =   "Replace"
      Top             =   360
      Width           =   285
   End
   Begin VB.Image Buttons 
      Appearance      =   0  'Flat
      Height          =   285
      Index           =   9
      Left            =   3932
      Picture         =   "Editor.frx":61E6
      Stretch         =   -1  'True
      ToolTipText     =   "Go To Line #"
      Top             =   360
      Width           =   285
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   3
      X1              =   0
      X2              =   10440
      Y1              =   690
      Y2              =   690
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   1
      X1              =   0
      X2              =   10470
      Y1              =   6020
      Y2              =   6020
   End
   Begin VB.Line Line2 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   1
      X1              =   15
      X2              =   0
      Y1              =   0
      Y2              =   6000
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "?"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   2
      Left            =   9240
      MouseIcon       =   "Editor.frx":6628
      MousePointer    =   99  'Custom
      TabIndex        =   3
      Tag             =   "ãÓÇÚÏå"
      ToolTipText     =   "Help ?"
      Top             =   45
      Width           =   255
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   0
      X1              =   0
      X2              =   10440
      Y1              =   330
      Y2              =   330
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   3
      Index           =   2
      X1              =   0
      X2              =   10440
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00000000&
      BorderWidth     =   2
      Index           =   8
      X1              =   9180
      X2              =   9180
      Y1              =   300
      Y2              =   0
   End
   Begin VB.Label TiTle 
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X-Editor V1.0"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   178
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Left            =   75
      TabIndex        =   2
      Tag             =   "ÇáãÍÑÑ ÅßÓ ÇáÅÕÏÇÑå 1"
      ToolTipText     =   "X-Editor V1.0"
      Top             =   45
      Width           =   9060
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "X"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   0
      Left            =   10155
      MouseIcon       =   "Editor.frx":6932
      MousePointer    =   99  'Custom
      TabIndex        =   1
      Tag             =   "ÅÎÝÇÁ ÇáãÍÑÑ ÅßÓ"
      ToolTipText     =   "Hide X-Editor"
      Top             =   45
      Width           =   255
   End
   Begin VB.Label Control_Box 
      Alignment       =   2  'Center
      Appearance      =   0  'Flat
      BackColor       =   &H00000000&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "-"
      BeginProperty Font 
         Name            =   "Terminal"
         Size            =   13.5
         Charset         =   255
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FFFFFF&
      Height          =   255
      Index           =   1
      Left            =   9545
      MouseIcon       =   "Editor.frx":6C3C
      MousePointer    =   99  'Custom
      TabIndex        =   0
      Tag             =   "ÊÕÛíÑ"
      ToolTipText     =   "Minimize"
      Top             =   45
      Width           =   255
   End
End
Attribute VB_Name = "Editor"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim b As Integer, C As Integer, a As Boolean   'Variables Needed for the movinfg of the editor
Private Const MyTitle = "X-Editor V1.0"
Private Const MaxFileSize = (1 * (2 ^ 20)) + 1 '1MB
Dim OldW As Integer, OldH As Integer, AsOfResize As Boolean
Private CurrentButton As Integer
Private FileName As String, SaveFlag As Boolean
Private Sub Buttons_Click(Index As Integer)
On Error GoTo Failed
CurrentButton = Index
    Select Case Index
           Case 0 'New File
                IsSaveActionNeeded
                Txt_Screen = ""
                TiTle = MyTitle & " [" & "Untitled" & "]"
                FileName = "Untitled"
                SaveFlag = False
           Case 1 'Open
                Buttons_Click 0 'Call New File Rotuine
                FileBrowser.CMD1.CancelError = False
                FileBrowser.CMD1.Filter = "All Files(*.*)|*.*"
                FileBrowser.CMD1.ShowOpen
                FileName = FileBrowser.CMD1.FileName
               'Check Existace of input filename to open
                If CStr(CBool(PathFileExists(FileName))) = True Then
                    'Open The File
                        'Read The File Intries
                         If FileLen(FileName) > MaxFileSize Then
                            If MsgBox("The file size is much bigger size!,So are you sure you want to open this file" & vbCrLf & "Warnning:This file will consume much memory and may cause hang up to the pc." & vbCrLf & vbCrLf & "Note:The Max file size is " & String_Size(MaxFileSize), vbExclamation + vbYesNo, AppName) = vbNo Then
                                Exit Sub
                            End If
                         End If
                         Dim FFile As Integer, ReadedData As String
                         FFile = FreeFile
                         SetIndecator "Openning File..."
                         Open FileName For Binary Access Read As #FFile
                            'Read the file
                             ReadedData = String(FileLen(FileName), vbNullChar)
                             SetIndecator "Readding data..."
                             Get #1, , ReadedData
                         Close #FFile
                         SetIndecator "Showing data..."
                         SetString ReadedData, FileName
                         SaveFlag = False 'Cancel Saving after setting the readed data
                         SetIndecator "Ready!"
                Else
                    MsgBox "Cann't Find This File!", vbExclamation, AppName
                End If
           Case 2 'Save
                If SaveFlag = True Then
                    If Len(FileName) > 0 And Mid$(FileName, 2, 1) = ":" Then 'FileName is set b4
                       'Mid$(FileName, 2, 1) = ":" >>> 'Complete file path
                        Kill FileName
                        Put_File_data FileName, Txt_Screen, 1
                        SaveFlag = False
                    Else
                        FileBrowser.CMD1.DefaultExt = FileName
                       'Down The popup the FileTypes Menu
                        Me.PopupMenu Menus.EditorFileTypes, , Buttons(2).Left, Buttons(2).Top + Buttons(2).Height + 10
                    End If
                End If
           Case 3 'Print
                 
           Case 4 'Cut
                 
           Case 5 'Copy
                 
           Case 6 'Paste
           
           Case 7 'Find
                 
           Case 8 'Replace
                 
           Case 9 'Goto Line #
                 
           Case 10 'Execute Code
                 Me.PopupMenu Menus.EditorFileTypes, , Buttons(Index).Left, Buttons(Index).Top + Buttons(Index).Height + 10
           Case 11 'About
                 MsgBox "Author : Black Guy!", vbInformation, AppName
           Case 12 'Unload Me
                 Me.Hide
           Case 13 'Change Font size & name
                 FileBrowser.CMD1.FontName = SCRFontName
                 FileBrowser.CMD1.FontSize = Txt_Screen.FontSize
                 FileBrowser.CMD1.FontBold = Txt_Screen.FontBold
                 FileBrowser.CMD1.FontItalic = Txt_Screen.FontItalic
                 FileBrowser.CMD1.ShowFont
                 Txt_Screen.FontName = FileBrowser.CMD1.FontName
                 Txt_Screen.FontSize = FileBrowser.CMD1.FontSize
                 SCRFontName = Txt_Screen.FontName
    End Select
Exit Sub
Failed:
    Select Case CurrentButton
           Case 2 'save
                MsgBox "An error occurs when trying to save the file" & vbCrLf & "Error Discription:" & err.Description, vbexa, AppName
    End Select
End Sub
Private Sub IsSaveActionNeeded()
    If SaveFlag = True Then
        If MsgBox("Current File Has Been Changed,Do You Want To Save The Changes!?", vbYesNo + vbExclamation, AppName) = vbYes Then
            Buttons_Click 2
        End If
    End If
End Sub
Public Sub FileTypesMenu(Index As Integer)
On Error GoTo Failed
    Dim FileExt As String
   'Indecate The File Type operations
    Select Case Index
           Case 0
                FileBrowser.CMD1.Filter = "Text Files(*.txt)|*.txt"
                FileExt = ".txt"
           Case 1
                FileBrowser.CMD1.Filter = "Data Files(*.dat)|*.dat"
                FileExt = ".dat"
           Case 2
                FileBrowser.CMD1.Filter = "Batch Files(*.bat)|*.bat"
                FileExt = ".bat"
           Case 3
                FileBrowser.CMD1.Filter = "JavaScript Files(*.js)|*.js"
                FileExt = ".js"
           Case 4
                FileBrowser.CMD1.Filter = "VBScript Files(*.vbs)|*.vbs"
                FileExt = ".vbs"
           Case 5
                FileBrowser.CMD1.Filter = "HTML Files(*.html)|*.html"
                FileExt = ".html"
           Case 6
                FileBrowser.CMD1.Filter = "Reg Files(*.reg)|*.reg"
                FileExt = ".reg"
           Case 7
                FileBrowser.CMD1.Filter = "Handle-X Script Files(*.hxs)|*.hxs"
                FileExt = ".hxs"
    End Select
   'Current action operations
    Select Case CurrentButton
           Case 1 'Open
                
           Case 2 'Save
               'Check Alredy Open File
                FileBrowser.CMD1.CancelError = False
                FileBrowser.CMD1.FileName = FileName
                FileBrowser.CMD1.ShowSave
                FileName = FileBrowser.CMD1.FileName
                If Len(Trim$(FileName)) > 0 Then
                    If CStr(CBool(PathFileExists(FileName))) = True Then
                            If MsgBox("File is already existed,Do you want to replace it?", vbExclamation + vbYesNo, AppName) = vbYes Then
                                'Start Save
                                 Kill FileName
                                 GoTo Start_Save
                            End If
                    Else
                            'Start save
                             GoTo Start_Save
                    End If
                End If
Start_Save:
                Put_File_data FileName, Txt_Screen, 1
                SaveFlag = False
           Case 12 'Execute Code
                
    End Select
    Exit Sub
Failed:
    Select Case CurrentButton
           Case 2 'save
                MsgBox "An error occurs when trying to save the file" & vbCrLf & "Error Discription:" & err.Description, vbexa, AppName
    End Select
End Sub
Private Sub SetIndecator(Str As String)
    Indicator = Str
    DoEvents
End Sub
Private Sub Buttons_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BorderStyle = 1
End Sub
Private Sub Buttons_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Buttons(Index).BorderStyle = 0
End Sub
Private Sub Control_Box_Click(Index As Integer)
Select Case Index
    Case 0 'Hide
        IsSaveActionNeeded 'Check if current file changed and needed to saved b4 exitting
        Set Editor = Nothing
        Unload Me
    Case 1 'Minimize
        Me.WindowState = 1
    Case 2 'Help
        MsgBox "Help"
    Case 3 'Maximize
        TiTle_DblClick
End Select
End Sub
Private Sub Control_Box_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbBlack
    Control_Box(Index).BackColor = vbWhite
End Sub
Private Sub Control_Box_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    Control_Box(Index).ForeColor = vbWhite
    Control_Box(Index).BackColor = vbBlack
End Sub
Private Sub Form_Load()
    Dim i As Integer
   'Load New Document
    Buttons_Click 0
    SCRFontName = Txt_Screen.FontName
   'Initial The Ratio of the The Resizable Elements in the form
    TiTle.Tag = Me.Width - TiTle.Width
    For i = 0 To Control_Box.UBound
        Control_Box(i).Tag = Me.Width - Control_Box(i).Left
    Next i
    Line1(8).Tag = Me.Width - Line1(8).X1
    Line2(0).Tag = Me.Width - Line2(0).X1
    Txt_Screen.Tag = Me.Width - Txt_Screen.Width
    Picture1.Tag = Me.Width - Picture1.Left
    Line1(4).Tag = Me.Height - Txt_Screen.Height 'Store The Height Ratio in the line tag :)
    Line2(1).Tag = Me.Height - Line2(1).Y2
    Line1(1).Tag = Me.Height - Line1(1).Y1
    Line1(5).Tag = Me.Height - Line2(0).Y2
End Sub
Private Sub Form_Resize()
     On Error Resume Next
    'The Follow Code Support The Resizment Of The Elements Inside The Form
     Dim NewWidth As Integer
     NewWidth = Me.Width
     TiTle.Width = NewWidth - TiTle.Tag
     For i = 0 To Control_Box.UBound
         Control_Box(i).Left = NewWidth - Control_Box(i).Tag
     Next i
     Txt_Screen.Width = NewWidth - Txt_Screen.Tag
     Txt_Screen.Height = Me.Height - Line1(4).Tag
     Line1(8).X1 = Me.Width - Line1(8).Tag
     Line1(8).X2 = Line1(8).X1
     If AsOfResize = False Then
        AsOfResize = True
        Picture1_MouseUp 1, 1, 1, 1
     End If
End Sub
Private Sub Picture1_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    OldW = X
    OldH = Y
    AsOfResize = True
   'Hide The Lines Witch Needed To Be Resized Hidden
    Line1(0).Visible = False
    Line1(1).Visible = False
    Line1(2).Visible = False
    Line1(3).Visible = False
    Line2(0).Visible = False
    Line2(1).Visible = False
End Sub
Private Sub Picture1_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    On Error Resume Next
    If AsOfResize = True Then
        If (Me.Width + (X - OldW)) > 2000 Then
            Me.Width = Me.Width + (X - OldW)
            OldW = X
        End If
        If (Me.Height + (Y - OldH)) > 1200 Then
            Me.Height = Me.Height + (Y - OldH)
            OldH = Y
        End If
    End If
End Sub
Private Sub Picture1_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
If AsOfResize = True Then
    AsOfResize = False
    Picture1.Left = (Txt_Screen.Width - Picture1.Width) + Txt_Screen.Left
    Picture1.Top = (Txt_Screen.Height - Picture1.Height) + Txt_Screen.Top
    Line2(0).X1 = Me.Width - Line2(0).Tag
    Line2(0).X2 = Me.Width - Line2(0).Tag
    Line1(2).X2 = Line2(0).X1 - 10
    Line1(3).X2 = Line1(2).X2
    Line1(0).X2 = Line1(2).X2
    Line1(1).X2 = Line1(2).X2
    Line2(1).Y2 = Me.Height - Line2(1).Tag
    Line1(1).Y1 = Me.Height - Line1(1).Tag
    Line1(1).Y2 = Line1(1).Y1
    Line2(0).Y2 = Me.Height - Line1(5).Tag
   'Show The Lines Witch Needed To Be Resized Hidden
    Line1(0).Visible = True
    Line1(1).Visible = True
    Line1(2).Visible = True
    Line1(3).Visible = True
    Line2(0).Visible = True
    Line2(1).Visible = True
End If
End Sub
Private Sub TiTle_DblClick()
  If Me.WindowState <> 2 Then
   'Maximize
    Me.WindowState = 2
    AsOfResize = True
    Picture1_MouseUp 1, 1, 1, 1
    Control_Box(3).ToolTipText = "Restore" 'Maximize Control Box Processing
    Control_Box(3) = "R"
  Else
   'Restore
    Me.WindowState = 0
    AsOfResize = True
    Picture1_MouseUp 1, 1, 1, 1
    Control_Box(3).ToolTipText = "Maximize" 'Maximize Control Box Processing
    Control_Box(3) = "M"
  End If
End Sub
Private Sub TiTle_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
'Operate the drag and drop of the main form
  b = X
  C = Y
  a = True
End Sub
Private Sub TiTle_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    'Operate the drag and drop of the main form
    On Error Resume Next
    If a Then
        Me.Move Left + (X - b), Top + (Y - C)
    End If
End Sub
Private Sub TiTle_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  'Operate the drag and drop of the main form
   a = False
End Sub
Public Function SetString(Str As String, Optional STitle = "Untitled") As Boolean
    'Check New Data to save b4 set the new data
     IsSaveActionNeeded
    'Check If null Char
     Str = Replace(Str, Chr$(0), " ")
     On Error GoTo Failed
     Me.Hide
    'Add The Title First
     TiTle = MyTitle & " [" & STitle & "]"
    'Set The Default File Name
     FileName = STitle
    'Set The Text
     Txt_Screen = Str
     SetString = True
     Me.Show
     Exit Function
Failed:
     SetString = False
End Function
Private Sub Txt_Screen_Change()
    SaveFlag = True
End Sub
