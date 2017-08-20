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

Namespace My
    <HideModuleName, StandardModule, GeneratedCode("MyTemplate", "8.0.0.0")> _
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
        <EditorBrowsable(EditorBrowsableState.Never), MyGroupCollection("System.Windows.Forms.Form", "Create__Instance__", "Dispose__Instance__", "My.MyProject.Forms")> _
        Friend NotInheritable Class MyForms
            ' Methods
            <DebuggerHidden> _
            Private Shared Function Create__Instance__(Of T As { Form, New })(ByVal Instance As T) As T
                Dim local As T
                If (If(((Instance Is Nothing) OrElse Instance.IsDisposed), 1, 0) = 0) Then
                    Return Instance
                End If
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
                    ProjectData.ClearProjectError
                Finally
                    MyForms.m_FormBeingCreated.Remove(GetType(T))
                End Try
                Return local
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
            Public Property Form1 As Form1
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form1 = MyForms.Create__Instance__(Of Form1)(Me.m_Form1)
                    Return Me.m_Form1
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form1)
                    If (Not Value Is Me.m_Form1) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form1)(Me.m_Form1)
                    End If
                End Set
            End Property

            Public Property Form2 As Form2
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form2 = MyForms.Create__Instance__(Of Form2)(Me.m_Form2)
                    Return Me.m_Form2
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form2)
                    If (Not Value Is Me.m_Form2) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form2)(Me.m_Form2)
                    End If
                End Set
            End Property

            Public Property Form3 As Form3
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form3 = MyForms.Create__Instance__(Of Form3)(Me.m_Form3)
                    Return Me.m_Form3
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form3)
                    If (Not Value Is Me.m_Form3) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form3)(Me.m_Form3)
                    End If
                End Set
            End Property

            Public Property Form4 As Form4
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form4 = MyForms.Create__Instance__(Of Form4)(Me.m_Form4)
                    Return Me.m_Form4
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form4)
                    If (Not Value Is Me.m_Form4) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form4)(Me.m_Form4)
                    End If
                End Set
            End Property

            Public Property Form5 As Form5
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form5 = MyForms.Create__Instance__(Of Form5)(Me.m_Form5)
                    Return Me.m_Form5
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form5)
                    If (Not Value Is Me.m_Form5) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form5)(Me.m_Form5)
                    End If
                End Set
            End Property

            Public Property Form6 As Form6
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form6 = MyForms.Create__Instance__(Of Form6)(Me.m_Form6)
                    Return Me.m_Form6
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form6)
                    If (Not Value Is Me.m_Form6) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form6)(Me.m_Form6)
                    End If
                End Set
            End Property

            Public Property Form7 As Form7
                <DebuggerNonUserCode> _
                Get
                    Me.m_Form7 = MyForms.Create__Instance__(Of Form7)(Me.m_Form7)
                    Return Me.m_Form7
                End Get
                <DebuggerNonUserCode> _
                Set(ByVal Value As Form7)
                    If (Not Value Is Me.m_Form7) Then
                        If (Not Value Is Nothing) Then
                            Throw New ArgumentException("Property can only be set to Nothing")
                        End If
                        Me.Dispose__Instance__(Of Form7)(Me.m_Form7)
                    End If
                End Set
            End Property


            ' Fields
            Public m_Form1 As Form1
            Public m_Form2 As Form2
            Public m_Form3 As Form3
            Public m_Form4 As Form4
            Public m_Form5 As Form5
            Public m_Form6 As Form6
            Public m_Form7 As Form7
            <ThreadStatic> _
            Private Shared m_FormBeingCreated As Hashtable
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

            <DebuggerHidden, EditorBrowsable(EditorBrowsableState.Never)> _
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

            <DebuggerHidden, EditorBrowsable(EditorBrowsableState.Never)> _
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
            <CompilerGenerated, ThreadStatic> _
            Private Shared m_ThreadStaticValue As T
        End Class
    End Class
End Namespace

