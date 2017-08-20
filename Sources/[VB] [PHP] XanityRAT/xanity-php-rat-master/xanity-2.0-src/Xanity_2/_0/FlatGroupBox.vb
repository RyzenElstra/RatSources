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
    Friend Class FlatGroupBox
        Inherits ContainerControl
        ' Methods
        Public Sub New()
            FlatGroupBox.__ENCAddToList(Me)
            Me._ShowText = True
            Me._BaseColor = Color.FromArgb(60, 70, &H49)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.SupportsTransparentBackColor Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint)))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.Transparent
            Dim size2 As New Size(240, 180)
            Me.Size = size2
            Me.Font = New Font("Segoe ui", 10!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatGroupBox.__ENCList
            SyncLock list
                If (FlatGroupBox.__ENCList.Count = FlatGroupBox.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatGroupBox.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatGroupBox.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatGroupBox.__ENCList.Item(index) = FlatGroupBox.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatGroupBox.__ENCList.RemoveRange(index, (FlatGroupBox.__ENCList.Count - index))
                    FlatGroupBox.__ENCList.Capacity = FlatGroupBox.__ENCList.Count
                End If
                FlatGroupBox.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim path As New GraphicsPath
            Dim path2 As New GraphicsPath
            Dim path3 As New GraphicsPath
            Dim rectangle As New Rectangle(8, 8, (Me.W - &H10), (Me.H - &H10))
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me.BackColor)
            path = Helpers.RoundRec(rectangle, 8)
            g.FillPath(New SolidBrush(Me._BaseColor), path)
            path2 = Helpers.DrawArrow(&H1C, 2, False)
            g.FillPath(New SolidBrush(Me._BaseColor), path2)
            path3 = Helpers.DrawArrow(&H1C, 8, True)
            g.FillPath(New SolidBrush(Color.FromArgb(60, 70, &H49)), path3)
            If Me.ShowText Then
                Dim layoutRectangle As New Rectangle(&H10, &H10, Me.W, Me.H)
                g.DrawString(Me.Text, Me.Font, New SolidBrush(Helpers._FlatColor), layoutRectangle, Helpers.NearSF)
            End If
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
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

        Public Property ShowText As Boolean
            Get
                Return Me._ShowText
            End Get
            Set(ByVal value As Boolean)
                Me._ShowText = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _ShowText As Boolean
        Private H As Integer
        Private W As Integer
    End Class
End Namespace

