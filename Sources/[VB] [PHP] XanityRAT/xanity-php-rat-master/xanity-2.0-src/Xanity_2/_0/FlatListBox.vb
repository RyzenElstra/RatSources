Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatListBox
        Inherits Control
        ' Methods
        Public Sub New()
            FlatListBox.__ENCAddToList(Me)
            Me.ListBx = New ListBox
            Me._items = New String() { "" }
            Me.BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._SelectedColor = Helpers._FlatColor
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.ListBx.DrawMode = DrawMode.OwnerDrawFixed
            Me.ListBx.ScrollAlwaysVisible = False
            Me.ListBx.HorizontalScrollbar = False
            Me.ListBx.BorderStyle = BorderStyle.None
            Me.ListBx.BackColor = Me.BaseColor
            Me.ListBx.ForeColor = Color.White
            Dim point2 As New Point(3, 3)
            Me.ListBx.Location = point2
            Me.ListBx.Font = New Font("Segoe UI", 8!)
            Me.ListBx.ItemHeight = 20
            Me.ListBx.Items.Clear
            Me.ListBx.IntegralHeight = False
            Dim size2 As New Size(&H83, &H65)
            Me.Size = size2
            Me.BackColor = Me.BaseColor
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatListBox.__ENCList
            SyncLock list
                If (FlatListBox.__ENCList.Count = FlatListBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatListBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatListBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatListBox.__ENCList.Item(index) = FlatListBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatListBox.__ENCList.RemoveRange(index, (FlatListBox.__ENCList.Count - index))
                    FlatListBox.__ENCList.Capacity = FlatListBox.__ENCList.Count
                End If
                FlatListBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Public Sub AddItem(ByVal item As Object)
            Me.ListBx.Items.Remove("")
            Me.ListBx.Items.Add(RuntimeHelpers.GetObjectValue(item))
        End Sub

        Public Sub AddRange(ByVal items As Object())
            Me.ListBx.Items.Remove("")
            Me.ListBx.Items.AddRange(items)
        End Sub

        Public Sub Clear()
            Me.ListBx.Items.Clear
        End Sub

        Public Sub ClearSelected()
            Dim i As Integer = (Me.ListBx.SelectedItems.Count - 1)
            Do While (i >= 0)
                Me.ListBx.Items.Remove(RuntimeHelpers.GetObjectValue(Me.ListBx.SelectedItems.Item(i)))
                i = (i + -1)
            Loop
        End Sub

        Public Sub Drawitem(ByVal sender As Object, ByVal e As DrawItemEventArgs)
            If (e.Index >= 0) Then
                e.DrawBackground
                e.DrawFocusRectangle
                e.Graphics.SmoothingMode = SmoothingMode.HighQuality
                e.Graphics.PixelOffsetMode = PixelOffsetMode.HighQuality
                e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
                e.Graphics.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
                If (Strings.InStr(e.State.ToString, "Selected,", CompareMethod.Binary) > 0) Then
                    Dim rect As New Rectangle(e.Bounds.X, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height)
                    e.Graphics.FillRectangle(New SolidBrush(Me._SelectedColor), rect)
                    e.Graphics.DrawString((" " & Me.ListBx.Items.Item(e.Index).ToString), New Font("Segoe UI", 8!), Brushes.White, CSng(e.Bounds.X), CSng((e.Bounds.Y + 2)))
                Else
                    Dim rectangle As New Rectangle(e.Bounds.X, e.Bounds.Y, e.Bounds.Width, e.Bounds.Height)
                    e.Graphics.FillRectangle(New SolidBrush(Color.FromArgb(&H33, &H35, &H37)), rectangle)
                    e.Graphics.DrawString((" " & Me.ListBx.Items.Item(e.Index).ToString), New Font("Segoe UI", 8!), Brushes.White, CSng(e.Bounds.X), CSng((e.Bounds.Y + 2)))
                End If
                e.Graphics.Dispose
            End If
        End Sub

        Protected Overrides Sub OnCreateControl()
            MyBase.OnCreateControl
            If Not Me.Controls.Contains(Me.ListBx) Then
                Me.Controls.Add(Me.ListBx)
            End If
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Dim rect As New Rectangle(0, 0, Me.Width, Me.Height)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Dim size2 As New Size((Me.Width - 6), (Me.Height - 2))
            Me.ListBx.Size = size2
            g.FillRectangle(New SolidBrush(Me.BaseColor), rect)
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub


        ' Properties
        <Category("Options")> _
        Public Property items As String()
            Get
                Return Me._items
            End Get
            Set(ByVal value As String())
                Me._items = value
                Me.ListBx.Items.Clear
                Me.ListBx.Items.AddRange(value)
                Me.Invalidate
            End Set
        End Property

        Private Overridable Property ListBx As ListBox
            <DebuggerNonUserCode> _
            Get
                Return Me._ListBx
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As ListBox)
                Dim handler As DrawItemEventHandler = New DrawItemEventHandler(AddressOf Me.Drawitem)
                If (Not Me._ListBx Is Nothing) Then
                    RemoveHandler Me._ListBx.DrawItem, handler
                End If
                Me._ListBx = value
                If (Not Me._ListBx Is Nothing) Then
                    AddHandler Me._ListBx.DrawItem, handler
                End If
            End Set
        End Property

        <Category("Colors")> _
        Public Property SelectedColor As Color
            Get
                Return Me._SelectedColor
            End Get
            Set(ByVal value As Color)
                Me._SelectedColor = value
            End Set
        End Property

        Public ReadOnly Property SelectedIndex As Integer
            Get
                Return Me.ListBx.SelectedIndex
            End Get
        End Property

        Public ReadOnly Property SelectedItem As String
            Get
                Return Conversions.ToString(Me.ListBx.SelectedItem)
            End Get
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _items As String()
        <AccessedThroughProperty("ListBx")> _
        Private _ListBx As ListBox
        Private _SelectedColor As Color
        Private BaseColor As Color
    End Class
End Namespace

