Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Drawing.Text
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatContextMenuStrip
        Inherits ContextMenuStrip
        ' Methods
        Public Sub New()
            FlatContextMenuStrip.__ENCAddToList(Me)
            Me.Renderer = New ToolStripProfessionalRenderer(New TColorTable)
            Me.ShowImageMargin = False
            Me.ForeColor = Color.White
            Me.Font = New Font("Segoe UI", 8!)
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatContextMenuStrip.__ENCList
            SyncLock list
                If (FlatContextMenuStrip.__ENCList.Count = FlatContextMenuStrip.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatContextMenuStrip.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatContextMenuStrip.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatContextMenuStrip.__ENCList.Item(index) = FlatContextMenuStrip.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatContextMenuStrip.__ENCList.RemoveRange(index, (FlatContextMenuStrip.__ENCList.Count - index))
                    FlatContextMenuStrip.__ENCList.Capacity = FlatContextMenuStrip.__ENCList.Count
                End If
                FlatContextMenuStrip.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnPaint(ByVal e As PaintEventArgs)
            MyBase.OnPaint(e)
            e.Graphics.TextRenderingHint = TextRenderingHint.ClearTypeGridFit
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)

        ' Nested Types
        Public Class TColorTable
            Inherits ProfessionalColorTable
            ' Properties
            <Category("Colors")> _
            Public Property _BackColor As Color
                Get
                    Return Me.BackColor
                End Get
                Set(ByVal value As Color)
                    Me.BackColor = value
                End Set
            End Property

            <Category("Colors")> _
            Public Property _BorderColor As Color
                Get
                    Return Me.BorderColor
                End Get
                Set(ByVal value As Color)
                    Me.BorderColor = value
                End Set
            End Property

            <Category("Colors")> _
            Public Property _CheckedColor As Color
                Get
                    Return Me.CheckedColor
                End Get
                Set(ByVal value As Color)
                    Me.CheckedColor = value
                End Set
            End Property

            Public Overrides ReadOnly Property ButtonSelectedBorder As Color
                Get
                    Return Me.BackColor
                End Get
            End Property

            Public Overrides ReadOnly Property CheckBackground As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property CheckPressedBackground As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property CheckSelectedBackground As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property ImageMarginGradientBegin As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property ImageMarginGradientEnd As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property ImageMarginGradientMiddle As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property MenuBorder As Color
                Get
                    Return Me.BorderColor
                End Get
            End Property

            Public Overrides ReadOnly Property MenuItemBorder As Color
                Get
                    Return Me.BorderColor
                End Get
            End Property

            Public Overrides ReadOnly Property MenuItemSelected As Color
                Get
                    Return Me.CheckedColor
                End Get
            End Property

            Public Overrides ReadOnly Property SeparatorDark As Color
                Get
                    Return Me.BorderColor
                End Get
            End Property

            Public Overrides ReadOnly Property ToolStripDropDownBackground As Color
                Get
                    Return Me.BackColor
                End Get
            End Property


            ' Fields
            Private BackColor As Color = Color.FromArgb(&H2D, &H2F, &H31)
            Private BorderColor As Color = Color.FromArgb(&H35, &H3A, 60)
            Private CheckedColor As Color = Helpers._FlatColor
        End Class
    End Class
End Namespace

