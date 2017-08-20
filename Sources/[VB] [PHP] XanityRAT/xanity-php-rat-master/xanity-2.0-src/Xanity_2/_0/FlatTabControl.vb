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
    Friend Class FlatTabControl
        Inherits TabControl
        ' Methods
        Public Sub New()
            FlatTabControl.__ENCAddToList(Me)
            Me.BGColor = Color.FromArgb(60, 70, &H49)
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._ActiveColor = Helpers._FlatColor
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Color.FromArgb(60, 70, &H49)
            Me.Font = New Font("Segoe UI", 10!)
            Me.SizeMode = TabSizeMode.Fixed
            Dim size2 As New Size(120, 40)
            Me.ItemSize = size2
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatTabControl.__ENCList
            SyncLock list
                If (FlatTabControl.__ENCList.Count = FlatTabControl.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatTabControl.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatTabControl.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatTabControl.__ENCList.Item(index) = FlatTabControl.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatTabControl.__ENCList.RemoveRange(index, (FlatTabControl.__ENCList.Count - index))
                    FlatTabControl.__ENCList.Capacity = FlatTabControl.__ENCList.Count
                End If
                FlatTabControl.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub CreateHandle()
            MyBase.CreateHandle
            Me.Alignment = TabAlignment.Top
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Helpers.B = New Bitmap(Me.Width, Me.Height)
            Helpers.G = Graphics.FromImage(Helpers.B)
            Me.W = (Me.Width - 1)
            Me.H = (Me.Height - 1)
            Dim g As Graphics = Helpers.G
            g.SmoothingMode = SmoothingMode.HighQuality
            g.PixelOffsetMode = PixelOffsetMode.HighQuality
            g.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
            g.Clear(Me._BaseColor)
            Try 
                Me.SelectedTab.BackColor = Me.BGColor
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
            Dim num2 As Integer = (Me.TabCount - 1)
            Dim index As Integer = 0
        Label_0098:
            If (index > num2) Then
                g = Nothing
                MyBase.OnPaint(e)
                Helpers.G.Dispose
                e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
                e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
                Helpers.B.Dispose
                Return
            End If
            Dim location As Point = Me.GetTabRect(index).Location
            Dim point3 As New Point((location.X + 2), Me.GetTabRect(index).Location.Y)
            Dim size As New Size(Me.GetTabRect(index).Width, Me.GetTabRect(index).Height)
            Dim rectangle As New Rectangle(point3, size)
            size = New Size(rectangle.Width, rectangle.Height)
            Dim rect As New Rectangle(rectangle.Location, size)
            If (index = Me.SelectedIndex) Then
                g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                g.FillRectangle(New SolidBrush(Me._ActiveColor), rect)
                If (Not Me.ImageList Is Nothing) Then
                    Try 
                        If (Not Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex) Is Nothing) Then
                            point3 = rect.Location
                            location = New Point((point3.X + 8), (rect.Location.Y + 6))
                            g.DrawImage(Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex), location)
                            g.DrawString(("      " & Me.TabPages.Item(index).Text), Me.Font, Brushes.White, rect, Helpers.CenterSF)
                        Else
                            g.DrawString(Me.TabPages.Item(index).Text, Me.Font, Brushes.White, rect, Helpers.CenterSF)
                        End If
                        goto Label_044E
                    Catch exception3 As Exception
                        ProjectData.SetProjectError(exception3)
                        Dim exception As Exception = exception3
                        Throw New Exception(exception.Message)
                    End Try
                End If
                g.DrawString(Me.TabPages.Item(index).Text, Me.Font, Brushes.White, rect, Helpers.CenterSF)
            Else
                Dim format As StringFormat
                g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
                If (Not Me.ImageList Is Nothing) Then
                    Try 
                        If (Not Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex) Is Nothing) Then
                            point3 = rect.Location
                            location = New Point((point3.X + 8), (rect.Location.Y + 6))
                            g.DrawImage(Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex), location)
                            format = New StringFormat With { _
                                .LineAlignment = StringAlignment.Center, _
                                .Alignment = StringAlignment.Center _
                            }
                            g.DrawString(("      " & Me.TabPages.Item(index).Text), Me.Font, New SolidBrush(Color.White), rect, format)
                        Else
                            format = New StringFormat With { _
                                .LineAlignment = StringAlignment.Center, _
                                .Alignment = StringAlignment.Center _
                            }
                            g.DrawString(Me.TabPages.Item(index).Text, Me.Font, New SolidBrush(Color.White), rect, format)
                        End If
                        goto Label_044E
                    Catch exception4 As Exception
                        ProjectData.SetProjectError(exception4)
                        Dim exception2 As Exception = exception4
                        Throw New Exception(exception2.Message)
                    End Try
                End If
                format = New StringFormat With { _
                    .LineAlignment = StringAlignment.Center, _
                    .Alignment = StringAlignment.Center _
                }
                g.DrawString(Me.TabPages.Item(index).Text, Me.Font, New SolidBrush(Color.White), rect, format)
            End If
        Label_044E:
            index += 1
            goto Label_0098
        End Sub


        ' Properties
        <Category("Colors")> _
        Public Property ActiveColor As Color
            Get
                Return Me._ActiveColor
            End Get
            Set(ByVal value As Color)
                Me._ActiveColor = value
            End Set
        End Property

        <Category("Colors")> _
        Public Property BaseColor As Color
            Get
                Return Me._BaseColor
            End Get
            Set(ByVal value As Color)
                Me._BaseColor = value
            End Set
        End Property


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _ActiveColor As Color
        Private _BaseColor As Color
        Private BGColor As Color
        Private H As Integer
        Private W As Integer
    End Class
End Namespace

