Imports Microsoft.VisualBasic.ApplicationServices
Imports System
Imports System.CodeDom.Compiler
Imports System.Collections.Generic
Imports System.ComponentModel
Imports System.Diagnostics
Imports System.Windows.Forms

Namespace My
    <GeneratedCode("MyTemplate", "8.0.0.0"), EditorBrowsable(EditorBrowsableState.Never)> _
    Friend Class MyApplication
        Inherits WindowsFormsApplicationBase
        ' Methods
        <DebuggerStepThrough> _
        Public Sub New()
            MyBase.New(AuthenticationMode.Windows)
            Dim list As List(Of WeakReference) = MyApplication.__ENCList
            SyncLock list
                MyApplication.__ENCList.Add(New WeakReference(Me))
            End SyncLock
            Me.IsSingleInstance = False
            Me.EnableVisualStyles = True
            Me.SaveMySettingsOnExit = True
            Me.ShutdownStyle = ShutdownMode.AfterMainFormCloses
        End Sub

        <STAThread, EditorBrowsable(EditorBrowsableState.Advanced), DebuggerHidden> _
        Friend Shared Sub Main(ByVal Args As String())
            Try 
                Application.SetCompatibleTextRenderingDefault(WindowsFormsApplicationBase.UseCompatibleTextRendering)
            End Try
            MyProject.Application.Run(Args)
        End Sub

        <DebuggerStepThrough> _
        Protected Overrides Sub OnCreateMainForm()
            Me.MainForm = MyProject.Forms.Form1
        End Sub


        ' Fields
        Private Shared __ENCList As List(Of WeakReference) = New List(Of WeakReference)
    End Class
End Namespace

