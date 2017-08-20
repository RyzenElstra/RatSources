Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Threading
Imports System.Windows.Forms

Public Class LV
    Inherits ListView
    ' Methods
    Public Sub New()
        Dim lv As LV = Me
        AddHandler MyBase.ColumnClick, New ColumnClickEventHandler(AddressOf lv.cc)
        Me.AllowDrop = False
        Me.Font = New Font("arial", 8.0!, FontStyle.Bold)
        Me.Dock = DockStyle.Fill
        Me.FullRowSelect = True
        Me.View = View.Details
        Me.OwnerDraw = True
        Me.GridLines = False
        Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or ControlStyles.AllPaintingInWmPaint), True)
        Me.SetStyle(ControlStyles.EnableNotifyMessage, True)
    End Sub

    Public Sub cc(ByVal sender As Object, ByVal e As ColumnClickEventArgs)
        Dim lv As LV = Me
        Monitor.Enter(lv)
        Try
            Dim ascending As SortOrder
            Dim arguments As Object() = New Object() {e.Column}
            Dim header As ColumnHeader = DirectCast(NewLateBinding.LateGet(RuntimeHelpers.GetObjectValue(sender), Nothing, "Columns", arguments, Nothing, Nothing, Nothing), ColumnHeader)
            If (Not Me.m_SortingColumn Is Nothing) Then
                If Not header.Equals(Me.m_SortingColumn) Then
                    ascending = SortOrder.Ascending
                Else
                    ascending = If(Not Me.m_SortingColumn.Text.StartsWith("+"), SortOrder.Ascending, SortOrder.Descending)
                End If
                Me.m_SortingColumn.Text = Me.m_SortingColumn.Text.Substring(1)
            Else
                ascending = SortOrder.Ascending
            End If
            Me.m_SortingColumn = header
            If (ascending <> SortOrder.Ascending) Then
                Me.m_SortingColumn.Text = ("-" & Me.m_SortingColumn.Text)
            Else
                Me.m_SortingColumn.Text = ("+" & Me.m_SortingColumn.Text)
            End If
            If (Not sender Is Nothing) Then
                arguments = New Object() {New clsListviewSorter(e.Column, ascending)}
                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(sender), Nothing, "ListViewItemSorter", arguments, Nothing, Nothing)
                NewLateBinding.LateCall(RuntimeHelpers.GetObjectValue(sender), Nothing, "Sort", New Object(1 - 1) {}, Nothing, Nothing, Nothing, True)
                arguments = New Object() {Nothing}
                NewLateBinding.LateSet(RuntimeHelpers.GetObjectValue(sender), Nothing, "ListViewItemSorter", arguments, Nothing, Nothing)
            End If
        Catch exception1 As Exception
        Finally
            Monitor.Exit(lv)
        End Try
    End Sub

    Public Sub FX()
        If (Me.Items.Count <> 0) Then
            Me.AutoResizeColumns(ColumnHeaderAutoResizeStyle.HeaderSize)
        Else
            Me.Columns.Item((Me.Columns.Count - 1)).AutoResize(ColumnHeaderAutoResizeStyle.HeaderSize)
        End If
    End Sub

    Protected Overrides Sub OnColumnWidthChanged(ByVal e As ColumnWidthChangedEventArgs)
        MyBase.OnColumnWidthChanged(e)
    End Sub

    Protected Overrides Sub OnDrawColumnHeader(ByVal e As DrawListViewColumnHeaderEventArgs)
        Dim enumerator As IEnumerator = Nothing
        Dim x As Integer = 0
        Dim graphics2 As Graphics = e.Graphics
        Dim alpha As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.A * 0.1!)))))
        Dim red As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.R * 0.1!)))))
        Dim green As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.G * 0.1!)))))
        Dim backColor As Color = Me.BackColor
        Dim brush As Brush = New Pen(Drawing.Color.FromArgb(alpha, red, green, CInt(Math.Round(Math.Round(CDbl((backColor.B * 0.1!))))))).Brush
        Dim width As Integer = e.Header.ListView.Width
        Dim bounds As Rectangle = e.Bounds
        graphics2.FillRectangle(brush, 0, 0, width, CInt(Math.Round(Math.Round(CDbl((CDbl(bounds.Height) / 2))))))
        Dim graphics As Graphics = e.Graphics
        Dim num4 As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.A * 0.5!)))))
        Dim num5 As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.R * 0.5!)))))
        Dim num6 As Integer = CInt(Math.Round(Math.Round(CDbl((Me.BackColor.G * 0.5!)))))
        Dim color As Color = Me.BackColor
        Dim brush2 As Brush = New Pen(color.FromArgb(num4, num5, num6, CInt(Math.Round(Math.Round(CDbl((color.B * 0.5!))))))).Brush
        Dim y As Integer = CInt(Math.Round(Math.Round(CDbl((CDbl(e.Bounds.Height) / 2)))))
        Dim num10 As Integer = e.Header.ListView.Width
        Dim rectangle2 As Rectangle = e.Bounds
        graphics.FillRectangle(brush2, 0, y, num10, CInt(Math.Round(Math.Round(CDbl((CDbl(rectangle2.Height) / 2))))))
        Try
            enumerator = Me.Columns.GetEnumerator
            Do While enumerator.MoveNext
                Dim current As ColumnHeader = DirectCast(enumerator.Current, ColumnHeader)
                Dim num14 As Integer = e.Bounds.Y
                Dim num11 As Integer = current.Width
                bounds = e.Bounds
                Dim layoutRectangle As New Rectangle(x, num14, num11, bounds.Height)
                Dim format As New StringFormat With { _
                    .FormatFlags = StringFormatFlags.LineLimit, _
                    .Trimming = StringTrimming.Character, _
                    .Alignment = StringAlignment.Center _
                }
                e.Graphics.DrawString(current.Text, Me.Font, New Pen(Me.ForeColor).Brush, layoutRectangle, format)
                Dim graphics3 As Graphics = e.Graphics
                Dim pen As New Pen(Me.ForeColor)
                Dim num12 As Integer = (x + current.Width)
                Dim num15 As Integer = e.Bounds.Y
                Dim num13 As Integer = (x + current.Width)
                Dim num16 As Integer = e.Bounds.Y
                bounds = e.Bounds
                graphics3.DrawLine(pen, num12, num15, num13, (num16 + bounds.Height))
                x = (x + current.Width)
            Loop
        Finally
            If TypeOf enumerator Is IDisposable Then
                TryCast(enumerator, IDisposable).Dispose()
            End If
        End Try
        e.DrawDefault = False
        MyBase.OnDrawColumnHeader(e)
    End Sub

    Protected Overrides Sub OnDrawItem(ByVal e As DrawListViewItemEventArgs)
        e.DrawDefault = True
        MyBase.OnDrawItem(e)
    End Sub

    Protected Overrides Sub OnDrawSubItem(ByVal e As DrawListViewSubItemEventArgs)
        e.DrawDefault = True
        MyBase.OnDrawSubItem(e)
    End Sub

    Protected Overrides Sub OnNotifyMessage(ByVal m As Message)
        If (m.Msg <> 20) Then
            MyBase.OnNotifyMessage(m)
        End If
    End Sub


    ' Fields
    Private m_SortingColumn As ColumnHeader

    ' Nested Types
    Public Class clsListviewSorter
        Implements IComparer
        ' Methods
        Public Sub New(ByVal column_number As Integer, ByVal sort_order As SortOrder)
            Me.m_ColumnNumber = column_number
            Me.m_SortOrder = sort_order
        End Sub

        Public Function [Compare](ByVal x As Object, ByVal y As Object) As Integer Implements IComparer.Compare
            Dim item As ListViewItem = DirectCast(x, ListViewItem)
            Dim item2 As ListViewItem = DirectCast(y, ListViewItem)
            Dim expression As String = If((item.SubItems.Count > Me.m_ColumnNumber), item.SubItems.Item(Me.m_ColumnNumber).Text, "")
            Dim str2 As String = If((item2.SubItems.Count > Me.m_ColumnNumber), item2.SubItems.Item(Me.m_ColumnNumber).Text, "")
            If (Me.m_SortOrder = SortOrder.Ascending) Then
                If (Versioned.IsNumeric(expression) And Versioned.IsNumeric(str2)) Then
                    Return Conversion.Val(expression).CompareTo(Conversion.Val(str2))
                End If
                If Not (Information.IsDate(expression) And Information.IsDate(str2)) Then
                    Return String.Compare(expression, str2)
                End If
                Return DateTime.Parse(expression).CompareTo(DateTime.Parse(str2))
            End If
            If (Versioned.IsNumeric(expression) And Versioned.IsNumeric(str2)) Then
                Return Conversion.Val(str2).CompareTo(Conversion.Val(expression))
            End If
            If Not (Information.IsDate(expression) And Information.IsDate(str2)) Then
                Return String.Compare(str2, expression)
            End If
            Return DateTime.Parse(str2).CompareTo(DateTime.Parse(expression))
        End Function


        ' Fields
        Private m_ColumnNumber As Integer
        Private m_SortOrder As SortOrder
    End Class
End Class