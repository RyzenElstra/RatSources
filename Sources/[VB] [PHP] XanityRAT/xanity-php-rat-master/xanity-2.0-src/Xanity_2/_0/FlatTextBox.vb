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
    <DefaultEvent("TextChanged")> _
    Friend Class FlatTextBox
        Inherits Control
        ' Methods
        Public Sub New()
            FlatTextBox.__ENCAddToList(Me)
            Me.State = MouseState.None
            Me._TextAlign = HorizontalAlignment.Left
            Me._MaxLength = &H7FFF
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._TextColor = Color.FromArgb(&HC0, &HC0, &HC0)
            Me._BorderColor = Helpers._FlatColor
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.SupportsTransparentBackColor Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint)))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.Transparent
            Me.TB = New TextBox
            Me.TB.Font = New Font("Segoe UI", 10!)
            Me.TB.Text = Me.Text
            Me.TB.BackColor = Me._BaseColor
            Me.TB.ForeColor = Me._TextColor
            Me.TB.MaxLength = Me._MaxLength
            Me.TB.Multiline = Me._Multiline
            Me.TB.ReadOnly = Me._ReadOnly
            Me.TB.UseSystemPasswordChar = Me._UseSystemPasswordChar
            Me.TB.BorderStyle = BorderStyle.None
            Dim point2 As New Point(5, 5)
            Me.TB.Location = point2
            Me.TB.Width = (Me.Width - 10)
            Me.TB.Cursor = Cursors.IBeam
            If Me._Multiline Then
                Me.TB.Height = (Me.Height - 11)
            Else
                Me.Height = (Me.TB.Height + 11)
            End If
            AddHandler Me.TB.TextChanged, New EventHandler(AddressOf Me.OnBaseTextChanged)
            AddHandler Me.TB.KeyDown, New KeyEventHandler(AddressOf Me.OnBaseKeyDown)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatTextBox.__ENCList
            SyncLock list
                If (FlatTextBox.__ENCList.Count = FlatTextBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatTextBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatTextBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatTextBox.__ENCList.Item(index) = FlatTextBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatTextBox.__ENCList.RemoveRange(index, (FlatTextBox.__ENCList.Count - index))
                    FlatTextBox.__ENCList.Capacity = FlatTextBox.__ENCList.Count
                End If
                FlatTextBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Private Sub OnBaseKeyDown(ByVal sender As Object, ByVal e As KeyEventArgs)
            If (If((Not e.Control OrElse (e.KeyCode <> Keys.A)), 0, 1) <> 0) Then
                Me.TB.SelectAll
                e.SuppressKeyPress = True
            End If
            If (If((Not e.Control OrElse (e.KeyCode <> Keys.C)), 0, 1) <> 0) Then
                Me.TB.Copy
                e.SuppressKeyPress = True
            End If
        End Sub

        Private Sub OnBaseTextChanged(ByVal sender As Object, ByVal e As EventArgs)
            Me.Text = Me.TB.Text
        End Sub

        Protected Overrides Sub OnCreateControl()
            MyBase.OnCreateControl
            If Not Me.Controls.Contains(Me.TB) Then
                Me.Controls.Add(Me.TB)
            End If
        End Sub

        Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
            MyBase.OnMouseDown(e)
            Me.State = MouseState.Down
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
            MyBase.OnMouseEnter(e)
            Me.State = MouseState.Over
            Me.TB.Focus
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
            MyBase.OnMouseLeave(e)
            Me.State = MouseState.None
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
            MyBase.OnMouseUp(e)
            Me.State = MouseState.Over
            Me.TB.Focus
            Me.Invalidate
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Me.TB.BackColor = Me._BaseColor
            Me.TB.ForeColor = Me._TextColor
            g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            Dim point2 As New Point(5, 5)
            Me.TB.Location = point2
            Me.TB.Width = (Me.Width - 10)
            If Me._Multiline Then
                Me.TB.Height = (Me.Height - 11)
            Else
                Me.Height = (Me.TB.Height + 11)
            End If
            MyBase.OnResize(e)
        End Sub


        ' Properties
        <Category("Options")> _
        Public Overrides Property Font As Font
            Get
                Return MyBase.Font
            End Get
            Set(ByVal value As Font)
                MyBase.Font = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.Font = value
                    Dim point2 As New Point(3, 5)
                    Me.TB.Location = point2
                    Me.TB.Width = (Me.Width - 6)
                    If Not Me._Multiline Then
                        Me.Height = (Me.TB.Height + 11)
                    End If
                End If
            End Set
        End Property

        Public Overrides Property ForeColor As Color
            Get
                Return Me._TextColor
            End Get
            Set(ByVal value As Color)
                Me._TextColor = value
            End Set
        End Property

        <Category("Options")> _
        Public Property MaxLength As Integer
            Get
                Return Me._MaxLength
            End Get
            Set(ByVal value As Integer)
                Me._MaxLength = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.MaxLength = value
                End If
            End Set
        End Property

        <Category("Options")> _
        Public Property Multiline As Boolean
            Get
                Return Me._Multiline
            End Get
            Set(ByVal value As Boolean)
                Me._Multiline = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.Multiline = value
                    If value Then
                        Me.TB.Height = (Me.Height - 11)
                    Else
                        Me.Height = (Me.TB.Height + 11)
                    End If
                End If
            End Set
        End Property

        <Category("Options")> _
        Public Property [ReadOnly] As Boolean
            Get
                Return Me._ReadOnly
            End Get
            Set(ByVal value As Boolean)
                Me._ReadOnly = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.ReadOnly = value
                End If
            End Set
        End Property

        Private Overridable Property TB As TextBox
            <DebuggerNonUserCode> _
            Get
                Return Me._TB
            End Get
            <MethodImpl(MethodImplOptions.Synchronized), DebuggerNonUserCode> _
            Set(ByVal value As TextBox)
                Me._TB = value
            End Set
        End Property

        <Category("Options")> _
        Public Overrides Property [Text] As String
            Get
                Return MyBase.Text
            End Get
            Set(ByVal value As String)
                MyBase.Text = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.Text = value
                End If
            End Set
        End Property

        <Category("Options")> _
        Public Property TextAlign As HorizontalAlignment
            Get
                Return Me._TextAlign
            End Get
            Set(ByVal value As HorizontalAlignment)
                Me._TextAlign = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.TextAlign = value
                End If
            End Set
        End Property

        <Category("Colors")> _
        Public Property TextColor As Color
            Get
                Return Me._TextColor
            End Get
            Set(ByVal value As Color)
                Me._TextColor = value
            End Set
        End Property

        <Category("Options")> _
        Public Property UseSystemPasswordChar As Boolean
            Get
                Return Me._UseSystemPasswordChar
            End Get
            Set(ByVal value As Boolean)
                Me._UseSystemPasswordChar = value
                If (Not Me.TB Is Nothing) Then
                    Me.TB.UseSystemPasswordChar = value
                End If
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _BorderColor As Color
        Private _MaxLength As Integer
        Private _Multiline As Boolean
        Private _ReadOnly As Boolean
        <AccessedThroughProperty("TB")> _
        Private _TB As TextBox
        Private _TextAlign As HorizontalAlignment
        Private _TextColor As Color
        Private _UseSystemPasswordChar As Boolean
        Private H As Integer
        Private State As MouseState
        Private W As Integer
    End Class
End Namespace

