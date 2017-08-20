Imports System
Imports System.Collections.Generic
Imports System.Diagnostics
Imports System.Drawing
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0
    Friend Class FlatLabel
        Inherits Label
        ' Methods
        Public Sub New()
            FlatLabel.__ENCAddToList(Me)
            Me.SetStyle(ControlStyles.SupportsTransparentBackColor, True)
            Me.Font = New Font("Segoe UI", 8!)
            Me.ForeColor = Color.White
            Me.BackColor = Color.Transparent
            Me.Text = Me.Text
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = FlatLabel.__ENCList
            SyncLock list
                If (FlatLabel.__ENCList.Count = FlatLabel.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (FlatLabel.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = FlatLabel.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                FlatLabel.__ENCList.Item(index) = FlatLabel.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    FlatLabel.__ENCList.RemoveRange(index, (FlatLabel.__ENCList.Count - index))
                    FlatLabel.__ENCList.Capacity = FlatLabel.__ENCList.Count
                End If
                FlatLabel.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        Protected Overrides Sub OnTextChanged(ByVal e As EventArgs)
            MyBase.OnTextChanged(e)
            Me.Invalidate
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    End Class
End Namespace

