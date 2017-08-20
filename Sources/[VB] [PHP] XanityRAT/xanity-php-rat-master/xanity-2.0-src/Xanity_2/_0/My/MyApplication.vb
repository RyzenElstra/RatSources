Imports Microsoft.VisualBasic.ApplicationServices
Imports System
Imports System.CodeDom.Compiler
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Runtime.CompilerServices
Imports System.Windows.Forms

Namespace Xanity_2._0.My
    <GeneratedCode("MyTemplate", "8.0.0.0"), EditorBrowsable(EditorBrowsableState.Never)> _
    Friend Class MyApplication
        Inherits WindowsFormsApplicationBase
        ' Methods
        <DebuggerStepThrough> _
        Public Sub New()
            MyBase.New(AuthenticationMode.Windows)
            MyApplication.__ENCAddToList(Me)
            Me.IsSingleInstance = False
            Me.EnableVisualStyles = True
            Me.SaveMySettingsOnExit = True
            Me.ShutdownStyle = ShutdownMode.AfterAllFormsClose
        End Sub

        <DebuggerNonUserCode> _
        Private Shared Sub __ENCAddToList(ByVal value As Object)
            Dim list As List(Of WeakReference) = MyApplication.__ENCList
            SyncLock list
                If (MyApplication.__ENCList.Count = MyApplication.__ENCList.Capacity) Then
                    Dim index As Integer = 0
                    Dim num3 As Integer = (MyApplication.__ENCList.Count - 1)
                    Dim i As Integer = 0
                    Do While (i <= num3)
                        Dim reference As WeakReference = MyApplication.__ENCList.Item(i)
                        If reference.IsAlive Then
                            If (i <> index) Then
                                MyApplication.__ENCList.Item(index) = MyApplication.__ENCList.Item(i)
                            End If
                            index += 1
                        End If
                        i += 1
                    Loop
                    MyApplication.__ENCList.RemoveRange(index, (MyApplication.__ENCList.Count - index))
                    MyApplication.__ENCList.Capacity = MyApplication.__ENCList.Count
                End If
                MyApplication.__ENCList.Add(New WeakReference(RuntimeHelpers.GetObjectValue(value)))
            End SyncLock
        End Sub

        <MethodImpl(MethodImplOptions.NoOptimization), DebuggerHidden, STAThread, EditorBrowsable(EditorBrowsableState.Advanced)> _
        Friend Shared Sub Main(ByVal args As String())
            Try 
                Application.SetCompatibleTextRenderingDefault(WindowsFormsApplicationBase.UseCompatibleTextRendering)
            End Try
            MyProject.Application.Run(args)
        End Sub

        <DebuggerStepThrough> _
        Protected Overrides Sub OnCreateMainForm()
            Me.MainForm = MyProject.Forms.Form1
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    End Class
End Namespace

