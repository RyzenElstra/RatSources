Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Drawing2D
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatTreeView
        Inherits TreeView
        ' Methods
        Public Sub New()
            FlatTreeView.__ENCAddToList(Me)
            Me._BaseColor = Color.FromArgb(&H2D, &H2F, &H31)
            Me._LineColor = Color.FromArgb(&H19, &H1B, &H1D)
            Me.SetStyle((ControlStyles.OptimizedDoubleBuffer Or (ControlStyles.AllPaintingInWmPaint Or (ControlStyles.ResizeRedraw Or ControlStyles.UserPaint))), True)
            Me.DoubleBuffered = True
            Me.BackColor = Me._BaseColor
            Me.ForeColor = Color.White
            Me.LineColor = Me._LineColor
            Me.DrawMode = TreeViewDrawMode.OwnerDrawAll
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatTreeView.__ENCList
            SyncLock list
                If (FlatTreeView.__ENCList.Count = FlatTreeView.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatTreeView.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatTreeView.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatTreeView.__ENCList.Item(index) = FlatTreeView.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatTreeView.__ENCList.RemoveRange(index, (FlatTreeView.__ENCList.Count - index))
                    FlatTreeView.__ENCList.Capacity = FlatTreeView.__ENCList.Count
                End If
                FlatTreeView.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnDrawNode(ByVal e As DrawTreeNodeEventArgs)
            Try 
                Dim bounds As Rectangle = e.Bounds
                Dim rect As New Rectangle(e.Bounds.Location.X, e.Bounds.Location.Y, e.Bounds.Width, bounds.Height)
                Select Case Me.State
                    Case TreeNodeStates.Default
                        e.Graphics.FillRectangle(Brushes.Red, rect)
                        bounds = New Rectangle((rect.X + 2), (rect.Y + 2), rect.Width, rect.Height)
                        e.Graphics.DrawString(e.Node.Text, New Font("Segoe UI", 8!), Brushes.LimeGreen, bounds, Helpers.NearSF)
                        Me.Invalidate
                        goto Label_01F3
                    Case TreeNodeStates.Checked
                        e.Graphics.FillRectangle(Brushes.Green, rect)
                        bounds = New Rectangle((rect.X + 2), (rect.Y + 2), rect.Width, rect.Height)
                        e.Graphics.DrawString(e.Node.Text, New Font("Segoe UI", 8!), Brushes.Black, bounds, Helpers.NearSF)
                        Me.Invalidate
                        Exit Select
                    Case TreeNodeStates.Selected
                        e.Graphics.FillRectangle(Brushes.Green, rect)
                        bounds = New Rectangle((rect.X + 2), (rect.Y + 2), rect.Width, rect.Height)
                        e.Graphics.DrawString(e.Node.Text, New Font("Segoe UI", 8!), Brushes.Black, bounds, Helpers.NearSF)
                        Me.Invalidate
                        Exit Select
                End Select
            Catch exception1 As Exception
                ProjectData.SetProjectError(exception1)
                Dim exception As Exception = exception1
                Interaction.MsgBox(exception.Message, MsgBoxStyle.ApplicationModal, Nothing)
                ProjectData.ClearProjectError
            End Try
        Label_01F3:
            MyBase.OnDrawNode(e)
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
            g.FillRectangle(New SolidBrush(Me._BaseColor), rect)
            Dim layoutRectangle As New Rectangle((Me.Bounds.X + 2), (Me.Bounds.Y + 2), Me.Bounds.Width, Me.Bounds.Height)
            g.DrawString(Me.Text, New Font("Segoe UI", 8!), Brushes.Black, layoutRectangle, Helpers.NearSF)
            g = Nothing
            MyBase.OnPaint(e)
            Helpers.G.Dispose
            e.Graphics.InterpolationMode = InterpolationMode.HighQualityBicubic
            e.Graphics.DrawImageUnscaled(Helpers.B, 0, 0)
            Helpers.B.Dispose
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private _BaseColor As Color
        Private _LineColor As Color
        Private State As TreeNodeStates
    End Class
End Namespace

