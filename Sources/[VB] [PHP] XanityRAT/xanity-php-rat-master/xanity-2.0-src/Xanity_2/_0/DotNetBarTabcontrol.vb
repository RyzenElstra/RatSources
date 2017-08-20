Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class DotNetBarTabcontrol
        Inherits TabControl
        ' Methods
        Public Sub New()
            DotNetBarTabcontrol.__ENCAddToList(Me)
            Me.SetStyle((ControlStyles.DoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.SizeMode = TabSizeMode.Fixed
            Dim size2 As New Size(&H2C, &H88)
            Me.ItemSize = size2
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = DotNetBarTabcontrol.__ENCList
            SyncLock list
                If (DotNetBarTabcontrol.__ENCList.Count = DotNetBarTabcontrol.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (DotNetBarTabcontrol.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = DotNetBarTabcontrol.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                DotNetBarTabcontrol.__ENCList.Item(index) = DotNetBarTabcontrol.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    DotNetBarTabcontrol.__ENCList.RemoveRange(index, (DotNetBarTabcontrol.__ENCList.Count - index))
                    DotNetBarTabcontrol.__ENCList.Capacity = DotNetBarTabcontrol.__ENCList.Count
                End If
                DotNetBarTabcontrol.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub CreateHandle()
            MyBase.CreateHandle
            Me.Alignment = TabAlignment.Left
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            Dim rectangle As Rectangle
            Dim point3 As Point
            Dim point4 As Point
            Dim size3 As Size
            Dim location As Point
            Dim format As StringFormat
            Dim image As New Bitmap(Me.Width, Me.Height)
            Dim graphics As Graphics = Graphics.FromImage(image)
            Try 
                Me.SelectedTab.BackColor = Color.FromArgb(&H2E, &H2E, &H2E)
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                ProjectData.ClearProjectError
            End Try
            graphics.Clear(Color.White)
            Dim rect As New Rectangle(0, 0, (Me.ItemSize.Height + 4), Me.Height)
            graphics.FillRectangle(New SolidBrush(Color.FromArgb(&H2E, &H2E, &H2E)), rect)
            Dim point As New Point((Me.ItemSize.Height + 3), 0)
            Dim itemSize As Size = Me.ItemSize
            Dim point2 As New Point((itemSize.Height + 3), &H3E7)
            graphics.DrawLine(New Pen(Color.White), point, point2)
            Dim num2 As Integer = (Me.TabCount - 1)
            Dim index As Integer = 0
        Label_00D6:
            If (index > num2) Then
                NewLateBinding.LateCall(e.Graphics, Nothing, "DrawImage", New Object() { RuntimeHelpers.GetObjectValue(image.Clone), 0, 0 }, Nothing, Nothing, Nothing, True)
                graphics.Dispose
                image.Dispose
                Return
            End If
            If (index = Me.SelectedIndex) Then
                point2 = Me.GetTabRect(index).Location
                point3 = New Point((point2.X - 2), (Me.GetTabRect(index).Location.Y - 2))
                itemSize = New Size((Me.GetTabRect(index).Width + 3), (Me.GetTabRect(index).Height - 1))
                rectangle = New Rectangle(point3, itemSize)
                Dim blend As New ColorBlend
                blend.Colors = New Color() { Color.FromArgb(&H6F, &H1F, &H95), Color.FromArgb(&H6F, &H1F, &H95), Color.FromArgb(&H6F, &H1F, &H95) }
                blend.Positions = New Single() { 0!, 0.5!, 1! }
                Dim brush As New LinearGradientBrush(rectangle, Color.FromArgb(&HFF, 0, 0), Color.FromArgb(&HFF, 0, 0), 90!) With { _
                    .InterpolationColors = blend _
                }
                graphics.FillRectangle(brush, rectangle)
                graphics.DrawRectangle(New Pen(Color.White), rectangle)
                graphics.SmoothingMode = SmoothingMode.HighQuality
                Dim pointArray2 As Point() = New Point(3  - 1) {}
                itemSize = Me.ItemSize
                point2 = New Point((itemSize.Height - 3), (Me.GetTabRect(index).Location.Y + 20))
                pointArray2(0) = point2
                point = Me.GetTabRect(index).Location
                point4 = New Point((Me.ItemSize.Height + 4), (point.Y + 14))
                pointArray2(1) = point4
                size3 = Me.ItemSize
                location = New Point((size3.Height + 4), (Me.GetTabRect(index).Location.Y + &H1B))
                pointArray2(2) = location
                Dim points As Point() = pointArray2
                graphics.FillPolygon(Brushes.White, points)
                graphics.DrawPolygon(New Pen(Color.FromArgb(&H2E, &H2E, &H2E)), points)
                If (Not Me.ImageList Is Nothing) Then
                    Try 
                        If (Not Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex) Is Nothing) Then
                            point4 = New Point((rectangle.Location.X + 8), (rectangle.Location.Y + 6))
                            graphics.DrawImage(Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex), point4)
                            format = New StringFormat With { _
                                .LineAlignment = StringAlignment.Center, _
                                .Alignment = StringAlignment.Center _
                            }
                            graphics.DrawString(("      " & Me.TabPages.Item(index).Text), Me.Font, Brushes.White, rectangle, format)
                        Else
                            format = New StringFormat With { _
                                .LineAlignment = StringAlignment.Center, _
                                .Alignment = StringAlignment.Center _
                            }
                            graphics.DrawString(Me.TabPages.Item(index).Text, New Font(Me.Font.FontFamily, Me.Font.Size, FontStyle.Bold), Brushes.White, rectangle, format)
                        End If
                        goto Label_07D5
                    Catch exception3 As Exception
                        ProjectData.SetProjectError(exception3)
                        format = New StringFormat With { _
                            .LineAlignment = StringAlignment.Center, _
                            .Alignment = StringAlignment.Center _
                        }
                        graphics.DrawString(Me.TabPages.Item(index).Text, New Font(Me.Font.FontFamily, Me.Font.Size, FontStyle.Bold), Brushes.White, rectangle, format)
                        ProjectData.ClearProjectError
                        goto Label_07D5
                    End Try
                End If
                format = New StringFormat With { _
                    .LineAlignment = StringAlignment.Center, _
                    .Alignment = StringAlignment.Center _
                }
                graphics.DrawString(Me.TabPages.Item(index).Text, New Font(Me.Font.FontFamily, Me.Font.Size, FontStyle.Bold), Brushes.White, rectangle, format)
                goto Label_07D5
            End If
            location = Me.GetTabRect(index).Location
            Dim point5 As Point = Me.GetTabRect(index).Location
            point4 = New Point((location.X - 2), (point5.Y - 2))
            size3 = New Size((Me.GetTabRect(index).Width + 3), (Me.GetTabRect(index).Height + 1))
            Dim rectangle2 As New Rectangle(point4, size3)
            graphics.FillRectangle(New SolidBrush(Color.FromArgb(&HB6, 50, &HF5)), rectangle2)
            location = New Point(rectangle2.Right, rectangle2.Top)
            point5 = New Point(rectangle2.Right, rectangle2.Bottom)
            graphics.DrawLine(New Pen(Color.White), location, point5)
            If (Not Me.ImageList Is Nothing) Then
                Try 
                    If (Not Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex) Is Nothing) Then
                        location = rectangle2.Location
                        point4 = New Point((location.X + 8), (rectangle2.Location.Y + 6))
                        graphics.DrawImage(Me.ImageList.Images.Item(Me.TabPages.Item(index).ImageIndex), point4)
                        format = New StringFormat With { _
                            .LineAlignment = StringAlignment.Center, _
                            .Alignment = StringAlignment.Center _
                        }
                        graphics.DrawString(("      " & Me.TabPages.Item(index).Text), Me.Font, Brushes.White, rectangle2, format)
                    Else
                        format = New StringFormat With { _
                            .LineAlignment = StringAlignment.Center, _
                            .Alignment = StringAlignment.Center _
                        }
                        graphics.DrawString(Me.TabPages.Item(index).Text, Me.Font, Brushes.White, rectangle2, format)
                    End If
                    goto Label_07CC
                Catch exception4 As Exception
                    ProjectData.SetProjectError(exception4)
                    format = New StringFormat With { _
                        .LineAlignment = StringAlignment.Center, _
                        .Alignment = StringAlignment.Center _
                    }
                    graphics.DrawString(Me.TabPages.Item(index).Text, Me.Font, Brushes.White, rectangle2, format)
                    ProjectData.ClearProjectError
                    goto Label_07CC
                End Try
            End If
            format = New StringFormat With { _
                .LineAlignment = StringAlignment.Center, _
                .Alignment = StringAlignment.Center _
            }
            graphics.DrawString(Me.TabPages.Item(index).Text, Me.Font, Brushes.White, rectangle2, format)
        Label_07CC:
            index += 1
            goto Label_00D6
        Label_07D5:
            point5 = rectangle.Location
            point4 = New Point((rectangle.Location.X - 1), (point5.Y - 1))
            point3 = rectangle.Location
            point = New Point(point3.X, rectangle.Location.Y)
            graphics.DrawLine(New Pen(Color.FromArgb(&H2E, &H2E, &H2E)), point4, point)
            location = rectangle.Location
            point5 = New Point((location.X - 1), (rectangle.Bottom - 1))
            point4 = rectangle.Location
            point3 = New Point(point4.X, rectangle.Bottom)
            graphics.DrawLine(New Pen(Color.FromArgb(&H2E, &H2E, &H2E)), point5, point3)
            goto Label_07CC
        End Sub

        Public Function ToBrush(ByVal color As Color) As Brush
            Return New SolidBrush(color)
        End Function

        Public Function ToPen(ByVal color As Color) As Pen
            Return New Pen(color)
        End Function


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    End Class
End Namespace

