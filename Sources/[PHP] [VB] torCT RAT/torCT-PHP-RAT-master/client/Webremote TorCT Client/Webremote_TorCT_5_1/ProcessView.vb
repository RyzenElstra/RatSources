Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Drawing
Imports System.Windows.Forms

Namespace Webremote_TorCT_5_1
    <DesignerGenerated> _
    Public Class ProcessView
        Inherits Form
        ' Methods
        <DebuggerNonUserCode> _
        Public Sub New()
            Dim list As List(Of WeakReference) = ProcessView.__ENCList
            SyncLock list
                ProcessView.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.InitializeComponent
        End Sub

        <DebuggerNonUserCode> _
        Protected Overrides Sub Dispose(ByVal disposing As Boolean)
            Try 
                If (disposing AndAlso (Not Me.components Is Nothing)) Then
                    Me.components.Dispose
                End If
            Finally
                MyBase.Dispose(disposing)
            End Try
        End Sub

        <DebuggerStepThrough> _
        Private Sub InitializeComponent()
            Dim manager As New ComponentResourceManager(GetType(ProcessView))
            Me.SuspendLayout
            Dim ef As New SizeF(6!, 13!)
            Me.AutoScaleDimensions = ef
            Me.AutoScaleMode = AutoScaleMode.Font
            Dim size As New Size(&H1C9, &H1D3)
            Me.ClientSize = size
            Me.Icon = DirectCast(manager.GetObject("$this.Icon"), Icon)
            Me.Name = "ProcessView"
            Me.Text = "ProcessView"
            Me.ResumeLayout(False)
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
        Private components As IContainer
    End Class
End Namespace

