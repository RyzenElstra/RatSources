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
    Friend Class FlatStatusBar
        Inherits StatusBar
        ' Methods
        Public Sub New()
            FlatStatusBar.__ENCAddToList(Me)
            Me._ShowTimeDate = False
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._TextColor = Color.White
            Me._RectColor = Helpers._FlatColor
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.Font = New Font("Segoe UI", 8!)
            Me.ForeColor = Color.White
            Dim size2 As New Size(Me.Width, 20)
            Me.Size = size2
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatStatusBar.__ENCList
            SyncLock list
                If (FlatStatusBar.__ENCList.Count = FlatStatusBar.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatStatusBar.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatStatusBar.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatStatusBar.__ENCList.Item(index) = FlatStatusBar.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatStatusBar.__ENCList.RemoveRange(index, (FlatStatusBar.__ENCList.Count - index))
                    FlatStatusBar.__ENCList.Capacity = FlatStatusBar.__ENCList.Count
                End If
                FlatStatusBar.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub CreateHandle()
            MyBase.CreateHandle
            Me.Dock = DockStyle.Bottom
        End Sub

        Public Function GetTimeDate() As String
            Return String.Concat(New String() { Conversions.ToString(DateTime.Now.Date), " ", Conversions.ToString(DateTime.Now.Hour), ":", Conversions.ToString(DateTime.Now.Minute) })
        End Function

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = Me.Width
            Me.H = Me.Height
            Dim rect As New Rectangle(0, 0, Me.W, Me.H)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BaseColor)
            g.FillRectangle(New SolidBrush(Me.BaseColor), rect)
            Dim layoutRectangle As New Rectangle(10, 4, Me.W, Me.H)
            g.DrawString(Me.Text, Me.Font, Brushes.White, layoutRectangle, Helpers.NearSF)
            layoutRectangle = New Rectangle(4, 4, 4, 14)
            g.FillRectangle(New SolidBrush(Me._RectColor), layoutRectangle)
            If Me.ShowTimeDate Then
                layoutRectangle = New Rectangle(-4, 2, Me.W, Me.H)
                Dim format As New StringFormat With { _
                    .Alignment = StringAlignment.Far, _
                    .LineAlignment = StringAlignment.Center _
                }
                g.DrawString(Me.GetTimeDate, Me.Font, New SolidBrush(Me._TextColor), layoutRectangle, format)
            End If
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property BaseColor As Color
            Get
                Return Me._BaseColor
            End Get
            Set(ByVal value As Color)
                Me._BaseColor = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property RectColor As Color
            Get
                Return Me._RectColor
            End Get
            Set(ByVal value As Color)
                Me._RectColor = value
            End Set
        End Property

        Public Property ShowTimeDate As Boolean
            Get
                Return Me._ShowTimeDate
            End Get
            Set(ByVal value As Boolean)
                Me._ShowTimeDate = value
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


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _RectColor As Color
        Private _ShowTimeDate As Boolean
        Private _TextColor As Color
        Private H As Integer
        Private W As Integer
    End Class
End Namespace

