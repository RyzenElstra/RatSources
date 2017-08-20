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
    Friend Class FlatProgressBar
        Inherits ProgressBar
        ' Methods
        Public Sub New()
            FlatProgressBar.__ENCAddToList(Me)
            Me._Value = 0
            Me._Maximum = 100
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._ProgressColor = Helpers._FlatColor
            Me._DarkerProgress = Color.FromArgb(&H17, &H94, &H5C)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Me.Height = &H2A
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatProgressBar.__ENCList
            SyncLock list
                If (FlatProgressBar.__ENCList.Count = FlatProgressBar.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatProgressBar.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatProgressBar.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatProgressBar.__ENCList.Item(index) = FlatProgressBar.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatProgressBar.__ENCList.RemoveRange(index, (FlatProgressBar.__ENCList.Count - index))
                    FlatProgressBar.__ENCList.Capacity = FlatProgressBar.__ENCList.Count
                End If
                FlatProgressBar.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub CreateHandle()
            MyBase.CreateHandle
            Me.Height = &H2A
        End Sub

        Public Sub Increment(ByVal Amount As Integer)
            Me.Value = (Me.Value + Amount)
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Dim rectangle3 As Rectangle
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim rect As New Rectangle(0, &H18, Me.W, Me.H)
            Dim path As New GraphicsPath
            Dim path2 As New GraphicsPath
            Dim path3 As New GraphicsPath
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            Dim num As Integer = CInt(Math.Round(CDbl(((CDbl(Me._Value) / CDbl(Me._Maximum)) * Me.Width))))
            Dim num2 As Integer = Me.Value
            If (num2 = 0) Then
                g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                rectangle3 = New Rectangle(0, &H18, (num - 1), (Me.H - 1))
                g.FillRectangle(New SolidBrush(Me._ProgressColor), rectangle3)
            ElseIf (num2 = 100) Then
                g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                rectangle3 = New Rectangle(0, &H18, (num - 1), (Me.H - 1))
                g.FillRectangle(New SolidBrush(Me._ProgressColor), rectangle3)
            Else
                g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                rectangle3 = New Rectangle(0, &H18, (num - 1), (Me.H - 1))
                path.AddRectangle(rectangle3)
                g.FillPath(New SolidBrush(Me._ProgressColor), path)
                Dim brush As New HatchBrush(HatchStyle.Plaid, Me._DarkerProgress, Me._ProgressColor)
                rectangle3 = New Rectangle(0, &H18, (num - 1), (Me.H - 1))
                g.FillRectangle(brush, rectangle3)
                Dim rectangle As New Rectangle((num - &H12), 0, &H22, &H10)
                path2 = Helpers.RoundRec(rectangle, 4)
                g.FillPath(New SolidBrush(Me._BaseColor), path2)
                path3 = Helpers.DrawArrow((num - 9), &H10, True)
                g.FillPath(New SolidBrush(Me._BaseColor), path3)
                rectangle3 = New Rectangle((num - 11), -2, Me.W, Me.H)
                g.DrawString(Conversions.ToString(Me.Value), New Font("Segoe UI", 10!), New SolidBrush(Me._ProgressColor), rectangle3, Helpers.NearSF)
            End If
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnResize(ByVal e As EventArgs)
            MyBase.OnResize(e)
            Me.Height = &H2A
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property DarkerProgress As Color
            Get
                Return Me._DarkerProgress
            End Get
            Set(ByVal value As Color)
                Me._DarkerProgress = value
            End Set
        End Property

        <Category("Control")> _
        Public Property Maximum As Integer
            Get
                Return Me._Maximum
            End Get
            Set(ByVal value As Integer)
                If (value < Me._Value) Then
                    Me._Value = value
                End If
                Me._Maximum = value
                Me.Invalidate
            End Set
        End Property

        <Category("Colors")> _
        Public Property ProgressColor As Color
            Get
                Return Me._ProgressColor
            End Get
            Set(ByVal value As Color)
                Me._ProgressColor = value
            End Set
        End Property

        <Category("Control")> _
        Public Property Value As Integer
            Get
                If (Me._Value = 0) Then
                    Return 0
                End If
                Return Me._Value
            End Get
            Set(ByVal value As Integer)
                If (value > Me._Maximum) Then
                    value = Me._Maximum
                    Me.Invalidate
                End If
                Me._Value = value
                Me.Invalidate
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _DarkerProgress As Color
        Private _Maximum As Integer
        Private _ProgressColor As Color
        Private _Value As Integer
        Private H As Integer
        Private W As Integer
    End Class
End Namespace

