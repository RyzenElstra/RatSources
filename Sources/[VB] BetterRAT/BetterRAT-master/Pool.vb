'Creator: Aeonhack
'Date: 5/01/2011 (roughly)
'Site: www.elitevs.net
'Version: 1.4
'Credits to Vorfin for the original concept.

Imports System.Drawing.Drawing2D
Imports System.ComponentModel

MustInherit Class ThemeControl
    Inherits Control

#Region " Initialization "

    Protected G As Graphics, B As Bitmap
    Sub New()
        SetStyle(DirectCast(139270, ControlStyles), True)
        B = New Bitmap(1, 1)
        G = Graphics.FromImage(B)
    End Sub

    Sub AllowTransparent()
        SetStyle(ControlStyles.Opaque, False)
        SetStyle(ControlStyles.SupportsTransparentBackColor, True)
    End Sub

    Overrides Property Text As String
        Get
            Return MyBase.Text
        End Get
        Set(ByVal v As String)
            MyBase.Text = v
            Invalidate()
        End Set
    End Property
#End Region

#Region " Mouse Handling "

    Protected Enum State As Byte
        MouseNone = 0
        MouseOver = 1
        MouseDown = 2
    End Enum

    Protected MouseState As State
    Protected Overrides Sub OnMouseLeave(ByVal e As EventArgs)
        ChangeMouseState(State.MouseNone)
        MyBase.OnMouseLeave(e)
    End Sub
    Protected Overrides Sub OnMouseEnter(ByVal e As EventArgs)
        ChangeMouseState(State.MouseOver)
        MyBase.OnMouseEnter(e)
    End Sub
    Protected Overrides Sub OnMouseUp(ByVal e As MouseEventArgs)
        ChangeMouseState(State.MouseOver)
        MyBase.OnMouseUp(e)
    End Sub
    Protected Overrides Sub OnMouseDown(ByVal e As MouseEventArgs)
        If e.Button = MouseButtons.Left Then ChangeMouseState(State.MouseDown)
        MyBase.OnMouseDown(e)
    End Sub

    Private Sub ChangeMouseState(ByVal e As State)
        MouseState = e
        Invalidate()
    End Sub

#End Region

