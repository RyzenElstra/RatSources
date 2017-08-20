Imports Microsoft.VisualBasic
Imports Microsoft.VisualBasic.ApplicationServices
Imports Microsoft.VisualBasic.CompilerServices
Imports System
Imports System.CodeDom.Compiler
Imports System.Collections
Imports System.ComponentModel
Imports System.ComponentModel.Design
Imports System.Diagnostics
Imports System.Reflection
Imports System.Runtime.CompilerServices
Imports System.Runtime.InteropServices
Imports Xanity_2._0

Namespace Xanity_2._0.My
    <StandardModule, GeneratedCode("MyTemplate", "8.0.0.0"), HideModuleName> _
    Friend NotInheritable Class MyProject
        ' Properties
        <HelpKeyword("My.Application")> _
        Friend Shared ReadOnly Property Application As MyApplication
            <DebuggerHidden> _
            Get
                Return MyProject.m_AppObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.Computer")> _
        Friend Shared ReadOnly Property Computer As MyComputer
            <DebuggerHidden> _
            Get
                Return MyProject.m_ComputerObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.Forms")> _
        Friend Shared ReadOnly Property Forms As MyForms
            <DebuggerHidden> _
            Get
                Return MyProject.m_MyFormsObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.User")> _
        Friend Shared ReadOnly Property User As User
            <DebuggerHidden> _
            Get
                Return MyProject.m_UserObjectProvider.GetInstance
            End Get
        End Property

        <HelpKeyword("My.WebServices")> _
        Friend Shared ReadOnly Property WebServices As MyWebServices
            <DebuggerHidden> _
            Get
                Return MyProject.m_MyWebServicesObjectProvider.GetInstance
            End Get
        End Property


        ' Fields
        Private Shared ReadOnly m_AppObjectProvider As ThreadSafeObjectProvider(Of MyApplication) = New ThreadSafeObjectProvider(Of MyApplication)
        Private Shared ReadOnly m_ComputerObjectProvider As ThreadSafeObjectProvider(Of MyComputer) = New ThreadSafeObjectProvider(Of MyComputer)
        Private Shared m_MyFormsObjectProvider As ThreadSafeObjectProvider(Of MyForms) = New ThreadSafeObjectProvider(Of MyForms)
        Private Shared ReadOnly m_MyWebServicesObjectProvider As ThreadSafeObjectProvider(Of MyWebServices) = New ThreadSafeObjectProvider(Of MyWebServices)
        Private Shared ReadOnly m_UserObjectProvider As ThreadSafeObjectProvider(Of User) = New ThreadSafeObjectProvider(Of User)

        ' Nested Types
        <MyGroupCollection("System.Windows.Forms.Form", "Create__Instance__", "Dispose__Instance__", "My.MyProject.Forms"), EditorBrowsable(EditorBrowsableState.Never)> _
        Friend NotInheritable Class MyForms
            ' Methods
            <DebuggerHidden> _
            Private Shared Function Create__Instance__(Of T As { Form, New })(ByVal Instance As T) As T
                If ((Instance Is Nothing) OrElse Instance.IsDisposed) Then
                    If (Not MyForms.m_FormBeingCreated Is Nothing) Then
                        If MyForms.m_FormBeingCreated.ContainsKey(GetType(T)) Then
                            Throw New InvalidOperationException(Utils.GetResourceString("WinForms_RecursiveFormCreate", New String(0  - 1) {}))
                        End If
                    Else
                        MyForms.m_FormBeingCreated = New Hashtable
                    End If
                    MyForms.m_FormBeingCreated.Add(GetType(T), Nothing)
                    Try 
                        Return Activator.CreateInstance(Of T)
                    Catch obj1 As Object When (?)
                        Dim exception As TargetInvocationException
                        Throw New InvalidOperationException(Utils.GetResourceString("WinForms_SeeInnerException", New String() { exception.InnerException.Message }), exception.InnerException)
                    Finally
                        MyForms.m_FormBeingCreated.Remove(GetType(T))
                    End Try
                End If
                Return Instance
            End Function

            <DebuggerHidden> _
            Private Sub Dispose__Instance__(Of T As Form)(ByRef instance As T)
                instance.Dispose
                instance = CType(Nothing, T)
            End Sub

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function Equals(ByVal o As Object) As Boolean
                Return MyBase.Equals(RuntimeHelpers.GetObjectValue(o))
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function GetHashCode() As Integer
                Return MyBase.GetHashCode
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Friend Function [GetType]() As Type
                Return GetType(MyForms)
            End Function

            <EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function ToString() As String
                Return MyBase.ToString
            End Function


            ' Properties
            Public Property Audio As Audio
                <DebuggerNonUserCode> _
                Get
                    Me.m_Audio = MyForms.Create__Instance__(Of Audio)(Me.m_Audio)
                    Return Me.m_Audio
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As Audio)
                    If (Not value Is Me.m_Audio) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Audio)(Me.m_Audio)
                    End If
                End Set
            End Property

            Public Property Form1 As Form1
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form1 = MyForms.Create__Instance__(Of Form1)(Me.m_Form1)
                    Return Me.m_Form1
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As Form1)
                    If (Not value Is Me.m_Form1) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form1)(Me.m_Form1)
                    End If
                End Set
            End Property

            Public Property keylogger As keylogger
                <DebuggerNonUserCode> _
                Get
                    Me.m_keylogger = MyForms.Create__Instance__(Of keylogger)(Me.m_keylogger)
                    Return Me.m_keylogger
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As keylogger)
                    If (Not value Is Me.m_keylogger) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of keylogger)(Me.m_keylogger)
                    End If
                End Set
            End Property

            Public Property MapView As MapView
                <DebuggerNonUserCode> _
                Get
                    Me.m_MapView = MyForms.Create__Instance__(Of MapView)(Me.m_MapView)
                    Return Me.m_MapView
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As MapView)
                    If (Not value Is Me.m_MapView) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of MapView)(Me.m_MapView)
                    End If
                End Set
            End Property

            Public Property misc As misc
                <DebuggerNonUserCode> _
                Get
                    Me.m_misc = MyForms.Create__Instance__(Of misc)(Me.m_misc)
                    Return Me.m_misc
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As misc)
                    If (Not value Is Me.m_misc) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of misc)(Me.m_misc)
                    End If
                End Set
            End Property

            Public Property newfile As newfile
                <DebuggerNonUserCode> _
                Get
                    Me.m_newfile = MyForms.Create__Instance__(Of newfile)(Me.m_newfile)
                    Return Me.m_newfile
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As newfile)
                    If (Not value Is Me.m_newfile) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of newfile)(Me.m_newfile)
                    End If
                End Set
            End Property

            Public Property passes As passes
                <DebuggerNonUserCode> _
                Get
                    Me.m_passes = MyForms.Create__Instance__(Of passes)(Me.m_passes)
                    Return Me.m_passes
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As passes)
                    If (Not value Is Me.m_passes) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of passes)(Me.m_passes)
                    End If
                End Set
            End Property

            Public Property remotescreen As remotescreen
                <DebuggerNonUserCode> _
                Get
                    Me.m_remotescreen = MyForms.Create__Instance__(Of remotescreen)(Me.m_remotescreen)
                    Return Me.m_remotescreen
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As remotescreen)
                    If (Not value Is Me.m_remotescreen) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of remotescreen)(Me.m_remotescreen)
                    End If
                End Set
            End Property

            Public Property StressTester As StressTester
                <DebuggerNonUserCode> _
                Get
                    Me.m_StressTester = MyForms.Create__Instance__(Of StressTester)(Me.m_StressTester)
                    Return Me.m_StressTester
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As StressTester)
                    If (Not value Is Me.m_StressTester) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of StressTester)(Me.m_StressTester)
                    End If
                End Set
            End Property

            Public Property SystemInformation As SystemInformation
                <DebuggerNonUserCode> _
                Get
                    Me.m_SystemInformation = MyForms.Create__Instance__(Of SystemInformation)(Me.m_SystemInformation)
                    Return Me.m_SystemInformation
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As SystemInformation)
                    If (Not value Is Me.m_SystemInformation) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of SystemInformation)(Me.m_SystemInformation)
                    End If
                End Set
            End Property

            Public Property Webcam As Webcam
                <DebuggerNonUserCode> _
                Get
                    Me.m_Webcam = MyForms.Create__Instance__(Of Webcam)(Me.m_Webcam)
                    Return Me.m_Webcam
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal value As Webcam)
                    If (Not value Is Me.m_Webcam) Then
                        If (Not value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Webcam)(Me.m_Webcam)
                    End If
                End Set
            End Property


            ' Fields
            Public m_Audio As Audio
            Public m_Form1 As Form1
            <ThreadStatic> _
            Private Shared m_FormBeingCreated As Hashtable
            Public m_keylogger As keylogger
            Public m_MapView As MapView
            Public m_misc As misc
            Public m_newfile As newfile
            Public m_passes As passes
            Public m_remotescreen As remotescreen
            Public m_StressTester As StressTester
            Public m_SystemInformation As SystemInformation
            Public m_Webcam As Webcam
        End Class

        <EditorBrowsable(EditorBrowsableState.Never), MyGroupCollection("System.Web.Services.Protocols.SoapHttpClientProtocol", "Create__Instance__", "Dispose__Instance__", "")> _
        Friend NotInheritable Class MyWebServices
            ' Methods
            <DebuggerHidden> _
            Private Shared Function Create__Instance__(Of T As New)(ByVal instance As T) As T
                If (instance Is Nothing) Then
                    Return Activator.CreateInstance(Of T)
                End If
                Return instance
            End Function

            <DebuggerHidden> _
            Private Sub Dispose__Instance__(Of T)(ByRef instance As T)
                instance = CType(Nothing, T)
            End Sub

            <EditorBrowsable(EditorBrowsableState.Never), DebuggerHidden> _
            Public Overrides Function Equals(ByVal o As Object) As Boolean
                Return MyBase.Equals(RuntimeHelpers.GetObjectValue(o))
            End Function

            <DebuggerHidden, EditorBrowsable(EditorBrowsableState.Never)> _
            Public Overrides Function GetHashCode() As Integer
                Return MyBase.GetHashCode
            End Function

            <DebuggerHidden, EditorBrowsable(EditorBrowsableState.Never)> _
            Friend Function [GetType]() As Type
                Return GetType(MyWebServices)
            End Function

            <EditorBrowsable(EditorBrowsableState.Never), DebuggerHidden> _
            Public Overrides Function ToString() As String
                Return MyBase.ToString
            End Function

        End Class

        <EditorBrowsable(EditorBrowsableState.Never), ComVisible(False)> _
        Friend NotInheritable Class ThreadSafeObjectProvider(Of T As New)
            ' Properties
            Friend ReadOnly Property GetInstance As T
                <DebuggerHidden> _
                Get
                    If (ThreadSafeObjectProvider(Of T).m_ThreadStaticValue Is Nothing) Then
                        ThreadSafeObjectProvider(Of T).m_ThreadStaticValue = Activator.CreateInstance(Of T)
                    End If
                    Return ThreadSafeObjectProvider(Of T).m_ThreadStaticValue
                End Get
            End Property


            ' Fields
            <ThreadStatic, CompilerGenerated> _
            Private Shared m_ThreadStaticValue As T
        End Class
    End Class
End Namespace