#Region " Convienence "

    MustOverride Sub PaintHook()
    Protected NotOverridable Overrides Sub OnPaint(ByVal e As PaintEventArgs)
        If Width = 0 OrElse Height = 0 Then Return
        PaintHook()
        e.Graphics.DrawImage(B, 0, 0)
    End Sub

    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If Not Width = 0 AndAlso Not Height = 0 Then
            B = New Bitmap(Width, Height)
            G = Graphics.FromImage(B)
            Invalidate()
        End If
        MyBase.OnSizeChanged(e)
    End Sub

    Private _NoRounding As Boolean
    Property NoRounding() As Boolean
        Get
            Return _NoRounding
        End Get
        Set(ByVal v As Boolean)
            _NoRounding = v
            Invalidate()
        End Set
    End Property

    Private _Image As Image
    Property Image() As Image
        Get
            Return _Image
        End Get
        Set(ByVal value As Image)
            _Image = value
            Invalidate()
        End Set
    End Property
    ReadOnly Property ImageWidth() As Integer
        Get
            If _Image Is Nothing Then Return 0
            Return _Image.Width
        End Get
    End Property
    ReadOnly Property ImageTop() As Integer
        Get
            If _Image Is Nothing Then Return 0
            Return Height \ 2 - _Image.Height \ 2
        End Get
    End Property

    Private _Size As Size
    Private _Rectangle As Rectangle
    Private _Gradient As LinearGradientBrush
    Private _Brush As SolidBrush

    Protected Sub DrawCorners(ByVal c As Color, ByVal rect As Rectangle)
        If _NoRounding Then Return

        B.SetPixel(rect.X, rect.Y, c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y, c)
        B.SetPixel(rect.X, rect.Y + (rect.Height - 1), c)
        B.SetPixel(rect.X + (rect.Width - 1), rect.Y + (rect.Height - 1), c)
    End Sub

    Protected Sub DrawBorders(ByVal p1 As Pen, ByVal p2 As Pen, ByVal rect As Rectangle)
        G.DrawRectangle(p1, rect.X, rect.Y, rect.Width - 1, rect.Height - 1)
        G.DrawRectangle(p2, rect.X + 1, rect.Y + 1, rect.Width - 3, rect.Height - 3)
    End Sub

    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer)
        DrawText(a, c, x, 0)
    End Sub
    Protected Sub DrawText(ByVal a As HorizontalAlignment, ByVal c As Color, ByVal x As Integer, ByVal y As Integer)
        If String.IsNullOrEmpty(Text) Then Return
        _Size = G.MeasureString(Text, Font).ToSize
        _Brush = New SolidBrush(c)

        Select Case a
            Case HorizontalAlignment.Left
                G.DrawString(Text, Font, _Brush, x, Height \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawString(Text, Font, _Brush, Width - _Size.Width - x, Height \ 2 - _Size.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawString(Text, Font, _Brush, Width \ 2 - _Size.Width \ 2 + x, Height \ 2 - _Size.Height \ 2 + y)
        End Select
    End Sub

    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer)
        DrawIcon(a, x, 0)
    End Sub
    Protected Sub DrawIcon(ByVal a As HorizontalAlignment, ByVal x As Integer, ByVal y As Integer)
        If _Image Is Nothing Then Return
        Select Case a
            Case HorizontalAlignment.Left
                G.DrawImage(_Image, x, Height \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Right
                G.DrawImage(_Image, Width - _Image.Width - x, Height \ 2 - _Image.Height \ 2 + y)
            Case HorizontalAlignment.Center
                G.DrawImage(_Image, Width \ 2 - _Image.Width \ 2, Height \ 2 - _Image.Height \ 2)
        End Select
    End Sub

    Protected Sub DrawGradient(ByVal c1 As Color, ByVal c2 As Color, ByVal x As Integer, ByVal y As Integer, ByVal width As Integer, ByVal height As Integer, ByVal angle As Single)
        _Rectangle = New Rectangle(x, y, width, height)
        _Gradient = New LinearGradientBrush(_Rectangle, c1, c2, angle)
        G.FillRectangle(_Gradient, _Rectangle)
    End Sub
#End Region

End Class

<DefaultEvent("CharacterSelection")>
Class RandomPool
    Inherits ThemeControl

    Private GO As Graphics, _Size As Size
    Event CharacterSelection(ByVal s As Object, ByVal c As Char)

    Sub New()
        GO = Graphics.FromHwndInternal(Handle)
    End Sub

    Private _Range As String = "0123456789!§$%&/()=?*+~#'-_<>|^°ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    Property Range() As String
        Get
            Return _Range
        End Get
        Set(ByVal v As String)
            _Range = v
            UpdateSize()
        End Set
    End Property

    Private _RangePadding As Integer = 2
    Public Property RangePadding() As Integer
        Get
            Return _RangePadding
        End Get
        Set(ByVal v As Integer)
            _RangePadding = v
            UpdateSize()
        End Set
    End Property

    Overrides Property Font As Font
        Get
            Return MyBase.Font
        End Get
        Set(ByVal v As Font)
            MyBase.Font = v
            UpdateSize()
        End Set
    End Property

    Private _Brush As Brush = SystemBrushes.ControlText
    Overrides Property ForeColor As Color
        Get
            Return MyBase.ForeColor
        End Get
        Set(ByVal v As Color)
            MyBase.ForeColor = v
            _Brush = New SolidBrush(v)
            Invalidate()
        End Set
    End Property

    Private Count As Integer
    Private Sub UpdateSize()
        _Size = New Size(0, 0)

        Dim T As Size
        For I As Integer = 0 To _Range.Length - 1
            T = GO.MeasureString(_Range(I), Font).ToSize()
            T.Width += _RangePadding
            T.Height += _RangePadding

            If T.Height > _Size.Height Then _Size.Height = T.Height
            If T.Width > _Size.Width Then _Size.Width = T.Width
        Next

        Randomize()
    End Sub

    Private Index1, Index2 As Integer, Items As Char()
    Protected Overrides Sub OnMouseMove(ByVal e As MouseEventArgs)
        Index1 = GetIndex(e.X, e.Y)
        If Index1 = Index2 Then Return

        RaiseEvent CharacterSelection(Me, Items(Index1))

        Randomize(Index1 - Count)
        Randomize(Index1 - 1)
        Randomize(Index1)
        Randomize(Index1 + 1)
        Randomize(Index1 + Count)

        Index2 = Index1
        Invalidate()
    End Sub
    Protected Overrides Sub OnSizeChanged(ByVal e As EventArgs)
        If _Size.Width = 0 Then UpdateSize() Else Randomize()
        MyBase.OnSizeChanged(e)
    End Sub

    Overrides Sub PaintHook()
        G.Clear(BackColor)

        For X As Integer = 0 To Width - 1 Step _Size.Width
            For Y As Integer = 0 To Height - 1 Step _Size.Height
                G.DrawString(Items(GetIndex(X, Y)), Font, _Brush, X, Y)
            Next
        Next

    End Sub

    Private Function GetIndex(ByVal x As Integer, ByVal y As Integer) As Integer
        Return (y \ _Size.Height) * Count + (x \ _Size.Width)
    End Function

    Private RN As Random
    Private Sub Randomize()
        Count = CInt(Math.Ceiling(Width / _Size.Width))

        RN = New Random(Guid.NewGuid.GetHashCode)
        Items = New Char(CInt(Math.Ceiling(Width / _Size.Width) * Math.Ceiling(Height / _Size.Height)) - 1) {}

        For I As Integer = 0 To Items.Length - 1
            Items(I) = _Range(RN.Next(_Range.Length))
        Next

        Invalidate()
    End Sub
    Private Sub Randomize(ByVal index As Integer)
        If index > -1 AndAlso index < Items.Length Then Items(index) = _Range(RN.Next(_Range.Length))
    End Sub

End Class